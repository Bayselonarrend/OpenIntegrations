// OneScript: ./OInt/tests/Modules/OPItc_MySQL.os

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

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use asserts
//#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("MySQL");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("MySQL");

EndFunction

#Region Internal

#Region RunnableTests

#Region MySQL

Procedure MYS_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetMySQLParameterOptions();

    For Each TestParameters In OptionArray Do

        MySQL_GenerateConnectionString(TestParameters);
        MySQL_CreateConnection(TestParameters);
        MySQL_CloseConnection(TestParameters);
        MySQL_IsConnector(TestParameters);
        MySQL_ExecuteSQLQuery(TestParameters);
        MySQL_GetTLSSettings(TestParameters);

    EndDo;

EndProcedure

Procedure MYS_ORM() Export

    OptionArray = OPI_TestDataRetrieval.GetMySQLParameterOptions();

    For Each TestParameters In OptionArray Do

        MySQL_CreateDatabase(TestParameters);
        MySQL_CreateTable(TestParameters);
        MySQL_AddRecords(TestParameters);
        MySQL_EnsureRecords(TestParameters);
        MySQL_GetRecords(TestParameters);
        MySQL_UpdateRecords(TestParameters);
        MySQL_DeleteRecords(TestParameters);
        MySQL_ClearTable(TestParameters);
        MySQL_GetTableInformation(TestParameters);
        MySQL_AddTableColumn(TestParameters);
        MySQL_DeleteTableColumn(TestParameters);
        MySQL_EnsureTable(TestParameters);
        MySQL_DeleteTable(TestParameters);
        MySQL_DeleteDatabase(TestParameters);
        MySQL_GetRecordsFilterStructure(TestParameters);

    EndDo;

EndProcedure

#EndRegion // MySQL

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region MySQL

Procedure MySQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GenerateConnectionString");

EndProcedure

Procedure MySQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Result = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    OPI_MySQL.CloseConnection(Result);
    OPI_TestDataRetrieval.Process(Result, "MySQL", "CreateConnection");

EndProcedure

Procedure MySQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MySQL.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "CloseConnection");

EndProcedure

Procedure MySQL_IsConnector(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MySQL.IsConnector(Connection);

    OPI_MySQL.CloseConnection(Result);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "IsConnector");

EndProcedure

Procedure MySQL_ExecuteSQLQuery(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_MySQL.DeleteTable("users"     , Connection); // SKIP
    OPI_MySQL.DeleteTable("test_data" , Connection); // SKIP
    OPI_MySQL.DeleteTable("test_table", Connection); // SKIP

    OPI_TestDataRetrieval.Process(Connection, "MySQL", "ExecuteSQLQuery", "Connection"); // SKIP

    // CREATE

    QueryText = "
                   |CREATE TABLE test_table (
                   |id INT AUTO_INCREMENT PRIMARY KEY,
                   |name VARCHAR(255),
                   |age INT,
                   |salary DOUBLE,
                   |amount FLOAT,
                   |type TINYINT UNSIGNED,
                   |date DATE,
                   |time TIME,
                   |data MEDIUMBLOB
                   |);";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "ExecuteSQLQuery", "Create"); // SKIP

    // INSERT with parameters

    QueryText = "
                   |INSERT INTO test_table (name, age, salary, amount, type, date, time, data)
                   |VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

    ParameterArray = New Array;
    ParameterArray.Add(New Structure("TEXT"  , "Vitaly"));
    ParameterArray.Add(New Structure("INT"   , 25));
    ParameterArray.Add(New Structure("DOUBLE", 1000.12));
    ParameterArray.Add(New Structure("FLOAT" , 1000.12));
    ParameterArray.Add(New Structure("UINT"  , 1));
    ParameterArray.Add(New Structure("DATE"  , OPI_Tools.GetCurrentDate()));
    ParameterArray.Add(New Structure("TIME"  , OPI_Tools.GetCurrentDate()));
    ParameterArray.Add(New Structure("BYTES" , Image));

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("params", ParameterArray);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT name, age, salary, amount, type, date, time, data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "ExecuteSQLQuery", , Image); // SKIP

    Result = OPI_MySQL.ExecuteSQLQuery("create table test_data (id INT,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(50),gender VARCHAR(50),ip_address VARCHAR(20));", , , Connection); // SKIP
    OPI_TestDataRetrieval.Process(Result, "MySQL", "ExecuteSQLQuery", "Test data"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL2"]; // Binary Data, URL or path to file

    Options = New Structure;
    Options.Insert("sql", SQLFile);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_MySQL.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Closing, "MySQL", "ExecuteSQLQuery", "Closing"); // SKIP

EndProcedure

Procedure MySQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    OPI_MySQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateDatabase", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "CreateDatabase");

    Base = "testbase2";
    OPI_MySQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "MySQL", "CreateDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateDatabase", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "CreateDatabase", "Creation");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateDatabase", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "CreateDatabase", "Existing");

    OPI_MySQL.CloseConnection(Connection);

EndProcedure

Procedure MySQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("char_field"      , "CHAR(5)");
    ColoumnsStruct.Insert("varchar_field"   , "VARCHAR(255)");
    ColoumnsStruct.Insert("tinytext_field"  , "TINYTEXT");
    ColoumnsStruct.Insert("text_field"      , "TEXT");
    ColoumnsStruct.Insert("mediumtext_field", "MEDIUMTEXT");
    ColoumnsStruct.Insert("longtext_field"  , "LONGTEXT");
    ColoumnsStruct.Insert("tinyint_field"   , "TINYINT");
    ColoumnsStruct.Insert("smallint_field"  , "SMALLINT");
    ColoumnsStruct.Insert("mediumint_field" , "MEDIUMINT");
    ColoumnsStruct.Insert("int_field"       , "INT");
    ColoumnsStruct.Insert("uint_field"      , "INT UNSIGNED");
    ColoumnsStruct.Insert("bigint_field"    , "BIGINT");
    ColoumnsStruct.Insert("float_field"     , "FLOAT");
    ColoumnsStruct.Insert("double_field"    , "DOUBLE");
    ColoumnsStruct.Insert("date_field"      , "DATE");
    ColoumnsStruct.Insert("time_field"      , "TIME");
    ColoumnsStruct.Insert("datetime_field"  , "DATETIME");
    ColoumnsStruct.Insert("timestamp_field" , "TIMESTAMP");
    ColoumnsStruct.Insert("mediumblob_field", "MEDIUMBLOB");
    ColoumnsStruct.Insert("set_field"       , "SET('one','two','three')");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateTable", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "CreateTable");

    Table = "ABC DEF";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateTable", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateTable", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "CreateTable", "Type error");

EndProcedure

Procedure MySQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    CurrentDate = OPI_Tools.GetCurrentDate();

    RecordStructure = New Structure;
    RecordStructure.Insert("char_field"      , New Structure("TEXT"  , "AAAAA"));
    RecordStructure.Insert("varchar_field"   , New Structure("TEXT"  , "Some varchar"));
    RecordStructure.Insert("tinytext_field"  , New Structure("TEXT"  , "Some tiny text"));
    RecordStructure.Insert("text_field"      , New Structure("TEXT"  , "Some text"));
    RecordStructure.Insert("mediumtext_field", New Structure("TEXT"  , "Some medium text"));
    RecordStructure.Insert("longtext_field"  , New Structure("TEXT"  , "Some looooooong text"));
    RecordStructure.Insert("tinyint_field"   , New Structure("INT"   , 127));
    RecordStructure.Insert("smallint_field"  , New Structure("INT"   , -32767));
    RecordStructure.Insert("mediumint_field" , New Structure("INT"   , 8388607));
    RecordStructure.Insert("int_field"       , New Structure("INT"   , -2147483647));
    RecordStructure.Insert("uint_field"      , New Structure("UINT"  , 4294967295));
    RecordStructure.Insert("bigint_field"    , New Structure("INT"   , 9223372036854775807));
    RecordStructure.Insert("float_field"     , New Structure("FLOAT" , 100.50));
    RecordStructure.Insert("double_field"    , New Structure("FLOAT" , 100.512123));
    RecordStructure.Insert("date_field"      , New Structure("DATE"  , CurrentDate));
    RecordStructure.Insert("time_field"      , New Structure("TIME"  , CurrentDate));
    RecordStructure.Insert("datetime_field"  , New Structure("DATE"  , CurrentDate));
    RecordStructure.Insert("timestamp_field" , New Structure("DATE"  , CurrentDate));
    RecordStructure.Insert("mediumblob_field", New Structure("BYTES" , Image));
    RecordStructure.Insert("set_field"       , New Structure("TEXT"  , "one"));

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "AddRecords", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "AddRecords");

EndProcedure

Procedure MySQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", "test_data");
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GetRecords", "Filters");

EndProcedure

Procedure MySQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "test_data";

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ip_address", New Structure("VARCHAR", "127.0.0.1"));

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("VARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Count = OPI_MySQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP
    OPI_TestDataRetrieval.Process(Count, "MySQL", "UpdateRecords", "Count"); // SKIP
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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "UpdateRecords", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "UpdateRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['ip_address']");
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    OPI_TestDataRetrieval.Process(Check, "MySQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure MySQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "test_data";

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("VARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);
    FilterStructure.Insert("union", "AND");

    Filters.Add(FilterStructure);

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "ip_address");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("VARCHAR", "127.0.0.1"));
    FilterStructure.Insert("raw"  , False);

    Obtaining = OPI_MySQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteRecords", Options);

    // END

    OPI_TestDataRetrieval.Process(Obtaining, "MySQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteRecords", "Check", Residue);

EndProcedure

Procedure MySQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteTable", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteTable", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteTable", "Test");

EndProcedure

Procedure MySQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "MySQL", "DeleteDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteDatabase", "Deletion");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteDatabase", "Error");

    Closing = OPI_MySQL.CloseConnection(Connection);

    OPI_TestDataRetrieval.Process(Closing, "MySQL", "DeleteDatabase", "Closing");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure MySQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ClearTable", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "ClearTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "ClearTable", "Check");

EndProcedure

Procedure MySQL_EnsureRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "test_merge";

    ColoumnsStruct = New Structure; // SKIP
    ColoumnsStruct.Insert("id"    , "INT PRIMARY KEY"); // SKIP
    ColoumnsStruct.Insert("name"  , "TEXT"); // SKIP
    ColoumnsStruct.Insert("age"   , "INT"); // SKIP
    ColoumnsStruct.Insert("salary", "DOUBLE"); // SKIP
    OPI_MySQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings); // SKIP

    DataArray = New Array;

    RowStructure2 = New Structure;
    RowStructure2.Insert("id"    , New Structure("INT"   , 1));
    RowStructure2.Insert("name"  , New Structure("TEXT"  , "Vitaly"));
    RowStructure2.Insert("age"   , New Structure("INT"   , 25));
    RowStructure2.Insert("salary", New Structure("DOUBLE", 1000.12));

    RowStructure1 = New Structure;
    RowStructure1.Insert("id"    , New Structure("INT"   , 2));
    RowStructure1.Insert("name"  , New Structure("TEXT"  , "Lesha"));
    RowStructure1.Insert("age"   , New Structure("INT"   , 20));
    RowStructure1.Insert("salary", New Structure("DOUBLE", 200.20));

    DataArray.Add(RowStructure2);
    DataArray.Add(RowStructure1);

    KeyFields = New Array;
    KeyFields.Add("id");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("db", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "EnsureRecords", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "EnsureRecords", "Insertion");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "*");
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);
    OPI_TestDataRetrieval.Process(Check, "MySQL", "EnsureRecords", "Insertion check");

    RowStructure2.Insert("name"  , New Structure("TEXT"  , "Vitaly Updated"));
    RowStructure2.Insert("salary", New Structure("DOUBLE", 1500.50));

    StringStructure3 = New Structure;
    StringStructure3.Insert("id"    , New Structure("INT"   , 3));
    StringStructure3.Insert("name"  , New Structure("TEXT"  , "Anton"));
    StringStructure3.Insert("age"   , New Structure("INT"   , 30));
    StringStructure3.Insert("salary", New Structure("DOUBLE", 3000.00));

    DataArray = New Array;
    DataArray.Add(RowStructure2);
    DataArray.Add(StringStructure3);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("db", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "EnsureRecords", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "EnsureRecords", "Updating");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "*");
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);
    OPI_TestDataRetrieval.Process(Check, "MySQL", "EnsureRecords", "Updating check");

    OPI_MySQL.DeleteTable(Table, ConnectionString, TLSSettings);

EndProcedure

Procedure MySQL_GetRecordsFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecordsFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GetRecordsFilterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecordsFilterStructure", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GetRecordsFilterStructure", "Clear");

EndProcedure

Procedure MySQL_GetTLSSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GetTLSSettings");

EndProcedure

Procedure MySQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GetTableInformation");

    Table = "heyho";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "GetTableInformation", "Error");

EndProcedure

Procedure MySQL_AddTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table    = "testtable";
    Name     = "new_field";
    DataType = "MEDIUMTEXT";

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

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "AddTableColumn", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "AddTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "AddTableColumn", "Check");

EndProcedure

Procedure MySQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";
    Name  = "new_field";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteTableColumn", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure MySQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "SMALLINT");
    ColoumnsStruct.Insert("double_field"   , "DOUBLE");
    ColoumnsStruct.Insert("bigint_field"   , "BIGINT");
    ColoumnsStruct.Insert("custom_field"   , "TEXT");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "EnsureTable", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "MySQL", "EnsureTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.Process(Check, "MySQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "EnsureTable", Options);

    OPI_TestDataRetrieval.Process(Result, "MySQL", "EnsureTable", "New");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    OPI_TestDataRetrieval.Process(Check, "MySQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

#EndRegion // MySQL

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure MYS_ОсновныеМетоды() Export
    MYS_CommonMethods();
EndProcedure

#EndRegion
