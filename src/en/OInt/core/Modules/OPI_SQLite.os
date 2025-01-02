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
#Use "../../tools"

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
// Connection - String, Arbitrary - Existing connection or database path - db
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

// Add rows
// Adds new rows to the table
//
// Parameters:
// Table - String - Table name - table
// DataArray - Array of Structure - An array of string data structures: Key > field, Value > field value - rows
// Transaction - Boolean - True > adding records to transactions with rollback on error - trn
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Structure Of KeyAndValue, String - Result of query execution
Function AddRows(Val Table, Val DataArray, Val Transaction = True, Val Connection = "") Export

    OPI_TypeConversion.GetArray(DataArray);
    OPI_TypeConversion.GetBoolean(Transaction);

    Connection = CreateConnection(Connection);

    If Not IsConnector(Connection) Then
        Return Connection;
    EndIf;

    If Transaction Then
        Start = ExecuteSQLQuery("BEGIN TRANSACTION", , , Connection);
    EndIf;

    If Not Start["result"] Then
        Return Start;
    EndIf;

    Counter      = 0;
    SuccessCount = 0;

    Error           = False;
    ErrorsArray     = New Array;
    CollectionError = "Invalid data";

    ResultStrucutre = New Structure;

    For Each Record In DataArray Do

        If Error And Transaction Then

            Rollback = ExecuteSQLQuery("ROLLBACK", , , Connection);

            SuccessCount = 0;
            ResultStrucutre.Insert("rollback", Rollback);
            Break;

        EndIf;

        Counter = Counter + 1;
        Error   = False;

        Try
            OPI_TypeConversion.GetKeyValueCollection(Record, CollectionError);
        Except
            ErrorsArray.Add(New Structure("row,error", Counter, CollectionError));
            Error = True;
            Continue;
        EndTry;

        Result = AddRow(Table, Record, Connection);

        If Result["result"] Then
            SuccessCount = SuccessCount + 1;
        Else
            ErrorsArray.Add(New Structure("row,error", Counter, Result["error"]));
            Error        = True;
        EndIf;

    EndDo;

    If Transaction And Not Error Then

        Completion = ExecuteSQLQuery("COMMIT", , , Connection);
        ResultStrucutre.Insert("commit", Completion);

    EndIf;

    ResultStrucutre           = New Structure("result,rows,errors"
        , ErrorsArray.Count() = 0
        , SuccessCount
        , ErrorsArray);

     Return ResultStrucutre;

EndFunction

// Get records
// Gets records from the selected table
//
// Parameters:
// Table - String - Table name - table
// Fields - Array Of String - Fields for selection - fields
// Filters - Array of Structure - Filters array. See GetRecordsFilterStrucutre - filter
// Sort - Structure Of KeyAndValue - Sorting: Key > field name, Value > direction (ASC, DESC) - order
// Count - Number - Limiting the number of received strings - limit
// Connection - String, Arbitrary - Existing connection or database path - db
//
// Returns:
// Structure Of KeyAndValue, String - Result of query execution
Function GetRecords(Val Table
    , Val Fields = "*"
    , Val Filters = ""
    , Val Sort = ""
    , Val Count = ""
    , Val Connection = "") Export

    Scheme = OPI_SQLQueries.NewSQLScheme("SELECT");

    OPI_SQLQueries.SetTableName(Scheme, Table);
    OPI_SQLQueries.SetLimit(Scheme, Count);

    FillFields(Scheme, Fields);
    FillFilters(Scheme, Filters);
    FillSorting(Scheme, Sort);

    Request = OPI_SQLQueries.FormSQLText(Scheme);

    Result = ExecuteSQLQuery(Request, Scheme["values"], , Connection);

    Return Result;

EndFunction

// Get records filter strucutre
// Gets the template structure for filtering records in ORM queries
//
// Note
// The use of the `raw` feature is necessary for compound constructions like `BEETWEEN`.^^
// For example: with `raw:false` the filter `type:BETWEEN` `value:10 AND 20` will be interpolated as `BETWEEN ?1 `^^.
// where `?1 = "10 AND 20,"' which would cause an error.
// In such a case, you must use `raw:true` to set the condition directly in the query text
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Record filter element
Function GetRecordsFilterStrucutre(Val Clear = False) Export

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "<filtering field name>");
    FilterStructure.Insert("type" , "<comparison type>");
    FilterStructure.Insert("value", "<comparison value>");
    FilterStructure.Insert("union", "<connection with the following condition: AND, OR, etc..>");
    FilterStructure.Insert("raw"  , "<true - the value will be inserted by text as it is, false - through the parameter>");

    If Clear Then
        FilterStructure = OPI_Tools.ClearCollectionRecursively(FilterStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;

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

            ElsIf OPI_Tools.CollectionFieldExist(CurrentParameter, "blob") Then

                DataValue = CurrentParameter["blob"];
                DataFile  = New File(String(DataValue));

                If DataFile.Exist() Then
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

Function AddRow(Val Table, Val Record, Val Connection)

    FieldArray  = New Array;
    ValuesArray = New Array;

    Scheme = OPI_SQLQueries.NewSQLScheme("INSERT");
    OPI_SQLQueries.SetTableName(Scheme, Table);

    SplitDataCollection(Record, FieldArray, ValuesArray);

    For Each Field In FieldArray Do
        OPI_SQLQueries.AddField(Scheme, Field);
    EndDo;

    Request = OPI_SQLQueries.FormSQLText(Scheme);

    Result = ExecuteSQLQuery(Request, ValuesArray, , Connection);

    Return Result;

EndFunction

Procedure SplitDataCollection(Val Record, FieldArray, ValuesArray)

    For Each Element In Record Do

        FieldArray.Add(Element.Key);
        ValuesArray.Add(Element.Value);

    EndDo;

EndProcedure

Procedure FillFields(Scheme, Val Fields)

    If Not ValueIsFilled(Fields) Then
        Fields = "*";
    EndIf;

    OPI_TypeConversion.GetArray(Fields);

    For Each Field In Fields Do
        OPI_SQLQueries.AddField(Scheme, Field);
    EndDo;

EndProcedure

Procedure FillFilters(Scheme, Val Filters)

    If Not ValueIsFilled(Filters) Then
        Return;
    EndIf;

    OPI_TypeConversion.GetArray(Filters);

    For Each Filter In Filters Do

        OPI_SQLQueries.AddFilter(Scheme
            , Filter["field"]
            , Filter["type"]
            , Filter["value"]
            , Filter["union"]
            , Filter["raw"]);

    EndDo;

EndProcedure

Procedure FillSorting(Val Scheme, Val Sort)

    If Not ValueIsFilled(Sort) Then
        Return;
    EndIf;

    OPI_TypeConversion.GetCollection(Sort);

    For Each Element In Sort Do

        OPI_SQLQueries.AddSorting(Scheme, Element.Key, Element.Value);

    EndDo;

EndProcedure

#EndRegion
