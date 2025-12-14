// OneScript: ./OInt/tools/Modules/OPI_SQLQueries.os

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
// BSLLS:QueryParseError-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:NumberOfParams-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// Uncomment if OneScript is executed
// #Use "./internal"

#Region Internal

Function CreateDatabase(Val Module, Val Base, Val Connection = "", Val Tls = Undefined) Export

    Scheme = NewSQLScheme("CREATEDATABASE", Module);

    SetBaseName(Scheme, Base);

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , , Connection, Tls);

    Return Result;

EndFunction

Function DeleteDatabase(Val Module, Val Base, Val Connection = "", Val Tls = Undefined) Export

    Scheme = NewSQLScheme("DROPDATABASE", Module);

    SetBaseName(Scheme, Base);

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , , Connection, Tls);

    Return Result;

EndFunction

Function CreateTable(Val Module
    , Val Table
    , Val ColoumnsStruct
    , Val Connection = ""
    , Val Tls        = Undefined) Export

    ErrorText = "The column structure is not a valid key-value structure";
    OPI_TypeConversion.GetKeyValueCollection(ColoumnsStruct, ErrorText);

    Scheme = NewSQLScheme("CREATE", Module);

    SetTableName(Scheme, Table);

    For Each Coloumn In ColoumnsStruct Do
        AddColoumn(Scheme, Coloumn.Key, Coloumn.Value);
    EndDo;

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , , Connection, Tls);

    Return Result;

EndFunction

Function AddTableColumn(Val Module
    , Val Table
    , Val Name
    , Val DataType
    , Val Connection = ""
    , Val Tls        = Undefined) Export

    Scheme = NewSQLScheme("ALTERTABLEADD", Module);

    SetTableName(Scheme, Table);

    SetCustomField(Scheme, "name" , Name    , "String");
    SetCustomField(Scheme, "dtype", DataType, "String");

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , , Connection, Tls);

    Return Result;

EndFunction

Function DeleteTableColumn(Val Module
    , Val Table
    , Val Name
    , Val Connection = ""
    , Val Tls        = Undefined) Export

    Scheme = NewSQLScheme("ALTERTABLEDROP", Module);

    SetTableName(Scheme, Table);
    SetCustomField(Scheme, "name", Name, "String");

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , , Connection, Tls);

    Return Result;

EndFunction

Function EnsureTable(Val Module
    , Val Table
    , Val ColoumnsStruct
    , Val Connection = ""
    , Val Tls        = Undefined) Export

    ErrorText = "The column structure is not a valid key-value structure";
    OPI_TypeConversion.GetKeyValueCollection(ColoumnsStruct, ErrorText);
    OPI_TypeConversion.GetLine(Table);

    Result_ = "result";

    ResultStrucutre = New Structure(Result_, True);

    Connection  = CreateConnection(Module, Connection, Tls);
    ProblemStep = ProcessRecordsStart(Module, True, Connection);

    If ValueIsFilled(ProblemStep) Then
        Return ProblemStep;
    EndIf;

    Try

        TableDescription = GetTableStructure(Module, Table, Connection, Tls);

        If Not TableDescription[Result_] Then
            Return TableDescription;
        EndIf;

        TableColumns = TableDescription["data"];

        If Not ValueIsFilled(TableColumns) Then
            ResultStrucutre = CreateTable(Module, Table, ColoumnsStruct, Connection, Tls);
        Else

            Error = NormalizeTable(Module, Table, ColoumnsStruct, TableColumns, Connection, Tls);

            If Error <> Undefined Then
                Return Error;
            EndIf;

        EndIf;

        Completion = Module.ExecuteSQLQuery("COMMIT;", , , Connection);
        ResultStrucutre.Insert("commit", Completion);

    Except

        Rollback = Module.ExecuteSQLQuery("ROLLBACK;", , , Connection);

        ResultStrucutre.Insert(Result_   , False);
        ResultStrucutre.Insert("error"   , ErrorDescription());
        ResultStrucutre.Insert("rollback", Rollback);

    EndTry;

    Return ResultStrucutre;

EndFunction

Function AddRecords(Val Module
    , Val Table
    , Val DataArray
    , Val Transaction = True
    , Val Connection  = ""
    , Val Tls         = Undefined) Export

    OPI_TypeConversion.GetArray(DataArray);
    OPI_TypeConversion.GetBoolean(Transaction);

    Connection  = CreateConnection(Module, Connection, Tls);
    ProblemStep = ProcessRecordsStart(Module, Transaction, Connection);

    If ValueIsFilled(ProblemStep) Then
        Return ProblemStep;
    EndIf;

    ProcessedStructure = ProcessRecords(Module, Table, DataArray, Transaction, Connection);
    ResultStrucutre    = ProcessRecordsEnd(ProcessedStructure, Module, Transaction, Connection);

    Return ResultStrucutre;

EndFunction

Function GetRecords(Val Module
    , Val Table
    , Val Fields     = "*"
    , Val Filters    = ""
    , Val Sort       = ""
    , Val Count      = ""
    , Val Connection = ""
    , Val Tls        = Undefined) Export

    Scheme = NewSQLScheme("SELECT", Module);

    SetTableName(Scheme, Table);
    SetLimit(Scheme, Count);

    FillFields(Scheme, Fields);
    FillFilters(Scheme, Filters);
    FillSorting(Scheme, Sort);

    Request = FormSQLText(Scheme);

    Result = ExecuteSQLQuery(Module, Request, Scheme["values"], , Connection, Tls);

    Return Result;

EndFunction

Function UpdateRecords(Val Module
    , Val Table
    , Val ValueStructure
    , Val Filters    = ""
    , Val Connection = ""
    , Val Tls        = Undefined) Export

    Scheme = NewSQLScheme("UPDATE", Module);

    FieldArray  = New Array;
    ValuesArray = New Array;

    SetTableName(Scheme, Table);
    SplitDataCollection(ValueStructure, FieldArray, ValuesArray);

    Scheme["values"] = ValuesArray;

    For Each Field In FieldArray Do
        AddField(Scheme, Field);
    EndDo;

    FillFilters(Scheme, Filters);

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, Scheme["values"], , Connection, Tls);

    Return Result;

EndFunction

Function DeleteRecords(Val Module
    , Val Table
    , Val Filters    = ""
    , Val Connection = ""
    , Val Tls        = Undefined) Export

    Scheme = NewSQLScheme("DELETE", Module);

    SetTableName(Scheme, Table);

    FillFilters(Scheme, Filters);

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, Scheme["values"], , Connection, Tls);

    Return Result;

EndFunction

Function DeleteTable(Val Module, Val Table, Val Connection = "", Val Tls = Undefined) Export

    Scheme = NewSQLScheme("DROP", Module);

    SetTableName(Scheme, Table);

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , , Connection, Tls);

    Return Result;

EndFunction

Function ClearTable(Val Module, Val Table, Val Connection = "", Val Tls = Undefined) Export

    Scheme = NewSQLScheme("TRUNCATE", Module);

    SetTableName(Scheme, Table);

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , , Connection, Tls);

    Return Result;

EndFunction

Function GetTableStructure(Val Module, Val Table, Val Connection = "", Val Tls = Undefined) Export

    Scheme = NewSQLScheme("TABLESCHEMA", Module);

    SetTableName(Scheme, Table);

    Request = FormSQLText(Scheme);
    Result  = ExecuteSQLQuery(Module, Request, , True, Connection, Tls);

    Return Result;

EndFunction

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

Function ExecuteQueryWithProcessing(Connector, Val QueryText, Val ForceResult, Val Parameters) Export

    QueryKey = InitializeQuery(Connector, QueryText, ForceResult);

    If Not QueryKey["result"] Then
        Return QueryKey;
    Else
        QueryKey = QueryKey["key"];
    EndIf;

    Adding = SetQueryParams(Connector, QueryKey, Parameters);

    If Not Adding["result"] Then
        Return Adding;
    EndIf;

    Result = Connector.Execute(QueryKey);
    Result = ProcessQueryResult(Connector, QueryKey, Result);

    Return Result;

EndFunction

Function ProcessParameters(Val AddIn, Val Parameters, Val TypesStructure) Export

    If Not ValueIsFilled(Parameters) Then
        Return New Array;
    EndIf;

    OPI_TypeConversion.GetArray(Parameters);

    For N = 0 To Parameters.UBound() Do

        CurrentParameter = Parameters[N];

        CurrentParameter = ProcessParameter(AddIn, CurrentParameter, TypesStructure);

        Parameters[N] = CurrentParameter;

    EndDo;

    Return Parameters;

EndFunction

#EndRegion

#Region Private

#Region Scheme

Function NewSQLScheme(Val Action, Val Module = Undefined)

    OPI_TypeConversion.GetLine(Action);

    Action = Upper(Action);

    If Action = "SELECT" Then

        Scheme = EmptySchemeSelect();

    ElsIf Action = "INSERT" Then

        Scheme = EmptySchemeInsert();

    ElsIf Action = "UPDATE" Then

        Scheme = EmptySchemeUpdate();

    ElsIf Action = "DELETE" Then

        Scheme = EmptySchemeDelete();

    ElsIf Action = "CREATE" Then

        Scheme = EmptySchemeCreate();

    ElsIf Action = "DROP" Then

        Scheme = EmptySchemeDrop();

    ElsIf Action = "TRUNCATE" Then

        Scheme = EmptySchemeTruncate();

    ElsIf Action = "CREATEDATABASE" Then

        Scheme = EmptySchemeCreateDatabase();

    ElsIf Action = "DROPDATABASE" Then

        Scheme = EmptySchemeDropDatabase();

    ElsIf Action = "TABLESCHEMA" Then

        Scheme = EmptySchemeTableSchema();

    ElsIf Action = "ALTERTABLEADD" Then

        Scheme = EmptySchemeAlterTableAdd();

    ElsIf Action = "ALTERTABLEDROP" Then

        Scheme = EmptySchemeAlterTableDrop();

    Else

        Scheme = New Structure;

    EndIf;

    Features = Module.GetFeatures();

    ReplaceDefaultFeatures(Features);

    Scheme.Insert("nump" , Features["ParameterNumeration"]);
    Scheme.Insert("markp", Features["ParameterMarker"]);
    Scheme.Insert("dbms" , Features["DBMS"]);

    Return Scheme;

EndFunction

Function EmptySchemeSelect()

    Scheme = New Structure("type", "SELECT");

    Scheme.Insert("table"  , "");
    Scheme.Insert("filter" , New Array);
    Scheme.Insert("order"  , New Array);
    Scheme.Insert("limit"  , 0);
    Scheme.Insert("set"    , New Array);
    Scheme.Insert("values" , New Array);

    Return Scheme;

EndFunction

Function EmptySchemeInsert()

    Scheme = New Structure("type", "INSERT");

    Scheme.Insert("table", "");
    Scheme.Insert("set"  , New Array);

    Return Scheme;

EndFunction

Function EmptySchemeUpdate()

    Scheme = New Structure("type", "UPDATE");

    Scheme.Insert("table"  , "");
    Scheme.Insert("set"    , New Array);
    Scheme.Insert("filter" , New Array);
    Scheme.Insert("values" , New Array);

    Return Scheme;

EndFunction

Function EmptySchemeDelete()

    Scheme = New Structure("type", "DELETE");

    Scheme.Insert("table" , "");
    Scheme.Insert("filter", New Array);
    Scheme.Insert("values", New Array);

    Return Scheme;

EndFunction

Function EmptySchemeCreate()

    Scheme = New Structure("type", "CREATE");

    Scheme.Insert("table"  , "");
    Scheme.Insert("columns", New Array);

    Return Scheme;

EndFunction

Function EmptySchemeDrop()

    Scheme = New Structure("type", "DROP");

    Scheme.Insert("table" , "");

    Return Scheme;

EndFunction

Function EmptySchemeTruncate()

    Scheme = New Structure("type", "TRUNCATE");

    Scheme.Insert("table" , "");

    Return Scheme;

EndFunction

Function EmptySchemeCreateDatabase()

    Scheme = New Structure("type", "CREATEDATABASE");

    Scheme.Insert("database" , "");

    Return Scheme;

EndFunction

Function EmptySchemeDropDatabase()

    Scheme = New Structure("type", "DROPDATABASE");

    Scheme.Insert("database" , "");

    Return Scheme;

EndFunction

Function EmptySchemeTableSchema()

    Scheme = New Structure("type", "TABLESCHEMA");

    Scheme.Insert("table" , "");
    Scheme.Insert("common", True);

    Return Scheme;

EndFunction

Function EmptySchemeAlterTableAdd()

    Scheme = New Structure("type", "ALTERTABLEADD");

    Scheme.Insert("table", "");
    Scheme.Insert("name" , "");
    Scheme.Insert("dtype", "");

    Return Scheme;

EndFunction

Function EmptySchemeAlterTableDrop()

    Scheme = New Structure("type", "ALTERTABLEDROP");

    Scheme.Insert("table", "");
    Scheme.Insert("name" , "");

    Return Scheme;

EndFunction

#EndRegion

#Region Processors

Function FormSQLText(Val Scheme)

    ErrorText = "The value passed is not a valid SQL query schema";
    OPI_TypeConversion.GetKeyValueCollection(Scheme, ErrorText);

    SchemeType = "";

    If Not OPI_Tools.CollectionFieldExists(Scheme, "type", SchemeType) Then
        Raise ErrorText;
    EndIf;

    SchemeType = Upper(SchemeType);

    If SchemeType = "SELECT" Then

        QueryText = FormTextSelect(Scheme);

    ElsIf SchemeType = "INSERT" Then

        QueryText = FormTextInsert(Scheme);

    ElsIf SchemeType = "UPDATE" Then

        QueryText = FormTextUpdate(Scheme);

    ElsIf SchemeType = "DELETE" Then

        QueryText = FormTextDelete(Scheme);

    ElsIf SchemeType = "CREATE" Then

        QueryText = FormTextCreate(Scheme);

    ElsIf SchemeType = "DROP" Then

        QueryText = FormTextDrop(Scheme);

    ElsIf SchemeType = "TRUNCATE" Then

        QueryText = FormTextTruncate(Scheme);

    ElsIf SchemeType = "CREATEDATABASE" Then

        QueryText = FormTextCreateDatabase(Scheme);

    ElsIf SchemeType = "DROPDATABASE" Then

        QueryText = FormTextDropDatabase(Scheme);

    ElsIf SchemeType = "TABLESCHEMA" Then

        QueryText = FormTextTableSchema(Scheme);

    ElsIf SchemeType = "ALTERTABLEADD" Then

        QueryText = FormTextAlterTableAdd(Scheme);

    ElsIf SchemeType = "ALTERTABLEDROP" Then

        QueryText = FormTextAlterTableDrop(Scheme);

    Else

        QueryText = "";

    EndIf;

    Return QueryText;

EndFunction

Function FormTextSelect(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table,filter,order,limit,set");

    Table   = Scheme["table"];
    Fields  = Scheme["set"];
    Filters = Scheme["filter"];
    Sort    = Scheme["order"];
    Count   = Scheme["limit"];
    DBMS    = Scheme["dbms"];

    SQLTemplate = "SELECT %1 %2 FROM %3
    |%4
    |%5
    |%6;";

    FilterText  = FormFilterText(Filters);
    SortingText = FormSortingText(Sort);

    If DBMS       = "mssql" Then
        TopText   = FormTopText(Count);
        LimitText = "";
    Else
        TopText   = "";
        LimitText = FormCountText(Count);
    EndIf;

    TextSQL = StrTemplate(SQLTemplate
        , TopText
        , StrConcat(Fields, ", ")
        , Table
        , FilterText
        , SortingText
        , LimitText);

    Return TextSQL;

EndFunction

Function FormTextInsert(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table,set");

    Table      = Scheme["table"];
    Fields     = Scheme["set"];
    Numeration = Scheme["nump"];
    Marker     = Scheme["markp"];

    SQLTemplate = "INSERT INTO %1 (%2) VALUES (%3);";

    Parameters = New Array;

    For N = 1 To Fields.Count() Do

        CurrentMarker = Marker;

        If Numeration Then
            CurrentMarker = CurrentMarker + OPI_Tools.NumberToString(N);
        EndIf;

        Parameters.Add(CurrentMarker);

    EndDo;

    TextSQL = StrTemplate(SQLTemplate
        , Table
        , StrConcat(Fields, ", ")
        , StrConcat(Parameters, ", "));

    Return TextSQL;

EndFunction

Function FormTextUpdate(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table,set,values");

    Table      = Scheme["table"];
    Fields     = Scheme["set"];
    Filters    = Scheme["filter"];
    Numeration = Scheme["nump"];
    Marker     = Scheme["markp"];

    SQLTemplate = "UPDATE %1 SET %2 %3;";

    FilterText = FormFilterText(Filters);

    For N = 0 To Fields.UBound() Do

        CurrentMarker = Marker;

        If Numeration Then
            CurrentMarker = CurrentMarker + OPI_Tools.NumberToString(N + 1);
        EndIf;

        Fields[N] = Fields[N] + " = " + CurrentMarker;

    EndDo;

    TextSQL = StrTemplate(SQLTemplate, Table, StrConcat(Fields, "," + Chars.LF), FilterText);

    Return TextSQL;

EndFunction

Function FormTextDelete(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table");

    Table   = Scheme["table"];
    Filters = Scheme["filter"];

    SQLTemplate = "DELETE FROM %1 %2;";

    FilterText = FormFilterText(Filters);

    TextSQL = StrTemplate(SQLTemplate, Table, FilterText);

    Return TextSQL;

EndFunction

Function FormTextCreate(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table,columns");

    Table   = Scheme["table"];
    Columns = Scheme["columns"];

    SQLTemplate = "CREATE TABLE %1 (
    | %2
    | );";

    ColoumTemplate = "%1 %2";

    ColoumnsDescriptionArray = New Array;

    For Each Coloumn In Columns Do
        For Each Element In Coloumn Do
            ColoumnsDescriptionArray.Add(StrTemplate(ColoumTemplate, Element.Key, Element.Value));
        EndDo;
    EndDo;

    ColoumnsDescription = StrConcat(ColoumnsDescriptionArray, "," + Chars.LF);

    TextSQL = StrTemplate(SQLTemplate, Table, ColoumnsDescription);

    Return TextSQL;

EndFunction

Function FormTextDrop(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table");

    Table = Scheme["table"];

    SQLTemplate = "DROP TABLE %1;";

    TextSQL = StrTemplate(SQLTemplate, Table);

    Return TextSQL;

EndFunction

Function FormTextTruncate(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table");

    Table = Scheme["table"];

    SQLTemplate = "TRUNCATE TABLE %1;";

    TextSQL = StrTemplate(SQLTemplate, Table);

    Return TextSQL;

EndFunction

Function FormTextCreateDatabase(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "database");

    Base = Scheme["database"];

    SQLTemplate = "CREATE DATABASE %1;";

    TextSQL = StrTemplate(SQLTemplate, Base);

    Return TextSQL;

EndFunction

Function FormTextDropDatabase(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "database");

    Base = Scheme["database"];

    SQLTemplate = "DROP DATABASE %1;";

    TextSQL = StrTemplate(SQLTemplate, Base);

    Return TextSQL;

EndFunction

Function FormTextTableSchema(Val Scheme)

    DBMS  = Scheme["dbms"];
    Table = Scheme["table"];

    If DBMS = "sqlite" Then

        SQLTemplate = "PRAGMA table_info('%1');";

    Else

        SQLTemplate       = "SELECT column_name, data_type, is_nullable, column_default, character_maximum_length
        |FROM information_schema.columns
        |WHERE table_name = '%1';";

    EndIf;

    TextSQL = StrTemplate(SQLTemplate, Table);

    Return TextSQL;

EndFunction

Function FormTextAlterTableAdd(Val Scheme)

    Table    = Scheme["table"];
    Name     = Scheme["name"];
    DataType = Scheme["dtype"];

    SQLTemplate = "ALTER TABLE %1 ADD %2 %3";

    TextSQL = StrTemplate(SQLTemplate, Table, Name, DataType);

    Return TextSQL;

EndFunction

Function FormTextAlterTableDrop(Val Scheme)

    Table = Scheme["table"];
    Name  = Scheme["name"];
    DBMS  = Scheme["dbms"];

    SQLTemplate   = "ALTER TABLE %1 DROP %2 %3";
    Clarification = ?(DBMS = "mssql", "COLUMN", "");

    TextSQL = StrTemplate(SQLTemplate, Table, Clarification, Name);

    Return TextSQL;

EndFunction

#EndRegion

#Region Auxiliary

Function CreateConnection(Val Module, Val Connection, Val Tls)

    If Tls     = Undefined Then
        Result = Module.CreateConnection(Connection);
    Else
        Result = Module.CreateConnection(Connection, Tls);
    EndIf;

    Return Result;

EndFunction

Function ExecuteSQLQuery(Val Module
    , Val QueryText
    , Val Parameters  = ""
    , Val ForceResult = False
    , Val Connection  = ""
    , Val Tls         = Undefined)

    If ValueIsFilled(Tls) Then
        Result = Module.ExecuteSQLQuery(QueryText, Parameters, ForceResult, Connection, Tls);
    Else
        Result = Module.ExecuteSQLQuery(QueryText, Parameters, ForceResult, Connection);
    EndIf;

    Return Result;

EndFunction

Function ProcessRecords(Val Module, Val Table, Val DataArray, Val Transaction, Val Connection)

    If OPI_AddIns.FileTransferRequired() Then
        Result = AddRecordsBatch(Module, Table, DataArray, Transaction, Connection);
    Else
        Result = AddRecordsSeparately(Module, Table, DataArray, Transaction, Connection);
    EndIf;

    Return Result;

EndFunction

Function AddRecordsSeparately(Val Module, Val Table, Val DataArray, Val Transaction, Val Connection)

    ErrorsArray  = New Array;
    Counter      = 0;
    SuccessCount = 0;

    For Each Record In DataArray Do

        Counter = Counter + 1;

        If Not CheckRecordCorrectness(Record, ErrorsArray, Counter) Then
            If Transaction Then
                Break;
            Else
                Continue;
            EndIf;
        EndIf;

        Result = AddRow(Module, Table, Record, Connection);

        Success = CheckSingleQueryExecution(Result, Transaction, Counter, SuccessCount, ErrorsArray);

        If Not Success Then
            Break;
        EndIf;

    EndDo;

    Result = New Structure("ErrorsArray,SuccessCount", ErrorsArray, SuccessCount);

    Return Result;

EndFunction

Function AddRecordsBatch(Val Module, Val Table, Val DataArray, Val Transaction, Val Connection)

    BlanksArray = New Array;
    ErrorsArray = New Array;

    // BSLLS:MissingTemporaryFileDeletion-off

    //@skip-check missing-temporary-file-deletion
    BlanksPath = GetTempFileName();
    //@skip-check missing-temporary-file-deletion
    KeysPath = GetTempFileName();

    // BSLLS:MissingTemporaryFileDeletion-on

    Counter      = 0;
    SuccessCount = 0;

    For Each Record In DataArray Do

        Counter = Counter + 1;

        If Not CheckRecordCorrectness(Record, ErrorsArray, Counter) Then
            If Transaction Then
                Break;
            Else
                Continue;
            EndIf;
        EndIf;

        Result = AddRow(Module, Table, Record, Connection, False);
        BlanksArray.Add(Result);

    EndDo;

    Try

        OPI_Tools.WriteJSONFile(BlanksPath, BlanksArray);

        Initialization = Connection.BatchQuery(BlanksPath, KeysPath);
        Initialization = OPI_Tools.JsonToStructure(Initialization);

        OPI_Tools.RemoveFileWithTry(BlanksPath, "Failed to delete query package file after installation");

        If Not Initialization["result"] Then
            Raise Initialization["error"];
        EndIf;

        Keys = OPI_Tools.ReadJSONFile(KeysPath, True);

        OPI_Tools.RemoveFileWithTry(KeysPath, "Failed to delete key file after initialization");

    Except

        Error = StrTemplate("Batch query error: %1", ErrorDescription());
        ErrorsArray.Add(New Structure("row,error", -1, Error));

        Return New Structure("ErrorsArray,SuccessCount", ErrorsArray, 0);

    EndTry;

    For Each QueryKey In Keys Do

        Result = Connection.Execute(QueryKey);
        Result = ProcessQueryResult(Connection, QueryKey, Result);

        Success = CheckSingleQueryExecution(Result, Transaction, Counter, SuccessCount, ErrorsArray);

        If Not Success Then
            Break;
        EndIf;

    EndDo;

    Result = New Structure("ErrorsArray,SuccessCount", ErrorsArray, SuccessCount);

    Return Result;

EndFunction

Function CheckSingleQueryExecution(Val Result
    , Val Transaction
    , Val Counter
    , SuccessCount
    , ErrorsArray)

    If Result["result"] Then
            SuccessCount = SuccessCount + 1;
        Else

            ErrorsArray.Add(New Structure("row,error", Counter, Result["error"]));

            If Transaction Then
                Return False;
            EndIf;

    EndIf;

    Return True;

EndFunction

Function CheckRecordCorrectness(Record, ErrorsArray, Val Counter)

    CollectionError = "Invalid data";
    Correct         = True;

    Try
        OPI_TypeConversion.GetKeyValueCollection(Record, CollectionError);
    Except
        ErrorsArray.Add(New Structure("row,error", Counter, CollectionError));
        Correct = False;
    EndTry;

    Return Correct;

EndFunction

Function AddRow(Val Module, Val Table, Val Record, Val Connection, Val ExecuteNow = True)

    FieldArray  = New Array;
    ValuesArray = New Array;

    Scheme = NewSQLScheme("INSERT", Module);
    SetTableName(Scheme, Table);

    SplitDataCollection(Record, FieldArray, ValuesArray);

    For Each Field In FieldArray Do
        AddField(Scheme, Field);
    EndDo;

    Request = FormSQLText(Scheme);

    If ExecuteNow Then
        Result = Module.ExecuteSQLQuery(Request, ValuesArray, , Connection);
    Else

        Parameters = ProcessParameters(Connection
            , ValuesArray
            , Module.GetTypesStructure());

        Result = New Map;
        Result.Insert("text"        , Request);
        Result.Insert("params"      , Parameters);
        Result.Insert("force_result", False);

    EndIf;

    Return Result;

EndFunction

Function ProcessRecordsStart(Val Module, Val Transaction, Val Connection)

    If Not OPI_AddIns.IsAddIn(Connection) Then
        Return Connection;
    EndIf;

    If Transaction Then

        Text  = Module.GetFeatures()["TransactionStart"];
        Start = Module.ExecuteSQLQuery(Text, , , Connection);

        If Not Start["result"] Then
            Return Start;
        EndIf;

    EndIf;

EndFunction

Function ProcessRecordsEnd(Val ProcessedStructure, Val Module, Val Transaction, Val Connection)

    ResultStrucutre = New Structure;

    ErrorsArray  = ProcessedStructure["ErrorsArray"];
    SuccessCount = ProcessedStructure["SuccessCount"];

    If Transaction Then

        If ErrorsArray.Count() > 0 Then

            Rollback = Module.ExecuteSQLQuery("ROLLBACK;", , , Connection);

            SuccessCount = 0;
            ResultStrucutre.Insert("rollback", Rollback);

        Else

            Completion = Module.ExecuteSQLQuery("COMMIT;", , , Connection);
            ResultStrucutre.Insert("commit", Completion);

        EndIf;

    EndIf;

    ResultStrucutre.Insert("result", ErrorsArray.Count() = 0);
    ResultStrucutre.Insert("rows"  , SuccessCount);
    ResultStrucutre.Insert("errors", ErrorsArray);

    Return ResultStrucutre;

EndFunction

Function NormalizeTable(Val Module
    , Val Table
    , Val ColoumnsStruct
    , Val TableColumns
    , Val Connection
    , Val Tls)

    FoundMapping = New Map;
    FieldName    = Module.GetFeatures()["ColumnField"];

    DeleteCode = 0;
    AddCode    = 1;
    IgnoreCode = 2;

    For Each Coloumn In TableColumns Do

        ColumnName = Coloumn[FieldName];

        If Not ValueIsFilled(ColumnName) Then
            Continue;
        Else
            FoundMapping.Insert(ColumnName, DeleteCode);
        EndIf;

    EndDo;

    If FoundMapping.Count() = 0 Then
        ResponseMapping     = New Map;
        ResponseMapping.Insert("result", "false");
        ResponseMapping.Insert("error" , "Unsupported table schema type");
        Return ResponseMapping;
    EndIf;

    For Each RequiredColumn In ColoumnsStruct Do

        ColumnName = RequiredColumn.Key;
        Exists     = FoundMapping.Get(ColumnName) <> Undefined;
        Action     = ?(Exists, IgnoreCode, AddCode);

        FoundMapping.Insert(ColumnName, Action);

    EndDo;

    For Each SchemaPart In FoundMapping Do

        ActionCode = SchemaPart.Value;
        ColumnName = SchemaPart.Key;

        If ActionCode = 0 Then

            Result = DeleteTableColumn(Module, Table, ColumnName, Connection, Tls);

        ElsIf ActionCode = 1 Then

            DataType = ColoumnsStruct[ColumnName];
            Result   = AddTableColumn(Module, Table, ColumnName, DataType, Connection, Tls);

        Else
            Continue;
        EndIf;

        If Not Result["result"] Then
            Raise Result["error"];
        EndIf;

    EndDo;

    Return Undefined;

EndFunction

Function FormFilterText(Val Filters)

    If Not ValueIsFilled(Filters) Then
        Return "";
    EndIf;

    FiltersText = "WHERE %1";

    FiltersArray = New Array;

    Counter = 1;
    Total   = Filters.Count();

    For Each Filter In Filters Do

        CurrentText = "%1 %2 %3 %4";

        Field      = Filter["field"];
        Type       = Filter["type"];
        Value      = Filter["value"];
        Connection = Filter["union"];
        Connection = ?(ValueIsFilled(Connection), Connection, "AND");

        If Counter     = Total Then
            Connection = "";
        EndIf;

        CurrentText = StrTemplate(CurrentText, Field, Type, Value, Connection);
        FiltersArray.Add(CurrentText);

        Counter = Counter + 1;

    EndDo;

    FiltersText = StrTemplate(FiltersText, StrConcat(FiltersArray, " "));

    Return FiltersText;

EndFunction

Function FormSortingText(Val Sort)

    If Not ValueIsFilled(Sort) Then
        Return "";
    EndIf;

    SortingText = "ORDER BY %1";

    SortArray = New Array;

    For Each Element In Sort Do

        SortArray.Add(Element["field"] + " " + Element["type"]);

    EndDo;

    SortingText = StrTemplate(SortingText, StrConcat(SortArray, ", "));

    Return SortingText;

EndFunction

Function FormCountText(Val Count)

    If Not ValueIsFilled(Count) Then
        Return "";
    EndIf;

    CountText = "LIMIT %1";
    CountText = StrTemplate(CountText, OPI_Tools.NumberToString(Count));

    Return CountText;

EndFunction

Function FormTopText(Val Count)

    If Not ValueIsFilled(Count) Then
        Return "";
    EndIf;

    CountText = "TOP %1";
    CountText = StrTemplate(CountText, OPI_Tools.NumberToString(Count));

    Return CountText;

EndFunction

Procedure SplitDataCollection(Val Record, FieldArray, ValuesArray)

    ErrorText = "Incorrect data set for updating";
    OPI_TypeConversion.GetKeyValueCollection(Record, ErrorText);

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

    //@skip-check bsl-legacy-check-for-each-statetement-collection
    For Each Field In Fields Do
        AddField(Scheme, Field);
    EndDo;

EndProcedure

Procedure FillFilters(Scheme, Val Filters)

    If Not ValueIsFilled(Filters) Then
        Return;
    EndIf;

    OPI_TypeConversion.GetArray(Filters);

    //@skip-check bsl-legacy-check-for-each-statetement-collection
    For Each Filter In Filters Do

        AddFilter(Scheme
            , Filter["field"]
            , ?(OPI_Tools.CollectionFieldExists(Filter, "type"), Filter["type"], "=")
            , Filter["value"]
            , ?(OPI_Tools.CollectionFieldExists(Filter, "union"), Filter["union"], "AND")
            , ?(OPI_Tools.CollectionFieldExists(Filter, "raw"), Filter["raw"], False));

    EndDo;

EndProcedure

Procedure FillSorting(Val Scheme, Val Sort)

    If Not ValueIsFilled(Sort) Then
        Return;
    EndIf;

    OPI_TypeConversion.GetCollection(Sort);

    //@skip-check bsl-legacy-check-for-each-statetement-collection
    For Each Element In Sort Do

        AddSorting(Scheme, Element.Key, Element.Value);

    EndDo;

EndProcedure

Procedure CheckSchemeRequiredFields(Scheme, Val Fields)

    RequiredFieldsArray = StrSplit(Fields, ",");
    AbsenteesArray      = OPI_Tools.FindMissingCollectionFields(Scheme, RequiredFieldsArray);

    If ValueIsFilled(AbsenteesArray) Then
        Raise "Required schema fields are missing: " + StrConcat(AbsenteesArray, ", ");
    EndIf;

EndProcedure

Procedure AddColoumn(Scheme, Val Name, Val Type) Export

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Type);

    If Not Scheme["type"] = "CREATE" Then
        Return;
    EndIf;

    ColoumnMap = New Map;
    ColoumnMap.Insert(Name, Type);

    Scheme["columns"].Add(ColoumnMap);

EndProcedure

Procedure AddField(Scheme, Val Name) Export

    OPI_TypeConversion.GetLine(Name);

    Scheme["set"].Add(Name);

EndProcedure

Procedure AddFilter(Scheme
    , Val Field
    , Val Type
    , Val Value
    , Val Grouping
    , Val Raw)

    OPI_TypeConversion.GetLine(Field);
    OPI_TypeConversion.GetLine(Type);
    OPI_TypeConversion.GetLine(Grouping);
    OPI_TypeConversion.GetBoolean(Raw);

    Numeration = Scheme["nump"];
    Marker     = Scheme["markp"];

    MainStructure = New Structure("field,type,union"
        , Field
        , Type
        , Grouping);

    If Raw Then

        MainStructure.Insert("value", String(Value));

    Else

        Scheme["values"].Add(Value);

        CurrentMarker = Marker;

        If Numeration Then
            OrderNumber   = Scheme["values"].Count();
            CurrentMarker = CurrentMarker + OPI_Tools.NumberToString(OrderNumber);
        EndIf;

        MainStructure.Insert("value", CurrentMarker);

    EndIf;

    Scheme["filter"].Add(MainStructure);

EndProcedure

Procedure AddSorting(Scheme, Val Field, Val Type)

    OPI_TypeConversion.GetLine(Field);
    OPI_TypeConversion.GetLine(Type);

    Scheme["order"].Add(New Structure("field,type", Field, Type));

EndProcedure

Procedure SetTableName(Scheme, Val Name)

    OPI_TypeConversion.GetLine(Name);

    Scheme.Insert("table", Name);

EndProcedure

Procedure SetBaseName(Scheme, Val Name)

    OPI_TypeConversion.GetLine(Name);

    Scheme.Insert("database", Name);

EndProcedure

Procedure SetLimit(Scheme, Val Count)

    OPI_TypeConversion.GetNumber(Count);

    Scheme.Insert("limit", Count);

EndProcedure

Procedure SetCustomField(Scheme, Val FieldName, Val Value, Val DataType)

    OPI_TypeConversion.GetLine(FieldName);

    OPI_Tools.AddField(FieldName, Value, DataType, Scheme);

EndProcedure

Procedure ReplaceDefaultFeatures(Features)

    DefaultFeatures = New Map;
    DefaultFeatures.Insert("ParameterNumeration", True); // nump
    DefaultFeatures.Insert("ParameterMarker"    , "?"); // markp
    DefaultFeatures.Insert("DBMS"               , ""); // dbms

    For Each Feature In Features Do
        DefaultFeatures.Insert(Feature.Key, Feature.Value);
    EndDo;

    Features = DefaultFeatures;

EndProcedure

#EndRegion

#Region ParamsProcessing

Function InitializeQuery(Val Connector, Val QueryText, Val ForceResult)

    If OPI_AddIns.FileTransferRequired() And StrLen(QueryText) > 1000 Then

        // BSLLS:MissingTemporaryFileDeletion-off

        //@skip-check missing-temporary-file-deletion
        TFN = GetTempFileName();

        // BSLLS:MissingTemporaryFileDeletion-on

        TextBD = GetBinaryDataFromString(QueryText);
        TextBD.Write(TFN);

        QueryKey = Connector.InitQuery(TFN, ForceResult, True);

        OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete query file after execution");

    Else
        QueryKey = Connector.InitQuery(QueryText, ForceResult, False);
    EndIf;

    QueryKey = OPI_Tools.JSONToStructure(QueryKey);

    Return QueryKey;

EndFunction

Function SetQueryParams(Val Connector, Val QueryKey, Val Parameters)

    If OPI_AddIns.FileTransferRequired() And ValueIsFilled(Parameters) Then

        // BSLLS:MissingTemporaryFileDeletion-off

        //@skip-check missing-temporary-file-deletion
        TFN = GetTempFileName();

        // BSLLS:MissingTemporaryFileDeletion-on

        Try
            OPI_Tools.WriteJSONFile(TFN, Parameters);
        Except
            ErrInfo = ErrorDescription();
            Raise StrTemplate("JSON parameter array validation error: %1", ErrInfo);
        EndTry;

        Adding = Connector.SetParamsFromFile(QueryKey, TFN);

        OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete query parameters file after execution");

    Else
        Parameters_ = OPI_Tools.JSONString(Parameters);
        Adding      = Connector.SetParamsFromString(QueryKey, Parameters_);
    EndIf;

    Adding = OPI_Tools.JsonToStructure(Adding);

    Return Adding;

EndFunction

Function ProcessQueryResult(Val Connector, Val QueryKey, Val ExecutionResult)

    ExecutionResult = OPI_Tools.JsonToStructure(ExecutionResult);

    If Not ExecutionResult["result"] Then

        Return ExecutionResult;

    ElsIf ExecutionResult["data"] = False Then

        ExecutionResult.Delete("data");
        Return ExecutionResult;

    Else

        If OPI_AddIns.FileTransferRequired() Then

            // BSLLS:MissingTemporaryFileDeletion-off

            //@skip-check missing-temporary-file-deletion
            TFN = GetTempFileName();

            // BSLLS:MissingTemporaryFileDeletion-on

            Result = Connector.GetResultAsFile(QueryKey, TFN);
            Result = OPI_Tools.JsonToStructure(Result);

            If Result["result"] Then
                Result = OPI_Tools.ReadJSONFile(TFN, True);
            EndIf;

            OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete result file after execution");

        Else
            Result = Connector.GetResultAsString(QueryKey);
            Result = OPI_Tools.JsonToStructure(Result);
        EndIf;

        Return Result;

    EndIf;

EndFunction

Function ProcessParameter(Val AddIn, CurrentParameter, TypesStructure, AsObject = True)

    CurrentType = DefineParameterType(CurrentParameter);
    CurrentKey  = TypesStructure.Get(CurrentType);

    If CurrentType = "BinaryData" Then

        CurrentParameter = ProcessBlob(AddIn, CurrentParameter);

    ElsIf CurrentType = "UUID" Then

        CurrentParameter = String(CurrentParameter);

    ElsIf CurrentType = "Date" Then

        CurrentParameter = OPI_Tools.DateRFC3339(CurrentParameter);

    ElsIf OPI_Tools.ThisIsCollection(CurrentParameter) Then

        ProcessCollectionParameter(AddIn
            , CurrentType
            , TypesStructure
            , CurrentParameter
            , CurrentKey);

    ElsIf CurrentType = "Whole" Or CurrentType = "Float" Then

        OPI_TypeConversion.GetNumber(CurrentParameter);

    ElsIf CurrentType = "Boolean" Then

        OPI_TypeConversion.GetBoolean(CurrentParameter);

        If TypesStructure.Get("BoolAsNumber") Then
            CurrentParameter = ?(CurrentParameter, 1, 0);
        EndIf;

    Else

        OPI_TypeConversion.GetLine(CurrentParameter);

    EndIf;

    If AsObject And Not CurrentParameter = Undefined Then
        CurrentParameter                 = New Structure(CurrentKey, CurrentParameter);
    EndIf;

    Return CurrentParameter;

EndFunction

Function ProcessBlob(Val AddIn, Val Value)

    Result = OPI_AddIns.PutData(AddIn, Value);

    If Not Result["result"] Then
        Raise StrTemplate("Binary data transfer error: %1", Result["error"]);
    EndIf;

    Return Result["key"];

EndFunction

Function DefineParameterType(Val CurrentParameter)

    CurrentType = TypeOf(CurrentParameter);

    SimpleComparison = New Array;
    SimpleComparison.Add("BinaryData");
    SimpleComparison.Add("UUID");
    SimpleComparison.Add("Structure");
    SimpleComparison.Add("Map");
    SimpleComparison.Add("Array");
    SimpleComparison.Add("Boolean");
    SimpleComparison.Add("Date");
    SimpleComparison.Add("String");
    SimpleComparison.Add("Undefined");

    If CurrentType                     = Type("Number") Then
        Return ?(Int(CurrentParameter) = CurrentParameter, "Whole", "Float");
    Else

        For Each TypeName In SimpleComparison Do

            If CurrentType = Type(TypeName) Then
                Return TypeName;
            EndIf;

        EndDo;

    EndIf;

    Raise StrTemplate("Parameter type not supported: %1", String(CurrentType));

EndFunction

Procedure ProcessCollectionParameter(Val AddIn
    , Val CurrentType
    , Val TypesStructure
    , CurrentParameter
    , CurrentKey)

    CollectionsTypes = TypesStructure.Get("Collections");
    BinaryType       = TypesStructure.Get("BinaryData");
    TypeString       = TypesStructure.Get("String");

    If CurrentType = "Structure" Or CurrentType = "Map" Then

        //@skip-check bsl-legacy-check-for-each-statetement-collection
        For Each ParamElement In CurrentParameter Do

            CurrentKey   = Upper(ParamElement.Key);
            CurrentValue = ParamElement.Value;

            If CollectionsTypes.FindByValue(CurrentKey) <> Undefined Then
                CurrentParameter = CurrentValue;

            ElsIf CurrentKey     = BinaryType Then
                CurrentParameter = ProcessBlob(AddIn, CurrentValue);
            Else
                CurrentParameter = ProcessParameter(AddIn, CurrentValue, TypesStructure, False);
            EndIf;

            Break;

        EndDo;

    Else

        OPI_TypeConversion.GetLine(CurrentParameter);
        CurrentKey = TypeString;

    EndIf;

EndProcedure

#EndRegion

#EndRegion
