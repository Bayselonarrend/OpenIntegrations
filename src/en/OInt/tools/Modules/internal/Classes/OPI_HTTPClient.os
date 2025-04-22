// OneScript: ./OInt/tools/Modules/internal/Classes/OPI_HTTPClient.os

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type

// #If Not Client Then

#Region Variables

// Processor

Var Initialized;

Var Error Export;
Var Log;

// Request

Var Request;
Var Connection;
Var Settings;

Var RequestURL;
Var RequestServer;
Var RequestPort;
Var RequestAdress;
Var RequestAdressFull;
Var RequestSection;
Var RequestProtected;
Var RequestDomain;

Var RequestMethod;
Var RequestURLParams;
Var RequestBody;
Var RequestHeaders;
Var RequestUser;
Var RequestPassword;
Var RequestTimeout;
Var RequestProxy;
Var RequestOutputFile;
Var RequestBodyFile;
Var RequestBodyStream;
Var RequestDataWriter;
Var RequestDataType;
Var RequestTypeSetManualy;
Var BodyTemporaryFile;

// AWS

Var AWS4Using;
Var AWS4Data;

// Response

Var Response;
Var ResponseStatusCode;
Var ResponseBody;
Var ResponseHeaders;

// Multipart

Var Multipart;
Var Boundary;
Var LineSeparator;

#EndRegion

#Region Public

#Region Initialization

// Initialize !NOCLI
// Initializes a new empty request
//
// Note
// The function must be called first when creating a new processor object
//
// Parameters:
// URL - String - URL address for request
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function Initialize(Val URL = "") Export

    Initialized = True;
    Error       = False;
    Log         = New Array;

    RequestURLParams = New Array;
    RequestBody      = Undefined;
    RequestHeaders   = New Map;
    RequestTimeout   = 3600;

    RequestTypeSetManualy = False;

    BodyTemporaryFile = False;
    AWS4Using         = False;

    ResponseStatusCode = 0;
    ResponseBody       = Undefined;
    ResponseHeaders    = New Map;

    Multipart = False;

    SetDefaultSettings();
    SetURL(URL);

    Return ЭтотОбъект;

EndFunction

// Set URL !NOCLI
// Sets the new request URL
//
// Parameters:
// URL - String - Request URL - url
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetURL(Val URL) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

            If ValueIsFilled(URL) Then

                OPI_TypeConversion.GetLine(URL);
                OPI_Tools.RestoreEscapeSequences(URL);

                If GetSetting("URLencoding") Then
                    URL = EncodeString(URL, StringEncodingMethod.URLInURLEncoding);
                EndIf;

                RequestURL = URL;

                AddLog("SetURL: Splitting a request into component parts");

            Else

                AddLog("SetURL: URL is empty - skip");

            EndIf;

            Return SplitURL();

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set URL params !NOCLI
// Sets a collection of URL parameters
//
// Parameters:
// Value - Arbitrary - Structure or map of URL parameters - params
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetURLParams(Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;
        If Not ValueIsFilled(Value) Then Value = New Structure; EndIf;

        ErrorText        = "SetURLParams: The passed parameters are not a key/value collection";
        OPI_TypeConversion.GetKeyValueCollection(Value, ErrorText);
        RequestURLParams = Value;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set response file
// Sets the file path to save the query result
//
// Parameters:
// Value - String - File path - filepath
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetResponseFile(Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;
        If Not ValueIsFilled(Value) Then
            RequestOutputFile = Undefined;
            Return ЭтотОбъект;
        EndIf;

        OPI_TypeConversion.GetLine(Value);
        RequestOutputFile = Value;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set data type
// Sets the Content-Type of the request
//
// Note
// If the data type is not set manually, it will be matched during the process of setting the request body
//
// Parameters:
// Value - String - ContentType header value - type
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetDataType(Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        AddLog("SetDataType: Setting the value");
        OPI_TypeConversion.GetLine(Value);

        RequestDataType       = Value;
        RequestTypeSetManualy = True;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Get log !NOCLI
// Gets the execution log
//
// Parameters:
// AsString - Boolean - Return the log as a string - string
//
// Returns:
// String, Array - Execution log
Function GetLog(Val AsString = False) Export

    OPI_TypeConversion.GetBoolean(AsString);

    If Not ValueIsFilled(Log) Then
        Return ?(AsString, ""           , New Array);
    Else
        Return ?(AsString, StrConcat(Log, Chars.LF), Log);
    EndIf;

EndFunction

#EndRegion

#Region BodySet

// Set binary body !NOCLI
// Sets the request body from binary data, file or string (with conversion to binary data)
//
// Parameters:
// Data - String, BinaryData - File, string, or request body data - data
// SetIfEmpty - Boolean - Sets the body even when empty data is passed - empty
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetBinaryBody(Val Data, Val SetIfEmpty = False) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        CancelMultipartBody();

        If Not RequestTypeSetManualy Then
            RequestDataType = "application/octet-stream";
        EndIf;

        OPI_TypeConversion.GetBinaryData(Data, True, False);
        OPI_TypeConversion.GetBoolean(SetIfEmpty);

        Data         = ?(Data = Undefined, ПолучитьДвоичныеДанныеИзСтроки(""), Data);
        IsData = Data.Size() > 0;

        If IsData Or SetIfEmpty Then

            If Not IsData Then
                Data = ПолучитьДвоичныеДанныеИзСтроки("");
            EndIf;

            AddLog("SetBinaryBody: Beginning of body setting");
            SetBodyFromBinary(Data);
            AddLog(StrTemplate("SetBinaryBody: Body set, size %1", RequestBody.Size()));

        Else
            AddLog("SetBinaryBody: Passed an empty body, skip");
        EndIf;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set string body !NOCLI
// Sets the request body from a string in the specified encoding
//
// Parameters:
// Data - String - Request body data - data
// Encoding - String - String encoding - enc
// WriteBOM - Boolean - True > BOM will be added - bom
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetStringBody(Val Data, Val Encoding = "UTF-8", Val WriteBOM = False) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        CancelMultipartBody();

        If Not ValueIsFilled(Data) Then
            AddLog("SetStringBody: No data, skip");
            Return ЭтотОбъект;
        EndIf;

        If Not RequestTypeSetManualy Then
          RequestDataType = "text/plain; charset=utf-8";
        EndIf;

        AddLog("SetStringBody: Beginning of body setting");
        SetBodyFromString(Data, Encoding, WriteBOM);
        AddLog(StrTemplate("SetStringBody: Body set, size %1", RequestBody.Size()));

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set JSON body !NOCLI
// Sets the body in JSON format from a suitable collection or string
//
// Parameters:
// Data - Arbitrary - String or collection to convert to JSON - data
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetJsonBody(Val Data) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        CancelMultipartBody();

        If Not ValueIsFilled(Data) Then
            AddLog("SetJsonBody: No data, skip");
            Return ЭтотОбъект;
        EndIf;

        If Not RequestTypeSetManualy Then
          RequestDataType = "application/json; charset=utf-8";
        EndIf;

        AddLog("SetJsonBody: Beginning of body setting");

        OPI_TypeConversion.GetCollection(Data);
        SetBodyFromString(Data);

        AddLog(StrTemplate("SetJsonBody: Body set, size %1", RequestBody.Size()));

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set Form body !NOCLI
// Sets the body to x-www-form-urlencoded from a collection of field values
//
// Parameters:
// Data - Arbitrary - KeyValue collection with form parameters - data
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - Set Form body
Function SetFormBody(Val Data) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        CancelMultipartBody();

        If Not ValueIsFilled(Data) Then
            AddLog("SetFormBody: No data, skip");
            Return ЭтотОбъект;
        EndIf;

        If Not RequestTypeSetManualy Then
          RequestDataType = "application/x-www-form-urlencoded; charset=utf-8";
        EndIf;

        AddLog("SetFormBody: Beginning of body setting");

        OPI_TypeConversion.GetCollection(Data);

        If TypeOf(Data) = Type("Array") Then

            Data = Data[0];
            OPI_TypeConversion.GetLine(Data);

        Else

            Data = RequestParametersToString(Data);

        EndIf;

        SetBodyFromString(Data);

        AddLog(StrTemplate("SetFormBody: Body set, size %1", RequestBody.Size()));

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Start Multipart body !NOCLI
// Initializes writing data to the body in multipart format
//
// Note
// The `AddMultipartFormDataFile` and `AddMultipartFormDataField` methods are used for further body formation
//
// Parameters:
// UseFile - Boolean - True > use a temporary file, False > form a body in memory - file
// View - String - Multipart data type: form data, related - type
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function StartMultipartBody(UseFile = True, Val View = "form-data") Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        OPI_TypeConversion.GetBoolean(UseFile);
        OPI_TypeConversion.GetLine(View);

        Multipart     = True;
        Boundary      = StrReplace(String(New UUID), "-", "");
        LineSeparator = Chars.CR + Chars.LF;
        RequestDataType = StrTemplate("multipart/%1; boundary=%2", View, Boundary);

        If UseFile Then

            AddLog("StartMultipartBody: Creating a temporary file");

            RequestBodyFile   = GetTempFileName();
            BodyTemporaryFile = True;
            RequestDataWriter = New DataWriter(RequestBodyFile
                , TextEncoding.UTF8
                , ByteOrder.LittleEndian
                , ""
                , False
                , ""
                , False);

        Else

            AddLog("StartMultipartBody: Creating a stream in memory");

            RequestBodyStream = New MemoryStream();

            RequestDataWriter = New DataWriter(RequestBodyStream
                , TextEncoding.UTF8
                , ByteOrder.LittleEndian
                , ""
                , ""
                , False);


        EndIf;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Add Multipart file !NOCLI
// Adds a file block to the multipart/form-data body
//
// Note
// The Multipart record must first be initialized using the `StartMultipartBody` function
//
// Parameters:
// FieldName - String - Form field name - field
// FileName - String - File name with extension - filename
// Data - BinaryData, String - File data to be written - data
// DataType - String - MIME type of data - mime
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddMultipartFormDataFile(Val FieldName, Val FileName, Val Data, Val DataType = "") Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;
        If Not Multipart Then Return Error("AddMultipartFormDataFile: Multipart record not initialized") EndIf;

        OPI_TypeConversion.GetBinaryData(Data);

        AddLog("AddMultipartFormDataFile: Writing the block header");

        Header = StrTemplate("Content-Disposition: form-data; name=""%1""; filename=""%2""", FieldName, FileName);

        RequestDataWriter.WriteLine("--" + Boundary + LineSeparator);
        RequestDataWriter.WriteLine(Header);
        RequestDataWriter.WriteLine(LineSeparator);

        If ValueIsFilled(DataType) Then
            RequestDataWriter.WriteLine("Content-Type: " + DataType);
        EndIf;

        RequestDataWriter.WriteLine(LineSeparator);
        RequestDataWriter.WriteLine(LineSeparator);

        AddLog("AddMultipartFormDataFile: Data writing");

        WriteBinaryData(RequestDataWriter, Data);

        RequestDataWriter.WriteLine(LineSeparator);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Add Multipart field !NOCLI
// Adds a form field to the multipart/form-data body
//
// Note
// The Multipart record must first be initialized using the `StartMultipartBody` function
//
// Parameters:
// FieldName - String - Form field name - field
// Value - Arbitrary - Field value - data
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddMultipartFormDataField(Val FieldName, Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;
        If Not Multipart Then Return Error("AddMultipartFormDataField: Multipart record not initialized") EndIf;

        ValeType = TypeOf(Value);

        AddLog("AddMultipartFormDataField: Writing the block header");

        Header = StrTemplate("Content-Disposition: form-data; name=""%1""", FieldName);

        RequestDataWriter.WriteLine("--" + boundary + LineSeparator);
        RequestDataWriter.WriteLine(Header);
        RequestDataWriter.WriteLine(LineSeparator);
        RequestDataWriter.WriteLine(LineSeparator);

        AddLog("AddMultipartFormDataField: Data writing");

        If ValeType = Type("Boolean") Then

            Value = ?(Value, "true", "false");
            RequestDataWriter.WriteLine(Value);

        ElsIf ValeType = Type("BinaryData") Then

            WriteBinaryData(RequestDataWriter, Value);

        Else

            OPI_TypeConversion.GetLine(Value);
            RequestDataWriter.WriteLine(Value);

        EndIf;

        RequestDataWriter.WriteLine(LineSeparator);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Add data as Related
// Adds data to the multipart/related body
//
// Note
// The Multipart record must first be initialized using the `StartMultipartBody` function
//
// Parameters:
// Data - Arbitrary - Data to be written - data
// DataType - String - MIME type of data - mime
// ContentID - String - Content ID, if required - cid
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddDataAsRelated(Val Data, Val DataType, Val ContentID = "") Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;
        If Not Multipart Then Return Error("AddFileAsRelated: Multipart record not initialized") EndIf;

        OPI_TypeConversion.GetLine(DataType);
        OPI_TypeConversion.GetLine(ContentID);
        OPI_TypeConversion.GetBinaryData(Data, True, False);

        AddLog("AddFileAsRelated: Writing the block header");
        RequestDataWriter.WriteLine("--" + Boundary + LineSeparator);
        RequestDataWriter.WriteLine("Content-Type: " + DataType);

        If ValueIsFilled(ContentID) Then
            RequestDataWriter.WriteLine("Content-ID: " + ContentID);
        EndIf;

        RequestDataWriter.WriteLine(LineSeparator);
        RequestDataWriter.WriteLine(LineSeparator);

        AddLog("AddFileAsRelated: Data writing");
        WriteBinaryData(RequestDataWriter, Data);
        RequestDataWriter.WriteLine(LineSeparator);
        RequestDataWriter.WriteLine(LineSeparator);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

#EndRegion

#Region HeadersSetting

// Set headers !NOCLI
// Sets a collection of query headers
//
// Note
// `FullReplace` also clears headers previously set by other methods (e.g., authorization headers)
//
// Parameters:
// Value - Arbitrary - Structure or map of request headers - headers
// FullReplace - Boolean - Clears all existing headers before setting up - replace
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetHeaders(Val Value, Val FullReplace = False) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;
        If Not ValueIsFilled(Value) Then Value = New Map EndIf;

        ErrorText = "SetURLParams: The passed parameters are not a key/value collection";
        OPI_TypeConversion.GetKeyValueCollection(Value, ErrorText);
        OPI_TypeConversion.GetBoolean(FullReplace);

        If FullReplace Then
            RequestHeaders = Value;
        Else
            For Each Title In Value Do
                RequestHeaders.Insert(Title.Key, Title.Value);
            EndDo;
        EndIf;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

#EndRegion

#Region Authorization

// Add Basic authorization !NOCLI
// Adds standard authorization by username and password
//
// Parameters:
// User - String - Users name - user
// Password - String - Password - pwd
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddBasicAuthorization(Val User, Val Password) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        OPI_TypeConversion.GetLine(User);
        OPI_TypeConversion.GetLine(Password);

        RequestUser     = User;
        RequestPassword = Password;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Add AWS4 authorization !NOCLI
// Adds data for AWS4 authorization
//
// Parameters:
// AccessKey - String - Access key for authorization - access
// SecretKey - String - Secret key for authorization - secret
// Region - String - Service region - region
// Service - String - Type of service, if different from s3 - service
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddAWS4Authorization(Val AccessKey, Val SecretKey, Val Region, Val Service = "s3") Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        String_   = "String";
        AWS4Using = True;

        AWS4Data = New Structure;
        OPI_Tools.AddField("AccessKey", AccessKey, String_, AWS4Data);
        OPI_Tools.AddField("SecretKey", SecretKey, String_, AWS4Data);
        OPI_Tools.AddField("Region"   , Region   , String_, AWS4Data);
        OPI_Tools.AddField("Service"  , Service  , String_, AWS4Data);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

#EndRegion

#Region RequestProcessing

// Process request !NOCLI
// Creates a request based on the entered data with or without execution
//
// Note
// `ExecuteRequest=False` can be used to get ready^^
// HTTPConnection and HTTPConnection objects without executing them. See `ReturnRequest` and `ReturnConnection`.
//
// Parameters:
// Method - String - Request HTTP method - method
// Start - Boolean - Executes the request immediately after it is generated - run
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function ProcessRequest(Val Method, Val Start = True) Export

    Try

        OPI_TypeConversion.GetLine(Method);
        OPI_TypeConversion.GetBoolean(Start);
        RequestMethod = Method;

        If StopExecution() Then Return ЭтотОбъект EndIf;

        AddLog("ProcessRequest: Forming a request");
        If FormRequest().Error Then Return ЭтотОбъект EndIf;

        AddLog("ProcessRequest: Setting the request body");
        If SetRequestBody().Error Then Return ЭтотОбъект EndIf;

        CompleteHeaders();

        If Start Then
            AddLog("ProcessRequest: Execution");
            ExecuteMethod();
        EndIf;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Execute request !NOCLI
// Executes the request if it has been generated or set previously
//
// Parameters:
// Method - String - Request HTTP method - method
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function ExecuteRequest(Val Method) Export

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

        OPI_TypeConversion.GetLine(Method);
        RequestMethod = Method;

        AddLog("ExecuteRequest: Execution");

        Return ExecuteMethod();

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Return request !NOCLI
// Returns the object of the current HTTP request
//
// Parameters:
// Forced - Boolean - False > The processor object will be returned instead of the request if there were errors in it - force
//
// Returns:
// DataProcessorObject.OPI_HTTPClient, HTTPRequest, Undefined - The request or the same processing object
Function ReturnRequest(Forced = False) Export

    OPI_TypeConversion.GetBoolean(Forced);

    If StopExecution() And Not Forced Then Return ЭтотОбъект EndIf;

    Return Request;

EndFunction

// Return connection !NOCLI
// Returns the object of the current HTTP connection
//
// Parameters:
// Forced - Boolean - False > The processor object will be returned instead of the connection if there were errors in it - force
//
// Returns:
// DataProcessorObject.OPI_HTTPClient, HTTPConnection, Undefined - Connection or the same processor object
Function ReturnConnection(Forced = False) Export

    OPI_TypeConversion.GetBoolean(Forced);

    If StopExecution() And Not Forced Then Return ЭтотОбъект EndIf;

    Return Connection;

EndFunction

#EndRegion

#Region ResponseReceiving

// Return response !NOCLI
// Returns the object of the current HTTP response
//
// Parameters:
// Forced - Boolean - False > The processor object will be returned instead of the response if there were errors in it - force
// ExceptionOnError - Boolean - Causes an exception with a log if there were errors during processing - ex
//
// Returns:
// DataProcessorObject.OPI_HTTPClient, HTTPResponse, Undefined - The response or the same processing object
Function ReturnResponse(Val Forced = False, Val ExceptionOnError = False) Export

    OPI_TypeConversion.GetBoolean(Forced);

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект EndIf;

    Return Response;

EndFunction

// Return response as JSON object !NOCLI
// Returns the response body as a collection from JSON
//
// Parameters:
// ToMap - Boolean - Use map instead of structure - map
// ExceptionOnError - Boolean - Causes an exception with a log if there were errors during processing - ex
//
// Returns:
// Arbitrary - The response or the same processing object
Function ReturnResponseAsJSONObject(Val ToMap = True, Val ExceptionOnError = False) Export

    If StopExecution(ExceptionOnError) Then Return ЭтотОбъект EndIf;

    Try

        OPI_TypeConversion.GetBoolean(ToMap);

        JSONStream = Response.GetBodyAsStream();

        Try

            If JSONStream.Size() > 0 Then
                JSON = OPI_Tools.JsonToStructure(JSONStream, ToMap);
            Else
                JSON = New Map;
            EndIf;

        Except

            JSONStream.Goto(0, PositionInStream.Start);

            DataReader = New DataReader(JSONStream);
            JSON       = DataReader.Read().GetBinaryData();

        EndTry;

        Return JSON;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Return response as binary data
// Returns the response body as binary data
//
// Parameters:
// Forced - Boolean - False > The processor object will be returned instead of the response if there were errors in it - force
// ExceptionOnError - Boolean - Causes an exception with a log if there were errors during processing - ex
//
// Returns:
// Arbitrary - The response or the same processing object
Function ReturnResponseAsBinaryData(Val Forced = False, Val ExceptionOnError = False) Export

    OPI_TypeConversion.GetBoolean(Forced);

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект EndIf;

    BodyAsString = GetResponseBodyAsBinaryData();

    Return BodyAsString;

EndFunction

// Return response as string !NOCLI
// Returns the body of the response as a string
//
// Parameters:
// Forced - Boolean - False > The processor object will be returned instead of the response if there were errors in it - force
// ExceptionOnError - Boolean - Causes an exception with a log if there were errors during processing - ex
//
// Returns:
// Arbitrary - The response or the same processing object
Function ReturnResponseAsString(Val Forced = False, Val ExceptionOnError = False) Export

    OPI_TypeConversion.GetBoolean(Forced);

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект EndIf;

    BodyAsString = ПолучитьСтрокуИзДвоичныхДанных(GetResponseBodyAsBinaryData());

    Return BodyAsString;

EndFunction

// Return response filename !NOCLI
// Returns the path to the response body file
//
// Parameters:
// Forced - Boolean - False > The processor object will be returned instead of the response if there were errors in it - force
// ExceptionOnError - Boolean - Causes an exception with a log if there were errors during processing - ex
//
// Returns:
// Arbitrary - The response or the same processing object
Function ReturnResponseFilename(Val Forced = False, Val ExceptionOnError = False) Export

    OPI_TypeConversion.GetBoolean(Forced);

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект EndIf;

    BodyFileName = Response.GetBodyFileName();

    Return BodyFileName;

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region HTTP

Function ConvertParameterToString(Val Value)

    EncodeURL = GetSetting("URLencoding");

    If TypeOf(Value) = Type("Array") Then

        For N        = 0 To Value.UBound() Do
            Value[N] = ConvertParameterToString(Value[N]);
        EndDo;

        Value = StrConcat(Value, ",");

        If EncodeURL Then
            Value = EncodeString(Value, StringEncodingMethod.URLInURLEncoding);
        EndIf;

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

        OPI_TypeConversion.GetLine(Value);

        If EncodeURL Then
            Value = EncodeString(Value, StringEncodingMethod.URLencoding);
        EndIf;

    EndIf;

    Return Value;

EndFunction

Function SetBodyFromBinary(Val Value)

    OPI_TypeConversion.GetBinaryData(Value, True, False);
    RequestBody = Value;

    Return ЭтотОбъект;

EndFunction

Function SetBodyFromString(Val Value, Val Encoding = "UTF-8", Val WriteBOM = False)

    OPI_TypeConversion.GetLine(Encoding);
    OPI_TypeConversion.GetLine(Value);
    OPI_TypeConversion.GetBoolean(WriteBOM);

    RequestBody = ПолучитьДвоичныеДанныеИзСтроки(Value, Encoding, WriteBOM);

    Return ЭтотОбъект;

EndFunction

Function SplitURL()

    URL = RequestURL;

    RequestProtected = Not StrStartsWith(RequestURL, "http://");

    URL = StrReplace(URL, "https://", "");
    URL = StrReplace(URL, "http://" , "");

    Section = StrFind(URL, "#");

    If Section > 0 Then
        RequestSection = Right(URL, StrLen(URL) - Section + 1);
        URL            = Left(URL, Section - 1);
    EndIf;

    If StrFind(URL, "/") = 0 Then
        RequestAdress    = "";
        RequestDomain    = URL;
    Else
        RequestAdress    = Right(URL, StrLen(URL) - StrFind(URL, "/", SearchDirection.FromBegin) + 1);
        RequestDomain    = Left(URL, StrFind(URL, "/", SearchDirection.FromBegin) - 1);
    EndIf;

    If StrFind(RequestDomain, ":") <> 0 Then

        HostPort      = StrSplit(RequestDomain, ":");
        RequestDomain = HostPort[0];
        RequestPort   = HostPort[1];

        OPI_TypeConversion.GetNumber(RequestPort);

    Else

        RequestPort = ?(RequestProtected, 443, 80);

    EndIf;

    If OPI_Tools.IsOneScript() And RequestProtected Then
        RequestServer = "https://" + RequestDomain;
    Else
        RequestServer = RequestDomain;
    EndIf;

    Return ЭтотОбъект;

EndFunction

Function FormRequest()

    If Not ValueIsFilled(RequestURL) Then
        Return Error("URL is not set");
    EndIf;

    AddLog("FormRequest: Adding parameters");
    CompleteURLWithParameters();

    AddLog("FormRequest: Creating a request object");
    CreateRequest();

    AddLog("FormRequest: Creating a connection object");
    CreateConnection();

    Return ЭтотОбъект;

EndFunction

Function CreateRequest()

    Headers = GetDefaultHeaders();
    Request = New HTTPRequest(RequestAdressFull, Headers);

    Return ЭтотОбъект;

EndFunction

Function CreateConnection()

    If Not ValueIsFilled(RequestPort) Then
        RequestPort = ?(RequestProtected, 443, 80);
    EndIf;

    If RequestProtected Then

        If OPI_Tools.IsOneScript() Then

            Connection = New HTTPConnection(RequestServer
                , RequestPort
                , RequestUser
                , RequestPassword
                , RequestProxy
                , RequestTimeout);

        Else

            SSL        = New OpenSSLSecureConnection;
            Connection = New HTTPConnection(RequestServer
            , RequestPort
            , RequestUser
            , RequestPassword
            , RequestProxy
            , RequestTimeout
            , SSL);

        EndIf;

    Else

        Connection = New HTTPConnection(RequestServer
            , RequestPort
            , RequestUser
            , RequestPassword
            , RequestProxy
            , RequestTimeout);

    EndIf;

    Return ЭтотОбъект;

EndFunction

Function CompleteURLWithParameters()

    If StrEndsWith(RequestAdress, "?") Or Not ValueIsFilled(RequestURLParams) Then
        FirstSymbol = "";
    ElsIf StrFind(RequestAdress, "?") <> 0 Then
        FirstSymbol = "&";
    Else
        FirstSymbol = "?";
    EndIf;

    RequestAdressFull = RequestAdress + FirstSymbol + RequestParametersToString(RequestURLParams) + RequestSection;

    Return ЭтотОбъект;

EndFunction

Function RequestParametersToString(Val Parameters)

    If Not ValueIsFilled(Parameters) Then
        Return "";
    EndIf;

    AddLog("RequestParametersToString: Retrieve collection KeyValue");
    OPI_TypeConversion.GetKeyValueCollection(Parameters);

    ParameterString = "";

    AddLog("RequestParametersToString: Adding parameters");
    For Each Parameter In Parameters Do

        CurrentValue = Parameter.Value;
        CurrentKey   = Parameter.Key;

        If Not TypeOf(CurrentValue) = Type("Array") Or Not GetSetting("SplitArrayParams") Then

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

Function SplitArrayAsURLParameters(Val Key, Val Value)

    KeyArray = Key + "=";

    For N = 0 To Value.UBound() Do

        CurrentValue = Value[N];

        OPI_TypeConversion.GetLine(CurrentValue);

        If GetSetting("URLencoding") Then
            CurrentValue = EncodeString(CurrentValue, StringEncodingMethod.URLencoding);
        EndIf;

        Value.Set(N, KeyArray + CurrentValue);

    EndDo;

    ParameterString = StrConcat(Value, "&");

    Return ParameterString;

EndFunction

Function GetDefaultHeaders()

    Headers = New Map;

    Headers.Insert("Accept"         , "*/*");
    Headers.Insert("Connection"     , "keep-alive");
    Headers.Insert("Accept-Charset" , "utf-8");

    If GetSetting("gzip") Then
        Headers.Insert("Accept-Encoding", "gzip");
    EndIf;

    If ValueIsFilled(RequestDataType) Then
        Headers.Insert("Content-Type", RequestDataType);
    EndIf;

    Return Headers;

EndFunction

Function CompleteHeaders()

    If Request.Headers.Get("Content-Length") = Undefined Then

        AddLog("CompleteHeaders: Content-Length setting");

        If RequestBodyFile = Undefined Then

            If RequestBody = Undefined Then
                BodySize   = 0;
            Else
                BodySize   = RequestBody.Size();
            EndIf;

        Else

            BodyFile = New File(RequestBodyFile);
            BodySize = BodyFile.Size();

        EndIf;

        OPI_TypeConversion.GetLine(BodySize);
        Request.Headers.Insert("Content-Length" , BodySize);

    EndIf;

    If AWS4Using Then
        AddLog("CompleteHeaders: Generating AWS4 Authorization Header");
        AddAWS4();
    EndIf;

    If TypeOf(RequestHeaders) = Type("Map") Then

        For Each Title In RequestHeaders Do
            Request.Headers.Insert(Title.Key, Title.Value);
        EndDo;

    EndIf;


EndFunction

Function SetRequestBody()

    If Multipart Then
        EndMultipartBody();
    EndIf;

    If ValueIsFilled(RequestBodyFile) Then
        Request.SetBodyFileName(RequestBodyFile);
    Else

        If TypeOf(RequestBody) = Type("BinaryData") Then
            Request.SetBodyFromBinary(RequestBody);
        EndIf;

    EndIf;

    Return ЭтотОбъект;

EndFunction

Function ExecuteMethod()

    If ValueIsFilled(RequestOutputFile) Then
        Response = Connection.CallHTTPMethod(RequestMethod, Request, RequestOutputFile);
    Else
        Response = Connection.CallHTTPMethod(RequestMethod, Request);
    EndIf;

    If ThisIsRedirection(Response) Then

        URL = Response.Headers["Location"];
        SetURL(URL);

        ProcessRequest(RequestMethod);

    EndIf;

    Return ЭтотОбъект;

EndFunction

Function GetResponseBody()

    GZip = "gzip";

    Header1 = Response.Headers.Get("Content-Encoding");
    Header2 = Response.Headers.Get("content-encoding");

    NeedsUnpacking = Header1 = GZip Or Header2 = GZip;

    If NeedsUnpacking Then
        Data = UnpackResponse(Response);
    Else
        Data = GetResponseBodyAsBinaryData();
    EndIf;

    Data = ?(TypeOf(Data) = Type("HTTPResponse"), GetResponseBodyAsBinaryData(), Data);

    If TypeOf(Data) = Type("BinaryData") Then

        If Data.Size() = 0 Then
            Data       = ПолучитьДвоичныеДанныеИзСтроки("");
        EndIf;

    Else
        OPI_TypeConversion.GetBinaryData(Data);
    EndIf;

    Return Data;

EndFunction

Function ThisIsRedirection(Val Response)

    Redirection  = 300;
    RequestError = 400;

    ThisIsRedirection = Response.StatusCode >= Redirection And Response.StatusCode < RequestError And ValueIsFilled(
        Response.Headers["Location"]);

    Return ThisIsRedirection;

EndFunction

Function GetResponseBodyAsBinaryData()

    BodyStream    = Response.GetBodyAsStream();
    DataReader    = New DataReader(BodyStream);
    ReadingResult = DataReader.Read();
    Data          = ReadingResult.GetBinaryData();

    DataReader.Close();
    BodyStream.Close();

    Return Data;

EndFunction

Function GetRequestBodyAsBinaryData()

    If ValueIsFilled(RequestBodyFile) Then
        Data = New BinaryData(RequestBodyFile);
    Else
        Data = RequestBody;
    EndIf;

    If Data = Undefined Then
        Data   = ПолучитьДвоичныеДанныеИзСтроки("");
    EndIf;

    Return Data;

EndFunction

Procedure CancelMultipartBody()

    If Multipart Then

        AddLog("CancelMultipartBody: Deleting recorded data");
        Multipart = False;

       Try
            RequestDataWriter.Close();
        Except
            AddLog("CancelMultipartBody: Could not close the writer. It may have already been closed");
        EndTry;

        If ValueIsFilled(RequestBodyFile) Then

            Try

                DeleteFiles(RequestBodyFile);
                AddLog("CancelMultipartBody: The body file has been deleted");

            Except
                AddLog("CancelMultipartBody: Failed to delete the body file. It may have already been deleted");
            EndTry;

        Else

            If TypeOf(RequestBodyStream) = Type("MemoryStream") Then

                Try
                    RequestBodyStream.Close();
                Except
                    AddLog("CancelMultipartBody: Failed to close the stream. It may have already been closed");
                EndTry;

            EndIf;

        EndIf;

        RequestDataWriter = Undefined;
        RequestBodyFile   = Undefined;

    EndIf;

EndProcedure

Procedure WriteBinaryData(DataWriter, Val BinaryData)

    ChunkSize       = 268435456;
    BytesRead       = 0;
    CurrentPosition = 0;
    TotalSize       = BinaryData.Size();

    While BytesRead < TotalSize Do

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

Procedure EndMultipartBody()

    Try
        RequestDataWriter.WriteLine("--" + Boundary + "--" + LineSeparator);
        RequestDataWriter.Close();
    Except
        AddLog("EndMultipartBody: Could not close the writer. It may have already been closed");
    EndTry;

    If TypeOf(RequestBodyStream) = Type("MemoryStream") Then
        RequestBody              = RequestBodyStream.CloseAndGetBinaryData();
    EndIf;

EndProcedure

#EndRegion

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
        Return ReadGZip(GetResponseBodyAsBinaryData());
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

    CRC32                = DataReader.ReadInt32();
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

#Region AWS4

Function AddAWS4()

    AuthorizationHeader = CreateAuthorizationHeader();

    Request.Headers.Insert("Authorization", AuthorizationHeader);

    Return ЭтотОбъект;

EndFunction

Function CreateAuthorizationHeader()

    AccessKey   = AWS4Data["AccessKey"];
    CurrentDate = CurrentUniversalDate();

    Request.Headers.Insert("x-amz-date", OPI_Tools.ISOTimestamp(CurrentDate));
    Request.Headers.Insert("Host"      , Connection.Host);

    MainParts = GetMainSignatureParts(CurrentDate);

    Scope       = MainParts["Scope"];
    Signature   = MainParts["Signature"];
    HeadersKeys = MainParts["HeadersKeys"];

    AuthorizationHeader = FormAuthorizationHeader(AccessKey, Scope, Signature, HeadersKeys);

    Return AuthorizationHeader;

EndFunction

Function GetMainSignatureParts(Val CurrentDate)

    SecretKey = AWS4Data["SecretKey"];
    Region    = AWS4Data["Region"];
    Service   = AWS4Data["Service"];

    SignKey          = GetSignatureKey(SecretKey, Region, Service, CurrentDate);
    CanonicalRequest = CreateCanonicalRequest();
    Scope            = CreateScope(Region, Service, CurrentDate);
    StringToSign     = CreateSignatureString(CanonicalRequest, Scope, CurrentDate);

    Signature = OPI_Cryptography.HMACSHA256(SignKey, StringToSign);
    Signature = Lower(ПолучитьHexСтрокуИзДвоичныхДанных(Signature));

    HeadersKeys = GetHeadersKeysString();

    PartsStructure = New Structure;

    PartsStructure.Insert("Scope"      , Scope);
    PartsStructure.Insert("Signature"  , Signature);
    PartsStructure.Insert("HeadersKeys", HeadersKeys);

    Return PartsStructure;

EndFunction

Function FormAuthorizationHeader(Val AccessKey, Val Scope, Val Signature, Val HeadersKeys)

    HeaderTemplate = "AWS4-HMAC-SHA256 "
        + "Credential=%1/%2, "
        + "SignedHeaders=%3, "
        + "Signature=%4";

    AuthorizationHeader = StrTemplate(HeaderTemplate, AccessKey, Scope, HeadersKeys, Signature);

    Return AuthorizationHeader;

EndFunction

Function GetSignatureKey(Val SecretKey, Val Region, Val Service, Val CurrentDate)

    SecretKey  = ПолучитьДвоичныеДанныеИзСтроки("AWS4" + SecretKey);
    DateData = ПолучитьДвоичныеДанныеИзСтроки(Format(CurrentDate, "DF=yyyyMMdd;"));
    Region     = ПолучитьДвоичныеДанныеИзСтроки(Region);
    Service    = ПолучитьДвоичныеДанныеИзСтроки(Service);
    AWSRequest = ПолучитьДвоичныеДанныеИзСтроки("aws4_request");

    DataKey    = OPI_Cryptography.HMACSHA256(SecretKey, DateData);
    RegionKey  = OPI_Cryptography.HMACSHA256(DataKey, Region);
    ServiceKey = OPI_Cryptography.HMACSHA256(RegionKey, Service);

    FinalKey = OPI_Cryptography.HMACSHA256(ServiceKey, AWSRequest);

    Return FinalKey;

EndFunction

Function CreateCanonicalRequest()

    RequestTemplate = "";
    RequestBody     = GetRequestBodyAsBinaryData();
    HashSum         = OPI_Cryptography.Hash(RequestBody, HashFunction.SHA256);
    PartsAmount     = 6;

    Request.Headers.Insert("x-amz-content-sha256", Lower(ПолучитьHexСтрокуИзДвоичныхДанных(HashSum)));

    For N = 1 To PartsAmount Do

        RequestTemplate = RequestTemplate + "%" + String(N) + ?(N = PartsAmount, "", Chars.LF);

    EndDo;

    Method          = Upper(RequestMethod);
    URIString       = GetURIString();
    ParameterString = GetParamsString();
    HeadersString   = GetHeadersString();
    KeysString      = GetHeadersKeysString();

    HashString = Lower(ПолучитьHexСтрокуИзДвоичныхДанных(HashSum));

    CanonicalRequest = StrTemplate(RequestTemplate
        , Method
        , URIString
        , ParameterString
        , HeadersString
        , KeysString
        , HashString);

    Return CanonicalRequest;

EndFunction

Function CreateScope(Val Region, Val Service, Val CurrentDate)

    CommonDate = Format(CurrentDate, "DF=yyyyMMdd;");

    Scope = New Array;
    Scope.Add(CommonDate);
    Scope.Add(Region);
    Scope.Add(Service);
    Scope.Add("aws4_request");

    ScopeString = StrConcat(Scope, "/");

    Return ScopeString;

EndFunction

Function CreateSignatureString(Val CanonicalRequest, Val Scope, Val CurrentDate)

    StringTemplate = "";
    Algorithm      = "AWS4-HMAC-SHA256";
    DateISO        = OPI_Tools.ISOTimestamp(CurrentDate);
    PartsAmount    = 4;

    CanonicalRequest = ПолучитьДвоичныеДанныеИзСтроки(CanonicalRequest);
    CanonicalRequest = OPI_Cryptography.Hash(CanonicalRequest, HashFunction.SHA256);
    CanonicalRequest = Lower(ПолучитьHexСтрокуИзДвоичныхДанных(CanonicalRequest));

    For N = 1 To PartsAmount Do

        StringTemplate = StringTemplate + "%" + String(N) + ?(N = PartsAmount, "", Chars.LF);

    EndDo;

    SignatureString = StrTemplate(StringTemplate, Algorithm, DateISO, Scope, CanonicalRequest);
    SignatureString = ПолучитьДвоичныеДанныеИзСтроки(SignatureString);

    Return SignatureString;

EndFunction

Function GetHeadersKeysString()

    HeadersList = New ValueList;

    For Each Title In Request.Headers Do

        CurrentKey  = Title.Key;
        CurrentKeyN = Lower(CurrentKey);

        If Not StrStartsWith(CurrentKeyN, "host") And Not StrStartsWith(CurrentKeyN, "x-amz") Then
            Continue;
        EndIf;

        HeaderString = Lower(CurrentKey);
        HeadersList.Add(HeaderString);

    EndDo;

    HeadersList.SortByValue();

    HeadersString = StrConcat(HeadersList.UnloadValues(), ";");

    Return HeadersString;

EndFunction

Function GetURIString()

    URI = Request.ResourceAddress;
    URI = ?(StrStartsWith(URI, "/"), URI, "/" + URI);

    ParamsStart = StrFind(URI, "?");

    If ParamsStart <> 0 Then
        URI = Left(URI, ParamsStart - 1);
    EndIf;

    Return URI;

EndFunction

Function GetParamsString()

    URI         = Request.ResourceAddress;
    ParamsStart = StrFind(URI, "?");

    If ParamsStart = 0 Then

        ParameterString = "";

    Else

        URILength       = StrLen(URI);
        ParameterString = Right(URI, URILength - ParamsStart);
        ProcessRequestParametersString(ParameterString);

    EndIf;

    Return ParameterString;

EndFunction

Function GetHeadersString()

    HeadersList = New ValueList;

    For Each Title In Request.Headers Do

        CurrentKey  = Title.Key;
        CurrentKeyN = Lower(CurrentKey);

        If Not StrStartsWith(CurrentKeyN, "host") And Not StrStartsWith(CurrentKeyN, "x-amz") Then
            Continue;
        EndIf;

        HeaderString = Lower(CurrentKey) + ":" + Title.Value;
        HeadersList.Add(HeaderString);

    EndDo;

    HeadersList.SortByValue();

    HeadersString = StrConcat(HeadersList.UnloadValues(), Chars.LF);
    HeadersString = HeadersString + Chars.LF;

    Return HeadersString;

EndFunction

Procedure ProcessRequestParametersString(ParameterString)

    ParameterArray = StrSplit(ParameterString, "&");
    ParamsList     = New ValueList();
    ParamsList.LoadValues(ParameterArray);

    ParamsList.SortByValue();
    ParameterArray = ParamsList.UnloadValues();

    For N = 0 To ParameterArray.UBound() Do

        QueryParameter = ParameterArray[N];

        If StrFind(QueryParameter, "=") = 0 Then
            ParameterArray[N] = QueryParameter + "=";
        EndIf;

    EndDo;

    ParameterString = StrConcat(ParameterArray, "&");

EndProcedure

#EndRegion

#Region Auxiliary

Function StopExecution(Val ExceptionOnError = False)

    OPI_TypeConversion.GetBoolean(ExceptionOnError);

    IsError = RequestInitialized().Error;

    If IsError And ExceptionOnError Then
        Raise GetLog(True);
    Else
        Return IsError;
    EndIf;

EndFunction

Function RequestInitialized()

    Return ?(ValueIsFilled(Initialized)
        , ЭтотОбъект
        , Error("The request is not initialized. It is necessary to call the Initialize() function before starting work"));

EndFunction

Function Error(Val ErrorText)

    Error = True;

    If BodyTemporaryFile And ValueIsFilled(RequestBodyFile) Then

        Try
            DeleteFiles(RequestBodyFile);
            RequestBodyFile   = Undefined;
            BodyTemporaryFile = False;
        Except
            AddLog("Error: Failed to delete a temporary file on exception");
        EndTry;

    EndIf;

    Return AddLog(ErrorText);

EndFunction

Function AddLog(Val Text)

    OPI_TypeConversion.GetLine(Text);

    Log.Add(Text);

    Return ЭтотОбъект;

EndFunction

Function GetSetting(Val SettingKey)
    Return Settings[SettingKey];
EndFunction

Procedure SetDefaultSettings()

    Settings = New Structure;
    Settings.Insert("gzip"            , True);
    Settings.Insert("SplitArrayParams", False);
    Settings.Insert("URLencoding"     , True);

EndProcedure

Function FunctionTemplate()

    Try

        If StopExecution() Then Return ЭтотОбъект EndIf;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

#EndRegion

#EndRegion

// #EndIf
