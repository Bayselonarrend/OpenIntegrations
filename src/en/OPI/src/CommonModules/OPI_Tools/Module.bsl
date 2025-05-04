﻿// OneScript: ./OInt/tools/Modules/internal/Modules/OPI_Tools.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method

#Region Internal

#Region WebMethods

Function RequestParametersToString(Val Parameters, Val SplitArrayParams = False, Val Start = True) Export

    If Parameters.Count() = 0 Then
        Return "";
    EndIf;

    ParameterString = ?(Start, "?", "&");

    For Each Parameter In Parameters Do

        CurrentValue = Parameter.Value;
        CurrentKey   = Parameter.Key;

        If Not TypeOf(CurrentValue) = Type("Array") Or Not SplitArrayParams Then

            ParameterValue = ConvertParameterToString(CurrentValue);

            ParameterString = ParameterString + Parameter.Key + "=" + ParameterValue + "&";

        Else

            ParameterValue  = SplitArrayAsURLParameters(CurrentKey, CurrentValue);
            ParameterString = ParameterString + ParameterValue + "&";

        EndIf;

    EndDo;

    ParameterString = Left(ParameterString, StrLen(ParameterString) - 1);

    Return ParameterString;

EndFunction

Function RequestParametersToMap(Val ParameterString) Export

    ReturnMapping  = New Map;
    NumberOfParts  = 2;
    ParameterArray = StrSplit(ParameterString, "&", False);

    For Each Parameter In ParameterArray Do

        KeyValueArray = StrSplit(Parameter, "=");

        If KeyValueArray.Count() = NumberOfParts Then
            ReturnMapping.Insert(KeyValueArray[0], KeyValueArray[1]);
        Else
            ReturnMapping.Insert(KeyValueArray[0], Undefined);
        EndIf;

    EndDo;

    Return ReturnMapping;

EndFunction

Function SplitURL(Val URL) Export

    OPI_TypeConversion.GetLine(URL);

    RestoreEscapeSequences(URL);

    SecureConnection = Not StrStartsWith(URL, "http://");

    URL = StrReplace(URL, "https://", "");
    URL = StrReplace(URL, "http://" , "");

    If StrFind(URL, "/") = 0 Then
        Address          = "";
        Domain           = URL;
    Else
        Address          = Right(URL, StrLen(URL) - StrFind(URL, "/", SearchDirection.FromBegin) + 1);
        Domain           = Left(URL, StrFind(URL, "/", SearchDirection.FromBegin) - 1);
    EndIf;

    If StrFind(Domain, ":") <> 0 Then

        HostPort = StrSplit(Domain, ":");
        Domain   = HostPort[0];
        Port     = HostPort[1];

        OPI_TypeConversion.GetNumber(Port);

    Else

        Port = ?(SecureConnection, 443, 80);

    EndIf;

    If IsOneScript() And SecureConnection Then
        Host = "https://" + Domain;
    Else
        Host = Domain;
    EndIf;

    ReturnStructure = New Structure;
    ReturnStructure.Insert("Host"    , Host);
    ReturnStructure.Insert("Address" , Address);
    ReturnStructure.Insert("Safe"    , SecureConnection);
    ReturnStructure.Insert("Port"    , Port);
    ReturnStructure.Insert("Domain"  , Domain);

    Return ReturnStructure;

EndFunction

Function GetDomain(Val ConnectionString) Export

    Domain = String(ConnectionString);

    If Not StrStartsWith(Lower(Domain), "http") And StrFind(Domain, "@") <> 0 Then

        Parts  = StrSplit(Domain, "@");
        Domain = Parts[1];

    EndIf;

    ProtocolEnd = StrFind(Domain, "://");
    Slashes     = 2;

    If ProtocolEnd > 0 Then
        Domain = Right(Domain, StrLen(Domain) - (ProtocolEnd + Slashes));
    EndIf;

    If StrFind(Domain, ":") <> 0 Then

        HostPort = StrSplit(Domain, ":");
        Domain   = HostPort[0];

    EndIf;

    If StrFind(Domain, "/") > 0 Then
        Domain = Left(Domain, StrFind(Domain, "/", SearchDirection.FromBegin) - 1);
    EndIf;

    Domain = StrReplace(Domain, "www.", "");

    Return Domain;

EndFunction

#EndRegion

#Region JSON

Function JsonToStructure(Val Text, Val ToMap = True) Export

    JSONReader = New JSONReader;
    TextType   = TypeOf(Text);

    If TextType = Type("BinaryData") Then

        Text = GetStringFromBinaryData(Text);
        JSONReader.SetString(Text);

    ElsIf TextType = Type("Stream") Or TextType = Type("MemoryStream") Or TextType = Type("FileStream") Then

        If IsOneScript() Then

            DataReader    = New DataReader(Text);
            ReadingResult = DataReader.Read();
            JSONBinary    = ReadingResult.GetBinaryData();

            JSONReader.SetString(GetStringFromBinaryData(JSONBinary));
            DataReader.Close();

        Else
            JSONReader.OpenStream(Text);
        EndIf;

    Else

        OPI_TypeConversion.GetLine(Text, True);
        JSONReader.SetString(Text);

    EndIf;

    Data = ReadJSON(JSONReader, ToMap, Undefined, JSONDateFormat.ISO);
    JSONReader.Close();

    Return Data;

EndFunction

Function JSONString(Val Data
    , Val Escaping     = "None"
    , Val LineBreaks   = True
    , Val DoubleQuotes = True) Export

    LineBreak = ?(LineBreaks, JSONLineBreak.Windows, JSONLineBreak.None);

    JSONParameters = New JSONWriterSettings(LineBreak
        , " "
        , DoubleQuotes
        , JSONCharactersEscapeMode[Escaping]
        , False
        , False
        , False
        , False);

    Try

        JSONWriter = New JSONWriter;
        JSONWriter.SetString(JSONParameters);

        WriteJSON(JSONWriter, Data);
        Return JSONWriter.Close();

    Except
        Return "NOT JSON: " + String(Data);
    EndTry;

EndFunction

Function ReadJSONFile(Val Path) Export

    JSONReader = New JSONReader;
    JSONReader.OpenFile(Path);
    Values     = ReadJSON(JSONReader);

    JSONReader.Close();

    Return Values;

EndFunction

#EndRegion

#Region XML

Function ProcessXML(XML) Export

    XMLInitialProcessing(XML);

    ReturnValue = New Map;

    While XML.Read() Do

        NodeType = XML.NodeType;

        If Not RelevantNodeType(NodeType) Then
            Continue;
        EndIf;

        NodeName = XML.Name;

        ExistingValue = ReturnValue.Get(NodeName);

        If NodeType = XMLNodeType.StartElement Then

            If ExistingValue = Undefined Then
                ReturnValue.Insert(NodeName, ProcessXML(XML));
            Else
                ValueToArray(ExistingValue);
                ExistingValue.Add(ProcessXML(XML));
                ReturnValue.Insert(NodeName, ExistingValue);
            EndIf;

        Else

            If Not NodeType = XMLNodeType.EndElement Then
                ReturnValue = XML.Value;
                XML.Read();
            EndIf;

            Break;

        EndIf;

    EndDo;

    Return ReturnValue;

EndFunction

Function GetXML(Value, TargetNamespace = "", XMLWriter = Undefined) Export

    Start = StartFormingXML(Value, XMLWriter);

    ValeType = TypeOf(Value);

    If ValeType = Type("Structure") Or ValeType = Type("Map") Then

        For Each CollectionValue In Value Do

            XMLWriter.WriteStartElement(CollectionValue.Key, TargetNamespace);

            If ValueIsFilled(TargetNamespace) Then
                XMLWriter.WriteNamespaceMapping("", TargetNamespace);
            EndIf;

            GetXML(CollectionValue.Value, "", XMLWriter);
            XMLWriter.WriteEndElement();

        EndDo;

    ElsIf ValeType = Type("Array") Then

        For Each ArrayElement In Value Do
            GetXML(ArrayElement, "", XMLWriter);
        EndDo;

    Else

        XMLWriter.WriteText(NumberToString(Value));

    EndIf;

    If Start Then
        Return XMLWriter.Close();
    Else
        Return Undefined;
    EndIf;

EndFunction

#EndRegion

#Region Collections

Procedure AddField(Val Name, Val Value, Val Type, Collection) Export

    Filled = ValueIsFilled(Value);

    If Not Filled Then
        Return;
    EndIf;

    If Type   = "Date" Then
        OPI_TypeConversion.GetDate(Value);
        Value = UNIXTime(Value);

    ElsIf Type = "DateISO" Then
        OPI_TypeConversion.GetDate(Value);
        Value  = Left(XMLString(Value), 19);

    ElsIf Type = "DateISOZ" Then
        OPI_TypeConversion.GetDate(Value);
        Value  = Left(XMLString(Value), 19) + "Z";

    ElsIf Type = "DateWithoutTime" Then
        OPI_TypeConversion.GetDate(Value);
        Value = Format(Value, "DF=yyyy-MM-dd");

    ElsIf Type = "Collection" Then
        OPI_TypeConversion.GetCollection(Value);

    ElsIf Type = "Boolean" Then
        OPI_TypeConversion.GetBoolean(Value);

    ElsIf Type = "FileString" Then
        OPI_TypeConversion.GetLine(Value, True);

    ElsIf Type = "Array" Then
        OPI_TypeConversion.GetArray(Value);

    ElsIf Type = "BinaryData" Then
        OPI_TypeConversion.GetBinaryData(Value);

    ElsIf Type = "Number" Then
        OPI_TypeConversion.GetNumber(Value);

    ElsIf Type = "UUID" Then
        OPI_TypeConversion.GetLine(Value);
        Value  = New UUID(Value);

    Else

        If Not Type = "Current" Then
            OPI_TypeConversion.GetLine(Value);
        EndIf;

    EndIf;

    Collection.Insert(Name, Value);

EndProcedure

Procedure AddKeyValue(Table, Val Key, Val Value) Export

    KeyExists   = False;
    ValueExists = False;

    For Each Coloumn In Table.Columns Do

        If Coloumn.Name = "Key" Then

            KeyExists = True;

        ElsIf Coloumn.Name = "Value" Then

            ValueExists = True;

        Else
            Continue;
        EndIf;

    EndDo;

    If Not KeyExists Then
        Table.Columns.Add("Key");
    EndIf;

    If Not ValueExists Then
        Table.Columns.Add("Value");
    EndIf;

    NewValue       = Table.Add();
    NewValue.Key   = Key;
    NewValue.Value = Value;

EndProcedure

Procedure RemoveEmptyCollectionFields(Collection) Export

    CollectionType   = TypeOf(Collection);
    OutputCollection = New (CollectionType);

    If CollectionType = Type("Map") Or CollectionType = Type("Structure") Then

        RemoveEmptyKeyValues(Collection, OutputCollection);

    ElsIf CollectionType = Type("Array") Then

        RemoveEmptyArrayItems(Collection, OutputCollection);

    Else

        OutputCollection = Collection;

    EndIf;

    Collection = OutputCollection;

EndProcedure

Procedure ValueToArray(Value) Export

    If TypeOf(Value) = Type("Array") Then
        Return;
    EndIf;

    Value_ = New Array;
    Value_.Add(Value);

    Value = Value_;

EndProcedure

Function CollectionFieldExists(Val Collection, Val Field, FieldValue = Undefined) Export

    CollectionType = TypeOf(Collection);

    IsStructure      = CollectionType = Type("Structure");
    IsMap            = CollectionType = Type("Map");
    ThisIsCollection = IsStructure Or IsMap;

    If StrFind(Field, ".") And ThisIsCollection Then

        FieldParts   = StrSplit(Field, ".");
        CurrentField = FieldParts[0];

        If Not CollectionFieldExists(Collection, CurrentField, FieldValue) Then

            Return False;

        Else

            FieldParts.Delete(0);
            NextCollection = Collection[CurrentField];
            NextField      = StrConcat(FieldParts, ".");

            Return CollectionFieldExists(NextCollection, NextField, FieldValue);

        EndIf;

    ElsIf IsStructure Then

        Return Collection.Property(Field, FieldValue);

    ElsIf IsMap Then

        FieldValue = Collection[Field];
        Return FieldValue <> Undefined;

    Else

        Return False;

    EndIf;

EndFunction

Function FindMissingCollectionFields(Val Collection, Val Fields) Export

    MissingFieldsArray = New Array;

    For Each Field In Fields Do

        Exists = CollectionFieldExists(Collection, Field);

        If Not Exists Then
            MissingFieldsArray.Add(Field);
        EndIf;

    EndDo;

    Return MissingFieldsArray;

EndFunction

Function ClearCollectionRecursively(Val Collection) Export

    ValeType = TypeOf(Collection);

    If ValeType = Type("Structure") Then

        For Each CollectionItem In Collection Do

            ClearField = ClearCollectionRecursively(CollectionItem.Value);

            Collection[CollectionItem.Key] = ClearField;

        EndDo;

    ElsIf ValeType = Type("Map") Then

        Collection_ = New Map;

        For Each CollectionItem In Collection Do

            ClearField = ClearCollectionRecursively(CollectionItem.Value);

            Collection_.Insert(CollectionItem.Key, ClearField);

        EndDo;

        Collection = Collection_;

    ElsIf ValeType = Type("Array") Then

        Collection_ = New Array;

        For Each CollectionItem In Collection Do

            ClearField = ClearCollectionRecursively(CollectionItem);
            Collection_.Add(ClearField);

        EndDo;

        Collection = Collection_;

    Else

        Collection = "";

    EndIf;

    Return Collection;

EndFunction

Function CopyCollection(Val Collection) Export

    OPI_TypeConversion.GetCollection(Collection);

    CollectionType = TypeOf(Collection);
    IsStructure    = CollectionType = Type("Structure");
    IsMap          = CollectionType = Type("Map");
    IsArray        = CollectionType = Type("Array");

    If IsStructure Or IsMap Then

        Collection_ = ?(IsStructure, New Structure, New Map);

        For Each CollectionField In Collection Do
            Collection_.Insert(CollectionField.Key, CollectionField.Value);
        EndDo;

    ElsIf IsArray Then

        Collection_ = New Array;

        For Each CollectionItem In Collection Do
            Collection_.Add(CollectionItem);
        EndDo;

    Else

        Collection_ = Collection;

    EndIf;

    Return Collection_;

EndFunction

Function GetOr(Val Collection, Val Field, Val DefaultValue) Export

    FieldValue = Undefined;
    Exists     = CollectionFieldExists(Collection, Field, FieldValue);

    If Not Exists Then
        FieldValue = DefaultValue;
    EndIf;

    Return FieldValue;

EndFunction

#EndRegion

#Region OneScript

Function IsOneScript() Export

    Try

        Response = False;

        // BSLLS:UnusedLocalVariable-off

        //@skip-check module-unused-local-variable
        Check = New OpenSSLSecureConnection;

        // BSLLS:UnusedLocalVariable-on

    Except

        Response = True;

    EndTry;

    Return Response;

EndFunction

Procedure ProgressInformation(Val Current, Val Total, Val Unit, Val Divider = 1) Export

    If Not IsOneScript() Then
        Return;
    EndIf;

    Whole   = 100;
    Current = Round(Current / Divider, 2);
    Total   = Round(Total / Divider, 2);
    Percent = Int(Current / Total * Whole);

    StrCurrent    = NumberToString(Current);
    StrTotal      = NumberToString(Total);
    StrPercentage = NumberToString(Percent);

    Progress    = "Progress [" + StrPercentage + "%" + "] ▐";
    Information = "▌ " + StrCurrent + "/" + StrTotal + " " + Unit;

    // Progress bat
    BarLength = 30;
    Counter = 0;
    Buffer = "";

    Indicator = Int(Current / Total * BarLength);

    While Counter < BarLength Do
        Buffer  = Buffer + ?(Counter < Indicator, "█", " ");
        Counter = Counter + 1;
    EndDo;

    WriteOnCurrentLine(Progress, , True);
    WriteOnCurrentLine(Buffer  , "Green");
    WriteOnCurrentLine(Information);

    If Percent = Whole Then
        WriteOnCurrentLine(Chars.LF, , True);
    EndIf;

EndProcedure

Procedure DebugInfo(Val Text) Export

    If Not IsOneScript() Then
        Return;
    EndIf;

    Try

        IsDebug          = Undefined;
        // !OInt IsDebug = GetEnvironmentVariable("OINT_DEBUG");
        IsDebug          = ?(ValueIsFilled(IsDebug), IsDebug, "NO");

    Except
       IsDebug = "NO";
    EndTry;

    If IsDebug = "YES" Then
        Message(Text);
    EndIf;

EndProcedure

#EndRegion

#Region Service

Procedure ReplaceSpecialCharacters(Text, Markup = "Markdown") Export

    OPI_TypeConversion.GetLine(Markup);

    CharacterMapping = New Map;

    If Markup = "HTML" Then

        CharacterMapping.Insert("&", "&amp;");

    ElsIf Markup = "MarkdownV2" Then

        CharacterMapping.Insert("-", "\-");
        CharacterMapping.Insert("+", "\+");
        CharacterMapping.Insert("#", "\#");
        CharacterMapping.Insert("=", "\=");
        CharacterMapping.Insert("{", "\{");
        CharacterMapping.Insert("}", "\}");
        CharacterMapping.Insert(".", "\.");

    Else
        Return;
    EndIf;

    For Each ArraySymbol In CharacterMapping Do
        Text = StrReplace(Text, ArraySymbol.Key, ArraySymbol.Value);
    EndDo;

EndProcedure

Procedure Pause(Val Seconds) Export

    Connection = New HTTPConnection("1C.ru", 11111, , , , Seconds);
    Try
        Connection.Get(New HTTPRequest(""));
    Except
        Return;
    EndTry;

EndProcedure

Procedure ReplaceEscapeSequences(Text) Export

    OPI_TypeConversion.GetLine(Text);

    CharacterMapping = GetEscapeSequencesMap();

    For Each Symbol In CharacterMapping Do

        Text = StrReplace(Text, Symbol.Key        , Symbol.Value);
        Text = StrReplace(Text, "\" + Symbol.Value, Symbol.Key);

    EndDo;

EndProcedure

Procedure RestoreEscapeSequences(Text) Export

    OPI_TypeConversion.GetLine(Text);

    CharacterMapping = GetEscapeSequencesMap();

    For Each Symbol In CharacterMapping Do

        Text = StrReplace(Text, Symbol.Value, Symbol.Key);

    EndDo;

EndProcedure

Procedure StreamToStart(CurrentStream) Export

    If Not CurrentStream.CanSeek Then
        Return;
    EndIf;

    StartPosition = PositionInStream.Start;

    CurrentStream.Seek(0, StartPosition);

EndProcedure

Function NumberToString(Val Value) Export

    If TypeOf(Value) = Type("Number") Then

        If Value   = 0 Then
            Value_ = "0";
        Else
            Value_ = Format(Value, "NG=0");
        EndIf;

    Else
        Value_ = String(Value);
    EndIf;

    Return Value_;

EndFunction

Function GetCurrentDate() Export
    Return ToLocalTime(CurrentUniversalDate());
EndFunction

Function UNIXTime(Val Date) Export

    OTD  = New TypeDescription("Date");
    Date = OTD.AdjustValue(Date);

    UNIX = Format(Date - Date(1970, 1, 1, 1, 0, 0), "ND=10; NFD=0; NG=0");
    UNIX = StrReplace(UNIX, ","       , "");
    UNIX = StrReplace(UNIX, Chars.NBSp, "");
    UNIX = StrReplace(UNIX, " "       , "");
    UNIX = Left(UNIX, 10);

    Return UNIX;

EndFunction

Function DateRFC3339(Val Date, Val Offset = "Z") Export

    OPI_TypeConversion.GetDate(Date);
    OPI_TypeConversion.GetLine(Offset);

    Return XMLString(Date) + Offset;

EndFunction

Function ConvertDataWithSizeRetrieval(Data, Val MinimumStreamSize = 0) Export

    Size = 0;

    If TypeOf(Data) = Type("String") Then

        FileOnDisk = New File(Data);

        If FileOnDisk.Exists() Then
            Size = FileOnDisk.Size();
        Else
            OPI_TypeConversion.GetBinaryData(Data);
            Size = Data.Size();
        EndIf;

    Else
        OPI_TypeConversion.GetBinaryData(Data);
        Size = Data.Size();
    EndIf;

    If ValueIsFilled(MinimumStreamSize) Then
        If Size < MinimumStreamSize Then
            OPI_TypeConversion.GetBinaryData(Data);
        Else
            OPI_TypeConversion.GetBinaryOrStream(Data);
        EndIf;
    Else
        OPI_TypeConversion.GetBinaryOrStream(Data);
    EndIf;

    Return Size;

EndFunction

Function ISOTimestamp(Val Date) Export

    Label = Left(XMLString(Date), 19) + "Z";
    Label = StrReplace(Label, "-", "");
    Label = StrReplace(Label, ":", "");

    Return Label;

EndFunction

Function CreateStream(Val FilePath = Undefined) Export

    If ValueIsFilled(FilePath) Then
        StreamOfFile = New FileStream(FilePath, FileOpenMode.Create);
    Else
        StreamOfFile = New MemoryStream();
    EndIf;

    Return StreamOfFile;

EndFunction

Function IsWindows() Export

    SystemInfo      = New SystemInfo;
    OperatingSystem = String(SystemInfo.PlatformType);

    Response = StrFind(Lower(OperatingSystem), "windows") > 0;

    Return Response;

EndFunction

Function MergeData(Val Data, Val Addition) Export

    Stream = New MemoryStream();
    Record = New DataWriter(Stream);

    Record.Write(Data);
    Record.Write(Addition);

    Record.Close();

    Result = Stream.CloseAndGetBinaryData();

    Return Result;

EndFunction

Function IsPrimitiveType(Val Value) Export

    ValeType = TypeOf(Value);

    Return ValeType = Type("String")
        Or ValeType = Type("Number")
        Or ValeType = Type("Boolean");

EndFunction

Function ThisIsCollection(Val Value, Val KeyValue = False) Export

    ValeType = TypeOf(Value);

    Return (ValeType = Type("Array") And Not KeyValue)
        Or ValeType  = Type("Structure")
        Or ValeType  = Type("Map");

EndFunction

#EndRegion

#EndRegion

#Region Private

Procedure RemoveEmptyKeyValues(Val Collection, OutputCollection)

    For Each CollectionItem In Collection Do

        If Not CollectionItem.Value = Undefined And Not CollectionItem.Value = Null Then
            OutputCollection.Insert(CollectionItem.Key, CollectionItem.Value);
        EndIf;

    EndDo;

EndProcedure

Procedure RemoveEmptyArrayItems(Val Collection, OutputCollection)

    For Each CollectionItem In Collection Do

        If Not CollectionItem = Undefined And Not CollectionItem = Null Then
            OutputCollection.Add(CollectionItem);
        EndIf;

    EndDo;

EndProcedure

Procedure XMLInitialProcessing(XML)

    If Not TypeOf(XML) = Type("XMLReader") Then
        XML_           = XML;
        XML            = New XMLReader;
        XML.SetString(XML_);
    EndIf;

EndProcedure

Procedure WriteOnCurrentLine(Val Text, Val Color = "", Val ToStart = False) Export

    If Not IsOneScript() Then
        Console      = Undefined;
        ConsoleColor = New Map;
    EndIf;

    Encoding      = Console.OutputEncoding;
    OutputStream  = Console.OpenStandardOutput();
    OutputWriting = New DataWriter(OutputStream, Encoding);

    If Not ValueIsFilled(Color) Then
        Color = ConsoleColor.White;
    EndIf;

    If TypeOf(Color)      = Type("String") Then
        Console.TextColor = ConsoleColor[Color];
    Else
        Console.TextColor = Color;
    EndIf;

    If ToStart Then
        Escape = Chars.CR;
        OutputWriting.WriteChars(Escape);
    EndIf;

    OutputWriting.WriteChars(Text);

EndProcedure

Function ConvertParameterToString(Val Value)

    If TypeOf(Value) = Type("Array") Then

        For N        = 0 To Value.UBound() Do
            Value[N] = ConvertParameterToString(Value[N]);
        EndDo;

        Value = StrConcat(Value, ",");
        Value = EncodeString(Value, StringEncodingMethod.URLInURLEncoding);
        Value = "[" + Value + "]";

    ElsIf TypeOf(Value) = Type("Map") Or TypeOf(Value) = Type("Structure") Then

        JSONParameters = New JSONWriterSettings(JSONLineBreak.None, "");

        JSONWriter = New JSONWriter;
        JSONWriter.SetString(JSONParameters);

        WriteJSON(JSONWriter, Value);
        Value = JSONWriter.Close();

    ElsIf TypeOf(Value) = Type("Boolean") Then

        Value = ?(Value, "true", "false");

    Else

        Value = NumberToString(Value);
        Value = EncodeString(Value, StringEncodingMethod.URLInURLEncoding);

    EndIf;

    Return Value;

EndFunction

Function SplitArrayAsURLParameters(Val Key, Val Value)

    KeyArray = Key + "=";

    For N = 0 To Value.UBound() Do

        CurrentValue = Value[N];

        OPI_TypeConversion.GetLine(CurrentValue);

        Value.Set(N, KeyArray + CurrentValue);

    EndDo;

    ParameterString = StrConcat(Value, "&");

    Return ParameterString;

EndFunction

Function StartFormingXML(Value, XMLWriter)

    Start = False;

    If XMLWriter = Undefined Then

        ErrorText = "Error getting a collection for XML generation";
        OPI_TypeConversion.GetKeyValueCollection(Value, ErrorText);

        XMLWriter = New XMLWriter;
        XMLWriter.SetString();
        XMLWriter.WriteXMLDeclaration();

        Start = True;

    EndIf;

    Return Start;

EndFunction

Function RelevantNodeType(Val NodeType)

    Return NodeType = XMLNodeType.StartElement Or NodeType = XMLNodeType.EndElement Or NodeType = XMLNodeType.Text;

EndFunction

Function GetEscapeSequencesMap()

    CharacterMapping = New Map;

    CharacterMapping.Insert("\n", Chars.LF);
    CharacterMapping.Insert("\r", Chars.CR);
    CharacterMapping.Insert("\f", Chars.FF);
    CharacterMapping.Insert("\v", Chars.VTab);

    Return CharacterMapping;

EndFunction

#EndRegion
