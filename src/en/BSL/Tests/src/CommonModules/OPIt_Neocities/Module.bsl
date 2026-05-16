// OneScript: ./OInt/tests/Modules/OPIt_Neocities.os

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

#If Not WebClient Then // !OPI

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Neocities");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Neocities");

EndFunction

#Region Internal

#Region RunnableTests

#Region Neocities

Procedure NC_FilesManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("NC_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Gif"     , TestParameters);

    Neocities_UploadFile(TestParameters);
    Neocities_UploadFiles(TestParameters);
    Neocities_GetFilesList(TestParameters);
    Neocities_DeleteSelectedFiles(TestParameters);
    Neocities_SynchronizeFolders(TestParameters);

EndProcedure

Procedure NC_DataRetrieving() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("NC_Token"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("NC_Login"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("NC_Password", TestParameters);

    Neocities_GetSiteData(TestParameters);
    Neocities_GetToken(TestParameters);

EndProcedure

#EndRegion // Neocities

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Neocities

Procedure Neocities_UploadFile(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Data  = FunctionParameters["Picture"]; // URL, Path or Binary data
    Path  = "testfolder/test_pic.png";

    Result = OPI_Neocities.UploadFile(Token, Path, Data);

    // END

    OPI_TestDataRetrieval.Process(Result, "Neocities", "UploadFile");

EndProcedure

Procedure Neocities_UploadFiles(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary data
    GIF    = FunctionParameters["Gif"]; // URL, Path or Binary data

    FileMapping = New Map;
    FileMapping.Insert("test/pic1.png", Image1);
    FileMapping.Insert("test/gif.gif" , Image2);
    FileMapping.Insert("pic2.png"     , GIF);

    Result = OPI_Neocities.UploadFiles(Token, FileMapping);

    // END

    OPI_TestDataRetrieval.Process(Result, "Neocities", "UploadFiles");

EndProcedure

Procedure Neocities_DeleteSelectedFiles(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    Paths = New Array;
    Paths.Add("/test/pic1.png");
    Paths.Add("/test/gif.gif");
    Paths.Add("/pic2.png");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, Paths);

    // END

    OPI_TestDataRetrieval.Process(Result, "Neocities", "DeleteSelectedFiles");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/testfolder");

    OPI_TestDataRetrieval.Process(Result, "Neocities", "DeleteSelectedFiles", "Directory 1");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/test");

    OPI_TestDataRetrieval.Process(Result, "Neocities", "DeleteSelectedFiles", "Directory 2");

EndProcedure

Procedure Neocities_GetFilesList(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Path  = "test";

    Result = OPI_Neocities.GetFilesList(Token, Path);

    // END

    OPI_TestDataRetrieval.Process(Result, "Neocities", "GetFilesList");

    Result = OPI_Neocities.GetFilesList(Token);

    OPI_TestDataRetrieval.Process(Result, "Neocities", "GetFilesList", "All");

EndProcedure

Procedure Neocities_GetSiteData(FunctionParameters)

    Token   = FunctionParameters["NC_Token"];
    Website = "2athenaeum";

    Result = OPI_Neocities.GetSiteData(Token);

    OPI_TestDataRetrieval.Process(Result, "Neocities", "GetSiteData"); // SKIP

    Result = OPI_Neocities.GetSiteData(Token, Website);

    // END

    OPI_TestDataRetrieval.Process(Result, "Neocities", "GetSiteData", "Website");

EndProcedure

Procedure Neocities_GetToken(FunctionParameters)

    Login    = FunctionParameters["NC_Login"];
    Password = FunctionParameters["NC_Password"];

    Result = OPI_Neocities.GetToken(Login, Password);

    // END

    Result["api_key"] = "***";

    OPI_TestDataRetrieval.Process(Result, "Neocities", "GetToken");

EndProcedure

Procedure Neocities_SynchronizeFolders(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    LocalFolder  = "C:\test_site";
    RemoteFolder = "test_sync";

    Result = OPI_Neocities.SynchronizeFolders(Token, LocalFolder, RemoteFolder);

    // END

    OPI_TestDataRetrieval.Process(Result, "Neocities", "SynchronizeFolders");

EndProcedure

#EndRegion // Neocities

#EndRegion // AtomicTests

#EndRegion // Private

#EndIf // !OPI
