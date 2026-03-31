// OneScript: ./OInt/tests/Modules/OPIt_YandexDisk.os

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

    OPI_TestDataRetrieval.FormYAXTests("YandexDisk");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("YandexDisk");

EndFunction

#Region Internal

#Region RunnableTests

#Region YandexDisk

Procedure YDisk_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_RefreshToken", TestParameters);

    YandexDisk_GetConfirmationCode(TestParameters);
    YandexDisk_ConvertCodeToToken(TestParameters);
    YandexDisk_RefreshToken(TestParameters);

EndProcedure

Procedure YDisk_GetDiskInfo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_GetDiskInformation(TestParameters);

EndProcedure

Procedure YDisk_CreateFolder() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_CreateFolder(TestParameters);

EndProcedure

Procedure YDisk_UploadByUrlAndGetObject() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    YandexDisk_UploadFileByURL(TestParameters);
    YandexDisk_GetObject(TestParameters);
    YandexDisk_DeleteObject(TestParameters);

EndProcedure

Procedure YDisk_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio"           , TestParameters);

    YandexDisk_UploadFileInParts(TestParameters);
    YandexDisk_UploadFile(TestParameters);

EndProcedure

Procedure YDisk_CreateObjectCopy() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    OriginalPath = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_OriginalFilePath", OriginalPath);
    TestParameters.Insert("YandexDisk_OriginalFilePath", OriginalPath);

    YandexDisk_CreateObjectCopy(TestParameters);

    CopyPath = TestParameters["YandexDisk_CopyFilePath"];

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, CopyPath    , False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_GetDownloadLink() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    Path = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_PathForLink", Path);
    TestParameters.Insert("YandexDisk_PathForLink", Path);

    YandexDisk_GetDownloadLink(TestParameters);
    YandexDisk_DownloadFile(TestParameters);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure YDisk_GetFileList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_GetFilesList(TestParameters);

EndProcedure

Procedure YDisk_MoveObject() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    OriginalPath = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_OriginalFilePath", OriginalPath);
    TestParameters.Insert("YandexDisk_OriginalFilePath", OriginalPath);

    YandexDisk_MoveObject(TestParameters);

    NewPath = TestParameters["YandexDisk_NewFilePath"];

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, NewPath     , False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_PublicObjectActions() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    OriginalPath = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_OriginalFilePath", OriginalPath);
    TestParameters.Insert("YandexDisk_OriginalFilePath", OriginalPath);

    YandexDisk_PublishObject(TestParameters);
    YandexDisk_GetDownloadLinkForPublicObject(TestParameters);
    YandexDisk_GetPublicObject(TestParameters);
    YandexDisk_SavePublicObjectToDisk(TestParameters);
    YandexDisk_CancelObjectPublication(TestParameters);

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_GetPublishedList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_GetPublishedObjectsList(TestParameters);

EndProcedure

#EndRegion // YandexDisk

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region YandexDisk

Procedure YandexDisk_GetConfirmationCode(FunctionParameters)

    ClientID = FunctionParameters["YandexDisk_ClientID"];

    Result = OPI_YandexDisk.GetConfirmationCode(ClientID);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetConfirmationCode");

EndProcedure

Procedure YandexDisk_ConvertCodeToToken(FunctionParameters)

    ClientID     = FunctionParameters["YandexDisk_ClientID"];
    ClientSecret = FunctionParameters["YandexDisk_ClientSecret"];
    DeviceCode   = "12345678";

    Result = OPI_YandexDisk.ConvertCodeToToken(ClientID, ClientSecret, DeviceCode);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "ConvertCodeToToken", , FunctionParameters);

EndProcedure

Procedure YandexDisk_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["YandexDisk_ClientID"];
    ClientSecret = FunctionParameters["YandexDisk_ClientSecret"];
    RefreshToken = FunctionParameters["YandexDisk_RefreshToken"];

    Result = OPI_YandexDisk.RefreshToken(ClientID, ClientSecret, RefreshToken);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "RefreshToken", , FunctionParameters);

EndProcedure

Procedure YandexDisk_GetDiskInformation(FunctionParameters)

    Token  = FunctionParameters["YandexDisk_Token"];
    Result = OPI_YandexDisk.GetDiskInformation(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetDiskInformation");

EndProcedure

Procedure YandexDisk_CreateFolder(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = "/" + String(New UUID);

    Result = OPI_YandexDisk.CreateFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "CreateFolder", , Token, Path);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure YandexDisk_UploadFileByURL(FunctionParameters)

    Token   = FunctionParameters["YandexDisk_Token"];
    Address = FunctionParameters["Picture"];
    Path    = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.UploadFileByURL(Token, Path, Address);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "UploadFileByURL", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Result = OPI_YandexDisk.GetObject(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetObject", , Path);

EndProcedure

Procedure YandexDisk_DeleteObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "DeleteObject");

EndProcedure

Procedure YandexDisk_UploadFile(FunctionParameters)

    Path1 = "/" + String(New UUID) + ".png";
    Path2 = "/" + String(New UUID) + ".png";

    Token = FunctionParameters["YandexDisk_Token"];
    Image = FunctionParameters["Picture"]; // URL

    TFN = GetTempFileName("png"); // Path
    CopyFile(Image, TFN);

    Result = OPI_YandexDisk.UploadFile(Token, Path1, Image, True);

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "UploadFile", "URL"); // SKIP

    OPI_YandexDisk.DeleteObject(Token, Path1, False); // SKIP

    Result = OPI_YandexDisk.UploadFile(Token, Path2, TFN, True);

    // END

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "UploadFile");

    OPI_YandexDisk.DeleteObject(Token, Path2, False); // SKIP

EndProcedure

Procedure YandexDisk_CreateObjectCopy(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.CreateObjectCopy(Token, Original, Path, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "CreateObjectCopy", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetDownloadLink(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetDownloadLink");

EndProcedure

Procedure YandexDisk_DownloadFile(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Result = OPI_YandexDisk.DownloadFile(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "DownloadFile");

EndProcedure

Procedure YandexDisk_GetFilesList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;
    FilterByType    = "image";

    Result = OPI_YandexDisk.GetFilesList(Token, Count, OffsetFromStart, FilterByType);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetFilesList", , Count, OffsetFromStart);

EndProcedure

Procedure YandexDisk_MoveObject(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.MoveObject(Token, Original, Path, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "MoveObject", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetPublishedObjectsList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;

    Result = OPI_YandexDisk.GetPublishedObjectsList(Token, Count, OffsetFromStart);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetPublishedObjectsList", , Count, OffsetFromStart);

EndProcedure

Procedure YandexDisk_PublishObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.PublishObject(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "PublishObject", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetDownloadLinkForPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, URL);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetDownloadLinkForPublicObject");

EndProcedure

Procedure YandexDisk_GetPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.GetPublicObject(Token, URL);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "GetPublicObject");

EndProcedure

Procedure YandexDisk_SavePublicObjectToDisk(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.SavePublicObjectToDisk(Token, URL);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "SavePublicObjectToDisk");

EndProcedure

Procedure YandexDisk_CancelObjectPublication(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.CancelObjectPublication(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "CancelObjectPublication", , Path);

EndProcedure

Procedure YandexDisk_UploadFileInParts(FunctionParameters)

    Path = "/song.mp3";

    Token = FunctionParameters["YandexDisk_Token"];
    File  = FunctionParameters["Audio"]; // URL, Binary or File path

    ChunkSize = 1048576; // 1 MB

    Result = OPI_YandexDisk.UploadFileInParts(Token, Path, File, ChunkSize, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "UploadFileInParts", , File);

    Result = OPI_YandexDisk.DownloadFile(Token, Path);

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "UploadFileInParts", "Downloading", File);

    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);

    OPI_TestDataRetrieval.Process(Result, "YandexDisk", "UploadFileInParts", "Deletion");

EndProcedure

#EndRegion // YandexDisk

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure ЯДиск_Авторизация() Export
    YDisk_Authorization();
EndProcedure

Procedure ЯДиск_ПолучитьИнформациюОДиске() Export
    YDisk_GetDiskInfo();
EndProcedure

Procedure ЯДиск_СоздатьПапку() Export
    YDisk_CreateFolder();
EndProcedure

Procedure ЯДиск_ЗагрузитьПоАдресуПолучитьОбъект() Export
    YDisk_UploadByUrlAndGetObject();
EndProcedure

Procedure ЯДиск_ЗагрузитьУдалитьФайл() Export
    YDisk_UploadDeleteFile();
EndProcedure

Procedure ЯДиск_СоздатьКопиюОбъекта() Export
    YDisk_CreateObjectCopy();
EndProcedure

Procedure ЯДиск_ПолучитьСсылкуНаСкачивание() Export
    YDisk_GetDownloadLink();
EndProcedure

Procedure ЯДиск_ПолучитьСписокФайлов() Export
    YDisk_GetFileList();
EndProcedure

Procedure ЯДиск_ПереместитьОбъект() Export
    YDisk_MoveObject();
EndProcedure

Procedure ЯДиск_ДействияПубличныхОбъектов() Export
    YDisk_PublicObjectActions();
EndProcedure

Procedure ЯДиск_ПолучитьСписокОпубликованных() Export
    YDisk_GetPublishedList();
EndProcedure

#EndRegion