// OneScript: ./OInt/tools/Modules/internal/Classes/OPI_HTTPClient.os
// Lib: HTTP-client
// CLI: none
// Keywords: http, https

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
// BSLLS:ExportVariables-off
// BSLLS:OneStatementPerLine-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check doc-comment-collection-item-type
//@skip-check object-module-export-variable

// #If Not Client Then

#Region Variables

// Processor

Var Initialized; // Flag indicating that the mandatory Initialize() function was called
Var Error Export; // Execution error flag to skip remaining actions in the chain
Var Log; // Array of messages about actions within the processing

// Request

Var Request; // HTTPRequest object
Var Connection; // HTTPConnection object
Var Settings; // Additional settings structure
Var Repeats; // Number of retries on error in complex requests

Var RequestURL; // Request URL
Var RequestServer; // Server from the request URL
Var RequestPort; // Port from the request URL or default
Var RequestAdress; // Path from the request URL
Var RequestAdressFull; // Path with parameters and section from the request URL
Var RequestSection; // Section in the URL if present
Var RequestProtected; // HTTPS usage flag
Var RequestDomain; // Domain from the request URL

Var RequestMethod; // HTTP method used
Var RequestURLParams; // URL parameters structure
Var RequestBody; // Request body data
Var RequestBodyCollection; // Data of body in view of collection, if maybe
Var RequestBodyCurrentSend; // Part of the common body data for the current send
Var RequestHeaders; // Request headers mapping
Var RequestUser; // User for basic authorization
Var RequestPassword; // Password for basic authorization
Var RequestTimeout; // Request timeout
Var RequestProxy; // Request proxy settings
Var RequestOutputFile; // Path to the file for saving the request result
Var RequestBodyFile; // Path to the file with the request body
Var RequestBodyStream; // Request body stream
Var RequestReadBodyStream; // Reading stream for body binary data
Var RequestDataWriter; // Request body data writing
Var RequestDataReader; // Reading request body data
Var RequestDataType; // MIME type for Content-Type
Var RequestTypeSetManualy; // Flag to disable automatic Content-Type detection
Var RequestPartSize; // Part size for partial upload
Var BodyTemporaryFile; // Flag to delete the body file if it was created automatically

// Authorization

Var AuthType; // View authorization
Var AuthData; // Credentials structure

// Response

Var Response; // HTTPResponse object
Var ResponseStatusCode; // Response status code
Var ResponseHeaders; // Response headers mapping

// Multipart

Var Multipart; // Flag indicating the body is set in Multipart format
Var Boundary; // Boundary for separating body parts
Var LineSeparator; // Body line separator

#EndRegion

#Region Public

#Region Initialization

// Initialize !NOCLI
// Initializes a new empty request
//
// Note:
// The function must be called first when creating a new processor object
// The URL can be set later using the `SetURL` function
//
// Parameters:
// URL - String - URL address for request - url
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function Initialize(Val URL = "") Export

    If ValueIsFilled(Initialized) Then
        ResetObjectFields();
    EndIf;

    Log = New Array;

    AddLog("Initialize: setting of default values");

    Initialized = True;
    Error       = False;

    RequestURLParams      = New Structure;
    RequestBody           = Undefined;
    RequestBodyCollection = New Structure;
    RequestHeaders        = New Map;
    RequestTimeout        = 3600;
    RequestPartSize       = 5242880;
    Repeats               = 0;

    RequestTypeSetManualy = False;

    BodyTemporaryFile = False;

    ResponseStatusCode = 0;
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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        If ValueIsFilled(URL) Then

            AddLog("SetURL: setting the value");

            OPI_TypeConversion.GetLine(URL);
            OPI_Tools.RestoreEscapeSequences(URL);

            If GetSetting("URLencoding") Then
                EncodeURLInURL(URL);
            EndIf;

            RequestURL = URL;

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

        If StopExecution() Then Return ЭтотОбъект; EndIf;
        If Not ValueIsFilled(Value) Then Value = New Structure; EndIf;

        AddLog("SetURLParams: parameter setting");

        ErrorText = "SetURLParams: the passed parameters are not a key/value collection";
        OPI_TypeConversion.GetKeyValueCollection(Value, ErrorText);

        RequestURLParams = OPI_Tools.CopyCollection(Value);

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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        If Not ValueIsFilled(Value) Then
            RequestOutputFile = Undefined;
            AddLog("SetResponseFile: response file not specified - skip");
            Return ЭтотОбъект;
        EndIf;

        AddLog("SetResponseFile: setting the value");

        OPI_TypeConversion.GetLine(Value);
        RequestOutputFile = Value;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set data type !NOCLI
// Sets the Content-Type of the request
//
// Note:
// If the data type is not set manually, it will be matched during the process of setting the request body
//
// Parameters:
// Value - String - ContentType header value - type
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetDataType(Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("SetDataType: setting the value");
        OPI_TypeConversion.GetLine(Value);

        RequestDataType       = Value;
        RequestTypeSetManualy = True;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set proxy !NOCLI
// Sets the proxy settings for the connection
//
// Parameters:
// Settings - InternetProxy - Proxy settings - proxy
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetProxy(Val Settings) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        If TypeOf(Settings) = Type("InternetProxy") Then

            AddLog("SetProxy: setting the value");
            RequestProxy = Settings;

        Else
            Error("SetProxy: passed settings are not an object of the InternetProxy type");
        EndIf;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set timeout !NOCLI
// Sets the connection timeout
//
// Note:
// Default timeout is 3600 seconds
//
// Parameters:
// Value - Number - Connection timeout - value
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetTimeout(Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        OPI_TypeConversion.GetNumber(Value);

        If Value           = 0 Then
            AddLog("SetTimeout: incorrect value passed, timeout not changed");
        Else
            AddLog("SetTimeout: setting value");
            RequestTimeout = Value;
        EndIf;

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

        Return ?(AsString, "", New Array);

    Else

        Return ?(AsString, StrConcat(Log, Chars.LF), Log);

    EndIf;

EndFunction

#EndRegion

#Region Settings

// Use encoding !NOCLI
// Sets the encoding of the request body
//
// Note:
// UTF-8 is used by default
//
// Parameters:
// Encoding - String - Encoding name - enc
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function UseEncoding(Val Encoding) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("UseEncoding: setting the value");
        OPI_TypeConversion.GetLine(Encoding);

        SetSetting("EncodeRequestBody", Encoding);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Use Gzip compression !NOCLI
// Enables or disables the header for receiving data from the server in compressed form
//
// Note:
// By default, the response from the server is requested with gzip compression
//
// Parameters:
// Flag - Boolean - Flag for gzip using - gzip
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function UseGzipCompression(Val Flag) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("UseGzipCompression: setting the value");
        OPI_TypeConversion.GetBoolean(Flag);

        SetSetting("gzip", Flag);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Use body fields at OAuth !NOCLI
// Includes or excludes body fields when calculating the OAuth signature depending on server requirements
//
// Note:
// By default, the body data is used in the signature calculation if it was set using the `SetFormBody` function
//
// Parameters:
// Flag - Boolean - Flag to use body fields in OAuth signature calculation - use
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function UseBodyFiledsAtOAuth(Val Flag) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("UseBodyFiledsAtOAuth: setting the value");
        OPI_TypeConversion.GetBoolean(Flag);

        SetSetting("BodyFieldsAtOAuth", Flag);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Use URL encoding !NOCLI
// Enables or disables standard encoding of special characters in URLs
//
// Note:
// URL encoding is enabled by default
//
// Parameters:
// Flag - Boolean - Flag to use URL encoding - enc
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function UseURLEncoding(Val Flag) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("UseURLEncoding: setting the value");
        OPI_TypeConversion.GetBoolean(Flag);

        SetSetting("URLencoding", Flag);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Max attempts !NOCLI
// Sets the maximum number of retry attempts for request submission on code 5**
//
// Note:
// By default: `0`
//
// Parameters:
// Value - Number - Retry count - val
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function MaxAttempts(Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("MaxAttempts: setting the value");

        OPI_TypeConversion.GetNumber(Value);
        SetSetting("MaxAttempts", Value);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Max redirects !NOCLI
// Sets the maximum number of allowed redirects
//
// Note:
// By default: `5`
//
// Parameters:
// Value - Number - Redirect count - val
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function MaxRedirects(Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("MaxRedirects: setting the value");

        OPI_TypeConversion.GetNumber(Value);
        SetSetting("MaxRedirects", Value);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Split arrays in URL
// Defines the representation of arrays in URL parameters: as a whole JSON array or separate parameters for each element
//
// Note:
// By default, arrays are interpreted as a single parameter with JSON array in value
// By default, square brackets to parameter keys are not set when array splitting is performed
//
// Parameters:
// Flag - Boolean - Flag for dividing the array into individual URL parameters - split
// SquareBrackets - Boolean - Add PHP style empty brackets to keys (key[]=value) if Flag = True - php
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SplitArraysInURL(Val Flag, Val SquareBrackets = Undefined) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("SplitArraysInURL: setting the value");
        OPI_TypeConversion.GetBoolean(Flag);

        If SquareBrackets <> Undefined Then

            AddLog("SplitArraysInURL: square brackets option setting");
            OPI_TypeConversion.GetBoolean(SquareBrackets);

            SetSetting("ArraysSquareBrackets", SquareBrackets);

        EndIf;

        SetSetting("SplitArrayParams", Flag);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Return settings
//
// Parameters:
// Filter - String, Array of String - Filter by setting name or names for retrieval - filter
//
// Returns:
// Arbitrary - Settings structure, specific setting value, or handler object (on error)
Function ReturnSettings(Val Filter = Undefined) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("ReturnSettings: getting the value");

        CurrentSettings = OPI_Tools.CopyCollection(Settings);

        If Filter <> Undefined Then

            OPI_TypeConversion.GetArray(Filter);

            If Filter.Count() = 1 Then

                CurrentSettings = OPI_Tools.GetOr(CurrentSettings, String(Filter[0]), Undefined);

            Else

                FilterList = New ValueList();
                FilterList.LoadValues(Filter);

                CurrentSettings_ = New Structure;

                For Each Setting In CurrentSettings Do

                    If FilterList.FindByValue(Setting.Key) <> Undefined Then
                        CurrentSettings_.Insert(Setting.Key, Setting.Value);
                    EndIf;

                EndDo;

                CurrentSettings = CurrentSettings_;

            EndIf;

        EndIf;

        Return CurrentSettings;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        CancelMultipartBody();

        If Not RequestTypeSetManualy Then
            RequestDataType = "application/octet-stream";
        EndIf;

        OPI_TypeConversion.GetBinaryData(Data, True, False);
        OPI_TypeConversion.GetBoolean(SetIfEmpty);

        Data   = ?(Data = Undefined, GetBinaryDataFromString(""), Data);
        IsData = Data.Size() > 0;

        If IsData Or SetIfEmpty Then

            If Not IsData Then
                Data = GetBinaryDataFromString("");
            EndIf;

            AddLog("SetBinaryBody: beginning of body setting");
            SetBodyFromBinaryData(Data);
            AddLog(StrTemplate("SetBinaryBody: body set, size %1", RequestBody.Size()));

        Else
            AddLog("SetBinaryBody: an empty body has been passed - skip");
        EndIf;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set string body !NOCLI
// Sets the body of the request from the string
//
// Parameters:
// Data - String - Request body data - data
// WriteBOM - Boolean - True > BOM will be added - bom
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetStringBody(Val Data, Val WriteBOM = False) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        CancelMultipartBody();

        If Not ValueIsFilled(Data) Then
            AddLog("SetStringBody: no data - skip");
            Return ЭтотОбъект;
        EndIf;

        Encoding = GetSetting("EncodeRequestBody");

        OPI_TypeConversion.GetLine(Encoding);

        If Not RequestTypeSetManualy Then
          RequestDataType = StrTemplate("text/plain; charset=%1", Encoding);
        EndIf;

        AddLog("SetStringBody: beginning of body setting");
        SetBodyFromString(Data, WriteBOM);
        AddLog(StrTemplate("SetStringBody: body set, size %1", RequestBody.Size()));

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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        CancelMultipartBody();

        If Not ValueIsFilled(Data) Then
            AddLog("SetJsonBody: no data - skip");
            Return ЭтотОбъект;
        EndIf;

        If Not RequestTypeSetManualy Then
          RequestDataType = "application/json; charset=utf-8";
        EndIf;

        AddLog("SetJsonBody: beginning of body setting");

        If Not TypeOf(Data) = Type("BinaryData") Then

            OPI_TypeConversion.GetCollection(Data);

            If Not TypeOf(Data)       = Type("Array") Then
                RequestBodyCollection = OPI_Tools.CopyCollection(Data);
            EndIf;

        EndIf;

        SetBodyFromString(Data);

        AddLog(StrTemplate("SetJsonBody: body set, size %1", RequestBody.Size()));

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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        CancelMultipartBody();

        If Not ValueIsFilled(Data) Then
            AddLog("SetFormBody: no data - skip");
            Return ЭтотОбъект;
        EndIf;

        If Not RequestTypeSetManualy Then
          RequestDataType = "application/x-www-form-urlencoded; charset=utf-8";
        EndIf;

        AddLog("SetFormBody: beginning of body setting");

        OPI_TypeConversion.GetCollection(Data);

        If TypeOf(Data) = Type("Array") Then

            Data = Data[0];

            If Not TypeOf(Data) = Type("BinaryData") Then
                OPI_TypeConversion.GetLine(Data);
            EndIf;

        Else

            RequestBodyCollection = OPI_Tools.CopyCollection(Data);
            Data                  = RequestParametersToString(Data);

        EndIf;

        SetBodyFromString(Data);
        SetSetting("BodyFieldsAtOAuth", True);

        AddLog(StrTemplate("SetFormBody: body set, size %1", RequestBody.Size()));

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Start Multipart body !NOCLI
// Initializes writing data to the body in multipart format
//
// Note:
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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        OPI_TypeConversion.GetBoolean(UseFile);
        OPI_TypeConversion.GetLine(View);

        Multipart     = True;
        Boundary      = StrReplace(String(New UUID), "-", "");
        LineSeparator = Chars.CR + Chars.LF;
        Encoding      = GetSetting("EncodeRequestBody");
        RequestDataType = StrTemplate("multipart/%1; boundary=%2", View, Boundary);

        RequestBodyCollection = New Structure;

        If UseFile Then

            AddLog("StartMultipartBody: creating a temporary file");

            // BSLLS:MissingTemporaryFileDeletion-off

            //@skip-check missing-temporary-file-deletion
            RequestBodyFile = GetTempFileName();

            // BSLLS:MissingTemporaryFileDeletion-on

            BodyTemporaryFile = True;
            RequestDataWriter = New DataWriter(RequestBodyFile
                , Encoding
                , ByteOrder.LittleEndian
                , ""
                , False
                , ""
                , False);

        Else

            AddLog("StartMultipartBody: creating a stream in memory");

            RequestBodyStream = New MemoryStream();

            RequestDataWriter = New DataWriter(RequestBodyStream
                , Encoding
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
// Note:
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

        If StopExecution() Then Return ЭтотОбъект; EndIf;
        If Not Multipart Then Return Error("AddMultipartFile: Multipart record not initialized"); EndIf;

        OPI_TypeConversion.GetBinaryData(Data);
        OPI_TypeConversion.GetLine(FieldName);
        OPI_TypeConversion.GetLine(FileName);

        AddLog("AddMultipartFile: writing the block header");

        Header = StrTemplate("Content-Disposition: form-data; name=""%1""; filename=""%2""", FieldName, FileName);

        RequestDataWriter.WriteLine("--" + Boundary + LineSeparator);
        RequestDataWriter.WriteLine(Header);
        RequestDataWriter.WriteLine(LineSeparator);

        If ValueIsFilled(DataType) Then
            RequestDataWriter.WriteLine("Content-Type: " + DataType);
        EndIf;

        RequestDataWriter.WriteLine(LineSeparator);
        RequestDataWriter.WriteLine(LineSeparator);

        AddLog("AddMultipartFile: data writing");

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
// Note:
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

        If StopExecution() Then Return ЭтотОбъект; EndIf;
        If Not Multipart Then Return Error("AddMultipartField: multipart record not initialized"); EndIf;

        ValeType = TypeOf(Value);

        AddLog("AddMultipartField: writing the block header");

        Header = StrTemplate("Content-Disposition: form-data; name=""%1""", FieldName);

        RequestDataWriter.WriteLine("--" + boundary + LineSeparator);
        RequestDataWriter.WriteLine(Header);
        RequestDataWriter.WriteLine(LineSeparator);
        RequestDataWriter.WriteLine(LineSeparator);

        AddLog("AddMultipartField: data writing");

        If ValeType = Type("Boolean") Then

            Value = ?(Value, "true", "false");
            RequestDataWriter.WriteLine(Value);
            RequestBodyCollection.Insert(FieldName, Value);

        ElsIf ValeType = Type("BinaryData") Then

            WriteBinaryData(RequestDataWriter, Value);

        Else

            OPI_TypeConversion.GetLine(Value);
            RequestDataWriter.WriteLine(Value);
            RequestBodyCollection.Insert(FieldName, Value);

        EndIf;

        RequestDataWriter.WriteLine(LineSeparator);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Add data as Related !NOCLI
// Adds data to the multipart/related body
//
// Note:
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

        If StopExecution() Then Return ЭтотОбъект; EndIf;
        If Not Multipart Then Return Error("AddFileAsRelated: multipart record not initialized"); EndIf;

        OPI_TypeConversion.GetLine(DataType);
        OPI_TypeConversion.GetLine(ContentID);
        OPI_TypeConversion.GetBinaryData(Data, True, False);

        AddLog("AddFileAsRelated: writing the block header");
        RequestDataWriter.WriteLine("--" + Boundary + LineSeparator);
        RequestDataWriter.WriteLine("Content-Type: " + DataType);

        If ValueIsFilled(ContentID) Then
            RequestDataWriter.WriteLine("Content-ID: " + ContentID);
        EndIf;

        RequestDataWriter.WriteLine(LineSeparator);
        RequestDataWriter.WriteLine(LineSeparator);

        AddLog("AddFileAsRelated: data writing");
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
// Parameters:
// Value - Arbitrary - Structure or map of request headers - headers
// FullReplace - Boolean - Clears all previously added headers before setting - replace
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetHeaders(Val Value, Val FullReplace = False) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;
        If Not ValueIsFilled(Value) Then Value = New Map; EndIf;

        ErrorText = "SetHeaders: the passed parameters are not a key/value collection";
        OPI_TypeConversion.GetKeyValueCollection(Value, ErrorText);
        OPI_TypeConversion.GetBoolean(FullReplace);

        AddLog("SetHeaders: query header setting");

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

// Add header !NOCLI
// Adds a header to the request header set
//
// Parameters:
// Name - String - Header key - header
// Value - String - Header value - value
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddHeader(Val Name, Val Value) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;
        If Not ValueIsFilled(Value) Then Value = New Map; EndIf;

        OPI_TypeConversion.GetLine(Name);
        OPI_TypeConversion.GetLine(Value);

        AddLog("AddHeader: header setting");

        RequestHeaders.Insert(Name, Value);

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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        OPI_TypeConversion.GetLine(User);
        OPI_TypeConversion.GetLine(Password);

        RequestUser     = User;
        RequestPassword = Password;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Add Bearer authorization
// Adds a request header for Bearer authorization
//
// Parameters:
// Token - String - Bearer token value - token
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddBearerAuthorization(Val Token) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        OPI_TypeConversion.GetLine(Token);

        AuthType = "bearer";
        AuthData = Token;

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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        String_  = "String";
        AuthType = "aws4";

        AuthData = New Structure;
        OPI_Tools.AddField("AccessKey", AccessKey, String_, AuthData);
        OPI_Tools.AddField("SecretKey", SecretKey, String_, AuthData);
        OPI_Tools.AddField("Region"   , Region   , String_, AuthData);
        OPI_Tools.AddField("Service"  , Service  , String_, AuthData);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Add OAuth V1 authorization
// Adds data for OAuth v1 authorization
//
// Note:
// By default, HMAC-SHA256 is used to create the signature. To change the algorithm, you can use^^
// `SetOAuthV1Algorithm`
//
// Parameters:
// Token - String - Token for authorization - token
// Secret - String - Secret for authorization - secret
// ConsumerKey - String - Consumer key for authorization - ck
// ConsumerSecret - String - Consumer secret for authorization - cs
// Version - String - API version - ver
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function AddOAuthV1Authorization(Val Token, Val Secret, Val ConsumerKey, Val ConsumerSecret, Val Version) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        String_  = "String";
        AuthType = "oauth1";

        AuthData = New Structure;
        OPI_Tools.AddField("OAuthToken"         , Token          , String_, AuthData);
        OPI_Tools.AddField("OAuthSecret"        , Secret         , String_, AuthData);
        OPI_Tools.AddField("OAuthConsumerKey"   , ConsumerKey    , String_, AuthData);
        OPI_Tools.AddField("OAuthConsumerSecret", ConsumerSecret , String_, AuthData);
        OPI_Tools.AddField("OAuthAlgorithm"     , "HMAC"         , String_, AuthData);
        OPI_Tools.AddField("OAuthHashFunction"  , "SHA256"       , String_, AuthData);
        OPI_Tools.AddField("OAuthAPIVersion"    , Version        , String_, AuthData);

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Set OAuth V1 algorithm !NOCLI
// Changes the algorithm for OAuth signatures
//
// Parameters:
// Algorithm - String - Encryption algorithm: HMAC, RSA - alg
// HashFunction - String - Hash function for signature: SHA1, SHA256 - hash
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SetOAuthV1Algorithm(Val Algorithm, Val HashFunction) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        If AuthType <> "oauth1" Then
            Return Error("SetOAuthV1Algorithm: OAuth v1 authorization must be initialized before the algorithm is changed");
        EndIf;

        OPI_Tools.AddField("OAuthAlgorithm"   , Algorithm   , "String", AuthData);
        OPI_Tools.AddField("OAuthHashFunction", HashFunction, "String", AuthData);

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
// Note:
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

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        OPI_TypeConversion.GetLine(Method);
        OPI_TypeConversion.GetBoolean(Start);
        RequestMethod = Method;

        AddLog("ProcessRequest: creation of HTTPRequest object");
        If FormRequest().Error Then Return ЭтотОбъект; EndIf;

        AddLog("ProcessRequest: place the body in the HTTPRequest object");
        If SetRequestBody().Error Then Return ЭтотОбъект; EndIf;

        CompleteHeaders();

        If Start Then
            ExecuteMethod();
        EndIf;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Execute request !NOCLI
// Executes the request if it was created earlier
//
// Parameters:
// Forced - Boolean - Attempted execution without additional checks - force
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function ExecuteRequest(Forced = False) Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        AddLog("ExecuteRequest: executing");

        Return ExecuteMethod(0, 0, Forced);

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Send data in parts !NOCLI
// Sends the body in multiple requests with the Content-Range header
//
// Parameters:
// ChunkSize - Number - Size of one part for sending - part
// Method - String - Request HTTP method - method
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SendDataInParts(Val ChunkSize = 5242880, Val Method = "PUT") Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        If TypeOf(RequestBody) <> Type("BinaryData") Then
            Raise "Body not set";
        EndIf;

        Repeats   = 0;
        TotalSize = RequestBody.Size();

        RequestBodyStream = RequestBody.OpenStreamForRead();
        RequestDataReader = New DataReader(RequestBodyStream);

        KBytes = 1024;
        MByte  = KBytes * KBytes;

        While RequestBodyStream.CurrentPosition() < TotalSize Do

            SendPart(RequestBodyStream.CurrentPosition(), ChunkSize, Method);
            Check = CheckPartUpload();

            If Check <> Undefined Then
                Return Check;
            EndIf;

            OPI_Tools.ProgressInformation(RequestBodyStream.CurrentPosition(), TotalSize, "MB", MByte);

            RunGarbageCollection();

        EndDo;

        Return ЭтотОбъект;

    Except
        Return Error(DetailErrorDescription(ErrorInfo()));
    EndTry;

EndFunction

// Send part !NOCLI
// Sends a request with the specified part of the body and the Content-Range header
//
// Parameters:
// StartPosition - Number - Start position in request body - start
// ByteCount - Number - Number of bytes from the specified start position for sending - bytes
// Method - String - Request HTTP method - method
//
// Returns:
// DataProcessorObject.OPI_HTTPClient - This processor object
Function SendPart(Val StartPosition, Val ByteCount, Val Method = "PUT") Export

    Try

        If StopExecution() Then Return ЭтотОбъект; EndIf;

        If TypeOf(RequestBody) <> Type("BinaryData") Then
            Raise "Body not set";
        EndIf;

        OPI_TypeConversion.GetLine(Method);

        RequestReadBodyStream = ?(RequestReadBodyStream = Undefined, RequestBody.OpenStreamForRead(), RequestReadBodyStream);
        RequestDataReader     = ?(RequestDataReader = Undefined, New DataReader(RequestReadBodyStream), RequestDataReader);

        If Not RequestReadBodyStream.CurrentPosition() = StartPosition Then
            RequestReadBodyStream.Seek(StartPosition, StreamPosition.Begin);
        EndIf;

        Result = RequestDataReader.Read(ByteCount);

        RequestBodyCurrentSend = Result.GetBinaryData();
        CurrentSize            = RequestBodyCurrentSend.Size();

        If Not ValueIsFilled(RequestBodyCurrentSend) Or CurrentSize = 0 Then
            Return ЭтотОбъект;
        EndIf;

        EndPosition = StartPosition + CurrentSize - 1;

        StreamHeader = "bytes "
            + OPI_Tools.NumberToString(StartPosition)
            + "-"
            + OPI_Tools.NumberToString(EndPosition)
            + "/"
            + OPI_Tools.NumberToString(RequestBody.Size());

        AdditionalHeaders = New Map;
        AdditionalHeaders.Insert("Content-Length", OPI_Tools.NumberToString(CurrentSize));
        AdditionalHeaders.Insert("Content-Range" , StreamHeader);

        SetHeaders(AdditionalHeaders).ProcessRequest(Method, True);

        Return ЭтотОбъект;

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

    If StopExecution() And Not Forced Then Return ЭтотОбъект; EndIf;

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

    If StopExecution() And Not Forced Then Return ЭтотОбъект; EndIf;

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

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект; EndIf;

    Return Response;

EndFunction

// Return response as JSON object !NOCLI
// Returns the response body as a collection from JSON
//
// Note:
// If it is not possible to obtain a collection from the body, binary data will be returned
//
// Parameters:
// ToMap - Boolean - Use map instead of structure - map
// ExceptionOnError - Boolean - Causes an exception with a log if there were errors during processing - ex
//
// Returns:
// Arbitrary - The response or the same processing object
Function ReturnResponseAsJSONObject(Val ToMap = True, Val ExceptionOnError = False) Export

    If StopExecution(ExceptionOnError) Then Return ЭтотОбъект; EndIf;

    Try

        OPI_TypeConversion.GetBoolean(ToMap);
        ResponseBody = GetResponseBody();

        Try

            If ResponseBody.Size() > 0 Then
                JSON = OPI_Tools.JsonToStructure(ResponseBody, ToMap);
            Else
                JSON = New Map;
            EndIf;

        Except

            JSON = ResponseBody;

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

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект; EndIf;

    Try
        BodyBinary = Undefined;
        BodyBinary = GetResponseBody();
    Except

        Error = True;

        If StopExecution(ExceptionOnError) And Not Forced Then
            BodyBinary = ЭтотОбъект;
        EndIf;

    EndTry;

    Return BodyBinary;

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

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект; EndIf;

    Try
        BodyAsString = Undefined;
        BodyAsString = GetStringFromBinaryData(GetResponseBody());
    Except

        Error = True;

        If StopExecution(ExceptionOnError) And Not Forced Then
            BodyAsString = ЭтотОбъект;
        EndIf;

    EndTry;

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

    If StopExecution(ExceptionOnError) And Not Forced Then Return ЭтотОбъект; EndIf;

    Try
        BodyFileName = Undefined;
        BodyFileName = Response.GetBodyFileName();
    Except

        Error = True;

        If StopExecution(ExceptionOnError) And Not Forced Then
            BodyFileName = ЭтотОбъект;
        EndIf;

    EndTry;

    Return BodyFileName;

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region HTTP

Function ConvertParameterToString(Val Value)

    EncodeURL = GetSetting("URLencoding");

    If TypeOf(Value) = Type("Array") Then

        Value = OPI_Tools.CopyCollection(Value);

        For N        = 0 To Value.UBound() Do
            Value[N] = ConvertParameterToString(Value[N]);
        EndDo;

        Value = StrConcat(Value, ",");

        If EncodeURL Then
            Value = EncodeString(Value, StringEncodingMethod.URLInURLEncoding);
        EndIf;

        Value = "[" + Value + "]";

    ElsIf TypeOf(Value) = Type("Map") Or TypeOf(Value) = Type("Structure") Then

        Value          = OPI_Tools.CopyCollection(Value);
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

Function SetBodyFromBinaryData(Val Value)

    OPI_TypeConversion.GetBinaryData(Value, True, False);

    RequestBody           = Value;
    RequestBodyStream     = Undefined;
    RequestReadBodyStream = Undefined;
    RequestDataReader     = Undefined;
    RequestDataWriter     = Undefined;

    Return ЭтотОбъект;

EndFunction

Function SetBodyFromString(Val Value, Val WriteBOM = False)

    If TypeOf(Value) = Type("BinaryData") Then

        RequestBody           = Value;
        RequestBodyStream     = Undefined;
        RequestReadBodyStream = Undefined;
        RequestDataReader     = Undefined;
        RequestDataWriter     = Undefined;

    Else

        Encoding = GetSetting("EncodeRequestBody");

        OPI_TypeConversion.GetLine(Value);
        OPI_TypeConversion.GetBoolean(WriteBOM);

        RequestBody           = GetBinaryDataFromString(Value, Encoding, WriteBOM);
        RequestBodyStream     = Undefined;
        RequestReadBodyStream = Undefined;
        RequestDataReader     = Undefined;
        RequestDataWriter     = Undefined;

    EndIf;

    Return ЭтотОбъект;

EndFunction

Function SplitURL()

    AddLog("SplitURL: splitting a request into component parts");

    URL = RequestURL;

    RequestProtected = Not StrStartsWith(RequestURL, "http://");

    AddLog("SplitURL: Secure = " + String(RequestProtected));

    URL = StrReplace(URL, "https://", "");
    URL = StrReplace(URL, "http://" , "");

    Section = StrFind(URL, "#");

    If Section > 0 Then

        RequestSection = Right(URL, StrLen(URL) - Section + 1);
        AddLog("SplitURL: Section = " + RequestSection);

        URL = Left(URL, Section - 1);

    EndIf;

    If StrFind(URL, "/") = 0 Then
        RequestAdress    = "";
        RequestDomain    = URL;
    Else
        RequestAdress    = Right(URL, StrLen(URL) - StrFind(URL, "/", SearchDirection.FromBegin) + 1);
        RequestDomain    = Left(URL, StrFind(URL, "/", SearchDirection.FromBegin) - 1);
    EndIf;

    AddLog("SplitURL: Address = " + RequestAdress);
    AddLog("SplitURL: Domain = " + RequestDomain);

    If StrFind(RequestDomain, ":") <> 0 Then

        HostPort      = StrSplit(RequestDomain, ":");
        RequestDomain = HostPort[0];
        RequestPort   = HostPort[1];

        OPI_TypeConversion.GetNumber(RequestPort);

    Else

        RequestPort = ?(RequestProtected, 443, 80);

    EndIf;

    AddLog("SplitURL: Port = " + OPI_Tools.NumberToString(RequestPort));

    If OPI_Tools.IsOneScript() And RequestProtected Then
        RequestServer = "https://" + RequestDomain;
    Else
        RequestServer = RequestDomain;
    EndIf;

    AddLog("SplitURL: Host = " + RequestServer);

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

    KeyArray = StrTemplate("%1%2=", Key, ?(GetSetting("ArraysSquareBrackets"), "[]", ""));
    Value = OPI_Tools.CopyCollection(Value);

    For N = 0 To Value.UBound() Do

        CurrentValue = Value[N];

        OPI_TypeConversion.GetLine(CurrentValue);

        If GetSetting("URLencoding") Then
            CurrentValue = EncodeString(CurrentValue, StringEncodingMethod.URLInURLEncoding);
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

    CompleteAuthHeaders();

    If GetSetting("gzip") Then
        AddLog("CompleteHeaders: setting the gzip header");
        Request.Headers.Insert("Accept-Encoding", "gzip");
    EndIf;

    If ValueIsFilled(RequestDataType) Then
        Request.Headers.Insert("Content-Type", RequestDataType);
    EndIf;

    If TypeOf(RequestHeaders) = Type("Map") Then

        For Each Title In RequestHeaders Do
            Request.Headers.Insert(Title.Key, Title.Value);
        EndDo;

    EndIf;

    Return ЭтотОбъект;

EndFunction

Function CompleteAuthHeaders()

    If Not ValueIsFilled(AuthType) Then
        Return ЭтотОбъект;
    EndIf;

    If AuthType = "aws4" Then

        AddLog("CompleteAuthHeaders: generating AWS4 Authorization header");
        AddAWS4();

    ElsIf AuthType = "oauth1" Then

        AddLog("CompleteAuthHeaders: generating OAuth V1 Authorization header");
        AddOAuthV1Header();

    Else

        AddLog("CompleteAuthHeaders: generating Bearer Authorization header");
        Request.Headers.Insert("Authorization", StrTemplate("Bearer %1", AuthData));

    EndIf;

    Return ЭтотОбъект;

EndFunction

Function SetRequestBody()

    If Multipart Then
        EndMultipartBody();
    EndIf;

    If ValueIsFilled(RequestBodyFile) Then
        Request.SetBodyFileName(RequestBodyFile);
    Else

        RequestBodyCurrent = ?(RequestBodyCurrentSend = Undefined, RequestBody, RequestBodyCurrentSend);

        If TypeOf(RequestBody) = Type("BinaryData") Then
            Request.SetBodyFromBinaryData(RequestBodyCurrent);
        EndIf;

    EndIf;

    Return ЭтотОбъект;

EndFunction

Function ExecuteMethod(Val RedirectCount = 0, Val ErrorCount = 0, Val Forced = False)

    OPI_TypeConversion.GetBoolean(Forced);

    If (Request = Undefined Or Connection = Undefined) And Not Forced Then
        Return Error("ExecuteMethod: the request was not generated before execution");
    EndIf;

    If ValueIsFilled(RequestOutputFile) Then

        LogText = StrTemplate("ExecuteMethod: sending request with response written to file %1", RequestOutputFile);
        AddLog(LogText);

        Response = Connection.CallHTTPMethod(RequestMethod, Request, RequestOutputFile);

    Else

        AddLog("ExecuteMethod: sending request");
        Response = Connection.CallHTTPMethod(RequestMethod, Request);

    EndIf;

    LogText = StrTemplate("ExecuteMethod: response received, code %1", Response.StatusCode);
    AddLog(LogText);

    If ThisIsRedirection(Response) Then

        MaximumNumberOfRedirects = GetSetting("MaxRedirects");

        If RedirectCount < MaximumNumberOfRedirects Then

            URL = Response.Headers["Location"];

            If ValueIsFilled(URL) Then

                NewRedirectCount = RedirectCount + 1;

                LogText = StrTemplate("ExecuteMethod: redirection %1/%2, moving to %3"
                    , NewRedirectCount
                    , MaximumNumberOfRedirects
                    , URL);

                AddLog(LogText);
                SetURL(URL);
                CreateConnection();

                Request.ResourceAddress = RequestAdress;

                If OPI_Tools.IsOneScript() Then
                    FormRequest();
                EndIf;

                ExecuteMethod(NewRedirectCount, ErrorCount, Forced);

            Else

                LogText = "ExecuteMethod: redirection, Location missing, termination";
                AddLog(LogText);

            EndIf;

        Else
            AddLog("ExecuteMethod: maximum number of redirections reached, termination");
        EndIf;

    EndIf;

    If ThisIsServerError(Response) Then

        MaximumRetryCount = GetSetting("MaxAttempts");

        If ErrorCount < MaximumRetryCount Then

            NewErrorCount = ErrorCount + 1;

            LogText = StrTemplate("ExecuteMethod: server error, retry attempt %1/%2"
                , NewErrorCount
                , MaximumRetryCount);

            AddLog(LogText);

            If OPI_Tools.IsOneScript() Then
                FormRequest();
            EndIf;

            ExecuteMethod(RedirectCount, NewErrorCount, Forced);

        Else
            AddLog("ExecuteMethod: maximum number of server errors reached, termination");
        EndIf;

    EndIf;

    ResponseStatusCode = Response.StatusCode;
    ResponseHeaders    = Response.Headers;

    Return ЭтотОбъект;

EndFunction

Function GetResponseBody()

    NeedsUnpacking = False;

    For Each ResponseHeader In Response.Headers Do

        HeaderKey   = ResponseHeader.Key;
        HeaderValue = ResponseHeader.Value;

        If Lower(HeaderKey)       = "content-encoding" Then
            If Lower(HeaderValue) = "gzip" Then
                NeedsUnpacking    = True;
                Break;
            EndIf;
        EndIf;

    EndDo;

    If NeedsUnpacking Then
        Data = UnpackResponse(Response);
    Else
        Data = GetResponseBodyAsBinaryData();
    EndIf;

    Data = ?(TypeOf(Data) = Type("HTTPResponse"), GetResponseBodyAsBinaryData(), Data);

    If Not TypeOf(Data) = Type("BinaryData") Then
        OPI_TypeConversion.GetBinaryData(Data);
    EndIf;

    Return Data;

EndFunction

Function ThisIsRedirection(Val Response)

    Redirection  = 300;
    RequestError = 400;

    ThisIsRedirection = Response.StatusCode >= Redirection
        And Response.StatusCode < RequestError
        And ValueIsFilled(Response.Headers["Location"]);

    Return ThisIsRedirection;

EndFunction

Function ThisIsServerError(Val Response)

    ServerError = 500;

    ThisIsServerError = Response.StatusCode >= ServerError;

    Return ThisIsServerError;

EndFunction

Function GetResponseBodyAsBinaryData()

    BodyStream = Response.GetBodyAsStream();

    If BodyStream = Undefined Then
        Return GetBinaryDataFromString("");
    EndIf;

    DataReader    = New DataReader(BodyStream);
    ReadingResult = DataReader.Read();
    Data          = ReadingResult.GetBinaryData();

    DataReader.Close();
    BodyStream.Close();

    Return Data;

EndFunction

Function GetResponseBodyAsBinaryOrPath()

    BodyFileName = Response.GetBodyFileName();

    If Not ValueIsFilled(BodyFileName) Then
        Return GetResponseBodyAsBinaryData();
    Else
        Return BodyFileName;
    EndIf;

EndFunction

Function GetRequestBodyAsBinaryData()

    If ValueIsFilled(RequestBodyFile) Then
        Data = New BinaryData(RequestBodyFile);
    Else
        Data = RequestBody;
    EndIf;

    If Data  = Undefined Then
        Data = GetBinaryDataFromString("");
    EndIf;

    Return Data;

EndFunction

Function CheckPartUpload()

    SuccessCode      = 200;
    RequestErrorCode = 400;
    ServerErrorCode  = 500;

    If ResponseStatusCode >= SuccessCode And ResponseStatusCode < RequestErrorCode Then

        UploadedData = ResponseHeaders.Get("Range");

        If ValueIsFilled(UploadedData) Then

            UploadedData = StrReplace(UploadedData, "bytes=", "");
            ArrayOfInformation = StrSplit(UploadedData, "-", False);
            PartsRequired      = 2;

            If ArrayOfInformation.Count() = PartsRequired Then
                RequestReadBodyStream.Seek(Number(ArrayOfInformation[1]) + 1 , StreamPosition.Begin);
            Else
                RequestReadBodyStream.Seek(RequestBodyCurrentSend.Size()     , StreamPosition.Current);
            EndIf;

        Else

            RequestReadBodyStream.Seek(RequestBodyCurrentSend.Size(), StreamPosition.Current);

        EndIf;

    ElsIf ResponseStatusCode >= ServerErrorCode Then

        If Repeats < 3 Then
            Repeats = Repeats + 1;
        Else
            Return ЭтотОбъект;
        EndIf;

    Else
        Return ЭтотОбъект;
    EndIf;

    Return Undefined;

EndFunction

Procedure CancelMultipartBody()

    If Not Multipart Then
        Return;
    EndIf;

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

// BSLLS:MagicNumber-off

Function UnpackResponse(Response)

    Try
        Return ReadGZip(GetResponseBodyAsBinaryOrPath());
    Except
        Return Response;
    EndTry;

EndFunction

Function ReadGZip(CompressedData)

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

// BSLLS:MagicNumber-on

#EndRegion

#Region AWS4

Function AddAWS4()

    AuthorizationHeader = CreateAuthorizationHeader();

    Request.Headers.Insert("Authorization", AuthorizationHeader);

    Return ЭтотОбъект;

EndFunction

Function CreateAuthorizationHeader()

    AccessKey   = AuthData["AccessKey"];
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

    SecretKey = AuthData["SecretKey"];
    Region    = AuthData["Region"];
    Service   = AuthData["Service"];

    SignKey          = GetSignatureKey(SecretKey, Region, Service, CurrentDate);
    CanonicalRequest = CreateCanonicalRequest();
    Scope            = CreateScope(Region, Service, CurrentDate);
    StringToSign     = CreateSignatureString(CanonicalRequest, Scope, CurrentDate);

    Signature = OPI_Cryptography.HMAC(SignKey, StringToSign, "SHA256");
    Signature = Lower(GetHexStringFromBinaryData(Signature));

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

    SecretKey  = GetBinaryDataFromString("AWS4" + SecretKey);
    DateData = GetBinaryDataFromString(Format(CurrentDate, "DF=yyyyMMdd;"));
    Region     = GetBinaryDataFromString(Region);
    Service    = GetBinaryDataFromString(Service);
    AWSRequest = GetBinaryDataFromString("aws4_request");
    SHA256_    = "SHA256";

    DataKey    = OPI_Cryptography.HMAC(SecretKey, DateData, SHA256_);
    RegionKey  = OPI_Cryptography.HMAC(DataKey, Region, SHA256_);
    ServiceKey = OPI_Cryptography.HMAC(RegionKey, Service, SHA256_);

    FinalKey = OPI_Cryptography.HMAC(ServiceKey, AWSRequest, SHA256_);

    Return FinalKey;

EndFunction

Function CreateCanonicalRequest()

    RequestTemplate = "";
    RequestBody     = GetRequestBodyAsBinaryData();
    HashSum         = OPI_Cryptography.Hash(RequestBody, HashFunction.SHA256);
    PartsAmount     = 6;

    Request.Headers.Insert("x-amz-content-sha256", Lower(GetHexStringFromBinaryData(HashSum)));

    For N = 1 To PartsAmount Do

        RequestTemplate = RequestTemplate + "%" + String(N) + ?(N = PartsAmount, "", Chars.LF);

    EndDo;

    Method          = Upper(RequestMethod);
    URIString       = GetURIString();
    ParameterString = GetParamsString();
    HeadersString   = GetHeadersString();
    KeysString      = GetHeadersKeysString();

    HashString = Lower(GetHexStringFromBinaryData(HashSum));

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

    CanonicalRequest = GetBinaryDataFromString(CanonicalRequest);
    CanonicalRequest = OPI_Cryptography.Hash(CanonicalRequest, HashFunction.SHA256);
    CanonicalRequest = Lower(GetHexStringFromBinaryData(CanonicalRequest));

    For N = 1 To PartsAmount Do

        StringTemplate = StringTemplate + "%" + String(N) + ?(N = PartsAmount, "", Chars.LF);

    EndDo;

    SignatureString = StrTemplate(StringTemplate, Algorithm, DateISO, Scope, CanonicalRequest);
    SignatureString = GetBinaryDataFromString(SignatureString);

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

#Region OAuth

Function AddOAuthV1Header()

    AddLog("AddOAuthV1Header: signature creation");

    OAuthAlgorithm      = AuthData["OAuthAlgorithm"];
    OAuthHashFunction   = AuthData["OAuthHashFunction"];
    OAuthToken          = AuthData["OAuthToken"];
    OAuthSecret         = AuthData["OAuthSecret"];
    OAuthConsumerKey    = AuthData["OAuthConsumerKey"];
    OAuthConsumerSecret = AuthData["OAuthConsumerSecret"];
    OAuthAPIVersion     = AuthData["OAuthAPIVersion"];

    HashingMethod       = OAuthAlgorithm + "-" + OAuthHashFunction;
    CurrentDate         = OPI_Tools.GetCurrentDate();
    AuthorizationHeader = "";
    SignatureString     = "";
    Signature           = "";

    CurrentUNIXDate = OPI_Tools.UNIXTime(CurrentDate);
    CurrentUNIXDate = OPI_Tools.NumberToString(CurrentUNIXDate);

    ParametersTable = New ValueTable;
    ParametersTable.Columns.Add("Key");
    ParametersTable.Columns.Add("Value");

    If GetSetting("BodyFieldsAtOAuth") Then

        AddLog("AddOAuthV1Header: adding body fields to the signature string");

        GuaranteeBodyCollection();

        For Each Field In RequestBodyCollection Do

            CurrentValue = Field.Value;

            If TypeOf(CurrentValue) = Type("BinaryData") Then
                Continue;
            Else
                OPI_TypeConversion.GetLine(CurrentValue);
            EndIf;

            NewLine       = ParametersTable.Add();
            NewLine.Key   = Field.Key;
            NewLine.Value = CurrentValue;

        EndDo;
    EndIf;

    If ValueIsFilled(RequestURLParams) Then

        AddLog("AddOAuthV1Header: adding URL parameters to the signature string");

        For Each URLParameter In RequestURLParams Do

            NewLine       = ParametersTable.Add();
            NewLine.Key   = URLParameter.Key;
            NewLine.Value = URLParameter.Value;

        EndDo;

    EndIf;

    AddLog("AddOAuthV1Header: updating the signature string with credentials");

    NewLine       = ParametersTable.Add();
    NewLine.Key   = "oauth_consumer_key";
    NewLine.Value = OAuthConsumerKey;

    NewLine       = ParametersTable.Add();
    NewLine.Key   = "oauth_token";
    NewLine.Value = OAuthToken;

    NewLine       = ParametersTable.Add();
    NewLine.Key   = "oauth_version";
    NewLine.Value = OAuthAPIVersion;

    NewLine       = ParametersTable.Add();
    NewLine.Key   = "oauth_signature_method";
    NewLine.Value = HashingMethod;

    NewLine       = ParametersTable.Add();
    NewLine.Key   = "oauth_timestamp";
    NewLine.Value = CurrentUNIXDate;

    NewLine       = ParametersTable.Add();
    NewLine.Key   = "oauth_nonce";
    NewLine.Value = CurrentUNIXDate;

    For Each TableRow In ParametersTable Do

        TableRow.Key   = EncodeString(TableRow.Key, StringEncodingMethod.URLencoding);
        TableRow.Value = EncodeString(TableRow.Value, StringEncodingMethod.URLencoding);

    EndDo;

    ParametersTable.Sort("Key");

    For Each TableRow In ParametersTable Do

        SignatureString = SignatureString
            + TableRow.Key

            + "="
            + TableRow.Value
            + "&";

    EndDo;

    SignatureString = Left(SignatureString, StrLen(SignatureString) - 1);
    SignatureString = Upper(RequestMethod)
        + "&"
        + EncodeString(RequestURL     , StringEncodingMethod.URLencoding)
        + "&"
        + EncodeString(SignatureString, StringEncodingMethod.URLencoding);

    Signature = EncodeString(OAuthConsumerSecret, StringEncodingMethod.URLencoding)
        + "&"
        + EncodeString(OAuthSecret, StringEncodingMethod.URLencoding);

    SignBD      = GetBinaryDataFromString(Signature);
    SignatureBD = GetBinaryDataFromString(SignatureString);

    AddLog("AddOAuthV1Header: ");

    Signature = OPI_Cryptography.CreateSignature(SignBD, SignatureBD, OAuthAlgorithm, OAuthHashFunction);
    Signature = EncodeString(Base64String(Signature), StringEncodingMethod.URLencoding);

    Delimiter = """,";

    AddLog("AddOAuthV1Header: authorization header creation");

    AuthorizationHeader = AuthorizationHeader
        + "OAuth "
        + "oauth_consumer_key=""" + OAuthConsumerKey + Delimiter

        + "oauth_token=""" + OAuthToken + Delimiter

        + "oauth_signature_method=""" + HashingMethod + Delimiter

        + "oauth_timestamp=""" + CurrentUNIXDate + Delimiter

        + "oauth_nonce=""" + CurrentUNIXDate + Delimiter

        + "oauth_version=""" + OAuthAPIVersion + Delimiter

        + "oauth_signature=" + Signature;

    Request.Headers.Insert("Authorization", AuthorizationHeader);

    Return ЭтотОбъект;

EndFunction

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

    OPI_Tools.DebugInfo(Text);

    Return ЭтотОбъект;

EndFunction

Function GetSetting(Val SettingKey)
    Return Settings[SettingKey];
EndFunction

Procedure SetSetting(Val SettingKey, Val Value)
    Settings[SettingKey] = Value;
EndProcedure

Procedure SetDefaultSettings()

    AddLog("SetDefaultSettings: configuration setting");

    Settings = New Structure;
    Settings.Insert("gzip"                 , True);
    Settings.Insert("SplitArrayParams"     , False);
    Settings.Insert("ArraysSquareBrackets" , False);
    Settings.Insert("URLencoding"          , True);
    Settings.Insert("EncodeRequestBody"    , "UTF-8");
    Settings.Insert("BodyFieldsAtOAuth"    , False);
    Settings.Insert("MaxAttempts"          , 0);
    Settings.Insert("MaxRedirects"         , 5);

EndProcedure

Procedure EncodeURLInURL(URL) Export

    Plug = StrTemplate("@#%1#@", String(New UUID));

    URL = StrReplace(URL, "&" , Plug);
    URL = EncodeString(URL, StringEncodingMethod.URLInURLEncoding);
    URL = StrReplace(URL, Plug, "&");

EndProcedure

Procedure GuaranteeBodyCollection()

    If Not ValueIsFilled(RequestBodyCollection)
        Or Not OPI_Tools.ThisIsCollection(RequestBodyCollection, True) Then

        Try
            RequestBodyCollection = RequestBody;
            OPI_TypeConversion.GetKeyValueCollection(RequestBodyCollection);
        Except
            RequestBodyCollection = New Structure;
        EndTry;

        RequestBodyCollection = ?(ValueIsFilled(RequestBodyCollection), RequestBodyCollection, New Structure);

    EndIf;

EndProcedure

Procedure ResetObjectFields()

    Request                = Undefined;
    Connection             = Undefined;
    Settings               = Undefined;
    Repeats                = Undefined;
    RequestURL             = Undefined;
    RequestServer          = Undefined;
    RequestPort            = Undefined;
    RequestAdress          = Undefined;
    RequestAdressFull      = Undefined;
    RequestSection         = Undefined;
    RequestProtected       = Undefined;
    RequestDomain          = Undefined;
    RequestMethod          = Undefined;
    RequestURLParams       = Undefined;
    RequestBody            = Undefined;
    RequestBodyCollection  = Undefined;
    RequestBodyCurrentSend = Undefined;
    RequestHeaders         = Undefined;
    RequestUser            = Undefined;
    RequestPassword        = Undefined;
    RequestTimeout         = Undefined;
    RequestProxy           = Undefined;
    RequestOutputFile      = Undefined;
    RequestBodyFile        = Undefined;
    RequestBodyStream      = Undefined;
    RequestReadBodyStream  = Undefined;
    RequestDataWriter      = Undefined;
    RequestDataReader      = Undefined;
    RequestDataType        = Undefined;
    RequestTypeSetManualy  = Undefined;
    RequestPartSize        = Undefined;
    BodyTemporaryFile      = Undefined;
    AuthType               = Undefined;
    AuthData               = Undefined;
    Response               = Undefined;
    ResponseStatusCode     = Undefined;
    ResponseHeaders        = Undefined;
    Multipart              = Undefined;
    Boundary               = Undefined;
    LineSeparator          = Undefined;

EndProcedure

#EndRegion

#EndRegion

// #EndIf

#Region Alternate

Function Инициализировать(Val URL = "") Export
	Return Initialize(URL);
EndFunction

Function УстановитьURL(Val URL) Export
	Return SetURL(URL);
EndFunction

Function УстановитьПараметрыURL(Val Значение) Export
	Return SetURLParams(Значение);
EndFunction

Function УстановитьФайлОтвета(Val Значение) Export
	Return SetResponseFile(Значение);
EndFunction

Function УстановитьТипДанных(Val Значение) Export
	Return SetDataType(Значение);
EndFunction

Function УстановитьПрокси(Val Настройки) Export
	Return SetProxy(Настройки);
EndFunction

Function УстановитьТаймаут(Val Значение) Export
	Return SetTimeout(Значение);
EndFunction

Function ПолучитьЛог(Val Строкой = False) Export
	Return GetLog(Строкой);
EndFunction

Function ИспользоватьКодировку(Val Кодировка) Export
	Return UseEncoding(Кодировка);
EndFunction

Function ИспользоватьСжатиеGzip(Val Флаг) Export
	Return UseGzipCompression(Флаг);
EndFunction

Function ИспользоватьПоляТелаВOAuth(Val Флаг) Export
	Return UseBodyFiledsAtOAuth(Флаг);
EndFunction

Function ИспользоватьКодированиеURL(Val Флаг) Export
	Return UseURLEncoding(Флаг);
EndFunction

Function МаксимумПопыток(Val Значение) Export
	Return MaxAttempts(Значение);
EndFunction

Function МаксимумПереадресаций(Val Значение) Export
	Return MaxRedirects(Значение);
EndFunction

Function РазделятьМассивыВURL(Val Флаг, Val КвадратныеСкобки = Undefined) Export
	Return SplitArraysInURL(Флаг, КвадратныеСкобки);
EndFunction

Function ВернутьНастройки(Val Отбор = Undefined) Export
	Return ReturnSettings(Отбор);
EndFunction

Function УстановитьДвоичноеТело(Val Данные, Val УстанавливатьПустое = False) Export
	Return SetBinaryBody(Данные, УстанавливатьПустое);
EndFunction

Function УстановитьСтроковоеТело(Val Данные, Val ЗаписатьBOM = False) Export
	Return SetStringBody(Данные, ЗаписатьBOM);
EndFunction

Function УстановитьJsonТело(Val Данные) Export
	Return SetJsonBody(Данные);
EndFunction

Function УстановитьFormТело(Val Данные) Export
	Return SetFormBody(Данные);
EndFunction

Function НачатьЗаписьТелаMultipart(ИспользоватьФайл = True, Val Вид = "form-data") Export
	Return StartMultipartBody(ИспользоватьФайл, Вид);
EndFunction

Function ДобавитьФайлMultipartFormData(Val ИмяПоля, Val ИмяФайла, Val Данные, Val ТипДанных = "") Export
	Return AddMultipartFormDataFile(ИмяПоля, ИмяФайла, Данные, ТипДанных);
EndFunction

Function ДобавитьПолеMultipartFormData(Val ИмяПоля, Val Значение) Export
	Return AddMultipartFormDataField(ИмяПоля, Значение);
EndFunction

Function ДобавитьДанныеRelated(Val Данные, Val ТипДанных, Val IDЧасти = "") Export
	Return AddDataAsRelated(Данные, ТипДанных, IDЧасти);
EndFunction

Function УстановитьЗаголовки(Val Значение, Val ПолнаяЗамена = False) Export
	Return SetHeaders(Значение, ПолнаяЗамена);
EndFunction

Function ДобавитьЗаголовок(Val Имя, Val Значение) Export
	Return AddHeader(Имя, Значение);
EndFunction

Function ДобавитьBasicАвторизацию(Val Пользователь, Val Пароль) Export
	Return AddBasicAuthorization(Пользователь, Пароль);
EndFunction

Function ДобавитьBearerАвторизацию(Val Токен) Export
	Return AddBearerAuthorization(Токен);
EndFunction

Function ДобавитьAWS4Авторизацию(Val AccessKey, Val SecretKey, Val Region, Val Service = "s3") Export
	Return AddAWS4Authorization(AccessKey, SecretKey, Region, Service);
EndFunction

Function ДобавитьOAuthV1Авторизацию(Val Token, Val Secret, Val ConsumerKey, Val ConsumerSecret, Val Версия) Export
	Return AddOAuthV1Authorization(Token, Secret, ConsumerKey, ConsumerSecret, Версия);
EndFunction

Function УстановитьАлгоритмOAuthV1(Val Алгоритм, Val ХешФункция) Export
	Return SetOAuthV1Algorithm(Алгоритм, ХешФункция);
EndFunction

Function ОбработатьЗапрос(Val Метод, Val ВыполнитьСразу = True) Export
	Return ProcessRequest(Метод, ВыполнитьСразу);
EndFunction

Function ВыполнитьЗапрос(Принудительно = False) Export
	Return ExecuteRequest(Принудительно);
EndFunction

Function ОтправитьДанныеЧастями(Val РазмерЧасти = 5242880, Val Метод = "PUT") Export
	Return SendDataInParts(РазмерЧасти, Метод);
EndFunction

Function ОтправитьЧасть(Val ПозицияНачала, Val КоличествоБайт, Val Метод = "PUT") Export
	Return SendPart(ПозицияНачала, КоличествоБайт, Метод);
EndFunction

Function ВернутьЗапрос(Принудительно = False) Export
	Return ReturnRequest(Принудительно);
EndFunction

Function ВернутьСоединение(Принудительно = False) Export
	Return ReturnConnection(Принудительно);
EndFunction

Function ВернутьОтвет(Val Принудительно = False, Val ИсключениеПриОшибке = False) Export
	Return ReturnResponse(Принудительно, ИсключениеПриОшибке);
EndFunction

Function ВернутьОтветКакJSONКоллекцию(Val ВСоответствие = True, Val ИсключениеПриОшибке = False) Export
	Return ReturnResponseAsJSONObject(ВСоответствие, ИсключениеПриОшибке);
EndFunction

Function ВернутьОтветКакДвоичныеДанные(Val Принудительно = False, Val ИсключениеПриОшибке = False) Export
	Return ReturnResponseAsBinaryData(Принудительно, ИсключениеПриОшибке);
EndFunction

Function ВернутьОтветКакСтроку(Val Принудительно = False, Val ИсключениеПриОшибке = False) Export
	Return ReturnResponseAsString(Принудительно, ИсключениеПриОшибке);
EndFunction

Function ВернутьИмяФайлаТелаОтвета(Val Принудительно = False, Val ИсключениеПриОшибке = False) Export
	Return ReturnResponseFilename(Принудительно, ИсключениеПриОшибке);
EndFunction

Procedure КодироватьURLВURL(URL) Export
	EncodeURLInURL(URL);
EndProcedure

#EndRegion