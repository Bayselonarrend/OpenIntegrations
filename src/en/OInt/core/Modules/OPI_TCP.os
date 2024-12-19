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

// Create Connection !NOCLI
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

// Close connection !NOCLI
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

// Read binary data !NOCLI
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
        Marker        = ПолучитьДвоичныеДанныеИзСтроки(Marker);
    Else
        OPI_TypeConversion.GetBinaryData(Marker);
    EndIf;

    Data = Connection.Read(MaxSize, Marker, Timeout);

    Return Data;

EndFunction

// Read line !NOCLI
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

// Send binary data !NOCLI
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

// Send line !NOCLI
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

// ProcessRequest
// Sends a single request to a specified address and receives a response using the default settings
//
// Parameters:
// Address - String - Address and port - address
// Data - String, BinaryData - Data or text to be sent - data
// ResponseString - Boolean - An attribute of receiving the response as a string - string
//
// Returns:
// BinaryData, String - Response
Function ProcessRequest(Val Address, Val Data = "", Val ResponseString = True) Export

    OPI_TypeConversion.GetBinaryData(Data, True, False);
    OPI_TypeConversion.GetBoolean(ResponseString);

    Connection = CreateConnection(Address);
    Result     = SendBinaryData(Connection, Data);

    If Result Then

        Response = ReadBinaryData(Connection, , Chars.LF);
        Response = ?(ResponseString, ПолучитьСтрокуИзДвоичныхДанных(Response), Response);

    Else

        Response = "OPI: Failed to send message";
        Response = ?(ResponseString, Response, ПолучитьДвоичныеДанныеИзСтроки(Response));

    EndIf;

    CloseConnection(Connection);

    Return Response;

EndFunction

#EndRegion

#EndRegion
