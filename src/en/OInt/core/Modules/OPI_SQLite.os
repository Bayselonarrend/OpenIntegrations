// OneScript: ./OInt/core/Modules/OPI_SQLite.os
// Lib: SQLite
// CLI: sqlite
// Keywords: sqlite
// Depends: OPI_SQLite

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

#Region Public

#Region CommonMethods

// Create connection !NOCLI
// Creates a connection to the specified base
//
// Parameters:
// Base - String - Path to database. In memory, if not filled - db
//
// Returns:
// Arbitrary - Connector object or structure with error information
Function CreateConnection(Val Base = "") Export

    If IsConnector(Base) Then
        Return Base;
    EndIf;

    OPI_TypeConversion.GetLine(Base);
    OPI_Tools.RestoreEscapeSequences(Base);

    Connector = OPI_AddIns.GetAddIn("SQLite");

    Connector.Database = Base;

    Result = Connector.Connect();
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return ?(Result["result"], Connector, Result);

EndFunction

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - db
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
// Checks that the value is an object of a SQLite AddIn
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_SQLite.Main";

EndFunction

// Execute SQL query
// Executes an arbitrary SQL query
//
// Note
// Available parameter types: String, Number, Date, Boolean, BinaryData.^^
// Binary data can also be passed as a `{'blob':File path}` structure. Binary data (BLOB) values are returned^^
// as `{'blob':Base64 string}`
// Without specifying the `ForcifyResult` flag, result data is returned only for queries beginning with `SELECT` keyword^^
// For other queries, `result:true` or `false` with error text is returned
// When performing multiple requests within a single connection, it is better to connect extensions once using the `ConnectExtension` function
//
// Parameters:
// QueryText - String - Database query text - sql
// Parameters - Array Of Arbitrary - Array of positional parameters of the request - params
// ForceResult - Boolean - Includes an attempt to retrieve the result, even for nonSELECT queries - force
// Connection - String, Arbitrary - Existing connection or path to the base. In memory, if not filled - db
// Extensions - Map Of KeyAndValue - Extensions: Key > filepath or extension data, Value > entry point - exts
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function ExecuteSQLQuery(Val QueryText
    , Val Parameters = ""
    , Val ForceResult = False
    , Val Connection = ""
    , Val Extensions = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(QueryText, True);
    OPI_TypeConversion.GetBoolean(ForceResult);

    If ValueIsFilled(Extensions) Then

        OPI_TypeConversion.GetKeyValueCollection(Extensions, "Incorrect collection of extensions!");

        For Each Extension In Extensions Do

            ExtensionConnection = ConnectExtension(Extension.Key, Extension.Value, Connector);

            If Not ExtensionConnection["result"] Then
                Return ExtensionConnection;
            EndIf;

        EndDo;

    EndIf;

    Parameters_ = OPI_SQLQueries.ProcessParameters(Parameters, GetTypesStructure());
    Result      = OPI_SQLQueries.ExecuteQueryWithProcessing(Connector, QueryText, ForceResult, Parameters_);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Connect extension !NOCLI
// Connects the SQLite extension for the specified connection
//
// Note
// The extension is active only for the current connection. You must reconnect it each time a new connection is established
// Similar to using the `Extensions` parameter (`exts` in CLI) of the `ExecuteSQLQuery` function
//
// Parameters:
// Extension - String, BinaryData - Extension data or filepath - ext
// EntryPoint - String - Expansion entry point, if required - point
// Connection - String, Arbitrary - Existing connection or path to the base. In memory, if not filled - db
//
// Returns:
// Map Of KeyAndValue - Result of extension connecting
Function ConnectExtension(Val Extension, Val EntryPoint = "", Val Connection = "") Export

    Extension_    = Extension;
    FileExtension = ?(OPI_Tools.IsWindows(), "dll", "so");

    OPI_TypeConversion.GetFileOnDisk(Extension_, FileExtension);
    OPI_TypeConversion.GetLine(EntryPoint);

    Temporary = Extension_["Temporary"];
    FilePath  = Extension_["Path"];
    Connector = CreateConnection(Connection);

    ComponentType = "AddIn.OPI_SQLite.Main";

    If TypeOf(Connector) <> Type(ComponentType) Then
        Return Connector;
    EndIf;

    Result = Connector.LoadExtension(FilePath, EntryPoint);
    Result = OPI_Tools.JsonToStructure(Result);

    If Temporary Then

        Try
            DeleteFiles(FilePath);
        Except
            Return Result;
        EndTry;

    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region ORM

// Get table information
// Gets information about the table
//
// Parameters:
// Table - String - Table name - table
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function GetTableInformation(Val Table, Val Connection = "") Export

    Result = OPI_SQLQueries.GetTableStructure(OPI_SQLite, Table, Connection);
    Return Result;

EndFunction

// Create table
// Creates an empty table in the database
//
// Parameters:
// Table - String - Table name - table
// ColoumnsStruct - Structure Of KeyAndValue - Column structure: Key > Name, Value > Data type - cols
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function CreateTable(Val Table, Val ColoumnsStruct, Val Connection = "") Export

    Result = OPI_SQLQueries.CreateTable(OPI_SQLite, Table, ColoumnsStruct, Connection);
    Return Result;

EndFunction

// Add table column
// Adds a new column to an existing table
//
// Parameters:
// Table - String - Table name - table
// Name - String - Column name - name
// DataType - String - Column data type - type
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function AddTableColumn(Val Table, Val Name, Val DataType, Val Connection = "") Export

    Result = OPI_SQLQueries.AddTableColumn(OPI_SQLite, Table, Name, DataType, Connection);
    Return Result;

EndFunction

// Delete table column
// Deletes a column from the table
//
// Parameters:
// Table - String - Table name - table
// Name - String - Column name - name
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DeleteTableColumn(Val Table, Val Name, Val Connection = "") Export

    Result = OPI_SQLQueries.DeleteTableColumn(OPI_SQLite, Table, Name, Connection);
    Return Result;

EndFunction

// Ensure table
// Creates a new table if it does not exist or updates the composition of columns in an existing table
//
// Note
// As a result of changing the table structure, data may be lost!^^
// It is recommended to test this method on test data beforehand
// This function does not update the data type of existing columns
//
// Parameters:
// Table - String - Table name - table
// ColoumnsStruct - Structure Of KeyAndValue - Column structure: Key > Name, Value > Data type - cols
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function EnsureTable(Val Table, Val ColoumnsStruct, Val Connection = "") Export

    Result = OPI_SQLQueries.EnsureTable(OPI_SQLite, Table, ColoumnsStruct, Connection);
    Return Result;

EndFunction

// Add rows
// Adds new rows to the table
//
// Note
// Binary data can also be transferred as a structure `{'blob':File path}`
//
// Parameters:
// Table - String - Table name - table
// DataArray - Array of Structure - An array of string data structures: Key > field, Value > field value - rows
// Transaction - Boolean - True > adding records to transactions with rollback on error - trn
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function AddRecords(Val Table, Val DataArray, Val Transaction = True, Val Connection = "") Export

    Result = OPI_SQLQueries.AddRecords(OPI_SQLite, Table, DataArray, Transaction, Connection);
    Return Result;

EndFunction

// Get records
// Gets records from the selected table
//
// Note
// Values of the Binary data type (BLOB) are returned as `{'blob':Base64 string}`
//
// Parameters:
// Table - String - Table name - table
// Fields - Array Of String - Fields for selection - fields
// Filters - Array of Structure - Filters array. See GetRecordsFilterStrucutre - filter
// Sort - Structure Of KeyAndValue - Sorting: Key > field name, Value > direction (ASC, DESC) - order
// Count - Number - Limiting the number of received strings - limit
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function GetRecords(Val Table
    , Val Fields = "*"
    , Val Filters = ""
    , Val Sort = ""
    , Val Count = ""
    , Val Connection = "") Export

    Result = OPI_SQLQueries.GetRecords(OPI_SQLite, Table, Fields, Filters, Sort, Count, Connection);
    Return Result;

EndFunction

// Update records
// Updates the value of records by selected criteria
//
// Parameters:
// Table - String - Table name - table
// ValueStructure - Structure Of KeyAndValue - Values structure: Key > field, Value > field value - values
// Filters - Array of Structure - Filters array. See GetRecordsFilterStrucutre - filter
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function UpdateRecords(Val Table, Val ValueStructure, Val Filters = "", Val Connection = "") Export

    Result = OPI_SQLQueries.UpdateRecords(OPI_SQLite, Table, ValueStructure, Filters, Connection);
    Return Result;

EndFunction

// Delete records
// Deletes records from the table
//
// Parameters:
// Table - String - Table name - table
// Filters - Array of Structure - Filters array. See GetRecordsFilterStrucutre - filter
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DeleteRecords(Val Table, Val Filters = "", Val Connection = "") Export

    Result = OPI_SQLQueries.DeleteRecords(OPI_SQLite, Table, Filters, Connection);
    Return Result;

EndFunction

// Delete table
// Deletes a table from the database
//
// Parameters:
// Table - String - Table name - table
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function DeleteTable(Val Table, Val Connection = "") Export

    Result = OPI_SQLQueries.DeleteTable(OPI_SQLite, Table, Connection);
    Return Result;

EndFunction

// Clear table
// Clears the database table
//
// Parameters:
// Table - String - Table name - table
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function ClearTable(Val Table, Val Connection = "") Export

    Result = OPI_SQLQueries.DeleteRecords(OPI_SQLite, Table, , Connection);
    Return Result;

EndFunction

// Get records filter strucutre
// Gets the template structure for filtering records in ORM queries
//
// Note
// The use of the `raw` feature is necessary for compound constructions like `BEETWEEN`.^^
// For example: with `raw:false` the filter `type:BETWEEN` `value:10 AND 20` will be interpolated as `BETWEEN ?1 `^^
// where `?1 = "10 AND 20,"' which would cause an error.
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
    Features.Insert("ParameterMarker"    , "?");
    Features.Insert("DBMS"               , "sqlite");
    Features.Insert("ColumnField"        , "name");
    Features.Insert("TransactionStart"   , "BEGIN");

    Return Features;

EndFunction

Function GetTypesStructure() Export

    Text_ = "TEXT";

    TypesStructure = New Map;
    TypesStructure.Insert("BinaryData"   , "BLOB");
    TypesStructure.Insert("UUID"         , Text_);
    TypesStructure.Insert("Boolean"      , "BOOL");
    TypesStructure.Insert("Float"        , "REAL");
    TypesStructure.Insert("Whole"        , "INTEGER");
    TypesStructure.Insert("Date"         , Text_);
    TypesStructure.Insert("String"       , Text_);
    TypesStructure.Insert("Collections"  , New ValueList);
    TypesStructure.Insert("BoolAsNumber" , False);

    Return TypesStructure;

EndFunction

#EndRegion

#Region Alternate

Function ОткрытьСоединение(Val База = "") Export
	Return CreateConnection(База);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
	Return CloseConnection(Соединение);
EndFunction

Function ЭтоКоннектор(Val Значение) Export
	Return IsConnector(Значение);
EndFunction

Function ВыполнитьЗапросSQL(Val ТекстЗапроса, Val Параметры = "", Val ФорсироватьРезультат = False, Val Соединение = "", Val Расширения = Undefined) Export
	Return ExecuteSQLQuery(ТекстЗапроса, Параметры, ФорсироватьРезультат, Соединение, Расширения);
EndFunction

Function ПодключитьРасширение(Val Расширение, Val ТочкаВхода = "", Val Соединение = "") Export
	Return ConnectExtension(Расширение, ТочкаВхода, Соединение);
EndFunction

Function ПолучитьИнформациюОТаблице(Val Таблица, Val Соединение = "") Export
	Return GetTableInformation(Таблица, Соединение);
EndFunction

Function СоздатьТаблицу(Val Таблица, Val СтруктураКолонок, Val Соединение = "") Export
	Return CreateTable(Таблица, СтруктураКолонок, Соединение);
EndFunction

Function ДобавитьКолонкуТаблицы(Val Таблица, Val Имя, Val ТипДанных, Val Соединение = "") Export
	Return AddTableColumn(Таблица, Имя, ТипДанных, Соединение);
EndFunction

Function УдалитьКолонкуТаблицы(Val Таблица, Val Имя, Val Соединение = "") Export
	Return DeleteTableColumn(Таблица, Имя, Соединение);
EndFunction

Function ГарантироватьТаблицу(Val Таблица, Val СтруктураКолонок, Val Соединение = "") Export
	Return EnsureTable(Таблица, СтруктураКолонок, Соединение);
EndFunction

Function ДобавитьЗаписи(Val Таблица, Val МассивДанных, Val Транзакция = True, Val Соединение = "") Export
	Return AddRecords(Таблица, МассивДанных, Транзакция, Соединение);
EndFunction

Function ПолучитьЗаписи(Val Таблица, Val Поля = "*", Val Фильтры = "", Val Сортировка = "", Val Количество = "", Val Соединение = "") Export
	Return GetRecords(Таблица, Поля, Фильтры, Сортировка, Количество, Соединение);
EndFunction

Function ОбновитьЗаписи(Val Таблица, Val СтруктураЗначений, Val Фильтры = "", Val Соединение = "") Export
	Return UpdateRecords(Таблица, СтруктураЗначений, Фильтры, Соединение);
EndFunction

Function УдалитьЗаписи(Val Таблица, Val Фильтры = "", Val Соединение = "") Export
	Return DeleteRecords(Таблица, Фильтры, Соединение);
EndFunction

Function УдалитьТаблицу(Val Таблица, Val Соединение = "") Export
	Return DeleteTable(Таблица, Соединение);
EndFunction

Function ОчиститьТаблицу(Val Таблица, Val Соединение = "") Export
	Return ClearTable(Таблица, Соединение);
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