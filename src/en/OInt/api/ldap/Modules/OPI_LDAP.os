// OneScript: ./OInt/api/ldap/Modules/OPI_LDAP.os
// Lib: LDAP
// CLI: ldap
// Keywords: ldap, active directory, ad

// DocsCategory: Exchange
// DocsNameRU: LDAP
// DocsNameEN: LDAP

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
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check bsl-variable-name-invalid

#Use "../../../tools/main"
#Use "../../../tools/http"

#Region Public

#Region CommonMethods

// Create connection !NOCLI
// Open LDAP connection and perform bind
//
// Parameters:
// ConnectionParams - Structure Of KeyAndValue - Connection parameters. See FormConnectionParameters - params
// Tls              - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings      - tls
// Logging          - Structure Of KeyAndValue - Logging settings. See GetLoggingSettings            - log
//
// Returns:
// Arbitrary - Connector object or structure with error information
Function CreateConnection(Val ConnectionParams, Val Tls = Undefined, Val Logging = Undefined) Export

    Result_ = "result";

    If IsConnector(ConnectionParams) Then
        Return ConnectionParams;
    EndIf;

    OPI_TypeConversion.GetKeyValueCollection(ConnectionParams);

    RequiredArray = StrSplit("url,bind_dn,password,timeout", ",");
    MissingArray  = OPI_Tools.FindMissingCollectionFields(ConnectionParams, RequiredArray);

    If ValueIsFilled(MissingArray) Then
        Raise StrTemplate("Missing connection parameters: %1", StrConcat(MissingArray, ", "));
    EndIf;

    Connector = OPI_AddIns.GetAddIn("LDAP");

    Tls = OPI_AddIns.SetTls(Connector, Tls);

    If Not OPI_Tools.GetOr(Tls, Result_, False) Then
        Return Tls;
    EndIf;

    If Logging = Undefined Then

        SettingsString = "";

    Else

        ErrorText      = "Incorrect logging settings";
        OPI_TypeConversion.GetKeyValueCollection(Logging, ErrorText);
        SettingsString = OPI_AddIns.SerializeJanx(Logging);

    EndIf;

    If ValueIsFilled(SettingsString) Then

        LogResult = Connector.SetLogger(SettingsString);
        LogResult = OPI_AddIns.DesrializeJanx(LogResult);

        If Not LogResult[Result_] Then
            Return LogResult;
        EndIf;

    EndIf;

    URL      = ConnectionParams["url"];
    BindDN   = ConnectionParams["bind_dn"];
    Password = ConnectionParams["password"];
    Timeout  = ConnectionParams["timeout"];

    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(BindDN);
    OPI_TypeConversion.GetLine(Password);
    OPI_TypeConversion.GetNumber(Timeout);

    Result = Connector.Connect(URL, BindDN, Password, Timeout);
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return ?(Result[Result_], Connector, Result);

EndFunction

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - conn
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
Function CloseConnection(Val Connection) Export

    If IsConnector(Connection) Then

        Result = Connection.Disconnect();
        Result = OPI_AddIns.DesrializeJanx(Result);

    Else

        Result = New Structure("result,error", False, "It's not a connection");

    EndIf;

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Form connection parameters
// Form LDAP connection parameters collection
//
// Parameters:
// URL      - String - Server URL (ldap: or ldaps:)     - url
// BindDN   - String - DN for bind                      - bind
// Password - String - Password for bind                - pass
// Timeout  - Number - Timeout of operations in seconds - tout
//
// Returns:
// Structure Of KeyAndValue - Structure of connection parameters
Function FormConnectionParameters(Val URL, Val BindDN = "", Val Password = "", Val Timeout = 30) Export

    ConnectionParams = New Structure;
    OPI_Tools.AddField("url"     , URL      , "String" , ConnectionParams);
    OPI_Tools.AddField("bind_dn" , BindDN   , "String" , ConnectionParams);
    OPI_Tools.AddField("password", Password , "String" , ConnectionParams);
    OPI_Tools.AddField("timeout" , Timeout  , "Number" , ConnectionParams);

    Return ConnectionParams;

EndFunction

// Get connection configuration
// Return current connection settings
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - conn
//
// Returns:
// Map Of KeyAndValue - Connection configuration
Function GetConnectionConfiguration(Val Connection) Export

    If Not IsConnector(Connection) Then
        Return New Structure("result,error", False, "It's not a connection");
    EndIf;

    Result = Connection.GetConfiguration();
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

// Is connector !NOCLI
// Check if value is an object of an external LDAP component
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_LDAP.Main";

EndFunction

// Get TLS Settings
// Form TLS connection settings structure for LDAP connection
//
// Parameters:
// DisableCertVerification - Boolean - Allows to work with invalid certificates, including self signed                    - trust
// CertFilepath            - String  - Path to the root PEM file of the certificate if it is not in the system repository - cert
//
// Returns:
// Structure Of KeyAndValue - Structure of TLS connection settings
Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetTlsSettings(DisableCertVerification, CertFilepath);

EndFunction

// Get logging settings !NOCLI
// Retrieves settings structure for enabling logging when opening a connection
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
// Retrieves connection log data (when in-memory logging is enabled)
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection                          - conn
// AsString   - Boolean   - True > returns log as a single string, False > as an array - str
// EventCount - Number    - Number of recent events to retrieve. 0 > no limits         - count
//
// Returns:
// String, Map Of KeyAndValue - Log as a string or a map with the full execution result
Function GetLog(Val Connection, Val AsString = False, Val EventCount = 100) Export

    Return OPI_AddIns.GetLog(Connection
        , AsString
        , EventCount);

EndFunction

#EndRegion

#Region WorkWithCatalog

// PerformSearch
// Perform LDAP search
//
// Note:
// When passing connection parameters, a new connection will be created and closed within one call
//
// Parameters:
// Connection - Arbitrary, Structure Of KeyAndValue - Connection or connection parameters - conn
// Base       - String                              - Base search DN                      - base
// Filter     - String                              - LDAP                                - filter
// Attributes - Array of String, Undefined          - List of attributes for selection    - attrs
// Region     - String                              - Scope: base, one, subtree           - scope
//
// Returns:
// Map Of KeyAndValue - Search result
Function PerformSearch(Val Connection
    , Val Base
    , Val Filter = "(objectClass=*)"
    , Val Attributes = Undefined
    , Val Region = "subtree") Export

    CloseConnection = False;

    If IsConnector(Connection) Then
        Connector       = Connection;
    Else
        Connector       = CreateConnection(Connection);
        CloseConnection = True;
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Filter);
    OPI_TypeConversion.GetLine(Region);

    If ValueIsFilled(Attributes) Then
        OPI_TypeConversion.GetArray(Attributes);
    EndIf;

    SearchParameters = New Structure;
    OPI_Tools.AddField("base"      , Base       , "String", SearchParameters, True);
    OPI_Tools.AddField("filter"    , Filter     , "String", SearchParameters);
    OPI_Tools.AddField("scope"     , Region     , "String", SearchParameters);
    OPI_Tools.AddField("attributes", Attributes , "Array" , SearchParameters);

    ParameterString = OPI_AddIns.SerializeJanx(SearchParameters);
    Result          = Connector.Search(ParameterString);
    Result          = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Add
// Add record to LDAP directory
//
// Parameters:
// Connection - Arbitrary, Structure Of KeyAndValue - Connection or connection parameters - conn
// DN         - String                              - DN of added record                  - dn
// Attributes - Structure Of KeyAndValue            - Record attributes                   - attrs
//
// Returns:
// Map Of KeyAndValue - Operation result
Function Add(Val Connection, Val DN, Val Attributes) Export

    CloseConnection = False;

    If IsConnector(Connection) Then
        Connector       = Connection;
    Else
        Connector       = CreateConnection(Connection);
        CloseConnection = True;
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(DN);
    OPI_TypeConversion.GetKeyValueCollection(Attributes);

    AdditionParameters = New Structure;
    OPI_Tools.AddField("dn"        , DN        , "String"     , AdditionParameters);
    OPI_Tools.AddField("attributes", Attributes, "KeyAndValue", AdditionParameters);

    ParameterString = OPI_AddIns.SerializeJanx(AdditionParameters);

    //@skip-check bsl-legacy-check-dynamic-feature-access
    Result = Connector.Add(ParameterString);
    Result = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Change
// Modify record in LDAP directory
//
// Parameters:
// Connection - Arbitrary, Structure Of KeyAndValue - Connection or connection parameters - conn
// DN         - String                              - DN of modified record               - dn
// Changes    - Array of Structure                  - List of attribute changes           - changes
//
// Returns:
// Map Of KeyAndValue - Operation result
Function Change(Val Connection, Val DN, Val Changes) Export

    CloseConnection = False;

    If IsConnector(Connection) Then
        Connector       = Connection;
    Else
        Connector       = CreateConnection(Connection);
        CloseConnection = True;
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(DN);
    OPI_TypeConversion.GetArray(Changes);

    ModificationParameters = New Structure;
    OPI_Tools.AddField("dn"     , DN      , "String", ModificationParameters);
    OPI_Tools.AddField("changes", Changes , "Array" , ModificationParameters);

    ParameterString = OPI_AddIns.SerializeJanx(ModificationParameters);
    Result          = Connector.Modify(ParameterString);
    Result          = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Delete
// Delete record from LDAP directory
//
// Parameters:
// Connection - Arbitrary, Structure Of KeyAndValue - Connection or connection parameters - conn
// DN         - String                              - DN of deleted record                - dn
//
// Returns:
// Map Of KeyAndValue - Operation result
Function Delete(Val Connection, Val DN) Export

    CloseConnection = False;

    If IsConnector(Connection) Then
        Connector       = Connection;
    Else
        Connector       = CreateConnection(Connection);
        CloseConnection = True;
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(DN);

    //@skip-check bsl-legacy-check-dynamic-feature-access
    Result = Connector.Delete(DN);
    Result = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Compare
// Compare LDAP record attribute value
//
// Parameters:
// Connection - Arbitrary, Structure Of KeyAndValue - Connection or connection parameters - conn
// DN         - String                              - DN record                           - dn
// Attribute  - String                              - AttributeName                       - attr
// Value      - String                              - Expected value                      - value
//
// Returns:
// Map Of KeyAndValue - Comparison result
Function Compare(Val Connection, Val DN, Val Attribute, Val Value) Export

    CloseConnection = False;

    If IsConnector(Connection) Then
        Connector       = Connection;
    Else
        Connector       = CreateConnection(Connection);
        CloseConnection = True;
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(DN);
    OPI_TypeConversion.GetLine(Attribute);
    OPI_TypeConversion.GetLine(Value);

    ComparisonParameters = New Structure;
    OPI_Tools.AddField("dn"       , DN        , "String", ComparisonParameters);
    OPI_Tools.AddField("attribute", Attribute , "String", ComparisonParameters);
    OPI_Tools.AddField("value"    , Value     , "String", ComparisonParameters);

    ParameterString = OPI_AddIns.SerializeJanx(ComparisonParameters);
    Result          = Connector.Compare(ParameterString);
    Result          = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

#EndRegion

#EndRegion


#Region Alternate

Function ОткрытьСоединение(Val ПараметрыСоединения, Val Tls = Undefined, Val Логирование = Undefined) Export
    Return CreateConnection(ПараметрыСоединения, Tls, Логирование);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
    Return CloseConnection(Соединение);
EndFunction

Function СформироватьПараметрыСоединения(Val URL, Val BindDN = "", Val Пароль = "", Val Таймаут = 30) Export
    Return FormConnectionParameters(URL, BindDN, Пароль, Таймаут);
EndFunction

Function ПолучитьКонфигурациюСоединения(Val Соединение) Export
    Return GetConnectionConfiguration(Соединение);
EndFunction

Function ЭтоКоннектор(Val Значение) Export
    Return IsConnector(Значение);
EndFunction

Function ПолучитьНастройкиTls(Val ОтключитьПроверкуСертификатов, Val ПутьКСертификату = "") Export
    Return GetTlsSettings(ОтключитьПроверкуСертификатов, ПутьКСертификату);
EndFunction

Function ПолучитьНастройкиЛогирования(Val ЗаписьВПамять = True, Val МаксимумСобытий = 300, Val ПутьКФайлу = "") Export
    Return GetLoggingSettings(ЗаписьВПамять, МаксимумСобытий, ПутьКФайлу);
EndFunction

Function ПолучитьЛог(Val Соединение, Val КакСтрока = False, Val ЧислоСобытий = 100) Export
    Return GetLog(Соединение, КакСтрока, ЧислоСобытий);
EndFunction

Function ВыполнитьПоиск(Val Соединение, Val База, Val Фильтр = "(objectClass=*)", Val Атрибуты = Undefined, Val Область = "subtree") Export
    Return PerformSearch(Соединение, База, Фильтр, Атрибуты, Область);
EndFunction

Function Добавить(Val Соединение, Val DN, Val Атрибуты) Export
    Return Add(Соединение, DN, Атрибуты);
EndFunction

Function Изменить(Val Соединение, Val DN, Val Изменения) Export
    Return Change(Соединение, DN, Изменения);
EndFunction

Function Удалить(Val Соединение, Val DN) Export
    Return Delete(Соединение, DN);
EndFunction

Function Сравнить(Val Соединение, Val DN, Val Атрибут, Val Значение) Export
    Return Compare(Соединение, DN, Атрибут, Значение);
EndFunction

#EndRegion