// OneScript: ./OInt/core/Modules/OPI_MongoDB.os
// Lib: MongoDB
// CLI: mongodb
// Keywords: mongodb, mongo, nosql

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

#Region Public

#Region CommonMethods

// Create Connection !NOCLI
// Creates a connection to the specified base
//
// Parameters:
// ConnectionString - String - Connection string - string
//
// Returns:
// Arbitrary - Connector object or structure with error information
Function CreateConnection(Val ConnectionString) Export

    If IsConnector(ConnectionString) Then
        Return ConnectionString;
    EndIf;

    OPI_TypeConversion.GetLine(ConnectionString);
    OPI_Tools.RestoreEscapeSequences(ConnectionString);

    Connector = OPI_AddIns.GetAddIn("MongoDB");

    Connector.ConnectionString = ConnectionString;

    Result = Connector.Connect();
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return ?(Result["result"], Connector, Result);

EndFunction

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - dbc
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

// Is connector !NOCLI
// Checks that the value is an object of the external MSSQL component
//
// Parameters:
// Value - Arbitrary - Value to check - value
//
// Returns:
// Boolean - Is connector
Function IsConnector(Val Value) Export

    Return String(TypeOf(Value)) = "AddIn.OPI_MongoDB.Main";

EndFunction

// Generate connection string
// Forms a MongoDB connection string
//
// Parameters:
// Address - String - Host IP address with port or URL - addr
// Base - String - Database, if necessary - db
// Login - String - Username for authorization - usr
// Password - String - Password for authorization - pwd
// Parameters - Structure Of KeyAndValue, Undefined - Additional connection parameters - params
//
// Returns:
// String - MongoDB connection string
Function GenerateConnectionString(Val Address
    , Val Base = ""
    , Val Login = ""
    , Val Password = ""
    , Val Parameters = Undefined) Export


    OPI_TypeConversion.GetLine(Address);
    OPI_TypeConversion.GetLine(Base);
    OPI_TypeConversion.GetLine(Login);
    OPI_TypeConversion.GetLine(Password);

    If ValueIsFilled(Parameters) Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    EndIf;

    ConnectionTemplate = "mongodb://%1";

    If ValueIsFilled(Login) Then
        Authorization = StrTemplate("%1:%2", Login, Password);
    Else
        Authorization = "";
    EndIf;

    If ValueIsFilled(Authorization) Then
        MainPart = StrTemplate("%1@%2", Authorization, Address);
    Else
        MainPart = Address;
    EndIf;

    ConnectionString = StrTemplate(ConnectionTemplate, MainPart);

    If ValueIsFilled(Base) Or ValueIsFilled(Parameters) Then

        ConnectionString = ConnectionString + "/";

        If ValueIsFilled(Base) Then
            ConnectionString = ConnectionString + Base;
        EndIf;

        If ValueIsFilled(Parameters) Then

            ConnectionString = ConnectionString + "?";
            ParameterArray   = New Array;

            For Each Parameter In Parameters Do
                ParameterArray.Add(StrTemplate("%1=%2", Parameter.Key, Parameter.Value));
            EndDo;

            ConnectionString = ConnectionString + StrConcat(ParameterArray, "&");

        EndIf;

    EndIf;

    Return ConnectionString;

EndFunction

#EndRegion

#EndRegion
