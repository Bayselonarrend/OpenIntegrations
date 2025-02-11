// OneScript: ./OInt/tools/Modules/OPI_SQLQueries.os

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
// BSLLS:QueryParseError-off
// BSLLS:AssignAliasFieldsInQuery-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// Uncomment if OneScript is executed
// #Use "./internal"

#Region Internal

Function CreateDatabase(Val Module, Val Base, Val Connection = "") Export

    Scheme = NewSQLScheme("CREATEDATABASE");

    SetBaseName(Scheme, Base);

    Request   = FormSQLText(Scheme);
    Result = Module.ExecuteSQLQuery(Request, , , Connection);

    Return Result;

EndFunction

Function DropDatabase(Val Module, Val Base, Val Connection = "") Export

    Scheme = NewSQLScheme("DROPDATABASE");

    SetBaseName(Scheme, Base);

    Request   = FormSQLText(Scheme);
    Result = Module.ExecuteSQLQuery(Request, , , Connection);

    Return Result;

EndFunction

Function CreateTable(Val Module, Val Table, Val ColoumnsStruct, Val Connection = "") Export

    ErrorText = "The column structure is not a valid key-value structure";
    OPI_TypeConversion.GetKeyValueCollection(ColoumnsStruct, ErrorText);

    Scheme = NewSQLScheme("CREATE");

    SetTableName(Scheme, Table);

    For Each Coloumn In ColoumnsStruct Do
        AddColoumn(Scheme, Coloumn.Key, Coloumn.Value);
    EndDo;

    Request = FormSQLText(Scheme);
    Result  = Module.ExecuteSQLQuery(Request, , , Connection);

    Return Result;

EndFunction

Function AddRecords(Val Module
    , Val Table
    , Val DataArray
    , Val Transaction = True
    , Val Connection  = "") Export

    OPI_TypeConversion.GetArray(DataArray);
    OPI_TypeConversion.GetBoolean(Transaction);

    Connection  = CreateConnectionInsideModule(Module.ConnectorName(), Connection);
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
    , Val Connection = "") Export

    Scheme = NewSQLScheme("SELECT");

    SetTableName(Scheme, Table);
    SetLimit(Scheme, Count);

    FillFields(Scheme, Fields);
    FillFilters(Scheme, Filters);
    FillSorting(Scheme, Sort);

    Request = FormSQLText(Scheme);

    Result = Module.ExecuteSQLQuery(Request, Scheme["values"], , Connection);

    Return Result;

EndFunction

Function UpdateRecords(Val Module
    , Val Table
    , Val ValueStructure
    , Val Filters    = ""
    , Val Connection = "") Export

    Scheme = NewSQLScheme("UPDATE");

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
    Result  = Module.ExecuteSQLQuery(Request, Scheme["values"], , Connection);

    Return Result;

EndFunction

Function DeletePosts(Val Module, Val Table, Val Filters = "", Val Connection = "") Export

    Scheme = NewSQLScheme("DELETE");

    SetTableName(Scheme, Table);

    FillFilters(Scheme, Filters);

    Request = FormSQLText(Scheme);
    Result  = Module.ExecuteSQLQuery(Request, Scheme["values"], , Connection);

    Return Result;

EndFunction

Function DeleteTable(Val Module, Val Table, Val Connection = "") Export

    Scheme = NewSQLScheme("DROP");

    SetTableName(Scheme, Table);

    Request = FormSQLText(Scheme);
    Result  = Module.ExecuteSQLQuery(Request, , , Connection);

    Return Result;

EndFunction

Function ClearTable(Val Module, Val Table, Val Connection = "") Export

    Scheme = NewSQLScheme("TRUNCATE");

    SetTableName(Scheme, Table);

    Request = FormSQLText(Scheme);
    Result  = Module.ExecuteSQLQuery(Request, , , Connection);

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

#EndRegion

#Region Private

#Region Scheme

Function NewSQLScheme(Val Action, Val Features = Undefined)

    OPI_TypeConversion.GetLine(Action);

    Action = Upper(Action);

    If Action = "SELECT" Then

        Scheme = EmptySchemeSelect();

    ElsIf Action = "INSERT" Then

        Scheme = EmptySchemeInsert(Features);

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

    Else

        Scheme = New Structure;

    EndIf;

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

Function EmptySchemeInsert(Val Features)

    Scheme = New Structure("type", "INSERT");

    ParameterNumeration = ?(ValueIsFilled(Features), Features["ParameterNumeration"], False);
    ParameterMarker     = ?(ValueIsFilled(Features), Features["ParameterMarker"] , "?");

    Scheme.Insert("table", "");
    Scheme.Insert("set"  , New Array);
    Scheme.Insert("nump" , ParameterNumeration);
    Scheme.Insert("markp", ParameterMarker);

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

Function EmptySchemeCreateDatabase();

    Scheme = New Structure("type", "CREATEDATABASE");

    Scheme.Insert("database" , "");

    Return Scheme;

EndFunction

Function EmptySchemeDropDatabase();

    Scheme = New Structure("type", "DROPDATABASE");

    Scheme.Insert("database" , "");

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

    SQLTemplate = "SELECT %1 FROM %2
    |%3";

    OptionsBlock = ForSelectOptionsText(Filters, Sort, Count);

    TextSQL = StrTemplate(SQLTemplate, StrConcat(Fields, ", "), Table, OptionsBlock);

    Return TextSQL;

EndFunction

Function FormTextInsert(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table,set");

    Table   = Scheme["table"];
    Fields  = Scheme["set"];
    Numeration = Scheme["nump"];
    Marker     = Scheme["markp"];

    SQLTemplate = "INSERT INTO %1 (%2) VALUES (%3)";

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

    Table   = Scheme["table"];
    Fields  = Scheme["set"];
    Filters = Scheme["filter"];

    SQLTemplate = "UPDATE %1 SET %2 %3";

    FilterText = FormFilterText(Filters);

    For N = 0 To Fields.UBound() Do

        Fields[N] = Fields[N] + " = ?" + OPI_Tools.NumberToString(N + 1);

    EndDo;

    TextSQL = StrTemplate(SQLTemplate, Table, StrConcat(Fields, "," + Chars.LF), FilterText);

    Return TextSQL;

EndFunction

Function FormTextDelete(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table");

    Table   = Scheme["table"];
    Filters = Scheme["filter"];

    SQLTemplate = "DELETE FROM %1 %2";

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
    | )";

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

    SQLTemplate = "DROP TABLE %1";

    TextSQL = StrTemplate(SQLTemplate, Table);

    Return TextSQL;

EndFunction

Function FormTextTruncate(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table");

    Table = Scheme["table"];

    SQLTemplate = "TRUNCATE TABLE %1";

    TextSQL = StrTemplate(SQLTemplate, Table);

    Return TextSQL;

EndFunction

Function FormTextCreateDatabase(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "database");

    Base = Scheme["database"];

    SQLTemplate = "CREATE DATABASE %1";

    TextSQL = StrTemplate(SQLTemplate, Base);

    Return TextSQL;

EndFunction

Function FormTextDropDatabase(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "database");

    Base = Scheme["database"];

    SQLTemplate = "DROP DATABASE %1";

    TextSQL = StrTemplate(SQLTemplate, Base);

    Return TextSQL;

EndFunction

#EndRegion

#Region Auxiliary

Function ProcessRecords(Val Module, Val Table, Val DataArray, Val Transaction, Val Connection)

    ErrorsArray     = New Array;
    CollectionError = "Invalid data";
    Counter         = 0;
    SuccessCount    = 0;

    For Each Record In DataArray Do

        Counter = Counter + 1;

        Try
            OPI_TypeConversion.GetKeyValueCollection(Record, CollectionError);
        Except

            ErrorsArray.Add(New Structure("row,error", Counter, CollectionError));

            If Transaction Then
                Break;
            Else
                Continue;
            EndIf;

        EndTry;

        Result = AddRow(Module, Table, Record, Connection);

        If Result["result"] Then

            SuccessCount = SuccessCount + 1;

        Else

            ErrorsArray.Add(New Structure("row,error", Counter, Result["error"]));

        EndIf;

    EndDo;

    Result = New Structure("ErrorsArray,SuccessCount", ErrorsArray, SuccessCount);
    Return Result;

EndFunction

Function ProcessRecordsStart(Val Module, Val Transaction, Val Connection)

    If Not IsAddIn(Connection) Then
        Return Connection;
    EndIf;

    If Transaction Then

        Start = Module.ExecuteSQLQuery("BEGIN TRANSACTION", , , Connection);

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

            Rollback = Module.ExecuteSQLQuery("ROLLBACK", , , Connection);

            SuccessCount = 0;
            ResultStrucutre.Insert("rollback", Rollback);

        Else

            Completion = Module.ExecuteSQLQuery("COMMIT", , , Connection);
            ResultStrucutre.Insert("commit", Completion);

        EndIf;

    EndIf;

    ResultStrucutre.Insert("result", ErrorsArray.Count() = 0);
    ResultStrucutre.Insert("rows"  , SuccessCount);
    ResultStrucutre.Insert("errors", ErrorsArray);

    Return ResultStrucutre;

EndFunction

Function AddRow(Val Module, Val Table, Val Record, Val Connection)

    FieldArray  = New Array;
    ValuesArray = New Array;

    Features = Module.GetFeatures();

    Scheme = NewSQLScheme("INSERT", Features);
    SetTableName(Scheme, Table);

    SplitDataCollection(Record, FieldArray, ValuesArray);

    For Each Field In FieldArray Do
        AddField(Scheme, Field);
    EndDo;

    Request = FormSQLText(Scheme);

    Result = Module.ExecuteSQLQuery(Request, ValuesArray, , Connection);

    Return Result;

EndFunction

Function ForSelectOptionsText(Val Filters, Val Sort, Val Count)

    BlockTemplate = "%1
    |%2
    |%3";

    FilterText  = FormFilterText(Filters);
    SortingText = FormSortingText(Sort);
    CountText   = FormCountText(Count);

    BlockText = StrTemplate(BlockTemplate, FilterText, SortingText, CountText);

    Return BlockText;

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

Function CreateConnectionInsideModule(Val Connector, Val Base)

    If IsAddIn(Base) Then
        Return Base;
    EndIf;

    OPI_TypeConversion.GetLine(Base);
    OPI_Tools.RestoreEscapeSequences(Base);

    FieldName    = GetPrimaryFieldName(Connector);
    Connector = AttachAddInOnServer(Connector);

    Connector[FieldName] = Base;

    Result = Connector.Connect();
    Result = OPI_Tools.JsonToStructure(Result, False);

    Return ?(Result["result"], Connector, Result);

EndFunction

Function IsAddIn(Val Value)

    ValeType = String(TypeOf(Value));
    Return StrStartsWith(ValeType, "AddIn.");

EndFunction

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

Function GetPrimaryFieldName(Val Connector)

    If Connector = "OPI_SQLite" Then
        Return "Database";
    Else
        Return "ConnectionString";
    EndIf;

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

    For Each Field In Fields Do
        AddField(Scheme, Field);
    EndDo;

EndProcedure

Procedure FillFilters(Scheme, Val Filters)

    If Not ValueIsFilled(Filters) Then
        Return;
    EndIf;

    OPI_TypeConversion.GetArray(Filters);

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

Procedure AddFilter(Scheme, Val Field, Val Type, Val Value, Val Grouping, Val Raw)

    OPI_TypeConversion.GetLine(Field);
    OPI_TypeConversion.GetLine(Type);
    OPI_TypeConversion.GetLine(Grouping);
    OPI_TypeConversion.GetBoolean(Raw);

    MainStructure = New Structure("field,type,union"
        , Field
        , Type
        , Grouping);

    If Raw Then

        MainStructure.Insert("value", String(Value));

    Else

        Scheme["values"].Add(Value);

        OrderNumber = Scheme["values"].Count();
        MainStructure.Insert("value", "?" + OPI_Tools.NumberToString(OrderNumber));

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

#EndRegion

#EndRegion
