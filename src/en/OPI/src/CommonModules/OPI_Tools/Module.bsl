// Location OS: ./OInt/tools/Modules/internal/Modules/OPI_Tools.os

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

#Region ServiceProgramInterface

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

Function Post(Val URL
    , Val Parameters = ""
    , Val AdditionalHeaders = ""
    , Val JSON = True
    , Val FullResponse = False
    , Val ResponseFile = Undefined) Export
    
    Return ExecuteRequestWithBody(URL, "POST", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);
    
EndFunction

Function Patch(Val URL
    , Val Parameters = ""
    , Val AdditionalHeaders = ""
    , Val JSON = True
    , Val FullResponse = False
    , Val ResponseFile = Undefined) Export
    
    Return ExecuteRequestWithBody(URL, "PATCH", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);
    
EndFunction

Function Put(Val URL
    , Val Parameters = ""
    , Val AdditionalHeaders = ""
    , Val JSON = True
    , Val FullResponse = False
    , Val ResponseFile = Undefined) Export
    
    Return ExecuteRequestWithBody(URL, "PUT", Parameters, AdditionalHeaders, JSON, FullResponse, ResponseFile);
    
EndFunction

Function PostBinary(Val URL
    , Val Body
    , Val AdditionalHeaders
    , Val FullResponse = False
    , Val DataType = "application/octet-stream") Export
    
    Return ExecuteRequestWithBinaryData(URL, "POST", Body, AdditionalHeaders, FullResponse, DataType);
    
EndFunction

#EndRegion 

#Region MultipartRequests

Function PostMultipart(Val URL
    , Val Parameters = ""
    , Val Files = ""
    , Val ContentType = "image/jpeg"
    , Val AdditionalHeaders = ""
    , Val ResponseFile = Undefined) Export

    Return ExecuteMultipartRequest(URL, "POST", Parameters, Files, ContentType, AdditionalHeaders, ResponseFile);

EndFunction

Function PutMultipart(Val URL
    , Val Parameters = ""
    , Val Files = ""
    , Val ContentType = "image/jpeg"
    , Val AdditionalHeaders = ""
    , Val ResponseFile = Undefined) Export

    Return ExecuteMultipartRequest(URL, "PUT", Parameters, Files, ContentType, AdditionalHeaders, ResponseFile);

EndFunction

Function PostMultipartRelated(Val URL
    , Val JSON = ""
    , Val Files = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile = Undefined) Export
       
    Return ExecuteMultipartRelatedRequest(URL, "POST", JSON, Files, AdditionalHeaders, ResponseFile);
    
EndFunction

Function PatchMultipartRelated(Val URL
    , Val JSON = ""
    , Val Files = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile = Undefined) Export  
     
    Return ExecuteMultipartRelatedRequest(URL, "PATCH", JSON, Files, AdditionalHeaders, ResponseFile);
    
EndFunction

#EndRegion

#Region Miscellaneous

Procedure ProcessResponse(Response, Val FullResponse = False) Export 
    
    If FullResponse Or TypeValue(Response) <> Type("HTTPResponse") Then
        Return;
    EndIf;
    
    BodyFile = Response.GetBodyFileName();
    
    If Not BodyFile = Undefined Then
        Response = BodyFile;
        Return;
    EndIf;
    
    GZip = "gzip";        
    NeedsUnpacking = 
        Response.Headers.Get("Content-Encoding") = GZip 
        Or Response.Headers.Get("content-encoding") = GZip;
    
    If NeedsUnpacking Then
        Response = UnpackResponse(Response);
    EndIf;
    
    Response = ?(TypeValue(Response) = Type("HTTPResponse"), Response.GetBodyAsBinaryData(), Response);
    
    If TypeValue(Response) = Type("BinaryData") Then
        
        Try
            Response = JsonToStructure(Response);
        Except
            Return;
        EndTry;
        
    EndIf;
    
EndProcedure

Function CreateRequest(Val Address, Val AdditionalHeaders = "", Val DataType = "") Export
      
    Headers = New Match;
    Headers.Insert("Accept-Encoding", "gzip");
    Headers.Insert("Accept" , "*/*");
    Headers.Insert("Connection" , "keep-alive");
    Headers.Insert("Accept-Charset" , "utf-8");
   
    If ValueIsFilled(DataType) Then
        Headers.Insert("Content-Type", DataType);
    EndIf;
       
    If TypeValue(AdditionalHeaders) = Type("Match") Then
        
        For Each Title In AdditionalHeaders Do
            Headers.Insert(Title.Key, Title.Value);
        EndDo;
        
    EndIf;
    
    NewRequest = New HTTPRequest(Address, Headers);
    
    Return NewRequest;
    
EndFunction

Function CreateConnection(Val Server, Val User = "", Val Password = "") Export
    
    Try 
        SSL = New SecureConnectionOpenSSL;
        Return New HTTPConnection(Server, 443, User, Password, , 3000, SSL);
    Except
        Return New HTTPConnection(Server, 443, User, Password, , 3000);
    EndTry;
    
EndFunction

#EndRegion

#EndRegion

#Region Service

Function RequestParametersToString(Val Parameters) Export

    If Parameters.Quantity() = 0 Then
        Return "";
    EndIf;

    ParameterString = "?";

    For Each Parameter In Parameters Do
        
        ParameterValue = ConvertParameterToString(Parameter.Value);
        
        ParameterString = ParameterString 
            + Parameter.Key 
            + "=" 
            + ParameterValue
            + "&";
    EndDo;

    ParameterString = Left(ParameterString, StrLength(ParameterString) - 1);

    Return ParameterString;

EndFunction

Function SplitURL(Val URL) Export

    URL = StringReplace(URL, "https://", "");
    URL = StringReplace(URL, "http://", "");
    URL = StringReplace(URL, ":443", "");

    Address = Right(URL, StrLength(URL) - StrFind(URL, "/", SearchDirection.FromStart) + 1);
    Server = Left(URL, StrFind(URL, "/", SearchDirection.FromStart) - 1);
    
    Try        
        SSL = New SecureConnectionOpenSSL;   
    Except
        Server = "https://" + Server;
    EndTry;
      
    ReturnStructure = New Structure;
    ReturnStructure.Insert("Server", Server);
    ReturnStructure.Insert("Address" , Address);

    Return ReturnStructure;

EndFunction

Function JsonToStructure(Val Text) Export

    If Not ValueIsFilled(Text) Then
        Return "";
    EndIf;
    
    Text = ?(TypeValue(Text) = Type("BinaryData"), GetStringFromBinaryData(Text), Text);

    ReadingJSON = New ReadingJSON;
    ReadingJSON.SetString(Text);

    Data = ReadJSON(ReadingJSON, True, Undefined, JSONDateFormat.ISO);
    ReadingJSON.Close();

    Return Data;

EndFunction

Function JSONString(Val Data, Val Escaping = "No") Export

    JSONParameters = New JSONWriteParameters(JSONLineBreak.Windows
        , " "
        , True
        , EscapeJSONCharacters[Escaping]
        , False
        , False
        , False
        , False);

    Try
        
        WritingJSON = New WritingJSON;
        WritingJSON.SetString(JSONParameters);
    
        WriteJSON(WritingJSON, Data);
        Return WritingJSON.Close();
    
    Except      
        Return "NOT JSON: " + String(Data);
    EndTry;

EndFunction

Function NumberToString(Val Number) Export
    Return StringReplace(String(Number), Symbols.NPP, "");
EndFunction

Function ReadJSONFile(Val Path) Export
    
    ReadingJSON = New ReadingJSON;
    ReadingJSON.OpenFile(Path);  
    Values = ReadJSON(ReadingJSON);
    
    ReadingJSON.Close();
    
    Return Values;
    
EndFunction

Function RequestParametersToMatch(Val ParameterString) Export

    ReturnMapping = New Match;
    NumberOfParts = 2;
    ParameterArray = StrSplit(ParameterString, "&", False);

    For Each Parameter In ParameterArray Do

        KeyValueArray = StrSplit(Parameter, "=");

        If KeyValueArray.Quantity() = NumberOfParts Then
            ReturnMapping.Insert(KeyValueArray[0], KeyValueArray[1]);
        EndIf;

    EndDo;

    Return ReturnMapping;

EndFunction

Function GetCurrentDate() Export
    Return LocalTime(CurrentUniversalDate());    
EndFunction

Function UNIXTime(Val Date) Export
    
    OTD = New TypeDescription("Date");
    Date = OTD.ConvertValue(Date);
    
    UNIX = Format(Date - Date(1970, 1, 1, 1, 0, 0), "HC=10; HDC=0; HG=0");
    UNIX = StringReplace(UNIX, ",", "");
    UNIX = Left(UNIX, 10);
    
    Return UNIX;
    
EndFunction

Function ProgressInformation(Val Current, Val Total, Val Unit, Val Divider = 1) Export
    
    Whole = 100;
    Current = Round(Current / Divider, 2);
    Total = Round(Total / Divider, 2); 
    Percent = Goal(Current / Total * Whole);
             
    StrCurrent = NumberToString(Current);
    StrTotal = NumberToString(Total);
    StrPercentage = NumberToString(Percent);
   
    Information = StrCurrent + "/" + StrTotal + " " + Unit + " ( " + StrPercentage + "% )";
    
    Return Information;
    
EndFunction

Function ConvertDataWithSizeRetrieval(Data, Val MinimumStreamSize = 0) Export
    
    Size = 0;
    
    If TypeValue(Data) = Type("String") Then
        
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

Procedure ValueToArray(Value) Export
    
    Value_ = New Array;
    Value_.Add(Value);
    Value = Value_;

EndProcedure

Procedure ReplaceSpecialCharacters(Text, Markup = "Markdown") Export
    
    CharacterMapping = New Match;
    
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
        Text = StringReplace(Text, ArraySymbol.Key, ArraySymbol.Value);
    EndDo;

EndProcedure

Procedure RemoveEmptyCollectionFields(Collection) Export
    
    CollectionType = TypeValue(Collection);
    OutputCollection = New(CollectionType);
    
    If CollectionType = Type("Match") Or CollectionType = Type("Structure") Then
        
        RemoveEmptyKeyValues(Collection, OutputCollection);
        
    ElsIf CollectionType = Type("Array") Then
        
        RemoveEmptyArrayElements(Collection, OutputCollection);
        
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
    
    If Type = "Date" Then
        OPI_TypeConversion.GetDate(Value);
        Value = UNIXTime(Value);
        
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
        
    Else
        OPI_TypeConversion.GetLine(Value);
        
    EndIf;
    
    Collection.Insert(Name, Value);
    
EndProcedure

#EndRegion

#EndRegion

#Region ServiceProceduresAndFunctions

Function ExecuteRequestWithBody(Val URL
    , Val View
    , Val Parameters = ""
    , Val AdditionalHeaders = ""
    , Val JSON = True
    , Val FullResponse = False
    , Val ResponseFile = Undefined)
    
    If Not ValueIsFilled(Parameters) Then
        Parameters = New Structure;
    EndIf;
    
    DataType = ?(JSON, "application/json; charset=utf-8", "application/x-www-form-urlencoded; charset=utf-8");   
    URLStructure = SplitURL(URL);
    Server = URLStructure["Server"];
    Address = URLStructure["Address"];
    
    Request = CreateRequest(Address, AdditionalHeaders, DataType);
    Connection = CreateConnection(Server);
    
    SetRequestBody(Request, Parameters, JSON);

    If ValueIsFilled(ResponseFile) Then
        Response = Connection.CallHTTPMethod(View, Request, ResponseFile);
    Else
        Response = Connection.CallHTTPMethod(View, Request);
    EndIf;
     
    If ThisIsRedirection(Response) Then  
        Response = ExecuteRequestWithBody(Response.Headers["Location"]
            , View
            , Parameters
            , AdditionalHeaders
            , JSON
            , FullResponse
            , ResponseFile);    
    Else    
        ProcessResponse(Response, FullResponse);      
    EndIf;

    Return Response;

EndFunction

Function ExecuteRequestWithBinaryData(Val URL
    , Val View
    , Val Data
    , Val AdditionalHeaders
    , Val FullResponse
    , Val DataType)
    
    URLStructure = SplitURL(URL);
    Server = URLStructure["Server"];
    Address = URLStructure["Address"];
    
    Request = CreateRequest(Address, AdditionalHeaders, DataType);
    Connection = CreateConnection(Server);
    
    Request.SetBodyFromBinaryData(Data);
    
    Response = Connection.CallHTTPMethod(View, Request);

    If ThisIsRedirection(Response) Then  
        Response = ExecuteRequestWithBinaryData(Response.Headers["Location"]
            , View
            , Data
            , AdditionalHeaders
            , FullResponse
            , DataType);    
    Else    
        ProcessResponse(Response, FullResponse);      
    EndIf;

    Return Response;

EndFunction

Function ExecuteRequestWithoutBody(Val URL
    , Val View
    , Val Parameters = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile = Undefined)
    
    If Not ValueIsFilled(Parameters) Then
        Parameters = New Structure;
    EndIf;

    URLStructure = SplitURL(URL);
    Server = URLStructure["Server"];
    Address = URLStructure["Address"] + RequestParametersToString(Parameters);
    
    Request = CreateRequest(Address, AdditionalHeaders);
    Connection = CreateConnection(Server);  
     
    If ValueIsFilled(ResponseFile) Then
        Response = Connection.CallHTTPMethod(View, Request, ResponseFile);
    Else
        Response = Connection.CallHTTPMethod(View, Request);
    EndIf;
      
    If ThisIsRedirection(Response) Then  
        Response = ExecuteRequestWithoutBody(Response.Headers["Location"], View, Parameters, AdditionalHeaders, ResponseFile);    
    Else    
        ProcessResponse(Response);      
    EndIf;

    Return Response;
    
EndFunction

Function ExecuteMultipartRequest(Val URL
    , Val View
    , Val Parameters = ""
    , Val Files = ""
    , Val ContentType = "image/jpeg"
    , Val AdditionalHeaders = ""
    , Val ResponseFile = Undefined)
    
    If Not ValueIsFilled(Parameters) Then
        Parameters = New Structure;
    EndIf;

    If Not ValueIsFilled(Files) Then
        Files = New Match;
    EndIf;

    Redirection = 300;
    Error = 400;
    Boundary = StringReplace(String(New UniqueIdentifier), "-", "");
    LineSeparator = Symbols.VK + Symbols.PS;
    DataType = "multipart/form-data; boundary=" + Boundary;
    URLStructure = SplitURL(URL);
    Server = URLStructure["Server"];
    Address = URLStructure["Address"];
    
    Request = CreateRequest(Address, AdditionalHeaders, DataType);
    Connection = CreateConnection(Server);
    
    RequestBody = GetTempFileName();
    TextRecord = New DataRecording(RequestBody
        , TextEncoding.UTF8
        , ByteOrder.LittleEndian
        , ""
        , False
        , ""
        , False);

    WriteMultipartParameters(TextRecord, Boundary, Parameters);
    WriteMultipartFiles(TextRecord, Boundary, ContentType, Files);
    
    TextRecord.WriteString("--" + boundary + "--" + LineSeparator);
    TextRecord.Close();

    Request.SetBodyFileName(RequestBody);
    
    If ValueIsFilled(ResponseFile) Then
        Response = Connection.CallHTTPMethod(View, Request, ResponseFile);
    Else
        Response = Connection.CallHTTPMethod(View, Request);
    EndIf;
        
    ThisIsRedirection = Response.StatusCode >= Redirection And Response.StatusCode < Error;
   
    If ThisIsRedirection Then  
        Response = ExecuteMultipartRequest(Response.Headers["Location"]
            , View
            , Parameters
            , Files
            , ContentType
            , AdditionalHeaders
            , ResponseFile);    
    Else    
        ProcessResponse(Response);      
    EndIf;
    
    Request = Undefined;
    TextRecord = Undefined;
    
    DeleteFiles(RequestBody);
    Return Response;
       
EndFunction

Function ExecuteMultipartRelatedRequest(Val URL
    , Val View
    , Val JSON = ""
    , Val Files = ""
    , Val AdditionalHeaders = ""
    , Val ResponseFile = Undefined) 
    
    Redirection = 300;
    Error = 400;
    Boundary = StringReplace(String(New UniqueIdentifier), "-", "");
    LineSeparator = Symbols.VK + Symbols.PS;
    DataType = "multipart/related; boundary=" + Boundary;
    URLStructure = SplitURL(URL);
    Server = URLStructure["Server"];
    Address = URLStructure["Address"];
    
    Request = CreateRequest(Address, AdditionalHeaders, DataType);
    Connection = CreateConnection(Server);
    
    RequestBody = GetTempFileName();
    TextRecord = New DataRecording(RequestBody
        , TextEncoding.UTF8
        , ByteOrder.LittleEndian
        , ""
        , False
        , ""
        , False);
    
    WriteJSONMultipart(TextRecord, Boundary, JSON);
    WriteRelatedFiles(TextRecord, Boundary, Files);        
    
    TextRecord.WriteString("--" + boundary + "--" + LineSeparator);
    TextRecord.Close();
    
    AddContentLength(Request);
    
    Request.SetBodyFileName(RequestBody);
    
    If ValueIsFilled(ResponseFile) Then
        Response = Connection.CallHTTPMethod(View, Request, ResponseFile);
    Else
        Response = Connection.CallHTTPMethod(View, Request);
    EndIf;
        
    ThisIsRedirection = Response.StatusCode >= Redirection And Response.StatusCode < Error;
    
    If ThisIsRedirection Then  
        Response = ExecuteMultipartRelatedRequest(Response.Headers["Location"]
            , View
            , JSON
            , Files
            , AdditionalHeaders
            , ResponseFile);    
    Else    
        ProcessResponse(Response);      
    EndIf;
    
    Request = Undefined;
    TextRecord = Undefined;

    DeleteFiles(RequestBody);
    Return Response;

EndFunction

Function ThisIsRedirection(Val Response)
    
    Redirection = 300;
    Error = 400;

    ThisIsRedirection = Response.StatusCode >= Redirection 
        And Response.StatusCode < Error
        And ValueIsFilled(Response.Headers["Location"]);
    
    Return ThisIsRedirection;
    
EndFunction

Function ConvertParameterToString(Val Value)

    If TypeValue(Value) = Type("Array") Then
        Value = StrJoin(Value, ",");
        Value = EncodeString(Value, StringEncodingMethod.URLencoding);
        Value = "[" + Value + "]"; 
    Else
        Value = NumberToString(Value);
        Value = EncodeString(Value, StringEncodingMethod.URLencoding);
    EndIf;
    
    Return Value;
    
EndFunction

Procedure SetRequestBody(Request, Val Parameters, Val JSON)
    
    Collection = TypeValue(Parameters) = Type("Structure") 
        Or TypeValue(Parameters) = Type("Match")
        Or TypeValue(Parameters) = Type("Array");
        
    If JSON Then
        Data = JSONString(Parameters);
    ElsIf Not Collection Then
        Data = Parameters;
    Else
        ParameterString = RequestParametersToString(Parameters);
        Data = Right(ParameterString, StrLength(ParameterString) - 1);
    EndIf;
    
    If TypeValue(Data) = Type("String") Then
        Request.SetBodyFromString(Data);
    Else
        //@skip-check wrong-type-expression
        Request.SetBodyFromBinaryData(Data);
    EndIf;
    
EndProcedure

Procedure WriteMultipartParameters(TextRecord, Val Boundary, Val Parameters)
    
    LineSeparator = Symbols.VK + Symbols.PS;
    
    For Each Parameter In Parameters Do
        
        If Parameter.Value = Undefined
            Or Parameter.Value = NULL Then
            Continue;
        EndIf;
        
        TextRecord.WriteString("--" + boundary + LineSeparator);
        TextRecord.WriteString("Content-Disposition: form-data; name=""" + Parameter.Key + """");
        TextRecord.WriteString(LineSeparator);
        TextRecord.WriteString(LineSeparator);
        
        If TypeValue(Parameter.Value) = Type("String") 
            Or TypeValue(Parameter.Value) = Type("Number") Then
            
            ValueAsString = NumberToString(Parameter.Value);
            TextRecord.WriteString(ValueAsString);
            
        ElsIf TypeValue(Parameter.Value) = Type("Boolean") Then
            
            TextRecord.WriteString(?(Parameter.Value, "true", "false"));
            
        Else
            
            TextRecord.Write(Parameter.Value);
            
        EndIf;
        
        TextRecord.WriteString(LineSeparator);
        
    EndDo;
    
EndProcedure

Procedure WriteMultipartFiles(TextRecord, Val Boundary, Val ContentType, Val Files)
    
    ContentType = ShortLP(ContentType);
    LineSeparator = Symbols.VK + Symbols.PS;
    DotReplacement = "___";
    
    For Each File In Files Do
        
        FilePath = StringReplace(File.Key, DotReplacement, ".");
        
        If ContentType = "image/jpeg" Then
            SendingFileName = "photo";
        Else
            SendingFileName = StringReplace(File.Key, DotReplacement, ".");
            SendingFileName = Left(SendingFileName, StrFind(SendingFileName, ".") - 1);
            SendingFileName = ?(ValueIsFilled(SendingFileName), SendingFileName, StringReplace(File.Key,
            DotReplacement, "."));
        EndIf;
        
        TextRecord.WriteString("--" + boundary + LineSeparator);
        TextRecord.WriteString("Content-Disposition: form-data; name=""" 
            + SendingFileName 
            + """; filename=""" 
            + FilePath
            + """");
        TextRecord.WriteString(LineSeparator);      
        
        If ValueIsFilled(ContentType) Then
            TextRecord.WriteString("Content-Type: " + ContentType);
        EndIf;
        
        TextRecord.WriteString(LineSeparator);
        TextRecord.WriteString(LineSeparator);
        WriteBinaryData(TextRecord, File.Value);
        TextRecord.WriteString(LineSeparator);
        
    EndDo;

EndProcedure

Procedure WriteRelatedFiles(TextRecord, Val Boundary, Val Files)
    
    If Not ValueIsFilled(Files) Then
        Return;
    EndIf;
    
    LineSeparator = Symbols.VK + Symbols.PS;
    
    If TypeValue(Files) = Type("Match") Then
        For Each File In Files Do
            
            TextRecord.WriteString("--" + boundary + LineSeparator);
            TextRecord.WriteString("Content-Type: " + File.Value);
            TextRecord.WriteString(LineSeparator);
            TextRecord.WriteString(LineSeparator);
            WriteBinaryData(TextRecord, File.Key);
            TextRecord.WriteString(LineSeparator);
            TextRecord.WriteString(LineSeparator);
            
        EndDo;
        
    EndIf;

EndProcedure

Procedure WriteBinaryData(DataRecording, Val BinaryData)
    
    ChunkSize = 268435456;
    BytesRead = 0;
    CurrentPosition = 0;
    TotalSize = BinaryData.Size();

    WHile BytesRead < TotalSize Do
        
        ReadingData = New ReadingData(BinaryData);
        BytesRead = ReadingData.Skip(CurrentPosition);
        Result = ReadingData.Read(ChunkSize);
        Current data = Result.GetBinaryData();
        CurrentSize = Current data.Size();
        
        If Not ValueIsFilled(Current data) Then
            Break;
        EndIf;

        DataRecording.Write(Current data);
        
        // !OInt ReleaseObject(Current data);
        // !OInt PerformGarbageCollection();

        CurrentPosition = CurrentPosition + CurrentSize;
        
    EndDo;

EndProcedure

Procedure WriteJSONMultipart(TextRecord, Val Boundary, Val JSON)
    
    If Not ValueIsFilled(JSON) Then
        Return;
    EndIf;
    
    LineSeparator = Symbols.VK + Symbols.PS;
    
    TextRecord.WriteString("--" + boundary + LineSeparator);
    TextRecord.WriteString("Content-Type: application/json; charset=UTF-8");
    TextRecord.WriteString(LineSeparator);
    TextRecord.WriteString(LineSeparator);
    TextRecord.WriteString(JSON);
    TextRecord.WriteString(LineSeparator);
    TextRecord.WriteString(LineSeparator);

EndProcedure

Procedure AddContentLength(Request)
    
    RequestBody = Request.GetBodyAsBinaryData();
    
    If ValueIsFilled(RequestBody) Then
        
        Size = RequestBody.Size();
        Request.Headers.Insert("Content-Length", NumberToString(Size));
        
    EndIf;

EndProcedure

Procedure RemoveEmptyKeyValues(Val Collection, OutputCollection)
    
    For Each CollectionItem In Collection Do
        
        If Not CollectionItem.Value = Undefined And Not CollectionItem.Value = NULL Then
            OutputCollection.Insert(CollectionItem.Key, CollectionItem.Value);
        EndIf;
        
    EndDo;
    
EndProcedure

Procedure RemoveEmptyArrayElements(Val Collection, OutputCollection)
    
    For Each CollectionItem In Collection Do
        
        If Not CollectionItem = Undefined And Not CollectionItem = NULL Then
            OutputCollection.Add(CollectionItem);
        EndIf;
        
    EndDo;
    
EndProcedure

#Region GZip

// Description withтруtoтур withм. зdеwithь https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT
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
        Return ReadGZip(Response.GetBodyAsBinaryData());
    Except
        Return Response;
    EndTry;

EndFunction

Function ReadGZip(CompressedData) Export

    GZipPrefixSize = 10;
    GZipPostfixSize = 8;
    
    SizeDD = ZipSizeDD();
    SizeCDH = ZipSizeCDH();
    SizeESD = ZipSizeEOCD();
    SizeLFH = ZipSizeLFH();

    ReadingData = New ReadingData(CompressedData);
    ReadingData.Skip(GZipPrefixSize);
    CompressedDataSize = ReadingData.SourceStream().Size() - GZipPrefixSize - GZipPostfixSize;

    ZipStream = New MemoryStream(SizeLFH 
       + CompressedDataSize 
       + SizeDD 
       + SizeCDH 
       + SizeESD);
       
    DataRecording = New DataRecording(ZipStream);
    DataRecording.WriteBinaryDataBuffer(ZipLFH());
    ReadingData.CopyTo(DataRecording, CompressedDataSize);

    DataRecording.Close();
    DataRecording = New DataRecording(ZipStream);

    CRC32 = ReadingData.ReadInt32();
    UncompressedDataSize = ReadingData.ReadInt32();
    ReadingData.Close();

    DataRecording.WriteBinaryDataBuffer(ZipDD(CRC32, CompressedDataSize, UncompressedDataSize));
    DataRecording.WriteBinaryDataBuffer(ZipCDH(CRC32, CompressedDataSize, UncompressedDataSize));
    DataRecording.WriteBinaryDataBuffer(ZipEOCD(CompressedDataSize));
    DataRecording.Close();

    Return ReadZip(ZipStream);

EndFunction

Function ReadZip(CompressedData, ErrorText = Undefined)

    Directory = GetTempFileName();
    ReadingZip = New ReadingZipFile(CompressedData);
    FileName = ReadingZip.Elements[0].Name;
    Try
        ReadingZip.Extract(ReadingZip.Elements[0], Directory, ZIPFilePathRecoveryMode.DoNotRestore);
    Except
        // Ignore archive integrity check, just read the result
        ErrorText = DetailedErrorRepresentation(ErrorInformation());
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
    Buffer.Write(30, GetBinaryDataBufferFromString("data", "ascii", False));

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
    Buffer.Write(46, GetBinaryDataBufferFromString("data", "ascii", False));

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
