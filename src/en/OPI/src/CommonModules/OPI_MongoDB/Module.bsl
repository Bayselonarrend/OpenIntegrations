// OneScript: ./OInt/core/Modules/OPI_MongoDB.os
// Lib: MongoDB
// CLI: mongodb
// Keywords: mongodb, mongo, nosql

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
// BSLLS:DuplicateStringLiteral-off

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
// ConnectionString - String - Connection string - string
//
// Returns:
// Arbitrary - Connector object or structure with error information
Function CreateConnection(Val ConnectionString) Export

    If IsConnector(ConnectionString) Then
        Return ConnectionString;
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionString);
    OPI_Tools.RestoreEscapeSequences(ConnectionString);

    Connector = OPI_AddIns.GetAddIn("MongoDB");

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

        Result = Connection.Disconnect();
        Result = OPI_Tools.JsonToStructure(Result, False);

    Else

        Result = New Structure("result,error", False, "It's not a connection");

    EndIf;

    Return Result;

EndFunction

// Is connector !NOCLI
// Checks that the value is an object of the external MSSQL component
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_MongoDB.Main";

EndFunction

// Generate connection string
// Forms a MongoDB connection string
//
// Parameters:
// Address - String - Host IP address with port or URL - addr
// Base - String - Database, if necessary - db
// Login - String - Username for authorization - usr
// Password - String - Password for authorization - pwd
// Parameters - Structure Of KeyAndValue, Undefined - Additional connection parameters - params
//
// Returns:
// String - MongoDB connection string
Function GenerateConnectionString(Val Address
    , Val Base = ""
    , Val Login = ""
    , Val Password = ""
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Address);
    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Login);
    OPI_TypeConversion.GetLine(Password);

    If ValueIsFilled(Parameters) Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    EndIf;

    ConnectionTemplate = "mongodb://%1";

    If ValueIsFilled(Login) Then
        Authorization = StrTemplate("%1:%2", Login, Password);
    Else
        Authorization = "";
    EndIf;

    If ValueIsFilled(Authorization) Then
        MainPart = StrTemplate("%1@%2", Authorization, Address);
    Else
        MainPart = Address;
    EndIf;

    ConnectionString = StrTemplate(ConnectionTemplate, MainPart);

    If ValueIsFilled(Base) Or ValueIsFilled(Parameters) Then

        ConnectionString = ConnectionString + "/";

        If ValueIsFilled(Base) Then
            ConnectionString = ConnectionString + Base;
        EndIf;

        If ValueIsFilled(Parameters) Then

            ConnectionString = ConnectionString + "?";
            ParameterArray   = New Array;

            For Each Parameter In Parameters Do
                ParameterArray.Add(StrTemplate("%1=%2", Parameter.Key, Parameter.Value));
            EndDo;

            ConnectionString = ConnectionString + StrConcat(ParameterArray, "&");

        EndIf;

    EndIf;

    Return ConnectionString;

EndFunction

// Execute command
// Executes the command according to its description
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Command - String - Command name to execute - comm
// Argument - Arbitrary - Command argument - arg
// Base - String - Database in which the operation needs to be performed - db
// Data - Structure Of KeyAndValue - Main data fields for performing the operation - data
//
// Returns:
// Map Of KeyAndValue - Operation result
Function ExecuteCommand(Val Connection
    , Val Command
    , Val Argument = 1
    , Val Base = Undefined
    , Val Data = Undefined) Export

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

    OperationStructure = New Structure();

    OPI_Tools.AddField("operation", Command, "String", OperationStructure);

    If Base <> Undefined Then
        OPI_Tools.AddField("database", Base, "String", OperationStructure);
    EndIf;

    If Argument <> Undefined Then
        ProcessedArgument = ProcessDataForOperation(Argument);
        OperationStructure.Insert("argument", ProcessedArgument);
    EndIf;

    If Data <> Undefined Then
        ProcessedData = ProcessDataForOperation(Data);
        OperationStructure.Insert("data", ProcessedData);
    EndIf;

    OperationsJSON = OPI_Tools.JSONString(OperationStructure);

    Result = Connector.Execute(OperationsJSON);
    Result = OPI_Tools.JsonToStructure(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region WorkingWithDatabases

// Get list of bases
// Gets the list of databases
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetListOfBases(Val Connection) Export

    Result = ExecuteCommand(Connection, "listDatabases");
    Return Result;

EndFunction

// Get database
// Gets information about the database
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetDatabase(Val Connection, Val Base = Undefined) Export

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "dbStats", , Base);
    Return Result;

EndFunction

// Drop database
// Deletes the database
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DeleteDatabase(Val Connection, Val Base = Undefined) Export

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "dropDatabase", , Base);
    Return Result;

EndFunction

#EndRegion

#Region CollectionManagement

// Get collection list
// Gets a list of database collections
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetCollectionList(Val Connection, Val Base = Undefined) Export

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "listCollections", , Base);
    Return Result;

EndFunction

// Create collection
// Creates a new collection with the specified parameters
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Collection name - name
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional creation parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function CreateCollection(Val Connection
    , Val Name
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Name);

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    EndIf;

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "create", Name, Base, Parameters);
    Return Result;

EndFunction

// Delete collection
// Deletes the selected database collection
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DeleteCollection(Val Connection, Val Collection, Val Base = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "drop", Collection, Base);
    Return Result;

EndFunction

#EndRegion

#Region DocumentsManagement

// Insert documents
// Inserts new documents into the collection
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Values - Array Of Arbitrary - Array of docs objects - docs
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional insert options - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function InsertDocuments(Val Connection
    , Val Collection
    , Val Values
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);
    OPI_TypeConversion.GetArray(Values);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    DocsArray = New Array;

    For Each Element In Values Do

        CurrentElement = Element;
        OPI_TypeConversion.GetKeyValueCollection(CurrentElement);
        DocsArray.Add(CurrentElement);

    EndDo;

    Parameters.Insert("documents", DocsArray);

    Result = ExecuteCommand(Connection, "insert", Collection, Base, Parameters);

    Return Result;

EndFunction

// Update documents
// Updates document data in the collection
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Updates - Array of Structure - Update array. See GetDocumentUpdateStructure - updates
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional insert options - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function UpdateDocuments(Val Connection
    , Val Collection
    , Val Updates
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);
    OPI_TypeConversion.GetArray(Updates);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    UpdateArray = New Array;

    For Each Element In Updates Do

        CurrentElement = Element;
        OPI_TypeConversion.GetKeyValueCollection(CurrentElement);
        UpdateArray.Add(CurrentElement);

    EndDo;

    Parameters.Insert("updates", UpdateArray);

    Result = ExecuteCommand(Connection, "update", Collection, Base, Parameters);

    Return Result;

EndFunction

// Get documents
// Gets collection documents
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Base - String - Database name. Current database if not specified - db
// Filter - Structure Of KeyAndValue - Document filter - query
// Sort - Structure Of KeyAndValue - Selection sorting - sort
// Parameters - Structure Of KeyAndValue - Additional retrieval parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetDocuments(Val Connection
    , Val Collection
    , Val Base = Undefined
    , Val Filter = Undefined
    , Val Sort = Undefined
    , Val Parameters = Undefined) Export

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

    Cursor = GetCursor(Connector, Collection, Base, Filter, Sort, Parameters);

    If Not Cursor["result"] Then
        Return Cursor;
    EndIf;

    Cursor          = Cursor["data"]["cursor"];
    DocsArray       = Cursor["firstBatch"];
    CursorID        = Cursor["id"];
    ContinueGetting = CursorID > 0;

    While ContinueGetting Do

        Package = GetDocumentBatch(Connector, Collection, CursorID, Base);
        Success = Package["result"];
        Data    = Package["data"];

        If Not Success Then
            Return Package;
        EndIf;

        Cursor = Data["cursor"];

        If Cursor = Undefined Then
            Return Package;
        EndIf;

        ContinueGetting = Cursor["id"] > 0;

        For Each Record In Cursor["nextBatch"] Do
            DocsArray.Add(Record);
        EndDo;

    EndDo;

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Result = New Map;
    Result.Insert("result", True);
    Result.Insert("data"  , DocsArray);

    Return Result;

EndFunction

// Delete documents
// Deletes collection documents
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Deletions - Array of Structure - Deletion array. See GetDocumentDeletionStructure - deletes
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional insert options - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DeleteDocuments(Val Connection
    , Val Collection
    , Val Deletions
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);
    OPI_TypeConversion.GetArray(Deletions);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    UpdateArray = New Array;

    For Each Element In Deletions Do

        CurrentElement = Element;
        OPI_TypeConversion.GetKeyValueCollection(CurrentElement);
        UpdateArray.Add(CurrentElement);

    EndDo;

    Parameters.Insert("deletes", UpdateArray);

    Result = ExecuteCommand(Connection, "delete", Collection, Base, Parameters);

    Return Result;

EndFunction

// Get cursor !NOCLI
// Gets a cursor for batch retrieval of collection documents
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Base - String - Database name. Current database if not specified - db
// Filter - Structure Of KeyAndValue - Document filter - query
// Sort - Structure Of KeyAndValue - Selection sorting - sort
// Parameters - Structure Of KeyAndValue - Additional retrieval parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetCursor(Val Connection
    , Val Collection
    , Val Base = Undefined
    , Val Filter = Undefined
    , Val Sort = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    OPI_Tools.AddField("filter", Filter , "KeyAndValue", Parameters);
    OPI_Tools.AddField("sort"  , Sort   , "KeyAndValue", Parameters);

    Result = ExecuteCommand(Connection, "find", Collection, Base, Parameters);

    Return Result;

EndFunction

// Get document batch !NOCLI
// Gets the next batch of cursor documents
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// CursorID - Number - Cursor ID - cursor
// Base - String - Database name. Current database if not specified - db
// BatchSize - Number - Amount of records in the batch - limit
// Waiting - Number - Maximum lock time during awaitData (in ms.) - time
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetDocumentBatch(Val Connection
    , Val Collection
    , Val CursorID
    , Val Base = Undefined
    , Val BatchSize = Undefined
    , Val Waiting = Undefined) Export

    OPI_TypeConversion.GetNumber(CursorID);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Parameters = New Structure;
    OPI_Tools.AddField("collection", Collection , "String" , Parameters);
    OPI_Tools.AddField("batchSize" , BatchSize  , "Number" , Parameters);
    OPI_Tools.AddField("maxTimeMS" , BatchSize  , "Number" , Parameters);

    Result = ExecuteCommand(Connection, "getMore", CursorID, Base, Parameters);

    Return Result;

EndFunction

// Get document update structure
// Forms data structure for updating documents
//
// Parameters:
// Filter - Structure Of KeyAndValue - Document filter - query
// Data - Structure Of KeyAndValue - New document data for update - data
// UpdateAll - Boolean - True > updates all documents by filter, False > only one - multi
// Insert - Boolean - Insert a new document if no document was found - upsert
// Collation - Structure Of KeyAndValue - Special field comparison rules - cltn
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
Function GetDocumentUpdateStructure(Val Filter
    , Val Data
    , Val UpdateAll = True
    , Val Insert = False
    , Val Collation = Undefined) Export

    UpdatesStructure = New Structure;

    OPI_Tools.AddField("q"        , Filter    , "KeyAndValue", UpdatesStructure);
    OPI_Tools.AddField("u"        , Data      , "KeyAndValue", UpdatesStructure);
    OPI_Tools.AddField("multi"    , UpdateAll , "Boolean"    , UpdatesStructure);
    OPI_Tools.AddField("upsert"   , Insert    , "Boolean"    , UpdatesStructure);
    OPI_Tools.AddField("collation", Collation , "KeyAndValue", UpdatesStructure);

    Return UpdatesStructure;

EndFunction

// Get document deletion structure
// Forms data structure for update
//
// Parameters:
// Filter - Structure Of KeyAndValue - Document filter - query
// Count - Number - Deletion limit: 1 > first document, 0 > all documents - limit
// Collation - Structure Of KeyAndValue - Special field comparison rules - cltn
//
// Returns:
// Structure - Get document deletion structure
Function GetDocumentDeletionStructure(Val Filter, Val Count = 0, Collation = Undefined) Export

    DeletionStructure = New Structure;

    OPI_Tools.AddField("q"        , Filter   , "KeyAndValue", DeletionStructure);
    OPI_Tools.AddField("collation", Collation, "KeyAndValue", DeletionStructure);

    OPI_TypeConversion.GetNumber(Count);
    DeletionStructure.Insert("limit", Count);

    Return DeletionStructure;

EndFunction

#EndRegion

#Region UsersManagement

// Create user
// Creates a new user
//
// Note
// Role can be defined in one of the following formats:^
// Structure: `{ role: "name", db: "database" }`^
// String: `name рoлand`
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Users name - name
// UserRoles - Array Of Arbitrary - Array of roles as strings or structures specifying the DB - roles
// Base - String - Database name. Current database if not specified - db
// Password - String - Users password - pwd
// Parameters - Structure Of KeyAndValue - Additional creation parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function CreateUser(Val Connection
    , Val Name
    , Val UserRoles
    , Val Base = Undefined
    , Val Password = Undefined
    , Val Parameters = Undefined) Export

    Return CreateOrUpdateUser("createUser", Connection, Name, UserRoles, Base, Password, Parameters);

EndFunction

// Update user
// Modifies existing user data
//
// Note
// The passed roles completely replace the user's role list
// Role can be defined in one of the following formats:^
// Structure: `{ role: "name", db: "database" }`^
// String: `name рoлand`
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Users name - name
// UserRoles - Array Of Arbitrary - Array of roles as strings or structures specifying the DB - roles
// Base - String - Database name. Current database if not specified - db
// Password - String - Users password - pwd
// Parameters - Structure Of KeyAndValue - Additional parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function UpdateUser(Val Connection
    , Val Name
    , Val UserRoles = Undefined
    , Val Base = Undefined
    , Val Password = Undefined
    , Val Parameters = Undefined) Export

    Return CreateOrUpdateUser("updateUser", Connection, Name, UserRoles, Base, Password, Parameters);

EndFunction

// Get users
// Gets data of one or more users
//
// Note
// The user can be specified in one of the following formats:^
// String: `name of user`^
// Structure: `{ user: <name>, db: <database> }`^
// Array: `[ { user: <name>, db: <бaзa data> }, { user: <name>, db: <бaзa data> }, ... ]`
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Users - Arbitrary - Username, structure, or array of user structures - usrs
// Base - String - Database name. Current database if not specified - db
// GetPassword - Boolean - Adds user password hash to the returned data - spwd
// GetPrivileges - Boolean - Adds a list of user privileges to the returned data - sprv
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetUsers(Val Connection
    , Val Users
    , Val Base = Undefined
    , Val GetPassword = False
    , Val GetPrivileges = False) Export

    OPI_TypeConversion.GetArray(Users);

    If Users.Count() = 1 Then
        Users        = Users[0];
    EndIf;

    Parameters = New Structure;
    OPI_Tools.AddField("showCredentials", GetPassword  , "Boolean", Parameters);
    OPI_Tools.AddField("showPrivileges" , GetPrivileges, "Boolean", Parameters);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "usersInfo", Users, Base, Parameters);
    Return Result;

EndFunction

// Get database users
// Gets information about all database users
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Base - String - Database name. Current database if not specified - db
// GetPassword - Boolean - Adds user password hash to the returned data - spwd
// GetPrivileges - Boolean - Adds a list of user privileges to the returned data - sprv
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetDatabaseUsers(Val Connection
    , Val Base = Undefined
    , Val GetPassword = False
    , Val GetPrivileges = False) Export

    Return GetUsers(Connection, 1, Base, GetPassword, GetPrivileges);

EndFunction

// Delete user
// Deletes user by name
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Users name - name
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional deletion parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DeleteUser(Val Connection, Val Name, Val Base = Undefined, Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Name);

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "dropUser", Name, Base, Parameters);
    Return Result;

EndFunction

#EndRegion

#Region RoleManagement

// Create role
// Creates a new role
//
// Note
// Role can be defined in one of the following formats:^
// Structure: `{ role: "name", db: "database" }`^
// String: `name рoлand`
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Role name - name
// Base - String - Database name. Current database if not specified - db
// PrivilegesArray - Array of Structure - Array of privileges. See GetRolePrivilegeStructure - prvl - prvl
// RoleArray - Array Of Arbitrary - Array of roles based on strings or structures specifying the database - roles
// Parameters - Structure Of KeyAndValue - Additional deletion parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function CreateRole(Val Connection
    , Val Name
    , Val Base = Undefined
    , Val PrivilegesArray = Undefined
    , Val RoleArray = Undefined
    , Val Parameters = Undefined) Export

    Return CreateOrUpdateRole("createRole", Connection, Name, Base, PrivilegesArray, RoleArray, Parameters);

EndFunction

// Update role
// Modifies the data of an existing role
//
// Note
// The passed roles and privileges completely replace the current role data
// Role can be defined in one of the following formats:^
// Structure: `{ role: "name", db: "database" }`^
// String: `name рoлand`
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Role name - name
// Base - String - Database name. Current database if not specified - db
// PrivilegesArray - Array of Structure - Array of privileges. See GetRolePrivilegeStructure - prvl
// RoleArray - Array Of Arbitrary - Array of roles based on strings or structures specifying the database - roles
// Parameters - Structure Of KeyAndValue - Additional deletion parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function UpdateRole(Val Connection
    , Val Name
    , Val Base = Undefined
    , Val PrivilegesArray = Undefined
    , Val RoleArray = Undefined
    , Val Parameters = Undefined) Export

    Return CreateOrUpdateRole("updateRole", Connection, Name, Base, PrivilegesArray, RoleArray, Parameters);

EndFunction

// Get roles
// Gets information about the specified fields
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// RoleArray - Arbitrary - Role or list of roles - roles
// Base - String - Database name. Current database if not specified - db
// GetPrivileges - Boolean - Adds a list of role privileges to the returned data - sprv
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetRoles(Val Connection
    , Val RoleArray
    , Val Base = Undefined
    , Val GetPrivileges = False) Export

    OPI_TypeConversion.GetArray(RoleArray);
    OPI_TypeConversion.GetBoolean(GetPrivileges);

    If RoleArray.Count() = 1 Then
        RoleArray        = RoleArray[0];
    EndIf;

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Parameters = New Structure("showPrivileges", GetPrivileges);

    Result = ExecuteCommand(Connection, "rolesInfo", RoleArray, Base, Parameters);
    Return Result;

EndFunction

// Delete role
// Deletes an existing role
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Role name - name
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional deletion parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DeleteRole(Val Connection, Val Name, Val Base = Undefined, Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Name);

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "dropRole", Name, Base, Parameters);
    Return Result;

EndFunction

// Grant roles
// Grants selected roles to a user
//
// Note
// Role can be defined in one of the following formats:^
// Structure: `{ role: "name", db: "database" }`^
// String: `name рoлand`
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// User - String - Users name - user
// RoleArray - Array Of Arbitrary - Role or role array - roles
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional deletion parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GrantRoles(Val Connection
    , Val User
    , Val RoleArray
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    Return GrantRevokeRole("grantRolesToUser", Connection, User, RoleArray, Base, Parameters);

EndFunction

// Revoke roles
// Revokes selected roles from a user
//
// Note
// Role can be defined in one of the following formats:^
// Structure: `{ role: "name", db: "database" }`^
// String: `name рoлand`
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// User - String - Users name - user
// RoleArray - Array Of Arbitrary - Role or role array - roles
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional deletion parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function RevokeRoles(Val Connection
    , Val User
    , Val RoleArray
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    Return GrantRevokeRole("revokeRolesFromUser", Connection, User, RoleArray, Base, Parameters);

EndFunction

// Get role privilege structure
// Forms the privilege information structure for use when working with roles
//
// Note
// Resource can be defined in one of the following formats:^
// Structure for collection: `{ db: "database", collection: "collection name" }`
// Structure for toлawithтерa: `{ cluster : true }`
//
// Parameters:
// Resource - Structure Of KeyAndValue - Privilege resource - res
// ActionsArray - Array Of String - Array of available privilege actions - act
//
// Returns:
// Structure - Privilege structure
Function GetRolePrivilegeStructure(Val Resource, Val ActionsArray) Export

    PrivilegeStructure = New Structure;
    OPI_Tools.AddField("resource", Resource    , "KeyAndValue", PrivilegeStructure);
    OPI_Tools.AddField("actions" , ActionsArray, "Array"      , PrivilegeStructure);

    Return PrivilegeStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function ProcessDataForOperation(Val Data, Covered = False)

    Try

        ProcessedData = Data;
        OPI_TypeConversion.GetKeyValueCollection(ProcessedData);
        ProcessedData = ProcessCollectionForOperation(ProcessedData);

    Except

        ProcessedData = Data;
        CurrentKey    = Undefined;

        If OPI_Tools.ThisIsCollection(ProcessedData) Then

            ProcessedData = ProcessCollectionForOperation(ProcessedData);

        ElsIf TypeOf(ProcessedData) = Type("BinaryData") Then

            ProcessedData = GetBase64StringFromBinaryData(ProcessedData);
            CurrentKey    = "__OPI_BINARY__";

        ElsIf TypeOf(ProcessedData) = Type("Date") Then

            ProcessedData = OPI_Tools.DateRFC3339(ProcessedData);
            CurrentKey    = "__OPI_DATETIME__";

        ElsIf ProcessedData = Undefined Then

            CurrentKey = "__OPI_NULL__";

        Else

            If Not TypeOf(ProcessedData) = Type("Number") And Not TypeOf(ProcessedData) = Type("Boolean") Then
                OPI_TypeConversion.GetLine(ProcessedData);
            EndIf;

        EndIf;

        If ValueIsFilled(CurrentKey) And Not Covered Then
            ProcessedData = New Structure(CurrentKey, ProcessedData);
        EndIf;

    EndTry;

    Return ProcessedData;

EndFunction

Function ProcessCollectionForOperation(Val Data)

    ProcessedData = New(TypeOf(Data));

    If OPI_Tools.ThisIsCollection(ProcessedData, True) Then

        For Each DataPart In Data Do

            CurrentKey = String(DataPart.Key);
            Covered    = StrStartsWith(CurrentKey, "__OPI_");

            CurrentValue = DataPart.Value;

            If CurrentKey = "__OPI_BINARY__" Then
                OPI_TypeConversion.GetBinaryData(CurrentValue);
            EndIf;

            ProcessedValue = ProcessDataForOperation(CurrentValue, Covered);

            ProcessedData.Insert(CurrentKey, ProcessedValue);

        EndDo;

    Else

        For Each Element In Data Do
            ProcessedData.Add(ProcessDataForOperation(Element));
        EndDo;

    EndIf;

    Return ProcessedData;

EndFunction

Function CreateOrUpdateUser(Val DBCommand
    , Val Connection
    , Val Name
    , Val UserRoles  = Undefined
    , Val Base       = Undefined
    , Val Password   = Undefined
    , Val Parameters = Undefined)

    OPI_TypeConversion.GetLine(Name);

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    If UserRoles <> Undefined Then
        OPI_TypeConversion.GetArray(UserRoles);
        Parameters.Insert("roles", UserRoles);
    EndIf;

    If Password <> Undefined Then
        OPI_TypeConversion.GetLine(Password);
        Parameters.Insert("pwd", Password);
    EndIf;

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, DBCommand, Name, Base, Parameters);
    Return Result;

EndFunction

Function CreateOrUpdateRole(Val DBCommand
    , Val Connection
    , Val Name
    , Val Base            = Undefined
    , Val PrivilegesArray = Undefined
    , Val RoleArray       = Undefined
    , Val Parameters      = Undefined)

    OPI_TypeConversion.GetLine(Name);

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    If RoleArray <> Undefined Then
        OPI_TypeConversion.GetArray(RoleArray);
        Parameters.Insert("roles", RoleArray);
    EndIf;

    If PrivilegesArray <> Undefined Then
        OPI_TypeConversion.GetArray(PrivilegesArray);
        Parameters.Insert("privileges", PrivilegesArray);
    EndIf;

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, DBCommand, Name, Base, Parameters);
    Return Result;

EndFunction

Function GrantRevokeRole(Val DBCommand
    , Val Connection
    , Val User
    , Val RoleArray
    , Val Base       = Undefined
    , Val Parameters = Undefined)

    OPI_TypeConversion.GetLine(User);

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    OPI_Tools.AddField("roles", RoleArray, "Array", Parameters);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, DBCommand, User, Base, Parameters);
    Return Result;

EndFunction

#EndRegion
