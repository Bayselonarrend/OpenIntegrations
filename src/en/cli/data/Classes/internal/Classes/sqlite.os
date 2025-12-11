
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
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "ExecuteSQLQuery";
    NewLine.SearchMethod  = "EXECUTESQLQUERY";
    NewLine.Parameter     = "--sql";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Database query text";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Executes an arbitrary SQL query";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "ExecuteSQLQuery";
    NewLine.SearchMethod  = "EXECUTESQLQUERY";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Array of positional parameters of the request (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "ExecuteSQLQuery";
    NewLine.SearchMethod  = "EXECUTESQLQUERY";
    NewLine.Parameter     = "--force";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Includes an attempt to retrieve the result, even for nonSELECT queries (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "ExecuteSQLQuery";
    NewLine.SearchMethod  = "EXECUTESQLQUERY";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or path to the base. In memory, if not filled (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "ExecuteSQLQuery";
    NewLine.SearchMethod  = "EXECUTESQLQUERY";
    NewLine.Parameter     = "--exts";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Extensions: Key > filepath or extension data, Value > entry point (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetTableInformation";
    NewLine.SearchMethod  = "GETTABLEINFORMATION";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Gets information about the table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetTableInformation";
    NewLine.SearchMethod  = "GETTABLEINFORMATION";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Creates an empty table in the database";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--cols";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Column structure: Key > Name, Value > Data type";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "CreateTable";
    NewLine.SearchMethod  = "CREATETABLE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddTableColumn";
    NewLine.SearchMethod  = "ADDTABLECOLUMN";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Adds a new column to an existing table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddTableColumn";
    NewLine.SearchMethod  = "ADDTABLECOLUMN";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Column name";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddTableColumn";
    NewLine.SearchMethod  = "ADDTABLECOLUMN";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Column data type";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddTableColumn";
    NewLine.SearchMethod  = "ADDTABLECOLUMN";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteTableColumn";
    NewLine.SearchMethod  = "DELETETABLECOLUMN";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Deletes a column from the table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteTableColumn";
    NewLine.SearchMethod  = "DELETETABLECOLUMN";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Column name";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteTableColumn";
    NewLine.SearchMethod  = "DELETETABLECOLUMN";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "EnsureTable";
    NewLine.SearchMethod  = "ENSURETABLE";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Creates a new table if it does not exist or updates the composition of columns in an existing table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "EnsureTable";
    NewLine.SearchMethod  = "ENSURETABLE";
    NewLine.Parameter     = "--cols";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Column structure: Key > Name, Value > Data type";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "EnsureTable";
    NewLine.SearchMethod  = "ENSURETABLE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddRecords";
    NewLine.SearchMethod  = "ADDRECORDS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Adds new rows to the table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddRecords";
    NewLine.SearchMethod  = "ADDRECORDS";
    NewLine.Parameter     = "--rows";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "An array of string data structures: Key > field, Value > field value";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddRecords";
    NewLine.SearchMethod  = "ADDRECORDS";
    NewLine.Parameter     = "--trn";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "True > adding records to transactions with rollback on error (optional, def. val.. - True)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "AddRecords";
    NewLine.SearchMethod  = "ADDRECORDS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetRecords";
    NewLine.SearchMethod  = "GETRECORDS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Gets records from the selected table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetRecords";
    NewLine.SearchMethod  = "GETRECORDS";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Fields for selection (optional, def. val.. - *)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetRecords";
    NewLine.SearchMethod  = "GETRECORDS";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Filters array. See GetRecordsFilterStrucutre (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetRecords";
    NewLine.SearchMethod  = "GETRECORDS";
    NewLine.Parameter     = "--order";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Sorting: Key > field name, Value > direction (ASC, DESC) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetRecords";
    NewLine.SearchMethod  = "GETRECORDS";
    NewLine.Parameter     = "--limit";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Limiting the number of received strings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetRecords";
    NewLine.SearchMethod  = "GETRECORDS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "UpdateRecords";
    NewLine.SearchMethod  = "UPDATERECORDS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Updates the value of records by selected criteria";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "UpdateRecords";
    NewLine.SearchMethod  = "UPDATERECORDS";
    NewLine.Parameter     = "--values";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Values structure: Key > field, Value > field value";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "UpdateRecords";
    NewLine.SearchMethod  = "UPDATERECORDS";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Filters array. See GetRecordsFilterStrucutre (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "UpdateRecords";
    NewLine.SearchMethod  = "UPDATERECORDS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteRecords";
    NewLine.SearchMethod  = "DELETERECORDS";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Deletes records from the table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteRecords";
    NewLine.SearchMethod  = "DELETERECORDS";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Filters array. See GetRecordsFilterStrucutre (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteRecords";
    NewLine.SearchMethod  = "DELETERECORDS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteTable";
    NewLine.SearchMethod  = "DELETETABLE";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Deletes a table from the database";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "DeleteTable";
    NewLine.SearchMethod  = "DELETETABLE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "ClearTable";
    NewLine.SearchMethod  = "CLEARTABLE";
    NewLine.Parameter     = "--table";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Clears the database table";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "ClearTable";
    NewLine.SearchMethod  = "CLEARTABLE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Existing connection or database path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sqlite";
    NewLine.Module       = "OPI_SQLite";
    NewLine.Method        = "GetRecordsFilterStrucutre";
    NewLine.SearchMethod  = "GETRECORDSFILTERSTRUCUTRE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Orm";
    NewLine.MethodDescription   = "Gets the template structure for filtering records in ORM queries";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_SQLite"", Undefined);
        |
        |OPI_SQLite = LoadScript(""%1/oint/core/Modules/OPI_SQLite.os"", Context);
        |Context.Insert(""OPI_SQLite"", OPI_SQLite);
        |
        |OPI_SQLite = LoadScript(""%1/oint/core/Modules/OPI_SQLite.os"", Context);
        |" + Chars.LF;


EndFunction 
