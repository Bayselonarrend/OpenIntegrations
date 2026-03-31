// OneScript: ./OInt/tests/Modules/OPIt_MSSQL.os

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

    OPI_TestDataRetrieval.FormYAXTests("MSSQL");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("MSSQL");

EndFunction

#Region Internal

#Region RunnableTests

#Region MSSQL

Procedure MSS_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("PG_IP"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("PG_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQL2"       , TestParameters);

    MSSQL_GenerateConnectionString(TestParameters);
    MSSQL_CreateConnection(TestParameters);
    MSSQL_CloseConnection(TestParameters);
    MSSQL_IsConnector(TestParameters);
    MSSQL_ExecuteSQLQuery(TestParameters);
    MSSQL_GetTLSSettings(TestParameters);

EndProcedure

Procedure MSS_ORM() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("PG_IP"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("PG_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"    , TestParameters);

    MSSQL_CreateDatabase(TestParameters);
    MSSQL_CreateTable(TestParameters);
    MSSQL_AddRecords(TestParameters);
    MSSQL_EnsureRecords(TestParameters);
    MSSQL_GetRecords(TestParameters);
    MSSQL_UpdateRecords(TestParameters);
    MSSQL_DeleteRecords(TestParameters);
    MSSQL_ClearTable(TestParameters);
    MSSQL_GetTableInformation(TestParameters);
    MSSQL_AddTableColumn(TestParameters);
    MSSQL_DeleteTableColumn(TestParameters);
    MSSQL_EnsureTable(TestParameters);
    MSSQL_DeleteTable(TestParameters);
    MSSQL_DeleteDatabase(TestParameters);
    MSSQL_GetRecordsFilterStructure(TestParameters);

EndProcedure

#EndRegion // MSSQL

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region MSSQL

Procedure MSSQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];

    Result = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GenerateConnectionString");

EndProcedure

Procedure MSSQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);
    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);

    Result = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CreateConnection");

EndProcedure

Procedure MSSQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);
    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MSSQL.CloseConnection(Connection);

    // END

    OPI_MSSQL.CloseConnection(Result);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CloseConnection");

EndProcedure

Procedure MSSQL_IsConnector(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);
    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MSSQL.IsConnector(Connection);

    // END

    OPI_MSSQL.CloseConnection(Result);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "IsConnector");

EndProcedure

Procedure MSSQL_ExecuteSQLQuery(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();
    Image       = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);
    Connection       = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_MSSQL.DeleteTable("users"     , Connection); // SKIP
    OPI_MSSQL.DeleteTable("test_data" , Connection); // SKIP
    OPI_MSSQL.DeleteTable("test_table", Connection); // SKIP
    OPI_TestDataRetrieval.Process(Connection, "MSSQL", "ExecuteSQLQuery", "Connection"); // SKIP

    // CREATE

    QueryText = "
        |CREATE TABLE test_table (
        |    ID INT PRIMARY KEY,
        |    FirstName NVARCHAR(50),
        |    LastName NVARCHAR(50),
        |    BirthDate DATE,
        |    IsEmployed BIT,
        |    Salary DECIMAL(10, 2),
        |    CreatedAt DATETIME,
        |    Age SMALLINT,
        |    RowGuid UNIQUEIDENTIFIER,
        |    Data VARBINARY(MAX)
        |);";

    Result = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "ExecuteSQLQuery", "Create"); // SKIP

    // INSERT with parameters

    QueryText = "
        |INSERT INTO test_table (ID, FirstName, LastName, BirthDate, IsEmployed, Salary, CreatedAt, Age, RowGuid, Data)
        |VALUES (@P1, @P2, @P3, @P4, @P5, @P6, @P7, @P8, @P9, @P10);";

    ParameterArray = New Array;
    ParameterArray.Add(New Structure("INT"     , 1));
    ParameterArray.Add(New Structure("NVARCHAR", "Vitaly"));
    ParameterArray.Add(New Structure("NVARCHAR", "Alpaca"));
    ParameterArray.Add(New Structure("DATE"    , CurrentDate));
    ParameterArray.Add(New Structure("BIT"     , True));
    ParameterArray.Add(New Structure("DECIMAL" , 10.30));
    ParameterArray.Add(New Structure("DATETIME", CurrentDate));
    ParameterArray.Add(New Structure("SMALLINT", 20));
    ParameterArray.Add(New Structure("UUID"    , New UUID));
    ParameterArray.Add(New Structure("BYTES"   , Image));

    Result = OPI_MSSQL.ExecuteSQLQuery(QueryText, ParameterArray, , Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT FirstName, LastName, BirthDate, IsEmployed, Salary, CreatedAt, Age, RowGuid, Data FROM test_table;";

    Result = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "ExecuteSQLQuery", , Image); // SKIP

    QueryText = "create table test_data (id INT,first_name NVARCHAR(50),last_name NVARCHAR(50),email NVARCHAR(50),gender NVARCHAR(50),ip_address NVARCHAR(20));"; // SKIP
    Result    = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection); // SKIP
    OPI_TestDataRetrieval.Process(Result, "MSSQL", "ExecuteSQLQuery", "Test data"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL2"]; // Binary Data, URL or path to file

    Result = OPI_MSSQL.ExecuteSQLQuery(SQLFile, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_MSSQL.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Closing, "MSSQL", "ExecuteSQLQuery", "Request"); // SKIP

EndProcedure

Procedure MSSQL_GetTLSSettings(FunctionParameters)

    Result = OPI_MSSQL.GetTLSSettings(True);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GetTLSSettings");

EndProcedure

Procedure MSSQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);

    Base = "testbase1";

    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.CreateDatabase(Base, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CreateDatabase");

    Base = "testbase2";
    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "MSSQL", "CreateDatabase", "Openning");

    Result = OPI_MSSQL.CreateDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CreateDatabase", "Creation");

    Result = OPI_MSSQL.CreateDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CreateDatabase", "Existing");

    OPI_MSSQL.CloseConnection(Connection);

EndProcedure

Procedure MSSQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("tinyint_field"  , "tinyint");
    ColoumnsStruct.Insert("smallint_field" , "smallint");
    ColoumnsStruct.Insert("int_field"      , "int");
    ColoumnsStruct.Insert("bigint_field"   , "bigint");
    ColoumnsStruct.Insert("float24_field"  , "float(24)");
    ColoumnsStruct.Insert("float53_field"  , "float(53)");
    ColoumnsStruct.Insert("bit_field"      , "bit");
    ColoumnsStruct.Insert("nvarchar_field" , "nvarchar(4000)");
    ColoumnsStruct.Insert("varbinary_field", "varbinary(max)");
    ColoumnsStruct.Insert("uid_field"      , "uniqueidentifier");
    ColoumnsStruct.Insert("numeric_field"  , "numeric(5,3)"); // Or decimal
    ColoumnsStruct.Insert("xml_field"      , "xml");
    ColoumnsStruct.Insert("date_field"     , "date");
    ColoumnsStruct.Insert("time_field"     , "time");
    ColoumnsStruct.Insert("dto_field"      , "datetimeoffset");
    ColoumnsStruct.Insert("datetime_field" , "datetime");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CreateTable");

    Table = "ABC DEF";

    Result = OPI_MSSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Result = OPI_MSSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "CreateTable", "Type error");

EndProcedure

Procedure MSSQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    XML = "<?xml version=""1.0""?><root>
        |    <element>
        |        <name>Example</name>
        |        <value>123</value>
        |    </element>
        |    <element>
        |        <name>Test</name>
        |        <value>456</value>
        |    </element>
        |</root>";

    CurrentDate   = OPI_Tools.GetCurrentDate();
    CurrentDateTZ = OPI_Tools.DateRFC3339(CurrentDate, "+05:00");

    RecordStructure = New Structure;
    RecordStructure.Insert("tinyint_field"  , New Structure("TINYINT"       , 5));
    RecordStructure.Insert("smallint_field" , New Structure("SMALLINT"      , 2000));
    RecordStructure.Insert("int_field"      , New Structure("INT"           , 200000));
    RecordStructure.Insert("bigint_field"   , New Structure("BIGINT"        , 20000000000));
    RecordStructure.Insert("float24_field"  , New Structure("FLOAT24"       , 10.1234567));
    RecordStructure.Insert("float53_field"  , New Structure("FLOAT53"       , 10.123456789123456));
    RecordStructure.Insert("bit_field"      , New Structure("BIT"           , True));
    RecordStructure.Insert("nvarchar_field" , New Structure("NVARCHAR"      , "Some text"));
    RecordStructure.Insert("varbinary_field", New Structure("BYTES"         , Image));
    RecordStructure.Insert("uid_field"      , New Structure("UUID"          , New UUID));
    RecordStructure.Insert("numeric_field"  , New Structure("NUMERIC"       , 5.333));
    RecordStructure.Insert("xml_field"      , New Structure("XML"           , XML));
    RecordStructure.Insert("date_field"     , New Structure("DATE"          , CurrentDate));
    RecordStructure.Insert("time_field"     , New Structure("TIME"          , CurrentDate));
    RecordStructure.Insert("dto_field"      , New Structure("DATETIMEOFFSET", CurrentDateTZ));
    RecordStructure.Insert("datetime_field" , New Structure("DATETIME"      , CurrentDate));

    RecordsArray.Add(RecordStructure);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.AddRecords(Table, RecordsArray, True, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "AddRecords");

EndProcedure

Procedure MSSQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, "test_data", Login, Password);

    Table = "test_data";

    Fields = New Array;
    Fields.Add("first_name");
    Fields.Add("last_name");
    Fields.Add("email");

    Filters = New Array;

    FilterStructure1 = New Structure;

    FilterStructure1.Insert("field", "gender");
    FilterStructure1.Insert("type" , "=");
    FilterStructure1.Insert("value", "Male");
    FilterStructure1.Insert("union", "AND");
    FilterStructure1.Insert("raw"  , False);

    FilterStructure2 = New Structure;

    FilterStructure2.Insert("field", "id");
    FilterStructure2.Insert("type" , "BETWEEN");
    FilterStructure2.Insert("value", "20 AND 50");
    FilterStructure2.Insert("raw"  , True);

    Filters.Add(FilterStructure1);
    Filters.Add(FilterStructure2);

    Sort  = New Structure("ip_address", "DESC");
    Count = 5;

    Result = OPI_MSSQL.GetRecords(Table, Fields, Filters, Sort, Count, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GetRecords", "Filters");

EndProcedure

Procedure MSSQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "test_data";

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ip_address", New Structure("VARCHAR", "127.0.0.1"));

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("NVARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Count = OPI_MSSQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP
    OPI_TestDataRetrieval.Process(Count, "MSSQL", "UpdateRecords", "Count"); // SKIP
    Count = Count["data"].Count(); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.UpdateRecords(Table, FieldsStructure, FilterStructure, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "UpdateRecords");

    Check = OPI_MSSQL.GetRecords(Table, "['ip_address']", Filters, , , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Check, "MSSQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure MSSQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "test_data";

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("NVARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);
    FilterStructure.Insert("union", "AND");

    Filters.Add(FilterStructure);

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "ip_address");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("NVARCHAR", "127.0.0.1"));
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Obtaining = OPI_MSSQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteRecords(Table, Filters, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Obtaining, "MSSQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteRecords");

    Result = OPI_MSSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteRecords", "Check", Residue);

EndProcedure

Procedure MSSQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteTable(Table, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);
    Result           = OPI_MSSQL.DeleteTable(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteTable", "Test");

EndProcedure

Procedure MSSQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, , Login, Password);

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "MSSQL", "DeleteDatabase", "Openning");

    Result = OPI_MSSQL.DeleteDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteDatabase", "Deletion");

    Result = OPI_MSSQL.DeleteDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteDatabase", "Error");

    Closing = OPI_MSSQL.CloseConnection(Connection);

    OPI_TestDataRetrieval.Process(Closing, "MSSQL", "DeleteDatabase", "Closing");

    Result = OPI_MSSQL.DeleteDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure MSSQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.ClearTable(Table, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "ClearTable");

    Result = OPI_MSSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "ClearTable", "Check");

EndProcedure

Procedure MSSQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GetTableInformation");

    Table = "heyho";

    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GetTableInformation", "Error");

EndProcedure

Procedure MSSQL_AddTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base     = "testbase1";
    Table    = "testtable";
    Name     = "new_field";
    DataType = "bigint";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.AddTableColumn(Table, Name, DataType, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "AddTableColumn");

    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "AddTableColumn", "Check");

EndProcedure

Procedure MSSQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";
    Name  = "new_field";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.DeleteTableColumn(Table, Name, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteTableColumn");

    Result = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure MSSQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "smallint");
    ColoumnsStruct.Insert("double_field"   , "real");
    ColoumnsStruct.Insert("bigint_field"   , "bigint");
    ColoumnsStruct.Insert("custom_field"   , "nvarchar");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_MSSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "EnsureTable");

    Check = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Result = OPI_MSSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "EnsureTable", "New");

    Check = OPI_MSSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

Procedure MSSQL_EnsureRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLSSettings      = OPI_MSSQL.GetTLSSettings(True);
    ConnectionString = OPI_MSSQL.GenerateConnectionString(Address, Base, Login, Password);

    Table = "test_guarantee";

    ColoumnsStruct = New Structure; // SKIP
    ColoumnsStruct.Insert("id"    , "INT PRIMARY KEY"); // SKIP
    ColoumnsStruct.Insert("name"  , "NVARCHAR(255)"); // SKIP
    ColoumnsStruct.Insert("age"   , "INT"); // SKIP
    ColoumnsStruct.Insert("salary", "DECIMAL(10,2)"); // SKIP
    OPI_MSSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings); // SKIP

    DataArray = New Array;

    RowStructure2 = New Structure;
    RowStructure2.Insert("id"    , New Structure("INT"     , 1));
    RowStructure2.Insert("name"  , New Structure("NVARCHAR", "Vitaly"));
    RowStructure2.Insert("age"   , New Structure("INT"     , 25));
    RowStructure2.Insert("salary", New Structure("DECIMAL" , 1000.12));

    RowStructure1 = New Structure;
    RowStructure1.Insert("id"    , New Structure("INT"     , 2));
    RowStructure1.Insert("name"  , New Structure("NVARCHAR", "Lesha"));
    RowStructure1.Insert("age"   , New Structure("INT"     , 20));
    RowStructure1.Insert("salary", New Structure("DECIMAL" , 200.20));

    DataArray.Add(RowStructure2);
    DataArray.Add(RowStructure1);

    KeyFields = New Array;
    KeyFields.Add("id");

    Result = OPI_MSSQL.EnsureRecords(Table, DataArray, KeyFields, , ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "EnsureRecords", "Insertion");

    Check = OPI_MSSQL.GetRecords(Table, "*", , , , ConnectionString, TLSSettings);
    OPI_TestDataRetrieval.Process(Check, "MSSQL", "EnsureRecords", "Insertion check");

    RowStructure2.Insert("name"  , New Structure("NVARCHAR", "Vitaly Updated"));
    RowStructure2.Insert("salary", New Structure("DECIMAL" , 1500.50));

    StringStructure3 = New Structure;
    StringStructure3.Insert("id"    , New Structure("INT"     , 3));
    StringStructure3.Insert("name"  , New Structure("NVARCHAR", "Anton"));
    StringStructure3.Insert("age"   , New Structure("INT"     , 30));
    StringStructure3.Insert("salary", New Structure("DECIMAL" , 3000.00));

    DataArray = New Array;
    DataArray.Add(RowStructure2);
    DataArray.Add(StringStructure3);

    Result = OPI_MSSQL.EnsureRecords(Table, DataArray, KeyFields, , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "EnsureRecords", "Updating");

    Check = OPI_MSSQL.GetRecords(Table, "*", , , , ConnectionString, TLSSettings);
    OPI_TestDataRetrieval.Process(Check, "MSSQL", "EnsureRecords", "Updating check");

    OPI_MSSQL.DeleteTable(Table, ConnectionString, TLSSettings);

EndProcedure

Procedure MSSQL_GetRecordsFilterStructure(FunctionParameters)

    Result = OPI_MSSQL.GetRecordsFilterStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GetRecordsFilterStructure");

    Result = OPI_MSSQL.GetRecordsFilterStructure(True);

    OPI_TestDataRetrieval.Process(Result, "MSSQL", "GetRecordsFilterStructure", "Clear");

EndProcedure

#EndRegion // MSSQL

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure MSS_ОсновныеМетоды() Export
    MSS_CommonMethods();
EndProcedure

#EndRegion