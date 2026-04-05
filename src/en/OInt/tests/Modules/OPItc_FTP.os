// OneScript: ./OInt/tests/Modules/OPItc_FTP.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("FTP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("FTP");

EndFunction

#Region Internal

#Region RunnableTests

#Region FTP

Procedure FT_DirecotryManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetFTPParameterOptions();

    For Each TestParameters In OptionArray Do

        FTP_ClearDirectory(TestParameters);
        FTP_CreateNewDirectory(TestParameters);
        FTP_GetCurrentDirectory(TestParameters);
        FTP_ChangeCurrentDirectory(TestParameters);
        FTP_ListObjects(TestParameters);
        FTP_DeleteDirectory(TestParameters);

    EndDo;

EndProcedure

Procedure FT_FileOperations() Export

    OptionArray = OPI_TestDataRetrieval.GetFTPParameterOptions();

    For Each TestParameters In OptionArray Do

        FTP_UploadFile(TestParameters);
        FTP_SaveFile(TestParameters);
        FTP_GetFileData(TestParameters);
        FTP_DeleteFile(TestParameters);

    EndDo;

EndProcedure

Procedure FT_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetFTPParameterOptions();

    For Each TestParameters In OptionArray Do

        FTP_CreateConnection(TestParameters);
        FTP_GetWelcomeMessage(TestParameters);
        FTP_GetProtocolFeatureList(TestParameters);
        FTP_GetConnectionConfiguration(TestParameters);
        FTP_CloseConnection(TestParameters);
        FTP_IsConnector(TestParameters);
        FTP_GetConnectionSettings(TestParameters);
        FTP_GetProxySettings(TestParameters);
        FTP_GetTLSSettings(TestParameters);
        FTP_GetObjectSize(TestParameters);
        FTP_UpdatePath(TestParameters);
        FTP_ExecuteCustomCommand(TestParameters);
        FTP_ExecuteArbitraryCommand(TestParameters);
        FTP_Ping(TestParameters);

    EndDo;

EndProcedure

#EndRegion // FTP

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region FTP

Procedure FTP_CreateConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Result = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "CreateConnection", Postfix);

EndProcedure

Procedure FTP_GetWelcomeMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetWelcomeMessage", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetWelcomeMessage", Postfix);

EndProcedure

Procedure FTP_GetConnectionConfiguration(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Options = New Structure;
    Options.Insert("set", FTPSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionConfiguration", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetConnectionConfiguration", Postfix, FunctionParameters);

    Options = New Structure;
    Options.Insert("conn", Result);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetWelcomeMessage", Options);

    OPI_TestDataRetrieval.Process(Check, "FTP", "GetConnectionConfiguration", "Check, " + Postfix);

EndProcedure

Procedure FTP_CloseConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "FTP", "CloseConnection", "Openning, " + Postfix); // SKIP

    Result = OPI_FTP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "CloseConnection", Postfix);

EndProcedure

Procedure FTP_IsConnector(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "FTP", "IsConnector", "Openning, " + Postfix); // SKIP

    Result = OPI_FTP.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "IsConnector", Postfix);

EndProcedure

Procedure FTP_GetConnectionSettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetConnectionSettings", Postfix);

EndProcedure

Procedure FTP_GetProxySettings(FunctionParameters)

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetProxySettings", Postfix);

EndProcedure

Procedure FTP_GetTLSSettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetTLSSettings", Postfix);

EndProcedure

Procedure FTP_CreateNewDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Deletion = OPI_FTP.DeleteDirectory(Connection, "new_dir"); // SKIP
        OPI_TestDataRetrieval.Process(Deletion, "FTP", "CreateNewDirectory", "Deletion, " + Postfix); // SKIP

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "CreateNewDirectory", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "CreateNewDirectory", Postfix, True);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/another_one");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "CreateNewDirectory", Options);

    OPI_TestDataRetrieval.Process(Result, "FTP", "CreateNewDirectory", "Nested, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "second_dir/another_one");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "CreateNewDirectory", Options);

    OPI_TestDataRetrieval.Process(Result, "FTP", "CreateNewDirectory", "Double, " + Postfix);

    OPI_Tools.Pause(5);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir");
    Options.Insert("rcv", Истина);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    OPI_TestDataRetrieval.Process(Check, "FTP", "CreateNewDirectory", "Check 1, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "");
    Options.Insert("rcv", Истина);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    OPI_TestDataRetrieval.Process(Check, "FTP", "CreateNewDirectory", "Check 2, " + Postfix);

EndProcedure

Procedure FTP_ListObjects(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "");
        Options.Insert("rcv", Истина);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "ListObjects", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "Dir1/Dir3/Git-2.50.0-64-bit.exe");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    OPI_TestDataRetrieval.Process(Result, "FTP", "ListObjects", "File, " + Postfix);

EndProcedure

Procedure FTP_UploadFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ImagePath = "C:\pic.png";

    Image = FunctionParameters["Picture"]; // SKIP
    TFN   = GetTempFileName("png"); // SKIP
    CopyFile(Image, TFN); // SKIP
    Image = TFN; // SKIP

    ImageDD = New BinaryData(Image);

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("rtout", 1000);
    Options.Insert("wtout", 1000);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("file", Image);
        Options.Insert("path", "new_dir/pic_from_disk.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UploadFile", Options);
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("file", ImageDD);
        Options.Insert("path", "pic_from_binary.png");

        Result2 = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UploadFile", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "UploadFile", Postfix             , ImageDD.Size());
    OPI_TestDataRetrieval.Process(Result2, "FTP", "UploadFile", "Binary, " + Postfix, ImageDD.Size());

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);
    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "pic_from_binary.png");

    Result2 = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UploadFile", "Size 1, " + Postfix, ImageDD.Size());
    OPI_TestDataRetrieval.Process(Result2, "FTP", "UploadFile", "Size 2, " + Postfix, ImageDD.Size());

    For N = 1 To 5 Do

        Result  = OPI_FTP.UploadFile(Connection, Image, "new_dir/pic_from_disk.png");
        Result2 = OPI_FTP.UploadFile(Connection, ImageDD, "pic_from_binary.png");

        If Not Result["result"] Then
            OPI_TestDataRetrieval.Process(Result, "FTP", "UploadFile", "Multiple, " + Postfix, ImageDD.Size());
        EndIf;

        If Not Result2["result"] Then
            OPI_TestDataRetrieval.Process(Result2, "FTP", "UploadFile", "Multiple, binary, " + Postfix, ImageDD.Size());
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure FTP_DeleteFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "pic_from_binary.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "DeleteFile", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "DeleteFile", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "pic_from_binary.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "DeleteFile", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "DeleteFile", "Nonexistent, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "DeleteFile", "Check, " + Postfix);

EndProcedure

Procedure FTP_DeleteDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir/another_one");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "DeleteDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "DeleteDirectory", Postfix);

EndProcedure

Procedure FTP_ClearDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", ".");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ClearDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "ClearDirectory", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", ".");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "ClearDirectory", "Check, " + Postfix);

EndProcedure

Procedure FTP_GetObjectSize(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir/pic_from_disk.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "GetObjectSize", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/another.bin");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "GetObjectSize", "Nonexistent, " + Postfix);

EndProcedure

Procedure FTP_UpdatePath(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("old", "new_dir/pic_from_disk.png");
        Options.Insert("new", "new_dir/pic_copy.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/pic_copy.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Check, new, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/pic_from_binary.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Check, old, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("old", "new_dir");
    Options.Insert("new", "brand_new_dir");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Directory, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", ".");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "List, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("old", "brand_new_dir");
    Options.Insert("new", "new_dir");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Directory, back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("old", "new_dir/pic_copy.png");
    Options.Insert("new", "new_dir/pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", ".");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "List, back, " + Postfix);

EndProcedure

Procedure FTP_SaveFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Path     = "new_dir/pic_from_disk.png";
        FileName = GetTempFileName("bin");

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", Path);
        Options.Insert("file", FileName);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "SaveFile", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "SaveFile", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", Path);

    Size = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    OPI_TestDataRetrieval.Process(Size, "FTP", "SaveFile", "Size, " + Postfix);

    FileObject = New File(FileName);

    FileSize   = FileObject.Size();
    ResultSize = Result["bytes"];
    CheckSize  = Size["bytes"];

    OPI_TestDataRetrieval.Process(FileSize, "FTP", "SaveFile", "File size, " + Postfix, ResultSize, CheckSize);

    Path = "new_dir/pic_from_disk.png";

    For N = 1 To 5 Do

        Result = OPI_FTP.SaveFile(Connection, Path, FileName);

        If Not Result["result"] Then
            OPI_TestDataRetrieval.Process(Result, "FTP", "SaveFile", "Multiple, " + Postfix);
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(FileName, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure FTP_GetFileData(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Path   = "new_dir/pic_from_disk.png";
        Result = OPI_FTP.GetFileData(Connection, Path);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetFileData", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", Path);

    Size = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    OPI_TestDataRetrieval.Process(Size, "FTP", "GetFileData", "Size, " + Postfix);

    FileSize  = Result.Size();
    CheckSize = Size["bytes"];

    OPI_TestDataRetrieval.Process(FileSize, "FTP", "GetFileData", "File size, " + Postfix, CheckSize);

    Path = "new_dir/pic_from_disk.png";

    For N = 1 To 5 Do

        Result = OPI_FTP.GetFileData(Connection, Path);

        If Not TypeOf(Result) = Type("BinaryData") Then
            OPI_TestDataRetrieval.Process(Result, "FTP", "GetFileData", "Multiple, " + Postfix);
        EndIf;

    EndDo;

EndProcedure

Procedure FTP_Ping(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "Ping", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "Ping", Postfix);

EndProcedure

Procedure FTP_ExecuteCustomCommand(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "UMASK";
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("cmd", CommandText);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ExecuteCustomCommand", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "ExecuteCustomCommand", Postfix);

EndProcedure

Procedure FTP_ExecuteArbitraryCommand(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "PWD";
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("cmd", CommandText);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ExecuteArbitraryCommand", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "ExecuteArbitraryCommand", Postfix);

EndProcedure

Procedure FTP_GetCurrentDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetCurrentDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetCurrentDirectory", Postfix, FunctionParameters);

EndProcedure

Procedure FTP_ChangeCurrentDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Path   = "new_dir";
        Result = OPI_FTP.ChangeCurrentDirectory(Connection, Path);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "ChangeCurrentDirectory", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetCurrentDirectory", Options);

    OPI_TestDataRetrieval.Process(Result, "FTP", "ChangeCurrentDirectory", "Check, " + Postfix, Path);

    Path   = FunctionParameters["FTP_RootPath"];
    Result = OPI_FTP.ChangeCurrentDirectory(Connection, Path);

    OPI_TestDataRetrieval.Process(Result, "FTP", "ChangeCurrentDirectory", "Back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetCurrentDirectory", Options);

    OPI_TestDataRetrieval.Process(Result, "FTP", "ChangeCurrentDirectory", "Check, back, " + Postfix, Path);

EndProcedure

Procedure FTP_GetProtocolFeatureList(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProtocolFeatureList", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetProtocolFeatureList", Postfix);

EndProcedure

#EndRegion // FTP

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure FT_РаботаСДиректориями() Export
    FT_DirecotryManagement();
EndProcedure

Procedure FT_РаботаСФайлами() Export
    FT_FileOperations();
EndProcedure

Procedure FT_ОсновныеМетоды() Export
    FT_CommonMethods();
EndProcedure

#EndRegion
