// OneScript: ./OInt/tests/Modules/OPIt_Dropbox.os

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

    OPI_TestDataRetrieval.FormYAXTests("Dropbox");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Dropbox");

EndFunction

#Region Internal

#Region RunnableTests

#Region Dropbox

Procedure DropboxAPI_GetUpdateToken() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Appkey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Appsecret", TestParameters);

    Dropbox_GetAuthorizationLink(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Code", TestParameters);

    Dropbox_GetToken(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Refresh", TestParameters);

    Dropbox_RefreshToken(TestParameters);

EndProcedure

Procedure DropboxAPI_UploadFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Big"          , TestParameters);

    Dropbox_UploadFile(TestParameters);
    Dropbox_GetObjectInformation(TestParameters);
    Dropbox_GetObjectVersionList(TestParameters);
    Dropbox_RestoreObjectToVersion(TestParameters);
    Dropbox_GetPreview(TestParameters);
    Dropbox_DownloadFile(TestParameters);
    Dropbox_MoveObject(TestParameters);
    Dropbox_CopyObject(TestParameters);
    Dropbox_DeleteObject(TestParameters);

EndProcedure

Procedure DropboxAPI_CreateFolder() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_CreateFolder(TestParameters);
    Dropbox_DownloadFolder(TestParameters);

EndProcedure

Procedure DropboxAPI_GetFolderFileList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_GetListOfFolderFiles(TestParameters);

EndProcedure

Procedure DropboxAPI_UploadFileByURL() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"     , TestParameters);

    Dropbox_UploadFileByURL(TestParameters);
    Dropbox_GetUploadStatusByURL(TestParameters);

EndProcedure

Procedure DropboxAPI_CreateDeleteTag() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_AddTag(TestParameters);
    Dropbox_GetTagList(TestParameters);
    Dropbox_DeleteTag(TestParameters);

EndProcedure

Procedure DropboxAPI_GetAccount() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_GetAccountInformation(TestParameters);
    Dropbox_GetSpaceUsageData(TestParameters);

EndProcedure

Procedure DropboxAPI_AccessManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_OtherUser", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_FileID"   , TestParameters);

    Dropbox_AddUsersToFile(TestParameters);
    Dropbox_PublishFolder(TestParameters);
    Dropbox_AddUsersToFolder(TestParameters);
    Dropbox_CancelFolderPublication(TestParameters);
    Dropbox_GetAsynchronousChangeStatus(TestParameters);
    Dropbox_CancelFilePublication(TestParameters);

EndProcedure

#EndRegion // Dropbox

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Dropbox

Procedure Dropbox_GetAuthorizationLink(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];
    Result = OPI_Dropbox.GetAuthorizationLink(AppKey);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetAuthorizationLink");

EndProcedure

Procedure Dropbox_GetToken(FunctionParameters)

    AppKey    = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    Code      = FunctionParameters["Dropbox_Code"];

    Result = OPI_Dropbox.GetToken(AppKey, AppSecret, Code);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetToken");

EndProcedure

Procedure Dropbox_RefreshToken(FunctionParameters)

    AppKey       = FunctionParameters["Dropbox_Appkey"];
    AppSecret    = FunctionParameters["Dropbox_Appsecret"];
    RefreshToken = FunctionParameters["Dropbox_Refresh"];

    Result = OPI_Dropbox.RefreshToken(AppKey, AppSecret, RefreshToken);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "RefreshToken");

EndProcedure

Procedure Dropbox_GetObjectInformation(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetObjectInformation(Token, Path, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetObjectInformation", , Path);

EndProcedure

Procedure Dropbox_GetPreview(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.GetPreview(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetPreview");

EndProcedure

Procedure Dropbox_UploadFile(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];
    Image = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    Result = OPI_Dropbox.UploadFile(Token, ImagePath, Path, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "UploadFile", , Path);

    OPI_Tools.RemoveFileWithTry(ImagePath, "Failed to delete the temporary file after the test!!");

    If Not OPI_Tools.IsOneScript() And FunctionParameters.Property("Big") Then

        BigFile = FunctionParameters["Big"];

        Path   = "/giant.tmp";
        Result = OPI_Dropbox.UploadFile(Token, BigFile, Path, True);

        OPI_TestDataRetrieval.Process(Result, "Dropbox", "UploadFile", "Big", Path);

    EndIf;

EndProcedure

Procedure Dropbox_UploadFileByURL(FunctionParameters)

    Path  = "/New/url_doc.docx";
    Token = FunctionParameters["Dropbox_Token"];
    URL   = FunctionParameters["Document"];

    Result = OPI_Dropbox.UploadFileByURL(Token, URL, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "UploadFileByURL", , FunctionParameters);

EndProcedure

Procedure Dropbox_GetUploadStatusByURL(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    WorkID = FunctionParameters["Dropbox_Job"];
    Status = "in_progress";

    While Status = "in_progress" Do

        Result = OPI_Dropbox.GetUploadStatusByURL(Token, WorkID);
        Status = Result[".tag"];

        OPI_Tools.Pause(5);

        OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetUploadStatusByURL", "Progress"); // SKIP

    EndDo;

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetUploadStatusByURL");

    Token  = FunctionParameters["Dropbox_Token"];
    Path   = "/New/url_doc.docx";
    Result = OPI_Dropbox.DeleteObject(Token, Path);

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetUploadStatusByURL", "Deletion", Path);

EndProcedure

Procedure Dropbox_DeleteObject(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.DeleteObject(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "DeleteObject", , Path);

EndProcedure

Procedure Dropbox_CopyObject(FunctionParameters)

    Original = "/New/pic.png";
    Copy     = "/New/pic_copy.png";
    Token    = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.CopyObject(Token, Original, Copy);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "CopyObject", , Copy);

    Result = OPI_Dropbox.DeleteObject(Token, Copy);

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "CopyObject", "Deletion", Copy);

EndProcedure

Procedure Dropbox_MoveObject(FunctionParameters)

    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "MoveObject", , TargetPath);

    Result = OPI_Dropbox.MoveObject(Token, TargetPath, OriginalPath);

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "MoveObject", "Deletion", OriginalPath);

EndProcedure

Procedure Dropbox_CreateFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New catalog";

    Result = OPI_Dropbox.CreateFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "CreateFolder", , Path);

    OPI_Dropbox.DeleteObject(Token, Path);

EndProcedure

Procedure Dropbox_DownloadFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.DownloadFile(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "DownloadFile");

EndProcedure

Procedure Dropbox_DownloadFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.DownloadFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "DownloadFolder");

EndProcedure

Procedure Dropbox_GetListOfFolderFiles(FunctionParameters)

    Path  = "/New";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetListOfFolderFiles");

EndProcedure

Procedure Dropbox_GetObjectVersionList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetObjectVersionList", , FunctionParameters);

EndProcedure

Procedure Dropbox_RestoreObjectToVersion(FunctionParameters)

    Version = FunctionParameters["Dropbox_FileRevision"];
    Token   = FunctionParameters["Dropbox_Token"];
    Path    = "/New/pic.png";

    Result = OPI_Dropbox.RestoreObjectToVersion(Token, Path, Version);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "RestoreObjectToVersion", , Path);

EndProcedure

Procedure Dropbox_GetTagList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    PathsArray = New Array;
    PathsArray.Add("/New/Dogs.mp3");
    PathsArray.Add("/New/mydoc.docx");

    Result = OPI_Dropbox.GetTagList(Token, PathsArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetTagList", , FunctionParameters, PathsArray);

EndProcedure

Procedure Dropbox_AddTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.AddTag(Token, Path, Tag);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "AddTag");

EndProcedure

Procedure Dropbox_DeleteTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "DeleteTag");

EndProcedure

Procedure Dropbox_GetAccountInformation(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetAccountInformation(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetAccountInformation");

    AccountID = Result["account_id"];
    Result    = OPI_Dropbox.GetAccountInformation(Token, AccountID);

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetAccountInformation", "By ID");

EndProcedure

Procedure Dropbox_GetSpaceUsageData(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetSpaceUsageData(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetSpaceUsageData");

EndProcedure

Procedure Dropbox_AddUsersToFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Email, False);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "AddUsersToFile", , Email, False);

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Mails, True);

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "AddUsersToFile", , Email, True);

EndProcedure

Procedure Dropbox_PublishFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.PublishFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "PublishFolder", , FunctionParameters);

EndProcedure

Procedure Dropbox_CancelFolderPublication(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Folder = FunctionParameters["Dropbox_SharedFolder"];

    Result = OPI_Dropbox.CancelFolderPublication(Token, Folder);

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "CancelFolderPublication"); // SKIP

    CurrentStatus = "in_progress";
    JobID         = Result["async_job_id"];

    While CurrentStatus = "in_progress" Do
        Result          = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
        CurrentStatus   = Result[".tag"];
        OPI_Tools.Pause(3);
    EndDo;

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "CancelFolderPublication", "Ending", FunctionParameters, JobID);

EndProcedure

Procedure Dropbox_GetAsynchronousChangeStatus(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    JobID = FunctionParameters["Dropbox_NewJobID"];

    Result = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "GetAsynchronousChangeStatus");

EndProcedure

Procedure Dropbox_AddUsersToFolder(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Email  = FunctionParameters["Dropbox_OtherUser"];
    Folder = FunctionParameters["Dropbox_SharedFolder"]; // shared_folder_id

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Email, False);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "AddUsersToFolder");

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Mails, True);

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "AddUsersToFolder", "Additional");

EndProcedure

Procedure Dropbox_CancelFilePublication(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.CancelFilePublication(Token, File);

    // END

    OPI_TestDataRetrieval.Process(Result, "Dropbox", "CancelFilePublication");

EndProcedure

#EndRegion // Dropbox

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure ДропБокс_ПолучитьОбновитьТокен() Export
    DropboxAPI_GetUpdateToken();
EndProcedure

Procedure ДропБокс_ЗагрузитьФайл() Export
    DropboxAPI_UploadFile();
EndProcedure

Procedure ДропБокс_СоздатьКаталог() Export
    DropboxAPI_CreateFolder();
EndProcedure

Procedure ДропБокс_ПолучитьСписокФайловПапки() Export
    DropboxAPI_GetFolderFileList();
EndProcedure

Procedure ДропБокс_ЗагрузитьФайлПоURL() Export
    DropboxAPI_UploadFileByURL();
EndProcedure

Procedure ДропБокс_СоздатьУдалитьТег() Export
    DropboxAPI_CreateDeleteTag();
EndProcedure

Procedure ДропБокс_ПолучитьАккаунт() Export
    DropboxAPI_GetAccount();
EndProcedure

Procedure ДропБокс_РаботаСДоступами() Export
    DropboxAPI_AccessManagement();
EndProcedure

#EndRegion