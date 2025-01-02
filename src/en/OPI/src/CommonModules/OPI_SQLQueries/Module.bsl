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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section

// Uncomment if OneScript is executed
// #Use "./internal"

#Region Internal

Function NewSQLScheme(Val Action) Export

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

    Else

        Scheme = New Structure;

    EndIf;

    Return Scheme;

EndFunction

Function FormSQLText(Val Scheme) Export

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

    Else

        QueryText = "";

    EndIf;

    Return QueryText;

EndFunction

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

Procedure AddFilter(Scheme, Val Field, Val Type, Val Value, Val Grouping, Val Raw) Export

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

Procedure AddSorting(Scheme, Val Field, Val Type) Export

    OPI_TypeConversion.GetLine(Field);
    OPI_TypeConversion.GetLine(Type);

    Scheme["sort"].Add(New Structure("field,type", Field, Type));

EndProcedure


Procedure SetTableName(Scheme, Val Name) Export

    OPI_TypeConversion.GetLine(Name);

    Scheme.Insert("table", Name);

EndProcedure

Procedure SetLimit(Scheme, Val Count) Export

    OPI_TypeConversion.GetNumber(Count);

    Scheme.Insert("limit", Count);

EndProcedure

#EndRegion

#Region Private

#Region Scheme

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

    Scheme.Insert("table" , "");
    Scheme.Insert("set"   , New Array);
    Scheme.Insert("filter", New Array);

    Return Scheme;

EndFunction

Function EmptySchemeDelete()

    Scheme = New Structure("type", "DELETE");

    Scheme.Insert("table" , "");
    Scheme.Insert("filter", New Array);

    Return Scheme;

EndFunction

Function EmptySchemeCreate()

    Scheme = New Structure("type", "CREATE");

    Scheme.Insert("table"  , "");
    Scheme.Insert("columns", New Array);

    Return Scheme;

EndFunction

#EndRegion

#Region Processors

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

    TextSQL = StrTemplate(SQLTemplate, Table, Fields, OptionsBlock);

    Return TextSQL;

EndFunction

Function FormTextInsert(Val Scheme)

    CheckSchemeRequiredFields(Scheme, "table,set");

    Table  = Scheme["table"];
    Fields = Scheme["set"];

    SQLTemplate = "INSERT INTO %1 (%2) VALUES (%3)";

    Parameters = New Array;

    For N = 1 To Fields.Count() Do
        Parameters.Add("?" + OPI_Tools.NumberToString(N));
    EndDo;

    TextSQL = StrTemplate(SQLTemplate
        , Table
        , StrConcat(Fields, ", ")
        , StrConcat(Parameters, ", "));

    Return TextSQL;

EndFunction

Function FormTextUpdate(Val Scheme)

    TextSQL = "";

    Return TextSQL;

EndFunction

Function FormTextDelete(Val Scheme)

    TextSQL = "";

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

#EndRegion

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
        SortArray.Add(Element.Key + " " + Element.Value);
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

Procedure CheckSchemeRequiredFields(Scheme, Val Fields)

    RequiredFieldsArray = StrSplit(Fields, ",");
    AbsenteesArray      = OPI_Tools.FindMissingCollectionFields(Scheme, RequiredFieldsArray);

    If ValueIsFilled(AbsenteesArray) Then
        Raise "Required schema fields are missing: " + StrConcat(AbsenteesArray, ", ");
    EndIf;

EndProcedure

#EndRegion
