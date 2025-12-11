
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
    NewLine.Description     = "Database, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--usr";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Username for authorization (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--pwd";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Password for authorization (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GenerateConnectionString";
    NewLine.SearchMethod  = "GENERATECONNECTIONSTRING";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Additional connection parameters (optional, def. val.. - Empty value)";
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
    NewLine.Description     = "Command argument (optional, def. val.. - 1)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database in which the operation needs to be performed (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Main data fields for performing the operation (optional, def. val.. - Empty value)";
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
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
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
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
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
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
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
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Collection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateCollection";
    NewLine.SearchMethod  = "CREATECOLLECTION";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional creation parameters (optional, def. val.. - Empty value)";
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
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
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
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "InsertDocuments";
    NewLine.SearchMethod  = "INSERTDOCUMENTS";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional insert options (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateDocuments";
    NewLine.SearchMethod  = "UPDATEDOCUMENTS";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Documents management";
    NewLine.MethodDescription   = "Updates document data in the collection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateDocuments";
    NewLine.SearchMethod  = "UPDATEDOCUMENTS";
    NewLine.Parameter     = "--coll";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Collection name";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateDocuments";
    NewLine.SearchMethod  = "UPDATEDOCUMENTS";
    NewLine.Parameter     = "--updates";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Update array. See GetDocumentUpdateStructure";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateDocuments";
    NewLine.SearchMethod  = "UPDATEDOCUMENTS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateDocuments";
    NewLine.SearchMethod  = "UPDATEDOCUMENTS";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional insert options (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocuments";
    NewLine.SearchMethod  = "GETDOCUMENTS";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Documents management";
    NewLine.MethodDescription   = "Gets collection documents";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocuments";
    NewLine.SearchMethod  = "GETDOCUMENTS";
    NewLine.Parameter     = "--coll";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Collection name";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocuments";
    NewLine.SearchMethod  = "GETDOCUMENTS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocuments";
    NewLine.SearchMethod  = "GETDOCUMENTS";
    NewLine.Parameter     = "--query";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Document filter (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocuments";
    NewLine.SearchMethod  = "GETDOCUMENTS";
    NewLine.Parameter     = "--sort";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection sorting (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocuments";
    NewLine.SearchMethod  = "GETDOCUMENTS";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional retrieval parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteDocuments";
    NewLine.SearchMethod  = "DELETEDOCUMENTS";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Documents management";
    NewLine.MethodDescription   = "Deletes collection documents";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteDocuments";
    NewLine.SearchMethod  = "DELETEDOCUMENTS";
    NewLine.Parameter     = "--coll";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Collection name";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteDocuments";
    NewLine.SearchMethod  = "DELETEDOCUMENTS";
    NewLine.Parameter     = "--deletes";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Deletion array. See GetDocumentDeletionStructure";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteDocuments";
    NewLine.SearchMethod  = "DELETEDOCUMENTS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteDocuments";
    NewLine.SearchMethod  = "DELETEDOCUMENTS";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional insert options (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentUpdateStructure";
    NewLine.SearchMethod  = "GETDOCUMENTUPDATESTRUCTURE";
    NewLine.Parameter     = "--query";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Document filter";
    NewLine.Region      = "Documents management";
    NewLine.MethodDescription   = "Forms data structure for updating documents";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentUpdateStructure";
    NewLine.SearchMethod  = "GETDOCUMENTUPDATESTRUCTURE";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "New document data for update";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentUpdateStructure";
    NewLine.SearchMethod  = "GETDOCUMENTUPDATESTRUCTURE";
    NewLine.Parameter     = "--multi";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "True > updates all documents by filter, False > only one (optional, def. val.. - True)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentUpdateStructure";
    NewLine.SearchMethod  = "GETDOCUMENTUPDATESTRUCTURE";
    NewLine.Parameter     = "--upsert";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Insert a new document if no document was found (optional, def. val.. - False)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentUpdateStructure";
    NewLine.SearchMethod  = "GETDOCUMENTUPDATESTRUCTURE";
    NewLine.Parameter     = "--cltn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Special field comparison rules (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentDeletionStructure";
    NewLine.SearchMethod  = "GETDOCUMENTDELETIONSTRUCTURE";
    NewLine.Parameter     = "--query";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Document filter";
    NewLine.Region      = "Documents management";
    NewLine.MethodDescription   = "Forms data structure for update";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentDeletionStructure";
    NewLine.SearchMethod  = "GETDOCUMENTDELETIONSTRUCTURE";
    NewLine.Parameter     = "--limit";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Deletion limit: 1 > first document, 0 > all documents (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDocumentDeletionStructure";
    NewLine.SearchMethod  = "GETDOCUMENTDELETIONSTRUCTURE";
    NewLine.Parameter     = "--cltn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Special field comparison rules (optional, def. val.. - Empty value)";
    NewLine.Region      = "Documents management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Creates a new user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Users name";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--roles";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Array of roles as strings or structures specifying the DB";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--pwd";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Users password (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Additional creation parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Modifies existing user data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Users name";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--roles";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Array of roles as strings or structures specifying the DB (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--pwd";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Users password (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Additional parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Gets data of one or more users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--usrs";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Username, structure, or array of user structures";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--spwd";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Adds user password hash to the returned data (optional, def. val.. - False)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--sprv";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Adds a list of user privileges to the returned data (optional, def. val.. - False)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDatabaseUsers";
    NewLine.SearchMethod  = "GETDATABASEUSERS";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Gets information about all database users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDatabaseUsers";
    NewLine.SearchMethod  = "GETDATABASEUSERS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDatabaseUsers";
    NewLine.SearchMethod  = "GETDATABASEUSERS";
    NewLine.Parameter     = "--spwd";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Adds user password hash to the returned data (optional, def. val.. - False)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetDatabaseUsers";
    NewLine.SearchMethod  = "GETDATABASEUSERS";
    NewLine.Parameter     = "--sprv";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Adds a list of user privileges to the returned data (optional, def. val.. - False)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteUser";
    NewLine.SearchMethod  = "DELETEUSER";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Deletes user by name";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteUser";
    NewLine.SearchMethod  = "DELETEUSER";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Users name";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteUser";
    NewLine.SearchMethod  = "DELETEUSER";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteUser";
    NewLine.SearchMethod  = "DELETEUSER";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional deletion parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateRole";
    NewLine.SearchMethod  = "CREATEROLE";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Role management";
    NewLine.MethodDescription   = "Creates a new role";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateRole";
    NewLine.SearchMethod  = "CREATEROLE";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Role name";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateRole";
    NewLine.SearchMethod  = "CREATEROLE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateRole";
    NewLine.SearchMethod  = "CREATEROLE";
    NewLine.Parameter     = "--prvl";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "prvl (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateRole";
    NewLine.SearchMethod  = "CREATEROLE";
    NewLine.Parameter     = "--roles";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Array of roles based on strings or structures specifying the database (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "CreateRole";
    NewLine.SearchMethod  = "CREATEROLE";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Additional deletion parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateRole";
    NewLine.SearchMethod  = "UPDATEROLE";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Role management";
    NewLine.MethodDescription   = "Modifies the data of an existing role";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateRole";
    NewLine.SearchMethod  = "UPDATEROLE";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Role name";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateRole";
    NewLine.SearchMethod  = "UPDATEROLE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateRole";
    NewLine.SearchMethod  = "UPDATEROLE";
    NewLine.Parameter     = "--prvl";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Array of privileges. See GetRolePrivilegeStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateRole";
    NewLine.SearchMethod  = "UPDATEROLE";
    NewLine.Parameter     = "--roles";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Array of roles based on strings or structures specifying the database (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "UpdateRole";
    NewLine.SearchMethod  = "UPDATEROLE";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Additional deletion parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetRoles";
    NewLine.SearchMethod  = "GETROLES";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Role management";
    NewLine.MethodDescription   = "Gets information about the specified fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetRoles";
    NewLine.SearchMethod  = "GETROLES";
    NewLine.Parameter     = "--roles";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Role or list of roles";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetRoles";
    NewLine.SearchMethod  = "GETROLES";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetRoles";
    NewLine.SearchMethod  = "GETROLES";
    NewLine.Parameter     = "--sprv";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Adds a list of role privileges to the returned data (optional, def. val.. - False)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteRole";
    NewLine.SearchMethod  = "DELETEROLE";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Role management";
    NewLine.MethodDescription   = "Deletes an existing role";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteRole";
    NewLine.SearchMethod  = "DELETEROLE";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Role name";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteRole";
    NewLine.SearchMethod  = "DELETEROLE";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "DeleteRole";
    NewLine.SearchMethod  = "DELETEROLE";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional deletion parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GrantRoles";
    NewLine.SearchMethod  = "GRANTROLES";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Role management";
    NewLine.MethodDescription   = "Grants selected roles to a user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GrantRoles";
    NewLine.SearchMethod  = "GRANTROLES";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Users name";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GrantRoles";
    NewLine.SearchMethod  = "GRANTROLES";
    NewLine.Parameter     = "--roles";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Role or role array";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GrantRoles";
    NewLine.SearchMethod  = "GRANTROLES";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GrantRoles";
    NewLine.SearchMethod  = "GRANTROLES";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional deletion parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "RevokeRoles";
    NewLine.SearchMethod  = "REVOKEROLES";
    NewLine.Parameter     = "--dbc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Connection or connection string";
    NewLine.Region      = "Role management";
    NewLine.MethodDescription   = "Revokes selected roles from a user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "RevokeRoles";
    NewLine.SearchMethod  = "REVOKEROLES";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Users name";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "RevokeRoles";
    NewLine.SearchMethod  = "REVOKEROLES";
    NewLine.Parameter     = "--roles";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Role or role array";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "RevokeRoles";
    NewLine.SearchMethod  = "REVOKEROLES";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Database name. Current database if not specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "RevokeRoles";
    NewLine.SearchMethod  = "REVOKEROLES";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Additional deletion parameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Role management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetRolePrivilegeStructure";
    NewLine.SearchMethod  = "GETROLEPRIVILEGESTRUCTURE";
    NewLine.Parameter     = "--res";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Privilege resource";
    NewLine.Region      = "Role management";
    NewLine.MethodDescription   = "Forms the privilege information structure for use when working with roles";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "mongodb";
    NewLine.Module       = "OPI_MongoDB";
    NewLine.Method        = "GetRolePrivilegeStructure";
    NewLine.SearchMethod  = "GETROLEPRIVILEGESTRUCTURE";
    NewLine.Parameter     = "--act";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Array of available privilege actions";
    NewLine.Region      = "Role management";

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
