// OneScript: ./OInt/api/nativeapi/Modules/OPI_NativeAPI.os
// Lib: NativeAPI
// CLI: nativeapi
// Keywords: native api, addin, component, ffi

// DocsCategory: Other
// DocsNameRU: Native API
// DocsNameEN: Native API

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
// BSLLS:CommonModuleNameClientServer-off
// BSLLS:MagicNumber-off
// BSLLS:LineLength-off

//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check constructor-function-return-section

// #Use "../../../tools/main"

#If Not WebClient Then // !OPI

#Region Public

#Region Main

// Get logging settings !NOCLI
// Returns the logging settings template of the AddIn
//
// Parameters:
// WriteToMemory - Boolean - Write log to memory of the AddIn                            - memory
// MaxEvents     - Number  - Maximum number of events in memory                          - max
// FilePath      - String  - Path to the log file. If filled, writes the log to the file - path
//
// Returns:
// Structure Of KeyAndValue - Logging settings
Function GetLoggingSettings(Val WriteToMemory = True
    , Val MaxEvents = 300
    , Val FilePath = "") Export

    Return OPI_AddIns.GetLoggingSettings(WriteToMemory, MaxEvents, FilePath);

EndFunction

// Create host !NOCLI
// Creates a Native API proxy object and loads the specified DLL/SO
//
// Parameters:
// Path    - String                   - Full path to the analyzed library file   - path
// Logging - Structure Of KeyAndValue - Logging settings. See GetLoggingSettings - log
//
// Returns:
// Arbitrary - Host object or structure with error information
Function CreateHost(Val Path, Val Logging = Undefined) Export

    OPI_TypeConversion.GetLine(Path);

    AddIn = OPI_AddIns.GetAddIn("NativeAPI");

    If Logging <> Undefined Then

        ErrorText      = "Incorrect logging settings";
        OPI_TypeConversion.GetKeyValueCollection(Logging, ErrorText);
        SettingsString = OPI_AddIns.SerializeJanx(Logging);

        If ValueIsFilled(SettingsString) Then

            LogResult = AddIn.SetLogger(SettingsString);
            LogResult = OPI_AddIns.DesrializeJanx(LogResult);

            If Not LogResult["result"] Then
                Return LogResult;
            EndIf;

        EndIf;

    EndIf;

    Result = AddIn.OpenLibrary(Path);
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return ?(Result["result"], AddIn, Result);

EndFunction

// Is host !NOCLI
// Checks if the value is an object of the Native API proxy component
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is host
Function IsHost(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_NativeAPI.Main";

EndFunction

// Get log !NOCLI
// Returns log of Native API AddIn
//
// Parameters:
// Host       - String, Arbitrary - Host object or path to the AddIn. See CreateHost - host
// AsString   - Boolean           - Return log as a single line with line breaks     - asString
// EventCount - Number            - Number of last events                            - count
//
// Returns:
// Arbitrary - Log or log string
Function GetLog(Val Host, Val AsString = False, Val EventCount = 100) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    Return OPI_AddIns.GetLog(Host
        , AsString
        , EventCount);

EndFunction

#EndRegion

#Region WorkWithLibrary

// Get class names
// Returns a list of classes declared in the AddIn
//
// Parameters:
// Host - String, Arbitrary - Host object or path to the AddIn. See CreateHost - host
//
// Returns:
// Map Of KeyAndValue - Result with class list
Function GetClassNames(Val Host) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    Result = Host.GetClassNames();

    Return OPI_AddIns.DesrializeJanx(Result);

EndFunction

#EndRegion

#Region WorkWithInstance

// Create instance !NOCLI
// Creates an object of the analyzed AddIn of the specified class and saves it in the host
//
// Parameters:
// Host  - String, Arbitrary - Host object or path to the AddIn. See CreateHost - host
// Class - String            - Class name for creating instance                 - class
//
// Returns:
// Map Of KeyAndValue - Instance UUID or structure with error
Function CreateInstance(Val Host, Val Class) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    OPI_TypeConversion.GetLine(Class);

    Result = Host.CreateInstance(Class);

    Return OPI_AddIns.DesrializeJanx(Result);

EndFunction

// Destroy instance !NOCLI
// Destroys the previously created instance of the analyzed AddIn
//
// Parameters:
// Host     - String, Arbitrary - Host object or path to the AddIn. See CreateHost - host
// Instance - String            - Instance UUID. See CreateInstance                - class
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DestroyInstance(Val Host, Val Instance) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    OPI_TypeConversion.GetLine(Instance);

    Result = Host.DestroyInstance(Instance);

    Return OPI_AddIns.DesrializeJanx(Result);

EndFunction

// Get metadata
// Returns the description of the instance methods and properties of the AddIn
//
// Parameters:
// Host     - String, Arbitrary - Host object or path to the AddIn. See CreateHost - host
// Instance - String            - Instance UUID or class name                      - class
//
// Returns:
// Map Of KeyAndValue - AddIn metadata
Function GetMetadata(Val Host, Val Instance) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    OPI_TypeConversion.GetLine(Instance);

    Result = Host.GetMetadata(Instance);

    Return OPI_AddIns.DesrializeJanx(Result);

EndFunction

// Invoke method
// Calls the instance method of the AddIn by name or number
//
// Parameters:
// Host       - String, Arbitrary  - Host object or path to the AddIn. See CreateHost      - host
// Instance   - String             - Instance UUID or class name for temporary instance    - class
// Method     - String             - Method name                                           - method
// Parameters - Array Of Arbitrary - Parameters of the called function                     - params
// Properties - Map Of KeyAndValue - Values for setting instance properties before calling - props
//
// Returns:
// Map Of KeyAndValue - Result of the call, method value and all instance properties
Function ExecuteMethod(Val Host, Val Instance, Val Method, Val Parameters = Undefined, Val Properties = Undefined) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    OPI_TypeConversion.GetLine(Instance);
    OPI_TypeConversion.GetLine(Method);

    If Parameters  = Undefined Then
        Parameters = New Array;
    Else
        OPI_TypeConversion.GetArray(Parameters);
    EndIf;

    JanxProperties = "";

    If Properties <> Undefined Then

        OPI_TypeConversion.GetKeyValueCollection(Properties);
        JanxProperties = OPI_AddIns.SerializeJanx(Properties);

    EndIf;

    JanxParameters = OPI_AddIns.SerializeJanx(Parameters);

    Result = Host.CallMethod(Instance, Method, JanxParameters, JanxProperties);
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

// Get properties
// Returns the values of all readable instance properties of the AddIn
//
// Parameters:
// Host     - String, Arbitrary - Host object or path to the AddIn. See CreateHost   - host
// Instance - String            - Instance UUID or class name for temporary instance - class
//
// Returns:
// Map Of KeyAndValue - Property name correspondence and their values
Function GetProperties(Val Host, Val Instance) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    OPI_TypeConversion.GetLine(Instance);

    Result = Host.GetProperties(Instance);

    Return OPI_AddIns.DesrializeJanx(Result);

EndFunction

// Get property
// Reads the value of the instance property of the AddIn
//
// Parameters:
// Host     - String, Arbitrary - Host object or path to the AddIn. See CreateHost   - host
// Instance - String            - Instance UUID or class name for temporary instance - class
// Property - String, Number    - PropertyName                                       - prop
//
// Returns:
// Map Of KeyAndValue - Property value
Function GetProperty(Val Host, Val Instance, Val Property) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    OPI_TypeConversion.GetLine(Instance);
    OPI_TypeConversion.GetLine(Property);

    Result = Host.GetProperty(Instance, Property);

    Return OPI_AddIns.DesrializeJanx(Result);

EndFunction

// Set property !NOCLI
// Writes the value of the instance property of the AddIn
//
// Parameters:
// Host     - String, Arbitrary - Host object or path to the AddIn. See CreateHost   - host
// Instance - String            - Instance UUID or class name for temporary instance - class
// Property - String, Number    - PropertyName                                       - prop
// Value    - Arbitrary         - New value                                          - value
//
// Returns:
// Map Of KeyAndValue - Operation result
Function SetProperty(Val Host, Val Instance, Val Property, Val Value) Export

    Host = ResolveHost(Host);

    If Not IsHost(Host) Then
        Return Host;
    EndIf;

    OPI_TypeConversion.GetLine(Instance);
    OPI_TypeConversion.GetLine(Property);

    JanxValue = OPI_AddIns.SerializeJanx(Value);
    Result    = Host.SetProperty(Instance, Property, JanxValue);

    Return OPI_AddIns.DesrializeJanx(Result);

EndFunction

#EndRegion

#EndRegion

#Region Private

Function ResolveHost(Val Host)

    If IsHost(Host) Then
        Return Host;
    EndIf;

    Return CreateHost(Host);

EndFunction

#EndRegion

#EndIf // !OPI
