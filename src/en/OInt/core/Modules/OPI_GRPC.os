// OneScript: ./OInt/core/Modules/OPI_GRPC.os
// Lib: GRPC
// CLI: grpc
// Keywords: grpc

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
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#Region Public

#Region CommonMethods

// Create connection !NOCLI
// Opens a gRPC connection
//
// Parameters:
// Parameters - String - Connection parameters. See GetConnectionParameters - params
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
//
// Returns:
// Arbitrary - Client object or map with error information
Function CreateConnection(Val Parameters, Val Tls = Undefined) Export

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

    Tls = OPI_AddIns.SetTls(Connector, Tls);

    If Not OPI_Tools.GetOr(Tls, "result", False) Then
        Return Tls;
    EndIf;

    Result = Connector.Connect();
    Result = OPI_Tools.JSONToStructure(Result);

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
        Result = OPI_Tools.JsonToStructure(Result, False);

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
// Connection - Arbitrary - Existing connection - conn
// Metadata - Structure Of KeyAndValue - Metadata list - meta
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

    MetadataAsString = OPI_Tools.JSONString(Metadata);

    Result = Connection.SetMetadata(MetadataAsString);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Invoke method
// Performs a unary request to the selected service
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection parameters - conn
// Service - String - Service name - service
// Method - String - Method name - method
// Request - Structure Of KeyAndValue - Request data - data
// Timeout - Number - Timeout (in ms) - tout
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
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

    CallStructureAsString = FormCallString(Connector, Service, Method, Timeout, Request);

    Result = Connector.Call(CallStructureAsString);
    Result = OPI_Tools.JsonToStructure(Result);

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
// `{"main.proto": passed value}`
//
// Parameters:
// Address - String - Connection address (with protocol) - addr
// Proto - Arbitrary - Schema or schema structure: Key > file name (for import), Value > schema as a string or file path - proto
// Metadata - Structure Of KeyAndValue - Metadata structure, if necessary - meta
//
// Returns:
// Structure Of KeyAndValue - Connection parameters
Function GetConnectionParameters(Val Address, Val Proto = Undefined, Val Metadata = Undefined) Export

    ConnectionParams = New Structure;
    OPI_Tools.AddField("address", Address, "String", ConnectionParams);

    If ValueIsFilled(Metadata) Then
        OPI_TypeConversion.GetKeyValueCollection(Metadata);
        ConnectionParams.Insert("metadata", Metadata);
    EndIf;

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
// or implicit, when passing settings
//
// Parameters:
// DisableCertVerification - Boolean - Allows to work with invalid certificates, including self signed - trust
// CertFilepath - String - Path to the root PEM file of the certificate if it is not in the system repository - cert
//
// Returns:
// Structure Of KeyAndValue - Structure of TLS connection settings
Function GetTlsSettings(Val DisableCertVerification, Val CertFilepath = "") Export

    Return OPI_AddIns.GetTlsSettings(DisableCertVerification, CertFilepath);

EndFunction

#EndRegion

#Region Introspection

// Get service list
// Gets a list of available services
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection parameters - conn
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
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
    Result = OPI_Tools.JsonToStructure(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Get method list
// Gets a list of available methods for the specified service
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection parameters - conn
// Service - String - Service name - service
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
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
    Result = OPI_Tools.JsonToStructure(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

// Get method
// Get method information
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection parameters - conn
// Service - String - Service name - service
// Method - String - Method name - method
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
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
    Result = OPI_Tools.JsonToStructure(Result);

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
// Connection - Arbitrary - Connection object - conn
// Service - String - Service name - service
// Method - String - Method name - method
// Request - Structure Of KeyAndValue - Client request data - data
// Timeout - Number - Timeout (in ms) - tout
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
// Service - String - Service name - service
// Method - String - Method name - method
// Timeout - Number - Timeout (in ms) - tout
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
// Service - String - Service name - service
// Method - String - Method name - method
// Timeout - Number - Timeout (in ms) - tout
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
// Connection - Arbitrary - Connection object - conn
// StreamID - String - Stream Identifier - stream
// Request - Structure Of KeyAndValue - Request data for sending - data
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
    ProcessedRequest = OPI_Tools.JSONString(ProcessedRequest);

    Result = Connection.SendMessage(StreamID, ProcessedRequest);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Get message !NOCLI
// Gets the next message from the stream
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID - String - Stream Identifier - stream
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

    Result = Connection.GetNextMessage(StreamID);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Complete send !NOCLI
// Closes the sending channel in a client or bidirectional stream
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID - String - Stream Identifier - stream
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
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Close stream !NOCLI
// Close stream by ID
//
// Parameters:
// Connection - Arbitrary - Connection object - conn
// StreamID - String - Stream Identifier - stream
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
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Process server stream
// Initializes the server stream and returns an array of received messages
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection parameters - conn
// Service - String - Service name - service
// Method - String - Method name - method
// Request - Structure Of KeyAndValue - First request data - data
// Timeout - Number - Timeout for individual operation (in ms)) - tout
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
// MessageCount - Number - Maximum messages to retrieve. Unlimited by default - count
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

        CurrentMessage = GetMessage(Connector, StreamID);

        If Not CurrentMessage["result"] Then

            Error = CurrentMessage["error"];

            ErrorMap = New Map;
            ErrorMap.Insert("result", False);
            ErrorMap.Insert("error" , Error);
            ErrorMap.Insert("data"  , MessagesArray);

        Else

            MessageData = CurrentMessage["message"];
            MessagesArray.Add(MessageData);

        EndIf;

        Counter = Counter + 1;

    EndDo;

    CloseStream(Connector, StreamID);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    ResultMap = New Map;
    ResultMap.Insert("result", True);
    ResultMap.Insert("data"  , MessagesArray);

    Return ResultMap;

EndFunction

// Process client stream
// Initializes client thread, passes message array, and receives final response
//
// Parameters:
// Connection - Arbitrary - Existing connection or connection parameters - conn
// Service - String - Service name - service
// Method - String - Method name - method
// Requests - Array of Structure - Request data array or single request - data
// Timeout - Number - Timeout for individual operation (in ms)) - tout
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
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
// Connection - Arbitrary - Existing connection or connection parameters - conn
// Service - String - Service name - service
// Method - String - Method name - method
// ExchangeOrder - Array Of Arbitrary - Array of request data and Undefined where retrieval is needed - exch
// Timeout - Number - Timeout for individual operation (in ms)) - tout
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
// ContinueReceiving - Boolean - Continue receiving after processing the exchange order - cnt
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

        Else

            If IsRettrieve Then
                ReceivedArray.Add(CurrentOperation["message"]);
            EndIf;

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

Function SetProto(Connector, Val Parameters)

    ProtoSet = OPI_Tools.GetOr(Parameters, "proto", Undefined);

    If ProtoSet <> Undefined Then

        OPI_TypeConversion.GetKeyValueCollection(ProtoSet);

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        For Each Proto In ProtoSet Do

            CurrentContent = Proto.Value;

            OPI_TypeConversion.GetLine(CurrentContent, True);

            Result = Connector.LoadProto(Proto.Key, CurrentContent);
            Result = OPI_Tools.JSONToStructure(Result);

            If Not Result["result"] Then
                Return Result;
            EndIf;

        EndDo;

        Result = Connector.CompileProtos();
        Result = OPI_Tools.JSONToStructure(Result);

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

    CallStructureAsString = OPI_Tools.JSONString(CallStructure);

    Return CallStructureAsString;

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

    CallStructureAsString = FormCallString(Connection, Service, Method, Timeout, Request);

    If View    = "client" Then
        Result = Connection.StartClientStream(CallStructureAsString);
    ElsIf View = "server" Then
        Result = Connection.StartServerStream(CallStructureAsString);
    Else
        Result = Connection.StartBidiStream(CallStructureAsString);
    EndIf;

    Result = OPI_Tools.JsonToStructure(Result);

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

    ElsIf TypeOf(Value) = Type("BinaryData") Then

        Result = OPI_AddIns.PutData(AddIn, Value);

        If Not Result["result"] Then
            Raise StrTemplate("Binary data transfer error: %1", Result["error"]);
        EndIf;

        ProcessedValue = Result["key"];

    Else

        ProcessedValue = Value;

    EndIf;

    Return ProcessedValue;

EndFunction

Function SaveSettingsAtAddIn(Connector, Val Parameters)

    ParametersString = OPI_Tools.JSONString(Parameters);
    SettingsSaving   = Connector.StoreSettings(ParametersString);

    Return SettingsSaving;

EndFunction

#EndRegion

#Region Alternate

Function ОткрытьСоединение(Val Параметры, Val Tls = Undefined) Export
	Return CreateConnection(Параметры, Tls);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
	Return CloseConnection(Соединение);
EndFunction

Function УстановитьМетаданные(Val Соединение, Val Метаданные) Export
	Return SetMetadata(Соединение, Метаданные);
EndFunction

Function ВызватьМетод(Val Соединение, Val Сервис, Val Метод, Val Запрос = Undefined, Val Таймаут = 10000, Val Tls = Undefined) Export
	Return ExecuteMethod(Соединение, Сервис, Метод, Запрос, Таймаут, Tls);
EndFunction

Function ЭтоКоннектор(Val Значение) Export
	Return IsConnector(Значение);
EndFunction

Function ПолучитьПараметрыСоединения(Val Адрес, Val Proto = Undefined, Val Метаданные = Undefined) Export
	Return GetConnectionParameters(Адрес, Proto, Метаданные);
EndFunction

Function ПолучитьНастройкиTls(Val ОтключитьПроверкуСертификатов, Val ПутьКСертификату = "") Export
	Return GetTlsSettings(ОтключитьПроверкуСертификатов, ПутьКСертификату);
EndFunction

Function ПолучитьСписокСервисов(Val Соединение, Val Tls = Undefined) Export
	Return GetServiceList(Соединение, Tls);
EndFunction

Function ПолучитьСписокМетодов(Val Соединение, Val Сервис, Val Tls = Undefined) Export
	Return GetMethodList(Соединение, Сервис, Tls);
EndFunction

Function ПолучитьМетод(Val Соединение, Val Сервис, Val Метод, Val Tls = Undefined) Export
	Return GetMethod(Соединение, Сервис, Метод, Tls);
EndFunction

Function ИнициализироватьСерверныйПоток(Val Соединение, Val Сервис, Val Метод, Val Запрос, Val Таймаут = 10000) Export
	Return InitializeServerStream(Соединение, Сервис, Метод, Запрос, Таймаут);
EndFunction

Function ИнициализироватьКлиентскийПоток(Val Соединение, Val Сервис, Val Метод, Val Таймаут = 10000) Export
	Return InitializeClientStream(Соединение, Сервис, Метод, Таймаут);
EndFunction

Function ИнициализироватьДвунаправленныйПоток(Val Соединение, Val Сервис, Val Метод, Val Таймаут = 10000) Export
	Return InitializeBidirectionalStream(Соединение, Сервис, Метод, Таймаут);
EndFunction

Function ОтправитьСообщение(Val Соединение, Val IDПотока, Val Запрос) Export
	Return SendMessage(Соединение, IDПотока, Запрос);
EndFunction

Function ПолучитьСообщение(Val Соединение, Val IDПотока) Export
	Return GetMessage(Соединение, IDПотока);
EndFunction

Function ЗавершитьОтправку(Val Соединение, Val IDПотока) Export
	Return CompleteSend(Соединение, IDПотока);
EndFunction

Function ЗакрытьПоток(Val Соединение, Val IDПотока) Export
	Return CloseStream(Соединение, IDПотока);
EndFunction

Function ОбработатьСерверныйПоток(Val Соединение, Val Сервис, Val Метод, Val Запрос, Val Таймаут = 10000, Val Tls = Undefined, Val ЧислоСообщений = Undefined) Export
	Return ProcessServerStream(Соединение, Сервис, Метод, Запрос, Таймаут, Tls, ЧислоСообщений);
EndFunction

Function ОбработатьКлиентскийПоток(Val Соединение, Val Сервис, Val Метод, Val Запросы, Val Таймаут = 10000, Val Tls = Undefined) Export
	Return ProcessClientStream(Соединение, Сервис, Метод, Запросы, Таймаут, Tls);
EndFunction

Function ОбработатьДвунаправленныйПоток(Val Соединение, Val Сервис, Val Метод, Val ПорядокОбмена, Val Таймаут = 10000, Val Tls = Undefined, Val ПродолжатьПолучение = True) Export
	Return ProcessBidirectionalStream(Соединение, Сервис, Метод, ПорядокОбмена, Таймаут, Tls, ПродолжатьПолучение);
EndFunction

#EndRegion