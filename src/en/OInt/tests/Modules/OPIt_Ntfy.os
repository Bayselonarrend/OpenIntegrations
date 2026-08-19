// OneScript: ./OInt/tests/Modules/OPIt_Ntfy.os

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

    OPI_TestDataRetrieval.FormYAXTests("Ntfy");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Ntfy");

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

    Result = OPI_Ntfy.GetMessageParametersStructure();

    OPI_TestDataRetrieval.Process(Result, "Ntfy", "GetMessageParametersStructure");

    // END

    Result = OPI_Ntfy.GetMessageParametersStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Ntfy", "GetMessageParametersStructure", "Clear");

EndProcedure

Procedure Ntfy_SendMessage(FunctionParameters)

    URL   = FunctionParameters["NTFY_URL"];
    Topic = FunctionParameters["NTFY_Topic"];
    Token = FunctionParameters["NTFY_Token"];
    Text  = "OpenIntegrations test message";

    Parameters          = OPI_Ntfy.GetMessageParametersStructure(True);
    Parameters.Title    = "OpenIntegrations";
    Parameters.Priority = "default";
    Parameters.Tags     = "white_check_mark";

    Result = OPI_Ntfy.SendMessage(URL, Topic, Text, Token, Parameters);

    OPI_TestDataRetrieval.Process(Result, "Ntfy", "SendMessage");

    // END

EndProcedure

Procedure Ntfy_GetFilterParametersStructure(FunctionParameters)

    Result = OPI_Ntfy.GetFilterParametersStructure();

    OPI_TestDataRetrieval.Process(Result, "Ntfy", "GetFilterParametersStructure");

    // END

    Result = OPI_Ntfy.GetFilterParametersStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Ntfy", "GetFilterParametersStructure", "Clear");

EndProcedure

Procedure Ntfy_GetMessages(FunctionParameters)

    URL   = FunctionParameters["NTFY_URL"];
    Topic = FunctionParameters["NTFY_Topic"];
    Token = FunctionParameters["NTFY_Token"];

    Filter       = OPI_Ntfy.GetFilterParametersStructure(True);
    Filter.limit = "5";

    Result = OPI_Ntfy.GetMessages(URL, Topic, Token, Filter);

    OPI_TestDataRetrieval.Process(Result, "Ntfy", "GetMessages");

    // END

EndProcedure

Procedure Ntfy_DeleteMessage(FunctionParameters)

    URL   = FunctionParameters["NTFY_URL"];
    Topic = FunctionParameters["NTFY_Topic"];
    Token = FunctionParameters["NTFY_Token"];
    Text  = "OpenIntegrations delete test";

    Sending = OPI_Ntfy.SendMessage(URL, Topic, Text, Token);
    ID      = Sending["id"];

    Result = OPI_Ntfy.DeleteMessage(URL, Topic, ID, Token);

    OPI_TestDataRetrieval.Process(Result, "Ntfy", "DeleteMessage");

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