// OneScript: ./OInt/core/Modules/OPI_TCP.os
// Lib: TCP
// CLI: tcp

// MIT License

// Copyright (c) 2023 Anton Tsitavets

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Uncomment if OneScript is executed
#Use "../../tools"

#Region Public

#Region TCPClient

// !NOCLI
// Create Connection
// Creates a TCP connection
//
// Parameters:
// Address - String - Address and port - address
//
// Returns:
// Undefined, Arbitrary - Returns the TCP client object on successful connection or undefined
Function CreateConnection(Val Address) Export

    OPI_TypeConversion.GetLine(Address);

    TCPClient = OPI_Tools.GetAddIn("TCPClient");

    TCPClient.Address = Address;

    Success = TCPClient.Connect();

    Return ?(Success, TCPClient, Undefined);

EndFunction

// !NOCLI
// Close connection
// Explicitly closes a previously created connection
//
// Parameters:
// Connection - Arbitrary - Connection, see. CreateConnection - tcp
//
// Returns:
// Boolean - always return True
Function CloseConnection(Val Connection) Export
    Return Connection.Disconnect();
EndFunction

// !NOCLI
// Read binary data
// Reads data from the specified connection
//
// Note
// When working with an infinite stream of incoming data, it is obligatory to specify the MaxSize parameter, because^^
// endless data retrieval can cause hang-ups
// If the connection is closed, an error occurs, or EOF is detected, the read is terminated in either case
//
// Parameters:
// Connection - Arbitrary - Connection, see. CreateConnection - tcp
// MaxSize - Number - Maximum data size (bytes). 0 > no limit - size
// Marker - String, BinaryData - End of message marker. Empty > without marker - marker
// Timeout - Number - Data waiting timeout (ms). 0 > no limit - timeout
//
// Returns:
// BinaryData - Received data
Function ReadBinaryData(Val Connection
    , Val MaxSize = 0
    , Val Marker = ""
    , Val Timeout = 5000) Export

    OPI_TypeConversion.GetNumber(Timeout);
    OPI_TypeConversion.GetNumber(MaxSize);

    If TypeOf(Marker) = Type("String") Then
        Marker           = ПолучитьДвоичныеДанныеИзСтроки(Marker);
    Else
        OPI_TypeConversion.GetBinaryData(Marker);
    EndIf;

    Data = Connection.Read(MaxSize, Marker, Timeout);

    Return Data;

EndFunction

// !NOCLI
// Read line
// Reads data from the specified connection as a string
//
// Note
// If the connection is closed, an error occurs, or EOF is detected, the read is terminated in either case
//
// Parameters:
// Connection - Arbitrary - Connection, see. CreateConnection - tcp
// Encoding - String - Encoding of data conversion to string - enc
// Marker - String, BinaryData - End of message marker. Empty > without marker - marker
// Timeout - Number - Data waiting timeout (ms). 0 > no limit - timeout
//
// Returns:
// String - Received data as string
Function ReadLine(Val Connection
    , Val Encoding = "UTF-8"
    , Val Marker = ""
    , Val Timeout = 5000) Export

    OPI_TypeConversion.GetLine(Encoding);

    Data = ReadBinaryData(Connection, , Marker, Timeout);
    Data = ПолучитьСтрокуИзДвоичныхДанных(Data, Encoding);

    Return Data;

EndFunction

// !NOCLI
// Send binary data
// Sends binary data over the specified connection
//
// Parameters:
// Connection - Arbitrary - Connection, see. CreateConnection - tcp
// Data - BinaryData - Sending data - data
// Timeout - Number - Data reading timeout (ms). 0 > no limit - timeout
//
// Returns:
// Boolean - Flag of successful delivery
Function SendBinaryData(Val Connection, Val Data, Val Timeout = 5000) Export

    OPI_TypeConversion.GetBinaryData(Data);
    OPI_TypeConversion.GetNumber(Timeout);

    Result = Connection.Send(Data, Timeout);

    Return Result;

EndFunction

// !NOCLI
// Send line
// Sends data as a string over the specified connection
//
// Parameters:
// Connection - Arbitrary - Connection, see. CreateConnection - tcp
// Data - String - Data to be sent as a string - data
// Encoding - String - Encoding for writing the outgoing string to the stream - enc
// Timeout - Number - Data reading timeout (ms). 0 > no limit - timeout
//
// Returns:
// Boolean - Flag of successful delivery
Function SendLine(Val Connection, Val Data, Val Encoding = "UTF-8", Val Timeout = 5000) Export

    OPI_TypeConversion.GetLine(Data);
    OPI_TypeConversion.GetLine(Encoding);

    DataBD = ПолучитьДвоичныеДанныеИзСтроки(Data, Encoding);

    Result = SendBinaryData(Connection, DataBD, Timeout);

    Return Result;

EndFunction


// Connect and receive data
// Establishes a connection and reads data until completion or by limits
//
// Note
// When working with an infinite stream of incoming data, it is obligatory to specify the MaxSize parameter, because^^
// endless data retrieval can cause hang-ups
// If the connection is closed, an error occurs, or EOF is detected, the read is terminated in either case
//
// Parameters:
// Address - String - Address and port - address
// MaxSize - Number - Maximum data size. 0 > no limit - size
// Timeout - Number - Data reading timeout - timeout
// AsString - Boolean - True > returns string, False > binary data - string
// Encoding - String - Encoding of received data - enc
//
// Returns:
// String, BinaryData - Received data
Function ConnectAndReceiveData(Val Address
    , Val MaxSize = 0
    , Val Timeout = 5000
    , Val AsString = True
    , Val Encoding = "UTF-8") Export

    OPI_TypeConversion.GetBoolean(AsString);
    OPI_TypeConversion.GetLine(Encoding);

    Connection = CreateConnection(Address);

    If Not ValueIsFilled(Connection) Then
        Raise "Failed to create Connection";
    EndIf;

    Message = ReadBinaryData(Connection, MaxSize, Timeout);

    If AsString Then
        Message = ПолучитьСтрокуИзДвоичныхДанных(Message, Encoding);
    EndIf;

    CloseConnection(Connection);

    Return Message;

EndFunction

#EndRegion

#EndRegion
