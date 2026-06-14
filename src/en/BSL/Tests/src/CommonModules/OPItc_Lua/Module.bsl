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
    Lua_Restart();
    Lua_IsVM();
    Lua_GetLoggingSettings();
    Lua_GetLog();

EndProcedure

Procedure Lua_WorkingWithScripts() Export

    Lua_ExecuteCodeFromString();
    Lua_ExecuteCodeFromFile();
    Lua_CallFunction();
    Lua_CallScriptFunction();

EndProcedure

Procedure Lua_BytecodeManagement() Export

    Lua_CompileCodeFromString();
    Lua_CompileCodeFromFile();
    Lua_ExecuteBytecode();
    Lua_ExecuteBytecodeFromFile();
    Lua_CallByteCodeFunction();

EndProcedure

Procedure Lua_GlobalVariables() Export

    Lua_SetGlobalVariable();
    Lua_GetGlobalVariable();

EndProcedure

Procedure Lua_PackageManagement() Export

    Lua_AttachPackageFromString();
    Lua_AttachPackageFromFile();
    Lua_GetPackagesList();

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

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CreateVM");

    Result = OPI_Lua.CreateVM("LuaJIT");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CreateVM", "LuaJIT");

EndProcedure

Procedure Lua_Restart()

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.AttachPackageFromString(Lua, "tmp_pkg", "local M = {} function M.ping() return ""pong"" end return M"); // SKIP
    OPI_Lua.Restart(Lua);

    // END

    Result = OPI_Lua.GetPackagesList(Lua);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Restart");

EndProcedure

Procedure Lua_IsVM()

    Lua = OPI_Lua.CreateVM("Lua54");

    Result = OPI_Lua.IsVM(Lua);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "IsVM");

    Result = OPI_Lua.IsVM("not a vm");

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

    // END

    OPI_Tools.RemoveFileWithTry(ScriptFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "ExecuteCodeFromFile");

EndProcedure

Procedure Lua_CallFunction()

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.ExecuteCodeFromString(Lua, "function add(a, b) return a + b end");

    Parameters = New Array;
    Parameters.Add(1);
    Parameters.Add(2);

    Result = OPI_Lua.CallFunction(Lua, "add", Parameters);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallFunction");

EndProcedure

Procedure Lua_CallScriptFunction()

    Parameters = New Array;
    Parameters.Add(6);
    Parameters.Add(7);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("script", "function mul(a, b) return a * b end");
    Options.Insert("func", "mul");
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallScriptFunction", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallScriptFunction");

    ScriptFile = GetTempFileName("lua");
    GetBinaryDataFromString("function div(a, b) return a / b end").Write(ScriptFile);

    Parameters = New Array;
    Parameters.Add(20);
    Parameters.Add(4);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("script", ScriptFile);
    Options.Insert("func", "div");
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallScriptFunction", Options);

    OPI_Tools.RemoveFileWithTry(ScriptFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallScriptFunction", "File");

    Packages = New Map;
    Packages.Insert("calc", "local M = {} function M.double(x) return x * 2 end return M");

    Parameters = New Array;
    Parameters.Add(5);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("script", "function run(x) return calc.double(x) end");
    Options.Insert("func", "run");
    Options.Insert("params", Parameters);
    Options.Insert("packages", Packages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallScriptFunction", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallScriptFunction", "Packages");

    PackageFile = GetTempFileName("lua");
    GetBinaryDataFromString("local M = {} function M.triple(x) return x * 3 end return M").Write(PackageFile);

    Packages = New Map;
    Packages.Insert("calc_file", PackageFile);

    Parameters = New Array;
    Parameters.Add(4);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("script", "function run(x) return calc_file.triple(x) end");
    Options.Insert("func", "run");
    Options.Insert("params", Parameters);
    Options.Insert("packages", Packages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallScriptFunction", Options);

    OPI_Tools.RemoveFileWithTry(PackageFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallScriptFunction", "FilePackages");

    Variables = New Map;
    Variables.Insert("bonus", 2);

    Parameters = New Array;
    Parameters.Add(6);
    Parameters.Add(7);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("script", "function mul(a, b) return a * b + bonus end");
    Options.Insert("func", "mul");
    Options.Insert("params", Parameters);
    Options.Insert("globals", Variables);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallScriptFunction", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallScriptFunction", "Variables");

EndProcedure

Procedure Lua_GetLoggingSettings()

    Result = OPI_Lua.GetLoggingSettings(True, 100, GetTempFileName());

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "GetLoggingSettings");

    Result = OPI_Lua.GetLoggingSettings(False, , GetTempFileName());

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "GetLoggingSettings", "File");

    Result = OPI_Lua.GetLoggingSettings(True);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "GetLoggingSettings", "Memory");

EndProcedure

Procedure Lua_GetLog()

    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_Lua.GetLoggingSettings(True, 100, LogFile);

    Lua = OPI_Lua.CreateVM("Lua54", LoggingSettings);

    OPI_Lua.ExecuteCodeFromString(Lua, "return 1");

    Result = OPI_Lua.GetLog(Lua);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "GetLog", , LogFile);

    Result = OPI_Lua.GetLog(Lua, True);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "GetLog", "AsString", LogFile);

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

    // END

    OPI_Tools.RemoveFileWithTry(ScriptFile, "Failed to delete the temporary file after the test!!");

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

    // END

    OPI_Tools.RemoveFileWithTry(ScriptFile  , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(BytecodeFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "ExecuteBytecodeFromFile");

EndProcedure

Procedure Lua_CallByteCodeFunction()

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", "function sub(a, b) return a - b end");

    Bytecode = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromString", Options);

    Parameters = New Array;
    Parameters.Add(10);
    Parameters.Add(3);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", Bytecode);
    Options.Insert("func", "sub");
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallByteCodeFunction", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallByteCodeFunction");

    ScriptFile = GetTempFileName("lua");
    GetBinaryDataFromString("function add(a, b) return a + b end").Write(ScriptFile);

    BytecodeFile = GetTempFileName("bin");
    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("path", ScriptFile);

    Bytecode = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromFile", Options);
    Bytecode.Write(BytecodeFile);

    Parameters = New Array;
    Parameters.Add(8);
    Parameters.Add(5);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", BytecodeFile);
    Options.Insert("func", "add");
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallByteCodeFunction", Options);

    OPI_Tools.RemoveFileWithTry(ScriptFile  , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(BytecodeFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallByteCodeFunction", "File");

    Packages = New Map;
    Packages.Insert("calc", "local M = {} function M.double(x) return x * 2 end return M");

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", "function run(x) return calc.double(x) end");

    Bytecode = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromString", Options);

    Parameters = New Array;
    Parameters.Add(5);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", Bytecode);
    Options.Insert("func", "run");
    Options.Insert("params", Parameters);
    Options.Insert("packages", Packages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallByteCodeFunction", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallByteCodeFunction", "Packages");

    PackageFile = GetTempFileName("lua");
    GetBinaryDataFromString("local M = {} function M.triple(x) return x * 3 end return M").Write(PackageFile);

    Packages = New Map;
    Packages.Insert("calc_file", PackageFile);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", "function run(x) return calc_file.triple(x) end");

    Bytecode = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromString", Options);

    Parameters = New Array;
    Parameters.Add(4);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", Bytecode);
    Options.Insert("func", "run");
    Options.Insert("params", Parameters);
    Options.Insert("packages", Packages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallByteCodeFunction", Options);

    OPI_Tools.RemoveFileWithTry(PackageFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallByteCodeFunction", "FilePackages");

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", "function mul(a, b) return a * b + bonus end");

    Bytecode = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CompileCodeFromString", Options);

    Variables = New Map;
    Variables.Insert("bonus", 2);

    Parameters = New Array;
    Parameters.Add(6);
    Parameters.Add(7);

    Options = New Structure;
    Options.Insert("lua", "Lua54");
    Options.Insert("code", Bytecode);
    Options.Insert("func", "mul");
    Options.Insert("params", Parameters);
    Options.Insert("globals", Variables);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("lua", "CallByteCodeFunction", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "CallByteCodeFunction", "Variables");

EndProcedure

Procedure Lua_SetGlobalVariable()

    Lua = OPI_Lua.CreateVM("Lua54");

    Original = 99;

    OPI_Lua.SetGlobalVariable(Lua, "test_var", Original);

    Result = OPI_Lua.GetGlobalVariable(Lua, "test_var");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "SetGlobalVariable", , Original);

    Original = "lua-text";
    OPI_Lua.SetGlobalVariable(Lua, "test_var", Original);
    Result   = OPI_Lua.GetGlobalVariable(Lua, "test_var");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "SetGlobalVariable", "String", Original);

    Original = True;
    OPI_Lua.SetGlobalVariable(Lua, "test_var", Original);
    Result   = OPI_Lua.GetGlobalVariable(Lua, "test_var");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "SetGlobalVariable", "Boolean", Original);

    Original = GetBinaryDataFromString("binary-payload", "UTF-8");
    OPI_Lua.SetGlobalVariable(Lua, "test_var", Original);
    Result   = OPI_Lua.GetGlobalVariable(Lua, "test_var");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "SetGlobalVariable", "BinaryOne", Original);

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("LuaComplexData");
    OPI_Lua.SetGlobalVariable(Lua, "test_var", Original);
    Result   = OPI_Lua.GetGlobalVariable(Lua, "test_var");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "SetGlobalVariable", "ComplexData", Original);

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("LuaMixedArray");
    OPI_Lua.SetGlobalVariable(Lua, "test_var", Original);
    Result   = OPI_Lua.GetGlobalVariable(Lua, "test_var");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "SetGlobalVariable", "MixedArray", Original);

EndProcedure

Procedure Lua_GetGlobalVariable()

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.SetGlobalVariable(Lua, "test_var", 99);

    Result = OPI_Lua.GetGlobalVariable(Lua, "test_var");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "GetGlobalVariable");

EndProcedure

Procedure Lua_AttachPackageFromString()

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.AttachPackageFromString(Lua, "calc", "local M = {} function M.double(x) return x * 2 end return M");

    OPI_Lua.ExecuteCodeFromString(Lua, "calc = require('calc')");

    Parameters = New Array;
    Parameters.Add(5);

    Result = OPI_Lua.CallFunction(Lua, "calc.double", Parameters);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "AttachPackageFromString");

EndProcedure

Procedure Lua_AttachPackageFromFile()

    PackageFile = GetTempFileName("lua");
    GetBinaryDataFromString("local M = {} function M.triple(x) return x * 3 end return M").Write(PackageFile);

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.AttachPackageFromFile(Lua, "calc_file", PackageFile);

    OPI_Lua.ExecuteCodeFromString(Lua, "calc_file = require('calc_file')");

    Parameters = New Array;
    Parameters.Add(4);

    Result = OPI_Lua.CallFunction(Lua, "calc_file.triple", Parameters);

    // END

    OPI_Tools.RemoveFileWithTry(PackageFile, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "AttachPackageFromFile");

EndProcedure

Procedure Lua_GetPackagesList()

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.AttachPackageFromString(Lua, "alpha", "local M = {} function M.one() return 1 end return M");
    OPI_Lua.AttachPackageFromString(Lua, "beta" , "local M = {} function M.two() return 2 end return M");

    Result = OPI_Lua.GetPackagesList(Lua);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "GetPackagesList");

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

    Lua = OPI_Lua.CreateVM("Lua54", LoggingSettings);

    OPI_Lua.ExecuteCodeFromString(Lua, "return 1");

    Result = OPI_AddIns.DesrializeJanx(Lua.GetLogs(10));

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Extended_GetLogOnExecution", , LogFile);

EndProcedure

Procedure Lua_Extended_PassComplexData()

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.ExecuteCodeFromString(Lua, "function echo(v) return v end");

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("LuaComplexData");

    Parameters = New Array;
    Parameters.Add(Original);

    Result = OPI_Lua.CallFunction(Lua, "echo", Parameters);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Lua", "Extended_PassComplexData", , Original);

EndProcedure

Procedure Lua_Extended_PassArrayOfMixedTypes()

    Lua = OPI_Lua.CreateVM("Lua54");

    OPI_Lua.ExecuteCodeFromString(Lua, "function echo(v) return v end");

    Original = OPI_TestDataRetrieval.GetJanxTestCollection("LuaMixedArray");

    Parameters = New Array;
    Parameters.Add(Original);

    Result = OPI_Lua.CallFunction(Lua, "echo", Parameters);

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

Procedure Lua_ГлобальныеПеременные() Export
    Lua_GlobalVariables();
EndProcedure

Procedure Lua_УправлениеПакетами() Export
    Lua_PackageManagement();
EndProcedure

Procedure Lua_РасширеннаяПроверка() Export
    Lua_ExtendedCheck();
EndProcedure

#EndRegion
