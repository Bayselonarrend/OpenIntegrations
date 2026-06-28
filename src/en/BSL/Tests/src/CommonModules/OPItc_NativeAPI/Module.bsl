// OneScript: ./OInt/tests/Modules/OPItc_NativeAPI.os

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MethodSize-off
// BSLLS:NumberOfOptionalParams-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check module-unused-local-variable

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("NativeAPI");

EndProcedure

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("NativeAPI");

EndFunction

#Region RunnableTests

Procedure NativeAPI_CommonMethods() Export

    NativeAPI_GetLoggingSettings();
    NativeAPI_CreateHost();
    NativeAPI_IsHost();
    NativeAPI_GetLog();

EndProcedure

Procedure NativeAPI_WorkWithLibrary() Export

    NativeAPI_CreateHost();
    NativeAPI_GetClassNames();

EndProcedure

Procedure NativeAPI_WorkWithInstance() Export

    NativeAPI_CreateHost();
    NativeAPI_CreateInstance();
    NativeAPI_GetMetadata();
    NativeAPI_GetProperties();
    NativeAPI_ExecuteMethod();
    NativeAPI_GetProperty();
    NativeAPI_SetProperty();
    NativeAPI_DestroyInstance();

EndProcedure

#EndRegion

#Region AtomicTests

Procedure NativeAPI_GetLoggingSettings()

    Result = OPI_NativeAPI.GetLoggingSettings(True, 100, GetTempFileName());

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetLoggingSettings");

    Result = OPI_NativeAPI.GetLoggingSettings(False, , GetTempFileName());

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetLoggingSettings", "File");

    Result = OPI_NativeAPI.GetLoggingSettings(True);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetLoggingSettings", "Memory");

EndProcedure

Procedure NativeAPI_CreateHost()

    TFN = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);

    Result = OPI_NativeAPI.CreateHost(TFN);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "CreateHost");

    OPI_TestDataRetrieval.WriteParameter("NativeAPI_Host", Result);

EndProcedure

Procedure NativeAPI_IsHost()

    Host   = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Result = OPI_NativeAPI.IsHost(Host);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "IsHost");

    Result = OPI_NativeAPI.IsHost("not a host");

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "IsHost", "False");

EndProcedure

Procedure NativeAPI_GetLog()

    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_NativeAPI.GetLoggingSettings(True, 100, LogFile);
    TFN             = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);
    Host            = OPI_NativeAPI.CreateHost(TFN, LoggingSettings);

    Result = OPI_NativeAPI.GetLog(Host);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetLog", , LogFile);

    Result = OPI_NativeAPI.GetLog(Host, True);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetLog", "AsString", LogFile);

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting file of the AddIn");

EndProcedure

Procedure NativeAPI_GetClassNames()

    Host   = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Options = New Structure;
    Options.Insert("host", Host);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetClassNames", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetClassNames");

    TFN    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);
    Options = New Structure;
    Options.Insert("host", TFN);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetClassNames", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetClassNames", "Path");

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting file of the AddIn");

EndProcedure

Procedure NativeAPI_CreateInstance()

    Host   = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Result = OPI_NativeAPI.CreateInstance(Host, "Main");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "CreateInstance");

    OPI_TestDataRetrieval.WriteParameter("NativeAPI_Instance", Result["instance_id"]);

EndProcedure

Procedure NativeAPI_DestroyInstance()

    Host     = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Instance = OPI_TestDataRetrieval.GetParameter("NativeAPI_Instance");
    Result   = OPI_NativeAPI.DestroyInstance(Host, Instance);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "DestroyInstance");

EndProcedure

Procedure NativeAPI_GetMetadata()

    Host     = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Instance = OPI_TestDataRetrieval.GetParameter("NativeAPI_Instance");
    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("class", Instance);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetMetadata", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetMetadata");

    TFN    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);
    Options = New Structure;
    Options.Insert("host", TFN);
    Options.Insert("class", "Main");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetMetadata", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetMetadata", "ClassName");

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting file of the AddIn");

EndProcedure

Procedure NativeAPI_GetProperties()

    Host     = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Instance = OPI_TestDataRetrieval.GetParameter("NativeAPI_Instance");
    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("class", Instance);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetProperties", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetProperties");

    TFN    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);
    Options = New Structure;
    Options.Insert("host", TFN);
    Options.Insert("class", "Main");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetProperties", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetProperties", "ClassName");

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting file of the AddIn");

EndProcedure

Procedure NativeAPI_ExecuteMethod()

    Host       = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Instance   = OPI_TestDataRetrieval.GetParameter("NativeAPI_Instance");
    Parameters = New Array;
    Parameters.Add(New BinaryData("key"));
    Parameters.Add(New BinaryData("data"));

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("class", Instance);
    Options.Insert("method", "HmacSha256");
    Options.Insert("params", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "ExecuteMethod", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "ExecuteMethod");

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("class", Instance);
    Options.Insert("method", "Version");
    Options.Insert("params", New Array);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "ExecuteMethod", "Version");

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("class", Instance);
    Options.Insert("method", "Version");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "ExecuteMethod", "WithoutParameters");

    TFN    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);
    Options = New Structure;
    Options.Insert("host", TFN);
    Options.Insert("class", "Main");
    Options.Insert("method", "Version");
    Options.Insert("params", New Array);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "ExecuteMethod", "ClassName");

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting file of the AddIn");

    AddInTF    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_SQLite").Write(AddInTF);
    TFN        = GetTempFileName("sqlite");
    Properties = New Map;
    Properties.Insert("Database", TFN);

    Options = New Structure;
    Options.Insert("host", AddInTF);
    Options.Insert("class", "Main");
    Options.Insert("method", "Connect");
    Options.Insert("params", New Array);
    Options.Insert("props", Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "ExecuteMethod", "SQLite", TFN);

    OPI_Tools.RemoveFileWithTry(TFN    , "Database file deletion error");
    OPI_Tools.RemoveFileWithTry(AddInTF, "Error deleting file of the AddIn");

    AddInTF    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_SQLite").Write(AddInTF);
    TFN        = GetTempFileName("sqlite");
    SQLiteHost = OPI_NativeAPI.CreateHost(AddInTF);
    Creation   = OPI_NativeAPI.CreateInstance(SQLiteHost, "Main");
    Instance   = Creation["instance_id"];

    Properties = New Map;
    Properties.Insert("Database", TFN);

    OPI_NativeAPI.ExecuteMethod(SQLiteHost, Instance, "Connect", New Array, Properties);

    Parameters = New Array;
    Parameters.Add("SELECT 1 AS n");
    Parameters.Add(True);
    Parameters.Add(False);

    Options = New Structure;
    Options.Insert("host", SQLiteHost);
    Options.Insert("class", Instance);
    Options.Insert("method", "InitQuery");
    Options.Insert("params", Parameters);
    Options.Insert("props", Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "ExecuteMethod", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "ExecuteMethod", "SQLiteRequest");

    OPI_NativeAPI.DestroyInstance(SQLiteHost, Instance);
    OPI_Tools.RemoveFileWithTry(TFN    , "Database file deletion error");
    OPI_Tools.RemoveFileWithTry(AddInTF, "Error deleting file of the AddIn");

EndProcedure

Procedure NativeAPI_GetProperty()

    Host     = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Instance = OPI_TestDataRetrieval.GetParameter("NativeAPI_Instance");
    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("class", Instance);
    Options.Insert("prop", "MissingProperty");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetProperty", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetProperty");

    TFN    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);
    Options = New Structure;
    Options.Insert("host", TFN);
    Options.Insert("class", "Main");
    Options.Insert("prop", "MissingProperty");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("nativeapi", "GetProperty", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "GetProperty", "ClassName");

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting file of the AddIn");

EndProcedure

Procedure NativeAPI_SetProperty()

    Host     = OPI_TestDataRetrieval.GetParameter("NativeAPI_Host");
    Instance = OPI_TestDataRetrieval.GetParameter("NativeAPI_Instance");
    Result   = OPI_NativeAPI.SetProperty(Host, Instance, "MissingProperty", "value");

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "SetProperty");

    TFN    = GetTempFileName();
    OPI_Tools.GetAddInTemplate("OPI_Cryptography").Write(TFN);
    Result = OPI_NativeAPI.SetProperty(TFN, "Main", "MissingProperty", "value");

    OPI_TestDataRetrieval.ProcessCLI(Result, "NativeAPI", "SetProperty", "ClassName");

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting file of the AddIn");

EndProcedure

#EndRegion


#Region Alternate

Procedure NativeAPI_ОсновныеМетоды() Export
    NativeAPI_CommonMethods();
EndProcedure

Procedure NativeAPI_РаботаСБиблиотекой() Export
    NativeAPI_WorkWithLibrary();
EndProcedure

Procedure NativeAPI_РаботаСЭкземпляром() Export
    NativeAPI_WorkWithInstance();
EndProcedure

#EndRegion
