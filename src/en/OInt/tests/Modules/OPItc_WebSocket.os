// OneScript: ./OInt/tests/Modules/OPItc_WebSocket.os

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
#Use asserts
#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("WebSocket");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("WebSocket");

EndFunction

#Region Internal

#Region RunnableTests

#Region WebSocket

Procedure WS_Client() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    OptionArray = OPI_TestDataRetrieval.GetWebSocketParametersOptions();

    For Each TestParameters In OptionArray Do

        WebSocket_CreateConnection(TestParameters);
        WebSocket_CloseConnection(TestParameters);
        WebSocket_SendPing(TestParameters);
        WebSocket_SendPong(TestParameters);
        WebSocket_GetMessage(TestParameters);
        WebSocket_SendTextMessage(TestParameters);
        WebSocket_SendBinaryMessage(TestParameters);
        WebSocket_GetTlsSettings(TestParameters);
        WebSocket_GetProxySettings(TestParameters);
        WebSocket_GetClientLog(TestParameters);
        WebSocket_IsClientObject(TestParameters);

    EndDo;

EndProcedure

Procedure WS_Server() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;

    WebSocket_StartServer(TestParameters);
    WebSocket_StopServer(TestParameters);
    WebSocket_GetNextConnectionData(TestParameters);
    WebSocket_GetConnectionData(TestParameters);
    WebSocket_SendData(TestParameters);
    WebSocket_CloseIncomingConnection(TestParameters);
    WebSocket_GetConnectionList(TestParameters);
    WebSocket_IsServerObject(TestParameters);
    WebSocket_GetLog(TestParameters);
    WebSocket_GetLoggingSettings(TestParameters);

EndProcedure

#EndRegion // WebSocket

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region WebSocket

Procedure WebSocket_CreateConnection(FunctionParameters)

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Result = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

    // END

    Postfix = FunctionParameters["Postfix"];
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CreateConnection", Postfix);

    If OPI_WebSocket.IsClientObject(Result) Then
        OPI_WebSocket.CloseConnection(Result);
    EndIf;

EndProcedure

Procedure WebSocket_CloseConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

    OPI_TestDataRetrieval.ProcessCLI(Connection, "WebSocket", "CloseConnection", "Openning, " + Postfix); // SKIP

    If OPI_WebSocket.IsClientObject(Connection) Then
        Result = OPI_WebSocket.CloseConnection(Connection);
    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseConnection", Postfix);

EndProcedure

Procedure WebSocket_SendPing(FunctionParameters)

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

    If OPI_WebSocket.IsClientObject(Connection) Then

        Result = OPI_WebSocket.SendPing(Connection);

        While True Do

            LastMessage = OPI_WebSocket.GetMessage(Connection, 3000);

            If LastMessage["result"] Then
                Check = LastMessage;
            Else
                Break;
            EndIf;

        EndDo;

    Else
        Result = Connection;
        Check  = Connection;
    EndIf;

    // END

    Postfix = FunctionParameters["Postfix"];
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "SendPing", Postfix);
    OPI_TestDataRetrieval.ProcessCLI(Check , "WebSocket", "SendPing", "Check, " + Postfix);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_SendPong(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

    If OPI_WebSocket.IsClientObject(Connection) Then
        Result = OPI_WebSocket.SendPong(Connection);
    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "SendPong", Postfix);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_GetMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

    Message = "echo-text-" + Format(CurrentDate(), "DF=yyyyMMddhhmmss");

    If OPI_WebSocket.IsClientObject(Connection) Then

        // ECHO
        Sending = OPI_WebSocket.SendTextMessage(Connection, Message);

        OPI_TestDataRetrieval.ProcessCLI(Sending, "WebSocket", "GetMessage", "Sending, " + Postfix); // SKIP

        While True Do

            LastMessage = OPI_WebSocket.GetMessage(Connection, 3000); // <----

            If LastMessage["result"] Then
                Result = LastMessage;
            Else
                Break;
            EndIf;

        EndDo;

    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetMessage", Postfix, Message);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_SendTextMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

    Message = "echo-text-" + Format(CurrentDate(), "DF=yyyyMMddhhmmss");

    If OPI_WebSocket.IsClientObject(Connection) Then

        Result = OPI_WebSocket.SendTextMessage(Connection, Message);

    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "SendTextMessage", Postfix);

    While True Do

        LastMessage = OPI_WebSocket.GetMessage(Connection, 3000);

        If LastMessage["result"] Then
            Check = LastMessage;
        Else
            Break;
        EndIf;

    EndDo;

    OPI_TestDataRetrieval.ProcessCLI(Check , "WebSocket", "SendTextMessage", "Check, " + Postfix, Message);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_SendBinaryMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

    SourceString = "binary-message-" + Format(CurrentDate(), "DF=yyyyMMddhhmmss");
    Data = GetBinaryDataFromString(SourceString);

    If OPI_WebSocket.IsClientObject(Connection) Then
        Result = OPI_WebSocket.SendBinaryMessage(Connection, Data);
    Else
        Result = Connection;
    EndIf;

    // END

    While True Do

        LastMessage = OPI_WebSocket.GetMessage(Connection, 3000);

        If LastMessage["result"] Then
            Check = LastMessage;
        Else
            Break;
        EndIf;

    EndDo;

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "SendBinaryMessage", Postfix);
    OPI_TestDataRetrieval.ProcessCLI(Check , "WebSocket", "SendBinaryMessage", "Check, " + Postfix, SourceString);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_GetTlsSettings(FunctionParameters)

    Result = OPI_WebSocket.GetTlsSettings(True);

    // END

    Postfix = FunctionParameters["Postfix"];

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetTlsSettings", Postfix);

EndProcedure

Procedure WebSocket_GetProxySettings(FunctionParameters)

    ProxyType = FunctionParameters["Proxy_Type"];

    ProxyAddress  = FunctionParameters["Proxy_IP"];
    ProxyPort     = FunctionParameters["Proxy_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Result = OPI_WebSocket.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetProxySettings");

EndProcedure

Procedure WebSocket_GetClientLog(FunctionParameters)

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_WebSocket.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_WebSocket.GetLoggingSettings(True, 100, LogFile);
    Connection      = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Undefined, LoggingSettings);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_WebSocket.IsClientObject(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Result = OPI_WebSocket.GetLog(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", , LogFile);

    Result = OPI_WebSocket.GetLog(Connection, True);
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", "AsString", LogFile);

    OPI_WebSocket.CloseConnection(Connection);

EndProcedure

Procedure WebSocket_IsClientObject(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    NeedProxy = True;
    NeedTLS   = True;
    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If NeedProxy Then

        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);

    EndIf;

    Connection = OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);
    Result     = OPI_WebSocket.IsClientObject(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsClientObject", Postfix);

    Result = OPI_WebSocket.IsClientObject("not-a-client");
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsClientObject", "False, " + Postfix);

    If OPI_WebSocket.IsClientObject(Result) Then
        OPI_WebSocket.CloseConnection(Result);
    EndIf;

EndProcedure

Procedure WebSocket_StartServer(FunctionParameters)

    Port     = 9886;
    PoolSize = 10;

    Result = OPI_WebSocket.StartServer(Port, PoolSize);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "StartServer");

    OPI_WebSocket.StopServer(Result);

EndProcedure

Procedure WebSocket_StopServer(FunctionParameters)

    Port = 9887;
    Host = OPI_WebSocket.StartServer(Port);

    Result = OPI_WebSocket.StopServer(Host);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "StopServer");

    ListResult = OPI_WebSocket.GetConnectionList(Host);

    OPI_TestDataRetrieval.ProcessCLI(ListResult, "WebSocket", "StopServer", "List");

    Address = "ws://127.0.0.1:9887";
    Client  = OPI_WebSocket.CreateConnection(Address);

    OPI_TestDataRetrieval.ProcessCLI(Client, "WebSocket", "StopServer", "Connection");

EndProcedure

Procedure WebSocket_GetNextConnectionData(FunctionParameters)

    LaunchPort   = 9888;
    ServerObject = OPI_WebSocket.StartServer(LaunchPort);

    ConnectionAddress = "ws://127.0.0.1:9888";
    ClientObject      = OPI_WebSocket.CreateConnection(ConnectionAddress);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    Else
        Message = "Hello from client!";
        Sending = OPI_WebSocket.SendTextMessage(ClientObject, Message);
    EndIf;

    Result = OPI_WebSocket.GetNextConnectionData(ServerObject, 5000);

    // END

    OPI_WebSocket.CloseConnection(ClientObject);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetNextConnectionData", , Message);

    OPI_WebSocket.SendTextMessage(ClientObject, Message);
    OPI_WebSocket.CloseConnection(ClientObject);

    Result = OPI_WebSocket.GetNextConnectionData(ServerObject, 5000);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetNextConnectionData", "Closed", Message);

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_GetConnectionData(FunctionParameters)

    LaunchPort   = 9889;
    ServerObject = OPI_WebSocket.StartServer(LaunchPort);

    ConnectionAddress = "ws://127.0.0.1:9889";
    ClientObject      = OPI_WebSocket.CreateConnection(ConnectionAddress);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_Tools.Pause(1); // SKIP

    ConnectionList = OPI_WebSocket.GetConnectionList(ServerObject);

    If Not ConnectionList["result"] Then
        Raise OPI_Tools.JSONString(ConnectionList);
    EndIf;

    If ConnectionList["connections"].Count() = 0 Then
        Raise "Connection list is empty";
    Else
        ConnectionID                         = ConnectionList["connections"][0]["connectionId"];
    EndIf;

    For N = 0 To 5 Do

        CurrentMessage = StrTemplate("Message no. %1", N);
        OPI_WebSocket.SendTextMessage(ClientObject, CurrentMessage);

        Result = OPI_WebSocket.GetConnectionData(ServerObject, ConnectionID, 5000);

        OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionData", , CurrentMessage); // SKIP

    EndDo;

    // END

    OPI_WebSocket.SendTextMessage(ClientObject, CurrentMessage);
    OPI_WebSocket.CloseConnection(ClientObject);

    Result = OPI_WebSocket.GetConnectionData(ServerObject, ConnectionID, 5000);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionData", "Closed", CurrentMessage);

    OPI_WebSocket.GetConnectionData(ServerObject, ConnectionID, 5000);
    Result = OPI_WebSocket.GetConnectionList(ServerObject);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionData", "EmptyList");

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_SendData(FunctionParameters)

    LaunchPort   = 9890;
    ServerObject = OPI_WebSocket.StartServer(LaunchPort);

    ConnectionAddress = "ws://127.0.0.1:9890";
    ClientObject      = OPI_WebSocket.CreateConnection(ConnectionAddress);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = "Hello!";

    OPI_WebSocket.SendTextMessage(ClientObject, Message);

    NextMessage  = OPI_WebSocket.GetNextConnectionData(ServerObject, 5000);
    ConnectionID = NextMessage["connectionId"];

    ServerResponse = "Response from server!";
    Result         = OPI_WebSocket.SendData(ServerObject, ConnectionID, ServerResponse);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "SendData");

    ClientResponse = OPI_WebSocket.GetMessage(ClientObject, 3000);

    OPI_TestDataRetrieval.ProcessCLI(ClientResponse, "WebSocket", "SendData", "Check", ServerResponse);

    OPI_WebSocket.CloseConnection(ClientObject);
    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_CloseIncomingConnection(FunctionParameters)

    LaunchPort   = 9891;
    ServerObject = OPI_WebSocket.StartServer(LaunchPort);

    ConnectionAddress = "ws://127.0.0.1:9891";
    ClientObject      = OPI_WebSocket.CreateConnection(ConnectionAddress);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = "Hello!";

    OPI_WebSocket.SendTextMessage(ClientObject, Message);

    FirstMessage = OPI_WebSocket.GetNextConnectionData(ServerObject, 5000);
    ConnectionID = FirstMessage["connectionId"];

    Result = OPI_WebSocket.CloseIncomingConnection(ServerObject, ConnectionID, True);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseIncomingConnection");

    Result = OPI_WebSocket.GetConnectionList(ServerObject);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseIncomingConnection", "EmptyList");

    OPI_WebSocket.SendTextMessage(ClientObject, Message);
    Result = OPI_WebSocket.SendTextMessage(ClientObject, Message);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseIncomingConnection", "SendingToClosed");

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_GetConnectionList(FunctionParameters)

    LaunchPort   = 9892;
    ServerObject = OPI_WebSocket.StartServer(LaunchPort);

    ConnectionAddress = "ws://127.0.0.1:9892";

    Client1 = OPI_WebSocket.CreateConnection(ConnectionAddress);
    Client2 = OPI_WebSocket.CreateConnection(ConnectionAddress);

    If Not OPI_WebSocket.IsClientObject(Client1) Then
        Raise OPI_Tools.JSONString(Client1);
    EndIf;

    If Not OPI_WebSocket.IsClientObject(Client2) Then
        Raise OPI_Tools.JSONString(Client2);
    EndIf;

    Result = OPI_WebSocket.GetConnectionList(ServerObject);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionList");

    OPI_WebSocket.CloseConnection(Client1);
    OPI_WebSocket.CloseConnection(Client2);

    Client3 = OPI_WebSocket.CreateConnection(ConnectionAddress);
    Client4 = OPI_WebSocket.CreateConnection(ConnectionAddress);

    OPI_WebSocket.SendTextMessage(Client3, "Yo");

    OPI_WebSocket.CloseConnection(Client3);
    OPI_WebSocket.CloseConnection(Client4);

    Result = OPI_WebSocket.GetConnectionList(ServerObject);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionList", "Closing");

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_IsServerObject(FunctionParameters)

    Port = 9893;
    Host = OPI_WebSocket.StartServer(Port);

    Result = OPI_WebSocket.IsServerObject(Host);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsServerObject");

    OPI_WebSocket.StopServer(Host);

    Result = OPI_WebSocket.IsServerObject("Not a server");

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsServerObject", "False");

EndProcedure

Procedure WebSocket_GetLog(FunctionParameters)

    LaunchPort      = 9894;
    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_WebSocket.GetLoggingSettings(True, 100, LogFile);
    ServerObject    = OPI_WebSocket.StartServer(LaunchPort, , LoggingSettings);

    ConnectionAddress = "ws://127.0.0.1:9894";
    ClientObject      = OPI_WebSocket.CreateConnection(ConnectionAddress);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Result = OPI_WebSocket.GetLog(ServerObject);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", , LogFile);

    Result = OPI_WebSocket.GetLog(ServerObject, True);
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", "AsString", LogFile);

    OPI_WebSocket.CloseConnection(ClientObject);
    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_GetLoggingSettings(FunctionParameters)

    Result = OPI_WebSocket.GetLoggingSettings(True, 100, GetTempFileName());

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLoggingSettings");

    Result = OPI_WebSocket.GetLoggingSettings(False, , GetTempFileName());

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLoggingSettings", "File");

    Result = OPI_WebSocket.GetLoggingSettings(True);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLoggingSettings", "Memory");

EndProcedure

#EndRegion // WebSocket

#EndRegion // AtomicTests

#Region AdditionalFunctions

Function CreateWebSocketClient(FunctionParameters)

    Address = GetWebSocketAddress(FunctionParameters);

    TLSSettings   = Undefined;
    ProxySettings = Undefined;

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If FunctionParameters["TLS"] Then
        TLSSettings = OPI_WebSocket.GetTlsSettings(True);
    EndIf;

    If FunctionParameters["Proxy"] Then
        ProxySettings = OPI_AddIns.GetProxySettings(
            FunctionParameters["Proxy_IP"],
            FunctionParameters["Proxy_Port"],
            FunctionParameters["Proxy_Type"],
            FunctionParameters["Proxy_User"],
            FunctionParameters["Proxy_Password"]);
    EndIf;

    Return OPI_WebSocket.CreateConnection(Address, TLSSettings, ProxySettings, Headers);

EndFunction

Function GetWebSocketAddress(FunctionParameters)

    Scheme = ?(FunctionParameters["TLS"], "wss://", "ws://");
    Host   = FunctionParameters["WS_IP"];
    Port   = FunctionParameters["WS_Port"];

    OPI_TypeConversion.GetLine(Port);

    Return StrTemplate("%1%2:%3", Scheme, Host, Port);

EndFunction

#EndRegion // AdditionalFunctions

#EndRegion // Private

#Region Alternate

Procedure WS_Клиент() Export
    WS_Client();
EndProcedure

Procedure WS_Сервер() Export
    WS_Server();
EndProcedure

#EndRegion
