// OneScript: ./OInt/tests/Modules/OPItc_YandexMetrika.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("YandexMetrika");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("YandexMetrika");

EndFunction

#Region Internal

#Region RunnableTests

#Region YandexMetrika

Procedure YaMetrika_TagsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    YandexMetrika_CreateTag(TestParameters);
    YandexMetrika_GetTagsList(TestParameters);
    YandexMetrika_UpdateTag(TestParameters);
    YandexMetrika_GetTag(TestParameters);
    YandexMetrika_DeleteTag(TestParameters);

EndProcedure

Procedure YaMetrika_CountersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    YandexMetrika_GetCounterStructure(TestParameters);
    YandexMetrika_CreateCounter(TestParameters);
    YandexMetrika_GetCounter(TestParameters);
    YandexMetrika_UpdateCounter(TestParameters);
    YandexMetrika_DeleteCounter(TestParameters);
    YandexMetrika_RestoreCounter(TestParameters);
    YandexMetrika_GetCountersList(TestParameters);
    YandexMetrika_DeleteCounter(TestParameters);

EndProcedure

Procedure YaMetrika_ActionsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    YandexMetrika_CreateCounter(TestParameters);
    YandexMetrika_GetActionsList(TestParameters);
    YandexMetrika_DeleteCounter(TestParameters);

EndProcedure

#EndRegion // YandexMetrika

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region YandexMetrika

Procedure YandexMetrika_GetTagsList(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetTagsList", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "GetTagsList");

EndProcedure

Procedure YandexMetrika_CreateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    Name  = "New tag";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "CreateTag", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "CreateTag", , FunctionParameters, Name);

EndProcedure

Procedure YandexMetrika_DeleteTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "DeleteTag", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "DeleteTag");

EndProcedure

Procedure YandexMetrika_UpdateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];
    Name  = "New tag title";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "UpdateTag", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "UpdateTag", , Name);

EndProcedure

Procedure YandexMetrika_GetTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetTag", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "GetTag");

EndProcedure

Procedure YandexMetrika_GetCounterStructure(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCounterStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "GetCounterStructure");

EndProcedure

Procedure YandexMetrika_CreateCounter(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];

    CounterStructure = New Structure;
    CounterStructure.Insert("autogoals_enabled", True);

    CodeSettingsStructure = New Structure;
    CodeSettingsStructure.Insert("async"          , 0);
    CodeSettingsStructure.Insert("clickmap"       , 1);
    CodeSettingsStructure.Insert("ecommerce"      , 1);
    CodeSettingsStructure.Insert("in_one_line"    , 0);
    CodeSettingsStructure.Insert("track_hash"     , 1);
    CodeSettingsStructure.Insert("visor"          , 1);
    CodeSettingsStructure.Insert("xml_site"       , 0);
    CodeSettingsStructure.Insert("ytm"            , 0);
    CodeSettingsStructure.Insert("alternative_cdn", 1);

    InformerStructure = New Structure;
    InformerStructure.Insert("color_arrow", 1);
    InformerStructure.Insert("color_end"  , "EFEFEFFE");
    InformerStructure.Insert("color_start", "EEEEEEEE");
    InformerStructure.Insert("color_text" , 0);
    InformerStructure.Insert("enabled"    , 1);
    InformerStructure.Insert("indicator"  , "uniques");
    InformerStructure.Insert("size"       , 2);
    InformerStructure.Insert("type"       , "ext");

    CodeSettingsStructure.Insert("informer", InformerStructure);

    CounterStructure.Insert("code_options", CodeSettingsStructure);

    FlagsStructure = New Structure;
    FlagsStructure.Insert("collect_first_party_data"             , True);
    FlagsStructure.Insert("measurement_enabled"                  , True);
    FlagsStructure.Insert("use_in_benchmarks"                    , True);
    FlagsStructure.Insert("direct_allow_use_goals_without_access", True);

    CounterStructure.Insert("counter_flags"          , FlagsStructure);
    CounterStructure.Insert("favorite"               , 1);
    CounterStructure.Insert("filter_robots"          , 2);
    CounterStructure.Insert("gdpr_agreement_accepted", 1);

    DomainStructure = New Structure("site", "openintegrations.dev");

    CounterStructure.Insert("site2", DomainStructure);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fields", CounterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "CreateCounter", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "CreateCounter", , FunctionParameters);

EndProcedure

Procedure YandexMetrika_DeleteCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "DeleteCounter", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "DeleteCounter");

EndProcedure

Procedure YandexMetrika_UpdateCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    CounterStructure = New Structure;
    CounterStructure.Insert("autogoals_enabled", True);

    FlagsStructure = New Structure;
    FlagsStructure.Insert("collect_first_party_data"             , False);
    FlagsStructure.Insert("measurement_enabled"                  , False);
    FlagsStructure.Insert("use_in_benchmarks"                    , False);
    FlagsStructure.Insert("direct_allow_use_goals_without_access", False);

    CounterStructure.Insert("counter_flags", FlagsStructure);
    CounterStructure.Insert("favorite"     , 0);
    CounterStructure.Insert("filter_robots", 1);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);
    Options.Insert("fields", CounterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "UpdateCounter", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "UpdateCounter");

EndProcedure

Procedure YandexMetrika_GetCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCounter", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "GetCounter");

EndProcedure

Procedure YandexMetrika_RestoreCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "RestoreCounter", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "RestoreCounter");

EndProcedure

Procedure YandexMetrika_GetCountersList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCountersList", Options);

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "GetCountersList"); // SKIP

    // filter by IDs list

    Filter = New Structure;

    CountersArray = New Array;
    CountersArray.Add(CounterID);

    Filter.Insert("counter_ids", CountersArray);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("filter", Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCountersList", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "GetCountersList", "Filter");

EndProcedure

Procedure YandexMetrika_GetActionsList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetActionsList", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "YandexMetrika", "GetActionsList");

EndProcedure

#EndRegion // YandexMetrika

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure ЯМетрика_УправлениеМетками() Export
    YaMetrika_TagsManagement();
EndProcedure

Procedure ЯМетрика_УправлениеСчетчиками() Export
    YaMetrika_CountersManagement();
EndProcedure

Procedure ЯМетрика_УправлениеОперациями() Export
    YaMetrika_ActionsManagement();
EndProcedure

#EndRegion
