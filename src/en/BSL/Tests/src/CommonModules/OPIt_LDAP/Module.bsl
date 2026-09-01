// OneScript: ./OInt/tests/Modules/OPIt_LDAP.os

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

// #Use oint
// #Use asserts
// #Use "internal"

#If Not WebClient Then // !OPI

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("LDAP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("LDAP");

EndFunction

#Region Internal

#Region RunnableTests

#Region LDAP

Procedure LDAP_CommonMethods() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    LDAP_FormConnectionParameters(TestParameters);
    LDAP_CreateConnection(TestParameters);
    LDAP_GetConnectionConfiguration(TestParameters);
    LDAP_CloseConnection(TestParameters);
    LDAP_IsConnector(TestParameters);
    LDAP_GetTlsSettings(TestParameters);
    LDAP_GetLoggingSettings(TestParameters);
    LDAP_GetLog(TestParameters);

EndProcedure

Procedure LDAP_WorkWithDirectory() Export

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    LDAP_PerformSearch(TestParameters);
    LDAP_Add(TestParameters);
    LDAP_Change(TestParameters);
    LDAP_Compare(TestParameters);
    LDAP_Delete(TestParameters);

EndProcedure

Procedure LDAP_AdvancedCheck() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = OPI_TestDataRetrieval.GetTestData();
    LDAP_Advanced_PerformSearchWithoutConnection(TestParameters);
    LDAP_Extended_Reconnection(TestParameters);
    LDAP_Extended_GetLogOnConnection(TestParameters);

EndProcedure

#EndRegion // LDAP

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region LDAP

Procedure LDAP_FormConnectionParameters(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    Result = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "FormConnectionParameters");

EndProcedure

Procedure LDAP_CreateConnection(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Result           = OPI_LDAP.CreateConnection(ConnectionParams);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "CreateConnection");

EndProcedure

Procedure LDAP_CloseConnection(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    Result           = OPI_LDAP.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "CloseConnection");

EndProcedure

Procedure LDAP_IsConnector(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    Result           = OPI_LDAP.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "IsConnector");

EndProcedure

Procedure LDAP_GetConnectionConfiguration(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    Result           = OPI_LDAP.GetConnectionConfiguration(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "GetConnectionConfiguration");

EndProcedure

Procedure LDAP_GetTlsSettings(FunctionParameters)

    Result = OPI_LDAP.GetTlsSettings(False, "");

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "GetTlsSettings");

EndProcedure

Procedure LDAP_GetLoggingSettings(FunctionParameters)

    Result = OPI_LDAP.GetLoggingSettings(True, 100, GetTempFileName());

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "GetLoggingSettings");

    Result = OPI_LDAP.GetLoggingSettings(False, , GetTempFileName());

    OPI_TestDataRetrieval.Process(Result, "LDAP", "GetLoggingSettings", "File");

    Result = OPI_LDAP.GetLoggingSettings(True);

    OPI_TestDataRetrieval.Process(Result, "LDAP", "GetLoggingSettings", "Memory");

EndProcedure

Procedure LDAP_GetLog(FunctionParameters)

    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_LDAP.GetLoggingSettings(True, 100, LogFile);

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams, , LoggingSettings);

    If Not OPI_LDAP.IsConnector(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    Base = "dc=example,dc=org";
    Result = OPI_LDAP.PerformSearch(Connection, Base);

    OPI_TestDataRetrieval.Process(Result, "LDAP", "PerformSearch", "Select"); // SKIP

    Result = OPI_LDAP.GetLog(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "GetLog", , LogFile);

    Result = OPI_LDAP.GetLog(Connection, True);

    OPI_TestDataRetrieval.Process(Result, "LDAP", "GetLog", "AsString", LogFile);

EndProcedure

Procedure LDAP_PerformSearch(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    Base = "dc=example,dc=org";
    Filter = "(objectClass=*)";

    Result = OPI_LDAP.PerformSearch(Connection, Base, Filter);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "PerformSearch");

    Result = OPI_LDAP.PerformSearch(ConnectionParams, Base, Filter);

    OPI_TestDataRetrieval.Process(Result, "LDAP", "PerformSearch", "No connection");

EndProcedure

Procedure LDAP_Add(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    DN = "cn=OPI Test User,dc=example,dc=org";

    OPI_LDAP.Delete(Connection, DN); // SKIP

    ObjectClasses = New Array;
    ObjectClasses.Add("top");
    ObjectClasses.Add("person");
    ObjectClasses.Add("organizationalPerson");
    ObjectClasses.Add("inetOrgPerson");

    NamesCN = New Array;
    NamesCN.Add("OPI Test User");

    Surnames = New Array;
    Surnames.Add("User");

    Identifiers = New Array;
    Identifiers.Add("opitest");

    Attributes = New Structure;
    Attributes.Insert("objectClass", ObjectClasses);
    Attributes.Insert("cn"         , NamesCN);
    Attributes.Insert("sn"         , Surnames);
    Attributes.Insert("uid"        , Identifiers);

    Result = OPI_LDAP.Add(Connection, DN, Attributes);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "Add");

    SearchResult = OPI_LDAP.PerformSearch(Connection, DN, "(objectClass=*)", , "base");

    OPI_TestDataRetrieval.Process(SearchResult, "LDAP", "Add", "Check");

EndProcedure

Procedure LDAP_Change(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    DN = "cn=OPI Test User,dc=example,dc=org";

    EmailValues = New Array;
    EmailValues.Add("test@example.org");

    Change = New Structure;
    Change.Insert("operation", "replace");
    Change.Insert("attribute", "mail");
    Change.Insert("values"   , EmailValues);

    Changes = New Array;
    Changes.Add(Change);

    Result = OPI_LDAP.Change(Connection, DN, Changes);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "Change");

    SearchResult = OPI_LDAP.PerformSearch(Connection, DN, "(objectClass=*)", , "base");

    OPI_TestDataRetrieval.Process(SearchResult, "LDAP", "Change", "Check");

EndProcedure

Procedure LDAP_Delete(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    DN = "cn=OPI Test User,dc=example,dc=org";

    Result = OPI_LDAP.Delete(Connection, DN);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "Delete");

    SearchResult = OPI_LDAP.PerformSearch(Connection, "dc=example,dc=org", "(uid=opitest)");

    OPI_TestDataRetrieval.Process(SearchResult, "LDAP", "Delete", "Check");

EndProcedure

Procedure LDAP_Compare(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams);
    DN = "cn=OPI Test User,dc=example,dc=org";
    Attribute        = "mail";
    Value            = "test@example.org";

    Result = OPI_LDAP.Compare(Connection, DN, Attribute, Value);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "Compare");

EndProcedure

#Region ExtendedCheck

Procedure LDAP_Advanced_PerformSearchWithoutConnection(FunctionParameters)

    Connector = OPI_AddIns.GetAddIn("LDAP");
    Parameters = OPI_AddIns.SerializeJanx(New Structure("base,filter", "dc=example,dc=com", "(objectClass=*)"));
    Result    = OPI_AddIns.DesrializeJanx(Connector.Search(Parameters));

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "Advanced_PerformSearchWithoutConnection");

EndProcedure

Procedure LDAP_Extended_Reconnection(FunctionParameters)

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    Connector       = OPI_AddIns.GetAddIn("LDAP");
    FirstConnection = OPI_AddIns.DesrializeJanx(Connector.Connect(URL, BindDN, Password, Timeout));

    If Not FirstConnection["result"] Then
        Raise OPI_Tools.JSONString(FirstConnection);
    EndIf;

    Result = OPI_AddIns.DesrializeJanx(Connector.Connect(URL, BindDN, Password, Timeout));

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "Extended_Reconnection");

EndProcedure

Procedure LDAP_Extended_GetLogOnConnection(FunctionParameters)

    LogFile         = GetTempFileName("txt");
    LoggingSettings = OPI_LDAP.GetLoggingSettings(True, 100, LogFile);

    URL      = FunctionParameters["LDAP_URL"];
    BindDN = "cn=admin,dc=example,dc=org";
    Password = FunctionParameters["LDAP_Password"];
    Timeout  = 30;

    ConnectionParams = OPI_LDAP.FormConnectionParameters(URL, BindDN, Password, Timeout);
    Connection       = OPI_LDAP.CreateConnection(ConnectionParams, , LoggingSettings);

    If Not OPI_LDAP.IsConnector(Connection) Then
        Raise OPI_Tools.JSONString(Connection);
    EndIf;

    OPI_LDAP.PerformSearch(Connection, "dc=example,dc=org");

    Result = OPI_LDAP.GetLog(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "LDAP", "Extended_GetLogOnConnection", , LogFile);

EndProcedure

#EndRegion // ExtendedCheck

#EndRegion // LDAP

#EndRegion // AtomicTests

#EndRegion // Private

#EndIf // !OPI
