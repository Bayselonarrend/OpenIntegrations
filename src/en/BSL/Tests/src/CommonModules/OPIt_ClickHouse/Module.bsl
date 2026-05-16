// OneScript: ./OInt/tests/Modules/OPIt_ClickHouse.os

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

    OPI_TestDataRetrieval.FormYAXTests("ClickHouse");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("ClickHouse");

EndFunction

#Region Internal

#Region RunnableTests

#Region ClickHouse

Procedure CH_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("ClickHouse_Port"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("ClickHouse_PortGRPC" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("ClickHouse_User"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("ClickHouse_Password" , TestParameters);

    ClickHouse_ExecuteRequest(TestParameters);
    ClickHouse_GetHTTPConnectionSettings(TestParameters);
    ClickHouse_GetGRPCConnectionSettings(TestParameters);
    ClickHouse_GetRequestSettings(TestParameters);
    ClickHouse_GetExternalTableStructure(TestParameters);
    ClickHouse_GetSessionSettings(TestParameters);

EndProcedure

Procedure CH_GRPC() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("ClickHouse_PortGRPC" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("ClickHouse_User"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("ClickHouse_Password" , TestParameters);

    ClickHouse_CreateGRPCConnection(TestParameters);
    ClickHouse_GetTlsSettings(TestParameters);

    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), TestParameters["ClickHouse_PortGRPC"]);

    Login    = TestParameters["ClickHouse_User"];
    Password = TestParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    TableCreationText = "CREATE TABLE IF NOT EXISTS events_stream_test (
    |    id UInt64,
    |    timestamp DateTime,
    |    user_id UInt32,
    |    event_type String,
    |    payload String
    |) ENGINE         = MergeTree()
    |ORDER BY (timestamp, id)";

    Request = OPI_ClickHouse.GetRequestSettings("DROP TABLE IF EXISTS events_stream_test");
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    Request = OPI_ClickHouse.GetRequestSettings(TableCreationText);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    ClickHouse_OpenGRPCStream(TestParameters);
    ClickHouse_SendGRPCMessage(TestParameters);
    ClickHouse_SendGRPCData(TestParameters);
    ClickHouse_GetGRPCMessage(TestParameters);
    ClickHouse_CompleteGRPCSending(TestParameters);
    ClickHouse_CloseGRPCStream(TestParameters);
    ClickHouse_ProcessGRPCSending(TestParameters);
    ClickHouse_ProcessGRPCReceiving(TestParameters);

EndProcedure

#EndRegion // ClickHouse

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region ClickHouse

Procedure ClickHouse_ExecuteRequest(FunctionParameters)

    // Connection settings

    URL = "http://localhost:8123";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_Port"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    Connection = OPI_ClickHouse.GetHTTPConnectionSettings(URL, Authorization);

    // Request (table creation)

    QueryText = "CREATE TABLE IF NOT EXISTS events (
    |    id UInt64,
    |    timestamp DateTime,
    |    user_id UInt32,
    |    event_type String,
    |    payload String
    |) ENGINE = MergeTree()
    |ORDER BY (timestamp, id)";

    Request = OPI_ClickHouse.GetRequestSettings("DROP TABLE IF EXISTS events"); // SKIP
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request); // SKIP

    Request = OPI_ClickHouse.GetRequestSettings(QueryText);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "TableCreation"); // SKIP

    // Request (data insertion)

    QueryText = "INSERT INTO events FORMAT JSON";

    DataFormat = "JSON";
    DataArray  = New Array;

    CurrentDate = Date("20260101100000");

    Record1 = New Structure;
    Record1.Insert("id"        , 1);
    Record1.Insert("timestamp" , CurrentDate);
    Record1.Insert("user_id"   , 100);
    Record1.Insert("event_type", "click");
    Record1.Insert("payload"   , "{}");

    Record2 = New Structure;
    Record2.Insert("id"        , 2);
    Record2.Insert("timestamp" , CurrentDate);
    Record2.Insert("user_id"   , 200);
    Record2.Insert("event_type", "hover");
    Record2.Insert("payload"   , "{}");

    DataArray.Add(Record1);
    DataArray.Add(Record2);

    Meta = New Array;
    Meta.Add(New Structure("name,type", "id"        , "UInt64"));
    Meta.Add(New Structure("name,type", "timestamp" , "DateTime"));
    Meta.Add(New Structure("name,type", "user_id"   , "UInt32"));
    Meta.Add(New Structure("name,type", "event_type", "String"));
    Meta.Add(New Structure("name,type", "payload"   , "String"));

    Data      = New Structure("meta,data", Meta, DataArray);
    Database  = "default";
    RequestID = String(New UUID());

    Request = OPI_ClickHouse.GetRequestSettings(QueryText, Database, RequestID, Data, DataFormat);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "DataInsert"); // SKIP

    // Request with external table

    TableName      = "ext_users";
    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("id"  , "UInt64");
    ColoumnsStruct.Insert("name", "String");

    Tab       = Chars.Tab;
    TableData = "1" + Tab + "John
    |2" + Tab + "Jane
    |3" + Tab + "Bob";

    ExternalTable = OPI_ClickHouse.GetExternalTableStructure(TableName, ColoumnsStruct, TableData, "TSV");

    ExternalTablesArray = New Array;
    ExternalTablesArray.Add(ExternalTable);

    QueryText = "SELECT * FROM ext_users WHERE id > 1";

    Request = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "JSON", ExternalTablesArray);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "ExternalTable"); // SKIP

    // Selection

    SelectionText = "SELECT * FROM events";

    Request = OPI_ClickHouse.GetRequestSettings(SelectionText, , , , "JSON");
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest"); // SKIP

    Request = OPI_ClickHouse.GetRequestSettings(SelectionText, , , , "CSV");
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "CSVSelection");

    Request = OPI_ClickHouse.GetRequestSettings(SelectionText, , , , "TSV");
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "TSVSelection");

    Request = OPI_ClickHouse.GetRequestSettings(SelectionText, , , , "JSONCompact");
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "JSONCompactSelection");

    QueryText = "SELECT 1 AS result";

    AdditionalSettings = New Map;
    AdditionalSettings.Insert("max_threads", "4");

    Request = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "JSON", , AdditionalSettings);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "AdditionalSettings");

    UUID    = String(New UUID());
    Session = OPI_ClickHouse.GetSessionSettings(UUID);

    QueryText = "CREATE TEMPORARY TABLE temp_session_test (id UInt64, value String)";

    Request = OPI_ClickHouse.GetRequestSettings(QueryText);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request, Session);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "SessionCreation");

    QueryText = "INSERT INTO temp_session_test VALUES (1, 'test1'), (2, 'test2')";

    Request = OPI_ClickHouse.GetRequestSettings(QueryText);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request, Session);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest", "SessionInsert");

    QueryText = "SELECT * FROM temp_session_test";

    Request = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "JSON");
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request, Session);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ExecuteRequest");

EndProcedure

Procedure ClickHouse_CreateGRPCConnection(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    // Connection creation

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    OPI_TestDataRetrieval.Process(Connection, "ClickHouse", "CreateGRPCConnection", "Openning"); // SKIP

    // Request via open connection (table creation)

    QueryText = "CREATE TABLE IF NOT EXISTS events_grpc (
    |    id UInt64,
    |    timestamp DateTime,
    |    user_id UInt32,
    |    event_type String,
    |    payload String
    |) ENGINE = MergeTree()
    |ORDER BY (timestamp, id)";

    Request = OPI_ClickHouse.GetRequestSettings("DROP TABLE IF EXISTS events_grpc"); // SKIP
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request); // SKIP

    Request = OPI_ClickHouse.GetRequestSettings(QueryText);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "CreateGRPCConnection", "TableCreation"); // SKIP

    // Data insertion

    QueryText = "INSERT INTO events_grpc FORMAT JSON";

    DataFormat = "JSON";
    DataArray  = New Array;

    CurrentDate = OPI_Tools.GetCurrentDate();

    Record1 = New Structure;
    Record1.Insert("id"        , 1);
    Record1.Insert("timestamp" , CurrentDate);
    Record1.Insert("user_id"   , 100);
    Record1.Insert("event_type", "click");
    Record1.Insert("payload"   , "{}");

    DataArray.Add(Record1);

    Meta = New Array;
    Meta.Add(New Structure("name,type", "id"        , "UInt64"));
    Meta.Add(New Structure("name,type", "timestamp" , "DateTime"));
    Meta.Add(New Structure("name,type", "user_id"   , "UInt32"));
    Meta.Add(New Structure("name,type", "event_type", "String"));
    Meta.Add(New Structure("name,type", "payload"   , "String"));

    Data      = New Structure("meta,data", Meta, DataArray);
    RequestID = String(New UUID());

    Request = OPI_ClickHouse.GetRequestSettings(QueryText, "default", RequestID, Data, DataFormat);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "CreateGRPCConnection", "DataInsert"); // SKIP

    // Selection

    SelectionText = "SELECT * FROM events_grpc";

    Request = OPI_ClickHouse.GetRequestSettings(SelectionText, , , , "JSON");
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "CreateGRPCConnection", "Selection"); // SKIP

    // Request with external table via gRPC

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("id"  , "UInt64");
    ColoumnsStruct.Insert("name", "String");

    Tab       = Chars.Tab;
    TableData = "1" + Tab + "John
    |2" + Tab + "Jane";

    ExternalTable = OPI_ClickHouse.GetExternalTableStructure("ext_grpc", ColoumnsStruct, TableData, "TSV");

    ExternalTablesArray = New Array;
    ExternalTablesArray.Add(ExternalTable);

    QueryText = "SELECT * FROM ext_grpc";

    Request = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "JSON", ExternalTablesArray);
    Result  = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "CreateGRPCConnection");

EndProcedure

Procedure ClickHouse_GetHTTPConnectionSettings(FunctionParameters)

    URL = "http://localhost:8123";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_Port"]); // SKIP

    // No authorization

    Result = OPI_ClickHouse.GetHTTPConnectionSettings(URL);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetHTTPConnectionSettings", "NoAuthorization"); // SKIP

    // With basic authorization

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    Result = OPI_ClickHouse.GetHTTPConnectionSettings(URL, Authorization);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetHTTPConnectionSettings", "BasicAuthorization"); // SKIP

    // With JWT authorization

    JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test";

    Result = OPI_ClickHouse.GetHTTPConnectionSettings(URL, JWT);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetHTTPConnectionSettings", "JWTAuthorization"); // SKIP

    // With additional headers

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("X-Custom-Header", "CustomValue");

    Result = OPI_ClickHouse.GetHTTPConnectionSettings(URL, Authorization, AdditionalHeaders);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetHTTPConnectionSettings");

EndProcedure

Procedure ClickHouse_GetGRPCConnectionSettings(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    // No authorization

    Result = OPI_ClickHouse.GetGRPCConnectionSettings(URL);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetGRPCConnectionSettings", "NoAuthorization"); // SKIP

    // With basic authorization

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    Result = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetGRPCConnectionSettings", "BasicAuthorization"); // SKIP

    // With JWT authorization

    JWT = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.test";

    Result = OPI_ClickHouse.GetGRPCConnectionSettings(URL, JWT);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetGRPCConnectionSettings", "JWTAuthorization"); // SKIP

    // With metadata

    Meta = New Map;
    Meta.Insert("custom-meta", "value");

    Result = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization, Meta);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetGRPCConnectionSettings", "WithMetadata"); // SKIP

    // With TLS settings

    Tls = OPI_ClickHouse.GetTlsSettings(True);

    Result = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization, , Tls);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetGRPCConnectionSettings");

EndProcedure

Procedure ClickHouse_GetRequestSettings(FunctionParameters)

    // Minimal request

    QueryText = "SELECT 1";

    Result = OPI_ClickHouse.GetRequestSettings(QueryText);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetRequestSettings", "Minimal"); // SKIP

    // Full request

    RequestID      = String(New UUID());
    Data           = New Structure("meta,data", New Array, New Array);
    Database       = "default";
    ResponseFormat = "CSV";

    AdditionalSettings = New Map;
    AdditionalSettings.Insert("max_threads", "4");

    ColoumnsStruct = New Structure("id,name", "UInt64", "String");
    ExternalTable  = OPI_ClickHouse.GetExternalTableStructure("ext", ColoumnsStruct);

    TableArray = New Array;
    TableArray.Add(ExternalTable);

    Result = OPI_ClickHouse.GetRequestSettings(QueryText
        , Database
        , RequestID
        , Data
        , ResponseFormat
        , TableArray
        , AdditionalSettings);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetRequestSettings");

EndProcedure

Procedure ClickHouse_GetExternalTableStructure(FunctionParameters)

    // Minimal structure

    TableName      = "external_data";
    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("id"  , "UInt64");
    ColoumnsStruct.Insert("name", "String");

    Result = OPI_ClickHouse.GetExternalTableStructure(TableName, ColoumnsStruct);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetExternalTableStructure", "Minimal"); // SKIP

    // With TSV data

    TableData = StrTemplate("1%1Test
    |2%1Test2", Chars.Tab);

    Result = OPI_ClickHouse.GetExternalTableStructure(TableName, ColoumnsStruct, TableData, "TSV");

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetExternalTableStructure");

EndProcedure

Procedure ClickHouse_GetSessionSettings(FunctionParameters)

    SessionID = String(New UUID);
    Check     = True;
    Timeout   = 120;

    Result = OPI_ClickHouse.GetSessionSettings(SessionID, Check, Timeout);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetSessionSettings");

EndProcedure

Procedure ClickHouse_GetTlsSettings(FunctionParameters)

    Result = OPI_ClickHouse.GetTlsSettings(False);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "GetTlsSettings");

EndProcedure

Procedure ClickHouse_OpenGRPCStream(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    Result = OPI_ClickHouse.OpenGRPCStream(Connection); // <---

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    QueryText   = "INSERT INTO events_stream_test FORMAT JSONEachRow";
    DataFormat  = "JSON";
    CurrentDate = Date("20260101100000");

    Counter = 0;
    While Counter < 5 Do

        Record = New Structure;
        Record.Insert("id"         , Counter + 1);
        Record.Insert("timestamp"  , CurrentDate);
        Record.Insert("user_id"    , 100 + Counter);
        Record.Insert("event_type" , "stream_test");
        Record.Insert("payload"    , "{}");

        Record = OPI_Tools.JSONString(Record) + Chars.LF;

        Last = Counter = 4;

        If Counter      = 0 Then
            Request     = OPI_ClickHouse.GetRequestSettings(QueryText, "default", , Record, DataFormat);
            CurrentSend = OPI_ClickHouse.SendGRPCMessage(Connection, StreamID, Request, , Not Last);
        Else
            CurrentSend = OPI_ClickHouse.SendGRPCData(Connection, StreamID, Record, Not Last);
        EndIf;

        If Not CurrentSend["result"] Then

            Error = CurrentSend["error"];

            If Error <> "Timeout" Then
                Raise OPI_Tools.JSONString(CurrentSend);
            EndIf;

        EndIf;

        Counter = Counter + 1;

    EndDo;

    Completion   = OPI_ClickHouse.CompleteGRPCSending(Connection, StreamID);
    FinalMessage = OPI_ClickHouse.GetGRPCMessage(Connection, StreamID);

    OPI_GRPC.CloseConnection(Connection);

    // END

    OPI_TestDataRetrieval.Process(Result       , "ClickHouse", "OpenGRPCStream");
    OPI_TestDataRetrieval.Process(FinalMessage , "ClickHouse", "OpenGRPCStream", "Final");

    Connection = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    SelectionText   = "SELECT * FROM events_stream_test ORDER BY id";
    Request         = OPI_ClickHouse.GetRequestSettings(SelectionText, , , , "JSON");
    SelectionResult = OPI_ClickHouse.ExecuteRequest(Connection, Request);

    OPI_TestDataRetrieval.Process(SelectionResult, "ClickHouse", "OpenGRPCStream", "Selection");

    OPI_GRPC.CloseConnection(Connection);

EndProcedure

Procedure ClickHouse_SendGRPCMessage(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    Result = OPI_ClickHouse.OpenGRPCStream(Connection);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    QueryText   = "INSERT INTO events_stream_test FORMAT JSONEachRow";
    DataFormat  = "JSON";
    CurrentDate = Date("20260101100000");

    Counter = 0;
    While Counter < 5 Do

        Record = New Structure;
        Record.Insert("id"         , Counter + 1);
        Record.Insert("timestamp"  , CurrentDate);
        Record.Insert("user_id"    , 100 + Counter);
        Record.Insert("event_type" , "stream_test");
        Record.Insert("payload"    , "{}");

        Record = OPI_Tools.JSONString(Record) + Chars.LF;

        Last = Counter = 4;

        If Counter = 0 Then

            Request     = OPI_ClickHouse.GetRequestSettings(QueryText, "default", , Record, DataFormat);
            CurrentSend = OPI_ClickHouse.SendGRPCMessage(Connection, StreamID, Request, , Not Last); // <---
            OPI_TestDataRetrieval.Process(Result, "ClickHouse", "SendGRPCMessage"); // SKIP
        Else
            CurrentSend = OPI_ClickHouse.SendGRPCData(Connection, StreamID, Record, Not Last);
        EndIf;

        If Not CurrentSend["result"] Then

            Error = CurrentSend["error"];

            If Error <> "Timeout" Then
                Raise OPI_Tools.JSONString(CurrentSend);
            EndIf;

        EndIf;

        Counter = Counter + 1;

    EndDo;

    // END

    Completion   = OPI_ClickHouse.CompleteGRPCSending(Connection, StreamID);
    FinalMessage = OPI_ClickHouse.GetGRPCMessage(Connection, StreamID);

    OPI_GRPC.CloseConnection(Connection);

EndProcedure

Procedure ClickHouse_SendGRPCData(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    Result = OPI_ClickHouse.OpenGRPCStream(Connection);

    If Not Result["result"] Then
        Raise Result["error"];
    Else
        StreamID = Result["streamId"];
    EndIf;

    QueryText   = "INSERT INTO events_stream_test FORMAT JSONEachRow";
    DataFormat  = "JSON";
    CurrentDate = Date("20260101100000");

    Counter = 0;
    While Counter < 5 Do

        Record = New Structure;
        Record.Insert("id"         , Counter + 1);
        Record.Insert("timestamp"  , CurrentDate);
        Record.Insert("user_id"    , 100 + Counter);
        Record.Insert("event_type" , "stream_test");
        Record.Insert("payload"    , "{}");

        Record = OPI_Tools.JSONString(Record) + Chars.LF;

        Last = Counter = 4;

        If Counter = 0 Then

            Request     = OPI_ClickHouse.GetRequestSettings(QueryText, "default", , Record, DataFormat);
            CurrentSend = OPI_ClickHouse.SendGRPCMessage(Connection, StreamID, Request, , Not Last);
        Else
            CurrentSend = OPI_ClickHouse.SendGRPCData(Connection, StreamID, Record, Not Last); // <---
            OPI_TestDataRetrieval.Process(Result, "ClickHouse", "SendGRPCData"); // SKIP
        EndIf;

        If Not CurrentSend["result"] Then

            Error = CurrentSend["error"];

            If Error <> "Timeout" Then
                Raise OPI_Tools.JSONString(CurrentSend);
            EndIf;

        EndIf;

        Counter = Counter + 1;

    EndDo;

    // END

    Completion   = OPI_ClickHouse.CompleteGRPCSending(Connection, StreamID);
    FinalMessage = OPI_ClickHouse.GetGRPCMessage(Connection, StreamID);

    OPI_GRPC.CloseConnection(Connection);

EndProcedure

Procedure ClickHouse_GetGRPCMessage(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);
    Timeout            = 10000;

    OpeningResult = OPI_ClickHouse.OpenGRPCStream(Connection, Timeout);

    If Not OpeningResult["result"] Then
        Raise OpeningResult["error"];
    Else
        StreamID = OpeningResult["streamId"];
    EndIf;

    QueryText = "SELECT number FROM system.numbers LIMIT 1";
    Request   = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "JSON");

    Result = OPI_ClickHouse.SendGRPCMessage(Connection, StreamID, Request);
    OPI_ClickHouse.CompleteGRPCSending(Connection, StreamID);

    Data = "";

    If Result["result"] Then

        While True Do

            Result = OPI_ClickHouse.GetGRPCMessage(Connection, StreamID, "JSON");

            If Not Result["result"] Then
                Break;
            EndIf;

            TextPart = Result["message"]["output"];
            Data     = Data + TextPart;

        EndDo;

        OPI_GRPC.CloseConnection(Connection);

    Else
        Raise Result["error"];
    EndIf;

    OPI_TypeConversion.GetCollection(Data);

    // END

    OPI_TestDataRetrieval.Process(Data, "ClickHouse", "GetGRPCMessage");

EndProcedure

Procedure ClickHouse_CompleteGRPCSending(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);
    Timeout            = 10000;

    OpeningResult = OPI_ClickHouse.OpenGRPCStream(Connection, Timeout);

    If Not OpeningResult["result"] Then
        Raise OpeningResult["error"];
    Else
        StreamID = OpeningResult["streamId"];
    EndIf;

    QueryText = "SELECT number FROM system.numbers LIMIT 1";
    Request   = OPI_ClickHouse.GetRequestSettings(QueryText, , , , "JSON");

    Sending = OPI_ClickHouse.SendGRPCMessage(Connection, StreamID, Request);
    Result  = OPI_ClickHouse.CompleteGRPCSending(Connection, StreamID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "CompleteGRPCSending");

    Result = OPI_ClickHouse.SendGRPCMessage(Connection, StreamID, Request);

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "CompleteGRPCSending", "Sending");

EndProcedure

Procedure ClickHouse_CloseGRPCStream(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization = New Structure(Login, Password);

    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);
    Timeout            = 10000;

    OpeningResult = OPI_ClickHouse.OpenGRPCStream(Connection, Timeout);

    If Not OpeningResult["result"] Then
        Raise OpeningResult["error"];
    Else
        StreamID = OpeningResult["streamId"];
    EndIf;

    Result = OPI_ClickHouse.CloseGRPCStream(Connection, StreamID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "CloseGRPCStream");

    OPI_GRPC.CloseConnection(Connection);

EndProcedure

Procedure ClickHouse_ProcessGRPCSending(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization      = New Structure(Login, Password);
    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    QueryText   = "INSERT INTO events_stream_test FORMAT JSONEachRow";
    DataFormat  = "JSON";
    CurrentDate = Date("20260101100000");

    Request   = Undefined;
    DataArray = New Array;

    Counter = 0;
    While Counter < 5 Do

        Record = New Structure;
        Record.Insert("id"        , Counter + 1);
        Record.Insert("timestamp" , CurrentDate);
        Record.Insert("user_id"   , 100 + Counter);
        Record.Insert("event_type", "stream_test");
        Record.Insert("payload"   , "{}");

        Record = OPI_Tools.JSONString(Record) + Chars.LF;

        If Counter  = 0 Then
            Request = OPI_ClickHouse.GetRequestSettings(QueryText, "default", , Record, DataFormat);
        Else
            DataArray.Add(Record);
        EndIf;

        Counter = Counter + 1;

    EndDo;

    Result = OPI_ClickHouse.ProcessGRPCSending(Connection, Request, DataArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ProcessGRPCSending");

EndProcedure

Procedure ClickHouse_ProcessGRPCReceiving(FunctionParameters)

    URL = "http://localhost:9101";
    URL = StrTemplate("http://%1:%2", OPI_TestDataRetrieval.GetLocalhost(), FunctionParameters["ClickHouse_PortGRPC"]); // SKIP

    Login    = FunctionParameters["ClickHouse_User"];
    Password = FunctionParameters["ClickHouse_Password"];

    Authorization      = New Structure(Login, Password);
    ConnectionSettings = OPI_ClickHouse.GetGRPCConnectionSettings(URL, Authorization);
    Connection         = OPI_ClickHouse.CreateGRPCConnection(ConnectionSettings);

    SelectionText = "SELECT * FROM events_stream_test ORDER BY id";
    Request       = OPI_ClickHouse.GetRequestSettings(SelectionText, , , , "JSON");

    Result = OPI_ClickHouse.ProcessGRPCReceiving(Connection, Request);

    // END

    OPI_TestDataRetrieval.Process(Result, "ClickHouse", "ProcessGRPCReceiving");

EndProcedure

#EndRegion // ClickHouse

#EndRegion // AtomicTests

#EndRegion // Private

#EndIf // !OPI
