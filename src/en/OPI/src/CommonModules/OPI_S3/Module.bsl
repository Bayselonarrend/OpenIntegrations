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
//@skip-check constructor-function-return-section

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
// ExpectedBinary - Boolean - Disables an attempt to convert the response to JSON - binary
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function SendRequestWithoutBody(Val Method
    , Val BasicData
    , Val ExpectedBinary = False
    , Val Headers = Undefined) Export

    Response = SendRequest(Method, BasicData, , ExpectedBinary, Headers);
    Return Response;

EndFunction

// Send request with body
// Send http request with body
//
// Parameters:
// Method - String - HTTP method - method
// BasicData - Structure of KeyAndValue - Basic request data (with full URL). See GetBasicDataStructure - basic
// Body - String, BinaryData - Binary data or file of request body data - body
// ExpectedBinary - Boolean - Disables an attempt to convert the response to JSON - binary
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function SendRequestWithBody(Val Method
    , Val BasicData
    , Val Body
    , Val ExpectedBinary = False
    , Val Headers = Undefined) Export

    Response = SendRequest(Method, BasicData, Body, ExpectedBinary, Headers);
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
// Structure of KeyAndValue - serialized JSON response from storage
Function CreateBucket(Val Name, Val BasicData, Val Directory = False, Val Headers = Undefined) Export

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
// Structure of KeyAndValue - serialized JSON response from storage
Function DeleteBucket(Val Name, Val BasicData, Val Directory = False, Val Headers = Undefined) Export

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
// Structure of KeyAndValue - serialized JSON response from storage
Function HeadBucket(Val Name
    , Val BasicData
    , Val Directory = False
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
// Structure of KeyAndValue - serialized JSON response from storage
Function PutBucketEncryption(Val Name
    , Val BasicData
    , Val XmlConfig
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(XmlConfig, True);
    XmlConfig = GetBinaryDataFromString(XmlConfig);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?encryption";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData_, XmlConfig, , Headers);

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
// Structure of KeyAndValue - serialized JSON response from storage
Function GetBucketEncryption(Val Name
    , Val BasicData
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);

    URL = URL + "?encryption";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

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
// Structure of KeyAndValue - serialized JSON response from storage
Function DeleteBucketEncryption(Val Name
    , Val BasicData
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);

    URL = URL + "?encryption";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("DELETE", BasicData_, , Headers);

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
// Structure of KeyAndValue - serialized JSON response from storage
Function PutBucketTagging(Val Name
    , Val BasicData
    , Val Tags
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    Tags    = FormTagsStructure(Tags);
    TagsXML = OPI_Tools.GetXML(Tags, "http://s3.amazonaws.com/doc/2006-03-01/");
    TagsXML = GetBinaryDataFromString(TagsXML);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?tagging";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData_, TagsXML, , Headers);

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
// Structure of KeyAndValue - serialized JSON response from storage
Function GetBucketTagging(Val Name
    , Val BasicData
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?tagging";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

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
// Structure of KeyAndValue - serialized JSON response from storage
Function DeleteBucketTagging(Val Name
    , Val BasicData
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?tagging";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("DELETE", BasicData_, , Headers);

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
// Structure of KeyAndValue - serialized JSON response from storage
Function PutBucketVersioning(Val Name
    , Val BasicData
    , Val Status = Undefined
    , Val MFADelete = Undefined
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    Tags    = FormVersioningStructure(Status, MFADelete);
    TagsXML = OPI_Tools.GetXML(Tags, "http://s3.amazonaws.com/doc/2006-03-01/");
    TagsXML = GetBinaryDataFromString(TagsXML);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?versioning";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData_, TagsXML, , Headers);

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
// Structure of KeyAndValue - serialized JSON response from storage
Function GetBucketVersioning(Val Name
    , Val BasicData
    , Val Directory = False
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);
    URL = URL + "?versioning";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

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
// Prefix - String - Filtering by prefix, if necessary - prefix
// Region - String - Selection by bucket region, if necessary - region
// PageToken - String - Page token if pagination is used - ctoken
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function ListBuckets(Val BasicData
    , Val Prefix = ""
    , Val Region = ""
    , Val PageToken = ""
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    Parameters = New Map;
    OPI_Tools.AddField("bucket-region"     , Region   , "String", Parameters);
    OPI_Tools.AddField("continuation-token", PageToken, "String", Parameters);
    OPI_Tools.AddField("max-buckets"       , 250      , "String", Parameters);
    OPI_Tools.AddField("prefix"            , Prefix   , "String", Parameters);

    URL = GetServiceURL(BasicData_);
    URL = URL + OPI_Tools.RequestParametersToString(Parameters);

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region ObjectsManagment

// Put object
// Uploads the file to the bucket
//
// Note
// Method at AWS documentation: [PutObject](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
// You can use the `ChunkSize` field in the basic data to specify the minimum file and chunk size for a chunked upload
// For example, ChunkSize=X means that all files larger than X (in bytes) will be downloaded in chunks, where one chunk will be of size X.
// Chunk upload is used for large files. Default ChunkSize - 20971520 bytes (20 MB)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// Entity - String, BinaryData - File path or binary data of the object - data
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function PutObject(Val Name
    , Val Bucket
    , Val Entity
    , Val BasicData
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    FillObjectURL(BasicData_, Name, Bucket);
    ProcessRequestBody(Entity);

    FileSize    = GetContentSize(Entity);
    MinPartSize = FileSize / 10000;
    MinPartSize = Max(MinPartSize, 5242880);

    If OPI_Tools.CollectionFieldExists(BasicData_, "ChunkSize") Then
        MaxSize = BasicData_["ChunkSize"];
    Else
        MaxSize = 20971520;
    EndIf;

    If MinPartSize > MaxSize Then
        Raise "ChunkSize is too small. It is necessary to increase the chunk size (minimum for this file - "
            + OPI_Tools.NumberToString(Round(MinPartSize + 0,5))
            + ")";
    EndIf;

    If FileSize > MaxSize Then

        Sizes    = New Structure("object,chunk", FileSize, MaxSize);
        Response = UploadObjectInParts(BasicData_, Entity, Headers, Sizes);

    Else

        Response = UploadFullObject(BasicData_, Entity, Headers);

    EndIf;

    Return Response;

EndFunction

// Head object
// Receives information about the properties of the object in the baquette
//
// Note
// Object metadata is contained in the headers
// Method at AWS documentation: [GetObjectAttributes](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket in which the object is stored - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for receiving a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function HeadObject(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = Undefined
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    FillObjectURL(BasicData_, Name, Bucket, Version);

    Response             = SendRequestWithoutBody("HEAD", BasicData_, , Headers);
    Response["response"] = New Structure;

    Return Response;

EndFunction

// Get object
// Gets the contents of the object from the bucket
//
// Note
// Method at AWS documentation: [GetObjectAttributes](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
// You can use the `ChunkSize` field in the basic data to specify the minimum file and chunk size for a chunked upload
// For example, ChunkSize=X means that all files larger than X (in bytes) will be downloaded in chunks, where one chunk will be of size X.
// Chunk upload is used for large files. Default ChunkSize - 20971520 bytes (20 MB)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket in which the object is stored - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for receiving a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// SavePath - String - Path to directly write a file to disk - out
//
// Returns:
// BinaryData, String - object content or file path, if a save path is specified
Function GetObject(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = ""
    , Val Headers = Undefined
    , Val SavePath = "") Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    ObjectInfo = HeadObject(Name, Bucket, BasicData_, Version);

    If OPI_Tools.CollectionFieldExists(BasicData_, "ChunkSize") Then
        MaxSize = BasicData_["ChunkSize"];
    Else
        MaxSize = 20971520;
    EndIf;

    If Not OPI_Tools.CollectionFieldExists(ObjectInfo, "headers.Content-Length") Then
        Return ObjectInfo;
    EndIf;

    ObjectSize = ObjectInfo["headers"]["Content-Length"];
    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetNumber(MaxSize);
    OPI_TypeConversion.GetNumber(ObjectSize);
    FillObjectURL(BasicData_, Name, Bucket, Version);

    If ObjectSize > MaxSize Then

        Sizes    = New Structure("object,chunk", ObjectSize, MaxSize);
        Response = GetObjectInChunks(BasicData_, Headers, SavePath, Sizes);

    Else

        Response = GetFullObject(BasicData_, Headers, SavePath);

    EndIf;

    Return Response;

EndFunction

// Delete object
// Removes the object from the bucket
//
// Note
// Method at AWS documentation: [DeleteObject](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for deleting a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function DeleteObject(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = Undefined
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, False);
    URL = URL + Name;

    If ValueIsFilled(Version) Then

        OPI_TypeConversion.GetLine(Version);
        URL = URL + "?versionId=" + Version;

    EndIf;

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("DELETE", BasicData_, , Headers);

    Return Response;

EndFunction

// Copy object
// Copies an object from one location to another
//
// Note
// Method at AWS documentation: [CopyObject](@docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html)
//
// Parameters:
// SourcePath - String - Path (name) in the source bucket - sname
// DestinationBucket - String - Source bucket name - sbucket
// DestinationPath - String - Path (name) in the destination bucket - name
// SourceBucket - String - Destination bucket name - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function CopyObject(Val SourcePath
    , Val DestinationBucket
    , Val DestinationPath
    , Val SourceBucket
    , Val BasicData
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(SourcePath);
    OPI_TypeConversion.GetLine(DestinationBucket);

    Source = DestinationBucket + "/" + SourcePath;
    Source = ?(StrStartsWith(Source, "/"), Source, "/" + Source);

    SourceHeader = New Map();
    SourceHeader.Insert("x-amz-copy-source", Source);
    AddAdditionalHeaders(Headers, SourceHeader);

    FillObjectURL(BasicData_, DestinationPath, SourceBucket);

    Response = UploadFullObject(BasicData_, Undefined, Headers);

    Return Response;

EndFunction

// Put object tagging
// Sets the tag set of the object
//
// Note
// Setting up a new set removes all existing object tags
// Method at AWS documentation: [PutObjectTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html)
//
// Parameters:
// Name - String - Object name - name
// Bucket - String - Bucket name - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Tags - Structure of KeyAndValue - Set of tags (key and value) - tagset
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function PutObjectTagging(Val Name
    , Val Bucket
    , Val BasicData
    , Val Tags
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);

    Tags    = FormTagsStructure(Tags);
    TagsXML = OPI_Tools.GetXML(Tags, "http://s3.amazonaws.com/doc/2006-03-01/");
    TagsXML = GetBinaryDataFromString(TagsXML);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, False);
    URL = URL + Name + "?tagging";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData_, TagsXML, , Headers);

    Return Response;

EndFunction

// Get object tagging
// Gets the tag set of the object
//
// Note
// Method at AWS documentation: [GetObjectTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html)
//
// Parameters:
// Name - String - Object name - name
// Bucket - String - Bucket name - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for retrieving data of a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function GetObjectTagging(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = ""
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Version);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, False);
    URL = URL + Name + "?tagging";

    If ValueIsFilled(Version) Then
        URL = URL + "&versionId=" + Version;
    EndIf;

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

    Return Response;

EndFunction

// Delete object tagging
// Deletes an objects tag set
//
// Note
// Method at AWS documentation: [DeleteObjectTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjectTagging.html)
//
// Parameters:
// Name - String - Object name - name
// Bucket - String - Bucket name - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for deleting data of a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function DeleteObjectTagging(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = ""
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Version);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, False);
    URL = URL + Name + "?tagging";

    If ValueIsFilled(Version) Then
        URL = URL + "&versionId=" + Version;
    EndIf;

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("DELETE", BasicData_, , Headers);

    Return Response;

EndFunction

// List objects
// Gets the list of objects in the selected bucket
//
// Note
// Method at AWS documentation: [ListObjectsV2](@docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html)
//
// Parameters:
// Bucket - String - Bucket name - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Prefix - String - Filtering by prefix, if necessary - prefix
// PageToken - String - Page token if pagination is used - ctoken
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function ListObjects(Val Bucket
    , Val BasicData
    , Val Prefix = ""
    , Val PageToken = ""
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, False);

    Parameters = New Map;
    OPI_Tools.AddField("list-type"         , 2        , "String", Parameters);
    OPI_Tools.AddField("max-keys"          , 250      , "String", Parameters);
    OPI_Tools.AddField("continuation-token", PageToken, "String", Parameters);
    OPI_Tools.AddField("prefix"            , Prefix   , "String", Parameters);

    URL = URL + OPI_Tools.RequestParametersToString(Parameters);
    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

    Return Response;

EndFunction

// List object versions
// Gets a list of all versions of objects in the selected bucket
//
// Note
// Method at AWS documentation: [ListObjectVersions](@docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectVersions.html)
//
// Parameters:
// Bucket - String - Bucket name - bucket
// BasicData - Structure of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Prefix - String - Filtering by prefix, if necessary - prefix
// Version - String - Version ID for the beginning of the list - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure of KeyAndValue - serialized JSON response from storage
Function ListObjectVersions(Val Bucket
    , Val BasicData
    , Val Prefix = ""
    , Val Version = ""
    , Val Headers = Undefined) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, False);
    URL = URL + "?versions";

    Parameters = New Map;
    OPI_Tools.AddField("max-keys"         , 250     , "String", Parameters);
    OPI_Tools.AddField("version-id-marker", Version , "String", Parameters);
    OPI_Tools.AddField("prefix"           , Prefix  , "String", Parameters);

    URL = URL + OPI_Tools.RequestParametersToString(Parameters, , False);
    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

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
    Request.Headers.Insert("Host"      , Connection.Host);

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

Function SendRequest(Val Method
    , Val BasicData
    , Val Body           = Undefined
    , Val ExpectedBinary = False
    , Val Headers        = Undefined)

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    CheckBasicData(BasicData_);

    URL = BasicData_["URL"];

    URLStructure = OPI_Tools.SplitURL(URL);
    Host         = URLStructure["Host"];
    Address      = URLStructure["Address"];
    Safe         = URLStructure["Safe"];

    Request    = OPI_Tools.CreateRequest(Address);
    Connection = OPI_Tools.CreateConnection(Host, Safe);

    If ValueIsFilled(Body) Then
        SetRequestBody(Request, Body);
    EndIf;

    AddAdditionalHeaders(Request, Headers);

    AuthorizationHeader = CreateAuthorizationHeader(BasicData_, Request, Connection, Method);
    Request.Headers.Insert("Authorization", AuthorizationHeader);

    Response = OPI_Tools.ExecuteRequest(Request, Connection, Method, , True);
    Response = FormResponse(Response, ExpectedBinary);

    Return Response;

EndFunction

Function BucketManagment(Val Name, Val BasicData, Val Directory, Val Method, Val Headers)

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Name, Directory);

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody(Method, BasicData_, , Headers);

    Return Response;

EndFunction

Function GetObjectInChunks(Val BasicData
    , Val Headers
    , Val SavePath
    , Val Sizes)

    TotalSize  = Sizes["object"];
    ChunkSize  = Sizes["chunk"];
    HeaderTemplate = "bytes=%1-%2";
    ChunkStart = 0;

    HeadersArray = New Array;

    WHile ChunkStart < TotalSize - ChunkSize Do

        ChunkEnd = ChunkStart + ChunkSize - 1;

        StartStr = OPI_Tools.NumberToString(ChunkStart);
        EndStr   = OPI_Tools.NumberToString(ChunkEnd);

        Title = StrTemplate(HeaderTemplate, StartStr, EndStr);
        HeadersArray.Add(New Structure("Title,Item", Title, EndStr));

        ChunkStart = ChunkEnd + 1;

    EndDo;

    If ChunkStart < TotalSize Then

        Title = "bytes=" + OPI_Tools.NumberToString(ChunkStart) + "-";

        DataStructure = New Structure("Title,Item", Title, TotalSize);
        HeadersArray.Add(DataStructure);

    EndIf;

    If ValueIsFilled(SavePath) Then
        StreamOfFile = New FileStream(SavePath, FileOpenMode.Create);
    Else
        StreamOfFile = New MemoryStream();
    EndIf;

    FileWriter = New DataWriter(StreamOfFile);

    For Each CurrentSet In HeadersArray Do

        For N = 1 To 3 Do

            Try

                ChunkHeader     = CurrentSet["Title"];
                CurrentPosition = CurrentSet["Item"];

                SourceHeader = New Map();
                SourceHeader.Insert("Range", ChunkHeader);
                AddAdditionalHeaders(Headers, SourceHeader);

                InterimResult = GetFullObject(BasicData, SourceHeader);
                FileWriter.Write(InterimResult);

                // !OInt KB = 1024;
                // !OInt MB = KB * KB;
                // !OInt Message(OPI_Tools.ProgressInfo(CurrentPosition, TotalSize, "MB", MB));

                // !OInt RunGarbageCollection();
                // !OInt FreeObject(InterimResult);

                Break;

            Except

                If N = 3 Then

                    // !OInt Message(ErrorDescription());
                    Raise "Failed to retrieve the file!";

                Else
                    // !OInt Message("Chunk upload error " + String(N) + "/3");
                    Continue;
                EndIf;

            EndTry;

        EndDo;

    EndDo;

    FileWriter.Close();

    If TypeOf(StreamOfFile) = Type("MemoryStream") Then
        Return StreamOfFile.CloseAndGetBinaryData();
    Else
        StreamOfFile.Close();
        ResponseFile        = New File(SavePath);
        Return ResponseFile.FullName;
    EndIf;

EndFunction

Function GetFullObject(Val BasicData
    , Val Headers
    , Val SavePath = "")

    Response = SendRequestWithoutBody("GET", BasicData, True, Headers);

    If ValueIsFilled(SavePath) Then
        Response.Write(SavePath);
        ResponseFile = New File(SavePath);
        Return ResponseFile.FullName;
    Else
        Return Response;
    EndIf;

EndFunction

Function UploadObjectInParts(Val BasicData, Val Entity, Val Headers, Val Sizes)

    OPI_TypeConversion.GetBinaryOrStream(Entity);

    UploadStart = InitPartsUpload(BasicData, Headers);

    FieldID    = "response.InitiateMultipartUploadResult.UploadId";
    UploadID   = Undefined;
    TotalSize  = Sizes["object"];
    ChunkSize  = Sizes["chunk"];
    BytesRead  = 0;
    PartNumber = 1;


    If Not OPI_Tools.CollectionFieldExists(UploadStart, FieldID, UploadID) Then
        Return UploadStart;
    EndIf;

    DataReader   = New DataReader(Entity);
    SourceStream = DataReader.SourceStream();
    Response     = New Map;
    TagsArray    = New Array;


    WHile BytesRead < TotalSize Do

        Try

            For N = 1 To 3 Do

                Result      = DataReader.Read(ChunkSize);
                CurrentData = Result.GetBinaryData();

                If CurrentData.Size() = 0 Then
                    Break;
                EndIf;

                Response = UploadObjectPart(BasicData, UploadID, PartNumber, CurrentData);

                If Response["status"] > 299 Then
                    Raise "The server returned the status " + String(Response["status"]);
                EndIf;

                BytesRead = SourceStream.CurrentPosition();
                TagsArray.Add(Response["headers"]["Etag"]);

                // !OInt KB = 1024;
                // !OInt MB = KB * KB;
                // !OInt Message(OPI_Tools.ProgressInfo(BytesRead, TotalSize, "MB", MB));

                // !OInt RunGarbageCollection();
                // !OInt FreeObject(CurrentData);

                Break;

            EndDo;

        Except

            If N = 3 Then

                // !OInt Message("Failed to upload part of the file! Aborted upload wiht ID:" + UploadID);
                // !OInt Message(OPI_Tools.JSONString(Response));

                Raise;

            Else

                // !OInt Message("Chunk upload error " + String(N) + "/3");
                Continue;

            EndIf;

        EndTry;

        PartNumber = PartNumber + 1;

    EndDo;

    Response = FinishPartsUpload(BasicData, UploadID, TagsArray);

    Return Response;

EndFunction

Function UploadFullObject(Val BasicData, Val Entity, Val Headers)

    Response = SendRequest("PUT", BasicData, Entity, , Headers);

    Return Response;

EndFunction

Function InitPartsUpload(Val BasicData, Val Headers)

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    BasicData_.Insert("URL", BasicData_["URL"] + "?uploads");

    Response = SendRequestWithoutBody("POST", BasicData_, , Headers);

    Return Response;

EndFunction

Function UploadObjectPart(Val BasicData, Val UploadID, Val PartNumber, Val Data)

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    Parameters = New Structure;
    OPI_Tools.AddField("partNumber", PartNumber, "String", Parameters);
    OPI_Tools.AddField("uploadId"  , UploadID  , "String", Parameters);

    ParameterString = OPI_Tools.RequestParametersToString(Parameters);

    BasicData_.Insert("URL", BasicData_["URL"] + ParameterString);

    Response = SendRequestWithBody("PUT", BasicData_, Data);

    Return Response;

EndFunction

Function FinishPartsUpload(Val BasicData, Val UploadID, Val TagsArray)

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    BasicData_.Insert("URL", BasicData_["URL"] + "?uploadId=" + String(UploadID));

    PartsArray = New Array;

    For N = 1 To TagsArray.Count() Do

        PartStructure = New Structure;
        PartStructure.Insert("ETag"      , TagsArray[N - 1]);
        PartStructure.Insert("PartNumber", N);

        PartsArray.Add(New Structure("Part", PartStructure));

    EndDo;

    FinishStructure = New Structure("CompleteMultipartUpload", PartsArray);
    FinishXML       = OPI_Tools.GetXML(FinishStructure, "http://s3.amazonaws.com/doc/2006-03-01/");
    FinishXML       = GetBinaryDataFromString(FinishXML);

    Response = SendRequestWithBody("POST", BasicData_, FinishXML);

    Return Response;

EndFunction

Function FormResponse(Val Response, Val ExpectedBinary = False)

    Status  = Response.StatusCode;
    Headers = Response.Headers;

    If Not ExpectedBinary Or Status > 299 Then

        ResponseData = New Structure;
        BodyData     = New Structure;

        ResponseBodyInitial    = Response.GetBodyAsString();
        ResponseBodyProcessing = TrimAll(ResponseBodyInitial);

        If ValueIsFilled(ResponseBodyProcessing) Then

            Try
                BodyData = OPI_Tools.ProcessXML(ResponseBodyProcessing);
            Except
                BodyData.Insert("notValidXMLMessage", ResponseBodyInitial);
            EndTry;

        EndIf;

        ResponseData = New Structure;
        ResponseData.Insert("status"  , Status);
        ResponseData.Insert("response", BodyData);
        ResponseData.Insert("headers" , Headers);

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

Function GetContentSize(Val Entity)

    If TypeOf(Entity) = Type("String") Then

        ContentFile = New File(Entity);
        Return ContentFile.Size();

    Else

        Return Entity.Size();

    EndIf;

EndFunction

Procedure ProcessRequestBody(Body)

    If TypeOf(Body) = Type("String") Then

        BodyFile = New File(Body);

        If BodyFile.Exists() Then
            Return;
        EndIf;

    EndIf;

    OPI_TypeConversion.GetBinaryData(Body);

EndProcedure

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

    ProcessRequestBody(Body);

    If TypeOf(Body) = Type("String") Then
        Request.SetBodyFileName(Body);
    Else
        Request.SetBodyFromBinaryData(Body);
    EndIf;

EndProcedure

Procedure FillObjectURL(BasicData, Name, Bucket, Version = "")

    OPI_TypeConversion.GetLine(Name);

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Bucket, False);
    URL = URL + Name;

    If ValueIsFilled(Version) Then

        OPI_TypeConversion.GetLine(Version);
        URL = URL + "?versionId=" + Version;

    EndIf;

    BasicData.Insert("URL", URL);

EndProcedure

#EndRegion

#EndRegion
