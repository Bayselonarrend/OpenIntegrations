// OneScript: ./OInt/tests/Modules/OPItc_GoogleDrive.os

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

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use asserts
//#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("GoogleDrive");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("GoogleDrive");

EndFunction

#Region Internal

#Region RunnableTests

#Region GoogleDrive

Procedure GD_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ServiceData" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Access_Token"       , TestParameters);

    GoogleDrive_FormCodeRetrievalLink(TestParameters);
    GoogleDrive_GetTokenByCode(TestParameters);
    GoogleDrive_RefreshToken(TestParameters);
    GoogleDrive_GetServiceAccountToken(TestParameters);

EndProcedure

Procedure GD_GetCatalogList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleDrive_GetDirectoriesList(TestParameters);
    GoogleDrive_GetObjectInformation(TestParameters);

EndProcedure

Procedure GD_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Big"         , TestParameters);

    TestParameters.Insert("ArrayOfDeletions", New Array);

    GoogleDrive_UploadFile(TestParameters);
    GoogleDrive_CopyObject(TestParameters);
    GoogleDrive_DownloadFile(TestParameters);
    GoogleDrive_UpdateFile(TestParameters);
    GoogleDrive_GetFilesList(TestParameters);
    GoogleDrive_DeleteObject(TestParameters);
    GoogleDrive_GetFileDescription(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GD_CreateDeleteComment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);

    TestParameters.Insert("ArrayOfDeletions", New Array);

    GoogleDrive_UploadFile(TestParameters);

    GoogleDrive_CreateComment(TestParameters);
    GoogleDrive_GetComment(TestParameters);
    GoogleDrive_GetCommentList(TestParameters);
    GoogleDrive_DeleteComment(TestParameters);

    GoogleDrive_DeleteObject(TestParameters);

EndProcedure

Procedure GD_CreateCatalog() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);

    GoogleDrive_CreateFolder(TestParameters);

EndProcedure

#EndRegion // GoogleDrive

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region GoogleDrive

Procedure GoogleDrive_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Options = New Structure;
    Options.Insert("id", ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "FormCodeRetrievalLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleDrive_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("code", Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetTokenByCode", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetTokenByCode");

EndProcedure

Procedure GoogleDrive_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("refresh", RefreshToken);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "RefreshToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "RefreshToken");

EndProcedure

Procedure GoogleDrive_GetServiceAccountToken(FunctionParameters)

    Data = FunctionParameters["Google_ServiceData"]; // URL, binary Data, file or collection

    Token = FunctionParameters["Access_Token"]; // SKIP
    Data  = OPI_HTTPRequests // SKIP
        .NewRequest() // SKIP
        .Initialize(Data) // SKIP
        .AddBearerAuthorization(Token) // SKIP
        .ProcessRequest("GET") // SKIP
        .ReturnResponseAsBinaryData(); // SKIP

    Scope = New Array;
    Scope.Add("https://www.googleapis.com/auth/calendar");
    Scope.Add("https://www.googleapis.com/auth/drive");
    Scope.Add("https://www.googleapis.com/auth/spreadsheets");

    Options = New Structure;
    Options.Insert("auth", Data);
    Options.Insert("scope", Scope);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetServiceAccountToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetServiceAccountToken");

EndProcedure

Procedure GoogleDrive_GetDirectoriesList(FunctionParameters)

    Name  = "TestFolder";
    Token = FunctionParameters["Google_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("query", Name);
    Options.Insert("depth", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetDirectoriesList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetDirectoriesList", , FunctionParameters);

EndProcedure

Procedure GoogleDrive_GetObjectInformation(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_Catalog"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetObjectInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetObjectInformation");

EndProcedure

Procedure GoogleDrive_UploadFile(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Directory = FunctionParameters["GD_Catalog"];
    Image     = FunctionParameters["Picture"]; // URL, Binary data or File path

    Clear       = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Description = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFileDescription", Options);

    Description.Insert("Parent", Directory);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", Image);
    Options.Insert("props", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UploadFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "UploadFile", , FunctionParameters, Description);

    If Not OPI_Tools.IsOneScript() And FunctionParameters.Property("Big") Then

        BigFile = FunctionParameters["Big"];
        Description.Insert("Name", "big.rar");

        Options = New Structure;
        Options.Insert("token", Token);
        Options.Insert("file", BigFile);
        Options.Insert("props", Description);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UploadFile", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "UploadFile", "Big", FunctionParameters, Description);

        Options = New Structure;
        Options.Insert("token", Token);
        Options.Insert("object", Result);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DownloadFile", Options);

        OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "UploadFile", "Check", FunctionParameters, Description);

    EndIf;

EndProcedure

Procedure GoogleDrive_CopyObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("title", NewName);
    Options.Insert("catalog", NewParent);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CopyObject", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "CopyObject", , FunctionParameters, NewName);

EndProcedure

Procedure GoogleDrive_DownloadFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DownloadFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "DownloadFile", , FunctionParameters);

EndProcedure

Procedure GoogleDrive_UpdateFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    NewName    = "UpdatedFile.jpg";
    Identifier = FunctionParameters["GD_File"];
    File       = FunctionParameters["Picture2"]; // URL, Binary data or File path

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("file", File);
    Options.Insert("title", NewName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UpdateFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "UpdateFile", , NewName);

EndProcedure

Procedure GoogleDrive_GetFilesList(FunctionParameters)

    Token        = FunctionParameters["Google_Token"];
    Directory    = "root";
    NameContains = "data";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("query", NameContains);
    Options.Insert("catalog", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFilesList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetFilesList");

EndProcedure

Procedure GoogleDrive_DeleteObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DeleteObject", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "DeleteObject");

    For Each Deletable In FunctionParameters["ArrayOfDeletions"] Do

        Result = OPI_GoogleDrive.DeleteObject(Token, Deletable);

        OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "DeleteObject", "Additional");

        OPI_Tools.Pause(2);

    EndDo;

EndProcedure

Procedure GoogleDrive_GetFileDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFileDescription", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetFileDescription");

EndProcedure

Procedure GoogleDrive_CreateComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    Comment    = "Comment text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("text", Comment);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "CreateComment", , FunctionParameters, Comment);

EndProcedure

Procedure GoogleDrive_GetComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetComment");

EndProcedure

Procedure GoogleDrive_GetCommentList(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetCommentList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "GetCommentList");

EndProcedure

Procedure GoogleDrive_DeleteComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DeleteComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "DeleteComment");

EndProcedure

Procedure GoogleDrive_CreateFolder(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Directory = FunctionParameters["GD_Catalog"];
    Name      = "TestFolder";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);
    Options.Insert("catalog", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "CreateFolder");

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleDrive", "CreateFolder", "Root");

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

EndProcedure

#EndRegion // GoogleDrive

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure ГД_Авторизация() Export
    GD_Authorization();
EndProcedure

Procedure ГД_ПолучитьСписокКаталогов() Export
    GD_GetCatalogList();
EndProcedure

Procedure ГД_ЗагрузитьУдалитьФайл() Export
    GD_UploadDeleteFile();
EndProcedure

Procedure ГД_СоздатьУдалитьКомментарий() Export
    GD_CreateDeleteComment();
EndProcedure

Procedure ГД_СоздатьКаталог() Export
    GD_CreateCatalog();
EndProcedure

#EndRegion
