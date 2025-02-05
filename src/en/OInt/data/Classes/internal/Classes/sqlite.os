Function ПолучитьСостав() Export

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
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--sql";
    NewLine.Описание    = "Database query text";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Executes an arbitrary SQL query";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--params";
    NewLine.Описание    = "Array of positional parameters of the request (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--force";
    NewLine.Описание    = "Includes an attempt to retrieve the result, even for nonSELECT queries (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "ExecuteSQLQuery";
    NewLine.МетодПоиска = "EXECUTESQLQUERY";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or path to the base. In memory, if not filled (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetTableInformation";
    NewLine.МетодПоиска = "GETTABLEINFORMATION";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Gets information about the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetTableInformation";
    NewLine.МетодПоиска = "GETTABLEINFORMATION";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Creates an empty table in the database";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--cols";
    NewLine.Описание    = "Column structure: Key > Name, Value > Data type";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "CreateTable";
    NewLine.МетодПоиска = "CREATETABLE";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Adds new rows to the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--rows";
    NewLine.Описание    = "An array of string data structures: Key > field, Value > field value";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--trn";
    NewLine.Описание    = "True > adding records to transactions with rollback on error (optional, def. val. - Yes)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "AddRecords";
    NewLine.МетодПоиска = "ADDRECORDS";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Gets records from the selected table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--fields";
    NewLine.Описание    = "Fields for selection (optional, def. val. - *)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--order";
    NewLine.Описание    = "Sorting: Key > field name, Value > direction (ASC, DESC) (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--limit";
    NewLine.Описание    = "Limiting the number of received strings (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetRecords";
    NewLine.МетодПоиска = "GETRECORDS";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Updates the value of records by selected criteria";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--values";
    NewLine.Описание    = "Values structure: Key > field, Value > field value";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "UpdateRecords";
    NewLine.МетодПоиска = "UPDATERECORDS";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "DeletePosts";
    NewLine.МетодПоиска = "DELETEPOSTS";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Deletes records from the table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "DeletePosts";
    NewLine.МетодПоиска = "DELETEPOSTS";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "DeletePosts";
    NewLine.МетодПоиска = "DELETEPOSTS";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "DeleteTable";
    NewLine.МетодПоиска = "DELETETABLE";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Deletes a table from the database";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "DeleteTable";
    NewLine.МетодПоиска = "DELETETABLE";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "ClearTable";
    NewLine.МетодПоиска = "CLEARTABLE";
    NewLine.Параметр    = "--table";
    NewLine.Описание    = "Table name";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Clears the database table";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "ClearTable";
    NewLine.МетодПоиска = "CLEARTABLE";
    NewLine.Параметр    = "--db";
    NewLine.Описание    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Область     = "ORM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "sqlite";
    NewLine.Модуль      = "OPI_SQLite";
    NewLine.Метод       = "GetRecordsFilterStrucutre";
    NewLine.МетодПоиска = "GETRECORDSFILTERSTRUCUTRE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "ORM";
    NewLine.ОписаниеМетода   = "Gets the template structure for filtering records in ORM queries";

    Return CompositionTable;
EndFunction

