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

    Scheme["columns"].Add(New Structure(Name, Type));

EndProcedure

Procedure SetTableName(Scheme, Val Name) Export

    OPI_TypeConversion.GetLine(Name);

    Scheme.Insert("table", Name);

EndProcedure

#EndRegion

#Region Private

#Region Scheme

Function EmptySchemeSelect()

    Scheme = New Structure("type", "SELECT");

    Scheme.Insert("table"   , "");
    Scheme.Insert("filter"  , New Array);
    Scheme.Insert("order_by", New Array);
    Scheme.Insert("limit"   , New Array);
    Scheme.Insert("fileds"  , New Array);

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

EndFunction

Function FormTextInsert(Val Scheme)

EndFunction

Function FormTextUpdate(Val Scheme)

EndFunction

Function FormTextDelete(Val Scheme)

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
        ColoumnsDescriptionArray.Add(StrTemplate(ColoumTemplate, Coloumn.Key, Coloumn.Value));
    EndDo;

    ColoumnsDescription = StrConcat(ColoumnsDescriptionArray, "," + Chars.LF);

    TextSQL = StrTemplate(SQLTemplate, )

EndFunction

#EndRegion

Procedure CheckSchemeRequiredFields(Scheme, Val Fields)

    RequiredFieldsArray = StrConcat(Fields, ",");
    AbsenteesArray      = OPI_Tools.FindMissingCollectionFields(RequiredFieldsArray);

    If ValueIsFilled(AbsenteesArray) Then
        Raise "Required schema fields are missing: " + StrConcat(AbsenteesArray, ", ");
    EndIf;

EndProcedure

#EndRegion
