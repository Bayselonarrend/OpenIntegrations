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
// #Use "../../tools"

#Region Public

#Region ClientMethods

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

    TCPClient = AttachAddInOnServer("OPI_TCPClient");

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
        Marker        = GetBinaryDataFromString(Marker);
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
    Data = GetStringFromBinaryData(Data, Encoding);

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

    DataBD = GetBinaryDataFromString(Data, Encoding);

    Result = SendBinaryData(Connection, DataBD, Timeout);

    Return Result;

EndFunction

// Process request
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
        Response = ?(ResponseString, GetStringFromBinaryData(Response), Response);

    Else

        Response = "OPI: Failed to send message";
        Response = ?(ResponseString, Response, GetBinaryDataFromString(Response));

    EndIf;

    CloseConnection(Connection);

    Return Response;

EndFunction

#EndRegion

#Region ServerMethods

// Create server !NOCLI
// Creates a new TCP server and sets the port
//
// Parameters:
// Port - Number - Available port number for the server - port
// Start - Boolean - True > immediately starts the created server - start
//
// Returns:
// Arbitrary - Returns a running TCP server object on successful creation or a structure with an error description
Function CreateServer(Val Port, Start = False) Export

    OPI_TypeConversion.GetNumber(Port);
    OPI_TypeConversion.GetBoolean(Start);

    TCPServer      = AttachAddInOnServer("OPI_TCPServer");
    TCPServer.Port = Port;

    If Start Then
        Result = StartServer(TCPServer);

        Success    = Undefined;
        FlagExists = OPI_Tools.CollectionFieldExists(Result, "result", Success);
        Success    = ?(FlagExists, Success, False);

        Return ?(Success, TCPServer, Result);

    Else
        Return TCPServer;
    EndIf;

EndFunction

// Start server !NOCLI
// Starts a previously created server
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
//
// Returns:
// Structure Of KeyAndValue - Structure with information about the startup success
Function StartServer(Val TCPServer) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    Result = TCPServer.Start();

    ProcessResult(Result);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Awaiting connection !NOCLI
// Blocks programm execution until a new connection is established
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
// Timeout - Number - Maximum waiting time for connections. 0 > unlimited - timeout
//
// Returns:
// Structure Of KeyAndValue - Structure with new connection ID or error information
Function AwaitingConnection(Val TCPServer, Val Timeout = 0) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    OPI_TypeConversion.GetNumber(Timeout);

    Result = TCPServer.Wait(Timeout);

    ProcessResult(Result);

    Return Result;

EndFunction

// Receive data !NOCLI
// Gets data from the flow stream of an existing connection
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
// ConnectionID - String, Number - Active connection ID. See AwaitingConnection - conn
// MaxSize - Number - Max data size. 0 > to the end of the stream - maxsize
//
// Returns:
// Structure Of KeyAndValue, BinaryData - Binary data on success or structure with error description
Function ReceiveData(Val TCPServer, Val ConnectionID, Val MaxSize = 0) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionID);
    OPI_TypeConversion.GetNumber(MaxSize);

    Data = TCPServer.Receive(ConnectionID, MaxSize);

    If TypeOf(Data) = Type("String") Then
        Try
            Result  = OPI_Tools.JsonToStructure(Data, False);
        Except
            Result  = New Structure("result,error", False, Data);
        EndTry;

    Else
        Result = Data;
    EndIf;

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Send data !NOCLI
// Sends data to the client by connection ID
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
// ConnectionID - String, Number - Active connection ID. See AwaitingConnection - conn
// Data - BinaryData - Sending data - data
//
// Returns:
// Structure Of KeyAndValue - Execution information
Function SendData(Val TCPServer, Val ConnectionID, Val Data) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionID);
    OPI_TypeConversion.GetBinaryData(Data);

    Result = TCPServer.Send(ConnectionID, Data);

    ProcessResult(Result);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Stop server !NOCLI
// Stops a running server
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
//
// Returns:
// Structure Of KeyAndValue - Execution information
Function StopServer(Val TCPServer) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    Result = TCPServer.Stop();

    ProcessResult(Result);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Close incoming connection !NOCLI
// Closes an existing connection by identifier
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
// ConnectionID - String, Number - Active connection ID. See AwaitingConnection - conn
//
// Returns:
// Structure Of KeyAndValue - Execution information
Function CloseIncomingConnection(Val TCPServer, Val ConnectionID) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionID);

    Result = TCPServer.Close(ConnectionID);

    ProcessResult(Result);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Get incoming connections !NOCLI
// Gets the list of connections in the pool
//
// Note
// The presence of a connection in the pool does not guarantee that it is active.^^
// The ActualiseIncomingConnections function is used to clear the pool of inactive connections
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
//
// Returns:
// Structure Of KeyAndValue - Execution information
Function GetIncomingConnections(Val TCPServer) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    Result = TCPServer.ListConnections();

    ProcessResult(Result);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Actualise incoming connections
// Removes inactive connections from the pool
//
// Parameters:
// TCPServer - Arbitrary - TCP server. See CreateServer - srv
//
// Returns:
// Structure Of KeyAndValue - Execution information
Function ActualiseIncomingConnections(Val TCPServer) Export

    If Not IsServer(TCPServer) Then
        Raise "The passed value is not a TCP server!";
    EndIf;

    Result = TCPServer.UpdateConnections();

    ProcessResult(Result);

    //@skip-check constructor-function-return-section
    Return Result;

EndFunction

// Is server !NOCLI
// Specifies if the value passed is a TCP server object
//
// Parameters:
// Value - Arbitrary - arbitrary value to check - value
//
// Returns:
// Boolean - Is server
Function IsServer(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_TCPServer.Main";

EndFunction

#EndRegion

#EndRegion

#Region Private

Function AttachAddInOnServer(Val AddInName, Val Class = "Main")

    If OPI_Tools.IsOneScript() Then
        TemplateName = OPI_Tools.AddInsFolderOS() + AddInName + ".zip";
    Else
        TemplateName = "CommonTemplate." + AddInName;
    EndIf;

    AttachAddIn(TemplateName, AddInName, AddInType.Native);

    AddIn = New("AddIn." + AddInName + "." + Class);
    Return AddIn;

EndFunction

Procedure ProcessResult(Result)

    Try
        Result = OPI_Tools.JsonToStructure(Result, False);
    Except
        Result = New Structure("result,error", False, Result);
    EndTry;

EndProcedure

#EndRegion
