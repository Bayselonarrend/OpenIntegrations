// OneScript: ./OInt/tools/Modules/internal/Modules/OPI_Tools.os

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check use-non-recommended-method

// Uncomment if OneScript is executed
#Use "./internal"

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

Function ReadJSONFile(Val Path, Val ToMap = False) Export

    // BSLLS:ExternalAppStarting-off

    JSONReader = New JSONReader;
    JSONReader.OpenFile(Path);
    Values     = ReadJSON(JSONReader, ToMap);

    // BSLLS:ExternalAppStarting-on

    JSONReader.Close();

    Return Values;

EndFunction

Procedure WriteJSONFile(Val Path, Val Data) Export

    JSONWriter = New JSONWriter();

    // BSLLS:ExternalAppStarting-off
    JSONWriter.OpenFile(Path, , False);
    // BSLLS:ExternalAppStarting-on

    WriteJSON(JSONWriter, Data);
    JSONWriter.Close();

EndProcedure

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

// BSLLS:CognitiveComplexity-off

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

    ElsIf Type = "KeyAndValue" Then
        OPI_TypeConversion.GetKeyValueCollection(Value);

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

// BSLLS:CognitiveComplexity-on

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

        Collection_ = CopyCollectionKeyValue(Collection, IsStructure);

    ElsIf IsArray Then

        Collection_ = CopyCollectionArray(Collection);

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

Function CompareTwoCollections(Val FirstCollection
    , Val SecondCollection
    , Val ExcludedFields = Undefined
    , Val ParrentField   = "Root") Export

    If TypeOf(FirstCollection) <> TypeOf(SecondCollection) Then
        If Not (ThisIsCollection(FirstCollection, True) And ThisIsCollection(SecondCollection, True)) Then
            DebugInfo(StrTemplate("%1: Collections types are not equal", ParrentField), True);
            Return False;
        EndIf;
    EndIf;

    ExcludedList = New ValueList();

    If Not ExcludedFields = Undefined Then
        OPI_TypeConversion.GetArray(ExcludedFields);
        ExcludedList.LoadValues(ExcludedFields);
    EndIf;

    Try

        If ThisIsCollection(FirstCollection, True) Then

            For Each CollectionItem In FirstCollection Do

                If ExcludedList.FindByValue(CollectionItem.Key) <> Undefined Then
                    Continue;
                EndIf;

                CurrentKey   = CollectionItem.Key;
                CurrentValue = CollectionItem.Value;
                CurrentField = StrTemplate("%1.%2", ParrentField, String(CollectionItem.Key));

                If Not CompareTwoCollections(CurrentValue, SecondCollection[CurrentKey], , CurrentField) Then
                    Return False;
                EndIf;

            EndDo;

        ElsIf ThisIsCollection(FirstCollection) Then

            For N = 0 To FirstCollection.UBound() Do

                CurrentField = StrTemplate("%1.%2", ParrentField, String(N));

                If Not CompareTwoCollections(FirstCollection[N], SecondCollection[N], , CurrentField) Then
                    Return False;
                EndIf;

            EndDo;

        Else

             If FirstCollection <> SecondCollection Then
                 DebugInfo(StrTemplate("%1: Values ​​are not equal", ParrentField), True);
                 Return False;
             EndIf;

        EndIf;

    Except
        DebugInfo(StrTemplate("Exception: %1", DetailErrorDescription(ErrorInfo())));
        Return False;
    EndTry;

    Return True;

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

Function IsCLI() Export

    If IsOneScript() Then

        IsCLI = Undefined;
        IsCLI = GetEnvironmentVariable("OINT_CLI");
        IsCLI = ?(ValueIsFilled(IsCLI), IsCLI, "NO");

        Return IsCLI = "YES";

    EndIf;

    Return False;

EndFunction

Procedure ProgressInformation(Val Current, Val Total, Val Unit, Val Divider = 1) Export

    If Not IsCLI() Then
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

Procedure DebugInfo(Val Text, Val Forced = False) Export

    If Not IsOneScript() Then
        Return;
    EndIf;

    Try

        IsDebug = Undefined;
        IsDebug = GetEnvironmentVariable("OINT_DEBUG");
        IsDebug = ?(ValueIsFilled(IsDebug), IsDebug, "NO");

    Except
       IsDebug = "NO";
    EndTry;

    If IsDebug = "YES" Or Forced Then

        // BSLLS:DeprecatedMessage-off

        //@skip-check use-non-recommended-method
        Message(Text);

        // BSLLS:DeprecatedMessage-on

    EndIf;

EndProcedure

#EndRegion

#Region Service

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

    StartPosition = StreamPosition.Begin;

    CurrentStream.Seek(0, StartPosition);

EndProcedure

Procedure RemoveFileWithTry(Val Path, Val MessageText = "Failed to delete file") Export

    Try
        DeleteFiles(Path);
    Except

        // BSLLS:DeprecatedMessage-off

        //@skip-check use-non-recommended-method
        Message(MessageText);

        // BSLLS:DeprecatedMessage-on

    EndTry;

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

Function GetLastBuildHashSum() Export

    Return OPI_BuildHash.GetHashSum();

EndFunction

Function OPIVersion() Export
    Return "1.31.0";
EndFunction

Function OPILanguage() Export
    CurrentOPILanguage = "en";
    Return CurrentOPILanguage;
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

    CharacterMapping.Insert("\n" , Chars.LF);
    CharacterMapping.Insert("\r" , Chars.CR);
    CharacterMapping.Insert("\f" , Chars.FF);
    CharacterMapping.Insert("\v" , Chars.VTab);

    Return CharacterMapping;

EndFunction

Function CopyCollectionKeyValue(Val Collection, Val IsStructure)

    Collection_ = ?(IsStructure, New Structure, New Map);

    For Each CollectionField In Collection Do

        CurrentValue = CollectionField.Value;
        CurrentValue = ?(ThisIsCollection(CurrentValue), CopyCollection(CurrentValue), CurrentValue);

        Collection_.Insert(CollectionField.Key, CurrentValue);

    EndDo;

    Return Collection_;

EndFunction

Function CopyCollectionArray(Val Collection)

    Collection_ = New Array;

    For Each CollectionItem In Collection Do

        CurrentValue = ?(ThisIsCollection(CollectionItem), CopyCollection(CollectionItem), CollectionItem);
        Collection_.Add(CurrentValue);

    EndDo;

    Return Collection_;

EndFunction

#EndRegion

#Region Alternate

Function ПараметрыЗапросаВСтроку(Val Параметры, Val ОтдельныеЭлементыМассивов = False, Val Начало = True) Export
	Return RequestParametersToString(Параметры, ОтдельныеЭлементыМассивов, Начало);
EndFunction

Function ПараметрыЗапросаВСоответствие(Val СтрокаПараметров) Export
	Return RequestParametersToMap(СтрокаПараметров);
EndFunction

Function РазбитьURL(Val URL) Export
	Return SplitURL(URL);
EndFunction

Function ПолучитьДомен(Val СтрокаПодключения) Export
	Return GetDomain(СтрокаПодключения);
EndFunction

Function JsonВСтруктуру(Val Текст, Val ВСоответствие = True) Export
	Return JsonToStructure(Текст, ВСоответствие);
EndFunction

Function JSONСтрокой(Val Данные, Val Экранирование = "Нет", Val ПереносСтрок = True, Val ДвойныеКавычки = True) Export
	Return JSONString(Данные, Экранирование, ПереносСтрок, ДвойныеКавычки);
EndFunction

Function ПрочитатьJSONФайл(Val Путь, Val ВСоответствие = False) Export
	Return ReadJSONFile(Путь, ВСоответствие);
EndFunction

Procedure ЗаписатьJSONФайл(Val Путь, Val Данные) Export
	WriteJSONFile(Путь, Данные);
EndProcedure

Function ОбработатьXML(XML) Export
	Return ProcessXML(XML);
EndFunction

Function ПолучитьXML(Значение, ПространствоИмен = "", ЗаписьXML = Undefined) Export
	Return GetXML(Значение, ПространствоИмен, ЗаписьXML);
EndFunction

Procedure ДобавитьПоле(Val Имя, Val Значение, Val Тип, Коллекция) Export
	AddField(Имя, Значение, Тип, Коллекция);
EndProcedure

Procedure ДобавитьКлючЗначение(Таблица, Val Ключ, Val Значение) Export
	AddKeyValue(Таблица, Ключ, Значение);
EndProcedure

Procedure УдалитьПустыеПоляКоллекции(Коллекция) Export
	RemoveEmptyCollectionFields(Коллекция);
EndProcedure

Procedure ЗначениеВМассив(Значение) Export
	ValueToArray(Значение);
EndProcedure

Function ПолеКоллекцииСуществует(Val Коллекция, Val Поле, ЗначениеПоля = Undefined) Export
	Return CollectionFieldExists(Коллекция, Поле, ЗначениеПоля);
EndFunction

Function НайтиОтсутствующиеПоляКоллекции(Val Коллекция, Val Поля) Export
	Return FindMissingCollectionFields(Коллекция, Поля);
EndFunction

Function ОчиститьКоллекциюРекурсивно(Val Коллекция) Export
	Return ClearCollectionRecursively(Коллекция);
EndFunction

Function КопироватьКоллекцию(Val Коллекция) Export
	Return CopyCollection(Коллекция);
EndFunction

Function ПолучитьИли(Val Коллекция, Val Поле, Val ЗначениеИначе) Export
	Return GetOr(Коллекция, Поле, ЗначениеИначе);
EndFunction

Function СравнитьДвеКоллекции(Val ПерваяКоллекция, Val ВтораяКоллекция, Val ИсключаемыеПоля = Undefined, Val РодительскоеПоле = "Корень") Export
	Return CompareTwoCollections(ПерваяКоллекция, ВтораяКоллекция, ИсключаемыеПоля, РодительскоеПоле);
EndFunction

Function ЭтоOneScript() Export
	Return IsOneScript();
EndFunction

Function ЭтоCLI() Export
	Return IsCLI();
EndFunction

Procedure ИнформацияОПрогрессе(Val Текущее, Val Всего, Val ЕдИзм, Val Делитель = 1) Export
	ProgressInformation(Текущее, Всего, ЕдИзм, Делитель);
EndProcedure

Procedure ОтладочнаяИнформация(Val Текст, Val Принудительно = False) Export
	DebugInfo(Текст, Принудительно);
EndProcedure

Procedure Пауза(Val Секунды) Export
	Pause(Секунды);
EndProcedure

Procedure ЗаменитьУправляющиеПоследовательности(Текст) Export
	ReplaceEscapeSequences(Текст);
EndProcedure

Procedure ВернутьУправляющиеПоследовательности(Текст) Export
	RestoreEscapeSequences(Текст);
EndProcedure

Procedure ПотокВНачало(ТекущийПоток) Export
	StreamToStart(ТекущийПоток);
EndProcedure

Procedure УдалитьФайлВПопытке(Val Путь, Val ТекстСообщения = "Не удалось удалить файл") Export
	RemoveFileWithTry(Путь, ТекстСообщения);
EndProcedure

Function ЧислоВСтроку(Val Значение) Export
	Return NumberToString(Значение);
EndFunction

Function ПолучитьТекущуюДату() Export
	Return GetCurrentDate();
EndFunction

Function ДатаRFC3339(Val Дата, Val Смещение = "Z") Export
	Return DateRFC3339(Дата, Смещение);
EndFunction

Function ПреобразоватьДанныеСПолучениемРазмера(Данные, Val МинимальныйРазмерДляПотока = 0) Export
	Return ConvertDataWithSizeRetrieval(Данные, МинимальныйРазмерДляПотока);
EndFunction

Function ВременнаяМеткаISO(Val Дата) Export
	Return ISOTimestamp(Дата);
EndFunction

Function СоздатьПоток(Val ПутьКФайлу = Undefined) Export
	Return CreateStream(ПутьКФайлу);
EndFunction

Function ЭтоWindows() Export
	Return IsWindows();
EndFunction

Function СклеитьДанные(Val Данные, Val Дополнение) Export
	Return MergeData(Данные, Дополнение);
EndFunction

Function ЭтоПримитивныйТип(Val Значение) Export
	Return IsPrimitiveType(Значение);
EndFunction

Function ЭтоКоллекция(Val Значение, Val КлючЗначение = False) Export
	Return ThisIsCollection(Значение, КлючЗначение);
EndFunction

Function ПолучитьХешСуммуПоследнейСборки() Export
	Return GetLastBuildHashSum();
EndFunction

Function ВерсияОПИ() Export
	Return OPIVersion();
EndFunction

Function ЯзыкОПИ() Export
	Return OPILanguage();
EndFunction

Procedure ВывестиТекстВТекущуюСтроку(Val Текст, Val Цвет = "", Val ВНачало = False) Export
	WriteOnCurrentLine(Текст, Цвет, ВНачало);
EndProcedure

#EndRegion