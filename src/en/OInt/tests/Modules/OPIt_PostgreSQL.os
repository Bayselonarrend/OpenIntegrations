// OneScript: ./OInt/tests/Modules/OPIt_PostgreSQL.os

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

    OPI_TestDataRetrieval.FormYAXTests("PostgreSQL");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("PostgreSQL");

EndFunction

#Region Internal

#Region RunnableTests

#Region PostgreSQL

Procedure Postgres_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetPostgresParameterOptions();

    For Each TestParameters In OptionArray Do

        PostgreSQL_GenerateConnectionString(TestParameters);
        PostgreSQL_CreateConnection(TestParameters);
        PostgreSQL_CloseConnection(TestParameters);
        PostgreSQL_IsConnector(TestParameters);
        PostgreSQL_ExecuteSQLQuery(TestParameters);
        PostgreSQL_GetTLSSettings(TestParameters);

    EndDo;

EndProcedure

Procedure Postgres_ORM() Export

    OptionArray = OPI_TestDataRetrieval.GetPostgresParameterOptions();

    For Each TestParameters In OptionArray Do

        PostgreSQL_CreateDatabase(TestParameters);
        PostgreSQL_CreateTable(TestParameters);
        PostgreSQL_AddRecords(TestParameters);
        PostgreSQL_EnsureRecords(TestParameters);
        PostgreSQL_GetRecords(TestParameters);
        PostgreSQL_UpdateRecords(TestParameters);
        PostgreSQL_DeleteRecords(TestParameters);
        PostgreSQL_ClearTable(TestParameters);
        PostgreSQL_GetTableInformation(TestParameters);
        PostgreSQL_AddTableColumn(TestParameters);
        PostgreSQL_DeleteTableColumn(TestParameters);
        PostgreSQL_EnsureTable(TestParameters);
        PostgreSQL_DeleteTable(TestParameters);
        PostgreSQL_DisableAllDatabaseConnections(TestParameters);
        PostgreSQL_DeleteDatabase(TestParameters);
        PostgreSQL_GetRecordsFilterStructure(TestParameters);

    EndDo;

EndProcedure

#EndRegion // PostgreSQL

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region PostgreSQL

Procedure PostgreSQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    Result = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GenerateConnectionString");

EndProcedure

Procedure PostgreSQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Result = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    OPI_PostgreSQL.CloseConnection(Result);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CreateConnection");

EndProcedure

Procedure PostgreSQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_PostgreSQL.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CloseConnection");

EndProcedure

Procedure PostgreSQL_IsConnector(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_PostgreSQL.IsConnector(Connection);

    OPI_PostgreSQL.CloseConnection(Result);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "IsConnector");

EndProcedure

Procedure PostgreSQL_ExecuteSQLQuery(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_PostgreSQL.DeleteTable("users"     , Connection); // SKIP
    OPI_PostgreSQL.DeleteTable("test_data" , Connection); // SKIP
    OPI_PostgreSQL.DeleteTable("test_table", Connection); // SKIP

    OPI_TestDataRetrieval.Process(Connection, "PostgreSQL", "ExecuteSQLQuery", "Connection"); // SKIP

    // CREATE

    QueryText = "
                   |CREATE TABLE test_table (
                   |id SERIAL PRIMARY KEY,
                   |name NAME,
                   |age INT,
                   |salary REAL,
                   |is_active BOOL,
                   |created_at DATE,
                   |data BYTEA
                   |);";

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Create"); // SKIP

    // INSERT with parameters

    QueryText = "
                   |INSERT INTO test_table (name, age, salary, is_active, created_at, data)
                   |VALUES ($1, $2, $3, $4, $5, $6);";

    ParameterArray = New Array;
    ParameterArray.Add(New Structure("NAME" , "Vitaly"));
    ParameterArray.Add(New Structure("INT"  , 25));
    ParameterArray.Add(New Structure("REAL" , 1000.12));
    ParameterArray.Add(New Structure("BOOL" , True));
    ParameterArray.Add(New Structure("DATE" , OPI_Tools.GetCurrentDate()));
    ParameterArray.Add(New Structure("BYTEA", Image));

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, ParameterArray, , Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ExecuteSQLQuery", , Image); // SKIP

    // DO + Transaction

    QueryText = "DO $$
                   |BEGIN
                   |    CREATE TABLE users (
                   |        id SMALLSERIAL,
                   |        name TEXT NOT NULL,
                   |        age INT NOT NULL
                   |    );
                   |    INSERT INTO users (name, age) VALUES ('Alice', 30);
                   |    INSERT INTO users (name, age) VALUES ('Bob', 25);
                   |    INSERT INTO users (name, age) VALUES ('Charlie', 35);
                   |END $$ LANGUAGE plpgsql;";

    Result = OPI_PostgreSQL.ExecuteSQLQuery(QueryText, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Transaction"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL"]; // Binary data, URL or path to file

    Result = OPI_PostgreSQL.ExecuteSQLQuery(SQLFile, , , Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_PostgreSQL.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Closing");

EndProcedure

Procedure PostgreSQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    Deletion = OPI_PostgreSQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP
    OPI_TestDataRetrieval.LogServiceInformation(Deletion, "CreateDatabase (deleting)", "PostgreSQL"); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.CreateDatabase(Base, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CreateDatabase");

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "PostgreSQL", "CreateDatabase", "Openning");

    Result = OPI_PostgreSQL.CreateDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CreateDatabase", "Existing");

    Base = "testbase2";

    OPI_PostgreSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);
    Result = OPI_PostgreSQL.CreateDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CreateDatabase", "New");

    OPI_PostgreSQL.CloseConnection(Connection);

EndProcedure

Procedure PostgreSQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("bool_field"       , "BOOL");
    ColoumnsStruct.Insert("oldchar_field"    , """char""");
    ColoumnsStruct.Insert("smallint_field"   , "SMALLINT");
    ColoumnsStruct.Insert("smallserial_field", "SMALLSERIAL");
    ColoumnsStruct.Insert("int_field"        , "INT");
    ColoumnsStruct.Insert("serial_field"     , "SERIAL");
    ColoumnsStruct.Insert("oid_field"        , "OID");
    ColoumnsStruct.Insert("bigint_field"     , "BIGINT");
    ColoumnsStruct.Insert("bigserial_field"  , "BIGSERIAL");
    ColoumnsStruct.Insert("real_field"       , "REAL");
    ColoumnsStruct.Insert("dp_field"         , "DOUBLE PRECISION");
    ColoumnsStruct.Insert("text_field"       , "TEXT");
    ColoumnsStruct.Insert("varchar_field"    , "VARCHAR");
    ColoumnsStruct.Insert("charn_field"      , "CHAR(3)");
    ColoumnsStruct.Insert("char_field"       , "CHAR");
    ColoumnsStruct.Insert("name_field"       , "NAME");
    ColoumnsStruct.Insert("bytea_field"      , "BYTEA");
    ColoumnsStruct.Insert("ts_field"         , "TIMESTAMP");
    ColoumnsStruct.Insert("tswtz_field"      , "TIMESTAMP WITH TIME ZONE");
    ColoumnsStruct.Insert("ip_field"         , "INET");
    ColoumnsStruct.Insert("json_field"       , "JSON");
    ColoumnsStruct.Insert("jsonb_field"      , "JSONB");
    ColoumnsStruct.Insert("date_field"       , "DATE");
    ColoumnsStruct.Insert("time_field"       , "TIME");
    ColoumnsStruct.Insert("uuid_field"       , "UUID");
    ColoumnsStruct.Insert("numeric_field"    , "NUMERIC(15, 2)");

    OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CreateTable");

    Table = "ABC DEF";

    Result = OPI_PostgreSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Result = OPI_PostgreSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "CreateTable", "Type error");

EndProcedure

Procedure PostgreSQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GetTableInformation");

    Table = "heyho";

    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GetTableInformation", "Error");

EndProcedure

Procedure PostgreSQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    CasualStructure = New Structure("key,value", "ItsKey", 10);

    CurrentDate   = OPI_Tools.GetCurrentDate();
    CurrentDateTZ = OPI_Tools.DateRFC3339(CurrentDate, "+05:00");

    RecordStructure = New Structure;
    RecordStructure.Insert("bool_field"       , New Structure("BOOL"                    , True));
    RecordStructure.Insert("oldchar_field"    , New Structure("OLDCHAR"                 , 1)); // or "char"
    RecordStructure.Insert("smallint_field"   , New Structure("SMALLINT"                , 5));
    RecordStructure.Insert("smallserial_field", New Structure("SMALLSERIAL"             , 6));
    RecordStructure.Insert("int_field"        , New Structure("INT"                     , 100));
    RecordStructure.Insert("serial_field"     , New Structure("SERIAL"                  , 100));
    RecordStructure.Insert("oid_field"        , New Structure("OID"                     , 24576));
    RecordStructure.Insert("bigint_field"     , New Structure("BIGINT"                  , 9999999));
    RecordStructure.Insert("bigserial_field"  , New Structure("BIGSERIAL"               , 9999999));
    RecordStructure.Insert("real_field"       , New Structure("REAL"                    , 15.2));
    RecordStructure.Insert("dp_field"         , New Structure("DOUBLE_PRECISION"        , 1.0002)); // or DOUBLE PRECISION
    RecordStructure.Insert("text_field"       , New Structure("TEXT"                    , "Some text"));
    RecordStructure.Insert("varchar_field"    , New Structure("VARCHAR"                 , "Some varchar"));
    RecordStructure.Insert("charn_field"      , New Structure("CHAR"                    , "AAA"));
    RecordStructure.Insert("char_field"       , New Structure("CHAR"                    , "A"));
    RecordStructure.Insert("name_field"       , New Structure("NAME"                    , "Vitaly"));
    RecordStructure.Insert("bytea_field"      , New Structure("BYTEA"                   , Image));
    RecordStructure.Insert("ts_field"         , New Structure("TIMESTAMP"               , CurrentDate));
    RecordStructure.Insert("tswtz_field"      , New Structure("TIMESTAMP_WITH_TIME_ZONE", CurrentDateTZ)); // or TIMESTAMP WITH TIME ZONE
    RecordStructure.Insert("ip_field"         , New Structure("INET"                    , "127.0.0.1"));
    RecordStructure.Insert("json_field"       , New Structure("JSON"                    , CasualStructure));
    RecordStructure.Insert("jsonb_field"      , New Structure("JSONB"                   , CasualStructure));
    RecordStructure.Insert("date_field"       , New Structure("DATE"                    , CurrentDate));
    RecordStructure.Insert("time_field"       , New Structure("TIME"                    , CurrentDate));
    RecordStructure.Insert("uuid_field"       , New Structure("UUID"                    , New UUID));
    RecordStructure.Insert("numeric_field"    , New Structure("NUMERIC"                 , "15.2"));

    RecordsArray.Add(RecordStructure);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.AddRecords(Table, RecordsArray, True, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "AddRecords");

EndProcedure

Procedure PostgreSQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, "test_data", Login, Password, Port);

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

    Result = OPI_PostgreSQL.GetRecords(Table
        , Fields
        , Filters
        , Sort
        , Count
        , ConnectionString
        , TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GetRecords", "Filters");

EndProcedure

Procedure PostgreSQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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

    Count = OPI_PostgreSQl.GetRecords(Table, , Filters, , , ConnectionString); // SKIP
    OPI_TestDataRetrieval.Process(Count, "PostgreSQL", "UpdateRecords", "Count"); // SKIP
    Count = Count["data"].Count(); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQl.UpdateRecords(Table
        , FieldsStructure
        , FilterStructure
        , ConnectionString
        , TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "UpdateRecords");

    Check = OPI_PostgreSQl.GetRecords(Table, "['ip_address']", Filters, , , ConnectionString);

    OPI_TestDataRetrieval.Process(Check, "PostgreSQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure PostgreSQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
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

    Obtaining = OPI_PostgreSQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.DeleteRecords(Table, Filters, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Obtaining, "PostgreSQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteRecords");

    Result = OPI_PostgreSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteRecords", "Check", Residue);

EndProcedure

Procedure PostgreSQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);
    Result           = OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteTable", "Test");

EndProcedure

Procedure PostgreSQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Connection, "PostgreSQL", "DeleteDatabase", "Openning");

    Result = OPI_PostgreSQL.DisableAllDatabaseConnections(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteDatabase", "Shutdown");

    Result = OPI_PostgreSQL.DeleteDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteDatabase", "Deletion");

    Result = OPI_PostgreSQL.DeleteDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteDatabase", "Error");

    Closing = OPI_PostgreSQL.CloseConnection(Connection);

    OPI_TestDataRetrieval.Process(Closing, "PostgreSQL", "DeleteDatabase", "Closing");

    Result = OPI_PostgreSQL.DeleteDatabase(Base, Connection);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure PostgreSQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.ClearTable(Table, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ClearTable");

    Result = OPI_PostgreSQL.GetRecords(Table, , , , , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "ClearTable", "Check");

EndProcedure

Procedure PostgreSQL_DisableAllDatabaseConnections(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQL.DisableAllDatabaseConnections(Base, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DisableAllDatabaseConnections");

EndProcedure

Procedure PostgreSQL_EnsureRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "test_merge";

    ColoumnsStruct = New Structure; // SKIP
    ColoumnsStruct.Insert("id"    , "INT PRIMARY KEY"); // SKIP
    ColoumnsStruct.Insert("name"  , "TEXT"); // SKIP
    ColoumnsStruct.Insert("age"   , "INT"); // SKIP
    ColoumnsStruct.Insert("salary", "REAL"); // SKIP
    OPI_PostgreSQL.CreateTable(Table, ColoumnsStruct, ConnectionString, TLSSettings); // SKIP

    DataArray = New Array;

    RowStructure2 = New Structure;
    RowStructure2.Insert("id"    , New Structure("INT" , 1));
    RowStructure2.Insert("name"  , New Structure("TEXT", "Vitaly"));
    RowStructure2.Insert("age"   , New Structure("INT" , 25));
    RowStructure2.Insert("salary", New Structure("REAL", 1000.12));

    RowStructure1 = New Structure;
    RowStructure1.Insert("id"    , New Structure("INT" , 2));
    RowStructure1.Insert("name"  , New Structure("TEXT", "Lesha"));
    RowStructure1.Insert("age"   , New Structure("INT" , 20));
    RowStructure1.Insert("salary", New Structure("REAL", 200.20));

    DataArray.Add(RowStructure2);
    DataArray.Add(RowStructure1);

    KeyFields = New Array;
    KeyFields.Add("id");

    Result = OPI_PostgreSQL.EnsureRecords(Table, DataArray, KeyFields, , ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "EnsureRecords", "Insertion");

    Check = OPI_PostgreSQL.GetRecords(Table, "*", , , , ConnectionString, TLSSettings);
    OPI_TestDataRetrieval.Process(Check, "PostgreSQL", "EnsureRecords", "Insertion check");

    RowStructure2.Insert("name"  , New Structure("TEXT", "Vitaly Updated"));
    RowStructure2.Insert("salary", New Structure("REAL", 1500.50));

    StringStructure3 = New Structure;
    StringStructure3.Insert("id"    , New Structure("INT" , 3));
    StringStructure3.Insert("name"  , New Structure("TEXT", "Anton"));
    StringStructure3.Insert("age"   , New Structure("INT" , 30));
    StringStructure3.Insert("salary", New Structure("REAL", 3000.00));

    DataArray = New Array;
    DataArray.Add(RowStructure2);
    DataArray.Add(StringStructure3);

    Result = OPI_PostgreSQL.EnsureRecords(Table, DataArray, KeyFields, , ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "EnsureRecords", "Updating");

    Check = OPI_PostgreSQL.GetRecords(Table, "*", , , , ConnectionString, TLSSettings);
    OPI_TestDataRetrieval.Process(Check, "PostgreSQL", "EnsureRecords", "Updating check");

    OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings);

EndProcedure

Procedure PostgreSQL_GetRecordsFilterStructure(FunctionParameters)

    Result = OPI_PostgreSQL.GetRecordsFilterStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GetRecordsFilterStructure");

    Result = OPI_PostgreSQL.GetRecordsFilterStructure(True);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GetRecordsFilterStructure", "Clear");

EndProcedure

Procedure PostgreSQL_GetTLSSettings(FunctionParameters)

    Result = OPI_PostgreSQL.GetTLSSettings(True);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "GetTLSSettings");

EndProcedure

Procedure PostgreSQL_AddTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table    = "testtable";
    Name     = "new_field";
    DataType = "TEXT";

    Result = OPI_PostgreSQL.AddTableColumn(Table, Name, DataType, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "AddTableColumn");

    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "AddTableColumn", "Check");

EndProcedure

Procedure PostgreSQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";
    Name  = "new_field";

    Result = OPI_PostgreSQL.DeleteTableColumn(Table, Name, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteTableColumn");

    Result = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure PostgreSQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    ConnectionString = OPI_PostgreSQL.GenerateConnectionString(Address, Base, Login, Password, Port);

    If TLS Then
        TLSSettings = OPI_PostgreSQL.GetTLSSettings(True);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "SMALLINT");
    ColoumnsStruct.Insert("uuid_field"     , "uuid");
    ColoumnsStruct.Insert("bigint_field"   , "BIGINT");
    ColoumnsStruct.Insert("custom_field"   , "TEXT");

    Result = OPI_PostgreSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "EnsureTable");

    Check = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Check, "PostgreSQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Result = OPI_PostgreSQL.EnsureTable(Table, ColoumnsStruct, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Result, "PostgreSQL", "EnsureTable", "New");

    Check = OPI_PostgreSQL.GetTableInformation(Table, ConnectionString, TLSSettings);

    OPI_TestDataRetrieval.Process(Check, "PostgreSQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

#EndRegion // PostgreSQL

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure Postgres_ОсновныеМетоды() Export
    Postgres_CommonMethods();
EndProcedure

#EndRegion