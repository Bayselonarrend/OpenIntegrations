// OneScript: ./OInt/tools/main/Modules/OPI_AdvancedCall.os

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
#Use "./internal/Modules/internal"

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
Function CallWithSettings(Val ModuleName, Val FunctionName, Val Parameters = Undefined,
    Val Settings = Undefined) Export

    NormalizedSettings = NormalizeSettings(Settings);

    If OPI_Tools.GetOr(NormalizedSettings, "dontwait", False) Then

        #If Client Then

            Raise "Background job execution is not available on the client!";

        #Else

            UID = New UUID;

            ResultAddress = Undefined;

            JobParameters = New Array;
            JobParameters.Add(ModuleName);
            JobParameters.Add(FunctionName);
            JobParameters.Add(Parameters);
            JobParameters.Add(NormalizedSettings);
            JobParameters.Add(ResultAddress);

            Result = BackgroundJobs.Execute(ЭтотОбъект, "CallWithSettingsService", JobParameters);

        #EndIf

    Else

        Result = CallWithSettingsService(ModuleName, FunctionName, Parameters, NormalizedSettings);

    EndIf;

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

    TemplateStructure = GetFullSettingsIndex();
    SettingsStructure = FindInIndex(TemplateStructure, ModuleName, FunctionName);

    If SettingsStructure = Undefined Then
        Return "There are no available settings for this function";
    EndIf;

    DescriptionArray = New Array;

    For Each Setting In SettingsStructure Do
        DescriptionArray.Add(StrTemplate("%1: %2", Setting.Key, Setting.Value));
    EndDo;

    Return StrConcat(DescriptionArray, Chars.LF);

EndFunction

#EndRegion

#Region Internal

Function CallWithSettingsService(Val ModuleName, Val FunctionName, Val Parameters, Val Settings,
    Val StorageAddress = Undefined) Export

    SetSettings(Settings);

    If ValueIsFilled(Parameters) Then
        OPI_TypeConversion.GetArray(Parameters);
    Else
        Parameters = New Array;
    EndIf;

    StringParameters = New Array;

    For N = 0 To Parameters.UBound() Do
        StringParameters.Add(StrTemplate("Parameters[%1]", N));
    EndDo;

    OPI_TypeConversion.GetLine(ModuleName);
    OPI_TypeConversion.GetLine(FunctionName);

    CallString = StrTemplate("Result = %1.%2(%3);", ModuleName, FunctionName, StrConcat(StringParameters, ", "));

    Result = Undefined;

    Try
        //@skip-check server-execution-safe-mode
        Execute(CallString);
    Except
        DeleteSettings();
        Raise;
    EndTry;

    DeleteSettings();

    If ValueIsFilled(StorageAddress) Then
    EndIf;

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

Function GetCurrentSettings() Export

    Try
        //@skip-check bsl-legacy-check-string-literal
        Return CurrentSettings;
    Except
        Return Undefined;
    EndTry;

EndFunction

Function GetFullSettingsIndex() Export

    TemplateText      = OPI_Tools.GetTextTemplate("OPI_Text_MethodSettings");
    TemplateStructure = OPI_Tools.JsonToStructure(TemplateText, False);

    Return TemplateStructure;

EndFunction

Function FindInIndex(Val Index, Val ModuleName, Val FunctionName) Export

    OPI_TypeConversion.GetLine(ModuleName);
    OPI_TypeConversion.GetLine(FunctionName);

    NoSettings = False;

    Try
        SettingsStructure = Index[ModuleName][FunctionName];
    Except

        NoSettings = True;

    EndTry;

    If NoSettings Or SettingsStructure.Count() = 0 Then
        Return Undefined;
    EndIf;

    Return SettingsStructure;

EndFunction

Function SetSettings(Val Settings) Export

    If ValueIsFilled(Settings) Then

        CurrentSettings = Settings;


    EndIf;

    Return CurrentSettings;

EndFunction

Function NormalizeIntermediateResult(Val Result) Export

    NormalizedResult = Undefined;

    If OPI_Tools.GetOr(GetCurrentSettings(), "adv_response", False)
        And OPI_Tools.CollectionFieldExists(Result, "body", NormalizedResult) Then

        Return NormalizedResult;

    EndIf;

    Return Result;

EndFunction

Procedure DeleteSettings() Export

    //@skip-check module-unused-local-variable
    CurrentSettings = New Structure;


EndProcedure

#EndRegion

#Region Private

Function NormalizeSettings(Val Settings)

    If ValueIsFilled(Settings) Then

        ErrorText = "The passed settings are not a valid key-value structure";
        OPI_TypeConversion.GetKeyValueCollection(Settings, ErrorText);

        If Not TypeOf(Settings) = Type("Structure") Then

            NormalizedSettings = New Structure;

            For Each KeyValue In Settings Do
                NormalizedSettings.Insert(KeyValue.Key, KeyValue.Value);
            EndDo;

        Else
            NormalizedSettings = OPI_Tools.CopyCollection(Settings);
        EndIf;

    Else
        NormalizedSettings = New Structure;
    EndIf;

    Return NormalizedSettings;

EndFunction

#EndRegion


#Region Alternate

Function ВызватьСНастройками(Val ИмяМодуля, Val ИмяФункции, Val Параметры = Undefined, Val Настройки = Undefined) Export
    Return CallWithSettings(ИмяМодуля, ИмяФункции, Параметры, Настройки);
EndFunction

Function ПолучитьДоступныеНастройки(Val ИмяМодуля, Val ИмяФункции) Export
    Return GetAvailableSettings(ИмяМодуля, ИмяФункции);
EndFunction

Function ВызватьСНастройкамиСлужебный(Val ИмяМодуля, Val ИмяФункции, Val Параметры, Val Настройки, Val АдресХранилища = Undefined) Export
    Return CallWithSettingsService(ИмяМодуля, ИмяФункции, Параметры, Настройки, АдресХранилища);
EndFunction

Function ПолучитьТекущиеНастройки() Export
    Return GetCurrentSettings();
EndFunction

Function ПолучитьПолныйИндексНастроек() Export
    Return GetFullSettingsIndex();
EndFunction

Function НайтиВИндексе(Val Индекс, Val ИмяМодуля, Val ИмяФункции) Export
    Return FindInIndex(Индекс, ИмяМодуля, ИмяФункции);
EndFunction

Function УстановитьНастройки(Val Настройки) Export
    Return SetSettings(Настройки);
EndFunction

Function НормализоватьПромежуточныйРезультат(Val Результат) Export
    Return NormalizeIntermediateResult(Результат);
EndFunction

Procedure УдалитьНастройки() Export
    DeleteSettings();
EndProcedure

#EndRegion