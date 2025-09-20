
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
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "InЫПОЛNAndТЬЗАПРОСSQL";
    NewLine.Parameter    = "--sql";
    NewLine.Description    = "Database query text";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Executes an arbitrary SQL query
    |
    |    Example of specifying a parameter of array type:
    |    --param ""['Val1','Val2','Val3']""
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "InЫПОЛNAndТЬЗАПРОСSQL";
    NewLine.Parameter    = "--params";
    NewLine.Description    = "Array of positional parameters of the request (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "InЫПОЛNAndТЬЗАПРОСSQL";
    NewLine.Parameter    = "--force";
    NewLine.Description    = "Includes an attempt to retrieve the result, even for nonSELECT queries (optional, def. val. - False)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "InЫПОЛNAndТЬЗАПРОСSQL";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or path to the base. In memory, if not filled (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ExecuteSQLQuery";
    NewLine.SearchMethod = "InЫПОЛNAndТЬЗАПРОСSQL";
    NewLine.Parameter    = "--exts";
    NewLine.Description    = "Extensions: Key > filepath or extension data, Value > entry point (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetTableInformation";
    NewLine.SearchMethod = "ПОЛУЧAndТЬAndNФОРМАЦAndЮОТАБЛAndЦЕ";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Gets information about the table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetTableInformation";
    NewLine.SearchMethod = "ПОЛУЧAndТЬAndNФОРМАЦAndЮОТАБЛAndЦЕ";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "CreateTable";
    NewLine.SearchMethod = "СОЗДATЬТАБЛAndЦУ";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Creates an empty table in the database";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "CreateTable";
    NewLine.SearchMethod = "СОЗДATЬТАБЛAndЦУ";
    NewLine.Parameter    = "--cols";
    NewLine.Description    = "Column structure: Key > Name, Value > Data type";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "CreateTable";
    NewLine.SearchMethod = "СОЗДATЬТАБЛAndЦУ";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ДОБАInAndТЬKОЛОNKУТАБЛAndЦЫ";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Adds a new column to an existing table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ДОБАInAndТЬKОЛОNKУТАБЛAndЦЫ";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Column name";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ДОБАInAndТЬKОЛОNKУТАБЛAndЦЫ";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Column data type";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddTableColumn";
    NewLine.SearchMethod = "ДОБАInAndТЬKОЛОNKУТАБЛAndЦЫ";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteTableColumn";
    NewLine.SearchMethod = "УДАЛAndТЬKОЛОNKУТАБЛAndЦЫ";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Deletes a column from the table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteTableColumn";
    NewLine.SearchMethod = "УДАЛAndТЬKОЛОNKУТАБЛAndЦЫ";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Column name";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteTableColumn";
    NewLine.SearchMethod = "УДАЛAndТЬKОЛОNKУТАБЛAndЦЫ";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "EnsureTable";
    NewLine.SearchMethod = "ГАРАNТAndРОInATЬТАБЛAndЦУ";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Creates a new table if it does not exist or updates the composition of columns in an existing table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "EnsureTable";
    NewLine.SearchMethod = "ГАРАNТAndРОInATЬТАБЛAndЦУ";
    NewLine.Parameter    = "--cols";
    NewLine.Description    = "Column structure: Key > Name, Value > Data type";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "EnsureTable";
    NewLine.SearchMethod = "ГАРАNТAndРОInATЬТАБЛAndЦУ";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ДОБАInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Adds new rows to the table
    |
    |    Example of specifying a parameter of array type:
    |    --param ""['Val1','Val2','Val3']""
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ДОБАInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--rows";
    NewLine.Description    = "An array of string data structures: Key > field, Value > field value";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ДОБАInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--trn";
    NewLine.Description    = "True > adding records to transactions with rollback on error (optional, def. val. - True)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "AddRecords";
    NewLine.SearchMethod = "ДОБАInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "ПОЛУЧAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Gets records from the selected table
    |
    |    Example of specifying a parameter of array type:
    |    --param ""['Val1','Val2','Val3']""
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "ПОЛУЧAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--fields";
    NewLine.Description    = "Fields for selection (optional, def. val. - *)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "ПОЛУЧAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "ПОЛУЧAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--order";
    NewLine.Description    = "Sorting: Key > field name, Value > direction (ASC, DESC) (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "ПОЛУЧAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--limit";
    NewLine.Description    = "Limiting the number of received strings (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetRecords";
    NewLine.SearchMethod = "ПОЛУЧAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "ОБNОInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Updates the value of records by selected criteria
    |
    |    Example of specifying a parameter of array type:
    |    --param ""['Val1','Val2','Val3']""
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "ОБNОInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--values";
    NewLine.Description    = "Values structure: Key > field, Value > field value";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "ОБNОInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "UpdateRecords";
    NewLine.SearchMethod = "ОБNОInAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteRecords";
    NewLine.SearchMethod = "УДАЛAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Deletes records from the table
    |
    |    Example of specifying a parameter of array type:
    |    --param ""['Val1','Val2','Val3']""
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteRecords";
    NewLine.SearchMethod = "УДАЛAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--filter";
    NewLine.Description    = "Filters array. See GetRecordsFilterStrucutre (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteRecords";
    NewLine.SearchMethod = "УДАЛAndТЬЗАПAndСAnd";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteTable";
    NewLine.SearchMethod = "УДАЛAndТЬТАБЛAndЦУ";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Deletes a table from the database";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "DeleteTable";
    NewLine.SearchMethod = "УДАЛAndТЬТАБЛAndЦУ";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ClearTable";
    NewLine.SearchMethod = "ОЧAndСТAndТЬТАБЛAndЦУ";
    NewLine.Parameter    = "--table";
    NewLine.Description    = "Table name";
    NewLine.Region     = "Orm";
    NewLine.MethodDescription   = "Clears the database table";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ClearTable";
    NewLine.SearchMethod = "ОЧAndСТAndТЬТАБЛAndЦУ";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Existing connection or database path (optional, def. val. - Empty value)";
    NewLine.Region     = "Orm";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "sqlite";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetRecordsFilterStrucutre";
    NewLine.SearchMethod = "ПОЛУЧAndТЬСТРУKТУРУФAndЛЬТРАЗАПAndСЕЙ";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Orm";
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
