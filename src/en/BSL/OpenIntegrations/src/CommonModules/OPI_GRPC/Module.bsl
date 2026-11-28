// OneScript: ./OInt/api/grpc/Modules/OPI_GRPC.os
// Lib: GRPC
// CLI: grpc
// Keywords: grpc

// DocsCategory: Exchange
// DocsNameRU: gRPC
// DocsNameEN: gRPC

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
// BSLLS:DuplicateStringLiteral-off
// BSLLS:MagicNumber-off
// BSLLS:MissingParameterDescription-off
// BSLLS:MissingReturnedValueDescription-off
// BSLLS:CommonModuleNameClientServer-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

// #Use "../../../tools/main"
// #Use "../../../tools/http"

#If Not WebClient Then // !OPI

#Region Public

#Region CommonMethods

// Create connection !NOCLI
// Opens a gRPC connection
//
// Parameters:
// Parameters - String                   - Connection parameters. See GetConnectionParameters - params
// Tls        - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings     - tls
// Logging    - Structure Of KeyAndValue - Logging settings. See GetLoggingSettings           - log
//
// Returns:
// Arbitrary - Client object or map with error information
Function CreateConnection(Val Parameters, Val Tls = Undefined, Val Logging = Undefined) Export

    If IsConnector(Parameters) Then
        Return Parameters;
    EndIf;

    OPI_TypeConversion.GetKeyValueCollection(Parameters);

    Address = OPI_Tools.GetOr(Parameters, "address", Undefined);

    If Address = Undefined Then
        Error  = New Map;
        Error.Insert("result", False);
        Error.Insert("error" , "The parameter structure doesn't contain an address");
    EndIf;

    Connector               = OPI_AddIns.GetAddIn("GRPC");
    Connector.ServerAddress = String(Address);

    SaveSettingsAtAddIn(Connector, Parameters);

    If Logging = Undefined Then

        SettingsString = "";

    Else

        ErrorText      = "Incorrect logging settings";
        OPI_TypeConversion.GetKeyValueCollection(Logging, ErrorText);
        SettingsString = OPI_AddIns.SerializeJanx(Logging);

    EndIf;

    If ValueIsFilled(SettingsString) Then

        LogResult = Connector.SetLogger(SettingsString);
        LogResult = OPI_AddIns.DesrializeJanx(LogResult);

        If Not LogResult["result"] Then
            Return LogResult;
        EndIf;

    EndIf;

    Tls = SetTlsConnection(Connector, Tls);

    If Not OPI_Tools.GetOr(Tls, "result", False) Then
        Return Tls;
    EndIf;

    Result = Connector.Connect();
    Result = OPI_AddIns.DesrializeJanx(Result);

    If Not OPI_Tools.GetOr(Result, "result", False) Then
        Return Result;
    EndIf;

    Result = SetProto(Connector, Parameters);

    If Not OPI_Tools.GetOr(Result, "result", False) Then
        Return Result;
    EndIf;

    ConnectionMetadata = OPI_Tools.GetOr(Parameters, "metadata", Undefined);

    If ConnectionMetadata <> Undefined Then

        Result = SetMetadata(Connector, ConnectionMetadata);

        If Not OPI_Tools.GetOr(Result, "result", False) Then
            Return Result;
        EndIf;

    EndIf;

    Return Connector;

EndFunction

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - conn
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
Function CloseConnection(Val Connection) Export

    If IsConnector(Connection) Then

        Result = Connection.Disconnect();
        Result = OPI_AddIns.DesrializeJanx(Result);

    Else

        Result = New Structure("result,error", False, "It's not a connection");

    EndIf;

    Return Result;

EndFunction

// Set metadata !NOCLI
// Sets new connection metadata
//
// Note:
// Replaces the metadata set during connection creation
//
// Parameters:
// Connection - Arbitrary                - Existing connection - conn
// Metadata   - Structure Of KeyAndValue - Metadata list       - meta
//
// Returns:
// Map Of KeyAndValue - Processing result
Function SetMetadata(Val Connection, Val Metadata) Export

    If Not IsConnector(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetKeyValueCollection(Metadata);

    MetadataAsString = OPI_AddIns.SerializeJanx(Metadata);

    Result = Connection.SetMetadata(MetadataAsString);
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

// Invoke method
// Performs a unary request to the selected service
//
// Parameters:
// Connection - Arbitrary                - Existing connection or connection parameters   - conn
// Service    - String                   - Service name                                   - service
// Method     - String                   - Method name                                    - method
// Request    - Structure Of KeyAndValue - Request data                                   - data
// Timeout    - Number                   - Timeout (in ms)                                - tout
// Tls        - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ExecuteMethod(Val Connection
    , Val Service
    , Val Method
    , Val Request = Undefined
    , Val Timeout = 10000
    , Val Tls = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    CallStructure = FormCallString(Connector, Service, Method, Timeout, Request);
    BDCall        = OPI_AddIns.SerializeJanx(CallStructure);
    ResultBD      = Connector.Call(BDCall);
    Result        = OPI_AddIns.DesrializeJanx(ResultBD);
    ClarifyRequestLimitError(Connection, Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Is connector !NOCLI
// Checks that the value is an AddIn object for working with gRPC
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_GRPC.Main";

EndFunction

// Get connection parameters
// Forms a structure of parameters for creating a connection
//
// Note:
// Proto file name is used to allow further specification of this Proto in the import of another Proto^^
// It does not have to be a real file path.^^
// Proto files that are not involved in the import of other Protos can have arbitrary file names
// If the Proto value is not an object (a key value collection), it will be interpreted as^^
// `{"main.proto": passed value}`^^
// User-Agent of the channel is taken from the UserAgent parameter, and if it is not filled - from the `user-agent` metadata of this set.^^
// The version tonic is appended to it. The metadata set after opening the connection, User-Agent of the channel does not change.^^
// Compression takes the value `gzip` or an empty string. Message sizes are set in bytes.^^
// Connection timeout limits the setup of TCP and TLS. A value of 0 removes the restriction, with a default of 10000 ms.^^
// CallTimeout includes waiting for the channel to be ready
//
// Parameters:
// Address           - String                   - Connection address (with protocol)                                                                - addr
// Proto             - Arbitrary                - Schema or schema structure: Key > file name (for import), Value > schema as a string or file path - proto
// Metadata          - Structure Of KeyAndValue - Metadata structure, if necessary                                                                  - meta
// UserAgent         - String                   - User Agent of the channel. An empty string leaves the default value                               - ua
// Compression       - String                   - Compression of requests and responses: gzip or empty string                                       - compress
// MaxResponseSize   - Number                   - Maximum size of incoming message in bytes. 0 leaves the default limit                             - maxresp
// MaxRequestSize    - Number                   - Maximum size of outgoing message in bytes. 0 leaves the default limit                             - maxreq
// ConnectionTimeout - Number                   - Connection timeout in milliseconds. 0 removes the restriction                                     - ctout
//
// Returns:
// Structure Of KeyAndValue - Connection parameters
Function GetConnectionParameters(Val Address
    , Val Proto = Undefined
    , Val Metadata = Undefined
    , Val UserAgent = ""
    , Val Compression = ""
    , Val MaxResponseSize = 0
    , Val MaxRequestSize = 0
    , Val ConnectionTimeout = 10000) Export

    ConnectionParams = New Structure;
    OPI_Tools.AddField("address", Address, "String", ConnectionParams);

    If ValueIsFilled(Metadata) Then
        OPI_TypeConversion.GetKeyValueCollection(Metadata);
        ConnectionParams.Insert("metadata", Metadata);
    EndIf;

    If ValueIsFilled(UserAgent) Then
        OPI_Tools.AddField("user_agent", UserAgent, "String", ConnectionParams);
    EndIf;

    If ValueIsFilled(Compression) Then
        OPI_Tools.AddField("compression", Compression, "String", ConnectionParams);
    EndIf;

    If ValueIsFilled(MaxResponseSize) Then
        OPI_TypeConversion.GetNumber(MaxResponseSize);
        OPI_Tools.AddField("max_decoding_message_size", MaxResponseSize, "Number", ConnectionParams);
    EndIf;

    If ValueIsFilled(MaxRequestSize) Then
        OPI_TypeConversion.GetNumber(MaxRequestSize);
        OPI_Tools.AddField("max_encoding_message_size", MaxRequestSize, "Number", ConnectionParams);
    EndIf;

    If ConnectionTimeout  = Undefined Then
        ConnectionTimeout = 10000;
    EndIf;

    OPI_TypeConversion.GetNumber(ConnectionTimeout);
    ConnectionParams.Insert("connect_timeout_ms", ConnectionTimeout);

    If ValueIsFilled(Proto) Then

        Try
            Proto_ = Proto;
            OPI_TypeConversion.GetKeyValueCollection(Proto_);
        Except
            Proto_ = New Map;
            Proto_.Insert("main.proto", Proto);
        EndTry;

        ConnectionParams.Insert("proto", Proto_);

    EndIf;

    Return ConnectionParams;

EndFunction

// Get TLS Settings
// Forms settings for using TLS
//
// Note:
// Tls settings can only be set when a connection is created: explicitly, by using the `CreateConnection` function^^
// or implicit, when passing settings.
// The client key and certificate are specified together and enable mTLS. The certificate file is a PEM chain: leaf first, then intermediate certificates.
// Each time a connection is opened, this chain and key are read again and passed to the add-in as binary data. An encrypted key is not supported
//
// Parameters:
// DisableCertVerification - Boolean - Allows to work with invalid certificates, including self signed                    - trust
// CertFilepath            - String  - Path to the root PEM file of the certificate if it is not in the system repository - cert
// ClientKeyPath           - String  - Path to the unencrypted PEM file of the client private key for mTLS                - clientkey
// ClientCertificatePath   - String  - Path to the PEM file of the client certificate chain: leaf, then intermediates     - clientcert
//
// Returns:
// Structure Of KeyAndValue - Structure of TLS connection settings
Function GetTlsSettings(Val DisableCertVerification
    , Val CertFilepath = ""
    , Val ClientKeyPath = ""
    , Val ClientCertificatePath = "") Export

    OPI_TypeConversion.GetLine(ClientKeyPath);
    OPI_TypeConversion.GetLine(ClientCertificatePath);

    CertStructure = OPI_AddIns.GetTlsSettings(DisableCertVerification, CertFilepath);
    OPI_Tools.AddField("client_key_path" , ClientKeyPath        , "String", CertStructure);
    OPI_Tools.AddField("client_cert_path", ClientCertificatePath, "String", CertStructure);

    Return CertStructure;

EndFunction

// Get logging settings
// Retrieves settings structure for enabling logging when opening a connection
//
// Parameters:
// WriteToMemory - Boolean - Logging to memory for further retrieval from the addin object - memory
// MaxEvents     - Number  - Maximum number of events stored in memory                     - count
// FilePath      - String  - Path to file for saving full log, if necessary                - path
//
// Returns:
// Structure Of KeyAndValue - Settings structure
Function GetLoggingSettings(Val WriteToMemory = True
    , Val MaxEvents = 300
    , Val FilePath = "") Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetLoggingSettings(WriteToMemory, MaxEvents, FilePath);

EndFunction

// Get log !NOCLI
// Retrieves connection log data (when in-memory logging is enabled)
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection                          - conn
// AsString   - Boolean   - True > returns log as a single string, False > as an array - str
// EventCount - Number    - Number of recent events to retrieve. 0 > no limits         - count
//
// Returns:
// String, Map Of KeyAndValue - Log as a string or a map with the full execution result
Function GetLog(Val Connection, Val AsString = False, Val EventCount = 100) Export

    Return OPI_AddIns.GetLog(Connection
        , AsString
        , EventCount);

EndFunction

#EndRegion

#Region Introspection

// Get service list
// Gets a list of available services
//
// Parameters:
// Connection - Arbitrary                - Existing connection or connection parameters   - conn
// Tls        - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetServiceList(Val Connection, Val Tls = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    Result = Connector.ListServices();
    Result = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Get method list
// Gets a list of available methods for the specified service
//
// Parameters:
// Connection - Arbitrary                - Existing connection or connection parameters   - conn
// Service    - String                   - Service name                                   - service
// Tls        - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetMethodList(Val Connection, Val Service, Val Tls = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(Service);

    Result = Connector.ListMethods(Service);
    Result = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Get method
// Get method information
//
// Parameters:
// Connection - Arbitrary                - Existing connection or connection parameters   - conn
// Service    - String                   - Service name                                   - service
// Method     - String                   - Method name                                    - method
// Tls        - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetMethod(Val Connection, Val Service, Val Method, Val Tls = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(Service);
    OPI_TypeConversion.GetLine(Method);

    Result = Connector.GetMethodInfo(Service, Method);
    Result = OPI_AddIns.DesrializeJanx(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region Streaming

// Initialize server stream !NOCLI
// Initializes a new server stream
//
// Parameters:
// Connection - Arbitrary                - Connection object   - conn
// Service    - String                   - Service name        - service
// Method     - String                   - Method name         - method
// Request    - Structure Of KeyAndValue - Client request data - data
// Timeout    - Number                   - Timeout (in ms)     - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function InitializeServerStream(Val Connection
    , Val Service
    , Val Method
    , Val Request
    , Val Timeout = 10000) Export

    Return InitializeStream("server", Connection, Service, Method, Request, Timeout);

EndFunction

// Initialize client stream !NOCLI
// Initializes a new client stream
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// Service    - String    - Service name      - service
// Method     - String    - Method name       - method
// Timeout    - Number    - Timeout (in ms)   - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function InitializeClientStream(Val Connection
    , Val Service
    , Val Method
    , Val Timeout = 10000) Export

    Return InitializeStream("client", Connection, Service, Method, Undefined, Timeout);

EndFunction

// Initialize bidirectional stream !NOCLI
// Initializes a new bidirectional stream
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// Service    - String    - Service name      - service
// Method     - String    - Method name       - method
// Timeout    - Number    - Timeout (in ms)   - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function InitializeBidirectionalStream(Val Connection
    , Val Service
    , Val Method
    , Val Timeout = 10000) Export

    Return InitializeStream("bidi", Connection, Service, Method, Undefined, Timeout);

EndFunction

// Send message !NOCLI
// Sends the next message to the client or bidirectional stream
//
// Parameters:
// Connection - Arbitrary                - Connection object        - conn
// StreamID   - String                   - Stream Identifier        - stream
// Request    - Structure Of KeyAndValue - Request data for sending - data
//
// Returns:
// Map Of KeyAndValue - Processing result
Function SendMessage(Val Connection, Val StreamID, Val Request) Export

    If Not IsConnector(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetLine(StreamID);

    ProcessedRequest = ProcessRequestBeforeSending(Connection, Request);
    RequestBD        = OPI_AddIns.SerializeJanx(ProcessedRequest);

    Result = Connection.SendMessage(StreamID, RequestBD);
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

// Get message !NOCLI
// Gets the next message from the stream
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID   - String    - Stream Identifier - stream
//
// Returns:
// Map Of KeyAndValue - Processing result
Function GetMessage(Val Connection, Val StreamID) Export

    If Not IsConnector(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetLine(StreamID);

    ResultBD = Connection.GetNextMessage(StreamID);
    Result   = OPI_AddIns.DesrializeJanx(ResultBD);

    Return Result;

EndFunction

// Complete send !NOCLI
// Closes the sending channel in a client or bidirectional stream
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID   - String    - Stream Identifier - stream
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CompleteSend(Val Connection, Val StreamID) Export

    If Not IsConnector(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetLine(StreamID);

    Result = Connection.FinishSending(StreamID);
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

// Close stream !NOCLI
// Close stream by ID
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID   - String    - Stream Identifier - stream
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CloseStream(Val Connection, Val StreamID) Export

    If Not IsConnector(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetLine(StreamID);

    Result = Connection.CloseStream(StreamID);
    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

// Process server stream
// Initializes the server stream and returns an array of received messages
//
// Parameters:
// Connection   - Arbitrary                - Existing connection or connection parameters       - conn
// Service      - String                   - Service name                                       - service
// Method       - String                   - Method name                                        - method
// Request      - Structure Of KeyAndValue - First request data                                 - data
// Timeout      - Number                   - Timeout for individual operation (in ms))          - tout
// Tls          - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings     - tls
// MessageCount - Number                   - Maximum messages to retrieve. Unlimited by default - count
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ProcessServerStream(Val Connection
    , Val Service
    , Val Method
    , Val Request
    , Val Timeout = 10000
    , Val Tls = Undefined
    , Val MessageCount = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    MessageCountDefined = MessageCount <> Undefined;

    If MessageCountDefined Then
        OPI_TypeConversion.GetNumber(MessageCount);
    EndIf;

    Initialization = InitializeStream("server", Connector, Service, Method, Request, Timeout);

    If Not Initialization["result"] Then
        Return Initialization;
    EndIf;

    StreamID      = Initialization["streamId"];
    MessagesArray = New Array;

    Counter = 0;
    While True Do

        If MessageCountDefined Then
            If Counter >= MessageCount Then
                Break;
            EndIf;
        EndIf;

        Error = ProcessNextMessage(Connector, StreamID, MessagesArray);

        If ValueIsFilled(Error) Then
            FinishTransfer(Connector, StreamID, CloseConnection);
            Return Error;
        EndIf;

        Counter = Counter + 1;

    EndDo;

    FinishTransfer(Connector, StreamID, CloseConnection);

    ResultMap = New Map;
    ResultMap.Insert("result", True);
    ResultMap.Insert("data"  , MessagesArray);

    Return ResultMap;

EndFunction

// Process client stream
// Initializes client thread, passes message array, and receives final response
//
// Parameters:
// Connection - Arbitrary                - Existing connection or connection parameters   - conn
// Service    - String                   - Service name                                   - service
// Method     - String                   - Method name                                    - method
// Requests   - Array of Structure       - Request data array or single request           - data
// Timeout    - Number                   - Timeout for individual operation (in ms))      - tout
// Tls        - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ProcessClientStream(Val Connection
    , Val Service
    , Val Method
    , Val Requests
    , Val Timeout = 10000
    , Val Tls = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    Initialization = InitializeStream("client", Connector, Service, Method, Undefined, Timeout);

    If Not Initialization["result"] Then
        Return Initialization;
    EndIf;

    OPI_TypeConversion.GetArray(Requests);

    StreamID = Initialization["streamId"];
    Counter  = 0;

    For Each Request In Requests Do

        CurrentSend = SendMessage(Connector, StreamID, Request);

        Counter = Counter + 1;

        If Not CurrentSend["result"] Then

            Error     = CurrentSend["error"];
            Obtaining = GetMessage(Connector, StreamID);

            ErrorMap = New Map;
            ErrorMap.Insert("result"         , False);
            ErrorMap.Insert("error"          , Error);
            ErrorMap.Insert("messages_sent"  , Counter);
            ErrorMap.Insert("final_retrieval", Obtaining);

            CloseStream(Connector, StreamID);

            If CloseConnection Then
                CloseConnection(Connector);
            EndIf;

            Return ErrorMap;

        EndIf;

    EndDo;

    ChannelClosing = CompleteSend(Connector, StreamID);

    Result = GetMessage(Connector, StreamID);
    Result.Insert("messages_sent" , Counter);
    Result.Insert("finish_sending", ChannelClosing);

    CloseStream(Connector, StreamID);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Process bidirectional stream
// Initializes a bidirectional stream, then passes and sends messages in the specified order
//
// Note:
// Example: Retrieving a message after every two sent messages and three more at the end (null in 1C = Undefined))^
// ExchangeOrder: `[{Message1}, {Message2}, null, {Message3}, ... {MessageN}, null, null, null, null, null]`
//
// Parameters:
// Connection        - Arbitrary                - Existing connection or connection parameters                  - conn
// Service           - String                   - Service name                                                  - service
// Method            - String                   - Method name                                                   - method
// ExchangeOrder     - Array Of Arbitrary       - Array of request data and Undefined where retrieval is needed - exch
// Timeout           - Number                   - Timeout for individual operation (in ms))                     - tout
// Tls               - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings                - tls
// ContinueReceiving - Boolean                  - Continue receiving after processing the exchange order        - cnt
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ProcessBidirectionalStream(Val Connection
    , Val Service
    , Val Method
    , Val ExchangeOrder
    , Val Timeout = 10000
    , Val Tls = Undefined
    , Val ContinueReceiving = True) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection, Tls);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    Initialization = InitializeStream("bidi", Connector, Service, Method, Undefined, Timeout);

    If Not Initialization["result"] Then
        Return Initialization;
    EndIf;

    OPI_TypeConversion.GetArray(ExchangeOrder);
    OPI_TypeConversion.GetBoolean(ContinueReceiving);

    StreamID      = Initialization["streamId"];
    ReceivedArray = New Array;

    For Each Action In ExchangeOrder Do

        ActionResult = PerformExchangeOperation(StreamID, Action, Connector, ReceivedArray);

        If ActionResult <> Undefined Then

            FinishTransfer(Connector, StreamID, CloseConnection);

            Return ActionResult;

        EndIf;

    EndDo;

    ChannelClosing = CompleteSend(Connector, StreamID);

    Result = New Map;
    Result.Insert("result"        , True);
    Result.Insert("finish_sending", ChannelClosing);

    If ContinueReceiving Then

        While True Do

            CurrentOperation = GetMessage(Connector, StreamID);

            If CurrentOperation["result"] Then
                ReceivedArray.Add(CurrentOperation["message"]);
            Else
                Result.Insert("final_retrieval", CurrentOperation);
                Break;
            EndIf;

        EndDo;

    EndIf;

    Result.Insert("data", ReceivedArray);

    CloseStream(Connector, StreamID);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

#EndRegion

#EndRegion

#Region Private

Procedure ClarifyRequestLimitError(Val Connection, Result)

    // A component build without a length check returns a protocol break instead of a limit error.
    If IsConnector(Connection) Or Not OPI_Tools.ThisIsCollection(Result, True) Then
        Return;
    EndIf;

    RequestLimit = OPI_Tools.GetOr(Connection, "max_encoding_message_size", 0);
    ErrorText    = Lower(String(OPI_Tools.GetOr(Result, "error", "")));

    If Not ValueIsFilled(RequestLimit) Or Result["result"] <> False Then
        Return;
    EndIf;

    If StrFind(ErrorText, "protocol error") = 0 Then
        Return;
    EndIf;

    Result.Insert("error"
        , "Error, encoded message length too large: the limit is: "
        + String(RequestLimit)
        + " bytes");

EndProcedure

Function SetTlsConnection(Connector, Val TLSSettings)

    Key   = ReadClientMaterial(TLSSettings, "client_key", "client_key_path");
    Chain = ReadClientMaterial(TLSSettings, "client_cert_chain", "client_cert_path");

    If ValueIsFilled(Key.error) Then
        Return TlsError(Key.error);
    EndIf;

    If ValueIsFilled(Chain.error) Then
        Return TlsError(Chain.error);
    EndIf;

    // Empty binary data in OneScript pass ValueIsFilled, so we check emptiness by size.
    EmptyKey = Key.data.Size() = 0;
    EmptyChain = Chain.data.Size() = 0;

    If EmptyKey <> EmptyChain Then
        Return TlsError("Client certificate chain and private key must both be provided for mTLS");
    EndIf;

    If Not EmptyKey And OPI_Tools.GetOr(TLSSettings, "use_tls", True) = False Then
        Return TlsError("Client certificate requires TLS");
    EndIf;

    Result = OPI_AddIns.SetTls(Connector, TLSSettings);

    If EmptyKey Or Not OPI_Tools.GetOr(Result, "result", False) Then
        Return Result;
    EndIf;

    KeyPath         = OPI_Tools.GetOr(TLSSettings, "client_key_path", "");
    CertificatePath = OPI_Tools.GetOr(TLSSettings, "client_cert_path", "");

    If Not ValueIsFilled(KeyPath) Then
        KeyPath = "";
    Else
        OPI_TypeConversion.GetLine(KeyPath);
    EndIf;

    If Not ValueIsFilled(CertificatePath) Then
        CertificatePath = "";
    Else
        OPI_TypeConversion.GetLine(CertificatePath);
    EndIf;

    Response = Connector.SetClientAuth(Key.data, Chain.data, KeyPath, CertificatePath);

    Return OPI_AddIns.DesrializeJanx(Response);

EndFunction

Function ReadClientMaterial(Val TLSSettings, Val DataName, Val PathName)

    Reading = New Structure("data,error", GetBinaryDataFromString(""), "");

    If Not ValueIsFilled(TLSSettings) Then
        Return Reading;
    EndIf;

    Data = OPI_Tools.GetOr(TLSSettings, DataName, Undefined);

    If TypeOf(Data)  = Type("BinaryData") And Data.Size() > 0 Then
        Reading.data = Data;
        Return Reading;
    EndIf;

    Path = OPI_Tools.GetOr(TLSSettings, PathName, "");

    If Not ValueIsFilled(Path) Then
        Return Reading;
    EndIf;

    OPI_TypeConversion.GetLine(Path);

    File = New File(Path);

    If Not File.Exists() Or Not File.IsFile() Then
        Reading.error = StrTemplate("Failed to read file: %1", Path);
        Return Reading;
    EndIf;

    Try
        Reading.data  = New BinaryData(Path);
    Except
        Reading.error = StrTemplate(
            "Failed to read file %1: %2",
            Path,
            BriefErrorDescription(ErrorInfo()));
    EndTry;

    Return Reading;

EndFunction

Function TlsError(Val Text)

    Error = New Map;
    Error.Insert("result", False);
    Error.Insert("error" , Text);

    Return Error;

EndFunction

Function SetProto(Connector, Val Parameters)

    ProtoSet = OPI_Tools.GetOr(Parameters, "proto", Undefined);

    If ProtoSet <> Undefined Then

        OPI_TypeConversion.GetKeyValueCollection(ProtoSet);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        For Each Proto In ProtoSet Do

            CurrentContent = Proto.Value;

            OPI_TypeConversion.GetLine(CurrentContent, True);

            Result = Connector.LoadProto(Proto.Key, CurrentContent);
            Result = OPI_AddIns.DesrializeJanx(Result);

            If Not Result["result"] Then
                Return Result;
            EndIf;

        EndDo;

        Result = Connector.CompileProtos();
        Result = OPI_AddIns.DesrializeJanx(Result);

    Else
        Result = New Structure("result", True);
    EndIf;

    Return Result;

EndFunction

Function FormCallString(Val AddIn
    , Val Service
    , Val Method
    , Val Timeout = Undefined
    , Val Request = Undefined)

    CallStructure = New Structure;
    OPI_Tools.AddField("service"   , Service , "String" , CallStructure);
    OPI_Tools.AddField("method"    , Method  , "String" , CallStructure);
    OPI_Tools.AddField("timeout_ms", Timeout , "Number" , CallStructure);

    ProcessedRequest = ProcessRequestBeforeSending(AddIn, Request);
    OPI_Tools.AddField("request", ProcessedRequest, "Current", CallStructure);

    Return CallStructure;

EndFunction

Function ProcessRequestBeforeSending(Val AddIn, Val Request)

    If Not ValueIsFilled(Request) Then
        Return Request;
    EndIf;

    OPI_TypeConversion.GetKeyValueCollection(Request);

    ProcessedRequest = New(TypeOf(Request));

    For Each CurrentElement In Request Do

        CurrentKey   = CurrentElement.Key;
        CurrentValue = ProcessValueForRequest(AddIn, CurrentElement.Value);

        ProcessedRequest.Insert(CurrentKey, CurrentValue);

    EndDo;

    Return ProcessedRequest;

EndFunction

Function InitializeStream(Val View
    , Val Connection
    , Val Service
    , Val Method
    , Val Request
    , Val Timeout = 10000)

    If Not IsConnector(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    CallStructure = FormCallString(Connection, Service, Method, Timeout, Request);
    BDCall        = OPI_AddIns.SerializeJanx(CallStructure);

    If View    = "client" Then
        Result = Connection.StartClientStream(BDCall);
    ElsIf View = "server" Then
        Result = Connection.StartServerStream(BDCall);
    Else
        Result = Connection.StartBidiStream(BDCall);
    EndIf;

    Result = OPI_AddIns.DesrializeJanx(Result);

    Return Result;

EndFunction

Function ProcessValueForRequest(Val AddIn, Value)

    If OPI_Tools.ThisIsCollection(Value, True) Then

        ProcessedValue = New(TypeOf(Value));

        For Each CollectionItem In Value Do

            CurrentKey   = CollectionItem.Key;
            CurrentValue = ProcessValueForRequest(AddIn, CollectionItem.Value);

            ProcessedValue.Insert(CurrentKey, CurrentValue);

        EndDo;

    ElsIf OPI_Tools.ThisIsCollection(Value) Then

        ProcessedValue = New Array;

        For Each CollectionItem In Value Do

            CurrentValue = ProcessValueForRequest(AddIn, CollectionItem);
            ProcessedValue.Add(CurrentValue);

        EndDo;

    Else

        ProcessedValue = Value;

    EndIf;

    Return ProcessedValue;

EndFunction

Function SaveSettingsAtAddIn(Connector, Val Parameters)

    ParametersString = OPI_AddIns.SerializeJanx(Parameters);
    SettingsSaving   = Connector.StoreSettings(ParametersString);

    Return SettingsSaving;

EndFunction

Function PerformExchangeOperation(Val StreamID, Val Action, Connector, ReceivedArray)

    IsRettrieve = Action = Undefined;

    If IsRettrieve Then
        CurrentOperation = GetMessage(Connector, StreamID);
    Else
        CurrentOperation = SendMessage(Connector, StreamID, Action);
    EndIf;

    If Not CurrentOperation["result"] Then

        Error = CurrentOperation["error"];

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , Error);
        ErrorMap.Insert("data"  , ReceivedArray);

        Return ErrorMap;

    Else

        If IsRettrieve Then
            ReceivedArray.Add(CurrentOperation["message"]);
        EndIf;

    EndIf;

    Return Undefined;

EndFunction

Function ProcessNextMessage(Val Connector, Val StreamID, MessagesArray)

    CurrentMessage = GetMessage(Connector, StreamID);

    If Not CurrentMessage["result"] Then

        Error = CurrentMessage["error"];

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , Error);
        ErrorMap.Insert("data"  , MessagesArray);

        Result = ErrorMap;

    Else

        MessageData = CurrentMessage["message"];
        MessagesArray.Add(MessageData);

        Result = Undefined;

    EndIf;

    Return Result;

EndFunction

Procedure FinishTransfer(Val Connector, Val StreamID, Val CloseConnection)

    CloseStream(Connector, StreamID);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

EndProcedure

#EndRegion

#EndIf // !OPI
