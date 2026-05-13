// OneScript: ./OInt/api/zeromq/Modules/OPI_ZeroMQ.os
// Lib: ZeroMQ
// CLI: none
// Keywords: zeromq, zmq

// DocsCategory: Exchange
// DocsNameRU: ZeroMQ
// DocsNameEN: ZeroMQ

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
// BSLLS:MagicNumber-off
// BSLLS:DuplicateStringLiteral-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Use "../../../tools/main"
#Use "../../../tools/http"

#Region Public

#Region ConnectionMethods

// Create connection (REQ)
// Create connection for sending request
//
// Parameters:
// Address - String - Receiver address - addr
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function CreateConnectionReq(Val Address) Export

    Result = InitializeConnector(Address, "ConnectReq");
    Return Result;

EndFunction

// Create connection (SUB)
// Create subscriber connection
//
// Parameters:
// Address - String - Receiver address - addr
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function CreateConnectionSub(Val Address) Export

    Result = InitializeConnector(Address, "ConnectSub");
    Return Result;

EndFunction

// Create connection (PUSH)
// Create connection for sending to pipeline
//
// Parameters:
// Address - String - Receiver address - addr
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function CreateConnectionPush(Val Address) Export

    Result = InitializeConnector(Address, "ConnectPush");
    Return Result;

EndFunction

// Create connection (PULL)
// Create connection for reading from pipeline
//
// Parameters:
// Address - String - Receiver address - addr
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function CreateConnectionPull(Val Address) Export

    Result = InitializeConnector(Address, "ConnectPull");
    Return Result;

EndFunction

#EndRegion

#Region ListeningMethods

// Bind port (REP)
// Bind port for incoming requests
//
// Parameters:
// Port - Number - Target port - port
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function BindPortRep(Val Port) Export

    Result = InitializeConnector(Port, "BindRep");
    Return Result;

EndFunction

// Bind port (PUB)
// Bind port for subscribers
//
// Parameters:
// Port - Number - Target port - port
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function BindPortPub(Val Port) Export

    Result = InitializeConnector(Port, "BindPub");
    Return Result;

EndFunction

// Bind port (PUSH)
// Bind pipeline port for sending data
//
// Parameters:
// Port - Number - Target port - port
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function BindPortPush(Val Port) Export

    Result = InitializeConnector(Port, "BindPush");
    Return Result;

EndFunction

// Bind port (PULL)
// Bind pipeline port for receiving data
//
// Parameters:
// Port - Number - Target port - port
//
// Returns:
// Map Of KeyAndValue, Arbitrary - AddIn object or map  with error information
Function BindPortPull(Val Port) Export

    Result = InitializeConnector(Port, "BindPull");
    Return Result;

EndFunction

#EndRegion

#Region InteractionMethods

// Send data
// Send data to connection
//
// Parameters:
// Connection - Arbitrary         - AddIn object with an open connection or port - conn
// Data       - BinaryData        - Sending data                                 - data
// Timeout    - Number, Undefined - Timeout (in ms). No timeout if undefined     - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function SendData(Val Connection, Val Data, Val Timeout = Undefined) Export

    If Not IsConnectorObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetBinaryData(Data, True);

    If Timeout = Undefined Then

        Timeout = -1;

    Else
        OPI_TypeConversion.GetNumber(Timeout);
    EndIf;

    Result = Connection.Send(Data, Timeout);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Receive data
// Receive next message from connection
//
// Parameters:
// Connection - Arbitrary         - AddIn object with an open connection or port - conn
// Timeout    - Number, Undefined - Timeout (in ms). No timeout if undefined     - tout
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ReceiveData(Val Connection, Val Timeout) Export

    If Not IsConnectorObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    If Timeout = Undefined Then

        Timeout = -1;

    Else
        OPI_TypeConversion.GetNumber(Timeout);
    EndIf;

    Result = Connection.Recv(Timeout);

    Result  = OPI_Tools.JsonToStructure(Result);
    DataKey = Undefined;

    If OPI_Tools.CollectionFieldExists(Result, "data", DataKey) Then
        Result["data"] = OPI_AddIns.ReceiveData(Connection, DataKey);
    EndIf;

    Return Result;

EndFunction

// Process request
// Sends a request and waits for a response within the specified time (for the REQ/REP scheme)
//
// Parameters:
// Connection       - Arbitrary         - AddIn object with open connection                  - conn
// Data             - BinaryData        - Sending data                                       - data
// SendingTimeout   - Number, Undefined - Sending timeout (in ms). No timeout if undefined   - treq
// ReceivingTimeout - Number, Undefined - Receiving timeout (in ms). No timeout if undefined - trep
//
// Returns:
// Map Of KeyAndValue - Processing result
Function ProcessRequest(Val Connection
    , Val Data
    , Val SendingTimeout = Undefined
    , Val ReceivingTimeout = Undefined) Export

    SendingResult = SendData(Connection, Data, SendingTimeout);

    If Not SendingResult["result"] Then
        Return SendingResult;
    EndIf;

    ReceivingResult = ReceiveData(Connection, ReceivingTimeout);

    Return ReceivingResult;

EndFunction

// Subscribe
// Subscribe to a topic in the PUB/SUB scheme
//
// Parameters:
// Connection - Arbitrary - AddIn object with an open connection or port   - conn
// Prefix     - String    - Required prefix (topic) of messages to receive - prefix
//
// Returns:
// Map Of KeyAndValue - Processing result
Function Subscribe(Val Connection, Val Prefix) Export

    If Not IsConnectorObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    OPI_TypeConversion.GetLine(Prefix);

    Result = Connection.Subscribe(Prefix);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Close connection
// Close previously created connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with an open connection or port - conn
//
// Returns:
// Map Of KeyAndValue - Processing result
Function CloseConnection(Val Connection) Export

    If Not IsConnectorObject(Connection) Then

        ErrorMap = New Map;
        ErrorMap.Insert("result", False);
        ErrorMap.Insert("error" , "Implicit connection opening is senseless in this case");

        Return ErrorMap;

    EndIf;

    Result = Connection.Close();
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Is client object !NOCLI
// Checks that the value is an object of the ZeroMQ AddIn
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnectorObject(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_ZeroMQ.ZeroMQ";

EndFunction

#EndRegion

#EndRegion

#Region Private

Function InitializeConnector(Val AddressPort, Val View)

    If StrStartsWith(View, "Connect") Then
        OPI_TypeConversion.GetLine(AddressPort);
        OPI_Tools.RestoreEscapeSequences(AddressPort);
    Else
        OPI_TypeConversion.GetNumber(AddressPort)
    EndIf;

    ZMQ = OPI_AddIns.GetAddIn("ZeroMQ");

    If View    = "ConnectReq" Then
        Result = ZMQ.ConnectReq(AddressPort);
    ElsIf View = "ConnectSub" Then
        Result = ZMQ.ConnectSub(AddressPort);
    ElsIf View = "ConnectPush" Then
        Result = ZMQ.ConnectPush(AddressPort);
    ElsIf View = "ConnectPull" Then
        Result = ZMQ.ConnectPull(AddressPort);
    ElsIf View = "BindRep" Then
        Result = ZMQ.BindRep(AddressPort);
    ElsIf View = "BindPub" Then
        Result = ZMQ.BindPub(AddressPort);
    ElsIf View = "BindPush" Then
        Result = ZMQ.BindPush(AddressPort);
    ElsIf View = "BindPull" Then
        Result = ZMQ.BindPull(AddressPort);
    EndIf;

    Result = OPI_Tools.JsonToStructure(Result);

    Return ?(Result["result"], ZMQ, Result);

EndFunction

#EndRegion

#Region Alternate

Function СоздатьСоединениеReq(Val Адрес) Export
    Return CreateConnectionReq(Адрес);
EndFunction

Function СоздатьСоединениеSub(Val Адрес) Export
    Return CreateConnectionSub(Адрес);
EndFunction

Function СоздатьСоединениеPush(Val Адрес) Export
    Return CreateConnectionPush(Адрес);
EndFunction

Function СоздатьСоединениеPull(Val Адрес) Export
    Return CreateConnectionPull(Адрес);
EndFunction

Function ОткрытьПортRep(Val Порт) Export
    Return BindPortRep(Порт);
EndFunction

Function ОткрытьПортPub(Val Порт) Export
    Return BindPortPub(Порт);
EndFunction

Function ОткрытьПортPush(Val Порт) Export
    Return BindPortPush(Порт);
EndFunction

Function ОткрытьПортPull(Val Порт) Export
    Return BindPortPull(Порт);
EndFunction

Function ОтправитьДанные(Val Соединение, Val Данные, Val Таймаут = Undefined) Export
    Return SendData(Соединение, Данные, Таймаут);
EndFunction

Function ПолучитьДанные(Val Соединение, Val Таймаут) Export
    Return ReceiveData(Соединение, Таймаут);
EndFunction

Function ОбработатьЗапрос(Val Соединение, Val Данные, Val ТаймаутОтправки = Undefined, Val ТаймаутПолучения = Undefined) Export
    Return ProcessRequest(Соединение, Данные, ТаймаутОтправки, ТаймаутПолучения);
EndFunction

Function Подписаться(Val Соединение, Val Префикс) Export
    Return Subscribe(Соединение, Префикс);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
    Return CloseConnection(Соединение);
EndFunction

Function ЭтоОбъектКоннектора(Val Значение) Export
    Return IsConnectorObject(Значение);
EndFunction

#EndRegion