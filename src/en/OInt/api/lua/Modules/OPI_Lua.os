// OneScript: ./OInt/api/lua/Modules/OPI_Lua.os
// Lib: Lua
// CLI: lua
// Keywords: lua

// DocsCategory: Calendar
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

// Create VM !NOCLI
// Initializes LuaVM of the specified version
//
// Parameters:
// Version - String                   - VM version: Lua54, LuaJIT                - ver
// Logging - Structure Of KeyAndValue - Logging settings. See GetLoggingSettings - log
//
// Returns:
// Arbitrary - Client object or map with error information
Function CreateVM(Val Version, Val Logging = Undefined) Export

    If IsVM(Version) Then
        Return Version;
    EndIf;

    OPI_TypeConversion.GetLine(Version);

    If Version <> "Lua54" And Version <> "LuaJIT" Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", false);
        ErrorMap.Insert("error" , "Unsupported Lua version. Required: Lua54, LuaJIT");

    EndIf;

    AddIn = OPI_AddIns.GetAddIn(Version);

    If Logging = Undefined Then

        SettingsString = "";

    Else

        ErrorText      = "Incorrect logging settings";
        OPI_TypeConversion.GetKeyValueCollection(Logging, ErrorText);
        SettingsString = OPI_Tools.JSONString(Logging);

    EndIf;

    If ValueIsFilled(SettingsString) Then

        LogResult = AddIn.SetLogger(SettingsString);
        LogResult = OPI_Tools.JsonToStructure(LogResult, False);

        If Not LogResult["result"] Then
            Return LogResult;
        EndIf;

    EndIf;

    Return AddIn;

EndFunction

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

    Result = AddIn.ExecuteString(Code);
    Result = ResultFromJSON(Result);

    Return Result["data"];

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

         ErrorMap = New Map;
         ErrorMap.Insert("result", False);
         ErrorMap.Insert("error" , "File not found");

         Return ErrorMap;

     EndIf;

    Result = AddIn.ExecuteFile(ScriptFile.FullName);
    Result = ResultFromJSON(Result);

    Return Result["data"];

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
        Or TypeAsString    = "AddIn.OPI_Lua54.Main"

EndFunction

#EndRegion

#Region Internal

Function ResultFromJSON(Val JSONString)

    Result = OPI_Tools.JsonToStructure(JSONString);

    If Not Result["result"] Then
        Raise Result["error"];
    EndIf;

    Return Result;

EndFunction

#EndRegion

#EndIf


#Region Alternate

Function СоздатьVM(Val Версия, Val Логирование = Undefined) Export
    Return CreateVM(Версия, Логирование);
EndFunction

Function ВыполнитьКодИзСтроки(Val Lua, Val Код) Export
    Return ExecuteCodeFromString(Lua, Код);
EndFunction

Function ВыполнитьКодИзФайла(Val Lua, Val Путь) Export
    Return ExecuteCodeFromFile(Lua, Путь);
EndFunction

Function ЭтоVM(Val Значение) Export
    Return IsVM(Значение);
EndFunction

#EndRegion