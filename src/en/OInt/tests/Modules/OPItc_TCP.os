// OneScript: ./OInt/tests/Modules/OPItc_TCP.os

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
//@skip-check use-non-recommended-method

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use "../../formats"
#Use asserts
#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("TCP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("TCP");

EndFunction

#Region Internal

#Region RunnableTests

#Region TCP

Procedure TC_Client() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
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

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = OPI_TestDataRetrieval.GetTestData();
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

Procedure TC_ExtendedCheck() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;

    TCP_Extended_GetDataOfNextTimeout(TestParameters);
    TCP_Extended_OperationWithoutStart(TestParameters);
    TCP_Extended_GetLogOnServerStart(TestParameters);
    TCP_Extended_ReadTimeout(TestParameters);
    TCP_Extended_OperationWithoutConnection(TestParameters);
    TCP_Extended_GetLogOnConnectionOpening(TestParameters);
    TCP_Extended_JanxCollectionExchange(TestParameters);

EndProcedure

#EndRegion // TCP

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region TCP

Procedure TCP_CreateConnection(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Connection, "TCP", "CreateConnection"); // SKIP

    OPI_TCP.CloseConnection(Connection);

    Address = "tcpbin.com:4243";
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetTLSSettings", Options);

    ProxtUser     = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];
    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];

    ProxyAddress = ?(ProxyAddress = "127.0.0.1", OPI_TestDataRetrieval.GetLocalhost(), ProxyAddress); // SKIP

    Options = New Structure;
    Options.Insert("addr", ProxyAddress);
    Options.Insert("port", ProxyPort);
    Options.Insert("type", "socks5");
    Options.Insert("login", ProxtUser);
    Options.Insert("pass", ProxyPassword);

    Proxy = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetProxySettings", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetTLSSettings", Options);

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", Tls);
    Options.Insert("proxy", Proxy);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Connection, "TCP", "CreateConnection", "TLS");

    OPI_TCP.CloseConnection(Connection); // SKIP

EndProcedure

Procedure TCP_CloseConnection(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    Options = New Structure;
    Options.Insert("tcp", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CloseConnection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "CloseConnection");

EndProcedure

Procedure TCP_ReadBinaryData(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    Message    = "Hello server!" + Chars.LF;
    Data       = GetBinaryDataFromString(Message);

    OPI_TCP.SendBinaryData(Connection, Data);

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("marker", Marker);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadBinaryData", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "ReadBinaryData", , Message);

    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    OPI_TCP.SendBinaryData(Connection, Data);
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("timeout", 50000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadBinaryData", Options);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "ReadBinaryData", "Timeout", Message);

EndProcedure

Procedure TCP_SendBinaryData(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    Message    = "Hello server!" + Chars.LF;
    Data       = GetBinaryDataFromString(Message);

    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("data", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "SendBinaryData", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("marker", Marker);

    Response = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadBinaryData", Options);

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Response, "TCP", "SendBinaryData", , Message);

    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    OPI_TCP.SendBinaryData(Connection, Data);
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("timeout", 50000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadBinaryData", Options);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "SendBinaryData", "Timeout", Message);

EndProcedure

Procedure TCP_ProcessRequest(FunctionParameters)

    Address = FunctionParameters["TCP_Address"];
    Data    = "Echo this!" + Chars.LF;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("data", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ProcessRequest", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "ProcessRequest", , "Echo this!" + Chars.LF); // SKIP

    Address = FunctionParameters["TCP_AddressTLS"];

    ProxtUser     = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];
    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];

    ProxyAddress = ?(ProxyAddress = "127.0.0.1", OPI_TestDataRetrieval.GetLocalhost(), ProxyAddress); // SKIP

    Options = New Structure;
    Options.Insert("addr", ProxyAddress);
    Options.Insert("port", ProxyPort);
    Options.Insert("type", "socks5");
    Options.Insert("login", ProxtUser);
    Options.Insert("pass", ProxyPassword);

    Proxy = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetProxySettings", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetTLSSettings", Options);

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("data", Data);
    Options.Insert("tls", Tls);
    Options.Insert("proxy", Proxy);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ProcessRequest", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "ProcessRequest", "TLS", "Echo this!" + Chars.LF);

EndProcedure

Procedure TCP_ReadLine(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    Data       = "Hello server!" + Chars.LF;

    OPI_TCP.SendLine(Connection, Data);

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("marker", Marker);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadLine", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "ReadLine", , Data);

    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    OPI_TCP.SendLine(Connection, Data);
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("timeout", 50000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadLine", Options);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "ReadLine", "Timeout", Data);

EndProcedure

Procedure TCP_SendLine(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    Data       = "Hello server!" + Chars.LF;

    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("data", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "SendLine", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("marker", Marker);

    Response = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadLine", Options);

    OPI_TCP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Response, "TCP", "SendLine", , Data);

    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    OPI_TCP.SendLine(Connection, Data);
    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("timeout", 50000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadLine", Options);

    OPI_TCP.CloseConnection(Connection);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "SendLine", "Timeout", Data);

EndProcedure

Procedure TCP_GetTLSSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetTLSSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetTLSSettings");

EndProcedure

Procedure TCP_GetLastError(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    Data       = "Hello server!" + Chars.LF;

    Options = New Structure;
    Options.Insert("tcp", Connection);
    Options.Insert("data", Data);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "SendLine", Options);
    Options = New Structure;
    Options.Insert("tcp", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLastError", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetLastError");

EndProcedure

Procedure TCP_GetProxySettings(FunctionParameters)

    ProxyType = "socks5"; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Socks5_IP"];
    ProxyPort     = FunctionParameters["Socks5_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Options = New Structure;
    Options.Insert("addr", ProxyAddress);
    Options.Insert("port", ProxyPort);
    Options.Insert("type", ProxyType);
    Options.Insert("login", ProxyLogin);
    Options.Insert("pass", ProxyPassword);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetProxySettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetProxySettings");

EndProcedure

Procedure TCP_StartServer(FunctionParameters)

    Port     = 9876;
    PoolSize = 10;

    Options = New Structure;
    Options.Insert("port", Port);
    Options.Insert("psize", PoolSize);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "StartServer");

    OPI_TCP.StopServer(Result);

EndProcedure

Procedure TCP_StopServer(FunctionParameters)

    Port = 9877;
    Options = New Structure;
    Options.Insert("port", Port);

    Host = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    Options = New Structure;
    Options.Insert("srv", Host);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StopServer", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "StopServer");

    Options = New Structure;
    Options.Insert("srv", Host);

    ListResult = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(ListResult, "TCP", "StopServer", "List");

    OPI_TypeConversion.GetLine(Port);

    Address = StrTemplate("127.0.0.1:%1", Port);
    Options = New Structure;
    Options.Insert("address", Address);

    Client = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Client, "TCP", "StopServer", "Connection");

EndProcedure

Procedure TCP_GetNextConnectionData(FunctionParameters)

    LaunchPort   = 9877;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Send message from client
    ConnectionAddress = "127.0.0.1:9877";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    Else
        Message = "Hello from client!" + Chars.LF;
        OPI_TCP.SendLine(ClientObject, Message);
    EndIf;

    // Receive message on server
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);
    Options.Insert("msize", 8192);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetNextConnectionData", Options);

    // END

    OPI_TCP.CloseConnection(ClientObject);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetNextConnectionData", , Message);

    OPI_TCP.SendLine(ClientObject, Message);
    OPI_TCP.CloseConnection(ClientObject);

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);
    Options.Insert("msize", 8192);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetNextConnectionData", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetNextConnectionData", "Closed", Message);

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_GetConnectionData(FunctionParameters)

    LaunchPort   = 9877;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_Tools.Pause(1); // SKIP

    // Receive the list of server connections
    Options = New Structure;
    Options.Insert("srv", ServerObject);

    ConnectionList = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);

    If Not ConnectionList["result"] Then
        Raise OPI_Tools.JSONString(ConnectionList);
    EndIf;

    If ConnectionList["connections"].Count() = 0 Then
        Raise "Connection list is empty";
    Else
        ConnectionID                         = ConnectionList["connections"][0]["connectionId"];
    EndIf;

    EmptyResult = OPI_TCP.GetConnectionData(ServerObject, ConnectionID, 5000, 8192); // SKIP
    OPI_TestDataRetrieval.ProcessCLI(EmptyResult, "TCP", "GetConnectionData", "Empty"); // SKIP

    For N = 0 To 5 Do

        // Send from client
        CurrentMessage = StrTemplate("Message no. %1%2", N, Chars.LF);
        OPI_TCP.SendLine(ClientObject, CurrentMessage);

        // Recieve on server
        Result = OPI_TCP.GetConnectionData(ServerObject, ConnectionID, 5000, 8192);

        OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetConnectionData", , CurrentMessage); // SKIP

    EndDo;

    // END

    OPI_TCP.CloseConnection(ClientObject);

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);
    Options.Insert("tout", 5000);
    Options.Insert("msize", 8192);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionData", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetConnectionData", "Closed");

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetConnectionData", "EmptyList");

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_SendData(FunctionParameters)

    LaunchPort   = 9877;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = "Hello!" + Chars.LF;

    OPI_TCP.SendLine(ClientObject, Message);

    // Receive message and connection ID
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);

    NextMessage = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetNextConnectionData", Options);
    ConnectionID = NextMessage["connectionId"];

    // Send response from server
    ServerResponse = "Response from server!" + Chars.LF;
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);
    Options.Insert("data", ServerResponse);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "SendData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "SendData");

    // Check receiving on client
    Options = New Structure;
    Options.Insert("tcp", ClientObject);
    Options.Insert("marker", Chars);

    ClientResponse = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadLine", Options);

    OPI_TestDataRetrieval.ProcessCLI(ClientResponse, "TCP", "SendData", "Check", ServerResponse);

    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_CloseIncomingConnection(FunctionParameters)

    LaunchPort   = 9877;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = "Hello!" + Chars.LF;

    OPI_TCP.SendLine(ClientObject, Message);

    // Get connection ID
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);

    FirstMessage = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetNextConnectionData", Options);
    ConnectionID = FirstMessage["connectionId"];

    // Close connection from server side
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CloseIncomingConnection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "CloseIncomingConnection");

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "CloseIncomingConnection", "EmptyList");

    OPI_TCP.SendLine(ClientObject, Message);
    Options = New Structure;
    Options.Insert("tcp", ClientObject);
    Options.Insert("data", Message);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "SendLine", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "CloseIncomingConnection", "SendingToClosed");

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_CompleteSend(FunctionParameters)

    LaunchPort   = 9877;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    ActiveConnections = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);
    ConnectionID      = ActiveConnections["connections"][0]["connectionId"];

    // Finish sending from server
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CompleteSend", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "CompleteSend");

    Message = "Hello" + Chars.LF;

    OPI_TCP.SendLine(ClientObject, Message);
    Options = New Structure;
    Options.Insert("tcp", ClientObject);
    Options.Insert("data", Message);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "SendLine", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "CompleteSend", "SendingClient");

    ServerResponse = "Response from server!" + Chars.LF;
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);
    Options.Insert("data", ServerResponse);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "SendData", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "CompleteSend", "SendingServer");

    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_GetConnectionList(FunctionParameters)

    LaunchPort   = 9877;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";

    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client1 = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client2 = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(Client1) Then
        Raise OPI_Tools.JSONString(Client1);
    EndIf;

    If Not OPI_TCP.IsClientObject(Client2) Then
        Raise OPI_Tools.JSONString(Client2);
    EndIf;

    OPI_Tools.Pause(1); // SKIP

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetConnectionList");

    OPI_TCP.CloseConnection(Client1);
    OPI_TCP.CloseConnection(Client2);

    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client3 = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client4 = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    OPI_TCP.SendLine(Client3, "Yo" + Chars.LF);

    OPI_TCP.CloseConnection(Client3);
    OPI_TCP.CloseConnection(Client4);

    OPI_Tools.Pause(1); // SKIP

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetConnectionList", "Closing");

    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_FinishReceiving(FunctionParameters)

    LaunchPort   = 9877;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    ActiveConnections = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetConnectionList", Options);
    ConnectionID      = ActiveConnections["connections"][0]["connectionId"];

    // Completing server-side reception
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "FinishReceiving", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "FinishReceiving");

    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_IsServerObject(FunctionParameters)

    Port = 9884;
    Options = New Structure;
    Options.Insert("port", Port);

    Host = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    Options = New Structure;
    Options.Insert("value", Host);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "IsServerObject", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "IsServerObject");

    OPI_TCP.StopServer(Host);

    // Check with wrong object
    Options = New Structure;
    Options.Insert("value", "Not a server");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "IsServerObject", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "IsServerObject", "False");

EndProcedure

Procedure TCP_GetLog(FunctionParameters)

    LaunchPort      = 9877;
    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLoggingSettings", Options);
    Options = New Structure;
    Options.Insert("port", LaunchPort);
    Options.Insert("log", LoggingSettings);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    // Connect to running server
    ConnectionAddress = "127.0.0.1:9877";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Options = New Structure;
    Options.Insert("conn", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetLog", "Host", LogFile);

    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

    ClientLogFile   = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", ClientLogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLoggingSettings", Options);
    Address         = FunctionParameters["TCP_Address"];
    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("log", LoggingSettings);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Message = "Hello server!" + Chars.LF;
    Data    = GetBinaryDataFromString(Message);

    OPI_TCP.SendBinaryData(Connection, Data);

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLog", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetLog", "Client", ClientLogFile);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("str", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLog", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetLog", "Client, AsString", ClientLogFile);

    OPI_TCP.CloseConnection(Connection);

EndProcedure

Procedure TCP_GetLoggingSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLoggingSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetLoggingSettings");

    Options = New Structure;
    Options.Insert("memory", Ложь);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetLoggingSettings", "File");

    Options = New Structure;
    Options.Insert("memory", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "GetLoggingSettings", "Memory");

EndProcedure

#Region ExtendedCheck

Procedure TCP_Extended_GetDataOfNextTimeout(FunctionParameters)

    Port         = 9876;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    If Not OPI_TCP.IsServerObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 300);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetNextConnectionData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "Extended_GetDataOfNextTimeout");
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_Extended_OperationWithoutStart(FunctionParameters)

    ServerObject = OPI_AddIns.GetAddIn(OPI_TCP.AddInName());

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 300);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetNextConnectionData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "Extended_OperationWithoutStart");

EndProcedure

Procedure TCP_Extended_GetLogOnServerStart(FunctionParameters)

    Port            = 9876;
    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLoggingSettings", Options);
    Options = New Structure;
    Options.Insert("port", Port);
    Options.Insert("log", LoggingSettings);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    If Not OPI_TCP.IsServerObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    ConnectionAddress = "127.0.0.1:9876";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("TCP_LOG_SRV_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    OPI_TCP.SendLine(ClientObject, Message + Chars.LF);
    OPI_TCP.GetNextConnectionData(ServerObject, 5000);

    Options = New Structure;
    Options.Insert("conn", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "Extended_GetLogOnServerStart", , LogFile);
    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_Extended_ReadTimeout(FunctionParameters)

    Port              = 9876;
    ConnectionAddress = "127.0.0.1:9876";
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    If Not OPI_TCP.IsServerObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Options = New Structure;
    Options.Insert("tcp", ClientObject);
    Options.Insert("timeout", 300);

    Data = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadBinaryData", Options);

    Result                              = New Map;
    Result.Insert("result", Data.Size() = 0);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "Extended_ReadTimeout");
    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_Extended_OperationWithoutConnection(FunctionParameters)

    ClientObject = OPI_AddIns.GetAddIn("TCPClient");
    Data         = GetBinaryDataFromString("x");

    OPI_TCP.SendBinaryData(ClientObject, Data, 300);
    Options = New Structure;
    Options.Insert("tcp", ClientObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLastError", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "Extended_OperationWithoutConnection");

EndProcedure

Procedure TCP_Extended_GetLogOnConnectionOpening(FunctionParameters)

    Port              = 9876;
    ConnectionAddress = "127.0.0.1:9876";
    LogFile           = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLoggingSettings", Options);
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    If Not OPI_TCP.IsServerObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Options = New Structure;
    Options.Insert("address", ConnectionAddress);
    Options.Insert("log", LoggingSettings);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("TCP_LOG_CLI_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    OPI_TCP.SendLine(ClientObject, Message + Chars.LF);
    OPI_TCP.GetNextConnectionData(ServerObject, 5000);

    Options = New Structure;
    Options.Insert("conn", ClientObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "TCP", "Extended_GetLogOnConnectionOpening", , LogFile);
    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

Procedure TCP_Extended_JanxCollectionExchange(FunctionParameters)

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("MultipleBinaries");
    Options = New Structure;
    Options.Insert("value", Original);

    JanxData = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "SerializeData", Options);

    LaunchPort   = 9879;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "StartServer", Options);

    ConnectionAddress = "127.0.0.1:9879";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "CreateConnection", Options);

    If Not OPI_TCP.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_TCP.SendBinaryData(ClientObject, JanxData);

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);

    NextMessage = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetNextConnectionData", Options);
    ConnectionID = NextMessage["connectionId"];

    OPI_TCP.SendData(ServerObject, ConnectionID, NextMessage["message"]);

    Options = New Structure;
    Options.Insert("tcp", ClientObject);
    Options.Insert("timeout", 5000);

    ClientResponse = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ReadBinaryData", Options);
    Options = New Structure;
    Options.Insert("data", ClientResponse);

    Restored = OPI_TestDataRetrieval.ExecuteTestCLI("janx", "DeserializeData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(ClientResponse, "TCP", "Extended_JanxCollectionExchange", , Restored, Original);
    OPI_TCP.CloseConnection(ClientObject);
    OPI_TCP.StopServer(ServerObject);

EndProcedure

#EndRegion // ExtendedCheck

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

Procedure TC_РасширеннаяПроверка() Export
    TC_ExtendedCheck();
EndProcedure

#EndRegion
