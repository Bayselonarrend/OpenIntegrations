import { createServer } from "node:http";
import { readFileSync, statSync } from "node:fs";
import { McpServer } from "@modelcontextprotocol/server";
import { hostHeaderValidation, NodeStreamableHTTPServerTransport } from "@modelcontextprotocol/node";
import * as z from "zod/v4";

const indexPath = process.env.MCP_INDEX || "methods.json";
const port = Number(process.env.PORT || 8787);
const host = process.env.MCP_HOST || "127.0.0.1";
const allowedHosts = (process.env.MCP_ALLOWED_HOSTS
    || "127.0.0.1,localhost,openintegrations.dev,en.openintegrations.dev")
    .split(",")
    .map((item) => item.trim())
    .filter(Boolean);

const validateHost = hostHeaderValidation(allowedHosts);
let cached = { mtimeMs: 0, data: null };

function loadIndex() {
    const stat = statSync(indexPath);
    if (cached.data && cached.mtimeMs === stat.mtimeMs) {
        return cached.data;
    }
    cached = {
        mtimeMs: stat.mtimeMs,
        data: JSON.parse(readFileSync(indexPath, "utf8"))
    };
    return cached.data;
}

function textResult(value) {
    return { content: [{ type: "text", text: typeof value === "string" ? value : JSON.stringify(value, null, 2) }] };
}

function normalize(value) {
    return String(value || "").toLocaleLowerCase();
}

function findMethod(index, library, method) {
    const lib = normalize(library);
    const name = normalize(method);
    return (index.methods || []).find((item) => normalize(item.library) === lib && normalize(item.method) === name);
}

function searchMethods(index, query, limit) {
    const needle = normalize(query);
    const scored = [];
    for (const item of index.methods || []) {
        const method = normalize(item.method);
        const title = normalize(item.title);
        const description = normalize(item.description);
        const library = normalize(item.library);
        let score = 0;
        if (method === needle) {
            score = 100;
        } else if (method.includes(needle)) {
            score = 80;
        } else if (title.includes(needle)) {
            score = 60;
        } else if (library.includes(needle)) {
            score = 40;
        } else if (description.includes(needle)) {
            score = 20;
        }
        if (score > 0) {
            scored.push({ score, item });
        }
    }
    scored.sort((left, right) => right.score - left.score || left.item.library.localeCompare(right.item.library));
    return scored.slice(0, limit).map((entry) => ({
        library: entry.item.library,
        method: entry.item.method,
        title: entry.item.title,
        description: entry.item.description,
        path: entry.item.path,
        url: entry.item.url
    }));
}

function createDocsServer() {
    const server = new McpServer({ name: "openintegrations-docs", version: "1.0.0" });

    server.registerTool(
        "list_libraries",
        {
            description: "List OpenIntegrations libraries published in the documentation index",
            inputSchema: z.object({})
        },
        async () => {
            const index = loadIndex();
            const counts = new Map();
            for (const item of index.methods || []) {
                counts.set(item.library, (counts.get(item.library) || 0) + 1);
            }
            const libraries = (index.libraries || []).map((name) => ({ name, methods: counts.get(name) || 0 }));
            return textResult({ language: index.language, url: index.url, libraries });
        }
    );

    server.registerTool(
        "search_methods",
        {
            description: "Search documentation methods by name, title, library or description",
            inputSchema: z.object({
                query: z.string().describe("Text to find in the method name, title, library or description"),
                limit: z.number().int().min(1).max(20).optional().describe("Maximum number of matches, default 8")
            })
        },
        async ({ query, limit }) => textResult(searchMethods(loadIndex(), query, limit || 8))
    );

    server.registerTool(
        "get_method",
        {
            description: "Return one documented method: parameters, example, result sample and page URL",
            inputSchema: z.object({
                library: z.string().describe("Library name, for example Telegram"),
                method: z.string().describe("Method name as published in the documentation")
            })
        },
        async ({ library, method }) => {
            const found = findMethod(loadIndex(), library, method);
            if (!found) {
                return textResult(`Method not found: ${library}.${method}`);
            }
            return textResult(found);
        }
    );

    return server;
}

const httpServer = createServer(async (req, res) => {
    const path = (req.url || "/").split("?")[0];
    if (path === "/health") {
        try {
            const index = loadIndex();
            const body = JSON.stringify({
                ok: true,
                language: index.language,
                methods: (index.methods || []).length
            });
            res.writeHead(200, { "content-type": "application/json" });
            res.end(body);
        } catch (error) {
            res.writeHead(500, { "content-type": "text/plain" });
            res.end(String(error));
        }
        return;
    }
    if (path !== "/mcp") {
        res.writeHead(404, { "content-type": "text/plain" });
        res.end("Not found");
        return;
    }
    if (!validateHost(req, res)) {
        return;
    }
    if (req.method !== "POST" && req.method !== "GET" && req.method !== "DELETE") {
        res.writeHead(405, { "content-type": "application/json" });
        res.end(JSON.stringify({ jsonrpc: "2.0", error: { code: -32000, message: "Method not allowed" }, id: null }));
        return;
    }
    try {
        const server = createDocsServer();
        const transport = new NodeStreamableHTTPServerTransport({ sessionIdGenerator: undefined });
        await server.connect(transport);
        await transport.handleRequest(req, res);
        res.on("close", () => {
            transport.close();
            server.close();
        });
    } catch (error) {
        if (!res.headersSent) {
            res.writeHead(500, { "content-type": "text/plain" });
        }
        res.end(String(error));
    }
});

httpServer.listen(port, host, () => {
    process.stdout.write(`Docs MCP listening on ${host}:${port}/mcp, index ${indexPath}\n`);
});
