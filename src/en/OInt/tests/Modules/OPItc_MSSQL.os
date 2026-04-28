// OneScript: ./OInt/tests/Modules/OPItc_MSSQL.os

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

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("MSSQL");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("MSSQL");

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

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GenerateConnectionString");

EndProcedure

Procedure MSSQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    Result = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CreateConnection");

EndProcedure

Procedure MSSQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MSSQL.CloseConnection(Connection);

    // END

    OPI_MSSQL.CloseConnection(Result);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CloseConnection");

EndProcedure

Procedure MSSQL_IsConnector(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MSSQL.IsConnector(Connection);

    // END

    OPI_MSSQL.CloseConnection(Result);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "IsConnector");

EndProcedure

Procedure MSSQL_ExecuteSQLQuery(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();
    Image       = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Connection       = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_MSSQL.DeleteTable("users"     , Connection); // SKIP
    OPI_MSSQL.DeleteTable("test_data" , Connection); // SKIP
    OPI_MSSQL.DeleteTable("test_table", Connection); // SKIP
    OPI_TestDataRetrieval.ProcessCLI(Connection, "MSSQL", "ExecuteSQLQuery", "Connection"); // SKIP

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

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "ExecuteSQLQuery", "Create"); // SKIP

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

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("params", ParameterArray);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT FirstName, LastName, BirthDate, IsEmployed, Salary, CreatedAt, Age, RowGuid, Data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "ExecuteSQLQuery", , Image); // SKIP

    QueryText = "create table test_data (id INT,first_name NVARCHAR(50),last_name NVARCHAR(50),email NVARCHAR(50),gender NVARCHAR(50),ip_address NVARCHAR(20));"; // SKIP
    Result    = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection); // SKIP
    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "ExecuteSQLQuery", "Test data"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL2"]; // Binary data, URL or path to file

    Options = New Structure;
    Options.Insert("sql", SQLFile);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_MSSQL.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Closing, "MSSQL", "ExecuteSQLQuery", "Request"); // SKIP

EndProcedure

Procedure MSSQL_GetTLSSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GetTLSSettings");

EndProcedure

Procedure MSSQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Base = "testbase1";

    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateDatabase", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CreateDatabase");

    Base = "testbase2";
    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.ProcessCLI(Connection, "MSSQL", "CreateDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateDatabase", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CreateDatabase", "Creation");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateDatabase", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CreateDatabase", "Existing");

    OPI_MSSQL.CloseConnection(Connection);

EndProcedure

Procedure MSSQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

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
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateTable", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CreateTable");

    Table = "ABC DEF";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateTable", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateTable", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "CreateTable", "Type error");

EndProcedure

Procedure MSSQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

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
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", RecordsArray);
    Options.Insert("trn", Истина);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "AddRecords", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "AddRecords");

EndProcedure

Procedure MSSQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", "test_data");
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

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

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", Fields);
    Options.Insert("filter", Filters);
    Options.Insert("order", Sort);
    Options.Insert("limit", Count);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GetRecords", "Filters");

EndProcedure

Procedure MSSQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

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
    OPI_TestDataRetrieval.ProcessCLI(Count, "MSSQL", "UpdateRecords", "Count"); // SKIP
    Count = Count["data"].Count(); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("values", FieldsStructure);
    Options.Insert("filter", FilterStructure);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "UpdateRecords", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "UpdateRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['ip_address']");
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    OPI_TestDataRetrieval.ProcessCLI(Check, "MSSQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure MSSQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

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
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteRecords", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Obtaining, "MSSQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteRecords", "Check", Residue);

EndProcedure

Procedure MSSQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteTable", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteTable", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteTable", "Test");

EndProcedure

Procedure MSSQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.ProcessCLI(Connection, "MSSQL", "DeleteDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteDatabase", "Deletion");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteDatabase", "Error");

    Closing = OPI_MSSQL.CloseConnection(Connection);

    OPI_TestDataRetrieval.ProcessCLI(Closing, "MSSQL", "DeleteDatabase", "Closing");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure MSSQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ClearTable", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "ClearTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "ClearTable", "Check");

EndProcedure

Procedure MSSQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GetTableInformation");

    Table = "heyho";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GetTableInformation", "Error");

EndProcedure

Procedure MSSQL_AddTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base     = "testbase1";
    Table    = "testtable";
    Name     = "new_field";
    DataType = "bigint";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("type", DataType);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "AddTableColumn", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "AddTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "AddTableColumn", "Check");

EndProcedure

Procedure MSSQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";
    Name  = "new_field";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteTableColumn", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure MSSQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "smallint");
    ColoumnsStruct.Insert("double_field"   , "real");
    ColoumnsStruct.Insert("bigint_field"   , "bigint");
    ColoumnsStruct.Insert("custom_field"   , "nvarchar");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "EnsureTable", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "EnsureTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "EnsureTable", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "EnsureTable", "New");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

Procedure MSSQL_EnsureRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

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

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("unique", KeyFields);
    Options.Insert("db", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "EnsureRecords", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "EnsureRecords", "Insertion");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "*");
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);
    OPI_TestDataRetrieval.ProcessCLI(Check, "MSSQL", "EnsureRecords", "Insertion check");

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

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("unique", KeyFields);
    Options.Insert("db", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "EnsureRecords", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "EnsureRecords", "Updating");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "*");
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);
    OPI_TestDataRetrieval.ProcessCLI(Check, "MSSQL", "EnsureRecords", "Updating check");

    OPI_MSSQL.DeleteTable(Table, ConnectionString, TLSSettings);

EndProcedure

Procedure MSSQL_GetRecordsFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecordsFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GetRecordsFilterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecordsFilterStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "MSSQL", "GetRecordsFilterStructure", "Clear");

EndProcedure

#EndRegion // MSSQL

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure MSS_ОсновныеМетоды() Export
    MSS_CommonMethods();
EndProcedure

#EndRegion
