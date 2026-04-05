// OneScript: ./OInt/tests/Modules/OPItc_RCON.os

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

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("RCON");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("RCON");

EndFunction

#Region Internal

#Region RunnableTests

#Region RCON

Procedure RC_CommandsExecution() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RCON_URL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RCON_Password", TestParameters);

    RCON_FormConnectionParameters(TestParameters);
    RCON_CreateConnection(TestParameters);
    RCON_ExecuteCommand(TestParameters);
    RCON_IsConnector(TestParameters);

EndProcedure

#EndRegion // RCON

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region RCON

Procedure RCON_FormConnectionParameters(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "RCON", "FormConnectionParameters");

EndProcedure

Procedure RCON_CreateConnection(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    ConnectionParams = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);
    Result           = OPI_RCON.CreateConnection(ConnectionParams);

    // END

    OPI_TestDataRetrieval.Process(Result, "RCON", "CreateConnection");

EndProcedure

Procedure RCON_ExecuteCommand(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    ConnectionParams = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);
    Connection       = OPI_RCON.CreateConnection(ConnectionParams);

    Command = "list";
    Options = New Structure;
    Options.Insert("exec", Command);
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "ExecuteCommand", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "RCON", "ExecuteCommand");

    Command = "list";
    Options = New Structure;
    Options.Insert("exec", Command);
    Options.Insert("conn", ConnectionParams);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "ExecuteCommand", Options);

    OPI_TestDataRetrieval.Process(Result, "RCON", "ExecuteCommand", "No connection");

EndProcedure

Procedure RCON_IsConnector(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    ConnectionParams = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);
    Connection       = OPI_RCON.CreateConnection(ConnectionParams);
    Result           = OPI_RCON.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "RCON", "IsConnector");

EndProcedure

#EndRegion // RCON

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure RC_ВыполнениеКоманд() Export
    RC_CommandsExecution();
EndProcedure

#EndRegion
