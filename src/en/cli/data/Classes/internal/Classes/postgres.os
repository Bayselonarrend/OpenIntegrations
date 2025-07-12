﻿
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "EXECUTESQLQUERY";
    NewLine.Parameter    = "--sql";
    NewLine.Description    = "Database query text";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Executes an arbitrary SQL query";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "EXECUTESQLQUERY";
    NewLine.Parameter    = "--params";
    NewLine.Description    = "Array of positional parameters of the request (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "EXECUTESQLQUERY";
    NewLine.Parameter    = "--force";
    NewLine.Description    = "Includes an attempt to retrieve the result, even for nonSELECT queries (optional, def. val. - False)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "EXECUTESQLQUERY";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "EXECUTESQLQUERY";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--addr";
    NewLine.Description    = "IP address or domain name of the server";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Forms a connection string from the passed data";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Name of the database to connect";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--login";
    NewLine.Description    = "Postgres user login";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--pass";
    NewLine.Description    = "Postgres user password (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--port";
    NewLine.Description    = "Connection port (optional, def. val. - 5432)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetTlsSettings";
    NewLine.SearchMethod = "GETTLSSETTINGS";
    NewLine.Parameter    = "--trust";
    NewLine.Description    = "Allows to work with invalid certificates, including self signed";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetTlsSettings";
    NewLine.SearchMethod = "GETTLSSETTINGS";
    NewLine.Parameter    = "--cert";
    NewLine.Description    = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "CreateDatabase";
    NewLine.SearchMethod = "CREATEDATABASE";
    NewLine.Parameter    = "--base";
    NewLine.Description    = "Database name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Creates a database with the specified name";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "CreateDatabase";
    NewLine.SearchMethod = "CREATEDATABASE";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "CreateDatabase";
    NewLine.SearchMethod = "CREATEDATABASE";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteDatabase";
    NewLine.SearchMethod = "DELETEDATABASE";
    NewLine.Parameter    = "--base";
    NewLine.Description    = "Database name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Deletes the database";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteDatabase";
    NewLine.SearchMethod = "DELETEDATABASE";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteDatabase";
    NewLine.SearchMethod = "DELETEDATABASE";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DisableAllDatabaseConnections";
    NewLine.SearchMethod = "DISABLEALLDATABASECONNECTIONS";
    NewLine.Parameter    = "--base";
    NewLine.Description    = "Database name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Terminates all connections to the database except the current one";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DisableAllDatabaseConnections";
    NewLine.SearchMethod = "DISABLEALLDATABASECONNECTIONS";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DisableAllDatabaseConnections";
    NewLine.SearchMethod = "DISABLEALLDATABASECONNECTIONS";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetTableInformation";
    NewLine.SearchMethod = "GETTABLEINFORMATION";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Gets information about the table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetTableInformation";
    NewLine.SearchMethod = "GETTABLEINFORMATION";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetTableInformation";
    NewLine.SearchMethod = "GETTABLEINFORMATION";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "CreateTable";
    NewLine.SearchMethod = "CREATETABLE";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Creates an empty table in the database";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "CreateTable";
    NewLine.SearchMethod = "CREATETABLE";
    NewLine.Parameter    = "--cols";
    NewLine.Description    = "Column structure: Key > Name, Value > Data type";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "CreateTable";
    NewLine.SearchMethod = "CREATETABLE";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "CreateTable";
    NewLine.SearchMethod = "CREATETABLE";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ADDTABLECOLUMN";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Adds a new column to an existing table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ADDTABLECOLUMN";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Column name";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ADDTABLECOLUMN";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Column data type";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ADDTABLECOLUMN";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ADDTABLECOLUMN";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteTableColumn";
    NewLine.SearchMethod = "DELETETABLECOLUMN";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Deletes a column from the table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteTableColumn";
    NewLine.SearchMethod = "DELETETABLECOLUMN";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Column name";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteTableColumn";
    NewLine.SearchMethod = "DELETETABLECOLUMN";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteTableColumn";
    NewLine.SearchMethod = "DELETETABLECOLUMN";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "EnsureTable";
    NewLine.SearchMethod = "ENSURETABLE";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Creates a new table if it does not exist or updates the composition of columns in an existing table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "EnsureTable";
    NewLine.SearchMethod = "ENSURETABLE";
    NewLine.Parameter    = "--cols";
    NewLine.Description    = "Column structure: Key > Name, Value > Data type";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "EnsureTable";
    NewLine.SearchMethod = "ENSURETABLE";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "EnsureTable";
    NewLine.SearchMethod = "ENSURETABLE";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ClearTable";
    NewLine.SearchMethod = "CLEARTABLE";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Clears the database table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ClearTable";
    NewLine.SearchMethod = "CLEARTABLE";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "ClearTable";
    NewLine.SearchMethod = "CLEARTABLE";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteTable";
    NewLine.SearchMethod = "DELETETABLE";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Deletes a table from the database";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteTable";
    NewLine.SearchMethod = "DELETETABLE";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteTable";
    NewLine.SearchMethod = "DELETETABLE";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ADDRECORDS";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Adds new rows to the table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ADDRECORDS";
    NewLine.Parameter    = "--rows";
    NewLine.Description    = "An array of string data structures: Key > field, Value > field value";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ADDRECORDS";
    NewLine.Parameter    = "--trn";
    NewLine.Description    = "True > adding records to transactions with rollback on error (optional, def. val. - True)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ADDRECORDS";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ADDRECORDS";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "GETRECORDS";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Gets records from the selected table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "GETRECORDS";
    NewLine.Parameter    = "--fields";
    NewLine.Description    = "Fields for selection (optional, def. val. - *)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "GETRECORDS";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "GETRECORDS";
    NewLine.Parameter    = "--order";
    NewLine.Description    = "Sorting: Key > field name, Value > direction (ASC, DESC) (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "GETRECORDS";
    NewLine.Parameter    = "--limit";
    NewLine.Description    = "Limiting the number of received strings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "GETRECORDS";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "GETRECORDS";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "UPDATERECORDS";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Updates the value of records by selected criteria";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "UPDATERECORDS";
    NewLine.Parameter    = "--values";
    NewLine.Description    = "Values structure: Key > field, Value > field value";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "UPDATERECORDS";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "UPDATERECORDS";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "UPDATERECORDS";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteRecords";
    NewLine.SearchMethod = "DELETERECORDS";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Deletes records from the table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteRecords";
    NewLine.SearchMethod = "DELETERECORDS";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteRecords";
    NewLine.SearchMethod = "DELETERECORDS";
    NewLine.Parameter    = "--dbc";
    NewLine.Description    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "DeleteRecords";
    NewLine.SearchMethod = "DELETERECORDS";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "postgres";
    NewLine.Module      = "OPI_PostgreSQL";
    NewLine.Method       = "GetRecordsFilterStrucutre";
    NewLine.SearchMethod = "GETRECORDSFILTERSTRUCUTRE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Gets the template structure for filtering records in ORM queries";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_PostgreSQL"", Undefined);
        |
        |OPI_PostgreSQL = LoadScript(""%1/oint/core/Modules/OPI_PostgreSQL.os"", Context);
        |Context.Insert(""OPI_PostgreSQL"", OPI_PostgreSQL);
        |
        |OPI_PostgreSQL = LoadScript(""%1/oint/core/Modules/OPI_PostgreSQL.os"", Context);
        |" + Chars.LF;


EndFunction 
