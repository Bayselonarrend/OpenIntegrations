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

// Create connection !NOCLI
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

// Execute command
// Executes the command according to its description
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Command - String - Command name to execute - comm
// Argument - Arbitrary - Command argument - arg
// Base - String - Database in which the operation needs to be performed - db
// Data - Structure Of KeyAndValue - Main data fields for performing the operation - data
//
// Returns:
// Map Of KeyAndValue - Operation result
Function ExecuteCommand(Val Connection
    , Val Command
    , Val Argument = 1
    , Val Base = Undefined
    , Val Data = Undefined) Export

    If IsConnector(Connection) Then
        CloseConnection = False;
        Connector       = Connection;
    Else
        CloseConnection = True;
        Connector       = CreateConnection(Connection);
    EndIf;

    If Not IsConnector(Connector) Then
        Return Connector;
    EndIf;

    OperationStructure = New Structure();

    OPI_Tools.AddField("operation", Command, "String", OperationStructure);

    If Base <> Undefined Then
        OPI_Tools.AddField("database", Base, "String", OperationStructure);
    EndIf;

    If Argument <> Undefined Then
        ProcessedArgument = ProcessDataForOperation(Argument);
        OperationStructure.Insert("argument", ProcessedArgument);
    EndIf;

    If Data <> Undefined Then
        ProcessedData = ProcessDataForOperation(Data);
        OperationStructure.Insert("data", ProcessedData);
    EndIf;

    OperationsJSON = OPI_Tools.JSONString(OperationStructure);

    Result = Connector.Execute(OperationsJSON);
    Result = OPI_Tools.JsonToStructure(Result);

    If CloseConnection Then
        CloseConnection(Connector);
    EndIf;

    Return Result;

EndFunction

#EndRegion

#Region WorkingWithDatabases

// Get list of bases
// Gets the list of databases
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetListOfBases(Val Connection) Export

    Result = ExecuteCommand(Connection, "listDatabases");
    Return Result;

EndFunction

// Get database
// Gets information about the database
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetDatabase(Val Connection, Val Base = Undefined) Export

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "dbStats", , Base);
    Return Result;

EndFunction

// Drop database
// Deletes the database
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DeleteDatabase(Val Connection, Val Base = Undefined) Export

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "dropDatabase", , Base);
    Return Result;

EndFunction

#EndRegion

#Region CollectionManagement

// Get collection list
// Gets a list of database collections
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetCollectionList(Val Connection, Val Base = Undefined) Export

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "listCollections", , Base);
    Return Result;

EndFunction

// Create collection
// Creates a new collection with the specified parameters
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Name - String - Collection name - name
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional creation parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function CreateCollection(Val Connection
    , Val Name
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Name);

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    EndIf;

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "create", Name, Base, Parameters);
    Return Result;

EndFunction

// Delete collection
// Deletes the selected database collection
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Base - String - Database name. Current database if not specified - db
//
// Returns:
// Map Of KeyAndValue - Operation result
Function DeleteCollection(Val Connection, Val Collection, Val Base = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Result = ExecuteCommand(Connection, "drop", Collection, Base);
    Return Result;

EndFunction

#EndRegion

#Region DocumentsManagement

// Insert documents
// Inserts new documents into the collection
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Values - Array Of Arbitrary - Array of docs objects - docs
// Base - String - Database name. Current database if not specified - db
// Parameters - Structure Of KeyAndValue - Additional insert options - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function InsertDocuments(Val Connection
    , Val Collection
    , Val Values
    , Val Base = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);
    OPI_TypeConversion.GetArray(Values);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    DocsArray = New Array;

    For Each Element In Values Do

        CurrentElement = Element;
        OPI_TypeConversion.GetKeyValueCollection(CurrentElement);
        DocsArray.Add(CurrentElement);

    EndDo;

    Parameters.Insert("documents", DocsArray);

    Result = ExecuteCommand(Connection, "insert", Collection, Base, Parameters);

    Return Result;

EndFunction

// Get cursor
// Gets a cursor for batch retrieval of collection documents
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Base - String - Database name. Current database if not specified - db
// Filter - Structure Of KeyAndValue - Document filter - filter
// Sort - Structure Of KeyAndValue - Selection sorting - sort
// Parameters - Structure Of KeyAndValue - Additional retrieval parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetCursor(Val Connection
    , Val Collection
    , Val Base = Undefined
    , Val Filter = Undefined
    , Val Sort = Undefined
    , Val Parameters = Undefined) Export

    OPI_TypeConversion.GetLine(Collection);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    If Parameters <> Undefined Then
        OPI_TypeConversion.GetKeyValueCollection(Parameters);
    Else
        Parameters = New Structure;
    EndIf;

    OPI_Tools.AddField("filter", Filter , "KeyAndValue", Parameters);
    OPI_Tools.AddField("sort"  , Sort   , "KeyAndValue", Parameters);

    Result = ExecuteCommand(Connection, "find", Collection, Base, Parameters);

    Return Result;

EndFunction

// Get document batch
// Gets the next batch of cursor documents
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// CursorID - Number - Cursor ID - cursor
// Base - String - Database name. Current database if not specified - db
// BatchSize - Number - Amount of records in the batch - limit
// Waiting - Number - Maximum lock time during awaitData (in ms.) - time
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetDocumentBatch(Val Connection
    , Val Collection
    , Val CursorID
    , Val Base = Undefined
    , Val BatchSize = Undefined
    , Val Waiting = Undefined) Export

    OPI_TypeConversion.GetNumber(CursorID);

    If Base <> Undefined Then
        OPI_TypeConversion.GetLine(Base);
    EndIf;

    Parameters = New Structure;
    OPI_Tools.AddField("collection", Collection , "String" , Parameters);
    OPI_Tools.AddField("batchSize" , BatchSize  , "Number" , Parameters);
    OPI_Tools.AddField("maxTimeMS" , BatchSize  , "Number" , Parameters);

    Result = ExecuteCommand(Connection, "getMore", CursorID, Base, Parameters);

    Return Result;

EndFunction

// Get documents
// Gets collection documents
//
// Parameters:
// Connection - String, Arbitrary - Connection or connection string - dbc
// Collection - String - Collection name - coll
// Base - String - Database name. Current database if not specified - db
// Filter - Structure Of KeyAndValue - Document filter - filter
// Sort - Structure Of KeyAndValue - Selection sorting - sort
// Parameters - Structure Of KeyAndValue - Additional retrieval parameters - params
//
// Returns:
// Map Of KeyAndValue - Operation result
Function GetDocuments(Val Connection
    , Val Collection
    , Val Base = Undefined
    , Val Filter = Undefined
    , Val Sort = Undefined
    , Val Parameters = Undefined) Export

    Cursor = GetCursor(Connection, Collection, Base, Filter, Sort, Parameters);

    If Not Cursor["result"] Then
        Return Cursor;
    EndIf;

    Cursor             = Cursor["data"]["cursor"];
    DocsArray       = Cursor["firstBatch"];
    CursorID        = Cursor["id"];
    ContinueGetting = CursorID > 0;

    While ContinueGetting Do

        Package = GetDocumentBatch(Connection, Collection, CursorID, Base);
        Success = Package["result"];

        If Not Success Then
            Return Package;
        EndIf;

        ContinueGetting = Package["cursor"]["id"] > 0;

        For Each Record In Package["cursor"]["nextBatch"] Do
            DocsArray.Add(Record);
        EndDo;

    EndDo;

    Result = New Map;
    Result.Insert("result", True);
    Result.Insert("data"  , DocsArray);

    Return Result;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function ProcessDataForOperation(Val Data, Covered = False)

    Try

        ProcessedData = Data;
        OPI_TypeConversion.GetKeyValueCollection(ProcessedData);
        ProcessedData = ProcessCollectionForOperation(ProcessedData);

    Except

        ProcessedData = Data;
        CurrentKey    = Undefined;

        If OPI_Tools.ThisIsCollection(ProcessedData) Then

            ProcessedData = ProcessCollectionForOperation(ProcessedData);

        ElsIf TypeOf(ProcessedData) = Type("BinaryData") Then

            ProcessedData = GetBase64StringFromBinaryData(ProcessedData);
            CurrentKey    = "__OPI_BINARY__";

        ElsIf TypeOf(ProcessedData) = Type("Date") Then

            ProcessedData = OPI_Tools.DateRFC3339(ProcessedData);
            CurrentKey    = "__OPI_DATETIME__";

        ElsIf ProcessedData = Undefined Then

            CurrentKey = "__OPI_NULL__";

        ElsIf Not TypeOf(ProcessedData) = Type("Number") And Not TypeOf(ProcessedData) = Type("Boolean") Then

            OPI_TypeConversion.GetLine(ProcessedData);

        EndIf;

        If ValueIsFilled(CurrentKey) And Not Covered Then
            ProcessedData = New Structure(CurrentKey, ProcessedData);
        EndIf;

    EndTry;

    Return ProcessedData;

EndFunction

Function ProcessCollectionForOperation(Val Data)

    ProcessedData = New(TypeOf(Data));

    If OPI_Tools.ThisIsCollection(ProcessedData, True) Then

        For Each DataPart In Data Do

            CurrentKey   = String(DataPart.Key);
            Covered      = StrStartsWith(CurrentKey, "__OPI_");
            CurrentValue = ProcessDataForOperation(DataPart.Value, Covered);

            ProcessedData.Insert(CurrentKey, CurrentValue);

        EndDo;

    Else

        For Each Element In Data Do
            ProcessedData.Add(ProcessDataForOperation(Element));
        EndDo;

    EndIf;

    Return ProcessedData;

EndFunction

#EndRegion

#Region Alternate

Function ОткрытьСоединение(Val СтрокаПодключения) Export
	Return CreateConnection(СтрокаПодключения);
EndFunction

Function ЗакрытьСоединение(Val Соединение) Export
	Return CloseConnection(Соединение);
EndFunction

Function ЭтоКоннектор(Val Значение) Export
	Return IsConnector(Значение);
EndFunction

Function СформироватьСтрокуПодключения(Val Адрес, Val База = "", Val Логин = "", Val Пароль = "", Val Параметры = Undefined) Export
	Return GenerateConnectionString(Адрес, База, Логин, Пароль, Параметры);
EndFunction

Function ВыполнитьКоманду(Val Соединение, Val Комманда, Val Аргумент = 1, Val База = Undefined, Val Данные = Undefined) Export
	Return ExecuteCommand(Соединение, Комманда, Аргумент, База, Данные);
EndFunction

Function ПолучитьСписокБаз(Val Соединение) Export
	Return GetListOfBases(Соединение);
EndFunction

Function ПолучитьБазуДанных(Val Соединение, Val База = Undefined) Export
	Return GetDatabase(Соединение, База);
EndFunction

Function УдалитьБазуДанных(Val Соединение, Val База = Undefined) Export
	Return DeleteDatabase(Соединение, База);
EndFunction

Function ПолучитьСписокКоллекций(Val Соединение, Val База = Undefined) Export
	Return GetCollectionList(Соединение, База);
EndFunction

Function СоздатьКоллекцию(Val Соединение, Val Наименование, Val База = Undefined, Val Параметры = Undefined) Export
	Return CreateCollection(Соединение, Наименование, База, Параметры);
EndFunction

Function УдалитьКоллекцию(Val Соединение, Val Коллекция, Val База = Undefined) Export
	Return DeleteCollection(Соединение, Коллекция, База);
EndFunction

Function ВставитьДокументы(Val Соединение, Val Коллекция, Val Значения, Val База = Undefined, Val Параметры = Undefined) Export
	Return InsertDocuments(Соединение, Коллекция, Значения, База, Параметры);
EndFunction

Function ПолучитьКурсор(Val Соединение, Val Коллекция, Val База = Undefined, Val Фильтр = Undefined, Val Сортировка = Undefined, Val Параметры = Undefined) Export
	Return GetCursor(Соединение, Коллекция, База, Фильтр, Сортировка, Параметры);
EndFunction

Function ПолучитьПакетДокументов(Val Соединение, Val Коллекция, Val IDКурсора, Val База = Undefined, Val РазмерПакета = Undefined, Val Ожидание = Undefined) Export
	Return GetDocumentBatch(Соединение, Коллекция, IDКурсора, База, РазмерПакета, Ожидание);
EndFunction

Function ПолучитьДокументы(Val Соединение, Val Коллекция, Val База = Undefined, Val Фильтр = Undefined, Val Сортировка = Undefined, Val Параметры = Undefined) Export
	Return GetDocuments(Соединение, Коллекция, База, Фильтр, Сортировка, Параметры);
EndFunction

#EndRegion