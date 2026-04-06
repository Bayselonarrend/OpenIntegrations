// OneScript: ./OInt/tests/Modules/OPItc_Core.os

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("Core");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Core");

EndFunction

#Region Internal

#Region RunnableTests

Procedure CheckIBToLastBuildCompliance() Export

    //@skip-check use-non-recommended-method
    Message("CLI test check for hash sum");
    BuildSum = OPI_TestDataRetrieval.ExecuteTestCLI("hashsum", "", New Structure);

    URL = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/service/last_build_hash.txt";

    LastSum = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .ProcessRequest("GET")
        .ReturnResponseAsString(False, True);

    OPI_TestDataRetrieval.Process(BuildSum, "Core", "CheckIBToLastBuildCompliance", , LastSum);

EndProcedure

Procedure ValidateAdvancedCall() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);

    AdvancedCall_CallWithSettings(TestParameters);

EndProcedure

#EndRegion

#EndRegion

#Region Private

#Region AtomicTests

Procedure AdvancedCall_CallWithSettings(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("config", New Structure("adv_response", True));

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetBotInformation", Options);

    OPI_TestDataRetrieval.Process(Result, "Core", "CallWithSettings");

EndProcedure

#EndRegion

#EndRegion



#Region Alternate

Procedure ПроверитьСоответствиеИБПоследнейСборке() Export
    CheckIBToLastBuildCompliance();
EndProcedure

Procedure ПроверитьРасширенныйВызов() Export
    ValidateAdvancedCall();
EndProcedure

#EndRegion