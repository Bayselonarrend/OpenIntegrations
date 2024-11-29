﻿// OneScript: ./OInt/tools/Modules/internal/Modules/OPI_Tools.os

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
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfOptionalParams-off

//@skip-check module-unused-local-variable
//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Internal

#Region HTTPMethods

#Region RequestsWithoutBody

Function Get(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val ResponseFile = Undefined) Export
    Return ExecuteRequestWithoutBody(URL, "GET", Parameters, AdditionalHeaders, ResponseFile);
EndFunction

Function Delete(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val ResponseFile = Undefined) Export
    Return ExecuteRequestWithoutBody(URL, "DELETE", Parameters, AdditionalHeaders, ResponseFile);
EndFunction

#EndRegion

#Region RequestsWithBody

Function Post(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True, Val FullResponse = False,
    Val ResponseFile = Undefined) Export

    Return ExecuteRequestWithBody(URL, "POST", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);

EndFunction

Function Patch(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True, Val FullResponse = False,
    Val ResponseFile = Undefined) Export

    Return ExecuteRequestWithBody(URL, "PATCH", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);

EndFunction

Function Put(Val URL, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True, Val FullResponse = False,
    Val ResponseFile = Undefined) Export

    Return ExecuteRequestWithBody(URL, "PUT", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);

EndFunction

Function PostBinary(Val URL, Val Body, Val AdditionalHeaders, Val FullResponse = False,
    Val DataType = "application/octet-stream") Export

    Return ExecuteRequestWithBinaryData(URL, "POST", Body, AdditionalHeaders, FullResponse, DataType);

EndFunction

#EndRegion

#Region MultipartRequests

Function PostMultipart(Val URL, Val Parameters = "", Val Files = "", Val ContentType = "image/jpeg",
    Val AdditionalHeaders = "", Val ResponseFile = Undefined) Export

    Return ExecuteMultipartRequest(URL, "POST", Parameters, Files, ContentType, AdditionalHeaders, ResponseFile);

EndFunction

Function PutMultipart(Val URL, Val Parameters = "", Val Files = "", Val ContentType = "image/jpeg",
    Val AdditionalHeaders = "", Val ResponseFile = Undefined) Export

    Return ExecuteMultipartRequest(URL, "PUT", Parameters, Files, ContentType, AdditionalHeaders, ResponseFile);

EndFunction

Function PostMultipartRelated(Val URL, Val JSON = "", Val Files = "", Val AdditionalHeaders = "",
    Val ResponseFile = Undefined) Export

    Return ExecuteMultipartRelatedRequest(URL, "POST", JSON, Files, AdditionalHeaders, ResponseFile);

EndFunction

Function PatchMultipartRelated(Val URL, Val JSON = "", Val Files = "", Val AdditionalHeaders = "",
    Val ResponseFile = Undefined) Export

    Return ExecuteMultipartRelatedRequest(URL, "PATCH", JSON, Files, AdditionalHeaders, ResponseFile);

EndFunction

#EndRegion

#Region Miscellaneous

Procedure ProcessResponse(Response, Val FullResponse = False) Export

    If FullResponse Or TypeOf(Response) <> Type("HTTPResponse") Then
        Return;
    EndIf;

    BodyFile = Response.GetBodyFileName();

    If Not BodyFile = Undefined Then

        Response = BodyFile;
        Return;

    EndIf;

    GZip = "gzip";

    NeedsUnpacking = Response.Headers.Get("Content-Encoding") = GZip
                  Or Response.Headers.Get("content-encoding") = GZip;

    If NeedsUnpacking Then
        Response = UnpackResponse(Response);
    EndIf;

    Response = ?(TypeOf(Response) = Type("HTTPResponse"), Response.ПолучитьТелоКакДвоичныеДанные(), Response);

    If TypeOf(Response) = Type("BinaryData") Then

        If Response.Size() = 0 Then

            Response = ПолучитьДвоичныеДанныеИзСтроки("{}");

        EndIf;

        Try

            Response = JsonToStructure(Response);

        Except
            Return;
        EndTry;

    EndIf;

EndProcedure

Function CreateRequest(Val Address, Val AdditionalHeaders = "", Val DataType = "") Export

    Headers = New Map;
    Headers.Insert("Accept-Encoding", "gzip");
    Headers.Insert("Accept"         , "*/*");
    Headers.Insert("Connection"     , "keep-alive");
    Headers.Insert("Accept-Charset" , "utf-8");

    If ValueIsFilled(DataType) Then
        Headers.Insert("Content-Type", DataType);
    EndIf;

    If TypeOf(AdditionalHeaders) = Type("Map") Then

        For Each Title In AdditionalHeaders Do
            Headers.Insert(Title.Key, Title.Value);
        EndDo;

    EndIf;

    NewRequest = New HTTPRequest(Address, Headers);

    Return NewRequest;

EndFunction

Function CreateConnection(Val Server, Val Safe = True, Val User = "", Val Password = "", Val Port = "") Export

    If Not ValueIsFilled(Port) Then
        Port = ?(Safe, 443, 80);
    EndIf;

    If Safe Then

        If IsOneScript() Then
            Connection = New HTTPConnection(Server, Port, User, Password, , 3000);
        Else
            SSL        = New OpenSSLSecureConnection;
            Connection = New HTTPConnection(Server, Port, User, Password, , 3000, SSL);
        EndIf;

    Else

        Connection = New HTTPConnection(Server, Port, User, Password, , 3000);

    EndIf;

    Return Connection;

EndFunction

Function ExecuteRequest(Val Request, Val Connection, Val View, Val ResponseFile = "", Val FullResponse = False) Export

    If ValueIsFilled(ResponseFile) Then
        Response = Connection.CallHTTPMethod(View, Request, ResponseFile);
    Else
        Response = Connection.CallHTTPMethod(View, Request);
    EndIf;

    If ThisIsRedirection(Response) Then

        URL = Response.Headers["Location"];

        URLStructure = SplitURL(URL);
        Server       = URLStructure["Server"];
        Address      = URLStructure["Address"];
        Safe         = URLStructure["Safe"];
        Port         = URLStructure["Port"];

        Connection = CreateConnection(Server, Safe, , , Port);
        Request.ResourceAddress = Address;

        Response = ExecuteRequest(Request, Connection, View, ResponseFile, FullResponse);

    Else
        ProcessResponse(Response, FullResponse);
    EndIf;

    Return Response;

EndFunction

Function CreateRequestWithBody(Val Address, Val Parameters, Val AdditionalHeaders, Val JSON) Export

    DataType = ?(JSON, "application/json; charset=utf-8", "application/x-www-form-urlencoded; charset=utf-8");
    Request = CreateRequest(Address, AdditionalHeaders, DataType);

    SetRequestBody(Request, Parameters, JSON);

    Return Request;

EndFunction

Function CreateMultipartRequest(Val Address, Val Parameters, Val Files, Val AdditionalHeaders, Val FileName,
    Val ContentType) Export

    Boundary      = StrReplace(String(New UUID), "-", "");
    LineSeparator = Chars.CR + Chars.LF;
    DataType = "multipart/form-data; boundary=" + Boundary;

    Request = CreateRequest(Address, AdditionalHeaders, DataType);

    TextRecord = New DataWriter(FileName, TextEncoding.UTF8, ByteOrder.LittleEndian, "", False, "", False);

    WriteMultipartParameters(TextRecord, Boundary, Parameters);
    WriteMultipartFiles(TextRecord, Boundary, ContentType, Files);

    TextRecord.WriteLine("--" + boundary + "--" + LineSeparator);
    TextRecord.Close();

    Request.SetBodyFileName(FileName);

    Return Request

EndFunction

Function CreateMultipartRelatedRequest(Val Address, Val Files, Val JSON, Val AdditionalHeaders, Val FileName) Export

    Boundary      = StrReplace(String(New UUID), "-", "");
    LineSeparator = Chars.CR + Chars.LF;
    DataType = "multipart/related; boundary=" + Boundary;

    Request    = CreateRequest(Address, AdditionalHeaders, DataType);
    TextRecord = New DataWriter(FileName, TextEncoding.UTF8, ByteOrder.LittleEndian, "", False, "", False);

    WriteJSONMultipart(TextRecord, Boundary, JSON);
    WriteRelatedFiles(TextRecord, Boundary, Files);

    TextRecord.WriteLine("--" + boundary + "--" + LineSeparator);
    TextRecord.Close();

    AddContentLength(Request);

    Request.SetBodyFileName(FileName);

    Return Request;

EndFunction

#EndRegion

#EndRegion

#Region Service

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

Function SplitURL(Val URL) Export

    SecureConnection = Not StrStartsWith(URL, "http://");

    URL = StrReplace(URL, "https://", "");
    URL = StrReplace(URL, "http://" , "");

    If StrFind(URL, "/") = 0 Then
        Address          = "";
        Host             = URL;
    Else
        Address          = Right(URL, StrLen(URL) - StrFind(URL, "/", SearchDirection.FromBegin) + 1);
        Host             = Left(URL, StrFind(URL, "/", SearchDirection.FromBegin) - 1);
    EndIf;

    If StrFind(Host, ":") <> 0 Then

        HostPort = StrSplit(Host, ":");
        Host     = HostPort[0];
        Port     = HostPort[1];

        OPI_TypeConversion.GetNumber(Port);

    Else

        Port = ?(SecureConnection, 443, 80);

    EndIf;

    If IsOneScript() And SecureConnection Then
        Server = "https://" + Host;
    Else
        Server = Host;
    EndIf;

    ReturnStructure = New Structure;
    ReturnStructure.Insert("Server"  , Server);
    ReturnStructure.Insert("Address" , Address);
    ReturnStructure.Insert("Safe"    , SecureConnection);
    ReturnStructure.Insert("Port"    , Port);
    ReturnStructure.Insert("Host"    , Host);

    Return ReturnStructure;

EndFunction

Function JsonToStructure(Val Text) Export

    If Not ValueIsFilled(Text) Then
        Return "";
    EndIf;

    Text = ?(TypeOf(Text) = Type("BinaryData"), ПолучитьСтрокуИзДвоичныхДанных(Text), Text);

    JSONReader = New JSONReader;
    JSONReader.SetString(Text);

    Data = ReadJSON(JSONReader, True, Undefined, JSONDateFormat.ISO);
    JSONReader.Close();

    Return Data;

EndFunction

Function JSONString(Val Data, Val Escaping = "None", Val LineBreaks = True, Val DoubleQuotes = True) Export

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

Function NumberToString(Val Number) Export
    Return StrReplace(String(Number), Chars.NBSp, "");
EndFunction

Function ReadJSONFile(Val Path) Export

    JSONReader = New JSONReader;
    JSONReader.OpenFile(Path);
    Values     = ReadJSON(JSONReader);

    JSONReader.Close();

    Return Values;

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

Function GetCurrentDate() Export
    Return ToLocalTime(CurrentUniversalDate());
EndFunction

Function UNIXTime(Val Date) Export

    OTD  = New TypeDescription("Date");
    Date = OTD.AdjustValue(Date);

    UNIX = Format(Date - Date(1970, 1, 1, 1, 0, 0), "HC=10; HDC=0; HG=0");
    UNIX = StrReplace(UNIX, ","       , "");
    UNIX = StrReplace(UNIX, Chars.NBSp, "");
    UNIX = StrReplace(UNIX, " "       , "");
    UNIX = Left(UNIX, 10);

    Return UNIX;

EndFunction

Function ProgressInformation(Val Current, Val Total, Val Unit, Val Divider = 1) Export

    Whole   = 100;
    Current = Round(Current / Divider, 2);
    Total   = Round(Total / Divider, 2);
    Percent = Int(Current / Total * Whole);

    StrCurrent    = NumberToString(Current);
    StrTotal      = NumberToString(Total);
    StrPercentage = NumberToString(Percent);

    Information = StrCurrent + "/" + StrTotal + " " + Unit + " ( " + StrPercentage + "% )";

    Return Information;

EndFunction

Function ConvertDataWithSizeRetrieval(Data, Val MinimumStreamSize = 0) Export

    Size = 0;

    If TypeOf(Data) = Type("String") Then

        FileOnDisk = New File(Data);

        If FileOnDisk.Exist() Then
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

Function CollectionFieldExist(Val Collection, Val Field, FieldValue = Undefined) Export

    CollectionType = TypeOf(Collection);

    IsStructure      = CollectionType      = Type("Structure");
    IsMap            = CollectionType            = Type("Map");
    ThisIsCollection = IsStructure Or IsMap;

    If StrFind(Field, ".") And ThisIsCollection Then

        FieldParts   = StrSplit(Field, ".");
        CurrentField = FieldParts[0];

        If Not CollectionFieldExist(Collection, CurrentField, FieldValue) Then

            Return False;

        Else

            FieldParts.Delete(0);
            NextCollection = Collection[CurrentField];
            NextField      = StrConcat(FieldParts, ".");

            Return CollectionFieldExist(NextCollection, NextField, FieldValue);

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

    For Each CollectionItem In Collection Do

        CurrentKey = CollectionItem.Key;
        Exist      = CollectionFieldExist(Collection, CurrentKey);

        If Not Exist Then
            MissingFieldsArray.Add(CurrentKey);
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

Function ISOTimestamp(Val Date) Export

    Label = Left(XMLString(Date), 19) + "Z";
    Label = StrReplace(Label, "-", "");
    Label = StrReplace(Label, ":", "");

    Return Label;

EndFunction

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

Function ProcessXML(XML) Export

    XMLInitialProcessing(XML);

    ReturnValue = New Map;

    WHile XML.Read() Do

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

Function CopyCollection(Val Collection) Export

    OPI_TypeConversion.GetCollection(Collection);

    CollectionType = TypeOf(Collection);
    IsStructure    = CollectionType    = Type("Structure");
    IsMap          = CollectionType          = Type("Map");
    IsArray        = CollectionType        = Type("Array");

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

Function GetRequestBody(Val Request) Export

    Body = Request.ПолучитьТелоКакДвоичныеДанные();

    If Body = Undefined Then

        Body = ПолучитьДвоичныеДанныеИзСтроки("");

    EndIf;

    Return Body;

EndFunction

Procedure ValueToArray(Value) Export

    If TypeOf(Value) = Type("Array") Then
        Return;
    EndIf;

    Value_ = New Array;
    Value_.Add(Value);
    Value  = Value_;

EndProcedure

Procedure ReplaceSpecialCharacters(Text, Markup = "Markdown") Export

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

Procedure Pause(Val Seconds) Export

    Connection = New HTTPConnection("1C.ru", 11111, , , , Seconds);
    Try
        Connection.Get(New HTTPRequest(""));
    Except
        Return;
    EndTry;

EndProcedure

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
        Value = New UUID(Value);

    Else

        If Not Type = "Current" Then
            OPI_TypeConversion.GetLine(Value);
        EndIf;

    EndIf;

    Collection.Insert(Name, Value);

EndProcedure

Procedure AddKeyValue(Table, Val Key, Val Value) Export

    KeyExist   = False;
    ValueExist = False;

    For Each Coloumn In Table.Columns Do

        If Coloumn.Name = "Key" Then

            KeyExist = True;

        ElsIf Coloumn.Name = "Value" Then

            ValueExist = True;

        Else
            Continue;
        EndIf;

    EndDo;

    If Not KeyExist Then
        Table.Columns.Add("Key");
    EndIf;

    If Not ValueExist Then
        Table.Columns.Add("Value");
    EndIf;

    NewValue       = Table.Add();
    NewValue.Key   = Key;
    NewValue.Value = Value;

EndProcedure

#EndRegion

#EndRegion

#Region Private

Function ExecuteRequestWithBody(Val URL, Val View, Val Parameters = "", Val AdditionalHeaders = "", Val JSON = True,
    Val FullResponse = False, Val ResponseFile = Undefined)

    If Not ValueIsFilled(Parameters) Then
        Parameters = New Structure;
    EndIf;

    URLStructure = SplitURL(URL);
    Server       = URLStructure["Server"];
    Address      = URLStructure["Address"];
    Safe         = URLStructure["Safe"];
    Port         = URLStructure["Port"];

    Request    = CreateRequestWithBody(Address, Parameters, AdditionalHeaders, JSON);
    Connection = CreateConnection(Server, Safe, , , Port);
    Response   = ExecuteRequest(Request, Connection, View, ResponseFile, FullResponse);

    Return Response;

EndFunction

Function ExecuteRequestWithBinaryData(Val URL, Val View, Val Data, Val AdditionalHeaders, Val FullResponse,
    Val DataType)

    URLStructure = SplitURL(URL);
    Server       = URLStructure["Server"];
    Address      = URLStructure["Address"];
    Safe         = URLStructure["Safe"];
    Port         = URLStructure["Port"];

    Request    = CreateRequest(Address, AdditionalHeaders, DataType);
    Connection = CreateConnection(Server, Safe, , , Port);

    If Not Data.Size() = 0 Then
        Request.SetBodyFromBinary(Data);
    EndIf;

    Response = ExecuteRequest(Request, Connection, View, , FullResponse);

    Return Response;

EndFunction

Function ExecuteRequestWithoutBody(Val URL, Val View, Val Parameters = "", Val AdditionalHeaders = "",
    Val ResponseFile = Undefined)

    If Not ValueIsFilled(Parameters) Then
        Parameters = New Structure;
    EndIf;

    URLStructure = SplitURL(URL);
    Server       = URLStructure["Server"];
    Address      = URLStructure["Address"] + RequestParametersToString(Parameters);
    Safe         = URLStructure["Safe"];
    Port         = URLStructure["Port"];

    Request    = CreateRequest(Address, AdditionalHeaders);
    Connection = CreateConnection(Server, Safe, , , Port);

    Response = ExecuteRequest(Request, Connection, View, ResponseFile);

    Return Response;

EndFunction

Function ExecuteMultipartRequest(Val URL, Val View, Val Parameters = "", Val Files = "",
    Val ContentType = "image/jpeg", Val AdditionalHeaders = "", Val ResponseFile = Undefined)

    If Not ValueIsFilled(Parameters) Then
        Parameters = New Structure;
    EndIf;

    If Not ValueIsFilled(Files) Then
        Files = New Map;
    EndIf;

    URLStructure = SplitURL(URL);
    Server       = URLStructure["Server"];
    Address      = URLStructure["Address"];
    Safe         = URLStructure["Safe"];
    Port         = URLStructure["Port"];

    RequestBody = GetTempFileName();

    Request    = CreateMultipartRequest(Address, Parameters, Files, AdditionalHeaders, RequestBody, ContentType);
    Connection = CreateConnection(Server, Safe, , , Port);
    Response   = ExecuteRequest(Request, Connection, View, ResponseFile);

    Request    = Undefined;
    TextRecord = Undefined;

    DeleteFiles(RequestBody);
    Return Response;

EndFunction

Function ExecuteMultipartRelatedRequest(Val URL, Val View, Val JSON = "", Val Files = "", Val AdditionalHeaders = "",
    Val ResponseFile = Undefined)

    URLStructure = SplitURL(URL);
    Server       = URLStructure["Server"];
    Address      = URLStructure["Address"];
    Safe         = URLStructure["Safe"];
    Port         = URLStructure["Port"];

    RequestBody = GetTempFileName();

    Request    = CreateMultipartRelatedRequest(Address, Files, JSON, AdditionalHeaders, RequestBody);
    Connection = CreateConnection(Server, Safe, , , Port);

    Response = ExecuteRequest(Request, Connection, View, ResponseFile);

    Request    = Undefined;
    TextRecord = Undefined;

    DeleteFiles(RequestBody);
    Return Response;

EndFunction

Function ThisIsRedirection(Val Response)

    Redirection = 300;
    Error       = 400;

    ThisIsRedirection = Response.StatusCode >= Redirection And Response.StatusCode < Error And ValueIsFilled(
        Response.Headers["Location"]);

    Return ThisIsRedirection;

EndFunction

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

Function SplitFileKey(Val FileData, Val ContentType)

    DotReplacement = "___";
    FileName       = StrReplace(FileData, DotReplacement, ".");
    NameParts      = StrSplit(FileName, "|", False);
    NeedParts      = 2;

    If NameParts.Count() = NeedParts Then
        FieldName        = NameParts[0];
        FileName         = NameParts[1];
    Else

        If ContentType = "image/jpeg" Then

            FieldName = "photo";

        Else

            FieldName = Left(FileName, StrFind(FileName, ".") - 1);
            FieldName = ?(ValueIsFilled(FieldName), FieldName, StrReplace(FileData, DotReplacement, "."));

        EndIf;

    EndIf;

    ReturnStructure = New Structure("FieldName,FileName", FieldName, FileName);

    Return ReturnStructure;

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

Procedure SetRequestBody(Request, Val Parameters, Val JSON)

    Collection   = TypeOf(Parameters)   = Type("Structure") Or TypeOf(Parameters)   = Type("Map") Or TypeOf(Parameters)
                 = Type("Array");

    If JSON Then

        Data = JSONString(Parameters);

    ElsIf Not Collection Then

        Data = Parameters;

    Else

        ParameterString = RequestParametersToString(Parameters);
        Data            = Right(ParameterString, StrLen(ParameterString) - 1);

    EndIf;

    If TypeOf(Data) = Type("String") Then
        Request.SetBodyFromString(Data);
    Else
        //@skip-check wrong-type-expression
        Request.SetBodyFromBinary(Data);
    EndIf;

EndProcedure

Procedure WriteMultipartParameters(TextRecord, Val Boundary, Val Parameters)

    LineSeparator = Chars.CR + Chars.LF;

    For Each Parameter In Parameters Do

        If Parameter.Value = Undefined Or Parameter.Value = Null Then
            Continue;
        EndIf;

        TextRecord.WriteLine("--" + boundary + LineSeparator);
        TextRecord.WriteLine("Content-Disposition: form-data; name=""" + Parameter.Key + """");
        TextRecord.WriteLine(LineSeparator);
        TextRecord.WriteLine(LineSeparator);

        If TypeOf(Parameter.Value) = Type("String") Or TypeOf(Parameter.Value) = Type("Number") Then

            ValueAsString = NumberToString(Parameter.Value);
            TextRecord.WriteLine(ValueAsString);

        ElsIf TypeOf(Parameter.Value) = Type("Boolean") Then

            TextRecord.WriteLine(?(Parameter.Value, "true", "false"));

        Else

            TextRecord.Write(Parameter.Value);

        EndIf;

        TextRecord.WriteLine(LineSeparator);

    EndDo;

EndProcedure

Procedure WriteMultipartFiles(TextRecord, Val Boundary, Val ContentType, Val Files)

    ContentType   = TrimAll(ContentType);
    LineSeparator = Chars.CR + Chars.LF;

    For Each File In Files Do

        DataStructure = SplitFileKey(File.Key, ContentType);

        FieldName = DataStructure["FieldName"];
        FileName  = DataStructure["FileName"];

        TextRecord.WriteLine("--" + boundary + LineSeparator);
        TextRecord.WriteLine("Content-Disposition: form-data; name=""" + FieldName + """; filename=""" + FileName
            + """");
        TextRecord.WriteLine(LineSeparator);

        If ValueIsFilled(ContentType) Then
            TextRecord.WriteLine("Content-Type: " + ContentType);
        EndIf;

        TextRecord.WriteLine(LineSeparator);
        TextRecord.WriteLine(LineSeparator);
        WriteBinaryData(TextRecord, File.Value);
        TextRecord.WriteLine(LineSeparator);

    EndDo;

EndProcedure

Procedure WriteRelatedFiles(TextRecord, Val Boundary, Val Files)

    If Not ValueIsFilled(Files) Then
        Return;
    EndIf;

    LineSeparator = Chars.CR + Chars.LF;

    If TypeOf(Files) = Type("Map") Then
        For Each File In Files Do

            TextRecord.WriteLine("--" + boundary + LineSeparator);
            TextRecord.WriteLine("Content-Type: " + File.Value);
            TextRecord.WriteLine(LineSeparator);
            TextRecord.WriteLine(LineSeparator);
            WriteBinaryData(TextRecord, File.Key);
            TextRecord.WriteLine(LineSeparator);
            TextRecord.WriteLine(LineSeparator);

        EndDo;

    EndIf;

EndProcedure

Procedure WriteBinaryData(DataWriter, Val BinaryData)

    ChunkSize       = 268435456;
    BytesRead       = 0;
    CurrentPosition = 0;
    TotalSize       = BinaryData.Size();

    WHile BytesRead < TotalSize Do

        DataReader  = New DataReader(BinaryData);
        BytesRead   = DataReader.Skip(CurrentPosition);
        Result      = DataReader.Read(ChunkSize);
        CurrentData = Result.GetBinaryData();
        CurrentSize = CurrentData.Size();

        If Not ValueIsFilled(CurrentData) Then
            Break;
        EndIf;

        DataWriter.Write(CurrentData);

        FreeObject(CurrentData);
        RunGarbageCollection();

        CurrentPosition = CurrentPosition + CurrentSize;

    EndDo;

EndProcedure

Procedure WriteJSONMultipart(TextRecord, Val Boundary, Val JSON)

    If Not ValueIsFilled(JSON) Then
        Return;
    EndIf;

    LineSeparator = Chars.CR + Chars.LF;

    TextRecord.WriteLine("--" + boundary + LineSeparator);
    TextRecord.WriteLine("Content-Type: application/json; charset=UTF-8");
    TextRecord.WriteLine(LineSeparator);
    TextRecord.WriteLine(LineSeparator);
    TextRecord.WriteLine(JSON);
    TextRecord.WriteLine(LineSeparator);
    TextRecord.WriteLine(LineSeparator);

EndProcedure

Procedure AddContentLength(Request)

    RequestBody = Request.ПолучитьТелоКакДвоичныеДанные();

    If ValueIsFilled(RequestBody) Then

        Size = RequestBody.Size();
        Request.Headers.Insert("Content-Length", NumberToString(Size));

    EndIf;

EndProcedure

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

#Region GZip

// Structure description at https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
// Source: https://github.com/vbondarevsky/Connector

// Connector: convenient HTTP client for 1C:Enterprise 8
//
// Copyright 2017-2023 Vladimir Bondarevskiy
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//
// URL: https://github.com/vbondarevsky/Connector
// e-mail: vbondarevsky@gmail.com
// Version: 2.4.8
//
// Requirements: 1C platform version 8.3.10 and above

Function UnpackResponse(Response)

    Try
        Return ReadGZip(Response.ПолучитьТелоКакДвоичныеДанные());
    Except
        Return Response;
    EndTry;

EndFunction

Function ReadGZip(CompressedData) Export

    GZipPrefixSize  = 10;
    GZipPostfixSize = 8;

    SizeDD  = ZipSizeDD();
    SizeCDH = ZipSizeCDH();
    SizeESD = ZipSizeEOCD();
    SizeLFH = ZipSizeLFH();

    DataReader         = New DataReader(CompressedData);
    DataReader.Skip(GZipPrefixSize);
    CompressedDataSize = DataReader.SourceStream().Size() - GZipPrefixSize - GZipPostfixSize;

    ZipStream = New MemoryStream(SizeLFH + CompressedDataSize + SizeDD + SizeCDH + SizeESD);

    DataWriter = New DataWriter(ZipStream);
    DataWriter.WriteBinaryDataBuffer(ZipLFH());
    DataReader.CopyTo(DataWriter, CompressedDataSize);

    DataWriter.Close();
    DataWriter = New DataWriter(ZipStream);

    CRC32 = DataReader.ReadInt32();
    UncompressedDataSize = DataReader.ReadInt32();
    DataReader.Close();

    DataWriter.WriteBinaryDataBuffer(ZipDD(CRC32 , CompressedDataSize, UncompressedDataSize));
    DataWriter.WriteBinaryDataBuffer(ZipCDH(CRC32, CompressedDataSize, UncompressedDataSize));
    DataWriter.WriteBinaryDataBuffer(ZipEOCD(CompressedDataSize));
    DataWriter.Close();

    Return ReadZip(ZipStream);

EndFunction

Function ReadZip(CompressedData, ErrorText = Undefined)

    Directory     = GetTempFileName();
    ReadingZip    = New ZipFileReader(CompressedData);
    FileName      = ReadingZip.Items[0].Name;
    Try
        ReadingZip.Extract(ReadingZip.Items[0], Directory, ZIPRestoreFilePathsMode.DontRestore);
    Except
        // Ignore archive integrity check, just read the result
        ErrorText = DetailErrorDescription(ErrorInfo());
    EndTry;
    ReadingZip.Close();

    Result = New BinaryData(Directory + GetPathSeparator() + FileName);
    DeleteFiles(Directory);

    Return Result;

EndFunction

Function ZipSizeLFH()

    Return 34;

EndFunction

Function ZipSizeDD()

    Return 16;

EndFunction

Function ZipSizeCDH()

    Return 50;

EndFunction

Function ZipSizeEOCD()

    Return 22;

EndFunction

Function ZipLFH()

    // Local file header
    Buffer = New BinaryDataBuffer(ZipSizeLFH());
    Buffer.WriteInt32(0, 67324752); // signature 0x04034b50
    Buffer.WriteInt16(4, 20); // version
    Buffer.WriteInt16(6, 10); // bit flags
    Buffer.WriteInt16(8, 8); // compression method
    Buffer.WriteInt16(10, 0); // time
    Buffer.WriteInt16(12, 0); // date
    Buffer.WriteInt32(14, 0); // crc-32
    Buffer.WriteInt32(18, 0); // compressed size
    Buffer.WriteInt32(22, 0); // uncompressed size
    Buffer.WriteInt16(26, 4); // filename legth - "data"
    Buffer.WriteInt16(28, 0); // extra field length
    Buffer.Write(30, ПолучитьБуферДвоичныхДанныхИзСтроки("data", "ascii", False));

    Return Buffer;

EndFunction

Function ZipDD(CRC32, CompressedDataSize, UncompressedDataSize)

    // Data descriptor
    Buffer = New BinaryDataBuffer(ZipSizeDD());
    Buffer.WriteInt32(0, 134695760);
    Buffer.WriteInt32(4, CRC32);
    Buffer.WriteInt32(8, CompressedDataSize);
    Buffer.WriteInt32(12, UncompressedDataSize);

    Return Buffer;

EndFunction

Function ZipCDH(CRC32, CompressedDataSize, UncompressedDataSize)

    // Central directory header
    Buffer = New BinaryDataBuffer(ZipSizeCDH());
    Buffer.WriteInt32(0, 33639248); // signature 0x02014b50
    Buffer.WriteInt16(4, 798); // version made by
    Buffer.WriteInt16(6, 20); // version needed to extract
    Buffer.WriteInt16(8, 10); // bit flags
    Buffer.WriteInt16(10, 8); // compression method
    Buffer.WriteInt16(12, 0); // time
    Buffer.WriteInt16(14, 0); // date
    Buffer.WriteInt32(16, CRC32); // crc-32
    Buffer.WriteInt32(20, CompressedDataSize); // compressed size
    Buffer.WriteInt32(24, UncompressedDataSize); // uncompressed size
    Buffer.WriteInt16(28, 4); // file name length
    Buffer.WriteInt16(30, 0); // extra field length
    Buffer.WriteInt16(32, 0); // file comment length
    Buffer.WriteInt16(34, 0); // disk number start
    Buffer.WriteInt16(36, 0); // internal file attributes
    Buffer.WriteInt32(38, 2176057344); // external file attributes
    Buffer.WriteInt32(42, 0); // relative offset of local header
    Buffer.Write(46, ПолучитьБуферДвоичныхДанныхИзСтроки("data", "ascii", False));

    Return Buffer;

EndFunction

Function ZipEOCD(CompressedDataSize)

    // End of central directory
    SizeCDH = 50;
    Buffer = New BinaryDataBuffer(ZipSizeEOCD());
    Buffer.WriteInt32(0, 101010256); // signature 0x06054b50
    Buffer.WriteInt16(4, 0); // number of this disk
    Buffer.WriteInt16(6, 0); // number of the disk with the start of the central directory
    Buffer.WriteInt16(8, 1); // total number of entries in the central directory on this disk
    Buffer.WriteInt16(10, 1); // total number of entries in the central directory
    Buffer.WriteInt32(12, SizeCDH); // size of the central directory
    // offset of start of central directory with respect to the starting disk number
    Buffer.WriteInt32(16, ZipSizeLFH() + CompressedDataSize + ZipSizeDD());
    Buffer.WriteInt16(20, 0); // the starting disk number

    Return Buffer;

EndFunction

#EndRegion

#EndRegion
