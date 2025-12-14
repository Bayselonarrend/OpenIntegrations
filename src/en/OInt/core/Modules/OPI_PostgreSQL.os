// OneScript: ./OInt/core/Modules/OPI_PostgreSQL.os
// Lib: PostgreSQL
// CLI: postgres
// Keywords: postgresql, postgre sql, postgres
// Depends: OPI_PostgreSQL

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#Region Public

#Region CommonMethods

// Create connection !NOCLI
// Creates a connection to the specified base
//
// Parameters:
// ConnectionString - String - Connection string. See GenerateConnectionString - string
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Arbitrary - Connector object or structure with error information
Function CreateConnection(Val ConnectionString = "", Val Tls = "") Export

    If IsConnector(ConnectionString) Then
        Return ConnectionString;
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionString);
    OPI_Tools.RestoreEscapeSequences(ConnectionString);

    Connector = OPI_AddIns.GetAddIn("PostgreSQL");

    Tls = OPI_AddIns.SetTls(Connector, Tls);

    If Not OPI_Tools.GetOr(Tls, "result", False) Then
        Return Tls;
    EndIf;

    Connector.ConnectionString = ConnectionString;

    Result = Connector.Connect();
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return ?(Result["result"], Connector, Result);

EndFunction

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - dbc
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
Function CloseConnection(Val Connection) Export

    If IsConnector(Connection) Then

        Result = Connection.Close();
        Result = OPI_Tools.JsonToStructure(Result, False);

    Else

        Result = New Structure("result,error", False, "It's not a connection");

    EndIf;

    Return Result;

EndFunction

// Is connector !NOCLI
// Checks that the value is an object of a PostgreSQL AddIn
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_PostgreSQL.Main";

EndFunction

// Execute SQL query
// Executes an arbitrary SQL query
//
// Note:
// Query parameters are specified as an array of structures of the following type: `{'Type': 'Value'}`.^^
// The list of available types is described on the initial page of the PostgreSQL library documentation
// Without specifying the `ForcifyResult` flag, result data is returned only for queries beginning with `SELECT` keyword^^
// For other queries, `result:true` or `false` with error text is returned
//
// Parameters:
// QueryText - String - Database query text - sql
// Parameters - Array Of Arbitrary - Array of positional parameters of the request - params
// ForceResult - Boolean - Includes an attempt to retrieve the result, even for nonSELECT queries - force
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function ExecuteSQLQuery(Val QueryText
    , Val Parameters = ""
    , Val ForceResult = False
    , Val Connection = ""
    , Val Tls = "") Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(QueryText, True);
    OPI_TypeConversion.GetBoolean(ForceResult);

    Parameters_ = OPI_SQLQueries.ProcessParameters(Connector, Parameters, GetTypesStructure());
    Result      = OPI_SQLQueries.ExecuteQueryWithProcessing(Connector, QueryText, ForceResult, Parameters_);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Generate connection string
// Forms a connection string from the passed data
//
// Parameters:
// Address - String - IP address or domain name of the server - addr
// Base - String - Name of the database to connect - db
// Login - String - Postgres user login - login
// Password - String - Postgres user password - pass
// Port - String - Connection port - port
//
// Returns:
// String - PostgreSQL database connection string
Function GenerateConnectionString(Val Address, Val Base, Val Login, Val Password = "", Val Port = "5432") Export

    OPI_TypeConversion.GetLine(Address);
    OPI_TypeConversion.GetLine(Login);
    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Port);
    OPI_TypeConversion.GetLine(Password);

    Port     = ?(ValueIsFilled(Port), ":" + Port, Port);
    Password = ?(ValueIsFilled(Password), ":" + Password, Password);

    StringTemplate   = "postgresql://%1%2@%3%4/%5";
    ConnectionString = StrTemplate(StringTemplate, Login, Password, Address, Port, Base);

    Return ConnectionString;

EndFunction

// Get TLS Settings
// Forms settings for using TLS
//
// Note:
// Tls settings can only be set when a connection is created: explicitly, by using the `CreateConnection` function^^
// or implicit, when passing the connection string to ORM methods.
// Passing Tls settings together with passing an already created connection to the `Connection` parameter will be ignored
//
// Parameters:
// DisableCertVerification - Boolean - Allows to work with invalid certificates, including self signed - trust
// CertFilepath - String - Path to the root PEM file of the certificate if it is not in the system repository - cert
//
// Returns:
// Structure Of KeyAndValue - Structure of TLS connection settings
Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export

    Return OPI_AddIns.GetTlsSettings(DisableCertVerification, CertFilepath);

EndFunction

#EndRegion

#Region ORM

// Create database
// Creates a database with the specified name
//
// Parameters:
// Base - String - Database name - base
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function CreateDatabase(Val Base, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.CreateDatabase(OPI_PostgreSQL, Base, Connection, Tls);
    Return Result;

EndFunction

// Drop database
// Deletes the database
//
// Parameters:
// Base - String - Database name - base
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DeleteDatabase(Val Base, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.DeleteDatabase(OPI_PostgreSQL, Base, Connection, Tls);
    Return Result;

EndFunction

// Disable all database connections
// Terminates all connections to the database except the current one
//
// Parameters:
// Base - String - Database name - base
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DisableAllDatabaseConnections(Val Base, Val Connection = "", Val Tls = "") Export

    OPI_TypeConversion.GetLine(Base);

    TextSQL        = "SELECT pg_terminate_backend(pid)
    |FROM pg_stat_activity
    |WHERE datname = '%1' AND pid <> pg_backend_pid();";

    TextSQL = StrTemplate(TextSQL, Base);

    Result = ExecuteSQLQuery(TextSQL, , , Connection, Tls);

    Return Result;

EndFunction

// Get table information
// Gets information about the table
//
// Parameters:
// Table - String - Table name - table
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function GetTableInformation(Val Table, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.GetTableStructure(OPI_PostgreSQL, Table, Connection, Tls);
    Return Result;

EndFunction

// Create table
// Creates an empty table in the database
//
// Note:
// The list of available types is described on the initial page of the PostgreSQL library documentation
//
// Parameters:
// Table - String - Table name - table
// ColoumnsStruct - Structure Of KeyAndValue - Column structure: Key > Name, Value > Data type - cols
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function CreateTable(Val Table, Val ColoumnsStruct, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.CreateTable(OPI_PostgreSQL, Table, ColoumnsStruct, Connection, Tls);
    Return Result;

EndFunction

// Add table column
// Adds a new column to an existing table
//
// Parameters:
// Table - String - Table name - table
// Name - String - Column name - name
// DataType - String - Column data type - type
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function AddTableColumn(Val Table, Val Name, Val DataType, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.AddTableColumn(OPI_PostgreSQL, Table, Name, DataType, Connection, Tls);
    Return Result;

EndFunction

// Delete table column
// Deletes a column from the table
//
// Parameters:
// Table - String - Table name - table
// Name - String - Column name - name
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DeleteTableColumn(Val Table, Val Name, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.DeleteTableColumn(OPI_PostgreSQL, Table, Name, Connection, Tls);
    Return Result;

EndFunction

// Ensure table
// Creates a new table if it does not exist or updates the composition of columns in an existing table
//
// Note:
// As a result of changing the table structure, data may be lost!^^
// It is recommended to test this method on test data beforehand
// This function does not update the data type of existing columns
//
// Parameters:
// Table - String - Table name - table
// ColoumnsStruct - Structure Of KeyAndValue - Column structure: Key > Name, Value > Data type - cols
// Connection - String, Arbitrary - Existing connection or database path - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function EnsureTable(Val Table, Val ColoumnsStruct, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.EnsureTable(OPI_PostgreSQL, Table, ColoumnsStruct, Connection, Tls);
    Return Result;

EndFunction

// Clear table
// Clears the database table
//
// Parameters:
// Table - String - Table name - table
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function ClearTable(Val Table, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.DeleteRecords(OPI_PostgreSQL, Table, , Connection, Tls);
    Return Result;

EndFunction

// Delete table
// Deletes a table from the database
//
// Parameters:
// Table - String - Table name - table
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DeleteTable(Val Table, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.DeleteTable(OPI_PostgreSQL, Table, Connection, Tls);
    Return Result;

EndFunction

// Add rows
// Adds new rows to the table
//
// Note:
// Record data is specified as an array of structures of the following type:^
// `{'Field name 1': {'Type': 'Value'}, 'Field name 2': {'Type': 'Value'},...}`
// The list of available types is described on the initial page of the PostgreSQL library documentation
//
// Parameters:
// Table - String - Table name - table
// DataArray - Array of Structure - An array of string data structures: Key > field, Value > field value - rows
// Transaction - Boolean - True > adding records to transactions with rollback on error - trn
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function AddRecords(Val Table, Val DataArray, Val Transaction = True, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.AddRecords(OPI_PostgreSQL, Table, DataArray, Transaction, Connection, Tls);
    Return Result;

EndFunction

// Get records
// Gets records from the selected table
//
// Parameters:
// Table - String - Table name - table
// Fields - Array Of String - Fields for selection - fields
// Filters - Array of Structure - Filters array. See GetRecordsFilterStrucutre - filter
// Sort - Structure Of KeyAndValue - Sorting: Key > field name, Value > direction (ASC, DESC) - order
// Count - Number - Limiting the number of received strings - limit
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function GetRecords(Val Table
    , Val Fields = "*"
    , Val Filters = ""
    , Val Sort = ""
    , Val Count = ""
    , Val Connection = ""
    , Val Tls = "") Export

    Result = OPI_SQLQueries.GetRecords(OPI_PostgreSQL
        , Table
        , Fields
        , Filters
        , Sort
        , Count
        , Connection
        , Tls);

    Return Result;

EndFunction

// Update records
// Updates the value of records by selected criteria
//
// Note:
// Record data is specified as an array of structures of the following type:^
// `{'Field name 1': {'Type': 'Value'}, 'Field name 2': {'Type': 'Value'},...}`
// The list of available types is described on the initial page of the PostgreSQL library documentation
//
// Parameters:
// Table - String - Table name - table
// ValueStructure - Structure Of KeyAndValue - Values structure: Key > field, Value > field value - values
// Filters - Array of Structure - Filters array. See GetRecordsFilterStrucutre - filter
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function UpdateRecords(Val Table
    , Val ValueStructure
    , Val Filters = ""
    , Val Connection = ""
    , Val Tls = "") Export

    Result = OPI_SQLQueries.UpdateRecords(OPI_PostgreSQL, Table, ValueStructure, Filters, Connection, Tls);
    Return Result;

EndFunction

// Delete records
// Deletes records from the table
//
// Parameters:
// Table - String - Table name - table
// Filters - Array of Structure - Filters array. See GetRecordsFilterStrucutre - filter
// Connection - String, Arbitrary - Connection or connection string - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DeleteRecords(Val Table, Val Filters = "", Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.DeleteRecords(OPI_PostgreSQL, Table, Filters, Connection, Tls);
    Return Result;

EndFunction

// Get records filter strucutre
// Gets the template structure for filtering records in ORM queries
//
// Note:
// The use of the `raw` feature is necessary for compound constructions like `BEETWEEN`.^^
// For example: with `raw:false` the filter `type:BETWEEN` `value:10 AND 20` will be interpolated as `BETWEEN ?1 `^^
// where `?1 = "10 AND 20,"' which would cause an error..^^
// In such a case, you must use `raw:true` to set the condition directly in the query text
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Record filter element
Function GetRecordsFilterStrucutre(Val Clear = False) Export

    Return OPI_SQLQueries.GetRecordsFilterStrucutre(Clear);

EndFunction

#EndRegion

#EndRegion

#Region Internal

Function GetFeatures() Export

    Features = New Map;
    Features.Insert("ParameterNumeration", True);
    Features.Insert("ParameterMarker"    , "$");
    Features.Insert("DBMS"               , "postgres");
    Features.Insert("ColumnField"        , "column_name");
    Features.Insert("TransactionStart"   , "BEGIN");

    Return Features;

EndFunction

Function GetTypesStructure() Export

    CollectionsTypes = New ValueList();
    CollectionsTypes.Add("JSONB");
    CollectionsTypes.Add("JSON");
    CollectionsTypes.Add("HSTORE");

    TypesStructure = New Map;
    TypesStructure.Insert("BinaryData"   , "BYTEA");
    TypesStructure.Insert("UUID"         , "UUID");
    TypesStructure.Insert("Boolean"      , "BOOL");
    TypesStructure.Insert("Float"        , "REAL");
    TypesStructure.Insert("Whole"        , "INT");
    TypesStructure.Insert("Date"         , "TIMESTAMP");
    TypesStructure.Insert("String"       , "VARCHAR");
    TypesStructure.Insert("Collections"  , CollectionsTypes);
    TypesStructure.Insert("BoolAsNumber" , False);

    Return TypesStructure;

EndFunction

#EndRegion

#Region Alternate

Function ОткрытьСоединение(Val СтрокаПодключения = "", Val Tls = "") Export
	Return CreateConnection(СтрокаПодключения, Tls);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
	Return CloseConnection(Соединение);
EndFunction

Function ЭтоКоннектор(Val Значение) Export
	Return IsConnector(Значение);
EndFunction

Function ВыполнитьЗапросSQL(Val ТекстЗапроса, Val Параметры = "", Val ФорсироватьРезультат = False, Val Соединение = "", Val Tls = "") Export
	Return ExecuteSQLQuery(ТекстЗапроса, Параметры, ФорсироватьРезультат, Соединение, Tls);
EndFunction

Function СформироватьСтрокуПодключения(Val Адрес, Val База, Val Логин, Val Пароль = "", Val Порт = "5432") Export
	Return GenerateConnectionString(Адрес, База, Логин, Пароль, Порт);
EndFunction

Function ПолучитьНастройкиTls(Val ОтключитьПроверкуСертификатов, Val ПутьКСертификату = "") Export
	Return GetTlsSettings(ОтключитьПроверкуСертификатов, ПутьКСертификату);
EndFunction

Function СоздатьБазуДанных(Val База, Val Соединение = "", Val Tls = "") Export
	Return CreateDatabase(База, Соединение, Tls);
EndFunction

Function УдалитьБазуДанных(Val База, Val Соединение = "", Val Tls = "") Export
	Return DeleteDatabase(База, Соединение, Tls);
EndFunction

Function ОтключитьВсеСоединенияБазыДанных(Val База, Val Соединение = "", Val Tls = "") Export
	Return DisableAllDatabaseConnections(База, Соединение, Tls);
EndFunction

Function ПолучитьИнформациюОТаблице(Val Таблица, Val Соединение = "", Val Tls = "") Export
	Return GetTableInformation(Таблица, Соединение, Tls);
EndFunction

Function СоздатьТаблицу(Val Таблица, Val СтруктураКолонок, Val Соединение = "", Val Tls = "") Export
	Return CreateTable(Таблица, СтруктураКолонок, Соединение, Tls);
EndFunction

Function ДобавитьКолонкуТаблицы(Val Таблица, Val Имя, Val ТипДанных, Val Соединение = "", Val Tls = "") Export
	Return AddTableColumn(Таблица, Имя, ТипДанных, Соединение, Tls);
EndFunction

Function УдалитьКолонкуТаблицы(Val Таблица, Val Имя, Val Соединение = "", Val Tls = "") Export
	Return DeleteTableColumn(Таблица, Имя, Соединение, Tls);
EndFunction

Function ГарантироватьТаблицу(Val Таблица, Val СтруктураКолонок, Val Соединение = "", Val Tls = "") Export
	Return EnsureTable(Таблица, СтруктураКолонок, Соединение, Tls);
EndFunction

Function ОчиститьТаблицу(Val Таблица, Val Соединение = "", Val Tls = "") Export
	Return ClearTable(Таблица, Соединение, Tls);
EndFunction

Function УдалитьТаблицу(Val Таблица, Val Соединение = "", Val Tls = "") Export
	Return DeleteTable(Таблица, Соединение, Tls);
EndFunction

Function ДобавитьЗаписи(Val Таблица, Val МассивДанных, Val Транзакция = True, Val Соединение = "", Val Tls = "") Export
	Return AddRecords(Таблица, МассивДанных, Транзакция, Соединение, Tls);
EndFunction

Function ПолучитьЗаписи(Val Таблица, Val Поля = "*", Val Фильтры = "", Val Сортировка = "", Val Количество = "", Val Соединение = "", Val Tls = "") Export
	Return GetRecords(Таблица, Поля, Фильтры, Сортировка, Количество, Соединение, Tls);
EndFunction

Function ОбновитьЗаписи(Val Таблица, Val СтруктураЗначений, Val Фильтры = "", Val Соединение = "", Val Tls = "") Export
	Return UpdateRecords(Таблица, СтруктураЗначений, Фильтры, Соединение, Tls);
EndFunction

Function УдалитьЗаписи(Val Таблица, Val Фильтры = "", Val Соединение = "", Val Tls = "") Export
	Return DeleteRecords(Таблица, Фильтры, Соединение, Tls);
EndFunction

Function ПолучитьСтруктуруФильтраЗаписей(Val Пустая = False) Export
	Return GetRecordsFilterStrucutre(Пустая);
EndFunction

Function ПолучитьОсобенности() Export
	Return GetFeatures();
EndFunction

Function ПолучитьСтруктуруТипов() Export
	Return GetTypesStructure();
EndFunction

#EndRegion