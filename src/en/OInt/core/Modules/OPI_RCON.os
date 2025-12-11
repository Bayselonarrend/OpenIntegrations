// OneScript: ./OInt/core/Modules/OPI_RCON.os
// Lib: RCON
// CLI: rcon
// Keywords: rcon, remote console

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Region Public

#Region CommandsExecution

// Create connection !NOCLI
// Opens a new RCON connection
//
// Parameters:
// ConnectionParams - Structure Of KeyAndValue - Connection parameters. See FormConnectionParameters - params
//
// Returns:
// Arbitrary - Connector object or structure with error information
Function CreateConnection(Val ConnectionParams) Export

    If IsConnector(ConnectionParams) Then
        Return ConnectionParams;
    EndIf;

    OPI_TypeConversion.GetKeyValueCollection(ConnectionParams);

    RequiredArray = StrSplit("url,password,read_timeout,write_timeout", ",");
    MissingArray  = OPI_Tools.FindMissingCollectionFields(ConnectionParams, RequiredArray);

    If ValueIsFilled(MissingArray) Then
        Raise StrTemplate("Missing connection parameters: %1", StrConcat(MissingArray, ", "));
    EndIf;

    Connector = OPI_AddIns.GetAddIn("RCON");

    URL          = ConnectionParams["url"];
    Password     = ConnectionParams["password"];
    ReadTimeout  = ConnectionParams["read_timeout"];
    WriteTimeout = ConnectionParams["write_timeout"];

    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(Password);
    OPI_TypeConversion.GetNumber(ReadTimeout);
    OPI_TypeConversion.GetNumber(WriteTimeout);

    Result = Connector.Connect(URL, Password, ReadTimeout, WriteTimeout);
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return ?(Result["result"], Connector, Result);

EndFunction

// Execute command
// Executes the command on the server
//
// Note:
// When passing connection parameters, a new connection will be created and closed within the execution of a single command.^^
// To execute several commands (in OS and 1C versions), it is recommended to use a connection created in advance (see CreateConnection)
//
// Parameters:
// Command - String - Command text - exec
// Connection - Arbitrary, Structure Of KeyAndValue - Connection or connection parameters - conn
//
// Returns:
// Map Of KeyAndValue - Result of command execution
Function ExecuteCommand(Val Command, Val Connection) Export

    If IsConnector(Connection) Then
        Connector = Connection;
    Else
        Connector = CreateConnection(Connection);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OPI_TypeConversion.GetLine(Command);

    Result = Connector.Command(Command);
    Result = OPI_Tools.JsonToStructure(Result);

    Return Result;

EndFunction

// Form connection parameters
// Forms a collection of connection parameters
//
// Parameters:
// URL - String - Server URL - url
// Password - String - Password for connection - pass
// ReadTimeout - Number - Response timeout (in seconds) - rtout
// WriteTimeout - Number - Request sending timeout (in seconds) - wtout
//
// Returns:
// Structure Of KeyAndValue - Structure of connection parameters
Function FormConnectionParameters(Val URL, Val Password, Val ReadTimeout = 30, Val WriteTimeout = 30) Export

    ConnectionParams = New Structure;
    OPI_Tools.AddField("url"          , URL         , "String" , ConnectionParams);
    OPI_Tools.AddField("password"     , Password    , "String" , ConnectionParams);
    OPI_Tools.AddField("read_timeout" , ReadTimeout , "Number" , ConnectionParams);
    OPI_Tools.AddField("write_timeout", WriteTimeout, "Number" , ConnectionParams);

    Return ConnectionParams;

EndFunction

// Is connector !NOCLI
// Checks that the value is an object of an RCON AddIn
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_RCON.Main";

EndFunction

#EndRegion

#EndRegion

#Region Alternate

Function ОткрытьСоединение(Val ПараметрыСоединения) Export
	Return CreateConnection(ПараметрыСоединения);
EndFunction

Function ВыполнитьКоманду(Val Команда, Val Соединение) Export
	Return ExecuteCommand(Команда, Соединение);
EndFunction

Function СформироватьПараметрыСоединения(Val URL, Val Пароль, Val ТаймаутЧтения = 30, Val ТаймаутЗаписи = 30) Export
	Return FormConnectionParameters(URL, Пароль, ТаймаутЧтения, ТаймаутЗаписи);
EndFunction

Function ЭтоКоннектор(Val Значение) Export
	Return IsConnector(Значение);
EndFunction

#EndRegion