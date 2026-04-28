// OneScript: ./OInt/tests/Modules/OPIt_SQLite.os

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

#Use oint
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("SQLite");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("SQLite");

EndFunction

#Region Internal

#Region RunnableTests

#Region SQLite

Procedure SQLL_CommonMethods() Export

    TestParameters = New Structure;

    Base = GetTempFileName("sqlite");
    OPI_TestDataRetrieval.WriteParameter("SQLite_DB", Base);
    OPI_Tools.AddField("SQLite_DB", Base, "String", TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQLite_Ext"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQLite_ExtLinux", TestParameters);

    SQLite_CreateConnection(TestParameters);
    SQLite_CloseConnection(TestParameters);
    SQLite_ExecuteSQLQuery(TestParameters);
    SQLite_IsConnector(TestParameters);
    SQLite_ConnectExtension(TestParameters);

    OPI_Tools.RemoveFileWithTry(Base, "Database file deletion error");

EndProcedure

Procedure SQLL_ORM() Export

    TestParameters = New Structure;

    Base = GetTempFileName("sqlite");

    Connection = OPI_SQLite.CreateConnection(Base);
    TestParameters.Insert("SQLite_DB", Connection);

    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);

    SQLite_CreateTable(TestParameters);
    SQLite_AddRecords(TestParameters);
    SQLite_EnsureRecords(TestParameters);
    SQLite_GetRecords(TestParameters);
    SQLite_UpdateRecords(TestParameters);
    SQLite_DeleteRecords(TestParameters);
    SQLite_GetTableInformation(TestParameters);
    SQLite_AddTableColumn(TestParameters);
    SQLite_DeleteTableColumn(TestParameters);
    SQLite_EnsureTable(TestParameters);
    SQLite_ClearTable(TestParameters);
    SQLite_DeleteTable(TestParameters);
    SQLite_GetRecordsFilterStructure(TestParameters);

    OPI_TestDataRetrieval.WriteParameter("SQLite_DB", Base);
    OPI_Tools.AddField("SQLite_DB", Base, "String", TestParameters);

    SQLite_CreateTable(TestParameters);
    SQLite_AddRecords(TestParameters);
    SQLite_EnsureRecords(TestParameters);
    SQLite_GetRecords(TestParameters);
    SQLite_UpdateRecords(TestParameters);
    SQLite_DeleteRecords(TestParameters);
    SQLite_GetTableInformation(TestParameters);
    SQLite_AddTableColumn(TestParameters);
    SQLite_DeleteTableColumn(TestParameters);
    SQLite_EnsureTable(TestParameters);
    SQLite_ClearTable(TestParameters);
    SQLite_DeleteTable(TestParameters);
    SQLite_GetRecordsFilterStructure(TestParameters);

    OPI_Tools.RemoveFileWithTry(Base, "Database file deletion error");

EndProcedure

#EndRegion // SQLite

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region SQLite

Procedure SQLite_CreateConnection(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    LocalBase    = OPI_SQLite.CreateConnection(TFN);
    InMemoryBase = OPI_SQLite.CreateConnection();

    // END

    OPI_TestDataRetrieval.Process(LocalBase   , "SQLite", "CreateConnection");
    OPI_TestDataRetrieval.Process(InMemoryBase, "SQLite", "CreateConnection", "IM");

    Closing = OPI_SQLite.CloseConnection(LocalBase);

    OPI_TestDataRetrieval.Process(Closing, "SQLite", "CreateConnection", "Closing");

    OPI_Tools.RemoveFileWithTry(TFN, "Database file deletion error");

EndProcedure

Procedure SQLite_CloseConnection(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    Connection = OPI_SQLite.CreateConnection(TFN);

    OPI_TestDataRetrieval.Process(Connection, "SQLite", "CloseConnection", "Openning"); // SKIP

    Closing = OPI_SQLite.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Closing, "SQLite", "CloseConnection");

    OPI_Tools.RemoveFileWithTry(TFN, "Database file deletion error");

EndProcedure

Procedure SQLite_ExecuteSQLQuery(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Connection = OPI_SQLite.CreateConnection(TFN);

    OPI_TestDataRetrieval.Process(Connection, "SQLite", "ExecuteSQLQuery", "Openning"); // SKIP

    // CREATE

    QueryText = "
                   |CREATE TABLE test_table (
                   |id INTEGER PRIMARY KEY,
                   |name TEXT,
                   |age INTEGER,
                   |salary REAL,
                   |is_active BOOLEAN,
                   |created_at DATETIME,
                   |data BLOB
                   |);";

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ExecuteSQLQuery", "Create"); // SKIP

    // INSERT with parameters

    QueryText = "
                   |INSERT INTO test_table (name, age, salary, is_active, created_at, data)
                   |VALUES (?1, ?2, ?3, ?4, ?5, ?6);";

    ParameterArray = New Array;
    ParameterArray.Add("Vitaly"); // TEXT
    ParameterArray.Add(25); // INTEGER
    ParameterArray.Add(1000.12); // REAL
    ParameterArray.Add(True); // BOOL
    ParameterArray.Add(OPI_Tools.GetCurrentDate()); // DATETIME
    ParameterArray.Add(New Structure("blob", Image)); // BLOB

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, ParameterArray, , Connection);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ExecuteSQLQuery", , Image); // SKIP

    // Transaction

    QueryText = "BEGIN TRANSACTION;
                   |    CREATE TABLE IF NOT EXISTS users (
                   |        id INTEGER PRIMARY KEY AUTOINCREMENT,
                   |        name TEXT NOT NULL,
                   |        age INTEGER NOT NULL
                   |    );
                   |    INSERT INTO users (name, age) VALUES ('Alice', 30);
                   |    INSERT INTO users (name, age) VALUES ('Bob', 25);
                   |    INSERT INTO users (name, age) VALUES ('Charlie', 35);
                   |    COMMIT;";

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ExecuteSQLQuery", "Transaction"); // SKIP

    // With extension

    If OPI_Tools.IsWindows() Then
        Extension = FunctionParameters["SQLite_Ext"]; // URL, Path or Binary data
    Else
        Extension = FunctionParameters["SQLite_ExtLinux"]; // URL, Path or Binary data
    EndIf;

    EntryPoint = "sqlite3_uuid_init";

    ExtensionMap = New Map;
    ExtensionMap.Insert(Extension, EntryPoint);

    QueryText = "SELECT uuid4();";

    Result = OPI_SQLite.ExecuteSQLQuery(QueryText, , , Connection, ExtensionMap);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ExecuteSQLQuery", "Extension"); // SKIP

    Closing = OPI_SQLite.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Closing, "SQLite", "ExecuteSQLQuery", "Closing");

    OPI_Tools.RemoveFileWithTry(TFN, "Database file deletion error");

EndProcedure

Procedure SQLite_IsConnector(FunctionParameters)

    Connection = OPI_SQLite.CreateConnection();
    Result     = OPI_SQLite.IsConnector(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "IsConnector");

EndProcedure

Procedure SQLite_CreateTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("id"        , "INTEGER PRIMARY KEY");
    ColoumnsStruct.Insert("name"      , "TEXT");
    ColoumnsStruct.Insert("age"       , "INTEGER");
    ColoumnsStruct.Insert("salary"    , "REAL");
    ColoumnsStruct.Insert("is_active" , "BOOLEAN");
    ColoumnsStruct.Insert("created_at", "DATETIME");
    ColoumnsStruct.Insert("data"      , "BLOB");

    Result = OPI_SQLite.CreateTable(Table, ColoumnsStruct, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "CreateTable");

    ColoumnsMap = New Map;
    ColoumnsMap.Insert("id"                 , "INTEGER PRIMARY KEY");
    ColoumnsMap.Insert("[An obscure column]", "TEXT");

    Result = OPI_SQLite.CreateTable("test1", ColoumnsMap, Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "CreateTable", "An obscure column");

EndProcedure

Procedure SQLite_AddRecords(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    PictureFile = GetTempFileName("png");
    Image.Write(PictureFile); // PictureFile - File to disk

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    DataArray = New Array;

    RowStructure2 = New Structure;
    RowStructure2.Insert("name"      , "Vitaly"); // TEXT
    RowStructure2.Insert("age"       , 25); // INTEGER
    RowStructure2.Insert("salary"    , 1000.12); // REAL
    RowStructure2.Insert("is_active" , True); // BOOL
    RowStructure2.Insert("created_at", OPI_Tools.GetCurrentDate()); // DATETIME
    RowStructure2.Insert("data"      , New Structure("blob", Image)); // BLOB

    RowStructure1 = New Structure;
    RowStructure1.Insert("name"      , "Lesha"); // TEXT
    RowStructure1.Insert("age"       , 20); // INTEGER
    RowStructure1.Insert("salary"    , 200.20); // REAL
    RowStructure1.Insert("is_active" , False); // BOOL
    RowStructure1.Insert("created_at", OPI_Tools.GetCurrentDate()); // DATETIME
    RowStructure1.Insert("data"      , New Structure("blob", PictureFile)); // BLOB

    DataArray.Add(RowStructure2);
    DataArray.Add(RowStructure1);

    Result = OPI_SQLite.AddRecords(Table, DataArray, , Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddRecords");

    Result = OPI_SQLite.AddRecords(Table, DataArray, False, Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddRecords", "No transaction");

    RowStructure1.Insert("error", "Lesha");
    DataArray.Add(RowStructure1);

    Result = OPI_SQLite.AddRecords(Table, DataArray, , Base);
    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddRecords", "Field error");

    Result = OPI_SQLite.AddRecords(Table, DataArray, False, Base);
    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddRecords", "Error without transaction");

    Result = OPI_SQLite.AddRecords(Table, "not valid json", , Base);
    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddRecords", "JSON Error");

    RowMap = New Map;
    RowMap.Insert("[An obscure column]", "yo");

    Result = OPI_SQLite.AddRecords("test1", RowMap, , Base);
    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddRecords", "An obscure column");

    OPI_Tools.RemoveFileWithTry(PictureFile, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure SQLite_GetRecords(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Fields = New Array;
    Fields.Add("name");
    Fields.Add("salary");

    Filters = New Array;

    FilterStructure1 = New Structure;

    FilterStructure1.Insert("field", "name");
    FilterStructure1.Insert("type" , "=");
    FilterStructure1.Insert("value", "Vitaly");
    FilterStructure1.Insert("union", "AND");
    FilterStructure1.Insert("raw"  , False);

    FilterStructure2 = New Structure;

    FilterStructure2.Insert("field", "age");
    FilterStructure2.Insert("type" , "BETWEEN");
    FilterStructure2.Insert("value", "20 AND 30");
    FilterStructure2.Insert("raw"  , True);

    Filters.Add(FilterStructure1);
    Filters.Add(FilterStructure2);

    Sort  = New Structure("created_at", "DESC");
    Count = 1;

    Result = OPI_SQLite.GetRecords(Table, Fields, Filters, Sort, Count, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "GetRecords");

    Result = OPI_SQLite.GetRecords(Table, "['name','age','salary','is_active','created_at']", , , , Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "GetRecords", "No parameters");

    FilterStructure2.Insert("type", "SOMETHING");
    Filters.Add(FilterStructure2);

    Result = OPI_SQLite.GetRecords(Table
        , "['name','age','salary','is_active','created_at']"
        , Filters
        ,
        ,
        , Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "GetRecords", "Error");

    Result = OPI_SQLite.GetRecords("test1", , , , , Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "GetRecords", "An obscure column");

EndProcedure

Procedure SQLite_UpdateRecords(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    FieldsStructure = New Structure;
    FieldsStructure.Insert("name"  , "Vitaly A.");
    FieldsStructure.Insert("salary", "999999");

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "name");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", "Vitaly");
    FilterStructure.Insert("union", "AND");
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Result = OPI_SQLite.UpdateRecords(Table, FieldsStructure, FilterStructure, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "UpdateRecords");

    FilterStructure.Insert("value", "Vitaly A.");

    Filters = New Array;
    Filters.Add(FilterStructure);

    Check = OPI_SQLite.GetRecords(Table, "['name','salary']", Filters, , , Base);

    OPI_TestDataRetrieval.Process(Check, "SQLite", "UpdateRecords", "Check", FieldsStructure);

EndProcedure

Procedure SQLite_DeleteRecords(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "name");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", "Vitaly A.");
    FilterStructure.Insert("union", "AND");
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Result = OPI_SQLite.DeleteRecords(Table, FilterStructure, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "DeleteRecords");

    Check = OPI_SQLite.GetRecords(Table, "['name','salary']", Filters, , , Base);

    OPI_TestDataRetrieval.Process(Check, "SQLite", "DeleteRecords", "Check");

EndProcedure

Procedure SQLite_GetTableInformation(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Result = OPI_SQLite.GetTableInformation(Table, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "GetTableInformation");

EndProcedure

Procedure SQLite_EnsureRecords(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test_merge";

    ColoumnsStruct = New Structure; // SKIP
    ColoumnsStruct.Insert("id"     , "INTEGER PRIMARY KEY"); // SKIP
    ColoumnsStruct.Insert("name"   , "TEXT"); // SKIP
    ColoumnsStruct.Insert("age"    , "INTEGER"); // SKIP
    ColoumnsStruct.Insert("salary" , "REAL"); // SKIP
    OPI_SQLite.CreateTable(Table, ColoumnsStruct, Base); // SKIP

    DataArray = New Array;

    RowStructure2 = New Structure;
    RowStructure2.Insert("id"    , 1);
    RowStructure2.Insert("name"  , "Vitaly");
    RowStructure2.Insert("age"   , 25);
    RowStructure2.Insert("salary", 1000.12);

    RowStructure1 = New Structure;
    RowStructure1.Insert("id"    , 2);
    RowStructure1.Insert("name"  , "Lesha");
    RowStructure1.Insert("age"   , 20);
    RowStructure1.Insert("salary", 200.20);

    DataArray.Add(RowStructure2);
    DataArray.Add(RowStructure1);

    KeyFields = New Array;
    KeyFields.Add("id");

    Result = OPI_SQLite.EnsureRecords(Table, DataArray, KeyFields, , Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "EnsureRecords", "Insertion");

    Check = OPI_SQLite.GetRecords(Table, "*", , , , Base);
    OPI_TestDataRetrieval.Process(Check, "SQLite", "EnsureRecords", "Insertion check");

    RowStructure2.Insert("name"  , "Vitaly Updated");
    RowStructure2.Insert("salary", 1500.50);

    StringStructure3 = New Structure;
    StringStructure3.Insert("id"    , 3);
    StringStructure3.Insert("name"  , "Anton");
    StringStructure3.Insert("age"   , 30);
    StringStructure3.Insert("salary", 3000.00);

    DataArray = New Array;
    DataArray.Add(RowStructure2);
    DataArray.Add(StringStructure3);

    Result = OPI_SQLite.EnsureRecords(Table, DataArray, KeyFields, , Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "EnsureRecords", "Updating");

    Check = OPI_SQLite.GetRecords(Table, "*", , , , Base);
    OPI_TestDataRetrieval.Process(Check, "SQLite", "EnsureRecords", "Updating check");

    OPI_SQLite.DeleteTable(Table, Base);

EndProcedure

Procedure SQLite_GetRecordsFilterStructure(FunctionParameters)

    Result = OPI_SQLite.GetRecordsFilterStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "GetRecordsFilterStructure");

    Result = OPI_SQLite.GetRecordsFilterStructure(True);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "GetRecordsFilterStructure", "Clear");

EndProcedure

Procedure SQLite_DeleteTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Result = OPI_SQLite.DeleteTable(Table, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "DeleteTable");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    OPI_TestDataRetrieval.Process(Check, "SQLite", "DeleteTable", "Check");

    OPI_SQLite.DeleteTable("test1", Base);

EndProcedure

Procedure SQLite_ClearTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Result = OPI_SQLite.ClearTable(Table, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ClearTable");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    OPI_TestDataRetrieval.Process(Check, "SQLite", "ClearTable", "Table");

    Check = OPI_SQLite.GetRecords(Table, , , , , Base);

    OPI_TestDataRetrieval.Process(Check, "SQLite", "ClearTable", "Check");

EndProcedure

Procedure SQLite_ConnectExtension(FunctionParameters)

    If OPI_Tools.IsWindows() Then
        Extension = FunctionParameters["SQLite_Ext"]; // URL, Path or Binary data
    Else
        Extension = FunctionParameters["SQLite_ExtLinux"]; // URL, Path or Binary data
    EndIf;

    Base       = FunctionParameters["SQLite_DB"];
    EntryPoint = "sqlite3_uuid_init";

    Connection = OPI_SQLite.CreateConnection(Base);
    Result     = OPI_SQLite.ConnectExtension(Extension, EntryPoint, Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ConnectExtension");

    TFN = GetTempFileName("dll");
    CopyFile(Extension, TFN);

    Result = OPI_SQLite.ConnectExtension(TFN, EntryPoint, Connection);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ConnectExtension", "Path");

    Result = OPI_SQLite.ConnectExtension(New BinaryData(TFN), EntryPoint, Connection);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "ConnectExtension", "Binary");

    Result = OPI_SQLite.CloseConnection(Connection);

    OPI_Tools.RemoveFileWithTry(TFN, "Error deleting extension file");

EndProcedure

Procedure SQLite_AddTableColumn(FunctionParameters)

    Base     = FunctionParameters["SQLite_DB"];
    Table    = "test";
    Name     = "new_col";
    DataType = "TEXT";

    Result = OPI_SQLite.AddTableColumn(Table, Name, DataType, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddTableColumn");

    Result = OPI_SQLite.GetTableInformation(Table, Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "AddTableColumn", "Check");

EndProcedure

Procedure SQLite_DeleteTableColumn(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";
    Name  = "new_col";

    Result = OPI_SQLite.DeleteTableColumn(Table, Name, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "DeleteTableColumn");

    Result = OPI_SQLite.GetTableInformation(Table, Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "DeleteTableColumn", "Check");

EndProcedure

Procedure SQLite_EnsureTable(FunctionParameters)

    Base = FunctionParameters["SQLite_DB"];

    Table = "test";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("id"   , "INTEGER");
    ColoumnsStruct.Insert("code" , "INTEGER");
    ColoumnsStruct.Insert("name" , "TEXT");
    ColoumnsStruct.Insert("age"  , "INTEGER");
    ColoumnsStruct.Insert("info" , "TEXT");

    Result = OPI_SQLite.EnsureTable(Table, ColoumnsStruct, Base);

    // END

    OPI_TestDataRetrieval.Process(Result, "SQLite", "EnsureTable");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    OPI_TestDataRetrieval.Process(Check, "SQLite", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Result = OPI_SQLite.EnsureTable(Table, ColoumnsStruct, Base);

    OPI_TestDataRetrieval.Process(Result, "SQLite", "EnsureTable", "New");

    Check = OPI_SQLite.GetTableInformation(Table, Base);

    OPI_TestDataRetrieval.Process(Check, "SQLite", "EnsureTable", "Check 2", ColoumnsStruct);

EndProcedure

#EndRegion // SQLite

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure SQLL_ОсновныеМетоды() Export
    SQLL_CommonMethods();
EndProcedure

#EndRegion