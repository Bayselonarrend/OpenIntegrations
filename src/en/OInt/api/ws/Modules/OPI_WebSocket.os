// OneScript: ./OInt/api/ws/Modules/OPI_WebSocket.os
// Lib: WebSocket
// CLI: none
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

#Region Common

// Get logging settings !NOCLI
// Retrieves settings structure for starting logging on server startup
//
// Parameters:
// WriteToMemory - Boolean - Logging to memory for further retrieval from the addin object - memory
// MaxEvents     - Number  - Maximum number of events stored in memory                     - count
// FilePath      - String  - Path to file for saving full log, if necessary                - path
//
// Returns:
// Structure Of KeyAndValue - Settings structure
Function GetLoggingSettings(Val WriteToMemory = True
    , Val MaxEvents = 300
    , Val FilePath = "") Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetLoggingSettings(WriteToMemory, MaxEvents, FilePath);

EndFunction

// Get log !NOCLI
// Retrieves server log data (with logging to memory enabled)
//
// Parameters:
// AddInObject - Arbitrary - Server or client component object                          - srv
// AsString    - Boolean   - True > returns log as a single string, False > as an array - str
// EventCount  - Number    - Number of recent events to retrieve. 0 > no limits         - count
//
// Returns:
// String, Map Of KeyAndValue - Log as a string or a map with the full execution result
Function GetLog(Val AddInObject, Val AsString = False, Val EventCount = 100) Export

    Return OPI_AddIns.GetLog(AddInObject
        , AsString
        , EventCount);

EndFunction

#EndRegion

#Region ClientMethods

// Create connection !NOCLI
// Creates a WebSocket connection
//
// Parameters:
// Address - String                   - Address and port                                  - address
// Tls     - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings    - tls
// Proxy   - Structure Of KeyAndValue - Proxy settings, if required. See GetProxySettings - proxy
// Headers - Map Of KeyAndValue       - Map of additional HTTP headers for handshake      - headers
// Logging - Structure Of KeyAndValue - Logging settings. See GetLoggingSettings          - log
//
// Returns:
// Map Of KeyAndValue, Arbitrary - Client object or map with error information
Function CreateConnection(Val Address
    , Val Tls = Undefined
    , Val Proxy = Undefined
    , Val Headers = Undefined
    , Val Logging = Undefined) Export

    OPI_TypeConversion.GetLine(Address);
    OPI_Tools.RestoreEscapeSequences(Address);

    WSClient = OPI_AddIns.GetAddIn("WSClient");
    Tls      = OPI_AddIns.SetTls(WSClient, Tls);

    If Not OPI_Tools.GetOr(Tls, "result", False) Then
        Return Tls;
    EndIf;

    If ValueIsFilled(Proxy) Then

        OPI_TypeConversion.GetKeyValueCollection(Proxy);
        ProxtString = OPI_Tools.JSONString(Proxy);

        Setup = WSClient.SetProxySettings(ProxtString);
        Setup = OPI_Tools.JsonToStructure(Setup);

        If Not OPI_Tools.GetOr(Setup, "result", False) Then
            Return Setup;
        EndIf;

    EndIf;

    If Logging = Undefined Then

        SettingsString = "";

    Else

        ErrorText      = "Incorrect logging settings";
        OPI_TypeConversion.GetKeyValueCollection(Logging, ErrorText);
        SettingsString = OPI_Tools.JSONString(Logging);

    EndIf;

    If ValueIsFilled(Headers) Then

        ErrorText = "Incorrect header structure";
        OPI_TypeConversion.GetKeyValueCollection(Headers, ErrorText);

        HeadersAsString = OPI_Tools.JSONString(Headers);
        Result          = WSClient.SetHeaders(HeadersAsString);
        Result          = OPI_Tools.JsonToStructure(Result);

        If Not OPI_Tools.GetOr(Result, "result", False) Then
            Return Result;
        EndIf;

    EndIf;

    Result = WSClient.Connect(Address, SettingsString);
    Result = OPI_Tools.JsonToStructure(Result);

    Return ?(Result["result"], WSClient, Result);

EndFunction

// Close connection !NOCLI
// Explicitly closes a previously created connection
//
// Parameters:
// Connection - Arbitrary - Connection, See CreateConnection - conn
// Code       - Number    - Status code                      - code
// Reason     - String    - Close message                    - reason
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
Function CloseConnection(Val Connection, Val Code = 1000, Val Reason = "") Export

    If IsClientObject(Connection) Then

        OPI_TypeConversion.GetNumber(Code);
        OPI_TypeConversion.GetLine(Reason);

        Result = Connection.Close(Code, Reason);
        Result = OPI_Tools.JsonToStructure(Result, False);

    Else

        Result = New Structure("result,error", False, "It's not a connection");

    EndIf;

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Send ping !NOCLI
// Sends a ping to the remote server
//
// Parameters:
// Connection - Arbitrary - Connection, See CreateConnection - conn
//
// Returns:
// Map Of KeyAndValue - Execution result
Function SendPing(Val Connection) Export

    If Not IsClientObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    Result = Connection.SendPing();
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Send pong !NOCLI
// Sends a pong to the remote server
//
// Parameters:
// Connection - Arbitrary - Connection, See CreateConnection - conn
//
// Returns:
// Map Of KeyAndValue - Execution result
Function SendPong(Val Connection) Export

    If Not IsClientObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    Result = Connection.SendPong();
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Get message !NOCLI
// Receives an incoming message from the queue or waits for a new one
//
// Parameters:
// Connection - Arbitrary - Connection, See CreateConnection - conn
// Timeout    - Number    - Message receive timeout (in ms.) - tout
//
// Returns:
// BinaryData - Received message
Function GetMessage(Val Connection, Val Timeout = 10000) Export

    If Not IsClientObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetNumber(Timeout);

    Result = Connection.ReceiveMessage(Timeout);
    Result = OPI_Tools.JsonToStructure(Result);

    MessageType = OPI_Tools.GetOr(Result, "type", "");
    Data        = OPI_Tools.GetOr(Result, "data", "");

    If MessageType = "binary" Then

        If ValueIsFilled(Data) Then
            Result.Insert("data", OPI_AddIns.ReceiveData(Connection, Data));
        EndIf;

    EndIf;

    If MessageType = "text" Then

        Try

            If StrStartsWith(Data, "{") Or StrStartsWith(Data, "[") Then
                OPI_TypeConversion.GetKeyValueCollection(Data);
                Result["data"] = Data;
            EndIf;

        Except
            Result["data"] = String(Data);
        EndTry;

    EndIf;

    Return Result;

EndFunction

// Send text message !NOCLI
// Sends text to the connection
//
// Parameters:
// Connection - Arbitrary - Connection, See CreateConnection - conn
// Text       - String    - Text or path to a text file      - text
//
// Returns:
// Map Of KeyAndValue - Execution result
Function SendTextMessage(Val Connection, Val Text) Export

    If Not IsClientObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetLine(Text, True);

    Result = Connection.SendText(Text);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Send binary message !NOCLI
// Sends binary data to the connection
//
// Parameters:
// Connection - Arbitrary          - Connection, See CreateConnection - conn
// Data       - BinaryData, String - Binary data or file path         - data
//
// Returns:
// Map Of KeyAndValue - Execution result
Function SendBinaryMessage(Val Connection, Val Data) Export

    If Not IsClientObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetBinaryData(Data, True);

    Result = Connection.SendBinary(Data);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Get TLS settings !NOCLI
// Forms settings for using TLS
//
// Note:
// Tls settings can only be set when a connection is created
//
// Parameters:
// DisableCertVerification - Boolean - Allows to work with invalid certificates, including self signed                    - trust
// CertFilepath            - String  - Path to the root PEM file of the certificate if it is not in the system repository - cert
//
// Returns:
// Structure Of KeyAndValue - Structure of TLS connection settings
Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export

    Return OPI_AddIns.GetTlsSettings(DisableCertVerification, CertFilepath);

EndFunction

// Get proxy settings
// Creates a structure of proxy server settings for the connection
//
// Parameters:
// Address  - String            - Proxy address                       - addr
// Port     - Number            - Proxy port                          - port
// View     - String            - Proxy type: socks5, socks4, http    - type
// Login    - String, Undefined - Authorization login, if required    - login
// Password - String, Undefined - Authorization password, if required - pass
//
// Returns:
// Structure Of KeyAndValue - Proxy settings structure
Function GetProxySettings(Val Address
    , Val Port
    , Val View = "socks5"
    , Val Login = Undefined
    , Val Password = Undefined) Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetProxySettings(Address, Port, View, Login, Password);

EndFunction

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
Function GetNextConnectionData(Val ServerObject, Val Timeout = 1000) Export

    Return OPI_GenericServer.GetNextConnectionData(OPI_WebSocket
        , ServerObject
        , Timeout
        , Undefined);

EndFunction

// Get connection data !NOCLI
// Gets data from the buffer of a specific connection by ID
//
// Parameters:
// ServerObject - Arbitrary - Object of running server component                        - srv
// ConnectionID - String    - Connection identifier                                     - id
// Timeout      - Number    - Waiting period for new data if the queue is empty (in ms) - tout
//
// Returns:
// Map Of KeyAndValue - Execution result
Function GetConnectionData(Val ServerObject
    , Val ConnectionID
    , Val Timeout = 1000) Export

    Return OPI_GenericServer.GetConnectionData(OPI_WebSocket
        , ServerObject
        , ConnectionID
        , Timeout
        , Undefined);

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
// ServerObject      - Arbitrary - Object of running server component                                - srv
// ConnectionID      - String    - Connection identifier                                             - id
// RemoveImmediately - Boolean   - If True, the connection will be removed from the list immediately - rm
//
// Returns:
// Map Of KeyAndValue - Execution result
Function CloseIncomingConnection(Val ServerObject, Val ConnectionID, Val RemoveImmediately = True) Export

    RemoveImmediately = ?(RemoveImmediately = Undefined, False, RemoveImmediately);
    Return OPI_GenericServer.CloseIncomingConnection(OPI_WebSocket, ServerObject, ConnectionID, RemoveImmediately);

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

// Is server object !NOCLI
// Checks that the value is an object of the WebSocket server external component
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

Function ПолучитьНастройкиЛогирования(Val ЗаписьВПамять = True, Val МаксимумСобытий = 300, Val ПутьКФайлу = "") Export
    Return GetLoggingSettings(ЗаписьВПамять, МаксимумСобытий, ПутьКФайлу);
EndFunction

Function ПолучитьЛог(Val ОбъектКомпоненты, Val КакСтрока = False, Val ЧислоСобытий = 100) Export
    Return GetLog(ОбъектКомпоненты, КакСтрока, ЧислоСобытий);
EndFunction

Function ОткрытьСоединение(Val Адрес, Val Tls = Undefined, Val Прокси = Undefined, Val Заголовки = Undefined, Val Логирование = Undefined) Export
    Return CreateConnection(Адрес, Tls, Прокси, Заголовки, Логирование);
EndFunction

Function ЗакрытьСоединение(Val Соединение, Val Код = 1000, Val Причина = "") Export
    Return CloseConnection(Соединение, Код, Причина);
EndFunction

Function ОтправитьПинг(Val Соединение) Export
    Return SendPing(Соединение);
EndFunction

Function ОтправитьПонг(Val Соединение) Export
    Return SendPong(Соединение);
EndFunction

Function ПолучитьСообщение(Val Соединение, Val Таймаут = 10000) Export
    Return GetMessage(Соединение, Таймаут);
EndFunction

Function ОтправитьТекстовоеСообщение(Val Соединение, Val Текст) Export
    Return SendTextMessage(Соединение, Текст);
EndFunction

Function ОтправитьДвоичноеСообщение(Val Соединение, Val Данные) Export
    Return SendBinaryMessage(Соединение, Данные);
EndFunction

Function ПолучитьНастройкиTls(Val ОтключитьПроверкуСертификатов, Val ПутьКСертификату = "") Export
    Return GetTlsSettings(ОтключитьПроверкуСертификатов, ПутьКСертификату);
EndFunction

Function ПолучитьНастройкиПрокси(Val Адрес, Val Порт, Val Вид = "socks5", Val Логин = Undefined, Val Пароль = Undefined) Export
    Return GetProxySettings(Адрес, Порт, Вид, Логин, Пароль);
EndFunction

Function ЭтоОбъектКлиента(Val Значение) Export
    Return IsClientObject(Значение);
EndFunction

Function ЗапуститьСервер(Val Порт, Val РазмерПула = 100, Val Логирование = Undefined) Export
    Return StartServer(Порт, РазмерПула, Логирование);
EndFunction

Function ОстановитьСервер(Val ОбъектСервера) Export
    Return StopServer(ОбъектСервера);
EndFunction

Function ПолучитьДанныеОчередногоСоединения(Val ОбъектСервера, Val Таймаут = 1000) Export
    Return GetNextConnectionData(ОбъектСервера, Таймаут);
EndFunction

Function ПолучитьДанныеСоединения(Val ОбъектСервера, Val IDСоединения, Val Таймаут = 1000) Export
    Return GetConnectionData(ОбъектСервера, IDСоединения, Таймаут);
EndFunction

Function ОтправитьДанные(Val ОбъектСервера, Val IDСоединения, Val Данные) Export
    Return SendData(ОбъектСервера, IDСоединения, Данные);
EndFunction

Function ЗакрытьВходящееСоединение(Val ОбъектСервера, Val IDСоединения, Val УдалятьСразу = True) Export
    Return CloseIncomingConnection(ОбъектСервера, IDСоединения, УдалятьСразу);
EndFunction

Function ПолучитьСписокСоединений(Val ОбъектСервера) Export
    Return GetConnectionList(ОбъектСервера);
EndFunction

Function ЭтоОбъектСервера(Val Значение) Export
    Return IsServerObject(Значение);
EndFunction

Function ИмяКомпоненты() Export
    Return AddInName();
EndFunction

#EndRegion