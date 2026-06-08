// OneScript: ./OInt/tests/Modules/OPItc_Lua.os

// MIT License

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
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method
//@skip-check undefined-function

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use asserts
//#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("Lua");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Lua");

EndFunction

#Region Internal

#Region RunnableTests

#Region Lua

Procedure Lua_CommonMethods() Export

    Lua_CreateVM();
    Lua_IsVM();

EndProcedure

Procedure Lua_WorkingWithScripts() Export

    Lua_ExecuteCodeFromString();
    Lua_ExecuteCodeFromFile();
    Lua_CallFunction();

EndProcedure

Procedure Lua_BytecodeManagement() Export

    Lua_CompileCodeFromString();
    Lua_CompileCodeFromFile();
    Lua_ExecuteBytecode();
    Lua_ExecuteBytecodeFromFile();

EndProcedure

Procedure Lua_ExtendedCheck() Export

    OPI_TestDataRetrieval.SetCLITestFlag(True);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    Lua_Extended_CodeExecutionError();
    Lua_Extended_GetLogWithoutInitialization();
    Lua_Extended_GetLogOnExecution();
    Lua_Extended_PassComplexData();
    Lua_Extended_PassArrayOfMixedTypes();

EndProcedure

#EndRegion // Lua

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Lua

Procedure Lua_CreateVM()

    Result = OPI_Lua.CreateVM("Lua54");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CreateVM", "Lua54");

    Result = OPI_Lua.CreateVM("LuaJIT");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CreateVM", "LuaJIT");

EndProcedure

Procedure Lua_IsVM()

    VM54 = OPI_Lua.CreateVM("Lua54");

    Result = OPI_Lua.IsVM(VM54);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "IsVM", "Lua54"); // SKIP

    Result = OPI_Lua.IsVM("not a vm");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "IsVM", "False");

EndProcedure

Procedure Lua_ExecuteCodeFromString()

    Result = OPI_Lua.ExecuteCodeFromString("Lua54", "return 42");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "ExecuteCodeFromString");

EndProcedure

Procedure Lua_ExecuteCodeFromFile()

    ScriptFile = GetTempFileName("lua");
    GetBinaryDataFromString("return 7").Write(ScriptFile);

    Result = OPI_Lua.ExecuteCodeFromFile("Lua54", ScriptFile);

    OPI_Tools.RemoveFileWithTry(ScriptFile, "Failed to delete the temporary file after the test!!");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "ExecuteCodeFromFile");

EndProcedure

Procedure Lua_CallFunction()

    VM = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.ExecuteCodeFromString(VM, "function add(a, b) return a + b end");

    Parameters = New Array;
    Parameters.Add(1);
    Parameters.Add(2);

    Result = OPI_Lua.CallFunction(VM, "add", Parameters);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallFunction");

EndProcedure

Procedure Lua_CompileCodeFromString()

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", "return 1");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromString", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CompileCodeFromString");

EndProcedure

Procedure Lua_CompileCodeFromFile()

    ScriptFile = GetTempFileName("lua");
    GetBinaryDataFromString("return 3").Write(ScriptFile);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("path", ScriptFile);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromFile", Options);

    OPI_Tools.RemoveFileWithTry(ScriptFile, "Failed to delete the temporary file after the test!!");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CompileCodeFromFile");

EndProcedure

Procedure Lua_ExecuteBytecode()

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", "return 11");

    Bytecode = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromString", Options);
    Result   = OPI_Lua.ExecuteBytecode("Lua54", Bytecode);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "ExecuteBytecode");

EndProcedure

Procedure Lua_ExecuteBytecodeFromFile()

    ScriptFile = GetTempFileName("lua");
    GetBinaryDataFromString("return 13").Write(ScriptFile);

    BytecodeFile = GetTempFileName("bin");
    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("path", ScriptFile);

    Bytecode = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromFile", Options);
    Bytecode.Write(BytecodeFile);

    Result = OPI_Lua.ExecuteBytecodeFromFile("Lua54", BytecodeFile);

    OPI_Tools.RemoveFileWithTry(ScriptFile  , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(BytecodeFile, "Failed to delete the temporary file after the test!!");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "ExecuteBytecodeFromFile");

EndProcedure

#Region ExtendedCheck

Procedure Lua_Extended_CodeExecutionError()

    AddIn  = OPI_AddIns.GetAddIn("Lua54");
    Result = OPI_AddIns.DesrializeJanx(AddIn.ExecuteString("syntax error !!!"));

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Extended_CodeExecutionError");

EndProcedure

Procedure Lua_Extended_GetLogWithoutInitialization()

    AddIn  = OPI_Lua.CreateVM("Lua54");
    Result = OPI_AddIns.DesrializeJanx(AddIn.GetLogs(10));

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Extended_GetLogWithoutInitialization");

EndProcedure

Procedure Lua_Extended_GetLogOnExecution()

    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_AddIns.GetLoggingSettings(True, 100, LogFile);

    VM = OPI_Lua.CreateVM("Lua54", LoggingSettings);

    OPI_Lua.ExecuteCodeFromString(VM, "return 1");

    Result = OPI_AddIns.DesrializeJanx(VM.GetLogs(10));

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Extended_GetLogOnExecution", , LogFile);

EndProcedure

Procedure Lua_Extended_PassComplexData()

    VM = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.ExecuteCodeFromString(VM, "function echo(v) return v end");

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("LuaComplexData");

    Parameters = New Array;
    Parameters.Add(Original);

    Result = OPI_Lua.CallFunction(VM, "echo", Parameters);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Extended_PassComplexData", , Original);

EndProcedure

Procedure Lua_Extended_PassArrayOfMixedTypes()

    VM = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.ExecuteCodeFromString(VM, "function echo(v) return v end");

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("LuaMixedArray");

    Parameters = New Array;
    Parameters.Add(Original);

    Result = OPI_Lua.CallFunction(VM, "echo", Parameters);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Extended_PassArrayOfMixedTypes", , Original);

EndProcedure

#EndRegion // ExtendedCheck

#EndRegion // Lua

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure Lua_ОсновныеМетоды() Export
    Lua_CommonMethods();
EndProcedure

Procedure Lua_РаботаСоСкриптами() Export
    Lua_WorkingWithScripts();
EndProcedure

Procedure Lua_РаботаСБайткодом() Export
    Lua_BytecodeManagement();
EndProcedure

Procedure Lua_РасширеннаяПроверка() Export
    Lua_ExtendedCheck();
EndProcedure

#EndRegion
