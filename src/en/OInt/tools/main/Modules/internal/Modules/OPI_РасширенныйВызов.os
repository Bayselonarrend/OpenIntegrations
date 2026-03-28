// OneScript: ./OInt/tools/main/Modules/internal/Modules/OPI_AdvancedCall.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:CognitiveComplexity-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

#Use "./internal"

Var CurrentSettings;

#Region Public

// Call with settings
// Calls the specified method with advanced settings configuration
//
// Parameters:
// ModuleName - String - OpenIntegrations module name
// FunctionName - String - Function name in module
// Parameters - Array Of Arbitrary - Array of function parameters
// Settings - Structure Of KeyAndValue - Settings set. See GetAvailableSettings
//
// Returns:
// Structure Of KeyAndValue - Call function with settings
Function CallWithSettings(Val ModuleName
    , Val FunctionName
    , Val Parameters = Undefined
    , Val Settings = Undefined) Export

    SetSettings(Settings);

    If ValueIsFilled(Parameters) Then
        OPI_TypeConversion.GetArray(Parameters);
    Else
        Parameters = New Array;
    EndIf;

    For N = 0 To Parameters.UBound() Do
        Parameters.Add(StrTemplate("Parameters[%1]", N));
    EndDo;

    OPI_TypeConversion.GetLine(ModuleName);
    OPI_TypeConversion.GetLine(FunctionName);

    CallString = StrTemplate("Result = %1.%2(%3);"
        , ModuleName
        , FunctionName
        , StrConcat(Parameters, ", "));

    Result = Undefined;

    Try
        //@skip-check server-execution-safe-mode
        Execute(CallString);
    Except
        DeleteSettings();
        Raise
    EndTry;

    DeleteSettings();

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Get available settings
// Gets a description of the available settings for the specified method (for reference)
//
// Parameters:
// ModuleName - String - OpenIntegrations module name
// FunctionName - String - Function name in module
//
// Returns:
// String - Help on available settings
Function GetAvailableSettings(Val ModuleName, Val FunctionName) Export

    TemplateText      = OPI_Tools.GetTextTemplate("OPI_Text_MethodSettings");
    TemplateStructure = OPI_Tools.JsonToStructure(TemplateText, False);
    NoSettings        = False;

    Try
        SettingsStructure = TemplateStructure[ModuleName][FunctionName];
    Except
        NoSettings        = True;
    EndTry;

    If NoSettings Or SettingsStructure.Count() = 0 Then
        Return "There are no available settings for this function";
    EndIf;

    DescriptionArray = New Array;

    For Each Setting In SettingsStructure Do
        DescriptionArray.Add(StrTemplate("%1: %2", Setting.Key, Setting.Value));
    EndDo;

    Return StrConcat(DescriptionArray);

EndFunction

#EndRegion

#Region Internal

Function GetCurrentSettings() Export

    Try
        //@skip-check bsl-legacy-check-string-literal
        Return GetCurrentSettings();
    Except
        Return Undefined;
    EndTry;

EndFunction

#EndRegion

#Region Private

Procedure SetSettings(Val Settings)

    If ValueIsFilled(Settings) Then

        OPI_TypeConversion.GetKeyValueCollection(Settings);

        CurrentSettings = Settings;


    EndIf;

EndProcedure

Procedure DeleteSettings()

    //@skip-check module-unused-local-variable
    CurrentSettings = New Structure;


EndProcedure

#EndRegion

#Region Alternate

Function ВызватьСНастройками(Val ИмяМодуля, Val ИмяФункции, Val Параметры = Undefined, Val Настройки = Undefined) Export
    Return CallWithSettings(ИмяМодуля, ИмяФункции, Параметры, Настройки);
EndFunction

Function ПолучитьДоступныеНастройки(Val ИмяМодуля, Val ИмяФункции) Export
    Return GetAvailableSettings(ИмяМодуля, ИмяФункции);
EndFunction

Function ПолучитьТекущиеНастройки() Export
    Return GetCurrentSettings();
EndFunction

#EndRegion