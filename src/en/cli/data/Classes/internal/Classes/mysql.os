﻿Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--sql";
    NewLine.Описание    = "Database query text";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Executes an arbitrary SQL query";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--params";
    NewLine.Описание    = "Array of positional parameters of the request (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--force";
    NewLine.Описание    = "Includes an attempt to retrieve the result, even for nonSELECT queries (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GenerateConnectionString";
    NewLine.МетодПоиска = "GENERATECONNECTIONSTRING";
    NewLine.Параметр    = "--addr";
    NewLine.Описание    = "IP address or domain name of the server";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Forms a connection string from the passed data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GenerateConnectionString";
    NewLine.МетодПоиска = "GENERATECONNECTIONSTRING";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Name of the database to connect (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GenerateConnectionString";
    NewLine.МетодПоиска = "GENERATECONNECTIONSTRING";
    NewLine.Параметр    = "--login";
    NewLine.Описание    = "MySQL user (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GenerateConnectionString";
    NewLine.МетодПоиска = "GENERATECONNECTIONSTRING";
    NewLine.Параметр    = "--pass";
    NewLine.Описание    = "MySQL password (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GenerateConnectionString";
    NewLine.МетодПоиска = "GENERATECONNECTIONSTRING";
    NewLine.Параметр    = "--port";
    NewLine.Описание    = "Connection port (optional, def. val. - 3306)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetTlsSettings";
    NewLine.МетодПоиска = "GETTLSSETTINGS";
    NewLine.Параметр    = "--trust";
    NewLine.Описание    = "Allows to work with invalid certificates, including self signed";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetTlsSettings";
    NewLine.МетодПоиска = "GETTLSSETTINGS";
    NewLine.Параметр    = "--cert";
    NewLine.Описание    = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Creates a database with the specified name";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "CreateDatabase";
    NewLine.МетодПоиска = "CREATEDATABASE";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteDatabase";
    NewLine.МетодПоиска = "DELETEDATABASE";
    NewLine.Параметр    = "--base";
    NewLine.Описание    = "Database name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Deletes the database";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteDatabase";
    NewLine.МетодПоиска = "DELETEDATABASE";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteDatabase";
    NewLine.МетодПоиска = "DELETEDATABASE";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Creates an empty table in the database";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--cols";
    NewLine.Описание    = "Column structure: Key > Name, Value > Data type";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ClearTable";
    NewLine.МетодПоиска = "CLEARTABLE";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Clears the database table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ClearTable";
    NewLine.МетодПоиска = "CLEARTABLE";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "ClearTable";
    NewLine.МетодПоиска = "CLEARTABLE";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteTable";
    NewLine.МетодПоиска = "DELETETABLE";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Deletes a table from the database";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteTable";
    NewLine.МетодПоиска = "DELETETABLE";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteTable";
    NewLine.МетодПоиска = "DELETETABLE";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetTableInformation";
    NewLine.МетодПоиска = "GETTABLEINFORMATION";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Gets information about the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetTableInformation";
    NewLine.МетодПоиска = "GETTABLEINFORMATION";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetTableInformation";
    NewLine.МетодПоиска = "GETTABLEINFORMATION";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Adds new rows to the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--rows";
    NewLine.Описание    = "An array of string data structures: Key > field, Value > field value";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--trn";
    NewLine.Описание    = "True > adding records to transactions with rollback on error (optional, def. val. - Yes)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Gets records from the selected table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--fields";
    NewLine.Описание    = "Fields for selection (optional, def. val. - *)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--order";
    NewLine.Описание    = "Sorting: Key > field name, Value > direction (ASC, DESC) (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--limit";
    NewLine.Описание    = "Limiting the number of received strings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Updates the value of records by selected criteria";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--values";
    NewLine.Описание    = "Values structure: Key > field, Value > field value";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteRecords";
    NewLine.МетодПоиска = "DELETERECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Deletes records from the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteRecords";
    NewLine.МетодПоиска = "DELETERECORDS";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteRecords";
    NewLine.МетодПоиска = "DELETERECORDS";
    NewLine.Параметр    = "--dbc";
    NewLine.Описание    = "Connection or connection string (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "DeleteRecords";
    NewLine.МетодПоиска = "DELETERECORDS";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mysql";
    NewLine.Модуль      = "OPI_MySQL";
    NewLine.Метод       = "GetRecordsFilterStrucutre";
    NewLine.МетодПоиска = "GETRECORDSFILTERSTRUCUTRE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Orm";
    NewLine.ОписаниеМетода   = "Gets the template structure for filtering records in ORM queries";

    Return CompositionTable;
EndFunction

