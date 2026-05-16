// OneScript: ./OInt/tests/Modules/OPIt_FTP.os

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

    OPI_TestDataRetrieval.FormYAXTests("FTP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("FTP");

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetWelcomeMessage(Connection);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Result = OPI_FTP.GetConnectionConfiguration(FTPSettings, ProxySettings, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetConnectionConfiguration", Postfix, FunctionParameters);

    Check = OPI_FTP.GetWelcomeMessage(Result);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    Result = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

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

    Result = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetProxySettings", Postfix);

EndProcedure

Procedure FTP_GetTLSSettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Result = OPI_FTP.GetTLSSettings(True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Deletion = OPI_FTP.DeleteDirectory(Connection, "new_dir"); // SKIP
        OPI_TestDataRetrieval.Process(Deletion, "FTP", "CreateNewDirectory", "Deletion, " + Postfix); // SKIP

        Result = OPI_FTP.CreateNewDirectory(Connection, "new_dir");

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "CreateNewDirectory", Postfix, True);

    Result = OPI_FTP.CreateNewDirectory(Connection, "new_dir/another_one");

    OPI_TestDataRetrieval.Process(Result, "FTP", "CreateNewDirectory", "Nested, " + Postfix);

    Result = OPI_FTP.CreateNewDirectory(Connection, "second_dir/another_one");

    OPI_TestDataRetrieval.Process(Result, "FTP", "CreateNewDirectory", "Double, " + Postfix);

    OPI_Tools.Pause(5);

    Check = OPI_FTP.ListObjects(Connection, "new_dir", True);

    OPI_TestDataRetrieval.Process(Check, "FTP", "CreateNewDirectory", "Check 1, " + Postfix);

    Check = OPI_FTP.ListObjects(Connection, "", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.ListObjects(Connection, "", True);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "ListObjects", Postfix);

    Result = OPI_FTP.ListObjects(Connection, "Dir1/Dir3/Git-2.50.0-64-bit.exe", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password, , 1000, 1000);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Result  = OPI_FTP.UploadFile(Connection, Image, "new_dir/pic_from_disk.png");
        Result2 = OPI_FTP.UploadFile(Connection, ImageDD, "pic_from_binary.png");

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "UploadFile", Postfix             , ImageDD.Size());
    OPI_TestDataRetrieval.Process(Result2, "FTP", "UploadFile", "Binary, " + Postfix, ImageDD.Size());

    Result  = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_from_disk.png");
    Result2 = OPI_FTP.GetObjectSize(Connection, "pic_from_binary.png");

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.DeleteFile(Connection, "pic_from_binary.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "DeleteFile", Postfix);

    Result = OPI_FTP.DeleteFile(Connection, "pic_from_binary.png");

    OPI_TestDataRetrieval.Process(Result , "FTP", "DeleteFile", "Nonexistent, " + Postfix);

    Result = OPI_FTP.ListObjects(Connection, "", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.DeleteDirectory(Connection, "new_dir/another_one");
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.ClearDirectory(Connection, ".");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "ClearDirectory", Postfix);

    Result = OPI_FTP.ListObjects(Connection, ".", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_from_disk.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "GetObjectSize", Postfix);

    Result = OPI_FTP.GetObjectSize(Connection, "new_dir/another.bin");

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.UpdatePath(Connection, "new_dir/pic_from_disk.png", "new_dir/pic_copy.png");
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", Postfix);

    Result = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_copy.png");

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Check, new, " + Postfix);

    Result = OPI_FTP.GetObjectSize(Connection, "new_dir/pic_from_binary.png");

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Check, old, " + Postfix);

    Result = OPI_FTP.UpdatePath(Connection, "new_dir", "brand_new_dir");

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Directory, " + Postfix);

    Result = OPI_FTP.ListObjects(Connection, ".", True);

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "List, " + Postfix);

    Result = OPI_FTP.UpdatePath(Connection, "brand_new_dir", "new_dir");

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Directory, back, " + Postfix);

    Result = OPI_FTP.UpdatePath(Connection, "new_dir/pic_copy.png", "new_dir/pic_from_disk.png");

    OPI_TestDataRetrieval.Process(Result , "FTP", "UpdatePath", "Back, " + Postfix);

    Result = OPI_FTP.ListObjects(Connection, ".", True);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Path     = "new_dir/pic_from_disk.png";
        FileName = GetTempFileName("bin");

        Result = OPI_FTP.SaveFile(Connection, Path, FileName);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "SaveFile", Postfix);

    Size = OPI_FTP.GetObjectSize(Connection, Path);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    Size = OPI_FTP.GetObjectSize(Connection, Path);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.Ping(Connection);
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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "UMASK";
        Result      = OPI_FTP.ExecuteCustomCommand(Connection, CommandText);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "PWD";
        Result      = OPI_FTP.ExecuteArbitraryCommand(Connection, CommandText);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetCurrentDirectory(Connection);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    OPI_TestDataRetrieval.Process(Result, "FTP", "GetCurrentDirectory", Postfix, FunctionParameters);

EndProcedure

Procedure FTP_ChangeCurrentDirectory(FunctionParameters)

    If OPI_TestDataRetrieval.IsCLITest() Then Return; EndIf; // SKIP

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
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

    Result = OPI_FTP.GetCurrentDirectory(Connection);

    OPI_TestDataRetrieval.Process(Result, "FTP", "ChangeCurrentDirectory", "Check, " + Postfix, Path);

    Path   = FunctionParameters["FTP_RootPath"];
    Result = OPI_FTP.ChangeCurrentDirectory(Connection, Path);

    OPI_TestDataRetrieval.Process(Result, "FTP", "ChangeCurrentDirectory", "Back, " + Postfix);

    Result = OPI_FTP.GetCurrentDirectory(Connection);

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

    FTPSettings = OPI_FTP.GetConnectionSettings(Host, Port, Login, Password);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        ProxySettings = OPI_FTP.GetProxySettings(ProxyAddress, ProxyPort, ProxyType, ProxyLogin, ProxyPassword);

    EndIf;

    If FTPS Then
        TLSSettings = OPI_FTP.GetTLSSettings(True);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Result = OPI_FTP.GetProtocolFeatureList(Connection);
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