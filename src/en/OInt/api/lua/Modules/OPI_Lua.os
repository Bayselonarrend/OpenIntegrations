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

// Call function !NOCLI
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

    If Not IsVM(AddIn) Then
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

// Call script function
// Executes Lua code from a string or file and calls the specified function
//
// Note:
// Similar to separate calls to `ExecuteCodeFromString`, `SetGlobalVariable`, and `CallFunction`
//
// Parameters:
// Lua          - Arbitrary          - Lua AddIn or Lua version to run             - lua
// Script       - String             - Lua code or file path                       - script
// FunctionName - String             - Function name or path in module.func format - func
// Parameters   - Map Of KeyAndValue - Function parameters, if necessary           - params
// Variables    - Map Of KeyAndValue - Module global variables, if necessary       - globals
//
// Returns:
// Arbitrary - Calling result
Function CallScriptFunction(Val Lua
    , Val Script
    , Val FunctionName
    , Val Parameters = Undefined
    , Val Variables = Undefined) Export

    AddIn = CreateVM(Lua);

    If Not IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Script, True);
    ExecuteCodeFromString(AddIn, Script);

    If Variables <> Undefined Then

        OPI_TypeConversion.GetKeyValueCollection(Variables);

        For Each KeyValue In Variables Do
            SetGlobalVariable(AddIn, KeyValue.Key, KeyValue.Value);
        EndDo;

    EndIf;

    Result = CallFunction(AddIn, FunctionName, Parameters);

    Return Result;

EndFunction

// Call byte code function
// Executes bytecode and calls the specified function
//
// Note:
// Similar to separate calls to `ExecuteByteCode`, `SetGlobalVariable`, and `CallFunction`
//
// Parameters:
// Lua          - Arbitrary          - Lua AddIn or Lua version to run             - lua
// Bytecode     - String, BinaryData - Byte code or file path                      - code
// FunctionName - String             - Function name or path in module.func format - func
// Parameters   - Map Of KeyAndValue - Function parameters, if necessary           - params
// Variables    - Map Of KeyAndValue - Module global variables, if necessary       - globals
//
// Returns:
// Arbitrary - Calling result
Function CallByteCodeFunction(Val Lua
    , Val Bytecode
    , Val FunctionName
    , Val Parameters = Undefined
    , Val Variables = Undefined) Export

    AddIn = CreateVM(Lua);

    If Not IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetBinaryData(Bytecode, True);
    ExecuteBytecode(AddIn, Bytecode);

    If Variables <> Undefined Then

        OPI_TypeConversion.GetKeyValueCollection(Variables);

        For Each KeyValue In Variables Do
            SetGlobalVariable(AddIn, KeyValue.Key, KeyValue.Value);
        EndDo;

    EndIf;

    Result = CallFunction(AddIn, FunctionName, Parameters);

    Return Result;

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

// Get logging settings !NOCLI
// Retrieves settings structure for starting logging on server startup
//
// Parameters:
// WriteToMemory - Boolean - Logging to memory for further retrieval from the addin object - memory
// MaxEvents     - Number  - Maximum number of events stored in memory                     - count
// FilePath      - String  - Path to file for saving full log, if necessary                - path
//
// Returns:
// Structure Of KeyAndValue - Settings structure
Function GetLoggingSettings(Val WriteToMemory = True
    , Val MaxEvents = 300
    , Val FilePath = "") Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetLoggingSettings(WriteToMemory, MaxEvents, FilePath);

EndFunction

// Get log !NOCLI
// Retrieves log data (with logging to memory enabled)
//
// Parameters:
// AddInObject - Arbitrary - VM AddIn object                                            - vm
// AsString    - Boolean   - True > returns log as a single string, False > as an array - str
// EventCount  - Number    - Number of recent events to retrieve. 0 > no limits         - count
//
// Returns:
// String, Map Of KeyAndValue - Log as a string or a map with the full execution result
Function GetLog(Val AddInObject, Val AsString = False, Val EventCount = 100) Export

    Return OPI_AddIns.GetLog(AddInObject
        , AsString
        , EventCount);

EndFunction

#EndRegion

#Region ScriptManagement

// Execute code from string !NOCLI
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

    If Not IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Code);

    ResultBD = AddIn.ExecuteString(Code);

    Return ResultFromJanx(ResultBD);

EndFunction

// Execute code from file !NOCLI
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

    If Not IsVM(AddIn) Then
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

    If Not IsVM(AddIn) Then
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

    If Not IsVM(AddIn) Then
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

    If Not IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetBinaryData(Bytecode, True);
    Result = AddIn.ExecuteBytecode(Bytecode);

    Return ResultFromJanx(Result);

EndFunction

// Execute bytecode from file !NOCLI
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

    If Not IsVM(AddIn) Then
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

#Region GlobalVariables

// Set global variable !NOCLI
// Sets the value of a global variable in the context
//
// Parameters:
// Lua   - Arbitrary - Lua AddIn or Lua version to run - lua
// Name  - String    - Variable name                   - name
// Value - Arbitrary - Variable value                  - value
//
// Returns:
// Map Of KeyAndValue - Execution result
Function SetGlobalVariable(Val Lua, Val Name, Val Value) Export

    AddIn = CreateVM(Lua);

    If Not IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Name);

    Data     = New Structure("data", Value);
    JanxData = OPI_AddIns.SerializeJanx(Data);

    Result = AddIn.SetGlobal(Name, JanxData);

    Data = ResultFromJanx(Result);

    Return Data;

EndFunction

// Get global variable !NOCLI
// Gets the value of a global variable in the context
//
// Parameters:
// Lua  - Arbitrary - Lua AddIn or Lua version to run - lua
// Name - String    - Variable name                   - name
//
// Returns:
// Arbitrary - Variable value
Function GetGlobalVariable(Val Lua, Val Name) Export

    AddIn = CreateVM(Lua);

    If Not IsVM(AddIn) Then
        Return AddIn;
    EndIf;

    OPI_TypeConversion.GetLine(Name);

    Result = AddIn.GetGlobal(Name);

    Data = ResultFromJanx(Result);

    Return Data;

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

Function ВызватьФункцию(Val Lua, Val ИмяФункции, Val Параметры = Undefined) Export
    Return CallFunction(Lua, ИмяФункции, Параметры);
EndFunction

Function ВызватьФункциюСкрипта(Val Lua, Val Скрипт, Val ИмяФункции, Val Параметры = Undefined, Val Переменные = Undefined) Export
    Return CallScriptFunction(Lua, Скрипт, ИмяФункции, Параметры, Переменные);
EndFunction

Function ВызватьФункциюБайтКода(Val Lua, Val БайтКод, Val ИмяФункции, Val Параметры = Undefined, Val Переменные = Undefined) Export
    Return CallByteCodeFunction(Lua, БайтКод, ИмяФункции, Параметры, Переменные);
EndFunction

Function ЭтоVM(Val Значение) Export
    Return IsVM(Значение);
EndFunction

Function ПолучитьНастройкиЛогирования(Val ЗаписьВПамять = True, Val МаксимумСобытий = 300, Val ПутьКФайлу = "") Export
    Return GetLoggingSettings(ЗаписьВПамять, МаксимумСобытий, ПутьКФайлу);
EndFunction

Function ПолучитьЛог(Val ОбъектКомпоненты, Val КакСтрока = False, Val ЧислоСобытий = 100) Export
    Return GetLog(ОбъектКомпоненты, КакСтрока, ЧислоСобытий);
EndFunction

Function ВыполнитьКодИзСтроки(Val Lua, Val Код) Export
    Return ExecuteCodeFromString(Lua, Код);
EndFunction

Function ВыполнитьКодИзФайла(Val Lua, Val Путь) Export
    Return ExecuteCodeFromFile(Lua, Путь);
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

Function УстановитьГлобальнуюПеременную(Val Lua, Val Имя, Val Значение) Export
    Return SetGlobalVariable(Lua, Имя, Значение);
EndFunction

Function ПолучитьГлобальнуюПеременную(Val Lua, Val Имя) Export
    Return GetGlobalVariable(Lua, Имя);
EndFunction

#EndRegion