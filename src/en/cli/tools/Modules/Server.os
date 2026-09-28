// CLI: server
// Tool: true

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

#Use "./internal"

#Region Public

#Region ServerMethods

// stdio
// Starts a server for exchange via standard input/output streams
// 
// Parameters:
// MessageSeparator - String - tring appended to the end of the server response - sprt
// SeparateStart - Boolean - Additionally inserts a separator at the beginning of the message - bsprt
// StreamsEncoding - String - Use a specific encoding regardless of the shell - enc
//
// Returns:
// String - empty string
Function stdio(Val MessageSeparator = "", Val SeparateStart = False, Val StreamsEncoding = "") Export
	
	STDIO.StartServer(MessageSeparator, SeparateStart, StreamsEncoding);
	Return "";
	
EndFunction

// http
// Starts a server for exchange via HTTP
// 
// Parameters:
// Port - Number - Server port - port
// Post - Boolean - Allow processing of POST requests - post
// Get - Boolean - Allow processing of GET requests - get
// Janx - Boolean - Return the response in Janx format. Otherwise JSON - janx
// Authorization - String - Authorization header value expected from the client - auth
//
// Returns:
// String - empty string
Function http(Val Port, Val Post = True, Val Get = False, Val Janx = False, Val Authorization = "") Export
	
	HTTP.StartServer(Port, Post, Get, Janx, Authorization);
	Return "";
	
EndFunction

#EndRegion

#EndRegion
