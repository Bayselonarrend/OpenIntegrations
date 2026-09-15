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

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use "../../formats"
//#Use asserts
//#Use "internal"

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

Procedure WS_ExtendedCheck() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;

    WebSocket_Extended_GetDataOfNextTimeout(TestParameters);
    WebSocket_Extended_OperationWithoutStart(TestParameters);
    WebSocket_Extended_GetLogOnServerStart(TestParameters);

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

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

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

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(Connection, "WebSocket", "CloseConnection", "Openning, " + Postfix); // SKIP

    If OPI_WebSocket.IsClientObject(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CloseConnection", Options);
    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseConnection", Postfix);

EndProcedure

Procedure WebSocket_SendPing(FunctionParameters)

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If OPI_WebSocket.IsClientObject(Connection) Then

        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendPing", Options);

        // Skipping all responses from the server until the last one
        While True Do

            LastMessage = OPI_WebSocket.GetMessage(Connection, 3000);

            If LastMessage["result"] Then
                // Next message
                Check = LastMessage;
            Else
                // No more messages
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

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If OPI_WebSocket.IsClientObject(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendPong", Options);
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

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    Message = "echo-text-" + Format(CurrentDate(), "DF=yyyyMMddhhmmss");

    If OPI_WebSocket.IsClientObject(Connection) Then

        // Sending a message to the ECHO server
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("text", Message);

        Sending = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendTextMessage", Options);

        OPI_TestDataRetrieval.ProcessCLI(Sending, "WebSocket", "GetMessage", "Sending, " + Postfix); // SKIP

        // Skipping all responses from the server until the last one
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

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    Message = "echo-text-" + Format(CurrentDate(), "DF=yyyyMMddhhmmss");

    If OPI_WebSocket.IsClientObject(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("text", Message);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendTextMessage", Options);
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

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    SourceLine = "binary-message-" + Format(CurrentDate(), "DF=yyyyMMddhhmmss");
    Data = GetBinaryDataFromString(SourceLine);

    If OPI_WebSocket.IsClientObject(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("data", Data);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendBinaryMessage", Options);
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
    OPI_TestDataRetrieval.ProcessCLI(Check , "WebSocket", "SendBinaryMessage", "Check, " + Postfix, SourceLine);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_GetTlsSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);

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

    Options = New Structure;
    Options.Insert("addr", ProxyAddress);
    Options.Insert("port", ProxyPort);
    Options.Insert("type", ProxyType);
    Options.Insert("login", ProxyLogin);
    Options.Insert("pass", ProxyPassword);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetProxySettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetProxySettings");

EndProcedure

Procedure WebSocket_GetClientLog(FunctionParameters)

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLoggingSettings", Options);
    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Неопределено);
    Options.Insert("log", LoggingSettings);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_WebSocket.IsClientObject(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Options = New Structure;
    Options.Insert("srv", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", , LogFile);

    Options = New Structure;
    Options.Insert("srv", Connection);
    Options.Insert("str", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLog", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", "AsString", LogFile);

    OPI_WebSocket.CloseConnection(Connection);

EndProcedure

Procedure WebSocket_IsClientObject(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address = "wss://127.0.0.1:8443";
    Address = GetWebSocketAddress(FunctionParameters); // SKIP

    TLSSettings   = Undefined; // SKIP
    ProxySettings = Undefined; // SKIP

    NeedProxy = True;
    NeedTLS   = True;

    NeedProxy = FunctionParameters["Proxy"]; // SKIP
    NeedTls   = FunctionParameters["TLS"]; // SKIP

    Headers = New Map;
    Headers.Insert("X-Trace-Id", "OPI-WS-TEST");

    If NeedTls Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetTlsSettings", Options);
    EndIf;

    If NeedProxy Then

        ProxyAddress = FunctionParameters["Proxy_IP"];
        ProxyPort    = FunctionParameters["Proxy_Port"];
        ProxyType    = FunctionParameters["Proxy_Type"];

        ProxtUser     = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_AddIns.GetProxySettings(ProxyAddress
            , ProxyPort
            , ProxyType
            , ProxtUser
            , ProxyPassword);

    EndIf;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("tls", TLSSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("headers", Headers);

    Connection = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);
    Options = New Structure;
    Options.Insert("value", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "IsClientObject", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsClientObject", Postfix);

    Options = New Structure;
    Options.Insert("value", "not-a-client");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "IsClientObject", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsClientObject", "False, " + Postfix);

    If OPI_WebSocket.IsClientObject(Result) Then
        OPI_WebSocket.CloseConnection(Result);
    EndIf;

EndProcedure

Procedure WebSocket_StartServer(FunctionParameters)

    Port     = 9894;
    PoolSize = 10;

    Options = New Structure;
    Options.Insert("port", Port);
    Options.Insert("psize", PoolSize);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "StartServer");

    OPI_WebSocket.StopServer(Result);

EndProcedure

Procedure WebSocket_StopServer(FunctionParameters)

    Port         = 9894;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StopServer", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "StopServer");

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    ListResult = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(ListResult, "WebSocket", "StopServer", "List");

    Address      = "ws://127.0.0.1:9894";
    Options = New Structure;
    Options.Insert("address", Address);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    OPI_TestDataRetrieval.ProcessCLI(ClientObject, "WebSocket", "StopServer", "Connection");

EndProcedure

Procedure WebSocket_GetNextConnectionData(FunctionParameters)

    // Server start
    LaunchPort = 9894;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    // Client connect to server
    ConnectionAddress = "ws://127.0.0.1:9894";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    Else
        // Client send
        Message = "Hello from client!";
        Sending = OPI_WebSocket.SendTextMessage(ClientObject, Message);
    EndIf;

    // Server receive
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetNextConnectionData", Options);

    // END

    OPI_WebSocket.CloseConnection(ClientObject);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetNextConnectionData", , Message);

    OPI_WebSocket.SendTextMessage(ClientObject, Message);
    OPI_WebSocket.CloseConnection(ClientObject);

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetNextConnectionData", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetNextConnectionData", "Closed", Message);

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_GetConnectionData(FunctionParameters)

    // Server start
    LaunchPort = 9894;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    // Client connect to server
    ConnectionAddress = "ws://127.0.0.1:9894";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    OPI_Tools.Pause(1); // SKIP

    // Getting a list of active connections on the server
    Options = New Structure;
    Options.Insert("srv", ServerObject);

    ConnectionList = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetConnectionList", Options);

    If Not ConnectionList["result"] Then
        Raise OPI_Tools.JSONString(ConnectionList);
    EndIf;

    If ConnectionList["connections"].Count() = 0 Then
        Raise "Connection list is empty";
    Else
        ConnectionID                         = ConnectionList["connections"][0]["connectionId"];
    EndIf;

    For N = 0 To 5 Do

        // Client message send
        CurrentMessage = StrTemplate("Message no. %1", N);
        OPI_WebSocket.SendTextMessage(ClientObject, CurrentMessage);

        // Receiving an incoming message on the server by ID
        Result = OPI_WebSocket.GetConnectionData(ServerObject, ConnectionID, 5000);

        OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionData", , CurrentMessage); // SKIP

    EndDo;

    // END

    OPI_WebSocket.SendTextMessage(ClientObject, CurrentMessage);
    OPI_WebSocket.CloseConnection(ClientObject);

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);
    Options.Insert("tout", 5000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetConnectionData", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionData", "Closed", CurrentMessage);

    OPI_WebSocket.GetConnectionData(ServerObject, ConnectionID, 5000);
    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionData", "EmptyList");

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_SendData(FunctionParameters)

    // Server start
    LaunchPort = 9894;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    // Client connect to server
    ConnectionAddress = "ws://127.0.0.1:9894";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    // Client message send
    Message = "Hello!";
    OPI_WebSocket.SendTextMessage(ClientObject, Message);

    // Receiving the next connection on the server and returning a response
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);

    NextMessage = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetNextConnectionData", Options);
    ConnectionID = NextMessage["connectionId"];

    ServerResponse = "Response from server!";
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);
    Options.Insert("data", ServerResponse);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "SendData");

    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("tout", 3000);

    ClientResponse = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(ClientResponse, "WebSocket", "SendData", "Check", ServerResponse);

    OPI_WebSocket.CloseConnection(ClientObject);
    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_CloseIncomingConnection(FunctionParameters)

    // Server start
    LaunchPort = 9894;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    // Client connect to server
    ConnectionAddress = "ws://127.0.0.1:9894";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    // Client message send
    Message = "Hello!";
    OPI_WebSocket.SendTextMessage(ClientObject, Message);

    // Receiving and closing connection on the server
    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 5000);

    FirstMessage = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetNextConnectionData", Options);
    ConnectionID = FirstMessage["connectionId"];

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("id", ConnectionID);
    Options.Insert("rm", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CloseIncomingConnection", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseIncomingConnection");

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseIncomingConnection", "EmptyList");

    OPI_WebSocket.SendTextMessage(ClientObject, Message);
    Options = New Structure;
    Options.Insert("conn", ClientObject);
    Options.Insert("text", Message);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "CloseIncomingConnection", "SendingToClosed");

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_GetConnectionList(FunctionParameters)

    // Server start
    LaunchPort = 9894;
    Options = New Structure;
    Options.Insert("port", LaunchPort);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    // Creating multiple client connections
    ConnectionAddress = "ws://127.0.0.1:9894";

    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client1 = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client2 = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If Not OPI_WebSocket.IsClientObject(Client1) Then
        Raise OPI_Tools.JSONString(Client1);
    EndIf;

    If Not OPI_WebSocket.IsClientObject(Client2) Then
        Raise OPI_Tools.JSONString(Client2);
    EndIf;

    // Getting a list of active connections on the server
    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetConnectionList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionList");

    OPI_WebSocket.CloseConnection(Client1);
    OPI_WebSocket.CloseConnection(Client2);

    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client3 = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    Client4 = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    OPI_WebSocket.SendTextMessage(Client3, "Yo");

    OPI_WebSocket.CloseConnection(Client3);
    OPI_WebSocket.CloseConnection(Client4);

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetConnectionList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetConnectionList", "Closing");

    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_IsServerObject(FunctionParameters)

    Port = 9894;
    Options = New Structure;
    Options.Insert("port", Port);

    Host = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    Options = New Structure;
    Options.Insert("value", Host);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "IsServerObject", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsServerObject");

    OPI_WebSocket.StopServer(Host);

    Options = New Structure;
    Options.Insert("value", "Not a server");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "IsServerObject", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "IsServerObject", "False");

EndProcedure

Procedure WebSocket_GetLog(FunctionParameters)

    // Server start
    LaunchPort = 9894;
    LogFile = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLoggingSettings", Options);
    Options = New Structure;
    Options.Insert("port", LaunchPort);
    Options.Insert("log", LoggingSettings);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    // Client connect to server
    ConnectionAddress = "ws://127.0.0.1:9894";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);
    OPI_Tools.Pause(1); // SKIP

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    // Server log retrieval
    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", , LogFile);

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("str", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLog", Options);
    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLog", "AsString", LogFile);

    OPI_WebSocket.CloseConnection(ClientObject);
    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_GetLoggingSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLoggingSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLoggingSettings");

    Options = New Structure;
    Options.Insert("memory", Ложь);
    Options.Insert("path", GetTempFileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLoggingSettings", "File");

    Options = New Structure;
    Options.Insert("memory", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLoggingSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "GetLoggingSettings", "Memory");

EndProcedure

#Region ExtendedCheck

Procedure WebSocket_Extended_GetDataOfNextTimeout(FunctionParameters)

    Port         = 9893;
    Options = New Structure;
    Options.Insert("port", Port);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    If Not OPI_WebSocket.IsServerObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 300);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetNextConnectionData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "Extended_GetDataOfNextTimeout");
    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

Procedure WebSocket_Extended_OperationWithoutStart(FunctionParameters)

    ServerObject = OPI_AddIns.GetAddIn(OPI_WebSocket.AddInName());

    Options = New Structure;
    Options.Insert("srv", ServerObject);
    Options.Insert("tout", 300);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetNextConnectionData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "Extended_OperationWithoutStart");

EndProcedure

Procedure WebSocket_Extended_GetLogOnServerStart(FunctionParameters)

    Port            = 9893;
    LogFile         = GetTempFileName("txt");
    Options = New Structure;
    Options.Insert("memory", Истина);
    Options.Insert("count", 100);
    Options.Insert("path", LogFile);

    LoggingSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLoggingSettings", Options);
    Options = New Structure;
    Options.Insert("port", Port);
    Options.Insert("log", LoggingSettings);

    ServerObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "StartServer", Options);

    If Not OPI_WebSocket.IsServerObject(ServerObject) Then
        Raise OPI_Tools.JSONString(ServerObject);
    EndIf;

    ConnectionAddress = "ws://127.0.0.1:9893";
    Options = New Structure;
    Options.Insert("address", ConnectionAddress);

    ClientObject = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "CreateConnection", Options);

    If Not OPI_WebSocket.IsClientObject(ClientObject) Then
        Raise OPI_Tools.JSONString(ClientObject);
    EndIf;

    Message = StrTemplate("WS_LOG_SRV_%1", Format(CurrentDate(), "DF=yyyyMMddhhmmss"));
    OPI_WebSocket.SendTextMessage(ClientObject, Message);
    OPI_WebSocket.GetNextConnectionData(ServerObject, 5000);

    Options = New Structure;
    Options.Insert("srv", ServerObject);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "GetLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "WebSocket", "Extended_GetLogOnServerStart", , LogFile);
    OPI_WebSocket.CloseConnection(ClientObject);
    OPI_WebSocket.StopServer(ServerObject);

EndProcedure

#EndRegion // ExtendedCheck

#EndRegion // WebSocket

#EndRegion // AtomicTests

#Region AdditionalFunctions

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

Procedure WS_РасширеннаяПроверка() Export
    WS_ExtendedCheck();
EndProcedure

#EndRegion
