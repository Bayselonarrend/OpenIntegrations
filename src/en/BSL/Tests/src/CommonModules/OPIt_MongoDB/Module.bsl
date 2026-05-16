// OneScript: ./OInt/tests/Modules/OPIt_MongoDB.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

// #Use oint
// #Use asserts
// #Use "internal"

#If Not WebClient Then // !OPI

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("MongoDB");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("MongoDB");

EndFunction

#Region Internal

#Region RunnableTests

#Region MongoDB

Procedure Mongo_CommonMethods() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_GenerateConnectionString(TestParameters);
    MongoDB_CreateConnection(TestParameters);
    MongoDB_CloseConnection(TestParameters);
    MongoDB_IsConnector(TestParameters);
    MongoDB_ExecuteCommand(TestParameters);

EndProcedure

Procedure Mong_DatabaseManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_GetDatabase(TestParameters);
    MongoDB_GetListOfBases(TestParameters);
    MongoDB_DeleteDatabase(TestParameters);

EndProcedure

Procedure Mongo_CollectionManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_CreateCollection(TestParameters);
    MongoDB_GetCollectionList(TestParameters);
    MongoDB_DeleteCollection(TestParameters);

EndProcedure

Procedure Mongo_DocumentsManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    MongoDB_InsertDocuments(TestParameters);
    MongoDB_GetDocuments(TestParameters);
    MongoDB_GetCursor(TestParameters);
    MongoDB_GetDocumentBatch(TestParameters);
    MongoDB_UpdateDocuments(TestParameters);
    MongoDB_DeleteDocuments(TestParameters);
    MongoDB_GetDocumentUpdateStructure(TestParameters);
    MongoDB_GetDocumentDeletionStructure(TestParameters);

EndProcedure

Procedure Mongo_UserManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_CreateUser(TestParameters);
    MongoDB_UpdateUser(TestParameters);
    MongoDB_GetUsers(TestParameters);
    MongoDB_GetDatabaseUsers(TestParameters);
    MongoDB_DeleteUser(TestParameters);

EndProcedure

Procedure Mongo_RoleManagement() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Port"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_User"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("MongoDB_DB"      , TestParameters);

    MongoDB_CreateRole(TestParameters);
    MongoDB_GetRoles(TestParameters);
    MongoDB_GrantRoles(TestParameters);
    MongoDB_RevokeRoles(TestParameters);
    MongoDB_UpdateRole(TestParameters);
    MongoDB_DeleteRole(TestParameters);
    MongoDB_GetRolePrivilegeStructure(TestParameters);

EndProcedure

#EndRegion // MongoDB

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region MongoDB

Procedure MongoDB_GenerateConnectionString(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    ConnectionParams = New Structure("authSource", "admin");
    Result           = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GenerateConnectionString", , FunctionParameters);

EndProcedure

Procedure MongoDB_CreateConnection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    Result = OPI_MongoDB.CreateConnection(ConnectionString);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateConnection");

    Result = OPI_MongoDB.CloseConnection(Result);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateConnection", "Closing");

EndProcedure

Procedure MongoDB_CloseConnection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    Connection = OPI_MongoDB.CreateConnection(ConnectionString);
    Result     = OPI_MongoDB.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CloseConnection");

EndProcedure

Procedure MongoDB_IsConnector(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);

    Connection = OPI_MongoDB.CreateConnection(ConnectionString);
    Result     = OPI_MongoDB.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "IsConnector");

EndProcedure

Procedure MongoDB_ExecuteCommand(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);

    Command = "listDatabases";
    Data    = New Structure("nameOnly", True);

    Connection = OPI_MongoDB.CreateConnection(ConnectionString);

    OPI_TestDataRetrieval.Process(Connection, "MongoDB", "ExecuteCommand", "Connection"); // SKIP

    Result = OPI_MongoDB.ExecuteCommand(Connection, Command, , , Data);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "ExecuteCommand");

EndProcedure

Procedure MongoDB_GetDatabase(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, Base, Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Base = "test_db";

    Result = OPI_MongoDB.GetDatabase(Connection, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDatabase");

EndProcedure

Procedure MongoDB_GetListOfBases(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Result = OPI_MongoDB.GetListOfBases(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetListOfBases");

EndProcedure

Procedure MongoDB_DeleteDatabase(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Result = OPI_MongoDB.DeleteDatabase(Connection, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteDatabase");

EndProcedure

Procedure MongoDB_CreateCollection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Name = "test_collection";
    Base = "test_database";

    Parameters = New Map;
    Expression = New Map;
    GroupAnd   = New Array;

    Condition1 = New Map; // Total >= 0
    Items1     = New Array;
    Items1.Add("$total");
    Items1.Add(0);
    Condition1.Insert("$gte", Items1);

    Condition2 = New Map; // Status <= 3
    Items2     = New Array;
    Items2.Add("$status");
    Items2.Add(3);
    Condition2.Insert("$lte", Items2);

    GroupAnd.Add(Condition1);
    GroupAnd.Add(Condition2);

    Expression.Insert("$expr", GroupAnd);
    Parameters.Insert("validator", Expression);

    Result = OPI_MongoDB.CreateCollection(Connection, Name, Base, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateCollection");

    Result = OPI_MongoDB.CreateCollection(Connection, Name, Base, Parameters);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateCollection", "Existing");

EndProcedure

Procedure MongoDB_DeleteCollection(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "test_collection";
    Base       = "test_database";

    Result = OPI_MongoDB.DeleteCollection(Connection, Collection, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteCollection");

EndProcedure

Procedure MongoDB_GetCollectionList(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Base = "test_database";

    Result = OPI_MongoDB.GetCollectionList(Connection, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetCollectionList");

EndProcedure

Procedure MongoDB_InsertDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";
    DocsArray  = New Array;

    // With implicit type casting
    DocumentStructure = New Structure;

    TestArray = New Array;
    TestArray.Add("Value1");
    TestArray.Add("Value2");

    TestStructure = New Structure("text,number", "Text", 10);
    TestBinary    = GetBinaryDataFromString("Text");
    CurrentDate   = OPI_Tools.GetCurrentDate();

    DocumentStructure.Insert("stringField", "Text");
    DocumentStructure.Insert("intField"   , 200);
    DocumentStructure.Insert("doubleField", 123.456);
    DocumentStructure.Insert("boolField"  , True);
    DocumentStructure.Insert("arrayField" , TestArray);
    DocumentStructure.Insert("docField"   , TestStructure);
    DocumentStructure.Insert("dateField"  , CurrentDate);
    DocumentStructure.Insert("nullField");

    DocsArray.Add(DocumentStructure);

    // With explicit type casting
    DocumentStructure = New Structure;

    RegExp = New Structure("pattern,options", "[a-z]+@[a-z]+\.[a-z]+", "i");
    JSCode = "const result = [1, 2, 3].map(x => x * 2).filter(x => x > 3);";

    DocumentStructure.Insert("stringField", New Structure("__OPI_STRING__"   , "Text"));
    DocumentStructure.Insert("oidField"   , New Structure("__OPI_OBJECTID__" , "63ceed18f71dda7d8cf21e8e"));
    DocumentStructure.Insert("jsField"    , New Structure("__OPI_JS__"       , JSCode));
    DocumentStructure.Insert("symbolField", New Structure("__OPI_SYMBOL__"   , "Y"));
    DocumentStructure.Insert("int32Field" , New Structure("__OPI_INT32__"    , 10));
    DocumentStructure.Insert("int64Field" , New Structure("__OPI_INT64__"    , 1000));
    DocumentStructure.Insert("doubleField", New Structure("__OPI_DOUBLE__"   , 124.456));
    DocumentStructure.Insert("boolField"  , New Structure("__OPI_BOOLEAN__"  , True));
    DocumentStructure.Insert("dateField"  , New Structure("__OPI_DATETIME__" , "1763204141"));
    DocumentStructure.Insert("tsField"    , New Structure("__OPI_TIMESTAMP__", CurrentDate));
    DocumentStructure.Insert("regexpField", New Structure("__OPI_REGEXP__"   , RegExp));
    DocumentStructure.Insert("binaryField", New Structure("__OPI_BINARY__"   , TestBinary));
    DocumentStructure.Insert("nullField"  , New Structure("__OPI_NULL__"));
    DocumentStructure.Insert("minkeyField", New Structure("__OPI_MINKEY__"));
    DocumentStructure.Insert("maxkeyField", New Structure("__OPI_MAXKEY__"));

    TestArray = New Array;
    TestArray.Add(New Structure("__OPI_SYMBOL__", "A"));
    TestArray.Add(New Structure("__OPI_MINKEY__"));

    TestStructure = New Structure("code,number"
        , New Structure("__OPI_JS__", "const result = 1")
        , New Structure("__OPI_DOUBLE__", 10));

    // Documents and arrays are not wrapped in a structure
    DocumentStructure.Insert("docField" , TestStructure);
    DocumentStructure.Insert("arrayField" , TestArray);

    DocsArray.Add(DocumentStructure);

    OPI_MongoDB.DeleteCollection(Connection, Collection, Base); // SKIP

    Result = OPI_MongoDB.InsertDocuments(Connection, Collection, DocsArray, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "InsertDocuments");

    DocsArray = New Array;

    CategoryMap = New Map;
    CategoryMap.Insert(1, "electronics");
    CategoryMap.Insert(2, "clothing");
    CategoryMap.Insert(3, "books");
    CategoryMap.Insert(4, "products");

    SupplierMap = New Map;
    SupplierMap.Insert(1, "Supplier A");
    SupplierMap.Insert(2, "Supplier B");
    SupplierMap.Insert(3, "Supplier C");

    For N = 1 To 15 Do

        DocumentStructure = New Structure;

        DocumentStructure.Insert("productName", "Product " + N);
        DocumentStructure.Insert("category"   , CategoryMap.Get(N % 4));
        DocumentStructure.Insert("price"      , 50 + (N * 30));
        DocumentStructure.Insert("quantity"   , 5 + (N % 10));
        DocumentStructure.Insert("rating"     , Max(1, N % 6));
        DocumentStructure.Insert("inStock"    , N % 3 > 0);
        DocumentStructure.Insert("tags"       , OPI_TestDataRetrieval.GetTagArray(N));
        DocumentStructure.Insert("createdDate", OPI_Tools.GetCurrentDate() - (N * 86400));

        Details = New Structure;
        Details.Insert("supplier"  , SupplierMap.Get(N % 3));
        Details.Insert("weightKg"  , N * 0.3);
        Details.Insert("dimensions", New Structure("length,width,height", N * 8, N * 4, N * 2));
        DocumentStructure.Insert("details", Details);

        DocsArray.Add(DocumentStructure);

    EndDo;

    DocumentWithZero = New Structure;
    DocumentWithZero.Insert("productName", "Item with zero price");
    DocumentWithZero.Insert("category"   , "books");
    DocumentWithZero.Insert("price"      , 0);
    DocumentWithZero.Insert("quantity"   , 1);
    DocumentWithZero.Insert("rating"     , 4);
    DocumentWithZero.Insert("inStock"    , True);
    DocumentWithZero.Insert("tags"       , New Array);
    DocsArray.Add(DocumentWithZero);

    DocumentWithoutCategory = New Structure;
    DocumentWithoutCategory.Insert("productName", "Item without category");
    DocumentWithoutCategory.Insert("price"      , 250);
    DocumentWithoutCategory.Insert("quantity"   , 3);
    DocumentWithoutCategory.Insert("rating"     , 3);
    DocumentWithoutCategory.Insert("inStock"    , False);
    DocsArray.Add(DocumentWithoutCategory);

    Result = OPI_MongoDB.InsertDocuments(Connection, Collection, DocsArray, Base);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "InsertDocuments");

EndProcedure

Procedure MongoDB_GetDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    // __4 = $
    Filter = New Structure("stringField,doubleField", "Text", New Structure("__4gte, __4lte", 100, 150));
    Sort = New Structure("doubleField", -1);
    Parameters = New Structure("limit", 2);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocuments");

    // 1: Category and price range
    Filter = New Structure("category,price", "electronics", New Structure("__4gte,__4lte", 100, 400));
    Sort = New Structure("price", 1);
    Parameters = New Structure("limit", 5);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocuments", 1);

    // 2: Stock and rating
    Filter = New Structure("inStock,rating", True, New Structure("__4gte", 4));
    Sort = New Structure("rating,price", -1, 1);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocuments", 2);

    // 3: By tags array
    Filter = New Structure("tags", "sale");
    Sort = New Structure("createdDate", -1);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocuments", 3);

    // 4: By nested fields
    Filter = New Map;
    Filter.Insert("details.supplier", "Supplier A");
    Filter.Insert("details.weightKg", New Structure("__4lt", 3));

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocuments", 4);

    // 5: Projection
    Filter = New Structure("category", "books");
    Sort = New Structure("price", -1);
    Parameters = New Structure("projection", New Structure("productName,price,rating", 1, 1, 1));

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocuments", 5);

EndProcedure

Procedure MongoDB_GetCursor(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    Filter     = New Structure("stringField", "Text");
    Sort       = New Structure("doubleField", -1);
    Parameters = New Structure("limit,batchSize", 2, 1);

    Result = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetCursor");

    // Big batchSize with limit
    Filter = New Structure("inStock", True);
    Sort = New Structure("price", 1);
    Parameters = New Structure("limit,batchSize", 8, 3);

    Result = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetCursor", 1);

    // Small batchSize without limit
    Filter = New Structure("category", "clothing");
    Sort = New Structure("rating", -1);
    Parameters = New Structure("batchSize", 2);

    Result = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetCursor", 2);

EndProcedure

Procedure MongoDB_GetDocumentBatch(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    Filter     = New Structure("stringField", "Text");
    Sort       = New Structure("doubleField", -1);
    Parameters = New Structure("limit,batchSize", 2, 1);

    Cursor = OPI_MongoDB.GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    If Not Cursor["result"] Then
        Raise Cursor["error"];
    EndIf;

    Cursor          = Cursor["data"]["cursor"];
    DocsArray       = Cursor["firstBatch"];
    CursorID        = Cursor["id"];
    ContinueGetting = CursorID > 0;

    While ContinueGetting Do

        Result = OPI_MongoDB.GetDocumentBatch(Connection, Collection, CursorID, Base); // <---

        If Not Result["result"] Then
            Raise Result["error"];
        EndIf;

        ContinueGetting = Result["data"]["cursor"]["id"] > 0;

        For Each Record In Result["data"]["cursor"]["nextBatch"] Do
            DocsArray.Add(Record);
        EndDo;

    EndDo;

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocumentBatch");

EndProcedure

Procedure MongoDB_UpdateDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    // __4 = $
    Filter = New Structure("stringField,doubleField", "Text", New Structure("__4gte, __4lte", 100, 150));
    Data = New Structure( "__4set", New Structure("doubleField", 999));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data); // Array or single
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments");

    Parameters = New Structure("limit,batchSize", 2, 1);
    Sort       = New Structure("doubleField", -1);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", "Obtaining");

    Filter = New Structure("stringField,doubleField", "Text", 999);

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Sort, Parameters);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", "Getting new");

    // Multiply fields
    Filter = New Structure("category", "electronics");
    Data = New Structure("__4set", New Structure("price,inStock,rating", 777, False, 5));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 1);

    Filter      = New Structure("category", "electronics", "price", 777);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 1");

    // Number inc
    Filter = New Structure("productName", "Product 1");
    Data = New Structure("__4inc", New Structure("quantity", 10));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 2);

    Filter      = New Structure("productName", "Product 1");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 2");

    // Array insertion
    Filter = New Structure("productName", "Product 2");
    Data = New Structure("__4push", New Structure("tags", "updated"));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 3);

    Filter      = New Structure("productName", "Product 2", "tags", "updated");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 3");

    // Nested field update
    SettingMapping = New Map;
    SettingMapping.Insert("details.weightKg", 2.5);
    SettingMapping.Insert("details.supplier", "Supplier A+");

    Filter = New Map;
    Filter.Insert("details.supplier", "Supplier A");

    Data = New Structure("__4set", SettingMapping);

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 4);

    Filter      = New Map;
    Filter.Insert("details.supplier", "Supplier A+");
    Filter.Insert("details.weightKg", 2.5);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 4");

    // Upsert
    Filter = New Structure("productName", "New product");

    //@skip-check structure-consructor-too-many-keys
    Data = New Structure("__4set", New Structure("productName,category,price,quantity,inStock,createdDate"
        , "New product"
        , "electronics"
        , 1999
        , 1
        , True
        , OPI_Tools.GetCurrentDate()
    ));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, False, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 5);

    Filter      = New Structure("productName", "New product");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 5");

    // Field removing
    Filter = New Structure("productName", "Product 3");
    Data = New Structure("__4unset", New Structure("rating", ""));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 6);

    Filter      = New Structure("productName", "Product 3");
    Parameters  = New Structure("projection", New Structure("productName,rating", 1, 1));
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter, Undefined, Parameters);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 6");

    // Multiply operators
    Filter = New Structure("price", New Structure("__4lt", 200));
    Data = New Structure;
    Data.Insert("__4set", New Structure("inStock", False));
    Data.Insert("__4inc", New Structure("quantity", -5));
    Data.Insert("__4push", New Structure("tags", "discount"));

    Updating = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True);
    Result   = OPI_MongoDB.UpdateDocuments(Connection, Collection, Updating, Base);
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 7);

    Filter      = New Structure("price,tags", New Structure("__4lt", 200), "discount");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 7");

    // Updates array
    UpdateArray = New Array;

    Filter1 = New Structure("category", "electronics");
    Data1   = New Structure("__4set", New Structure("price,discounted", 888, True));
    Update1 = OPI_MongoDB.GetDocumentUpdateStructure(Filter1, Data1, True);
    UpdateArray.Add(Update1);

    Filter2 = New Structure("category", "clothing");
    Data2   = New Structure("__4inc", New Structure("quantity", 5));
    Update2 = OPI_MongoDB.GetDocumentUpdateStructure(Filter2, Data2, True);
    UpdateArray.Add(Update2);

    Filter3 = New Structure("category", "books");
    Data3   = New Structure("__4push", New Structure("tags", "mass_update"));
    Update3 = OPI_MongoDB.GetDocumentUpdateStructure(Filter3, Data3, True);
    UpdateArray.Add(Update3);

    Filter4 = New Structure("productName", "Special item from array");

    //@skip-check structure-consructor-too-many-keys
    Data4 = New Structure("__4set", New Structure("productName,category,price,quantity,inStock,createdDate"
        , "Special item from array"
        , "special"
        , 1111
        , 7
        , True
        , OPI_Tools.GetCurrentDate()
    ));

    Update4 = OPI_MongoDB.GetDocumentUpdateStructure(Filter4, Data4, False, True);
    UpdateArray.Add(Update4);

    Filter5 = New Structure("rating", New Structure("__4lte", 2));
    Data5   = New Structure;
    Data5.Insert("__4set", New Structure("needsImprovement", True));
    Data5.Insert("__4inc", New Structure("quantity"        , -2));
    Update5 = OPI_MongoDB.GetDocumentUpdateStructure(Filter5, Data5, True);
    UpdateArray.Add(Update5);

    Result = OPI_MongoDB.UpdateDocuments(Connection, Collection, UpdateArray, Base);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateDocuments", 9);

    Filter      = New Structure("category,price", "electronics", 888);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_1");

    Filter      = New Structure("category,tags", "books", "mass_update");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_2");

    Filter      = New Structure("productName", "Special item from array");
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_3");

    Filter      = New Structure("needsImprovement", True);
    CheckResult = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);
    OPI_TestDataRetrieval.Process(CheckResult, "MongoDB", "UpdateDocuments", "Check 8_4");

EndProcedure

Procedure MongoDB_GetDocumentUpdateStructure(FunctionParameters)

    // __4 = $
    Filter = New Structure("stringField,doubleField", "Text", New Structure("__4gte, __4lte", 100, 150));
    Data = New Structure( "__4set", New Structure("doubleField", 999));

    Result = OPI_MongoDB.GetDocumentUpdateStructure(Filter, Data, True, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocumentUpdateStructure");

EndProcedure

Procedure MongoDB_GetDocumentDeletionStructure(FunctionParameters)

    Filter = New Structure("stringField,doubleField", "Text", 999);
    Result = OPI_MongoDB.GetDocumentDeletionStructure(Filter, 1); // Array or single

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDocumentDeletionStructure");

EndProcedure

Procedure MongoDB_DeleteDocuments(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Collection = "new_collection";

    Filter   = New Structure("stringField,doubleField", "Text", 999);
    Deletion = OPI_MongoDB.GetDocumentDeletionStructure(Filter, 1); // Array or single

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter); // SKIP
    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteDocuments", "Precheck"); // SKIP

    Result = OPI_MongoDB.DeleteDocuments(Connection, Collection, Deletion, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteDocuments");

    Result = OPI_MongoDB.GetDocuments(Connection, Collection, Base, Filter);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteDocuments", "Check");

EndProcedure

Procedure MongoDB_CreateUser(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("read");
    RoleArray.Add("userAdmin");

    UserName     = "newuser";
    UserPassword = "1234";

    Result = OPI_MongoDB.CreateUser(Connection, UserName, RoleArray, Base, UserPassword);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateUser");

    Result = OPI_MongoDB.CreateUser(Connection, UserName, RoleArray, Base, UserPassword);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateUser", "Existing");

EndProcedure

Procedure MongoDB_UpdateUser(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("readWrite");

    UserName     = "newuser";
    UserPassword = "4321";

    Result = OPI_MongoDB.UpdateUser(Connection, UserName, RoleArray, Base, UserPassword);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateUser");

    UserName = "anotheruser";

    Result = OPI_MongoDB.UpdateUser(Connection, UserName, RoleArray, Base, UserPassword);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateUser", "Nonexistent");

EndProcedure

Procedure MongoDB_DeleteUser(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    UserName = "newuser";

    Result = OPI_MongoDB.DeleteUser(Connection, UserName, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteUser");

    Result = OPI_MongoDB.DeleteUser(Connection, UserName, Base);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteUser", "Again");

EndProcedure

Procedure MongoDB_GetUsers(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    UserName = "newuser";

    Result = OPI_MongoDB.GetUsers(Connection, UserName, Base);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetUsers", "Simple"); // SKIP

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add(New Structure("user,db", "bayselonarrend", "admin"));
    ArrayOfUsers.Add(New Structure("user,db", "newuser"       , "main"));

    Result = OPI_MongoDB.GetUsers(Connection, ArrayOfUsers, Base, True, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetUsers");

EndProcedure

Procedure MongoDB_GetDatabaseUsers(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = FunctionParameters["MongoDB_DB"];

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Result = OPI_MongoDB.GetDatabaseUsers(Connection, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetDatabaseUsers");

EndProcedure

Procedure MongoDB_CreateRole(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("read");
    RoleArray.Add("userAdmin");

    Resource = New Structure("db,collection", Base, "new_collection");
    Actions  = New Array;

    Actions.Add("find");
    Actions.Add("insert");
    Actions.Add("update");

    Privilege = OPI_MongoDB.GetRolePrivilegeStructure(Resource, Actions);

    PrivilegesArray = New Array;
    PrivilegesArray.Add(Privilege);

    RoleName = "newrole";

    OPI_MongoDB.DeleteRole(Connection, RoleName, Base); // SKIP
    Result = OPI_MongoDB.CreateRole(Connection, RoleName, Base, PrivilegesArray, RoleArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateRole");

    Result = OPI_MongoDB.CreateRole(Connection, RoleName, Base, PrivilegesArray, RoleArray);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "CreateRole", "Existing");

EndProcedure

Procedure MongoDB_UpdateRole(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleArray = New Array;
    RoleArray.Add("read");
    RoleArray.Add("userAdmin");

    Resource = New Structure("db,collection", Base, "new_collection2");
    Actions  = New Array;

    Actions.Add("find");
    Actions.Add("insert");

    Privilege = OPI_MongoDB.GetRolePrivilegeStructure(Resource, Actions);

    PrivilegesArray = New Array;
    PrivilegesArray.Add(Privilege);

    RoleName = "newrole";

    Result = OPI_MongoDB.UpdateRole(Connection, RoleName, Base, PrivilegesArray, RoleArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "UpdateRole");

EndProcedure

Procedure MongoDB_DeleteRole(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    RoleName = "newrole";

    Result = OPI_MongoDB.DeleteRole(Connection, RoleName, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteRole");

    Result = OPI_MongoDB.DeleteRole(Connection, RoleName, Base);

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "DeleteRole", "Again");

EndProcedure

Procedure MongoDB_GetRolePrivilegeStructure(FunctionParameters)

    Base     = FunctionParameters["MongoDB_DB"];
    Resource = New Structure("db,collection", Base, "new_collection");
    Actions  = New Array;

    Actions.Add("find");
    Actions.Add("insert");
    Actions.Add("update");

    Result = OPI_MongoDB.GetRolePrivilegeStructure(Resource, Actions);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetRolePrivilegeStructure");

EndProcedure

Procedure MongoDB_GetRoles(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    Role = New Structure("role,db", "newrole", Base);

    Result = OPI_MongoDB.GetRoles(Connection, Role, Base, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GetRoles");

EndProcedure

Procedure MongoDB_GrantRoles(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    User = "bayselonarrend";
    Role = New Structure("role,db", "newrole", Base);

    Result = OPI_MongoDB.GrantRoles(Connection, User, Role, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "GrantRoles");

EndProcedure

Procedure MongoDB_RevokeRoles(FunctionParameters)

    Address  = "127.0.0.1:1234";
    Login    = FunctionParameters["MongoDB_User"];
    Password = FunctionParameters["MongoDB_Password"];
    Base     = "admin";

    Address = OPI_TestDataRetrieval.GetLocalhost() + ":" + FunctionParameters["MongoDB_Port"]; // SKIP

    ConnectionParams = New Structure("authSource", "admin");
    ConnectionString = OPI_MongoDB.GenerateConnectionString(Address, , Login, Password, ConnectionParams);
    Connection       = OPI_MongoDB.CreateConnection(ConnectionString);

    User = "bayselonarrend";
    Role = New Structure("role,db", "newrole", Base);

    Result = OPI_MongoDB.RevokeRoles(Connection, User, Role, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "MongoDB", "RevokeRoles");

EndProcedure

#EndRegion // MongoDB

#EndRegion // AtomicTests

#EndRegion // Private

#EndIf // !OPI
