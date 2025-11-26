// OneScript: ./OInt/core/Modules/OPI_TCP.os
// Lib: TCP
// CLI: tcp
// Keywords: tcp

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
// BSLLS:MagicNumber-off
// BSLLS:DuplicateStringLiteral-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Region Public

#Region ClientMethods

// Create connection !NOCLI
// Creates a TCP connection
//
// Parameters:
// Address - String - Address and port - address
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
// Proxy - Structure Of KeyAndValue - Proxy settings, if required. See GetProxySettings - proxy
//
// Returns:
// Map Of KeyAndValue, Arbitrary - Returns TCP client object on successful connection or error information
Function CreateConnection(Val Address, Val Tls = "", Val Proxy = "") Export

    OPI_TypeConversion.GetLine(Address);
    OPI_Tools.RestoreEscapeSequences(Address);

    TCPClient = OPI_AddIns.GetAddIn("TCPClient");
    Success   = TCPClient.SetAddress(Address);
    Success   = OPI_Tools.JsonToStructure(Success);

    If Not Success["result"] Then
        Return Success;
    EndIf;

    Tls = OPI_AddIns.SetTls(TCPClient, Tls);

    If Not OPI_Tools.GetOr(Tls, "result", False) Then
        Return Tls;
    EndIf;

    If ValueIsFilled(Proxy) Then

        OPI_TypeConversion.GetKeyValueCollection(Proxy);
        ProxtString = OPI_Tools.JSONString(Proxy);

        Setup = TCPClient.SetProxySettings(ProxtString);
        Setup = OPI_Tools.JsonToStructure(Setup);

        If Not OPI_Tools.GetOr(Setup, "result", False) Then
            Return Setup;
        EndIf;

    EndIf;

    Success = TCPClient.Connect();

    If Not Success Then
        Return GetLastError(TCPClient);
    EndIf;

    Return TCPClient;

EndFunction

// Close connection !NOCLI
// Explicitly closes a previously created connection
//
// Parameters:
// Connection - Arbitrary - Connection, See CreateConnection - tcp
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
// Connection - Arbitrary - Connection, See CreateConnection - tcp
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
// Connection - Arbitrary - Connection, See CreateConnection - tcp
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
// Connection - Arbitrary - Connection, See CreateConnection - tcp
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
// Connection - Arbitrary - Connection, See CreateConnection - tcp
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
// Tls - Structure Of KeyAndValue - TLS settings, if necessary. See GetTlsSettings - tls
// Proxy - Structure Of KeyAndValue - Proxy settings, if required. See GetProxySettings - proxy
//
// Returns:
// BinaryData, String - Response or error information
Function ProcessRequest(Val Address
    , Val Data = ""
    , Val ResponseString = True
    , Val Tls = ""
    , Val Proxy = "") Export

    OPI_TypeConversion.GetBinaryData(Data, True, False);
    OPI_TypeConversion.GetBoolean(ResponseString);

    Connection = CreateConnection(Address, Tls, Proxy);

    If Not OPI_AddIns.IsAddIn(Connection) Then
        Return Connection;
    EndIf;

    Result = SendBinaryData(Connection, Data);

    If Result Then

        Response = ReadBinaryData(Connection, , Chars.LF);

        If Not ValueIsFilled(Response) Then

            Error = GetLastError(Connection);

            If ValueIsFilled(Error) Then
                Response = OPI_Tools.JSONString(Error);
                Response = GetBinaryDataFromString(Response);
            EndIf;

        EndIf;

        Response = ?(ResponseString, GetStringFromBinaryData(Response), Response);

    Else

        Response = GetLastError(Connection);
        Response = ?(ValueIsFilled(Response), OPI_Tools.JSONString(Response), "OPI: Failed to send message");

        Response = ?(ResponseString, Response, GetBinaryDataFromString(Response));

    EndIf;

    CloseConnection(Connection);

    Return Response;

EndFunction

// Get last error !NOCLI
// Gets information about the last error in the connection
//
// Parameters:
// Connection - Arbitrary - Connection, See CreateConnection - tcp
//
// Returns:
// Map Of KeyAndValue, Undefined - Error information or undefined if there is no error
Function GetLastError(Val Connection) Export

    Result = Connection.GetLastError();

    If ValueIsFilled(Result) Then
        Result = OPI_Tools.JsonToStructure(Result);
    Else
        Result = Undefined;
    EndIf;

    Return Result;

EndFunction

// Get proxy settings
// Creates a structure of proxy server settings for the connection
//
// Parameters:
// Address - String - Proxy address - addr
// Port - Number - Proxy port - port
// View - String - Proxy type: socks5, socks4, http - type
// Login - String, Undefined - Authorization login, if required - login
// Password - String, Undefined - Authorization password, if required - pass
//
// Returns:
// Structure Of KeyAndValue - Proxy settings structure
Function GetProxySettings(Val Address
    , Val Port
    , Val View = "socks5"
    , Val Login = Undefined
    , Val Password = Undefined) Export

    //@skip-check constructor-function-return-section
    Return OPI_AddIns.GetProxySettings(Address, Port, View, Login, Password);

EndFunction

// Get TLS Settings
// Forms settings for using TLS
//
// Note
// Tls settings can only be set when a connection is created: explicitly, by using the `CreateConnection` function^^
// or implicit, when passing the connection string to the `ProcessRequest` method
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

#EndRegion

#Region Alternate

Function ОткрытьСоединение(Val Адрес, Val Tls = "", Val Прокси = "") Export
	Return CreateConnection(Адрес, Tls, Прокси);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
	Return CloseConnection(Соединение);
EndFunction

Function ПрочитатьДвоичныеДанные(Val Соединение, Val МаксимальныйРазмер = 0, Val Маркер = "", Val Таймаут = 5000) Export
	Return ReadBinaryData(Соединение, МаксимальныйРазмер, Маркер, Таймаут);
EndFunction

Function ПрочитатьСтроку(Val Соединение, Val Кодировка = "UTF-8", Val Маркер = "", Val Таймаут = 5000) Export
	Return ReadLine(Соединение, Кодировка, Маркер, Таймаут);
EndFunction

Function ОтправитьДвоичныеДанные(Val Соединение, Val Данные, Val Таймаут = 5000) Export
	Return SendBinaryData(Соединение, Данные, Таймаут);
EndFunction

Function ОтправитьСтроку(Val Соединение, Val Данные, Val Кодировка = "UTF-8", Val Таймаут = 5000) Export
	Return SendLine(Соединение, Данные, Кодировка, Таймаут);
EndFunction

Function ОбработатьЗапрос(Val Адрес, Val Данные = "", Val ОтветСтрокой = True, Val Tls = "", Val Прокси = "") Export
	Return ProcessRequest(Адрес, Данные, ОтветСтрокой, Tls, Прокси);
EndFunction

Function ПолучитьПоследнююОшибку(Val Соединение) Export
	Return GetLastError(Соединение);
EndFunction

Function ПолучитьНастройкиПрокси(Val Адрес, Val Порт, Val Вид = "socks5", Val Логин = Undefined, Val Пароль = Undefined) Export
	Return GetProxySettings(Адрес, Порт, Вид, Логин, Пароль);
EndFunction

Function ПолучитьНастройкиTls(Val ОтключитьПроверкуСертификатов, Val ПутьКСертификату = "") Export
	Return GetTlsSettings(ОтключитьПроверкуСертификатов, ПутьКСертификату);
EndFunction

#EndRegion