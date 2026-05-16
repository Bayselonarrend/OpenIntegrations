// OneScript: ./OInt/tests/Modules/OPItc_GoogleSheets.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("GoogleSheets");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("GoogleSheets");

EndFunction

#Region Internal

#Region RunnableTests

#Region GoogleSheets

Procedure GT_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ServiceData" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Access_Token"       , TestParameters);

    GoogleSheets_FormCodeRetrievalLink(TestParameters);
    GoogleSheets_GetTokenByCode(TestParameters);
    GoogleSheets_RefreshToken(TestParameters);
    GoogleSheets_GetServiceAccountToken(TestParameters);

EndProcedure

Procedure GT_CreateTable() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleSheets_CreateSpreadsheet(TestParameters);
    GoogleSheets_GetSpreadsheet(TestParameters);
    GoogleSheets_CopySheet(TestParameters);
    GoogleSheets_AddSheet(TestParameters);
    GoogleSheets_DeleteSheet(TestParameters);
    GoogleSheets_EditSpreadsheetTitle(TestParameters);
    GoogleSheets_GetTable(TestParameters);

    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet"]);
    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet2"]);

EndProcedure

Procedure GT_FillClearCells() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleSheets_CreateSpreadsheet(TestParameters);
    GoogleSheets_SetCellValues(TestParameters);
    GoogleSheets_GetCellValues(TestParameters);
    GoogleSheets_ClearCells(TestParameters);

    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet"]);
    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet2"]);

EndProcedure

#EndRegion // GoogleSheets

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region GoogleSheets

Procedure GoogleSheets_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Options = New Structure;
    Options.Insert("id", ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "FormCodeRetrievalLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleSheets_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("code", Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetTokenByCode", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "GetTokenByCode");

EndProcedure

Procedure GoogleSheets_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("refresh", RefreshToken);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "RefreshToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "RefreshToken");

EndProcedure

Procedure GoogleSheets_GetServiceAccountToken(FunctionParameters)

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetServiceAccountToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "GetServiceAccountToken");

EndProcedure

Procedure GoogleSheets_CreateSpreadsheet(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);
    Options.Insert("sheets", SheetArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CreateSpreadsheet", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "CreateSpreadsheet", , FunctionParameters, Name, SheetArray);

    Name   = "Test table (new.)";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);
    Options.Insert("sheets", SheetArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CreateSpreadsheet", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "CreateSpreadsheet", "Additionally", FunctionParameters, Name);

EndProcedure

Procedure GoogleSheets_GetSpreadsheet(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GS_Spreadsheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetSpreadsheet", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "GetSpreadsheet");

EndProcedure

Procedure GoogleSheets_CopySheet(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    From   = FunctionParameters["GS_Spreadsheet"];
    Target = FunctionParameters["GS_Spreadsheet2"];
    Sheet  = FunctionParameters["GS_Sheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", From);
    Options.Insert("to", Target);
    Options.Insert("sheet", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CopySheet", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "CopySheet");

EndProcedure

Procedure GoogleSheets_AddSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "TestSheet";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "AddSheet", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "AddSheet");

EndProcedure

Procedure GoogleSheets_DeleteSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = FunctionParameters["GS_Sheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("sheet", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "DeleteSheet", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "DeleteSheet", , Spreadsheet);

EndProcedure

Procedure GoogleSheets_EditSpreadsheetTitle(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "Test table (changed.)";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "EditSpreadsheetTitle", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "EditSpreadsheetTitle", , Spreadsheet);

EndProcedure

Procedure GoogleSheets_GetTable(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetSpreadsheet", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "GetTable");

EndProcedure

Procedure GoogleSheets_SetCellValues(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    ValueMapping = New Map;
    ValueMapping.Insert("A1", "ThisIsA1");
    ValueMapping.Insert("A2", "ThisIsA2");
    ValueMapping.Insert("B2", "ThisIsB2");
    ValueMapping.Insert("B3", "ThisIsB3");
    ValueMapping.Insert("A3", "ThisIsA3");
    ValueMapping.Insert("A4", "ThisIsA4");
    ValueMapping.Insert("B1", "ThisIsB1");
    ValueMapping.Insert("B4", "ThisIsB4");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("data", ValueMapping);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "SetCellValues", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "SetCellValues", , ValueMapping.Count());

EndProcedure

Procedure GoogleSheets_GetCellValues(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("cells", CellsArray);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetCellValues", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "GetCellValues", , CellsArray.Count());

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetCellValues", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "GetCellValues", "All", Spreadsheet);

EndProcedure

Procedure GoogleSheets_ClearCells(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("cells", CellsArray);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "ClearCells", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GoogleSheets", "ClearCells", , CellsArray.Count());

EndProcedure

#EndRegion // GoogleSheets

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure ГТ_Авторизация() Export
    GT_Authorization();
EndProcedure

Procedure ГТ_СоздатьТаблицу() Export
    GT_CreateTable();
EndProcedure

Procedure ГТ_ЗаполнитьОчиститьЯчейки() Export
    GT_FillClearCells();
EndProcedure

#EndRegion
