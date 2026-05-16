// OneScript: ./OInt/tools/main/Modules/internal/Modules/internal/Modules/OPI_ToolsServerCall.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:DeprecatedCurrentDate-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method

#Region Internal

Procedure SetSessionParameter(Val Name, Val Value) Export
     SessionParameters[Name] =    Value; // !OPI
EndProcedure

Procedure SetConstant(Val Name, Val Value) Export

    Constants[Name].Set(Value); // !OPI
    // !OInt Return;

EndProcedure

Function GetDecodedString(Val Value, Val Way) Export

    If TypeOf(Way) = Type("String") Then
        EncodingType  = StringEncodingMethod[Way];
    Else
        EncodingType  = Way;
    EndIf;

    Return DecodeString(Value, EncodingType);

EndFunction

Function GetEncodedString(Val Value, Val Way) Export

    If TypeOf(Way) = Type("String") Then
        EncodingType  = StringEncodingMethod[Way];
    Else
        EncodingType  = Way;
    EndIf;

    Return EncodeString(Value, EncodingType);

EndFunction

Function GetXMLString(Val Value) Export
    Return XMLString(Value);
EndFunction

Function SortStructureByKey(Val Value) Export

    Table = New ValueTable;
    Table.Columns.Add("Key");
    Table.Columns.Add("Value");

    For Each Data In Value Do

        NewLine       = Table.Add();
        NewLine.Key   = Data.Key;
        NewLine.Value = Data.Value;

    EndDo;

    Table.Sort("Key");

    ReturnedStructure = New Structure;

    For Each TableRow In Table Do

        ReturnedStructure.Insert(TableRow.Key, TableRow.Value);

    EndDo;

    Return ReturnedStructure;

EndFunction

Function GetCurrentUniversalDate() Export
    Return CurrentUniversalDate();
EndFunction

Function GetCurrentSessionDate() Export
    Return CurrentSessionDate(); // !OPI
    // !OInt Return CurrentDate();
EndFunction

Function GetCommonTemplateText(Val TemplateName) Export

    Template = Undefined;
    Template = GetCommonTemplate(TemplateName); // !OPI
    Value    = Template.GetText();

    Return Value;

EndFunction

Function GetSessionParameter(Val Name) Export

    Try
        Return SessionParameters[Name]; // !OPI
    Except
        Return Undefined;
    EndTry;

EndFunction

Function GetConstant(Val Name) Export

    Return Constants[Name].Get(); // !OPI
    // !OInt Return Undefined;

EndFunction

Function Hash(BinaryData, Type) Export

    If TypeOf(Type) = Type("String") Then
        HashType       = HashFunction[Type];
    Else
        HashType       = Type;
    EndIf;

    Hashing = New DataHashing(HashType);
    Hashing.Append(BinaryData);

    Return Hashing.HashSum;

EndFunction

Function ModalityDisabled() Export

    Return Metadata.ModalityUseMode = Metadata.ObjectProperties.ModalityUseMode.DontUse; // !OPI
    // !OInt Return False;

EndFunction

Function GetAddInList() Export

    // !OInt Metadata = Undefined;

    TemplatesNameArray = New Array;

    For Each Template In Metadata.CommonTemplates Do

        If StrStartWith(Template.Name, "OPI_")
            And String(Template.TemplateType) = "AddIn" Then

            TemplatesNameArray.Add(Template.Name);

        EndIf;

    EndDo;

    Return TemplatesNameArray;

EndFunction

Function GetAddInVersion(Val TemplateName) Export

    AddIn = OPI_AddIns.GetAddIn(TemplateName, , True); // !OPI
    Return AddIn.Version(); // !OPI
    // !OInt Return Undefined;

EndFunction

#EndRegion
