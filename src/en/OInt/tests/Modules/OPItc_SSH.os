// OneScript: ./OInt/tests/Modules/OPItc_SSH.os

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

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("SSH");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("SSH");

EndFunction

#Region Internal

#Region RunnableTests

#Region SSH

Procedure SShell_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SSH_CreateConnection(TestParameters);
        SSH_GetConnectionConfiguration(TestParameters);
        SSH_ExecuteCommand(TestParameters);
        SSH_CloseConnection(TestParameters);
        SSH_IsConnector(TestParameters);
        SSH_GetSettingsLoginPassword(TestParameters);
        SSH_GetSettingsPrivateKey(TestParameters);
        SSH_GetSettingsViaAgent(TestParameters);
        SSH_GetSettingsKI(TestParameters);
        SSH_GetProxySettings(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

#EndRegion // SSH

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region SSH

Procedure SSH_CreateConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        Options = New Structure;
        Options.Insert("host", Host);
        Options.Insert("port", Port);
        Options.Insert("user", Login);
        Options.Insert("pass", Password);

        SSHSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetProxySettings", Options);

    EndIf;

    Result = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "CreateConnection", Postfix);

EndProcedure

Procedure SSH_ExecuteCommand(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        Options = New Structure;
        Options.Insert("host", Host);
        Options.Insert("port", Port);
        Options.Insert("user", Login);
        Options.Insert("pass", Password);

        SSHSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);

    If OPI_SSH.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("comm", "whoami");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "ExecuteCommand", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "ExecuteCommand", Postfix);

EndProcedure

Procedure SSH_GetConnectionConfiguration(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        Options = New Structure;
        Options.Insert("host", Host);
        Options.Insert("port", Port);
        Options.Insert("user", Login);
        Options.Insert("pass", Password);

        SSHSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetProxySettings", Options);

    EndIf;

    Options = New Structure;
    Options.Insert("set", SSHSettings);
    Options.Insert("proxy", ProxySettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetConnectionConfiguration", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "GetConnectionConfiguration", Postfix);

    Options = New Structure;
    Options.Insert("conn", Result);
    Options.Insert("comm", "whoami");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "ExecuteCommand", Options);

    OPI_TestDataRetrieval.Process(Result, "SSH", "GetConnectionConfiguration", "Check, " + Postfix);

EndProcedure

Procedure SSH_CloseConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        Options = New Structure;
        Options.Insert("host", Host);
        Options.Insert("port", Port);
        Options.Insert("user", Login);
        Options.Insert("pass", Password);

        SSHSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);

    If OPI_SSH.IsConnector(Connection) Then
        Result = OPI_SSH.CloseConnection(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "CloseConnection", Postfix);

EndProcedure

Procedure SSH_IsConnector(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host = FunctionParameters["SSH_Host"];
    Port = FunctionParameters["SSH_Port"];

    UseProxy          = True;
    ProxySettings     = Undefined;
    AuthorizationType = "By login and password";

    UseProxy          = FunctionParameters["Proxy"]; // SKIP
    AuthorizationType = FunctionParameters["AuthType"]; // SKIP

    If AuthorizationType = "By login and password" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        Options = New Structure;
        Options.Insert("host", Host);
        Options.Insert("port", Port);
        Options.Insert("user", Login);
        Options.Insert("pass", Password);

        SSHSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SSHSettings = OPI_SSH.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = 2223; // SKIP

        SSHSettings = OPI_SSH.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login       = FunctionParameters["SSH_User"];
        SSHSettings = OPI_SSH.GetSettingsViaAgent(Host, Port, Login);

    EndIf;

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SSH.CreateConnection(SSHSettings, ProxySettings);
    Result     = OPI_SSH.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "IsConnector", Postfix);

    Result = OPI_SSH.IsConnector("a");

    OPI_TestDataRetrieval.Process(Result, "SSH", "IsConnector", "Error, " + Postfix);

EndProcedure

Procedure SSH_GetSettingsLoginPassword(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["SSH_Host"];
    Port     = FunctionParameters["SSH_Port"];
    Login    = FunctionParameters["SSH_User"];
    Password = FunctionParameters["SSH_Password"];

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("user", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsLoginPassword", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "GetSettingsLoginPassword", Postfix);

EndProcedure

Procedure SSH_GetSettingsPrivateKey(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host       = FunctionParameters["SSH_Host"];
    Port       = FunctionParameters["SSH_Port"];
    Login      = FunctionParameters["SSH_User"];
    PrivateKey = "./ssh_key";
    PublicKey  = "./ssh_key.pub";

    PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
    PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("user", Login);
    Options.Insert("key", PrivateKey);
    Options.Insert("pub", PublicKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsPrivateKey", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "GetSettingsPrivateKey", Postfix);

EndProcedure

Procedure SSH_GetSettingsViaAgent(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host   = FunctionParameters["SSH_Host"];
    Port   = FunctionParameters["SSH_Port"];
    Login  = FunctionParameters["SSH_User"];
    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("user", Login);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsViaAgent", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "GetSettingsViaAgent", Postfix);

EndProcedure

Procedure SSH_GetSettingsKI(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["SSH_Host"];
    Port     = FunctionParameters["SSH_Port"];
    Login    = FunctionParameters["SSH_User"];
    Password = FunctionParameters["SSH_Password"];

    AnswersArray = New Array;
    AnswersArray.Add("yes");
    AnswersArray.Add(Password);

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("user", Login);
    Options.Insert("prompts", AnswersArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetSettingsKI", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "GetSettingsKI", Postfix);

EndProcedure

Procedure SSH_GetProxySettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "GetProxySettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "SSH", "GetProxySettings", Postfix);

EndProcedure

#EndRegion // SSH

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure SShell_ОсновныеМетоды() Export
    SShell_CommonMethods();
EndProcedure

#EndRegion
