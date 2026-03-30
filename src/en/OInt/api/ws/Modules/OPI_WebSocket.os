// OneScript: ./OInt/api/ws/Modules/OPI_WebSocket.os
// Lib: WebSocket
// CLI: ws
// Keywords: websocket, ws

// DocsCategory: Exchange
// DocsNameRU: WebSocket
// DocsNameEN: WebSocket

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

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:DuplicateStringLiteral-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Use "../../../tools/main"
#Use "../../../tools/http"

#Region Public

#Region ClientMethods

// Is client object !NOCLI
// Checks that the value is an object of the WebSocket client external component
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsClientObject(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_WSClient.Main";

EndFunction

#EndRegion

#Region ServerMethods

// Start server !NOCLI
// Starts listening for messages on the specified port
//
// Parameters:
// Port     - Number                   - Server port                                            - port
// PoolSize - Number                   - Maximum number of simultaneously supported connections - psize
// Logging  - Structure Of KeyAndValue - Logging settings. See GetLoggingSettings               - log
//
// Returns:
// Arbitrary - Server object or match with error information
Function StartServer(Val Port, Val PoolSize = 100, Val Logging = Undefined) Export

    Return OPI_GenericServer.StartServer(OPI_WebSocket, Port, PoolSize, Logging);

EndFunction

// Stop server !NOCLI
// Shuts down the server
//
// Parameters:
// ServerObject - Arbitrary - Object of running server component - srv
//
// Returns:
// Map Of KeyAndValue - Execution result
Function StopServer(Val ServerObject) Export

    Return OPI_GenericServer.StopServer(OPI_WebSocket, ServerObject);

EndFunction

// Get next connection data !NOCLI
// Gets data from the buffer of the next active connection in the queue where there are incoming data
//
// Parameters:
// ServerObject - Arbitrary - Object of running server component                        - srv
// Timeout      - Number    - Waiting period for new data if the queue is empty (in ms) - tout
// MaxSize      - Number    - Maximum size of data to receive                           - msize
//
// Returns:
// Map Of KeyAndValue - Execution result
Function GetNextConnectionData(Val ServerObject, Val Timeout = 1000, Val MaxSize = 8192) Export

    Return OPI_GenericServer.GetNextConnectionData(OPI_WebSocket
        , ServerObject
        , Timeout
        , MaxSize);

EndFunction

// Get connection data !NOCLI
// Gets data from the buffer of a specific connection by ID
//
// Parameters:
// ServerObject - Arbitrary - Object of running server component                        - srv
// ConnectionID - String    - Connection identifier                                     - id
// Timeout      - Number    - Waiting period for new data if the queue is empty (in ms) - tout
// MaxSize      - Number    - Maximum size of data to receive                           - msize
//
// Returns:
// Map Of KeyAndValue - Execution result
Function GetConnectionData(Val ServerObject
    , Val ConnectionID
    , Val Timeout = 1000
    , Val MaxSize = 8192) Export

    Return OPI_GenericServer.GetConnectionData(OPI_WebSocket
        , ServerObject
        , ConnectionID
        , Timeout
        , MaxSize);

EndFunction

// Send data !NOCLI
// Sends data to the specified connection
//
// Parameters:
// ServerObject - Arbitrary          - Object of running server component - srv
// ConnectionID - String             - Connection identifier              - id
// Data         - String, BinaryData - Sending data                       - data
//
// Returns:
// Map Of KeyAndValue - Execution result
Function SendData(Val ServerObject, Val ConnectionID, Val Data) Export

    Return OPI_GenericServer.SendData(OPI_WebSocket, ServerObject, ConnectionID, Data);

EndFunction

// Close incoming connection !NOCLI
// Closes incoming server connection by ID
//
// Parameters:
// ServerObject - Arbitrary - Object of running server component - srv
// ConnectionID - String    - Connection identifier              - id
//
// Returns:
// Map Of KeyAndValue - Execution result
Function CloseIncomingConnection(Val ServerObject, Val ConnectionID) Export

    Return OPI_GenericServer.CloseIncomingConnection(OPI_WebSocket, ServerObject, ConnectionID);

EndFunction

// Get connection list !NOCLI
// Gets the list of connections
//
// Note:
// The list displays active connections and closed connections with unprocessed data in the buffer
//
// Parameters:
// ServerObject - Arbitrary - Object of running server component - srv
//
// Returns:
// Map Of KeyAndValue - Execution result
Function GetConnectionList(Val ServerObject) Export

    Return OPI_GenericServer.GetConnectionList(OPI_WebSocket, ServerObject);

EndFunction

// Get log !NOCLI
// Retrieves server log data (with logging to memory enabled)
//
// Parameters:
// ServerObject - Arbitrary - Object of running server component                         - srv
// AsString     - Boolean   - True > returns log as a single string, False > as an array - str
// EventCount   - Number    - Number of recent events to retrieve. 0 > no limits         - count
//
// Returns:
// String, Map Of KeyAndValue - Log as a string or a map with the full execution result
Function GetLog(Val ServerObject, Val AsString = False, Val EventCount = 100) Export

    Return OPI_GenericServer.GetLog(OPI_WebSocket
        , ServerObject
        , AsString
        , EventCount);

EndFunction

// Get logging settings !NOCLI
// Retrieves settings structure for starting logging on server startup
//
// Parameters:
// WriteToMemory - Boolean - Logging log to memory for further retrieval from the addin object - memory
// MaxEvents     - Number  - Maximum number of events stored in memory                         - count
// FilePath      - String  - Path to file for saving full log, if necessary                    - path
//
// Returns:
// Structure Of KeyAndValue - Settings structure
Function GetLoggingSettings(Val WriteToMemory = True
    , Val MaxEvents = 300
    , Val FilePath = "") Export

    //@skip-check constructor-function-return-section
    Return OPI_GenericServer.GetLoggingSettings(WriteToMemory, MaxEvents, FilePath);

EndFunction

// Is server object !NOCLI
// Checks that the value is an object of the TCP server external component
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsServerObject(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_WSServer.Main";

EndFunction

#EndRegion

#EndRegion

#Region Internal

Function AddInName() Export

    Return "WSServer";

EndFunction

#EndRegion


#Region Alternate

Function ЭтоОбъектКлиента(Val Значение) Export
    Return IsClientObject(Значение);
EndFunction

Function ЗапуститьСервер(Val Порт, Val РазмерПула = 100, Val Логирование = Undefined) Export
    Return StartServer(Порт, РазмерПула, Логирование);
EndFunction

Function ОстановитьСервер(Val ОбъектСервера) Export
    Return StopServer(ОбъектСервера);
EndFunction

Function ПолучитьДанныеОчередногоСоединения(Val ОбъектСервера, Val Таймаут = 1000, Val МаксимальныйРазмер = 8192) Export
    Return GetNextConnectionData(ОбъектСервера, Таймаут, МаксимальныйРазмер);
EndFunction

Function ПолучитьДанныеСоединения(Val ОбъектСервера, Val IDСоединения, Val Таймаут = 1000, Val МаксимальныйРазмер = 8192) Export
    Return GetConnectionData(ОбъектСервера, IDСоединения, Таймаут, МаксимальныйРазмер);
EndFunction

Function ОтправитьДанные(Val ОбъектСервера, Val IDСоединения, Val Данные) Export
    Return SendData(ОбъектСервера, IDСоединения, Данные);
EndFunction

Function ЗакрытьВходящееСоединение(Val ОбъектСервера, Val IDСоединения) Export
    Return CloseIncomingConnection(ОбъектСервера, IDСоединения);
EndFunction

Function ПолучитьСписокСоединений(Val ОбъектСервера) Export
    Return GetConnectionList(ОбъектСервера);
EndFunction

Function ПолучитьЛог(Val ОбъектСервера, Val КакСтрока = False, Val ЧислоСобытий = 100) Export
    Return GetLog(ОбъектСервера, КакСтрока, ЧислоСобытий);
EndFunction

Function ПолучитьНастройкиЛогирования(Val ЗаписьВПамять = True, Val МаксимумСобытий = 300, Val ПутьКФайлу = "") Export
    Return GetLoggingSettings(ЗаписьВПамять, МаксимумСобытий, ПутьКФайлу);
EndFunction

Function ЭтоОбъектСервера(Val Значение) Export
    Return IsServerObject(Значение);
EndFunction

Function ИмяКомпоненты() Export
    Return AddInName();
EndFunction

#EndRegion