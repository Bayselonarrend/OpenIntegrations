// OneScript: ./OInt/core/Modules/OPI_SQLite.os
// Lib: SQLite
// CLI: sqlite

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
//@skip-check constructor-function-return-section

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region Public

#Region CommonMethods

// Create Connection !NOCLI
// Creates a connection to the specified base
//
// Parameters:
// Base - String - Path to database. In memory, if not filled - db
//
// Returns:
// Arbitrary - Connector object or structure with error information
Function CreateConnection(Val Base = "") Export

    If IsConnector(Base) Then
        Return Base;
    EndIf;

    OPI_TypeConversion.GetLine(Base);

    Connector = AttachAddInOnServer("OPI_SQLite");

    Connector.Database = Base;

    Result = Connector.Connect();
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return ?(Result["result"], Connector, Result);

EndFunction

// Close connection !NOCLI
// Explicitly closes the passed connection
//
// Parameters:
// Connection - Arbitrary - AddIn object with open connection - db
//
// Returns:
// Structure Of KeyAndValue - Result of connection termination
Function CloseConnection(Val Connection) Export

    If IsConnector(Connection) Then

        Result = Connection.Close();
        Result = OPI_Tools.JsonToStructure(Result, False);

    Else

        Result = New Structure("result,error", False, "It's not a connection");

    EndIf;

    Return Result;

EndFunction

// Execute SQL query
// Executes an arbitrary SQL query
//
// Note
// Available parameter types: String, Number, Date, Boolean, BinaryData.^^
// Binary data can also be passed as a `{'blob':<File path>}` structure. Binary data (BLOB) values are returned^^
// as `{'blob':<Base64 string>}
// Without specifying the `ForcifyResult` flag, result data is returned only for queries beginning with `SELECT` keyword^^
// For other queries, `result:true` or `false` with error text is returned
//
// Parameters:
// QueryText - String - Database query text - sql
// Parameters - Array Of Arbitrary - Array of positional parameters of the request - params
// ForceResult - Boolean - Includes an attempt to retrieve the result, even for nonSELECT queries - force
// Connection - String, Arbitrary - Existing connection or path to the base. In memory, if not filled - db
//
// Returns:
// Structure Of KeyAndValue - Result of query execution
Function ExecuteSQLQuery(Val QueryText
    , Val Parameters = ""
    , Val ForceResult = False
    , Val Connection = "") Export

    OPI_TypeConversion.GetLine(QueryText);
    OPI_TypeConversion.GetBoolean(ForceResult);

    Parameters_ = ProcessParameters(Parameters);
    Connector   = CreateConnection(Connection);

    If TypeOf(Connector) <> Type("AddIn.OPI_SQLite.Main") Then
        Return Connector;
    EndIf;

    Result = Connector.Execute(QueryText, Parameters_, ForceResult);
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return Result;

EndFunction

#EndRegion

#Region ORM

// Create table
// Creates an empty table in the database
//
// Parameters:
// Table - String - Table name - table
// ColoumnsStruct - Structure Of KeyAndValue - Column structure: Key > Name, Value > Data type - cols
// NotExecute - Boolean - True > Does not execute the query, but returns SQL text - noex
// Connection - String - Existing connection or database path - db
//
// Returns:
// Structure Of KeyAndValue, String - The result of the execution or SQL query text
Function CreateTable(Val Table, Val ColoumnsStruct, Val NotExecute = False, Val Connection = "") Export

    OPI_TypeConversion.GetBoolean(NotExecute);

    ErrorText = "The column structure is not a valid key-value structure";
    OPI_TypeConversion.GetKeyValueCollection(ColoumnsStruct, ErrorText);

    Scheme = OPI_SQLQueries.NewSQLScheme("CREATE");

    OPI_SQLQueries.SetTableName(Scheme, Table);

    For Each Coloumn In ColoumnsStruct Do
        OPI_SQLQueries.AddColoumn(Scheme, Coloumn.Key, Coloumn.Value);
    EndDo;

    Request = OPI_SQLQueries.FormSQLText(Scheme);

    If NotExecute Then
        Result = Request;
    Else
        Result = ExecuteSQLQuery(Request, , , Connection);
    EndIf;

    Return Result;

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

    AddIn = New ("AddIn." + AddInName + "." + Class);
    Return AddIn;

EndFunction

Function ProcessParameters(Val Parameters)

    If ValueIsFilled(Parameters) Then

        OPI_TypeConversion.GetArray(Parameters);

        For N = 0 To Parameters.UBound() Do

            CurrentParameter = Parameters[N];

            If TypeOf(CurrentParameter) = Type("BinaryData") Then

                CurrentParameter = New Structure("blob", Base64String(CurrentParameter));

            ElsIf OPI_Tools.CollectionFieldExists(CurrentParameter, "blob") Then

                DataValue = CurrentParameter["blob"];
                DataFile  = New File(String(DataValue));

                If DataFile.Exists() Then
                    CurrentData      = New BinaryData(String(DataValue));
                    CurrentParameter = New Structure("blob", Base64String(CurrentData));
                EndIf;

            ElsIf TypeOf(CurrentParameter) = Type("Date") Then

                CurrentParameter = Format(CurrentParameter, "DF='yyyy-MM-dd HH:MM:ss");

            ElsIf Not OPI_Tools.IsPrimitiveType(CurrentParameter) Then

                OPI_TypeConversion.GetLine(CurrentParameter);

            EndIf;

            Parameters[N] = CurrentParameter;

        EndDo;

        Parameters_ = OPI_Tools.JSONString(Parameters, , False);

    Else

        Parameters_ = "[]";

    EndIf;

    Return Parameters_;

EndFunction

Function IsConnector(Val Value)

    Return String(TypeOf(Value)) = "AddIn.OPI_SQLite.Main";

EndFunction

#EndRegion
