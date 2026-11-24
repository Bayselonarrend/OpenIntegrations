# Конфигурация CI

Справочник `ci/config.json` и `ci/config_global.json`. Правила, которые действуют в каждом сеансе, остаются в `AGENTS.md`.

Оба файла читает `ProjectData.ПолучитьЗначениеНастройки` (`ci/os/internal/Classes/internal/Classes/internal/Classes/ProjectData.os`). Сначала `./ci/config.json`, затем `./ci/config_global.json`. Имя настройки — путь через точку, например `local.onecConfig` или `paths.jenkinsSrc`. На каждом шаге берётся поле `value`. Первый файл, в котором путь находится целиком, и есть ответ. Если один и тот же путь есть в обоих, побеждает `config.json`.

Узел везде один и тот же: `description` и `value`. В `value` строка, массив или снова такие же узлы. В dotted-имени нет ни `description`, ни `value`.

Секретов в этих файлах нет. Файл учётных данных — `paths.secretDataSrc` (`./data.sqlite`), рядом лежит `data.sqlite.gpg`. В JSON только имена полей (`ai.tokenField`, `sonar.tokenField` и остальные `*tokenField`).

`config_global.json` описывает этот стенд: абсолютные пути, версии библиотеки, адреса сервисов. Поведение библиотеки под эти пути не подстраивать.

## `ci/config.json`

Настройки репозитория.

| Раздел | Что внутри |
| --- | --- |
| `primary` | `version`, `repoUrl` |
| `paths` | каталоги репозитория: исходники, словари, Jenkinsfile (`paths.jenkinsSrc`), шаблоны, `secretDataSrc` |
| `docs` | каталоги Docusaurus |
| `tests` | каталог YAxUnit, пути заданий Jenkins, каталог тестовых баз |
| `localization.langsVars` | имена EDT-проекта, баз и прочие данные языка |
| `packaging` | `postinst` / `postrm` |
| `ai`, `sonar`, `sourceforge` | имена полей секретов и имя проекта SourceForge |
| `github`, `sourcecraft` | имена полей токенов и базовые URL контента |
| `oscript`, `sbsl`, `release` | зависимости OPM и параметры выпуска |

## `ci/config_global.json`

Настройки этой машины.

| Раздел | Что внутри |
| --- | --- |
| `primary` | `ointCurrentVersion`, `ointPreviousVersion`. Их пишет `Versioning.os` |
| `local` | платформа 1С (`onecConfig`, `onecClient`, `1cVersion`), OneScript, vrunner, ibsrv, gh, Inno Setup, `jenkinsHost`, каталоги движков и артефактов |
| `localization` | `mainLang`, список `langs`, короткие `langsVars` |
| `packaging` | maintainer и WSL-дистрибутивы deb/rpm/appimage |
| `ai` | `useAi`, `openAiUrl`, `textModel`, блок `mcp` |
| `sonar` | URL сервера и ключ проекта |
| `sourceforge` | логин, хост, пути к ключам |
| `replacements` | замены при конвертации 1С → OneScript |

## MCP документации

Справочник методов для сайта собирает `DocsGenerator.os` в `docs/<язык>/mcp/methods.json`. `DocsDeployScript.os` копирует его в статику сборки (`/mcp/methods.json`) и выкладывает исходники сервера из `docs.mcpServerSrc` в `docs.remoteMcpSrc` (`www/mcp-server`).

На хостинге процесс запускается из этого каталога: `npm install` один раз, затем `node server.mjs`. Индекс — файл опубликованного сайта, путь в `MCP_INDEX`. Адрес — `MCP_HOST` (по умолчанию `127.0.0.1`), порт — `PORT` (по умолчанию `8787`). Веб-сервер сайта направляет `https://openintegrations.dev/mcp` на этот порт. Инструменты: `list_libraries`, `search_methods`, `get_method`. После новой выкладки сервер перечитывает индекс по времени файла.

Задания тестовой документации (`DocsDeployScript.os test ru|en`) после успешной сборки сами перезапускают отдельный процесс. Индекс — `mcp/methods.json` собранного сайта в workspace задания. Порт языка — `docs.testMcpPort` (`8787` ru, `8788` en). Адрес и разрешённые `Host` — `local.docsMcpTestBind` и `local.docsMcpTestAllowedHosts`. Процесс стартует через `Win32_Process.Create`, поэтому он остаётся после окончания задания. Следующая тестовая сборка того же языка останавливает слушателя порта и поднимает процесс заново. Если индекса в сборке нет, выкладка документации продолжается без сервера.

## MCP справки платформы

`ai.mcp` в `config_global.json`:

- `serversFile` — путь к JSON с `mcpServers`. Сейчас `./.agents/mcp/mcp.json`.
- `downloads` — URL файлов, которые надо положить в workspace перед агентом.

Куда класть файл, написано в аргументах `mcpServers`: скрипт ищет аргумент с тем же именем файла, что у URL. Каталог загрузки — `.agents/mcp/cache/`, он в `.gitignore`. Туда же не коммитится копия `.cursor/mcp.json`.

`AlpacaWork` после checkout вызывает `ci/alpaca/prepare-mcp.ps1`. Скрипт читает рабочее дерево. Если блока `ai.mcp` в нём нет, берёт `ci/config_global.json` и файл серверов с `origin/main`. Уже скачанный непустой файл повторно не качается. Платформа в `mcp.json` — каталог той же установки, что `local.onecConfig`.
