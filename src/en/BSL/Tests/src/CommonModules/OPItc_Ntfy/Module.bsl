// OneScript: ./OInt/tests/Modules/OPItc_Ntfy.os

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
//#Use "../../formats"
//#Use asserts
//#Use "internal"

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("Ntfy");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Ntfy");

EndFunction

#Region Internal

#Region RunnableTests

#Region Ntfy

Procedure Ntfy_Publication() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    Ntfy_GetMessageParametersStructure(TestParameters);
    Ntfy_SendMessage(TestParameters);

EndProcedure

Procedure Ntfy_ManagementAndRetrieval() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    Ntfy_GetFilterParametersStructure(TestParameters);
    Ntfy_GetMessages(TestParameters);
    Ntfy_DeleteMessage(TestParameters);

EndProcedure

#EndRegion // Ntfy

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Ntfy

Procedure Ntfy_GetMessageParametersStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "GetMessageParametersStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Ntfy", "GetMessageParametersStructure");

    // END

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "GetMessageParametersStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Ntfy", "GetMessageParametersStructure", "Clear");

EndProcedure

Procedure Ntfy_SendMessage(FunctionParameters)

    URL   = FunctionParameters["NTFY_URL"];
    Topic = FunctionParameters["NTFY_Topic"];
    Token = FunctionParameters["NTFY_Token"];
    Text  = "OpenIntegrations test message";

    Options = New Structure;
    Options.Insert("empty", Истина);

    Parameters = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "GetMessageParametersStructure", Options);
    Parameters.Title    = "OpenIntegrations";
    Parameters.Priority = "default";
    Parameters.Tags     = "white_check_mark";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("topic", Topic);
    Options.Insert("message", Text);
    Options.Insert("token", Token);
    Options.Insert("options", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "SendMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Ntfy", "SendMessage");

    // END

EndProcedure

Procedure Ntfy_GetFilterParametersStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "GetFilterParametersStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Ntfy", "GetFilterParametersStructure");

    // END

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "GetFilterParametersStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Ntfy", "GetFilterParametersStructure", "Clear");

EndProcedure

Procedure Ntfy_GetMessages(FunctionParameters)

    URL   = FunctionParameters["NTFY_URL"];
    Topic = FunctionParameters["NTFY_Topic"];
    Token = FunctionParameters["NTFY_Token"];

    Options = New Structure;
    Options.Insert("empty", Истина);

    Filter = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "GetFilterParametersStructure", Options);
    Filter.limit = "5";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("topic", Topic);
    Options.Insert("token", Token);
    Options.Insert("filter", Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "GetMessages", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Ntfy", "GetMessages");

    // END

EndProcedure

Procedure Ntfy_DeleteMessage(FunctionParameters)

    URL   = FunctionParameters["NTFY_URL"];
    Topic = FunctionParameters["NTFY_Topic"];
    Token = FunctionParameters["NTFY_Token"];
    Text  = "OpenIntegrations delete test";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("topic", Topic);
    Options.Insert("message", Text);
    Options.Insert("token", Token);

    Sending = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "SendMessage", Options);
    ID      = Sending["id"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("topic", Topic);
    Options.Insert("id", ID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ntfy", "DeleteMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Ntfy", "DeleteMessage");

    // END

EndProcedure

#EndRegion // Ntfy

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure Ntfy_Публикация() Export
    Ntfy_Publication();
EndProcedure

Procedure Ntfy_ПолучениеИУправление() Export
    Ntfy_ManagementAndRetrieval();
EndProcedure

#EndRegion
