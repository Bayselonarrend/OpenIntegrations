// OneScript: ./OInt/tests/Modules/OPIt_TCP.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

#Use oint
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("TCP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("TCP");

EndFunction

#Region Internal

#Region RunnableTests

#Region TCP

Procedure TC_Client() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("TCP_Address"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("TCP_AddressTLS", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Proxy_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Proxy_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Socks5_IP"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Socks5_Port"   , TestParameters);

    TCP_CreateConnection(TestParameters);
    TCP_CloseConnection(TestParameters);
    TCP_ReadBinaryData(TestParameters);
    TCP_SendBinaryData(TestParameters);
    TCP_ReadLine(TestParameters);
    TCP_SendLine(TestParameters);
    TCP_ProcessRequest(TestParameters);
    TCP_GetTLSSettings(TestParameters);
    TCP_GetLastError(TestParameters);
    TCP_GetProxySettings(TestParameters);

EndProcedure

Procedure TC_Server() Export

    TestParameters = New Structure;

    TCP_StartServer(TestParameters);
    TCP_StopServer(TestParameters);
    TCP_GetNextConnectionData(TestParameters);
    TCP_GetConnectionData(TestParameters);
    TCP_SendData(TestParameters);
    TCP_CloseIncomingConnection(TestParameters);
    TCP_CompleteSend(TestParameters);
    TCP_FinishReceiving(TestParameters);
    TCP_GetConnectionList(TestParameters);
    TCP_IsServerObject(TestParameters);
    TCP_GetLog(TestParameters);
    TCP_GetLoggingSettings(TestParameters);

EndProcedure

#EndRegion // TCP

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region TCP

Procedure TCP_CreateConnection(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TestDataRetrieval.Process(Connection, "TCP", "CreateConnection"); // SKIP

    OPI_TCP.CloseConnection(Connection);

    Address = "tcpbin.com:4243";
    Tls     = OPI_TCP.GetTLSSettings(True);

    ProxtUser     = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];
    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];

    ProxyAddress = ?(ProxyAddress = "127.0.0.1", OPI_TestDataRetrieval.GetLocalhost(), ProxyAddress); // SKIP

    Proxy = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, "socks5", ProxtUser, ProxyPassword);
    Tls   = OPI_TCP.GetTLSSettings(True);

    Connection = OPI_TCP.CreateConnection(Address, TLS, Proxy);

    // END

    OPI_TestDataRetrieval.Process(Connection, "TCP", "CreateConnection", "TLS");

EndProcedure

Procedure TCP_CloseConnection(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);

    Result = OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "CloseConnection");

EndProcedure

Procedure TCP_ReadBinaryData(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Message    = "Hello server!" + Chars.LF;
    Data       = GetBinaryDataFromString(Message);

    OPI_TCP.SendBinaryData(Connection, Data);

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Result = OPI_TCP.ReadBinaryData(Connection, , Marker);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "ReadBinaryData", , Message);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendBinaryData(Connection, Data);
    Result = OPI_TCP.ReadBinaryData(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.Process(Result, "TCP", "ReadBinaryData", "Timeout", Message);

EndProcedure

Procedure TCP_SendBinaryData(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Message    = "Hello server!" + Chars.LF;
    Data       = GetBinaryDataFromString(Message);

    Result = OPI_TCP.SendBinaryData(Connection, Data);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Response = OPI_TCP.ReadBinaryData(Connection, , Marker);

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Response, "TCP", "SendBinaryData", , Message);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendBinaryData(Connection, Data);
    Result = OPI_TCP.ReadBinaryData(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.Process(Result, "TCP", "SendBinaryData", "Timeout", Message);

EndProcedure

Procedure TCP_ProcessRequest(FunctionParameters)

    Address = FunctionParameters["TCP_Address"];
    Data    = "Echo this!" + Chars.LF;

    Result = OPI_TCP.ProcessRequest(Address, Data);

    OPI_TestDataRetrieval.Process(Result, "TCP", "ProcessRequest", , "Echo this!" + Chars.LF); // SKIP

    Address = FunctionParameters["TCP_AddressTLS"];

    ProxtUser     = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];
    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];

    ProxyAddress = ?(ProxyAddress = "127.0.0.1", OPI_TestDataRetrieval.GetLocalhost(), ProxyAddress); // SKIP

    Proxy = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, "socks5", ProxtUser, ProxyPassword);
    Tls   = OPI_TCP.GetTLSSettings(True);

    Result = OPI_TCP.ProcessRequest(Address, Data, , Tls, Proxy);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "ProcessRequest", "TLS", "Echo this!" + Chars.LF);

EndProcedure

Procedure TCP_ReadLine(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Data       = "Hello server!" + Chars.LF;

    OPI_TCP.SendLine(Connection, Data);

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Result = OPI_TCP.ReadLine(Connection, , Marker);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "ReadLine", , Data);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendLine(Connection, Data);
    Result = OPI_TCP.ReadLine(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.Process(Result, "TCP", "ReadLine", "Timeout", Data);

EndProcedure

Procedure TCP_SendLine(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Data       = "Hello server!" + Chars.LF;

    Result = OPI_TCP.SendLine(Connection, Data);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Response = OPI_TCP.ReadLine(Connection, , Marker);

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Response, "TCP", "SendLine", , Data);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendLine(Connection, Data);
    Result = OPI_TCP.ReadLine(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.Process(Result, "TCP", "SendLine", "Timeout", Data);

EndProcedure

Procedure TCP_GetTLSSettings(FunctionParameters)

    Result = OPI_TCP.GetTLSSettings(True);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetTLSSettings");

EndProcedure

Procedure TCP_GetLastError(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Data       = "Hello server!" + Chars.LF;

    Sending = OPI_TCP.SendLine(Connection, Data);
    Result  = OPI_TCP.GetLastError(Connection); // SKIP

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetLastError");

EndProcedure

Procedure TCP_GetProxySettings(FunctionParameters)

    ProxyType = "socks5"; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Result = OPI_TCP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetProxySettings");

EndProcedure

Procedure TCP_StartServer(FunctionParameters)

    Port     = 9876;
    PoolSize = 10;

    Host = OPI_TCP.StartServer(Port, PoolSize);

    // END

    OPI_TestDataRetrieval.Process(Host, "TCP", "StartServer");

    OPI_TCP.StopServer(Host);

EndProcedure

Procedure TCP_StopServer(FunctionParameters)

    Port = 9877;
    Host = OPI_TCP.StartServer(Port);

    Result = OPI_TCP.StopServer(Host);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "StopServer");

    ListResult = OPI_TCP.GetConnectionList(Host);

    OPI_TestDataRetrieval.Process(ListResult, "TCP", "StopServer", "List");

    OPI_TypeConversion.GetLine(Port);

    Address = StrTemplate("127.0.0.1:%1", Port);
    Client  = OPI_TCP.CreateConnection(Address);

    OPI_TestDataRetrieval.Process(Client, "TCP", "StopServer", "Connection");

EndProcedure

Procedure TCP_GetNextConnectionData(FunctionParameters)

    LaunchPort   = 9877;
    ServerObject = OPI_TCP.StartServer(LaunchPort);

    // Send message from client
    ConnectionAddress = "127.0.0.1:9877";
    ClientObject = OPI_TCP.CreateConnection(ConnectionAddress);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    Else
        Message = "Hello from client!" + Chars.LF;
        OPI_TCP.SendLine(ClientObject, Message);
    EndIf;

    // Receive message on server
    Result = OPI_TCP.GetNextConnectionData(ServerObject, 5000, 8192);

    // END

    OPI_TCP.CloseConnection(ClientObject);

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetNextConnectionData", , Message);

    OPI_TCP.SendLine(ClientObject, Message);
    OPI_TCP.CloseConnection(ClientObject);

    Result = OPI_TCP.GetNextConnectionData(ServerObject, 5000, 8192);

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetNextConnectionData", "Closed", Message);

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_GetConnectionData(FunctionParameters)

    LaunchPort   = 9877;
    ServerObject = OPI_TCP.StartServer(LaunchPort);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    ClientObject = OPI_TCP.CreateConnection(ConnectionAddress);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_Tools.Pause(1); // SKIP

    // Receive the list of server connections
    ConnectionList = OPI_TCP.GetConnectionList(ServerObject);

    If Not ConnectionList["result"] Then
        Raise OPI_Tools.JSONString(ConnectionList);
    EndIf;

    If ConnectionList["connections"].Count() = 0 Then
        Raise "Connection list is empty";
    Else
        ConnectionID                         = ConnectionList["connections"][0]["connectionId"];
    EndIf;

    EmptyResult = OPI_TCP.GetConnectionData(ServerObject, ConnectionID, 5000, 8192); // SKIP
    OPI_TestDataRetrieval.Process(EmptyResult, "TCP", "GetConnectionData", "Empty"); // SKIP

    For N = 0 To 5 Do

        // Send from client
        CurrentMessage = StrTemplate("Message no. %1%2", N, Chars.LF);
        OPI_TCP.SendLine(ClientObject, CurrentMessage);

        // Recieve on server
        Result = OPI_TCP.GetConnectionData(ServerObject, ConnectionID, 5000, 8192);

        OPI_TestDataRetrieval.Process(Result, "TCP", "GetConnectionData", , CurrentMessage); // SKIP

    EndDo;

    // END

    OPI_TCP.CloseConnection(ClientObject);

    Result = OPI_TCP.GetConnectionData(ServerObject, ConnectionID, 5000, 8192);

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetConnectionData", "Closed");

    Result = OPI_TCP.GetConnectionList(ServerObject);

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetConnectionData", "EmptyList");

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_SendData(FunctionParameters)

    LaunchPort   = 9877;
    ServerObject = OPI_TCP.StartServer(LaunchPort);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    ClientObject = OPI_TCP.CreateConnection(ConnectionAddress);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = "Hello!" + Chars.LF;

    OPI_TCP.SendLine(ClientObject, Message);

    // Receive message and connection ID
    NextMessage = OPI_TCP.GetNextConnectionData(ServerObject, 5000);
    ConnectionID = NextMessage["connectionId"];

    // Send response from server
    ServerResponse = "Response from server!" + Chars.LF;
    Result = OPI_TCP.SendData(ServerObject, ConnectionID, ServerResponse);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "SendData");

    // Check receiving on client
    ClientResponse = OPI_TCP.ReadLine(ClientObject, , Chars.LF);

    OPI_TestDataRetrieval.Process(ClientResponse, "TCP", "SendData", "Check", ServerResponse);

    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_CloseIncomingConnection(FunctionParameters)

    LaunchPort   = 9877;
    ServerObject = OPI_TCP.StartServer(LaunchPort);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    ClientObject = OPI_TCP.CreateConnection(ConnectionAddress);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = "Hello!" + Chars.LF;

    OPI_TCP.SendLine(ClientObject, Message);

    // Get connection ID
    FirstMessage = OPI_TCP.GetNextConnectionData(ServerObject, 5000);
    ConnectionID = FirstMessage["connectionId"];

    // Close connection from server side
    Result = OPI_TCP.CloseIncomingConnection(ServerObject, ConnectionID);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "CloseIncomingConnection");

    Result = OPI_TCP.GetConnectionList(ServerObject);

    OPI_TestDataRetrieval.Process(Result, "TCP", "CloseIncomingConnection", "EmptyList");

    OPI_TCP.SendLine(ClientObject, Message);
    Result = OPI_TCP.SendLine(ClientObject, Message);

    OPI_TestDataRetrieval.Process(Result, "TCP", "CloseIncomingConnection", "SendingToClosed");

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_CompleteSend(FunctionParameters)

    LaunchPort   = 9877;
    ServerObject = OPI_TCP.StartServer(LaunchPort);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    ClientObject = OPI_TCP.CreateConnection(ConnectionAddress);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    ActiveConnections = OPI_TCP.GetConnectionList(ServerObject);
    ConnectionID      = ActiveConnections["connections"][0]["connectionId"];

    // Finish sending from server
    Result = OPI_TCP.CompleteSend(ServerObject, ConnectionID);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "CompleteSend");

    Message = "Hello" + Chars.LF;

    OPI_TCP.SendLine(ClientObject, Message);
    Result = OPI_TCP.SendLine(ClientObject, Message);

    OPI_TestDataRetrieval.Process(Result, "TCP", "CompleteSend", "SendingClient");

    ServerResponse = "Response from server!" + Chars.LF;
    Result         = OPI_TCP.SendData(ServerObject, ConnectionID, ServerResponse);

    OPI_TestDataRetrieval.Process(Result, "TCP", "CompleteSend", "SendingServer");

    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_GetConnectionList(FunctionParameters)

    LaunchPort   = 9877;
    ServerObject = OPI_TCP.StartServer(LaunchPort);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";

    Client1 = OPI_TCP.CreateConnection(ConnectionAddress);
    Client2 = OPI_TCP.CreateConnection(ConnectionAddress);

    If Not OPI_TCP.IsClientObject(Client1) Then
        Raise OPI_Tools.JSONString(Client1);
    EndIf;

    If Not OPI_TCP.IsClientObject(Client2) Then
        Raise OPI_Tools.JSONString(Client2);
    EndIf;

    Result = OPI_TCP.GetConnectionList(ServerObject);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetConnectionList");

    OPI_TCP.CloseConnection(Client1);
    OPI_TCP.CloseConnection(Client2);

    Client3 = OPI_TCP.CreateConnection(ConnectionAddress);
    Client4 = OPI_TCP.CreateConnection(ConnectionAddress);

    OPI_TCP.SendLine(Client3, "Yo" + Chars.LF);

    OPI_TCP.CloseConnection(Client3);
    OPI_TCP.CloseConnection(Client4);

    Result = OPI_TCP.GetConnectionList(ServerObject);

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetConnectionList", "Closing");

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_FinishReceiving(FunctionParameters)

    LaunchPort   = 9877;
    ServerObject = OPI_TCP.StartServer(LaunchPort);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    ClientObject = OPI_TCP.CreateConnection(ConnectionAddress);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    ActiveConnections = OPI_TCP.GetConnectionList(ServerObject);
    ConnectionID      = ActiveConnections["connections"][0]["connectionId"];

    // Completing server-side reception
    Result = OPI_TCP.FinishReceiving(ServerObject, ConnectionID);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "FinishReceiving");

    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_IsServerObject(FunctionParameters)

    Port = 9884;
    Host = OPI_TCP.StartServer(Port);

    Result = OPI_TCP.IsServerObject(Host);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "IsServerObject");

    OPI_TCP.StopServer(Host);

    // Check with wrong object
    Result = OPI_TCP.IsServerObject("Not a server");

    OPI_TestDataRetrieval.Process(Result, "TCP", "IsServerObject", "False");

EndProcedure

Procedure TCP_GetLog(FunctionParameters)

    LaunchPort      = 9877;
    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_TCP.GetLoggingSettings(True, 100, LogFile);
    ServerObject    = OPI_TCP.StartServer(LaunchPort, , LoggingSettings);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    ClientObject = OPI_TCP.CreateConnection(ConnectionAddress);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Result = OPI_TCP.GetLog(ServerObject);

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetLog", , LogFile);

EndProcedure

Procedure TCP_GetLoggingSettings(FunctionParameters)

    Result = OPI_TCP.GetLoggingSettings(True, 100, GetTempFileName());

    // END

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetLoggingSettings");

    Result = OPI_TCP.GetLoggingSettings(False, , GetTempFileName());

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetLoggingSettings", "File");

    Result = OPI_TCP.GetLoggingSettings(True);

    OPI_TestDataRetrieval.Process(Result, "TCP", "GetLoggingSettings", "Memory");

EndProcedure

#EndRegion // TCP

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure TC_Клиент() Export
    TC_Client();
EndProcedure

Procedure TC_Сервер() Export
    TC_Server();
EndProcedure

#EndRegion