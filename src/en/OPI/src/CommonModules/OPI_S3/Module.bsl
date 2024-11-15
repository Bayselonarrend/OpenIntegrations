// OneScript: ./OInt/core/Modules/OPI_S3.os
// Lib: S3
// CLI: s3

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

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region Public

#Region CommonMethods

// Get basic data structure
// Returns the basic data for request in structured form
//
// Parameters:
// URL - String - URL: domain for common methods or full URL with parameters for methods of direct request sending - url
// AccessKey - String - Access key for authorization - access
// SecretKey - String - Secret key for authorization - secret
// Region - String - Service region - region
// Service - String - Type of service, if different from s3 - service
//
// Returns:
// Structure of KeyAndValue - Basic request data structure
Function GetBasicDataStructure(Val URL, Val AccessKey, Val SecretKey, Val Region, Val Service = "s3") Export

    AuthStructure = New Structure;
    OPI_Tools.AddField("URL"      , URL      , "String", AuthStructure);
    OPI_Tools.AddField("AccessKey", AccessKey, "String", AuthStructure);
    OPI_Tools.AddField("SecretKey", SecretKey, "String", AuthStructure);
    OPI_Tools.AddField("Region"   , Region   , "String", AuthStructure);
    OPI_Tools.AddField("Service"  , Service  , "String", AuthStructure);

    Return AuthStructure;

EndFunction

// Send request without body
// Sends a simple http request without a body
//
// Parameters:
// Method - String - HTTP method - method
// BasicData - Structure of KeyAndValue - Basic request data (with full URL). See GetBasicDataStructure - basic
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function SendRequestWithoutBody(Val Method, Val BasicData, Val Headers = Undefined) Export

    Response = SendRequest(Method, BasicData, , Headers);
    Return Response;

EndFunction

// Send request with body
// Send http request with body
//
// Parameters:
// Method - String - HTTP method - method
// BasicData - Structure of KeyAndValue - Basic request data (with full URL). See GetBasicDataStructure - basic
// Body - String, BinaryData - Binary data or file of request body data - body
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function SendRequestWithBody(Val Method, Val BasicData, Val Body, Val Headers = Undefined) Export

    Response = SendRequest(Method, BasicData, Body, Headers);
    Return Response;

EndFunction

#EndRegion

#Region BucketsManagment

// Create bucket
// Creates a new bucket with the specified name
//
// Note
// Method at AWS documentation: [CreateBucket](@docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function CreateBucket(Val Name, Val BasicData, Val Directory = True, Val Headers = Undefined) Export

    Response = BucketManagment(Name, BasicData, Directory, "PUT", Headers);
    Return Response;

EndFunction

// Delete bucket
// Deletes the bucket by name
//
// Note
// Method at AWS documentation: [DeleteBucket](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function DeleteBucket(Val Name, Val BasicData, Val Directory = True, Val Headers = Undefined) Export

    Response = BucketManagment(Name, BasicData, Directory, "DELETE", Headers);
    Return Response;

EndFunction

// Head bucket
// Checks if the bucket is available for the current account or account by ID
//
// Note
// Method at AWS documentation: [HeadBucket](@docs.aws.amazon.com/AmazonS3/latest/API/API_HeadBucket.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// AccountID - String - Account ID to verify that hes the bucket owner - account
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function HeadBucket(Val Name
    , Val BasicData
    , Val Directory = True
    , Val AccountID = ""
    , Val Headers = Undefined) Export

    OPI_TypeConversion.GetLine(AccountID);

    If ValueIsFilled(AccountID) Then
        AccountHeader = New Map();
        AccountHeader.Insert("x-amz-expected-bucket-owner", AccountID);
        AddAdditionalHeaders(Headers, AccountHeader);
    EndIf;

    Response = BucketManagment(Name, BasicData, Directory, "HEAD", Headers);
    Return Response;

EndFunction

// Put bucket encryption
// Sets bucket encryption by XML configuration
//
// Note
// Method at AWS documentation: [PutBucketEncryption](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// XmlConfig - String - XML string or file of encryption configuration - conf
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function PutBucketEncryption(Val Name
    , Val BasicData
    , Val XmlConfig
    , Val Directory = True
    , Val Headers = Undefined) Export

    OPI_TypeConversion.GetLine(XmlConfig, True);
    XmlConfig = GetBinaryDataFromString(XmlConfig);

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?encryption";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData, XmlConfig, Headers);

    Return Response;

EndFunction

// Get bucket encryption
// Gets the previously set bucket encryption configuration
//
// Note
// Method at AWS documentation: [GetBucketEncryption](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function GetBucketEncryption(Val Name
    , Val BasicData
    , Val Directory = True
    , Val Headers = Undefined) Export

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);

    URL = URL + "?encryption";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData, Headers);

    Return Response;

EndFunction

// Delete bucket encryption
// Deletes the bucket encryption configuration
//
// Note
// Method at AWS documentation: [DeleteBucketEncryption](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function DeleteBucketEncryption(Val Name
    , Val BasicData
    , Val Directory = True
    , Val Headers = Undefined) Export

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);

    URL = URL + "?encryption";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithoutBody("DELETE", BasicData, Headers);

    Return Response;

EndFunction

// Put bucket tagging
// Sets the tag set for the bucket
//
// Note
// Setting up a new set removes all existing bucket tags
// Method at AWS documentation: [PutBucketTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Tags - Structure of KeyAndValue - Set of tags (key and value) - tagset
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function PutBucketTagging(Val Name
    , Val BasicData
    , Val Tags
    , Val Directory = True
    , Val Headers = Undefined) Export

    Tags    = FormTagsStructure(Tags);
    TagsXML = OPI_Tools.GetXML(Tags, "http://s3.amazonaws.com/doc/2006-03-01/");
    TagsXML = GetBinaryDataFromString(TagsXML);

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?tagging";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData, TagsXML, Headers);

    Return Response;

EndFunction

// Get bucket tagging
// Gets the bucket tag set
//
// Note
// Method at AWS documentation: [GetBucketTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function GetBucketTagging(Val Name
    , Val BasicData
    , Val Directory = True
    , Val Headers = Undefined) Export

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?tagging";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData, Headers);

    Return Response;

EndFunction

// Delete bucket tagging
// Deletes the bucket tag set
//
// Note
// Method at AWS documentation: [DeleteBucketTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function DeleteBucketTagging(Val Name
    , Val BasicData
    , Val Directory = True
    , Val Headers = Undefined) Export

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?tagging";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithoutBody("DELETE", BasicData, Headers);

    Return Response;

EndFunction

// Put bucket versioning
// Sets the versioning settings for bucket objects
//
// Note
// Method at AWS documentation: [PutBucketVersioning](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Status - Boolean - Enable and disable versioning, if necessary - status
// MFADelete - Boolean - Enable and disable MFA deletion, if necessary - mfad
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function PutBucketVersioning(Val Name
    , Val BasicData
    , Val Status = Undefined
    , Val MFADelete = Undefined
    , Val Directory = True
    , Val Headers = Undefined) Export

    Tags    = FormVersioningStructure(Status, MFADelete);
    TagsXML = OPI_Tools.GetXML(Tags, "http://s3.amazonaws.com/doc/2006-03-01/");
    TagsXML = GetBinaryDataFromString(TagsXML);

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?versioning";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData, TagsXML, Headers);

    Return Response;

EndFunction

// Get bucket versioning
// Gets the values of versioning settings of objects in the bucket
//
// Note
// Method at AWS documentation: [GetBucketVersioning](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Directory Bucket, False > General Purpose Bucket - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function GetBucketVersioning(Val Name
    , Val BasicData
    , Val Directory = True
    , Val Headers = Undefined) Export

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?versioning";

    BasicData.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData, Headers);

    Return Response;

EndFunction

// List buckets
// Gets a list of buckets. It is possible to use filters if they are provided by your service
//
// Note
// Method at AWS documentation: [ListBuckets](@docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html)
//
// Parameters:
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Prefix - String - Filtering by the beginning of the name, if necessary - prefix
// Region - String - Selection by bucket region, if necessary - region
// PageToken - String - Page token if pagination is used - ctoken
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from storage
Function ListBuckets(Val BasicData
    , Val Prefix = ""
    , Val Region = ""
    , Val PageToken = ""
    , Val Headers = Undefined) Export

    Parameters = New Map;
    OPI_Tools.AddField("bucket-region"     , Region   , "String", Parameters);
    OPI_Tools.AddField("continuation-token", PageToken, "String", Parameters);
    OPI_Tools.AddField("max-buckets"       , 250      , "String", Parameters);
    OPI_Tools.AddField("prefix"            , Prefix   , "String", Parameters);

    URL = GetServiceURL(BasicData);
    URL = URL + OPI_Tools.RequestParametersToString(Parameters);

    BasicData.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData, Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region Authorization

Function CreateAuthorizationHeader(Val DataStructure, Val Request, Val Connection, Val Method)

    AccessKey = DataStructure["AccessKey"];
    SecretKey = DataStructure["SecretKey"];
    Region    = DataStructure["Region"];
    Service   = DataStructure["Service"];

    CurrentDate = CurrentUniversalDate();

    Request.Headers.Insert("x-amz-date", OPI_Tools.ISOTimestamp(CurrentDate));
    Request.Headers.Insert("Host"      , Connection.Server);

    SignKey          = GetSignatureKey(SecretKey, Region, Service, CurrentDate);
    CanonicalRequest = CreateCanonicalRequest(Request, Connection, Method);
    Scope            = CreateScope(Region, Service, CurrentDate);
    StringToSign     = CreateSignatureString(CanonicalRequest, Scope, CurrentDate);

    Signature = OPI_Cryptography.HMACSHA256(SignKey, StringToSign);
    Signature = Lower(GetHexStringFromBinaryData(Signature));

    HeadersKeys         = GetHeadersKeysString(Request);
    AuthorizationHeader = FormAuthorisationHeader(AccessKey, Scope, Signature, HeadersKeys);

    Return AuthorizationHeader;

EndFunction

Function GetSignatureKey(Val SecretKey, Val Region, Val Service, Val CurrentDate)

    SecretKey  = GetBinaryDataFromString("AWS4" + SecretKey);
    DateData = GetBinaryDataFromString(Format(CurrentDate, "DF=yyyyMMdd;"));
    Region     = GetBinaryDataFromString(Region);
    Service    = GetBinaryDataFromString(Service);
    AWSRequest = GetBinaryDataFromString("aws4_request");

    DataKey    = OPI_Cryptography.HMACSHA256(SecretKey, DateData);
    RegionKey  = OPI_Cryptography.HMACSHA256(DataKey, Region);
    ServiceKey = OPI_Cryptography.HMACSHA256(RegionKey, Service);

    FinalKey = OPI_Cryptography.HMACSHA256(ServiceKey, AWSRequest);

    Return FinalKey;

EndFunction

Function CreateCanonicalRequest(Val Request, Val Connection, Val Method)

    RequestBody = Request.GetBodyAsBinaryData();

    If Not ValueIsFilled(RequestBody) Then
        RequestBody = GetBinaryDataFromString("");
    EndIf;

    HashSum = OPI_Cryptography.Hash(RequestBody, HashFunction.SHA256);
    Request.Headers.Insert("x-amz-content-sha256", Lower(GetHexStringFromBinaryData(HashSum)));

    RequestTemplate = "";

    For N = 1 To 6 Do

        RequestTemplate = RequestTemplate + "%" + String(N) + ?(N = 6, "", Chars.LF);

    EndDo;

    Method          = Upper(Method);
    URIString       = GetURIString(Request);
    ParameterString = GetParamsString(Request);
    HeadersString   = GetHeadersString(Request);
    KeysString      = GetHeadersKeysString(Request);

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

    CanonicalRequest = GetBinaryDataFromString(CanonicalRequest);
    CanonicalRequest = OPI_Cryptography.Hash(CanonicalRequest, HashFunction.SHA256);
    CanonicalRequest = Lower(GetHexStringFromBinaryData(CanonicalRequest));

    For N = 1 To 4 Do

        StringTemplate = StringTemplate + "%" + String(N) + ?(N = 4, "", Chars.LF);

    EndDo;

    SignatureString = StrTemplate(StringTemplate, Algorithm, DateISO, Scope, CanonicalRequest);
    SignatureString = GetBinaryDataFromString(SignatureString);

    Return SignatureString;

EndFunction

Function GetURIString(Val Request)

    URI = Request.ResourceAddress;
    URI = ?(StrStartsWith(URI, "/"), URI, "/" + URI);

    ParamsStart = StrFind(URI, "?");

    If ParamsStart <> 0 Then
        URI = Left(URI, ParamsStart - 1);
    EndIf;

    Return URI;

EndFunction

Function GetParamsString(Request)

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

Function GetHeadersString(Val Request)

    HeadersList = New ValueList;
    Headers     = Request.Headers;

    For Each Title In Headers Do

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

Function GetHeadersKeysString(Val Request)

    HeadersList = New ValueList;
    Headers     = Request.Headers;

    For Each Title In Headers Do

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

Function GetServiceURL(BasicData)

    OPI_TypeConversion.GetCollection(BasicData);

    If TypeOf(BasicData) = Type("Array") Then
        Raise "Error of obtaining authorization data from the structure";
    EndIf;

    URL = BasicData["URL"];

    OPI_TypeConversion.GetLine(URL);

    If Not StrEndsWith(URL, "/") Then
        URL = URL + "/";
    EndIf;

    Return URL;

EndFunction

Function FormAuthorisationHeader(Val AccessKey, Val Scope, Val Signature, Val HeadersKeys)

    HeaderTemplate = "AWS4-HMAC-SHA256 "
        + "Credential=%1/%2, "
        + "SignedHeaders=%3, "
        + "Signature=%4";

    AuthorizationHeader = StrTemplate(HeaderTemplate, AccessKey, Scope, HeadersKeys, Signature);

    Return AuthorizationHeader;

EndFunction

Procedure ProcessRequestParametersString(ParameterString)

    ParameterArray = StrSplit(ParameterString, "&");
    ParamsList     = New ValueList();
    ParamsList.LoadValues(ParameterArray);

    ParamsList.SortByValue();
    ParameterArray = ParamsList.UnloadValues();

    FinalParamsArray = New Array;

    For N = 0 To ParameterArray.UBound() Do

        QueryParameter = ParameterArray[N];

        If StrFind(QueryParameter, "=") = 0 Then
            ParameterArray[N] = QueryParameter + "=";
        EndIf;

    EndDo;

    ParameterString = StrConcat(ParameterArray, "&");

EndProcedure

#EndRegion

#Region Miscellaneous

Function SendRequest(Val Method, Val BasicData, Val Body = Undefined, Val Headers = Undefined)

    CheckBasicData(BasicData);

    URL = BasicData["URL"];

    URLStructure = OPI_Tools.SplitURL(URL);
    Server       = URLStructure["Server"];
    Address      = URLStructure["Address"];
    Safe         = URLStructure["Safe"];

    Request    = OPI_Tools.CreateRequest(Address);
    Connection = OPI_Tools.CreateConnection(Server, Safe);

    If ValueIsFilled(Body) Then
        SetRequestBody(Request, Body);
    EndIf;

    AddAdditionalHeaders(Request, Headers);

    AuthorizationHeader = CreateAuthorizationHeader(BasicData, Request, Connection, Method);
    Request.Headers.Insert("Authorization", AuthorizationHeader);

    Response = OPI_Tools.ExecuteRequest(Request, Connection, Method, , True);
    Response = FormResponse(Response);

    Return Response;

EndFunction

Function BucketManagment(Val Name, Val BasicData, Val Directory, Val Method, Val Headers)

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Name, Directory);

    BasicData.Insert("URL", URL);

    Response = SendRequestWithoutBody(Method, BasicData, Headers);

    Return Response;

EndFunction

Function FormResponse(Val Response, Val ExpectedBinary = False)

    Status = Response.StatusCode;

    If Not ExpectedBinary Or Status > 299 Then

        ResponseData = New Map;
        BodyData     = New Map;

        ResponseBody = Response.GetBodyAsString();
        ResponseBody = TrimAll(ResponseBody);

        If ValueIsFilled(ResponseBody) Then

            Try
                BodyData = OPI_Tools.ProcessXML(ResponseBody);
            Except
                BodyData.Insert("notValidXMLMessage", ResponseBody);
            EndTry;

        EndIf;

        ResponseData = New Map;
        ResponseData.Insert("status"  , Status);
        ResponseData.Insert("response", BodyData);

    Else
        ResponseData = Response.GetBodyAsBinaryData();
    EndIf;

    Return ResponseData;

EndFunction

Function FormBucketURL(Val URL, Val Name, Val Directory)

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetBoolean(Directory);

    If Directory Then
        URL = URL + Name;
    Else

        If StrFind(URL, "://") Then
            URL = StrReplace(URL, "://", "://" + Name + ".");
        Else
            URL = Name + "." + URL;
        EndIf;

    EndIf;

    If Not StrEndsWith(URL, "/") Then
        URL = URL + "/";
    EndIf;

    Return URL;

EndFunction

Function FormTagsStructure(Val Tags)

    ErrorText = "Incorrect tags format. Key-value collection is expected";
    OPI_TypeConversion.GetKeyValueCollection(Tags, ErrorText);

    TagsArray = New Array;

    For Each Tag In Tags Do

        TagStructure = New Structure;
        TagStructure.Insert("Key"  , String(Tag.Key));
        TagStructure.Insert("Value", String(Tag.Value));

        TagsArray.Add(New Structure("Tag", TagStructure));

    EndDo;

    FinalStructure = New Structure;
    TagsSet        = New Structure;

    TagsSet.Insert("TagSet", TagsArray);
    FinalStructure.Insert("Tagging", TagsSet);

    Return FinalStructure;

EndFunction

Function FormVersioningStructure(Val Status, Val MFADelete)

    SettingsStructure = New Structure;

    If ValueIsFilled(Status) Then

        OPI_TypeConversion.GetBoolean(Status);
        SettingsStructure.Insert("Status", ?(Status, "Enabled", "Suspended"));

    EndIf;

    If ValueIsFilled(MFADelete) Then

        OPI_TypeConversion.GetBoolean(MFADelete);
        SettingsStructure.Insert("MfaDelete", ?(MFADelete, "Enabled", "Disabled"));

    EndIf;

    FinalStructure = New Structure("VersioningConfiguration", SettingsStructure);

    Return FinalStructure;

EndFunction

Procedure CheckBasicData(BasicData)

    ErrorText = "Error of obtaining authorization data from the structure";
    OPI_TypeConversion.GetKeyValueCollection(BasicData, ErrorText);

    RequiredFieldsArray = New Array;
    RequiredFieldsArray.Add("AccessKey");
    RequiredFieldsArray.Add("SecretKey");
    RequiredFieldsArray.Add("Region");
    RequiredFieldsArray.Add("Service");
    RequiredFieldsArray.Add("URL");

    MissingFields = OPI_Tools.FindMissingCollectionFields(BasicData, RequiredFieldsArray);

    If MissingFields.Count() > 0 Then
        Raise "The required authorization data is missing: " + StrConcat(MissingFields, ", ");
    EndIf;

EndProcedure

Procedure AddAdditionalHeaders(Receiver, Val Headers)

    If Not ValueIsFilled(Headers) Then
        Return;
    EndIf;

    ReceiverType = TypeOf(Receiver);
    ErrorText    = "Error setting additional headers";
    OPI_TypeConversion.GetKeyValueCollection(Headers, ErrorText);

    If ReceiverType = Type("HTTPRequest") Then

        For Each Title In Headers Do
            Receiver.Headers.Insert(Title.Key, Title.Value);
        EndDo;

    Else

        If Not ValueIsFilled(Receiver) Then
            Receiver = New Map;
        Else
            OPI_TypeConversion.GetKeyValueCollection(Headers, ErrorText);
        EndIf;

        For Each Title In Headers Do
            Receiver.Insert(Title.Key, Title.Value);
        EndDo;

    EndIf;

EndProcedure

Procedure SetRequestBody(Request, Body)

    OPI_TypeConversion.GetBinaryData(Body);
    Request.SetBodyFromBinaryData(Body);

EndProcedure

#EndRegion

#EndRegion
