
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
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--addr";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Host IP address with port or URL";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms a MongoDB connection string";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Database, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--usr";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Username for authorization (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--pwd";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Password for authorization (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Additional connection parameters (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Executes the command according to its description";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--comm";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Command name to execute";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--arg";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Command argument (optional, def. val. - 1)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database in which the operation needs to be performed (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Main data fields for performing the operation (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetListOfBases";
    NewLine.SearchMethod  = "GETLISTOFBASES";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Working with databases";
    NewLine.MethodDescription   = "Gets the list of databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDatabase";
    NewLine.SearchMethod  = "GETDATABASE";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Working with databases";
    NewLine.MethodDescription   = "Gets information about the database";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDatabase";
    NewLine.SearchMethod  = "GETDATABASE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val. - Empty value)";
    NewLine.Region      = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteDatabase";
    NewLine.SearchMethod  = "DELETEDATABASE";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Working with databases";
    NewLine.MethodDescription   = "Deletes the database";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteDatabase";
    NewLine.SearchMethod  = "DELETEDATABASE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val. - Empty value)";
    NewLine.Region      = "Working with databases";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetCollectionList";
    NewLine.SearchMethod  = "GETCOLLECTIONLIST";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Collection management";
    NewLine.MethodDescription   = "Gets a list of database collections";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetCollectionList";
    NewLine.SearchMethod  = "GETCOLLECTIONLIST";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val. - Empty value)";
    NewLine.Region      = "Collection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateCollection";
    NewLine.SearchMethod  = "CREATECOLLECTION";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Collection management";
    NewLine.MethodDescription   = "Creates a new collection with the specified parameters";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateCollection";
    NewLine.SearchMethod  = "CREATECOLLECTION";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Collection name";
    NewLine.Region      = "Collection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateCollection";
    NewLine.SearchMethod  = "CREATECOLLECTION";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val. - Empty value)";
    NewLine.Region      = "Collection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateCollection";
    NewLine.SearchMethod  = "CREATECOLLECTION";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional creation parameters (optional, def. val. - Empty value)";
    NewLine.Region      = "Collection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteCollection";
    NewLine.SearchMethod  = "DELETECOLLECTION";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Collection management";
    NewLine.MethodDescription   = "Deletes the selected database collection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteCollection";
    NewLine.SearchMethod  = "DELETECOLLECTION";
    NewLine.Parameter     = "--coll";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Collection name";
    NewLine.Region      = "Collection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteCollection";
    NewLine.SearchMethod  = "DELETECOLLECTION";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val. - Empty value)";
    NewLine.Region      = "Collection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "InsertDocuments";
    NewLine.SearchMethod  = "INSERTDOCUMENTS";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Documents management";
    NewLine.MethodDescription   = "Inserts new documents into the collection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "InsertDocuments";
    NewLine.SearchMethod  = "INSERTDOCUMENTS";
    NewLine.Parameter     = "--coll";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Collection name";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "InsertDocuments";
    NewLine.SearchMethod  = "INSERTDOCUMENTS";
    NewLine.Parameter     = "--docs";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Array of docs objects";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "InsertDocuments";
    NewLine.SearchMethod  = "INSERTDOCUMENTS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "InsertDocuments";
    NewLine.SearchMethod  = "INSERTDOCUMENTS";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional insert options (optional, def. val. - Empty value)";
    NewLine.Region      = "Documents management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_MongoDB"", Undefined);
        |
        |OPI_MongoDB = LoadScript(""%1/oint/core/Modules/OPI_MongoDB.os"", Context);
        |Context.Insert(""OPI_MongoDB"", OPI_MongoDB);
        |
        |OPI_MongoDB = LoadScript(""%1/oint/core/Modules/OPI_MongoDB.os"", Context);
        |" + Chars.LF;


EndFunction 
