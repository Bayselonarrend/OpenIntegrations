// OneScript: ./OInt/tests/Modules/OPIt_SFTP.os

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

// #Use oint
// #Use asserts
// #Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("SFTP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("SFTP");

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Result = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "CreateConnection", Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.CreateNewDirectory(Connection, "new_dir");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "CreateNewDirectory", Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.DeleteDirectory(Connection, "new_dir");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "DeleteDirectory", Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.GetCurrentDirectory(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetCurrentDirectory", Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.ListObjects(Connection, "test_folder", True);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "ListObjects", Postfix);

    Result = OPI_SFTP.ListObjects(Connection, "test_folder");

    OPI_TestDataRetrieval.Process(Result, "SFTP", "ListObjects", Postfix + ", No recursion");

EndProcedure

Procedure SFTP_UploadFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Image = "C:\pic.png";

    Image = FunctionParameters["Picture"]; // SKIP
    TFN   = GetTempFileName("png"); // SKIP
    FileCopy(Image, TFN); // SKIP
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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Result  = OPI_SFTP.UploadFile(Connection, Image, "pic_from_disk.png");
        Result2 = OPI_SFTP.UploadFile(Connection, ImageDD, "files_folder/pic_from_binary.png");

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    UploadedFile = New File(Image);

    OPI_TestDataRetrieval.Process(Result , "SFTP", "UploadFile", Postfix             , UploadedFile.Size());
    OPI_TestDataRetrieval.Process(Result2, "SFTP", "UploadFile", "Binary, " + Postfix, ImageDD.Size());

    FileSizeLocal   = UploadedFile.Size();
    FileSizeLocalBD = ImageDD.Size();

    FileSizeRemote   = OPI_SFTP.GetFileInformation(Connection, "pic_from_disk.png")["data"]["size"];
    FileSizeRemoteBD = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_binary.png")["data"]["size"];

    OPI_TestDataRetrieval.Process(FileSizeLocal  , "SFTP", "SaveFile", "File size, " + Postfix    , FileSizeRemote);
    OPI_TestDataRetrieval.Process(FileSizeLocalBD, "SFTP", "SaveFile", "File size, BD, " + Postfix, FileSizeRemoteBD);

    For N = 1 To 7 Do

        Result  = OPI_SFTP.UploadFile(Connection, Image, "pic_from_disk.png");
        Result2 = OPI_SFTP.UploadFile(Connection, ImageDD, "files_folder/pic_from_binary.png");

        If Not Result["result"] Then
            OPI_TestDataRetrieval.Process(Result, "SFTP", "UploadFile", "Multiple, " + Postfix, ImageDD.Size());
        EndIf;

        If Not Result2["result"] Then
            OPI_TestDataRetrieval.Process(Result2, "SFTP", "UploadFile", "Multiple, binary, " + Postfix, ImageDD.Size());
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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.DeleteFile(Connection, "files_folder/pic_from_binary.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "SFTP", "DeleteFile", Postfix);

    Result = OPI_SFTP.DeleteFile(Connection, "files_folder/pic_from_binary.png");

    OPI_TestDataRetrieval.Process(Result , "SFTP", "DeleteFile", "Nonexistent, " + Postfix);

    Result = OPI_SFTP.ListObjects(Connection, "files_folder", True);

    OPI_TestDataRetrieval.Process(Result , "SFTP", "DeleteFile", "Check, " + Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);
    Result     = OPI_SFTP.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "IsConnector", Postfix);

    Result = OPI_SFTP.IsConnector("a");

    OPI_TestDataRetrieval.Process(Result, "SFTP", "IsConnector", "Error, " + Postfix);

EndProcedure

Procedure SFTP_GetSettingsLoginPassword(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["SSH_Host"];
    Port     = FunctionParameters["SSH_Port"];
    Login    = FunctionParameters["SSH_User"];
    Password = FunctionParameters["SSH_Password"];

    Result = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetSettingsLoginPassword", Postfix);

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

    Result = OPI_SFTP.GetSettingsPrivateKey(Host, Port, Login, PrivateKey, PublicKey);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetSettingsPrivateKey", Postfix);

EndProcedure

Procedure SFTP_GetSettingsViaAgent(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host   = FunctionParameters["SSH_Host"];
    Port   = FunctionParameters["SSH_Port"];
    Login  = FunctionParameters["SSH_User"];
    Result = OPI_SFTP.GetSettingsViaAgent(Host, Port, Login);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetSettingsViaAgent", Postfix);

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

    Result = OPI_SFTP.GetSettingsKI(Host, Port, Login, AnswersArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetSettingsKI", Postfix);

EndProcedure

Procedure SFTP_GetProxySettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Proxy_IP"];
    ProxyPort     = FunctionParameters["Proxy_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Result = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetProxySettings", Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Result = OPI_SFTP.GetConnectionConfiguration(SFTPSettings, ProxySettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetConnectionConfiguration", Postfix);

    Result = OPI_SSH.ExecuteCommand(Result, "whoami");

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetConnectionConfiguration", "Check, " + Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.CloseConnection(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "CloseConnection", Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Path     = "pic_from_disk.png";
        FileName = GetTempFileName("bin");

        Result = OPI_SFTP.SaveFile(Connection, Path, FileName);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "SaveFile", Postfix);

    UploadedFile   = New File(FileName);
    FileSizeLocal  = UploadedFile.Size();
    FileSizeRemote = OPI_SFTP.GetFileInformation(Connection, Path)["data"]["size"];

    OPI_TestDataRetrieval.Process(FileSizeLocal, "SFTP", "SaveFile", "File size, " + Postfix, FileSizeRemote);

    Path = "files_folder/pic_from_binary.png";

    For N = 1 To 20 Do

        Result = OPI_SFTP.SaveFile(Connection, Path, FileName);

        If Not Result["result"] Then
            OPI_TestDataRetrieval.Process(Result, "SFTP", "SaveFile", "Multiple, " + Postfix);
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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then

        Path   = "pic_from_disk.png";
        Result = OPI_SFTP.GetFileData(Connection, Path);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "SFTP", "GetFileData", Postfix);

    FileSizeLocal  = Result.Size();
    FileSizeRemote = OPI_SFTP.GetFileInformation(Connection, Path)["data"]["size"];

    OPI_TestDataRetrieval.Process(FileSizeLocal, "SFTP", "GetFileData", "File size, " + Postfix, FileSizeRemote);

    Path = "files_folder/pic_from_binary.png";

    For N = 1 To 20 Do

        Result = OPI_SFTP.GetFileData(Connection, Path);

        If Not TypeOf(Result) = Type("BinaryData") Then
            OPI_TestDataRetrieval.Process(Result, "SFTP", "GetFileData", "Multiple, " + Postfix);
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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.UpdatePath(Connection, "pic_from_disk.png", "files_folder/pic_from_disk.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "SFTP", "UpdatePath", Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "pic_from_disk.png");

    OPI_TestDataRetrieval.Process(Result , "SFTP", "UpdatePath", "Check, Old, " + Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_disk.png");

    OPI_TestDataRetrieval.Process(Result , "SFTP", "UpdatePath", "Check, New, " + Postfix);

    Result = OPI_SFTP.UpdatePath(Connection, "files_folder/pic_from_disk.png", "pic_from_disk.png");

    OPI_TestDataRetrieval.Process(Result , "SFTP", "UpdatePath", "Back, " + Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_disk.png");

    OPI_TestDataRetrieval.Process(Result , "SFTP", "UpdatePath", "Check, Old, Back, " + Postfix);

    Result = OPI_SFTP.GetFileInformation(Connection, "pic_from_disk.png");

    OPI_TestDataRetrieval.Process(Result , "SFTP", "UpdatePath", "Check, New, Back, " + Postfix);

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

        SFTPSettings = OPI_SFTP.GetSettingsLoginPassword(Host, Port, Login, Password);

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

        ProxySettings = OPI_SFTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    Connection = OPI_SFTP.CreateConnection(SFTPSettings, ProxySettings);

    If OPI_SFTP.IsConnector(Connection) Then
        Result = OPI_SFTP.GetFileInformation(Connection, "files_folder/pic_from_binary.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "SFTP", "GetFileInformation", Postfix);

EndProcedure

#EndRegion // SFTP

#EndRegion // AtomicTests

#EndRegion // Private
