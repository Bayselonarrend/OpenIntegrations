// OneScript: ./OInt/core/Modules/OPI_MySQL.os
// Lib: MySQL
// CLI: mysql
// Keywords: mysql, my sql

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

    Connector = OPI_AddIns.GetAddIn("MySQL");

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
// Checks that the value is an object of an MySQL AddIn
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_MySQL.Main";

EndFunction

// Execute SQL query
// Executes an arbitrary SQL query
//
// Note
// Query parameters are specified as an array of structures of the following type: `{'Type': 'Value'}`.^^
// The list of available types is described on the initial page of the MySQL library documentation
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

    Parameters_ = OPI_SQLQueries.ProcessParameters(Parameters, GetTypesStructure());
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
// Login - String - MySQL user - login
// Password - String - MySQL password - pass
// Port - String - Connection port - port
//
// Returns:
// String - MySQL database connection string
Function GenerateConnectionString(Val Address, Val Base = "", Val Login = "", Val Password = "", Val Port = "3306") Export

    OPI_TypeConversion.GetLine(Address);
    OPI_TypeConversion.GetLine(Login);
    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Port);
    OPI_TypeConversion.GetLine(Password);

    Port     = ?(ValueIsFilled(Port), ":" + Port, Port);
    Password = ?(ValueIsFilled(Password), ":" + Password, Password);

    StringTemplate   = "mysql://%1%2@%3%4/%5";
    ConnectionString = StrTemplate(StringTemplate, Login, Password, Address, Port, Base);

    Return ConnectionString;

EndFunction

// Get TLS Settings
// Forms settings for using TLS
//
// Note
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

    Result = OPI_SQLQueries.CreateDatabase(OPI_MySQL, Base, Connection, Tls);
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

    Result = OPI_SQLQueries.DeleteDatabase(OPI_MySQL, Base, Connection, Tls);
    Return Result;

EndFunction

// Create table
// Creates an empty table in the database
//
// Note
// The list of available types is described on the initial page of the MySQL library documentation
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

    Result = OPI_SQLQueries.CreateTable(OPI_MySQL, Table, ColoumnsStruct, Connection, Tls);
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

    Result = OPI_SQLQueries.AddTableColumn(OPI_MySQL, Table, Name, DataType, Connection, Tls);
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

    Result = OPI_SQLQueries.DeleteTableColumn(OPI_MySQL, Table, Name, Connection, Tls);
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
// Connection - String, Arbitrary - Existing connection or database path - dbc
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Result of query execution
Function EnsureTable(Val Table, Val ColoumnsStruct, Val Connection = "", Val Tls = "") Export

    Result = OPI_SQLQueries.EnsureTable(OPI_MySQL, Table, ColoumnsStruct, Connection, Tls);
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

    Result = OPI_SQLQueries.DeleteRecords(OPI_MySQL, Table, , Connection, Tls);
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

    Result = OPI_SQLQueries.DeleteTable(OPI_MySQL, Table, Connection, Tls);
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

    Result = OPI_SQLQueries.GetTableStructure(OPI_MySQL, Table, Connection, Tls);
    Return Result;

EndFunction

// Add rows
// Adds new rows to the table
//
// Note
// Record data is specified as an array of structures of the following type:^
// `{'Field name 1': {'Type': 'Value'}, 'Field name 2': {'Type': 'Value'},...}`
// The list of available types is described on the initial page of the MySQL library documentation
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

    Result = OPI_SQLQueries.AddRecords(OPI_MySQL, Table, DataArray, Transaction, Connection, Tls);
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

    Result = OPI_SQLQueries.GetRecords(OPI_MySQL
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
// Note
// Record data is specified as an array of structures of the following type:^
// `{'Field name 1': {'Type': 'Value'}, 'Field name 2': {'Type': 'Value'},...}`
// The list of available types is described on the initial page of the MySQL library documentation
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

    Result = OPI_SQLQueries.UpdateRecords(OPI_MySQL, Table, ValueStructure, Filters, Connection, Tls);
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

    Result = OPI_SQLQueries.DeleteRecords(OPI_MySQL, Table, Filters, Connection, Tls);
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
    Features.Insert("ParameterNumeration", False);
    Features.Insert("ParameterMarker"    , "?");
    Features.Insert("DBMS"               , "mysql");
    Features.Insert("ColumnField"        , "COLUMN_NAME");
    Features.Insert("TransactionStart"   , "BEGIN");

    Return Features;

EndFunction

Function GetTypesStructure() Export

    TypesStructure = New Map;
    TypesStructure.Insert("BinaryData"   , "BYTES");
    TypesStructure.Insert("UUID"         , "TEXT");
    TypesStructure.Insert("Boolean"      , "INT");
    TypesStructure.Insert("Float"        , "DOUBLE");
    TypesStructure.Insert("Whole"        , "DOUBLE");
    TypesStructure.Insert("Date"         , "DATE");
    TypesStructure.Insert("String"       , "TEXT");
    TypesStructure.Insert("Collections"  , New ValueList);
    TypesStructure.Insert("BoolAsNumber" , True);

    Return TypesStructure;

EndFunction

#EndRegion
