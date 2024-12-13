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
// Creates a TCP/TLS connection
//
// Parameters:
// Address - String - Address and port - address
// SSL - Boolean - Flag for using a secure connection - ssl
//
// Returns:
// Undefined, Arbitrary - Returns the TCP client object on successful connection or undefined
Function CreateConnection(Val Address, Val SSL = False) Export

    OPI_TypeConversion.GetLine(Address);
    OPI_TypeConversion.GetBoolean(SSL);

    TCPClient = OPI_Tools.GetAddIn("TCPClient");

    TCPClient.Address = Address;
    TCPClient.SSL     = SSL;

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
// Receive data
// Reads data from the specified connection
//
// Note
// The method tries to read the data in intervals, the duration of which is specified in the AttemptDuration parameter.^^
// The Attempts parameter is responsible for the maximum number of attempts. If the new data is successfully received, the number of attempts is reset.
// When working with an infinite stream of incoming data, it is obligatory to specify the MaxSize parameter, because^^
// infinite resetting of attempts when receiving data can lead to hangs
// If the connection is closed, an error occurs, or EOF is detected, the read is terminated in either case
//
// Parameters:
// Connection - Arbitrary - Connection, see. CreateConnection - tcp
// AttemptDuration - Number - Interval between data retrieval attempts - timeout
// Attempts - Number - Max number of data retrieval attempts - attempts
// MaxSize - Number - Maximum data size. 0 > no limit - size
//
// Returns:
// BinaryData - Received data
Function ReceiveData(Val Connection
    , Val AttemptDuration = 200
    , Val Attempts = 5
    , Val MaxSize = 0) Export

    OPI_TypeConversion.GetNumber(AttemptDuration);
    OPI_TypeConversion.GetNumber(Attempts);
    OPI_TypeConversion.GetNumber(MaxSize);

    Return Connection.Read(AttemptDuration, Attempts, MaxSize);

EndFunction

// Connect and receive data
// Establishes a connection and reads data until completion or by limits
//
// Note
// The method tries to read the data in intervals, the duration of which is specified in the AttemptDuration parameter.^^
// The Attempts parameter is responsible for the maximum number of attempts. If the new data is successfully received, the number of attempts is reset.
// When working with an infinite stream of incoming data, it is obligatory to specify the MaxSize parameter, because^^
// infinite resetting of attempts when receiving data can lead to hangs
// If the connection is closed, an error occurs, or EOF is detected, the read is terminated in either case
//
// Parameters:
// Address - String - Address and port - address
// SSL - Boolean - Flag for using a secure connection - ssl
// AttemptDuration - Number - Interval between data retrieval attempts - timeout
// Attempts - Number - Max number of data retrieval attempts - attempts
// MaxSize - Number - Maximum data size. 0 > no limit - size
// AsString - Boolean - True > returns string, False > binary data - string
// Encoding - String - Encoding of received data - enc
//
// Returns:
// String, BinaryData - Received data
Function ConnectAndReceiveData(Val Address
    , Val SSL = False
    , Val AttemptDuration = 0
    , Val Attempts = 5
    , Val MaxSize = 0
    , Val AsString = True
    , Val Encoding = "UTF-8") Export

    OPI_TypeConversion.GetBoolean(AsString);
    OPI_TypeConversion.GetLine(Encoding);

    Connection = CreateConnection(Address, SSL);

    If Not ValueIsFilled(Connection) Then
        Raise "Failed to create Connection";
    EndIf;

    Message = ReceiveData(Connection, AttemptDuration, Attempts, MaxSize);

    If AsString Then
        Message = ПолучитьСтрокуИзДвоичныхДанных(Message);
    EndIf;

    CloseConnection(Connection);

    Return Message;

EndFunction

#EndRegion

#EndRegion
