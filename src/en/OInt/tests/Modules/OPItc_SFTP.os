// OneScript: ./OInt/tests/Modules/OPItc_SFTP.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("SFTP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("SFTP");

EndFunction

#Region Internal

#Region RunnableTests

#Region SFTP

Procedure SF_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SFTP_CreateConnection(TestParameters);
        SFTP_GetConnectionConfiguration(TestParameters);
        SFTP_IsConnector(TestParameters);
        SFTP_CloseConnection(TestParameters);
        SFTP_GetSettingsLoginPassword(TestParameters);
        SFTP_GetSettingsPrivateKey(TestParameters);
        SFTP_GetSettingsViaAgent(TestParameters);
        SFTP_GetSettingsKI(TestParameters);
        SFTP_GetProxySettings(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

Procedure SF_DirectoryManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SFTP_GetCurrentDirectory(TestParameters);
        SFTP_ListObjects(TestParameters);
        SFTP_CreateNewDirectory(TestParameters);
        SFTP_DeleteDirectory(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

Procedure SF_FileManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetSSHParameterOptions();

    For Each TestParameters In OptionArray Do

        SFTP_UploadFile(TestParameters);
        SFTP_GetFileInformation(TestParameters);
        SFTP_GetFileData(TestParameters);
        SFTP_SaveFile(TestParameters);
        SFTP_UpdatePath(TestParameters);
        SFTP_DeleteFile(TestParameters);

    EndDo;

    OPI_Tools.RemoveFileWithTry(OptionArray[0]["SSH_Key"], "Error deleting file after test");

EndProcedure

#EndRegion // SFTP

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region SFTP

Procedure SFTP_CreateConnection(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Result = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "CreateConnection", Postfix);

EndProcedure

Procedure SFTP_CreateNewDirectory(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "CreateNewDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "CreateNewDirectory", Postfix);

EndProcedure

Procedure SFTP_DeleteDirectory(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "DeleteDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "DeleteDirectory", Postfix);

EndProcedure

Procedure SFTP_GetCurrentDirectory(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetCurrentDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetCurrentDirectory", Postfix);

EndProcedure

Procedure SFTP_ListObjects(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "test_folder");
        Options.Insert("rcv", Истина);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "ListObjects", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "ListObjects", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "test_folder");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "ListObjects", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "ListObjects", Postfix + ", No recursion");

EndProcedure

Procedure SFTP_UploadFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Image = "C:\pic.png";

    Image = FunctionParameters["Picture"]; // SKIP
    TFN   = GetTempFileName("png"); // SKIP
    CopyFile(Image, TFN); // SKIP
    Image = TFN; // SKIP

    ImageDD = New BinaryData(Image);

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("file", Image);
        Options.Insert("path", "pic_from_disk.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "UploadFile", Options);
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("file", ImageDD);
        Options.Insert("path", "files_folder/pic_from_binary.png");

        Result2 = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "UploadFile", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    UploadedFile = New File(Image);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "UploadFile", Postfix             , UploadedFile.Size());
    OPI_TestDataRetrieval.ProcessCLI(Result2, "SFTP", "UploadFile", "Binary, " + Postfix, ImageDD.Size());

    FileSizeLocal   = UploadedFile.Size();
    FileSizeLocalBD = ImageDD.Size();

    FileSizeRemote   = OPI_SFTP.GetFileInformation(Connection, "pic_from_disk.png")["data"]["size"];
    FileSizeRemoteBD = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_binary.png")["data"]["size"];

    OPI_TestDataRetrieval.ProcessCLI(FileSizeLocal  , "SFTP", "SaveFile", "File size, " + Postfix    , FileSizeRemote);
    OPI_TestDataRetrieval.ProcessCLI(FileSizeLocalBD, "SFTP", "SaveFile", "File size, BD, " + Postfix, FileSizeRemoteBD);

    For N = 1 To 7 Do

        Result  = OPI_SFTP.UploadFile(Connection, Image, "pic_from_disk.png");
        Result2 = OPI_SFTP.UploadFile(Connection, ImageDD, "files_folder/pic_from_binary.png");

        If Not Result["result"] Then
            OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "UploadFile", "Multiple, " + Postfix, ImageDD.Size());
        EndIf;

        If Not Result2["result"] Then
            OPI_TestDataRetrieval.ProcessCLI(Result2, "SFTP", "UploadFile", "Multiple, binary, " + Postfix, ImageDD.Size());
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure SFTP_DeleteFile(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "files_folder/pic_from_binary.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "DeleteFile", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "DeleteFile", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "files_folder/pic_from_binary.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "DeleteFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "DeleteFile", "Nonexistent, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "files_folder");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "ListObjects", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "DeleteFile", "Check, " + Postfix);

EndProcedure

Procedure SFTP_IsConnector(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);
    Result     = OPI_SFTP.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "IsConnector", Postfix);

    Result = OPI_SFTP.IsConnector("a");

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "IsConnector", "Error, " + Postfix);

EndProcedure

Procedure SFTP_GetSettingsLoginPassword(FunctionParameters)

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetSettingsLoginPassword", Postfix);

EndProcedure

Procedure SFTP_GetSettingsPrivateKey(FunctionParameters)

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsPrivateKey", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetSettingsPrivateKey", Postfix);

EndProcedure

Procedure SFTP_GetSettingsViaAgent(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host   = FunctionParameters["SSH_Host"];
    Port   = FunctionParameters["SSH_Port"];
    Login  = FunctionParameters["SSH_User"];
    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("user", Login);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsViaAgent", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetSettingsViaAgent", Postfix);

EndProcedure

Procedure SFTP_GetSettingsKI(FunctionParameters)

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsKI", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetSettingsKI", Postfix);

EndProcedure

Procedure SFTP_GetProxySettings(FunctionParameters)

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetProxySettings", Postfix);

EndProcedure

Procedure SFTP_GetConnectionConfiguration(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Options = New Structure;
    Options.Insert("set", SFTPSettings);
    Options.Insert("proxy", ProxySettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetConnectionConfiguration", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetConnectionConfiguration", Postfix);

    Options = New Structure;
    Options.Insert("conn", Result);
    Options.Insert("comm", "whoami");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ssh", "ExecuteCommand", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetConnectionConfiguration", "Check, " + Postfix);

EndProcedure

Procedure SFTP_CloseConnection(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.CloseConnection(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "CloseConnection", Postfix);

EndProcedure

Procedure SFTP_SaveFile(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Path     = "pic_from_disk.png";
        FileName = GetTempFileName("bin");

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", Path);
        Options.Insert("file", FileName);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "SaveFile", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "SaveFile", Postfix);

    UploadedFile   = New File(FileName);
    FileSizeLocal  = UploadedFile.Size();
    FileSizeRemote = OPI_SFTP.GetFileInformation(Connection, Path)["data"]["size"];

    OPI_TestDataRetrieval.ProcessCLI(FileSizeLocal, "SFTP", "SaveFile", "File size, " + Postfix, FileSizeRemote);

    Path = "files_folder/pic_from_binary.png";

    For N = 1 To 20 Do

        Result = OPI_SFTP.SaveFile(Connection, Path, FileName);

        If Not Result["result"] Then
            OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "SaveFile", "Multiple, " + Postfix);
        EndIf;

    EndDo;

    OPI_Tools.RemoveFileWithTry(FileName, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure SFTP_GetFileData(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Path   = "pic_from_disk.png";
        Result = OPI_SFTP.GetFileData(Connection, Path);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetFileData", Postfix);

    FileSizeLocal  = Result.Size();
    FileSizeRemote = OPI_SFTP.GetFileInformation(Connection, Path)["data"]["size"];

    OPI_TestDataRetrieval.ProcessCLI(FileSizeLocal, "SFTP", "GetFileData", "File size, " + Postfix, FileSizeRemote);

    Path = "files_folder/pic_from_binary.png";

    For N = 1 To 20 Do

        Result = OPI_SFTP.GetFileData(Connection, Path);

        If Not TypeOf(Result) = Type("BinaryData") Then
            OPI_TestDataRetrieval.ProcessCLI(Result, "SFTP", "GetFileData", "Multiple, " + Postfix);
        EndIf;

    EndDo;

EndProcedure

Procedure SFTP_UpdatePath(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("old", "pic_from_disk.png");
        Options.Insert("new", "files_folder/pic_from_disk.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "UpdatePath", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "UpdatePath", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetFileInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "UpdatePath", "Check, Old, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "files_folder/pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetFileInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "UpdatePath", "Check, New, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("old", "files_folder/pic_from_disk.png");
    Options.Insert("new", "pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "UpdatePath", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "UpdatePath", "Back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "files_folder/pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetFileInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "UpdatePath", "Check, Old, Back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetFileInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "UpdatePath", "Check, New, Back, " + Postfix);

EndProcedure

Procedure SFTP_GetFileInformation(FunctionParameters)

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

        SFTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetSettingsLoginPassword", Options);

    ElsIf AuthorizationType = "By key" Then

        Login      = FunctionParameters["SSH_User"];
        PrivateKey = "./ssh_key";
        PublicKey  = "./ssh_key.pub";

        PrivateKey = FunctionParameters["SSH_Key"]; // SKIP
        PublicKey  = FunctionParameters["SSH_Pub"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    ElsIf AuthorizationType = "Keyboard interactive" Then

        Login    = FunctionParameters["SSH_User"];
        Password = FunctionParameters["SSH_Password"];

        AnswersArray = New Array;
        AnswersArray.Add(Password);

        Port = FunctionParameters["SSH_PortKI"]; // SKIP

        SFTPSettings = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    Else

        Login        = FunctionParameters["SSH_User"];
        SFTPSettings = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

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

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetProxySettings", Options);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "files_folder/pic_from_binary.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("sftp", "GetFileInformation", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result , "SFTP", "GetFileInformation", Postfix);

EndProcedure

#EndRegion // SFTP

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure SF_ОсновныеМетоды() Export
    SF_CommonMethods();
EndProcedure

Procedure SF_РаботаСДиректориями() Export
    SF_DirectoryManagement();
EndProcedure

Procedure SF_РаботаСФайлами() Export
    SF_FileManagement();
EndProcedure

#EndRegion
