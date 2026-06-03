// OneScript: ./OInt/api/lua/Modules/OPI_Lua.os
// Lib: Lua
// CLI: lua
// Keywords: lua

// DocsCategory: Other
// DocsNameRU: Lua
// DocsNameEN: Lua

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Use "../../../tools/main"


#Region Public

#Region Main

// Create VM !NOCLI
// Initializes LuaVM of the specified version
//
// Note:
// An error during VM creation will throw an exception
//
// Parameters:
// Version - String                   - VM version: Lua54, LuaJIT                - ver
// Logging - Structure Of KeyAndValue - Logging settings. See GetLoggingSettings - log
//
// Returns:
// Arbitrary - AddIn object
Function CreateVM(Val Version, Val Logging = Undefined) Export

    If IsVM(Version) Then
        Return Version;
    EndIf;

    OPI_TypeConversion.GetLine(Version);

    If Version <> "Lua54" And Version <> "LuaJIT" Then

        Raise "Unsupported Lua version. Required: Lua54, LuaJIT";

    EndIf;

    AddIn = OPI_AddIns.GetAddIn(Version);

    If Logging = Undefined Then

        SettingsString = "";

    Else

        ErrorText      = "Incorrect logging settings";
        OPI_TypeConversion.GetKeyValueCollection(Logging, ErrorText);
        SettingsString = OPI_AddIns.SerializeJanx(Logging);

    EndIf;

    If ValueIsFilled(SettingsString) Then

        LogResult = AddIn.SetLogger(SettingsString);
        LogResult = OPI_AddIns.DesrializeJanx(LogResult);

        If Not LogResult["result"] Then
            Raise LogResult["error"];
        EndIf;

    EndIf;

    Return AddIn;

EndFunction

// Is VM !NOCLI
// Checks that the value is an object of a Lua AddIn
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsVM(Val Value) Export

    TypeAsString = String(TypeOf(Value));

    Return TypeAsString = "AddIn.OPI_LuaJIT.Main"
        Or TypeAsString = "AddIn.OPI_Lua54.Main"

EndFunction

#EndRegion

#Region ScriptManagement

// Execute code from string
// Executes Lua code from the passed string
//
// Note:
// An error during Lua code execution will throw an exception
//
// Parameters:
// Lua  - Arbitrary - Lua AddIn or Lua version to run - lua
// Code - String    - Code as string                  - code
//
// Returns:
// Arbitrary - Code execution result
Function ExecuteCodeFromString(Val Lua, Val Code) Export

    AddIn = CreateVM(Lua);

    If IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Code);

    ResultBD = AddIn.ExecuteString(Code);

    Return ResultFromJanx(ResultBD);

EndFunction

// Execute code from file
// Executes Lua code from a file on disk
//
// Note:
// An error during Lua code execution will throw an exception
//
// Parameters:
// Lua  - Arbitrary - Lua AddIn or Lua version to run - lua
// Path - String    - Script file path                - path
//
// Returns:
// Arbitrary - Code execution result
Function ExecuteCodeFromFile(Val Lua, Val Path) Export

    AddIn = CreateVM(Lua);

    If IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Path);

    ScriptFile = New File(Path);

    If Not ScriptFile.Exists() Then
        Raise "File not found";
    EndIf;

    ResultBD = AddIn.ExecuteFile(ScriptFile.FullName);

    Return ResultFromJanx(ResultBD);

EndFunction

// Call function
// Calls a Lua function with the provided parameters
//
// Note:
// Any JSON-compatible types and BinaryData are allowed as function parameters
// The function must be pre-defined in the context using one of the code execution methods
//
// Parameters:
// Lua          - Arbitrary          - Lua AddIn or Lua version to run             - lua
// FunctionName - String             - Function name or path in module.func format - func
// Parameters   - Array Of Arbitrary - Function parameters                         - params
//
// Returns:
// Arbitrary - Calling result
Function CallFunction(Val Lua, Val FunctionName, Val Parameters = Undefined) Export

    AddIn = CreateVM(Lua);

    If IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(FunctionName);

    If Parameters  = Undefined Then
        Parameters = New Array;
    EndIf;

    OPI_TypeConversion.GetArray(Parameters);

    BDArgs   = OPI_AddIns.SerializeJanx(Parameters);
    ResultBD = AddIn.CallFunction(FunctionName, BDArgs);

    Return ResultFromJanx(ResultBD);

EndFunction

#EndRegion

#Region BytecodeManagement

// Compile code from string
// Converts source code to Lua bytecode
//
// Note:
// An error during code compilation will throw an exception
//
// Parameters:
// Lua  - Arbitrary - Lua AddIn or Lua version to run - lua
// Code - String    - Source code for compilation     - code
//
// Returns:
// BinaryData - Compilation result
Function CompileCodeFromString(Val Lua, Val Code) Export

    AddIn = CreateVM(Lua);

    If IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Code);

    Result = AddIn.CompileToBytecode(Code);

    If TypeOf(Result) = Type("String") Then
        Raise Result;
    EndIf;

    Return Result;

EndFunction

// Compile code from file
// Converts a source code file to Lua bytecode
//
// Note:
// An error during code compilation will throw an exception
//
// Parameters:
// Lua  - Arbitrary - Lua AddIn or Lua version to run - lua
// Path - String    - Script file path                - path
//
// Returns:
// BinaryData - Compilation result
Function CompileCodeFromFile(Val Lua, Val Path) Export

    AddIn = CreateVM(Lua);

    If IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Path);

    ScriptFile = New File(Path);

    If Not ScriptFile.Exists() Then
        Raise "File not found";
    EndIf;

    Result = AddIn.CompileFileToBytecode(Path);

    If TypeOf(Result) = Type("String") Then
        Raise Result;
    EndIf;

    Return Result;

EndFunction

// Execute bytecode !NOCLI
// Executes previously compiled code
//
// Parameters:
// Lua      - Arbitrary  - Lua AddIn or Lua version to run - lua
// Bytecode - BinaryData - Bytecode to execute             - code
//
// Returns:
// Arbitrary - Execution result
Function ExecuteBytecode(Val Lua, Val Bytecode) Export

    AddIn = CreateVM(Lua);

    If IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    Result = AddIn.ExecuteBytecode(Bytecode);

    Return ResultFromJanx(Result);

EndFunction

// Execute bytecode from file
// Executes bytecode from the specified file
//
// Parameters:
// Lua  - Arbitrary - Lua AddIn or Lua version to run - lua
// Path - String    - Path to file with bytecode      - path
//
// Returns:
// Arbitrary - Execution result
Function ExecuteBytecodeFromFile(Val Lua, Val Path) Export

    AddIn = CreateVM(Lua);

    If IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    ScriptFile = New File(Path);

    If Not ScriptFile.Exists() Then
        Raise "File not found";
    EndIf;

    Result = AddIn.ExecuteBytecodeFile(Path);

    Return ResultFromJanx(Result);

EndFunction

#EndRegion

#EndRegion

#Region Internal

Function ResultFromJanx(Val JanxData)

    Result = OPI_AddIns.DesrializeJanx(JanxData);

    If Not Result["result"] Then
        Raise Result["error"];
    EndIf;

    Return Result["data"];

EndFunction

#EndRegion



#Region Alternate

Function СоздатьVM(Val Версия, Val Логирование = Undefined) Export
    Return CreateVM(Версия, Логирование);
EndFunction

Function ЭтоVM(Val Значение) Export
    Return IsVM(Значение);
EndFunction

Function ВыполнитьКодИзСтроки(Val Lua, Val Код) Export
    Return ExecuteCodeFromString(Lua, Код);
EndFunction

Function ВыполнитьКодИзФайла(Val Lua, Val Путь) Export
    Return ExecuteCodeFromFile(Lua, Путь);
EndFunction

Function ВызватьФункцию(Val Lua, Val ИмяФункции, Val Параметры = Undefined) Export
    Return CallFunction(Lua, ИмяФункции, Параметры);
EndFunction

Function СкомпилироватьКодИзСтроки(Val Lua, Val Код) Export
    Return CompileCodeFromString(Lua, Код);
EndFunction

Function СкомпилироватьКодИзФайла(Val Lua, Val Путь) Export
    Return CompileCodeFromFile(Lua, Путь);
EndFunction

Function ВыполнитьБайтКод(Val Lua, Val БайтКод) Export
    Return ExecuteBytecode(Lua, БайтКод);
EndFunction

Function ВыполнитьБайтКодФайла(Val Lua, Val Путь) Export
    Return ExecuteBytecodeFromFile(Lua, Путь);
EndFunction

#EndRegion