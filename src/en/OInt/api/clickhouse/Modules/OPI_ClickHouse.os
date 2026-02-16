// OneScript: ./OInt/api/clickhouse/Modules/OPI_ClickHouse.os
// Lib: ClickHouse
// CLI: clickhouse
// Keywords: clickhouse
// Depends: OPI_GRPC

// DocsCategory: Database
// DocsNameRU: ClickHouse
// DocsNameEN: ClickHouse

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#Use "../../../tools/main"
#Use "../../../tools/http"

#Region Public

#Region CommonMethods

// Execute request
// Executes a request with the specified parameters
//
// Parameters:
// Connection - Arbitrary                - Connection settings or object (for gRPC) - conn
// Request    - Structure Of KeyAndValue - Request data. See GetRequestSettings     - req
// Session    - Structure Of KeyAndValue - Session settings. See GetSessionSettings - session
//
// Returns:
// Map Of KeyAndValue - Execution result
Function ExecuteRequest(Val Connection, Val Request, Val Session = Undefined) Export

    OPI_TypeConversion.GetKeyValueCollection(Request, "Incorrect request structure");

    If Session <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Session, "Incorrect session structure");
    EndIf;

    ConnectorGrpcPassed = OPI_GRPC.IsConnector(Connection);
    DefaultTransport    = ?(ConnectorGrpcPassed, "grpc", "http");

    If Not ConnectorGrpcPassed Then

        OPI_TypeConversion.GetKeyValueCollection(Connection, "Incorrect connection structure");
        MissingFields = OPI_Tools.FindMissingCollectionFields(Connection, "address");

        If ValueIsFilled(MissingFields) Then
            FieldsAsString = StrConcat(MissingFields, ", ");
            ErrorText      = StrTemplate("Missing required connection settings fields: %1", FieldsAsString);
            Raise ErrorText;
        EndIf;

    EndIf;

    Transport = OPI_Tools.GetOr(Connection, "transport", DefaultTransport);

    If Transport = "http" Then

        Result = ExecuteRequestViaHTTP(Connection, Request, Session);

    ElsIf Transport = "grpc" Then

        Result = ExecuteRequestViaGRPC(Connection, Request, Session);

    EndIf;

    Return Result;

EndFunction

// Get HTTP connection settings
// Gets the settings structure for HTTP connection
//
// Parameters:
// Address           - String                           - Connection address with protocol and port          - url
// Authorization     - String, Structure Of KeyAndValue - Authorization: string for JWT, structure for basic - auth
// AdditionalHeaders - Map Of KeyAndValue               - Additional request headers                         - headers
//
// Returns:
// Structure Of KeyAndValue - Connection settings structure
Function GetHTTPConnectionSettings(Val Address
    , Val Authorization = Undefined
    , Val AdditionalHeaders = Undefined) Export

    ConnectionSettings = New Structure;
    OPI_Tools.AddField("address"  , Address          , "String"     , ConnectionSettings);
    OPI_Tools.AddField("headers"  , AdditionalHeaders, "KeyAndValue", ConnectionSettings);
    OPI_Tools.AddField("transport", "http"           , "String"     , ConnectionSettings);

    If Authorization = Undefined Then
        Return ConnectionSettings;
    EndIf;

    CompleteAuthorizationSettings(Authorization, ConnectionSettings);

    Return ConnectionSettings;

EndFunction

// Get request settings
// Forms the request description structure
//
// Note:
// When using the `http` transport, you cannot use `Data` and `External Tables` simultaneously
// The response body can be returned as a collection (for JSON) or as binary data (for other formats).^^
// In the CLI version, binary data will be represented as a Base64 string
//
// Parameters:
// Text           - String             - Request text                                        - query
// Database       - String             - Database                                            - db
// RequestID      - String             - Unique request ID, if necessary                     - id
// Data           - Arbitrary          - String, file, or binary data of the request         - data
// ResponseFormat - String             - Response format: JSON, CSV, TSV, etc..              - format
// ExternalTables - Array of Structure - External tables data. See GetExternalTableStructure - ext
// Settings       - Map Of KeyAndValue - Additional query parameters of the request          - settings
//
// Returns:
// Structure Of KeyAndValue - Request structure
Function GetRequestSettings(Val Text
    , Val Database = Undefined
    , Val RequestID = Undefined
    , Val Data = Undefined
    , Val ResponseFormat = "JSON"
    , Val ExternalTables = Undefined
    , Val Settings = Undefined) Export

    RequestParameters = New Structure;
    OPI_Tools.AddField("query"          , Text           , "String"     , RequestParameters);
    OPI_Tools.AddField("database"       , Database       , "String"     , RequestParameters);
    OPI_Tools.AddField("id"             , RequestID      , "String"     , RequestParameters);
    OPI_Tools.AddField("data"           , Data           , "Current"    , RequestParameters);
    OPI_Tools.AddField("format"         , ResponseFormat , "String"     , RequestParameters);
    OPI_Tools.AddField("external_tables", ExternalTables , "Array"      , RequestParameters);
    OPI_Tools.AddField("settings"       , Settings       , "KeyAndValue", RequestParameters);

    Return RequestParameters;

EndFunction

// Get external table structure
// Gets the description structure of the external table of the request
//
// Parameters:
// Name           - String                   - Table name                                            - name
// ColoumnsStruct - Structure Of KeyAndValue - Table column structure: Key > name, Value > data type - cols
// Data           - Arbitrary                - String, file, or binary data of the table             - data
// DataFormat     - String                   - Data format: CVS, TVS, JSON, etc..                    - format
//
// Returns:
// Structure Of KeyAndValue - Structure of external table description
Function GetExternalTableStructure(Val Name
    , Val ColoumnsStruct
    , Val Data = Undefined
    , Val DataFormat = Undefined) Export

    TableParameters = New Structure;
    OPI_Tools.AddField("name"  , Name          , "String"     , TableParameters);
    OPI_Tools.AddField("cols"  , ColoumnsStruct, "KeyAndValue", TableParameters);
    OPI_Tools.AddField("data"  , Data          , "Current"    , TableParameters);
    OPI_Tools.AddField("format", DataFormat    , "String"     , TableParameters);

    Return TableParameters;

EndFunction

// Get session settings
// Forms the session settings structure for executing the request
//
// Parameters:
// SessionID    - String  - Session ID. A new unique identifier if not specified (a new session will be created)                  - id
// CheckSession - Boolean - Check for session existence. True when ID is specified and false when not, unless otherwise specified - check
// Timeout      - Number  - Session lifetime in seconds                                                                           - timeout
//
// Returns:
// Structure Of KeyAndValue - Session settings structure
Function GetSessionSettings(Val SessionID = Undefined
    , Val CheckSession = Undefined
    , Val Timeout = 60) Export

    SessionSettings = New Structure;
    HasSessionID    = SessionID <> Undefined;

    If CheckSession  = Undefined Then
        CheckSession = HasSessionID;
    EndIf;

    OPI_Tools.AddField("id"     , SessionID   , "String" , SessionSettings);
    OPI_Tools.AddField("check"  , CheckSession, "Boolean", SessionSettings);
    OPI_Tools.AddField("timeout", Timeout     , "Number" , SessionSettings);

    Return SessionSettings;

EndFunction

#EndRegion

#Region GRPC

// Get gRPC connection settings
// Gets the settings structure for gRPC connection
//
// Parameters:
// Address       - String                           - Connection address with protocol and port          - url
// Authorization - String, Structure Of KeyAndValue - Authorization: string for JWT, structure for basic - auth
// Meta          - Structure Of KeyAndValue         - gRPC metadata structure, if necessary              - meta
// Tls           - Structure Of KeyAndValue         - TLS settings. See GetTlsSettings                   - tls
//
// Returns:
// Structure Of KeyAndValue - Connection settings structure
Function GetGRPCConnectionSettings(Val Address
    , Val Authorization = Undefined
    , Val Meta = Undefined
    , Val Tls = Undefined) Export

    ConnectionSettings = New Structure;
    OPI_Tools.AddField("address"  , Address , "String"     , ConnectionSettings);
    OPI_Tools.AddField("tls"      , Tls     , "KeyAndValue", ConnectionSettings);
    OPI_Tools.AddField("metadata" , Meta    , "KeyAndValue", ConnectionSettings);
    OPI_Tools.AddField("transport", "grpc"  , "String"     , ConnectionSettings);

    If Authorization = Undefined Then
        Return ConnectionSettings;
    EndIf;

    CompleteAuthorizationSettings(Authorization, ConnectionSettings);

    Return ConnectionSettings;

EndFunction

// Create GRPC connection !NOCLI
// Opens a GRPC connection for working with ClickHouse
//
// Parameters:
// ConnectionSettings - Structure Of KeyAndValue - Connection parameters. See GetGRPCConnectionSettings - set
//
// Returns:
// Arbitrary - Client object or map with error information
Function CreateGRPCConnection(Val ConnectionSettings) Export

    If OPI_GRPC.IsConnector(ConnectionSettings) Then
        Return ConnectionSettings;
    EndIf;

    ErrorText = "Incorrect connection parameters passed";
    OPI_TypeConversion.GetKeyValueCollection(ConnectionSettings, ErrorText);

    Address = OPI_Tools.GetOr(ConnectionSettings, "address", Undefined);

    If Address = Undefined Then
        Raise "The address parameter is not filled in the connection parameters";
    EndIf;

    Meta = OPI_Tools.GetOr(ConnectionSettings, "metadata", Undefined);

    If ValueIsFilled(Meta) Then
        ErrorText = "Incorrect connection metadata structure passed";
        OPI_TypeConversion.GetKeyValueCollection(Meta, ErrorText);
    EndIf;

    Tls        = OPI_Tools.GetOr(ConnectionSettings, "tls", Undefined);
    Proto      = OPI_Tools.GetTextTemplate("OPI_Text_ClickHouseProto");
    Parameters = OPI_GRPC.GetConnectionParameters(Address, Proto, Meta);
    Connection = OPI_GRPC.CreateConnection(Parameters, Tls);

    If OPI_GRPC.IsConnector(Connection) Then
        ParametersString = OPI_Tools.JSONString(ConnectionSettings);
        //@skip-check module-unused-local-variable
        Result           = Connection.StoreSettings(ParametersString);
    EndIf;

    Return Connection;

EndFunction

// Open GRPC stream !NOCLI
// Initializes the I/O stream for communication
//
// Parameters:
// Connection - Arbitrary - GRPC connection object - conn
// Timeout    - Number    - Timeout (in ms)        - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function OpenGRPCStream(Val Connection, Val Timeout = 10000) Export

    Service = GetGRPCServiceName();
    Method  = "ExecuteQueryWithStreamIO";
    Result  = OPI_GRPC.InitializeBidirectionalStream(Connection, Service, Method, Timeout);

    Return Result;

EndFunction

// Send GRPC message !NOCLI
// Sends the next message to the client or bidirectional stream
//
// Parameters:
// Connection - Arbitrary                - GRPC connection object                                       - conn
// StreamID   - String                   - Stream Identifier                                            - stream
// Request    - Structure Of KeyAndValue - Request data. See GetRequestSettings                         - req
// Session    - Structure Of KeyAndValue - Session settings. See GetSessionSettings                     - session
// WaitNext   - Boolean                  - Flag for waiting for the next messages after the current one - next
//
// Returns:
// Map Of KeyAndValue - Processing result
Function SendGRPCMessage(Val Connection
    , Val StreamID
    , Val Request
    , Val Session = Undefined
    , Val WaitNext = False) Export

    GRPCRequest = FormGRPCRequest(Connection, Request, Session);
    OPI_Tools.AddField("next_query_info", WaitNext, "Boolean", GRPCRequest);

    Result = OPI_GRPC.SendMessage(Connection, StreamID, GRPCRequest);

    Return Result;

EndFunction

// Send GRPC data !NOCLI
// Sends part of the data (additional QueryInfo) to the stream
//
// Parameters:
// Connection - Arbitrary - GRPC connection object                                       - conn
// StreamID   - String    - Stream Identifier                                            - stream
// Data       - Arbitrary - A string, collection, binary data, or file path to send      - data
// WaitNext   - Boolean   - Flag for waiting for the next messages after the current one - next
//
// Returns:
// Map Of KeyAndValue - Processing result
Function SendGRPCData(Val Connection, Val StreamID, Val Data, Val WaitNext = False) Export

    GRPCRequest = New Structure;

    OPI_TypeConversion.GetBinaryData(Data, True);
    OPI_Tools.AddField("input_data"     , Data    , "BinaryData", GRPCRequest);
    OPI_Tools.AddField("next_query_info", WaitNext, "Boolean"   , GRPCRequest);

    Result = OPI_GRPC.SendMessage(Connection, StreamID, GRPCRequest);

    Return Result;

EndFunction

// Get GRPC message !NOCLI
// Gets the next message from the stream
//
// Note:
// `DefaultFormat` is necessary for streaming reception, as the server does not return format information after the first response
//
// Parameters:
// Connection    - Arbitrary - Connection object                                               - conn
// StreamID      - String    - Stream Identifier                                               - stream
// DefaultFormat - String    - Expected data format if the server did not return output_format - format
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetGRPCMessage(Val Connection, Val StreamID, Val DefaultFormat = "") Export

    Result = OPI_GRPC.GetMessage(Connection, StreamID);
    ProcessGRPCResponse(Result, "message", DefaultFormat);

    Return Result;

EndFunction

// Complete GRPC sending !NOCLI
// Closes the sending channel in a client or bidirectional stream
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID   - String    - Stream Identifier - stream
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CompleteGRPCSending(Val Connection, Val StreamID) Export

    Result = OPI_GRPC.CompleteSend(Connection, StreamID);

    Return Result;

EndFunction

// Close GRPC stream !NOCLI
// Close stream by ID
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID   - String    - Stream Identifier - stream
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CloseGRPCStream(Val Connection, Val StreamID) Export

    Result = OPI_GRPC.CloseStream(Connection, StreamID);

    Return Result;

EndFunction

// Process GRPC sending
// Initializes the stream, sends the request and a set of data in a specified order, receiving one message upon completion
//
// Parameters:
// Connection - Arbitrary                - Existing connection or connection parameters                 - conn
// Request    - Structure Of KeyAndValue - Request data. See GetRequestSettings                         - req
// Data       - Array Of Arbitrary       - An array of strings, collections, binary data, or file paths - data
// Session    - Structure Of KeyAndValue - Session settings. See GetSessionSettings                     - session
// Timeout    - Number                   - Timeout (in ms)                                              - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ProcessGRPCSending(Val Connection
    , Val Request
    , Val Data
    , Val Session = Undefined
    , Val Timeout = 10000) Export

    If OPI_GRPC.IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateGRPCConnection(Connection);
    EndIf;

    If Not OPI_GRPC.IsConnector(Connector) Then
        Return Connector;
    EndIf;

    GRPCStream = OpenGRPCStream(Connector, Timeout);

    If Not GRPCStream["result"] Then
        Return GRPCStream;
    Else
        StreamID = GRPCStream["streamId"];
    EndIf;

    OPI_TypeConversion.GetArray(Data);

    SendingRequest = SendGRPCMessage(Connector, StreamID, Request, Session, Data.Count() > 0);

    If Not SendingRequest["result"] Then
        Return SendingRequest;
    EndIf;

    ResultMap    = New Map;
    SendingArray = New Array;
    CommonResult = True;

    LastIndex = Data.UBound();

    For N = 0 To LastIndex Do

        DataPart    = Data[N];
        CurrentSend = SendGRPCData(Connector, StreamID, DataPart, Not N = LastIndex);

        SendingArray.Add(CurrentSend);

        If Not CurrentSend["result"] Then
            CommonResult = False;
            Break;
        EndIf;

    EndDo;

    CompleteGRPCSending(Connection, StreamID);

    ResultMap.Insert("result"          , CommonResult);
    ResultMap.Insert("request_sending" , SendingRequest);
    ResultMap.Insert("data_sending"    , SendingArray);
    ResultMap.Insert("received_message", GetGRPCMessage(Connector  , StreamID));
    ResultMap.Insert("stream_closing"  , CloseGRPCStream(Connector , StreamID));

    If CloseConnection Then
        OPI_GRPC.CloseConnection(Connector);
    EndIf;

    Return ResultMap;

EndFunction

// Process GRPC receiving
// Initializes the stream, sends the request, and receives messages until closure or a set limit is reached
//
// Parameters:
// Connection   - Arbitrary                - Existing connection or connection parameters        - conn
// Request      - Structure Of KeyAndValue - Request data. See GetRequestSettings                - req
// MessageCount - Number                   - Maximum number of messages to receive, if necessary - amount
// Session      - Structure Of KeyAndValue - Session settings. See GetSessionSettings            - session
// Timeout      - Number                   - Timeout (in ms)                                     - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ProcessGRPCReceiving(Val Connection
    , Val Request
    , Val MessageCount = Undefined
    , Val Session = Undefined
    , Val Timeout = 10000) Export

    If OPI_GRPC.IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateGRPCConnection(Connection);
    EndIf;

    If Not OPI_GRPC.IsConnector(Connector) Then
        Return Connector;
    EndIf;

    GRPCStream = OpenGRPCStream(Connector, Timeout);

    If Not GRPCStream["result"] Then
        Return GRPCStream;
    Else
        StreamID = GRPCStream["streamId"];
    EndIf;

    SendingRequest = SendGRPCMessage(Connector, StreamID, Request, Session);

    If Not SendingRequest["result"] Then
        Return SendingRequest;
    EndIf;

    NumberOfMessagesSpecified = MessageCount <> Undefined;

    If NumberOfMessagesSpecified Then
        OPI_TypeConversion.GetNumber(MessageCount);
    EndIf;

    ResultMap = New Map;

    AnswersArray  = New Array;
    DefaultFormat = Undefined;
    Counter       = 0;

    While True And ?(NumberOfMessagesSpecified, MessageCount > Counter, True) Do

        CurrentResponse = GetGRPCMessage(Connector, StreamID, DefaultFormat);

        If Not CurrentResponse["result"] Then
            ResultMap.Insert("stop_message", CurrentResponse);
            Break;
        EndIf;

        AnswersArray.Add(CurrentResponse);
        DefaultFormat = OPI_Tools.GetOr(CurrentResponse, "message.output_format", DefaultFormat);

        Counter = Counter + 1;

    EndDo;

    CommonResult = ?(NumberOfMessagesSpecified, MessageCount = AnswersArray.Count(), True);

    ResultMap.Insert("result"  , CommonResult);
    ResultMap.Insert("messages", AnswersArray);

    If CloseConnection Then
        OPI_GRPC.CloseConnection(Connector);
    EndIf;

    Return ResultMap;

EndFunction

// Get TLS Settings
// Forms settings for using TLS
//
// Note:
// Tls settings can only be set when a connection is created: explicitly, by using the `CreateConnection` function^^
// or implicit, when passing settings
//
// Parameters:
// DisableCertVerification - Boolean - Allows to work with invalid certificates, including self signed                    - trust
// CertFilepath            - String  - Path to the root PEM file of the certificate if it is not in the system repository - cert
//
// Returns:
// Structure Of KeyAndValue - Structure of TLS connection settings
Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export

    Return OPI_AddIns.GetTlsSettings(DisableCertVerification, CertFilepath);

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region Common

Procedure CompleteAuthorizationSettings(Val Authorization, ConnectionSettings)

    OPI_TypeConversion.GetCollection(Authorization);

    If TypeOf(Authorization) = Type("Array") Then

        JWT = Authorization[0];
        OPI_Tools.AddField("auth_type" , "jwt", "String", ConnectionSettings);
        OPI_Tools.AddField("token"     , JWT  , "String", ConnectionSettings);

    Else

        OPI_Tools.AddField("auth_type" , "basic", "String", ConnectionSettings);

        For Each KeyValue In Authorization Do
            OPI_Tools.AddField("user"     , KeyValue.Key  , "String", ConnectionSettings);
            OPI_Tools.AddField("password" , KeyValue.Value, "String", ConnectionSettings);
            Break;
        EndDo;

    EndIf;

EndProcedure

Function IsValidJSONFormat(Val Format)

    Return Format = "JSON"
        Or Format = "JSONCompact"
        Or Format = "JSONColumns"
        Or Format = "JSONColumnsWithMetadata";

EndFunction

Function IsStringFormat(Val Format)

    Return StrFind(Format, "CSV") > 0
        Or StrFind(Format, "TSV") > 0
        Or StrFind(Format, "Pretty") > 0;

EndFunction

#EndRegion

#Region HTTP

Function ExecuteRequestViaHTTP(Val Connection, Val Request, Val Session)

    Data           = OPI_Tools.GetOr(Request, "data" , Undefined);
    ExternalTables = OPI_Tools.GetOr(Request, "external_tables", Undefined);

    If Data <> Undefined And ExternalTables <> Undefined Then
        Raise "Cannot use Data and External Tables simultaneously when passing via http";
    EndIf;

    URL        = Connection["address"];
    RequestID  = OPI_Tools.GetOr(Request, "id" , Undefined);
    QueryText  = OPI_Tools.GetOr(Request, "query" , Undefined);
    DataFormat = OPI_Tools.GetOr(Request, "format" , "JSON");
    Database   = OPI_Tools.GetOr(Request, "database" , Undefined);

    If QueryText <> Undefined Then
        OPI_TypeConversion.GetLine(QueryText, True);
        QueryText = StrReplace(QueryText, Chars.LF, "");
    EndIf;

    HTTPClient = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .AddURLParameter("query"         , QueryText , True)
        .AddURLParameter("query_id"      , RequestID , True)
        .AddURLParameter("default_format", DataFormat, True)

        .AddHeader("X-ClickHouse-Database", Database, True)
        .SetBinaryBody(Data);

    SetHTTPAuthorization(HTTPClient, Connection);
    SetHTTPExternalTables(HTTPClient, ExternalTables);
    SetHTTPSession(HTTPClient, Session);
    SetAdditionalHTTPParameters(HTTPClient, Request);
    SetAdditionalHTTPHeaders(HTTPClient, Connection);


    HTTPClient.ProcessRequest("POST", True);

    If HTTPClient.Error Then
        Response = FormatHTTPErrorResponse(HTTPClient);
    Else

        Try

            ResponseObject = HTTPClient.ReturnResponse(, True);
            ResponseCode   = ResponseObject.StatusCode;

            Response = New Map();
            Response.Insert("status", ResponseObject.StatusCode);

            If ResponseCode < 300 Then

                Result = True;

                If IsValidJSONFormat(DataFormat) Then
                    ResponseBody = HTTPClient.ReturnResponseAsJSONObject();
                ElsIf IsStringFormat(DataFormat) Then
                    ResponseBody = HTTPClient.ReturnResponseAsString();
                Else
                    ResponseBody = HTTPClient.ReturnResponseAsBinaryData();
                EndIf;

                If OPI_Tools.IsCLI() Then

                    ResponseBody = ?(TypeOf(ResponseBody) = Type("BinaryData")
                        , GetBase64StringFromBinaryData(ResponseBody)
                        , ResponseBody);

                EndIf;

            Else

                Result       = False;
                ResponseBody = HTTPClient.ReturnResponseAsString();

            EndIf;


            Response.Insert("result" , Result);
            Response.Insert("body"   , ResponseBody);
            Response.Insert("headers", ResponseObject.Headers);

        Except
            Response = FormatHTTPErrorResponse(HTTPClient);
        EndTry;

    EndIf;

    Return Response;

EndFunction

Function FormatHTTPErrorResponse(HTTPClient)

    Log      = HTTPClient.GetLog();
    Response = New Map;
    Response.Insert("result", False);
    Response.Insert("error" , Log[Log.UBound()]);
    Response.Insert("log"   , Log);

    Return Response;

EndFunction

Procedure SetAdditionalHTTPParameters(HTTPClient, Val Request)

    Settings = OPI_Tools.GetOr(Request, "settings" , New Structure);
    OPI_TypeConversion.GetKeyValueCollection(Settings, "Incorrect additional settings structure passed");

    For Each Setting In Settings Do
        HTTPClient.AddURLParameter(Setting.Key, Setting.Value);
    EndDo;

EndProcedure

Procedure SetAdditionalHTTPHeaders(HTTPClient, Val Connection)

    Headers = OPI_Tools.GetOr(Connection, "headers" , New Map);

    OPI_TypeConversion.GetKeyValueCollection(Headers
        , "Incorrect additional headers structure passed");

    For Each Title In Headers Do
        HTTPClient.AddHeader(Title.Key, Title.Value);
    EndDo;

EndProcedure

Procedure SetHTTPAuthorization(HTTPClient, Val Connection)

    Authorization = OPI_Tools.GetOr(Connection, "auth_type", "none");
    OPI_TypeConversion.GetLine(Authorization);

    If Authorization = "jwt" Then

        JWT = OPI_Tools.GetOr(Connection, "token", "");
        HTTPClient.AddBearerAuthorization(JWT);

    ElsIf Authorization = "basic" Then

        Login    = OPI_Tools.GetOr(Connection, "user" , Undefined);
        Password = OPI_Tools.GetOr(Connection, "password", Undefined);

        HTTPClient
            .AddHeader("X-ClickHouse-User", Login   , True)
            .AddHeader("X-ClickHouse-Key" , Password, True);

    Else
        Return;
    EndIf;

EndProcedure

Procedure SetHTTPExternalTables(HTTPClient, Val ExternalTables)

    If Not ValueIsFilled(ExternalTables) Then
        Return;
    EndIf;

    FileDataType = "application/octet-stream";
    HTTPClient.StartMultipartBody(False);

    OPI_TypeConversion.GetArray(ExternalTables);

    For Each Table In ExternalTables Do

        ErrorText = "Incorrect structure of external table passed";
        OPI_TypeConversion.GetKeyValueCollection(Table, ErrorText);

        TableName    = OPI_Tools.GetOr(Table, "name" , "");
        TableFormat  = OPI_Tools.GetOr(Table, "format", Undefined);
        TableData    = OPI_Tools.GetOr(Table, "data" , Undefined);
        TableColumns = OPI_Tools.GetOr(Table, "cols" , Undefined);

        ErrorText = StrTemplate("Incorrect structure of columns for the table ""%1""", TableName);
        OPI_TypeConversion.GetKeyValueCollection(TableColumns, ErrorText);

        ColumnsArray = New Array;

        For Each TableColumn In TableColumns Do

            ColumnAsString = StrTemplate("%1 %2", TableColumn.Key, TableColumn.Value);
            ColumnsArray.Add(ColumnAsString);

        EndDo;

        ColumnsAsString        = StrConcat(ColumnsArray, ", ");
        FormatParameterName    = StrTemplate("%1_%2" , TableName, "format");
        StructureParameterName = StrTemplate("%1_%2" , TableName, "structure");
        FileName               = StrTemplate("%1.bin", TableName);

        HTTPClient
            .AddURLParameter(FormatParameterName   , TableFormat    , True)
            .AddURLParameter(StructureParameterName, ColumnsAsString, True)

            .AddMultipartFormDataFile(TableName, FileName, TableData, FileDataType, True);

    EndDo;

EndProcedure

Procedure SetHTTPSession(HTTPClient, Val Session)

    If Not ValueIsFilled(Session) Then
        Return;
    EndIf;

    ErrorText = "An incorrect session information structure was passed";
    OPI_TypeConversion.GetKeyValueCollection(Session, ErrorText);

    SessionID = OPI_Tools.GetOr(Session, "id" , Undefined);
    Check     = OPI_Tools.GetOr(Session, "check" , Undefined);
    Timeout   = OPI_Tools.GetOr(Session, "timeout", Undefined);

    HTTPClient
        .AddURLParameter("session_id"     , SessionID, True)
        .AddURLParameter("session_check"  , Check    , True)
        .AddURLParameter("session_timeout", Timeout  , True);

EndProcedure

#EndRegion

#Region GRPC

Function ExecuteRequestViaGRPC(Val Connection, Val Request, Val Session)

    If OPI_GRPC.IsConnector(Connection) Then
        CloseConnection    = False;
        Connector          = Connection;
        ConnectionSettings = OPI_Tools.JsonToStructure(Connector.GetSettings());
    Else
        CloseConnection    = True;
        Connector          = CreateGRPCConnection(Connection);
        ConnectionSettings = Connection;
    EndIf;

    If Not OPI_GRPC.IsConnector(Connector) Then
        Return Connector;
    EndIf;

    GRPCRequest = FormGRPCRequest(ConnectionSettings, Request, Session);

    Service = GetGRPCServiceName();
    Method  = "ExecuteQuery";
    Result  = OPI_GRPC.ExecuteMethod(Connector, Service, Method, GRPCRequest);

    ProcessGRPCResponse(Result);

    If CloseConnection Then
        OPI_GRPC.CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

Function FormGRPCRequest(Val Connection, Val Request, Val Session)

    If Request = Undefined Then
        Return Request;
    EndIf;

    If OPI_GRPC.IsConnector(Connection) Then
        ConnectionSettings = OPI_Tools.JsonToStructure(Connection.GetSettings());
    Else
        ConnectionSettings = Connection;
    EndIf;

    ErrorText = "Request is not a valid key-value structure";
    OPI_TypeConversion.GetKeyValueCollection(Request, ErrorText);

    Data               = OPI_Tools.GetOr(Request, "data" , Undefined);
    RequestID          = OPI_Tools.GetOr(Request, "id" , Undefined);
    QueryText          = OPI_Tools.GetOr(Request, "query" , Undefined);
    DataFormat         = OPI_Tools.GetOr(Request, "format" , Undefined);
    Database           = OPI_Tools.GetOr(Request, "database" , Undefined);
    AdditionalSettings = OPI_Tools.GetOr(Request, "settings" , Undefined);
    ExternalTables     = OPI_Tools.GetOr(Request, "external_tables", Undefined);

    OPI_TypeConversion.GetBinaryData(Data, True);

    GRPCRequest = New Structure;
    OPI_Tools.AddField("query"        , QueryText         , "String"      , GRPCRequest);
    OPI_Tools.AddField("query_id"     , RequestID         , "String"      , GRPCRequest);
    OPI_Tools.AddField("settings"     , AdditionalSettings, "KeyAndValue" , GRPCRequest);
    OPI_Tools.AddField("database"     , Database          , "String"      , GRPCRequest);
    OPI_Tools.AddField("input_data"   , Data              , "BinaryData"  , GRPCRequest);
    OPI_Tools.AddField("output_format", DataFormat        , "String"      , GRPCRequest);

    SetGRPCAuthorization(GRPCRequest, ConnectionSettings);
    SetGRPCExternalTables(GRPCRequest, ExternalTables);
    SetGRPCSession(GRPCRequest, Session);

    Return GRPCRequest;

EndFunction

Function GetGRPCServiceName()

    Return "clickhouse.grpc.ClickHouse";

EndFunction

Procedure SetGRPCAuthorization(GRPCRequest, Val ConnectionSettings)

    Authorization = OPI_Tools.GetOr(ConnectionSettings, "auth_type", "none");
    OPI_TypeConversion.GetLine(Authorization);

    If Authorization = "jwt" Then

        JWT = OPI_Tools.GetOr(ConnectionSettings, "token", "");
        OPI_Tools.AddField("jwt", JWT, "String", GRPCRequest);

    ElsIf Authorization = "basic" Then

        Login    = OPI_Tools.GetOr(ConnectionSettings, "user", Undefined);
        Password = OPI_Tools.GetOr(ConnectionSettings, "password", Undefined);

        OPI_Tools.AddField("user_name", Login   , "String", GRPCRequest);
        OPI_Tools.AddField("password" , Password, "String", GRPCRequest);

    Else
        Return;
    EndIf;

EndProcedure

Procedure SetGRPCExternalTables(GRPCRequest, Val ExternalTables)

    If Not ValueIsFilled(ExternalTables) Then
        Return;
    EndIf;

    OPI_TypeConversion.GetArray(ExternalTables);

    TableArray = New Array;

    For Each Table In ExternalTables Do

        ErrorText = "Incorrect structure of external table passed";
        OPI_TypeConversion.GetKeyValueCollection(Table, ErrorText);

        TableName    = OPI_Tools.GetOr(Table, "name" , "");
        TableFormat  = OPI_Tools.GetOr(Table, "format", Undefined);
        TableData    = OPI_Tools.GetOr(Table, "data" , Undefined);
        TableColumns = OPI_Tools.GetOr(Table, "cols" , Undefined);

        If TableData <> Undefined Then
            OPI_TypeConversion.GetBinaryData(TableData, True);
        EndIf;

        ErrorText = StrTemplate("Incorrect structure of columns for the table ""%1""", TableName);
        OPI_TypeConversion.GetKeyValueCollection(TableColumns, ErrorText);

        TableStructure = New Structure;

        OPI_Tools.AddField("name"            , TableName  , "String"    , TableStructure);
        OPI_Tools.AddField("data"            , TableData  , "BinaryData", TableStructure);
        OPI_Tools.AddField("format"          , TableFormat, "String"    , TableStructure);
        OPI_Tools.AddField("compression_type", "none"     , "String"    , TableStructure);

        ColumnsArray = New Array;

        For Each TableColumn In TableColumns Do

            CurrentColumn = New Structure;
            OPI_Tools.AddField("name", TableColumn.Key  , "String", CurrentColumn);
            OPI_Tools.AddField("type", TableColumn.Value, "String", CurrentColumn);
            ColumnsArray.Add(CurrentColumn);

        EndDo;

        TableStructure.Insert("columns", ColumnsArray);

        TableArray.Add(TableStructure);

    EndDo;

    GRPCRequest.Insert("external_tables", TableArray);

EndProcedure

Procedure SetGRPCSession(GRPCRequest, Val Session)

    If Not ValueIsFilled(Session) Then
        Return;
    EndIf;

    ErrorText = "An incorrect session information structure was passed";
    OPI_TypeConversion.GetKeyValueCollection(Session, ErrorText);

    SessionID = OPI_Tools.GetOr(Session, "id" , Undefined);
    Check     = OPI_Tools.GetOr(Session, "check" , Undefined);
    Timeout   = OPI_Tools.GetOr(Session, "timeout", Undefined);

    OPI_Tools.AddField("session_id"     , SessionID, "String" , GRPCRequest);
    OPI_Tools.AddField("session_check"  , Check    , "Boolean", GRPCRequest);
    OPI_Tools.AddField("session_timeout", Timeout  , "Number" , GRPCRequest);

EndProcedure

Procedure ProcessGRPCResponse(Response, Val DataField = "data", Val DefaultFormat = "")

    If Not OPI_Tools.GetOr(Response, "result", False) Then
        Return;
    EndIf;

    Format = OPI_Tools.GetOr(Response, StrTemplate("%1.output_format", DataField), Undefined);

    If Not ValueIsFilled(Format) Then
        If ValueIsFilled(DefaultFormat) Then
            Format = DefaultFormat;
        Else
            Return;
        EndIf;
    EndIf;

    B64String = "";

    If OPI_Tools.CollectionFieldExists(Response, StrTemplate("%1.output.BYTES", DataField), B64String) Then

        If IsValidJSONFormat(Format) Then

            Value   = GetBinaryDataFromBase64String(B64String);
            Success = False;
            OPI_TypeConversion.GetCollection(Value, , Success);

            If Not Success Then
                Value = ?(TypeOf(Value) = Type("Array"), Value[0], Value);
                Value = GetStringFromBinaryData(Value);
            EndIf;

        ElsIf IsStringFormat(Format) Then

            Value = GetBinaryDataFromBase64String(B64String);
            Value = GetStringFromBinaryData(Value);

        Else

            Return;

        EndIf;

        Response[DataField]["output"] = Value;

    EndIf;

EndProcedure

#EndRegion

#EndRegion

#Region Alternate

Function ВыполнитьЗапрос(Val Соединение, Val Запрос, Val Сессия = Undefined) Export
    Return ExecuteRequest(Соединение, Запрос, Сессия);
EndFunction

Function ПолучитьНастройкиСоединенияHTTP(Val Адрес, Val Авторизация = Undefined, Val ДопЗаголовки = Undefined) Export
    Return GetHTTPConnectionSettings(Адрес, Авторизация, ДопЗаголовки);
EndFunction

Function ПолучитьНастройкиЗапроса(Val Текст, Val БазаДанных = Undefined, Val IDЗапроса = Undefined, Val Данные = Undefined, Val ФорматОтвета = "JSON", Val ВнешниеТаблицы = Undefined, Val Настройки = Undefined) Export
    Return GetRequestSettings(Текст, БазаДанных, IDЗапроса, Данные, ФорматОтвета, ВнешниеТаблицы, Настройки);
EndFunction

Function ПолучитьСтруктуруВнешнейТаблицы(Val Имя, Val СтруктураКолонок, Val Данные = Undefined, Val ФорматДанных = Undefined) Export
    Return GetExternalTableStructure(Имя, СтруктураКолонок, Данные, ФорматДанных);
EndFunction

Function ПолучитьНастройкиСессии(Val IDСессии = Undefined, Val ПроверятьСессию = Undefined, Val Таймаут = 60) Export
    Return GetSessionSettings(IDСессии, ПроверятьСессию, Таймаут);
EndFunction

Function ПолучитьНастройкиСоединенияGRPC(Val Адрес, Val Авторизация = Undefined, Val Meta = Undefined, Val Tls = Undefined) Export
    Return GetGRPCConnectionSettings(Адрес, Авторизация, Meta, Tls);
EndFunction

Function ОткрытьСоединениеGRPC(Val НастройкиСоединения) Export
    Return CreateGRPCConnection(НастройкиСоединения);
EndFunction

Function ОткрытьПотокGRPC(Val Соединение, Val Таймаут = 10000) Export
    Return OpenGRPCStream(Соединение, Таймаут);
EndFunction

Function ОтправитьСообщениеGRPC(Val Соединение, Val IDПотока, Val Запрос, Val Сессия = Undefined, Val ОжидатьСледующее = False) Export
    Return SendGRPCMessage(Соединение, IDПотока, Запрос, Сессия, ОжидатьСледующее);
EndFunction

Function ОтправитьДанныеGRPC(Val Соединение, Val IDПотока, Val Данные, Val ОжидатьСледующее = False) Export
    Return SendGRPCData(Соединение, IDПотока, Данные, ОжидатьСледующее);
EndFunction

Function ПолучитьСообщениеGRPC(Val Соединение, Val IDПотока, Val ФорматПоУмолчанию = "") Export
    Return GetGRPCMessage(Соединение, IDПотока, ФорматПоУмолчанию);
EndFunction

Function ЗавершитьОтправкуGRPC(Val Соединение, Val IDПотока) Export
    Return CompleteGRPCSending(Соединение, IDПотока);
EndFunction

Function ЗакрытьПотокGRPC(Val Соединение, Val IDПотока) Export
    Return CloseGRPCStream(Соединение, IDПотока);
EndFunction

Function ОбработатьОтправкуGRPC(Val Соединение, Val Запрос, Val Данные, Val Сессия = Undefined, Val Таймаут = 10000) Export
    Return ProcessGRPCSending(Соединение, Запрос, Данные, Сессия, Таймаут);
EndFunction

Function ОбработатьПолучениеGRPC(Val Соединение, Val Запрос, Val ЧислоСообщений = Undefined, Val Сессия = Undefined, Val Таймаут = 10000) Export
    Return ProcessGRPCReceiving(Соединение, Запрос, ЧислоСообщений, Сессия, Таймаут);
EndFunction

Function ПолучитьНастройкиTls(Val ОтключитьПроверкуСертификатов, Val ПутьКСертификату = "") Export
    Return GetTlsSettings(ОтключитьПроверкуСертификатов, ПутьКСертификату);
EndFunction

#EndRegion