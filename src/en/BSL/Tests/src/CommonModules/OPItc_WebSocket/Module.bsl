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

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
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
        WebSocket_IsClientObject(TestParameters);

    EndDo;

EndProcedure

#EndRegion // WebSocket

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region WebSocket

Procedure WebSocket_CreateConnection(FunctionParameters)

    Address    = "wss://127.0.0.1:8443";
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
    OPI_TestDataRetrieval.Process(Result, "WebSocket", "CreateConnection", Postfix);

    If OPI_WebSocket.IsClientObject(Result) Then
        OPI_WebSocket.CloseConnection(Result);
    EndIf;

EndProcedure

Procedure WebSocket_CloseConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address    = "wss://127.0.0.1:8443";
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

    OPI_TestDataRetrieval.Process(Connection, "WebSocket", "CloseConnection", "Openning, " + Postfix); // SKIP

    If OPI_WebSocket.IsClientObject(Connection) Then
        Result = OPI_WebSocket.CloseConnection(Connection);
    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "WebSocket", "CloseConnection", Postfix);

EndProcedure

Procedure WebSocket_SendPing(FunctionParameters)

    Address    = "wss://127.0.0.1:8443";
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
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendPing", Options);

        While True Do

            LastMessage = OPI_WebSocket.GetMessage(Connection, 3000);

            If LastMessage["result"] Then
                Check = OPI_WebSocket.GetMessage(Connection, 3000);
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
    OPI_TestDataRetrieval.Process(Result, "WebSocket", "SendPing", Postfix);
    OPI_TestDataRetrieval.Process(Check , "WebSocket", "SendPing", "Check, " + Postfix);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_SendPong(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address    = "wss://127.0.0.1:8443";
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
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendPong", Options);
    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "WebSocket", "SendPong", Postfix);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_GetMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address    = "wss://127.0.0.1:8443";
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
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("text", Message);

        Sending = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendTextMessage", Options);

        OPI_TestDataRetrieval.Process(Sending, "WebSocket", "GetMessage", "Sending, " + Postfix); // SKIP

        While True Do

            LastMessage = OPI_WebSocket.GetMessage(Connection, 3000);

            If LastMessage["result"] Then
                Result = OPI_WebSocket.GetMessage(Connection, 3000); // <----
            Else
                Break;
            EndIf;

        EndDo;

    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "WebSocket", "GetMessage", Postfix, Message);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_SendTextMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address    = "wss://127.0.0.1:8443";
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

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("text", Message);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ws", "SendTextMessage", Options);

    Else
        Result = Connection;
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "WebSocket", "SendTextMessage", Postfix);

    While True Do

        LastMessage = OPI_WebSocket.GetMessage(Connection, 3000);

        If LastMessage["result"] Then
            Check = OPI_WebSocket.GetMessage(Connection, 3000);
        Else
            Break;
        EndIf;

    EndDo;

    OPI_TestDataRetrieval.Process(Check , "WebSocket", "SendTextMessage", "Check, " + Postfix, Message);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_SendBinaryMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address    = "wss://127.0.0.1:8443";
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
            Check = OPI_WebSocket.GetMessage(Connection, 3000);
        Else
            Break;
        EndIf;

    EndDo;

    OPI_TestDataRetrieval.Process(Result, "WebSocket", "SendBinaryMessage", Postfix);
    OPI_TestDataRetrieval.Process(Check , "WebSocket", "SendBinaryMessage", "Check, " + Postfix, SourceString);

    If OPI_WebSocket.IsClientObject(Connection) Then
        OPI_WebSocket.CloseConnection(Connection);
    EndIf;

EndProcedure

Procedure WebSocket_GetTlsSettings(FunctionParameters)

    Result = OPI_WebSocket.GetTlsSettings(True);

    // END

    Postfix = FunctionParameters["Postfix"];

    OPI_TestDataRetrieval.Process(Result, "WebSocket", "GetTlsSettings", Postfix);

EndProcedure

Procedure WebSocket_IsClientObject(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Address    = "wss://127.0.0.1:8443";
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

    OPI_TestDataRetrieval.Process(Result, "WebSocket", "IsClientObject", Postfix);

    Result = OPI_WebSocket.IsClientObject("not-a-client");
    OPI_TestDataRetrieval.Process(Result, "WebSocket", "IsClientObject", "False, " + Postfix);

    If OPI_WebSocket.IsClientObject(Result) Then
        OPI_WebSocket.CloseConnection(Result);
    EndIf;

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

#EndRegion
