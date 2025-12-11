// OneScript: ./OInt/core/Modules/OPI_S3.os
// Lib: S3
// CLI: s3
// Keywords: s3, minio, aws, simple storage service

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
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check constructor-function-return-section
//@skip-check bsl-legacy-check-expression-type

#Region Public

#Region CommonMethods

// Get basic data structure
// Returns the basic data for request in structured form
//
// Parameters:
// URL - String - URL: domain for common methods or full URL with parameters for direct request sending - url
// AccessKey - String - Access key for authorization - access
// SecretKey - String - Secret key for authorization - secret
// Region - String - Service region - region
// Service - String - Type of service, if different from s3 - service
//
// Returns:
// Structure Of KeyAndValue - Basic request data structure
Function GetBasicDataStructure(Val URL, Val AccessKey, Val SecretKey, Val Region, Val Service = "s3") Export

    String_ = "String";

    AuthStructure = New Structure;
    OPI_Tools.AddField("URL"      , URL      , String_, AuthStructure);
    OPI_Tools.AddField("AccessKey", AccessKey, String_, AuthStructure);
    OPI_Tools.AddField("SecretKey", SecretKey, String_, AuthStructure);
    OPI_Tools.AddField("Region"   , Region   , String_, AuthStructure);
    OPI_Tools.AddField("Service"  , Service  , String_, AuthStructure);

    Return AuthStructure;

EndFunction

// Send request without body
// Sends a simple http request without a body
//
// Parameters:
// Method - String - HTTP method - method
// BasicData - Structure Of KeyAndValue - Basic request data (with full URL). See GetBasicDataStructure - basic
// ExpectedBinary - Boolean - Disables an attempt to convert the response to JSON - binary
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// BasicData - Structure Of KeyAndValue - Basic request data (with full URL). See GetBasicDataStructure - basic
// Body - String, BinaryData - Binary data or file of request body data - body
// ExpectedBinary - Boolean - Disables an attempt to convert the response to JSON - binary
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function SendRequestWithBody(Val Method
    , Val BasicData
    , Val Body
    , Val ExpectedBinary = False
    , Val Headers = Undefined) Export

    Response = SendRequest(Method, BasicData, Body, ExpectedBinary, Headers);
    Return Response;

EndFunction

#EndRegion

#Region BucketsManagement

// Create bucket
// Creates a new bucket with the specified name
//
// Note:
// Method at AWS documentation: [CreateBucket](@docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function CreateBucket(Val Name, Val BasicData, Val Directory = False, Val Headers = Undefined) Export

    Response = BucketManagement(Name, BasicData, Directory, "PUT", Headers);
    Return Response;

EndFunction

// Delete bucket
// Deletes the bucket by name
//
// Note:
// Method at AWS documentation: [DeleteBucket](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function DeleteBucket(Val Name, Val BasicData, Val Directory = False, Val Headers = Undefined) Export

    Response = BucketManagement(Name, BasicData, Directory, "DELETE", Headers);
    Return Response;

EndFunction

// Head bucket
// Checks if the bucket is available for the current account or account by ID
//
// Note:
// Method at AWS documentation: [HeadBucket](@docs.aws.amazon.com/AmazonS3/latest/API/API_HeadBucket.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// AccountID - String - Account ID to verify that hes the bucket owner - account
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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

    Response = BucketManagement(Name, BasicData, Directory, "HEAD", Headers);
    Return Response;

EndFunction

// Put bucket encryption
// Sets bucket encryption by XML configuration
//
// Note:
// Method at AWS documentation: [PutBucketEncryption](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// XmlConfig - String - XML string or file of encryption configuration - conf
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Method at AWS documentation: [GetBucketEncryption](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Method at AWS documentation: [DeleteBucketEncryption](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Setting up a new set removes all existing bucket tags
// Method at AWS documentation: [PutBucketTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Tags - Structure Of KeyAndValue - Set of tags (key and value) - tagset
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Method at AWS documentation: [GetBucketTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Method at AWS documentation: [DeleteBucketTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketTagging.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Method at AWS documentation: [PutBucketVersioning](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketVersioning.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Status - Boolean - Enable and disable versioning, if necessary - status
// MFADelete - Boolean - Enable and disable MFA deletion, if necessary - mfad
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Method at AWS documentation: [GetBucketVersioning](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketVersioning.html)
//
// Parameters:
// Name - String - Bucket name - name
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
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
// Note:
// Method at AWS documentation: [ListBuckets](@docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html)
//
// Parameters:
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Prefix - String - Filtering by prefix, if necessary - prefix
// Region - String - Selection by bucket region, if necessary - region
// PageToken - String - Page token if pagination is used - ctoken
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function ListBuckets(Val BasicData
    , Val Prefix = ""
    , Val Region = ""
    , Val PageToken = ""
    , Val Headers = Undefined) Export

    String_ = "String";

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    Parameters = New Map;
    OPI_Tools.AddField("bucket-region"     , Region   , String_, Parameters);
    OPI_Tools.AddField("continuation-token", PageToken, String_, Parameters);
    OPI_Tools.AddField("max-buckets"       , 250      , String_, Parameters);
    OPI_Tools.AddField("prefix"            , Prefix   , String_, Parameters);

    URL = GetServiceURL(BasicData_);
    URL = URL + OPI_Tools.RequestParametersToString(Parameters);

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region ObjectsManagement

// Put object
// Uploads the file to the bucket
//
// Note:
// Method at AWS documentation (default): [PutObject](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)^
// Method at AWS documentation (multipart): [Multipart upload](@docs.aws.amazon.com/AmazonS3/latest/userguide/mpuoverview.html)
// You can use the `ChunkSize` field in the basic data to specify the minimum file and chunk size for a chunked upload.^^
// For example, `ChunkSize=X` means that all files larger than `X` (in bytes) will be downloaded in chunks, where one chunk will be of size `X`.^^
// Chunk upload is used for large files. Default `ChunkSize` - 20971520 bytes (20 MB)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// Entity - String, BinaryData - File path or binary data of the object - data
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function PutObject(Val Name
    , Val Bucket
    , Val Entity
    , Val BasicData
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetBinaryData(Entity);

    FileSize    = GetContentSize(Entity);
    Divider     = 10000;
    MinPartSize = FileSize / Divider;
    MinPartSize = Max(MinPartSize, 5242880);
    Half        = 0.5;

    If OPI_Tools.CollectionFieldExists(BasicData_, "ChunkSize") Then
        MaxSize = BasicData_["ChunkSize"];
        OPI_TypeConversion.GetNumber(MaxSize);
    Else
        MaxSize = 20971520;
    EndIf;

    If MinPartSize > MaxSize Then
        Raise "ChunkSize is too small. It is necessary to increase the chunk size (minimum for this file - "
            + OPI_Tools.NumberToString(Round(MinPartSize + Half))
            + ")";
    EndIf;

    If FileSize > MaxSize Then

        Sizes    = New Structure("object,chunk", FileSize, MaxSize);
        Response = UploadObjectInParts(Name, Bucket, Entity, BasicData_, Headers, Sizes, Directory);

    Else

        Response = UploadFullObject(Name, Bucket, Entity, BasicData_, Headers, Directory);

    EndIf;

    Return Response;

EndFunction

// Upload full object
// Upload object with single request
//
// Note:
// Method at AWS documentation: [PutObject](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
// This is a service method. A `PutObject` method is intended for the common scenario of files uploading^
// Using this method for large files may cause errors
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// Entity - String, BinaryData - File path or binary data of the object - data
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function UploadFullObject(Val Name
    , Val Bucket
    , Val Entity
    , Val BasicData
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    FillObjectURL(BasicData_, Name, Bucket, , Directory);

    Response = SendRequest("PUT", BasicData_, Entity, , Headers);

    Return Response;

EndFunction

// Init parts upload
// Initializes the multipart object uploading
//
// Note:
// Method at AWS documentation: [CreateMultipartUpload](@docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)
// This is a service method. A `PutObject` method is intended for the common scenario of files uploading^
// Using multipart upload for files < 5 MB or when the size of a single chunk is < 5 MB will result in an error
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function InitPartsUpload(Val Name
    , Val Bucket
    , Val BasicData
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    FillObjectURL(BasicData_, Name, Bucket, , Directory);

    BasicData_.Insert("URL", BasicData_["URL"] + "?uploads");

    Response = SendRequestWithoutBody("POST", BasicData_, , Headers);

    Return Response;

EndFunction

// Upload object part
// Uploads a part of an object for multipart uploading
//
// Note:
// Method at AWS documentation: [UploadPart](@docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)
// This is a service method. A `PutObject` method is intended for the common scenario of files uploading
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// UploadID - String - Upload ID. See InitPartsUpload - upload
// PartNumber - Number, String - Number of the object part from 1 to 10000 - part
// Data - BinaryData, String - Part content for uploading - content
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function UploadObjectPart(Val Name
    , Val Bucket
    , Val BasicData
    , Val UploadID
    , Val PartNumber
    , Val Data
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    FillObjectURL(BasicData_, Name, Bucket, , Directory);

    Parameters = New Structure;
    OPI_Tools.AddField("partNumber", PartNumber, "String", Parameters);
    OPI_Tools.AddField("uploadId"  , UploadID  , "String", Parameters);

    ParameterString = OPI_Tools.RequestParametersToString(Parameters);

    BasicData_.Insert("URL", BasicData_["URL"] + ParameterString);

    Response = SendRequestWithBody("PUT", BasicData_, Data);

    Return Response;

EndFunction

// Finish parts upload
// Confirms the multipart uploading finish
//
// Note:
// Method at AWS documentation: [CompleteMultipartUpload](@docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)
// This is a service method. A `PutObject` method is intended for the common scenario of files uploading
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// UploadID - String - Upload ID. See InitPartsUpload - upload
// TagsArray - Array Of String - An array of tags (Etag) from the uploads responses of each part - tags
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function FinishPartsUpload(Val Name
    , Val Bucket
    , Val BasicData
    , Val UploadID
    , Val TagsArray
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetArray(TagsArray);
    FillObjectURL(BasicData_, Name, Bucket, , Directory);

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

    Response = SendRequestWithBody("POST", BasicData_, FinishXML, , Headers);

    Return Response;

EndFunction

// Abort multipart upload
// Aborts the multipart uploading of the object
//
// Note:
// Method at AWS documentation: [AbortMultipartUpload](@docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)
// This is a service method. A `PutObject` method is intended for the common scenario of files uploading^
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// UploadID - String - Upload ID. See InitPartsUpload - upload
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function AbortMultipartUpload(Val Name
    , Val Bucket
    , Val BasicData
    , Val UploadID
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    FillObjectURL(BasicData_, Name, Bucket, , Directory);

    BasicData_.Insert("URL", BasicData_["URL"] + "?uploadId=" + String(UploadID));

    Response = SendRequestWithoutBody("DELETE", BasicData_, , Headers);

    Return Response;

EndFunction

// Head object
// Receives information about the properties of the object in the baquette
//
// Note:
// Object metadata is contained in the headers
// Method at AWS documentation: [GetObjectAttributes](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket in which the object is stored - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for receiving a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function HeadObject(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = Undefined
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    FillObjectURL(BasicData_, Name, Bucket, Version, Directory);

    Response             = SendRequestWithoutBody("HEAD", BasicData_, , Headers);
    Response["response"] = New Structure;

    Return Response;

EndFunction

// Get object
// Gets the contents of the object from the bucket
//
// Note:
// Method at AWS documentation: [GetObjectAttributes](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectAttributes.html)
// You can use the `ChunkSize` field in the basic data to specify the minimum file and chunk size for a chunked upload.^^
// For example, `ChunkSize=X` means that all files larger than `X` (in bytes) will be downloaded in chunks, where one chunk will be of size `X`.^^
// Chunk upload is used for large files. Default `ChunkSize` - 20971520 bytes (20 MB)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket in which the object is stored - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for receiving a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// SavePath - String - Path to directly write a file to disk - out
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// BinaryData, String - object content or file path, if a save path is specified
Function GetObject(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = ""
    , Val Headers = Undefined
    , Val SavePath = ""
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    ObjectInfo = HeadObject(Name, Bucket, BasicData_, Version, , Directory);

    If OPI_Tools.CollectionFieldExists(BasicData_, "ChunkSize") Then
        MaxSize = BasicData_["ChunkSize"];
        OPI_TypeConversion.GetNumber(MaxSize);
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
    FillObjectURL(BasicData_, Name, Bucket, Version, Directory);

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
// Note:
// Method at AWS documentation: [DeleteObject](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for deleting a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function DeleteObject(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = Undefined
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, Directory);
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
// Note:
// Method at AWS documentation: [CopyObject](@docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html)
//
// Parameters:
// SourcePath - String - Path (name) in the source bucket - sname
// DestinationBucket - String - Source bucket name - sbucket
// DestinationPath - String - Path (name) in the destination bucket - name
// SourceBucket - String - Destination bucket name - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function CopyObject(Val SourcePath
    , Val DestinationBucket
    , Val DestinationPath
    , Val SourceBucket
    , Val BasicData
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(SourcePath);
    OPI_TypeConversion.GetLine(DestinationBucket);

    Source = DestinationBucket + "/" + SourcePath;
    Source = ?(StrStartsWith(Source, "/"), Source, "/" + Source);

    SourceHeader = New Map();
    SourceHeader.Insert("x-amz-copy-source", Source);
    AddAdditionalHeaders(Headers, SourceHeader);

    Response = UploadFullObject(DestinationPath, SourceBucket, Undefined, BasicData_, Headers, Directory);

    Return Response;

EndFunction

// Put object tagging
// Sets the tag set of the object
//
// Note:
// Setting up a new set removes all existing object tags
// Method at AWS documentation: [PutObjectTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectTagging.html)
//
// Parameters:
// Name - String - Object name - name
// Bucket - String - Bucket name - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Tags - Structure Of KeyAndValue - Set of tags (key and value) - tagset
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function PutObjectTagging(Val Name
    , Val Bucket
    , Val BasicData
    , Val Tags
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);

    Tags    = FormTagsStructure(Tags);
    TagsXML = OPI_Tools.GetXML(Tags, "http://s3.amazonaws.com/doc/2006-03-01/");
    TagsXML = GetBinaryDataFromString(TagsXML);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, Directory);
    URL = URL + Name + "?tagging";

    BasicData_.Insert("URL", URL);

    Response = SendRequestWithBody("PUT", BasicData_, TagsXML, , Headers);

    Return Response;

EndFunction

// Get object tagging
// Gets the tag set of the object
//
// Note:
// Method at AWS documentation: [GetObjectTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_GetObjectTagging.html)
//
// Parameters:
// Name - String - Object name - name
// Bucket - String - Bucket name - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for retrieving data of a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function GetObjectTagging(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = ""
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Version);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, Directory);
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
// Note:
// Method at AWS documentation: [DeleteObjectTagging](@docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjectTagging.html)
//
// Parameters:
// Name - String - Object name - name
// Bucket - String - Bucket name - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Version - String - Token for deleting data of a specific version of an object - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function DeleteObjectTagging(Val Name
    , Val Bucket
    , Val BasicData
    , Val Version = ""
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Version);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, Directory);
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
// Note:
// Method at AWS documentation: [ListObjectsV2](@docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html)
//
// Parameters:
// Bucket - String - Bucket name - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Prefix - String - Filtering by prefix, if necessary - prefix
// PageToken - String - Page token if pagination is used - ctoken
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function ListObjects(Val Bucket
    , Val BasicData
    , Val Prefix = ""
    , Val PageToken = ""
    , Val Headers = Undefined
    , Val Directory = False) Export

    String_ = "String";

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, Directory);

    Parameters = New Map;
    OPI_Tools.AddField("list-type"         , 2        , String_, Parameters);
    OPI_Tools.AddField("max-keys"          , 250      , String_, Parameters);
    OPI_Tools.AddField("continuation-token", PageToken, String_, Parameters);
    OPI_Tools.AddField("prefix"            , Prefix   , String_, Parameters);

    URL = URL + OPI_Tools.RequestParametersToString(Parameters);
    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

    Return Response;

EndFunction

// List object versions
// Gets a list of all versions of objects in the selected bucket
//
// Note:
// Method at AWS documentation: [ListObjectVersions](@docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectVersions.html)
//
// Parameters:
// Bucket - String - Bucket name - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Prefix - String - Filtering by prefix, if necessary - prefix
// Version - String - Version ID for the beginning of the list - ver
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// Structure Of KeyAndValue - serialized JSON response from storage
Function ListObjectVersions(Val Bucket
    , Val BasicData
    , Val Prefix = ""
    , Val Version = ""
    , Val Headers = Undefined
    , Val Directory = False) Export

    String_ = "String";

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    URL = GetServiceURL(BasicData_);
    URL = FormBucketURL(URL, Bucket, Directory);
    URL = URL + "?versions";

    Parameters = New Map;
    OPI_Tools.AddField("max-keys"         , 250     , String_, Parameters);
    OPI_Tools.AddField("version-id-marker", Version , String_, Parameters);
    OPI_Tools.AddField("prefix"           , Prefix  , String_, Parameters);

    URL = URL + OPI_Tools.RequestParametersToString(Parameters, , False);
    BasicData_.Insert("URL", URL);

    Response = SendRequestWithoutBody("GET", BasicData_, , Headers);

    Return Response;

EndFunction

// Get object download link
// Get presigned link for object retrieving without authorization
//
// Note:
// In Headers you need to add all x-amz headers that will be used when accessing the received URL
// Process at AWS documentation: [Download and upload objects with presigned URLs](@docs.aws.amazon.com/AmazonS3/latest/userguide/using-presigned-url.html)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Expire - String, Number - Link lifetime in seconds. 604800 max. - expires
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// String - URL for object retrieving
Function GetObjectDownloadLink(Val Name
    , Val Bucket
    , Val BasicData
    , Val Expire = 3600
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    CheckBasicData(BasicData_);
    FillObjectURL(BasicData_, Name, Bucket, , Directory);

    Signature = CreateURLSignature(BasicData_, "GET", Expire, Headers);
    URL       = BasicData_["URL"] + Signature;

    Return URL;

EndFunction

// Get object upload link
// Gets a direct link to upload (put) an object without additional authorization
//
// Note:
// In Headers you need to add all x-amz headers that will be used when accessing the received URL
// Process at AWS documentation: [Download and upload objects with presigned URLs](@docs.aws.amazon.com/AmazonS3/latest/userguide/using-presigned-url.html)
//
// Parameters:
// Name - String - Name of the object in the bucket - name
// Bucket - String - Name of the bucket to put the object - bucket
// BasicData - Structure Of KeyAndValue - Basic request data. See GetBasicDataStructure - basic
// Expire - String, Number - Link lifetime in seconds. 604800 max. - expires
// Headers - Map Of KeyAndValue - Additional request headers, if necessary - headers
// Directory - Boolean - True > Path style URL, False > Virtual hosted style URL - dir
//
// Returns:
// String - URL for object retrieving
Function GetObjectUploadLink(Val Name
    , Val Bucket
    , Val BasicData
    , Val Expire = 3600
    , Val Headers = Undefined
    , Val Directory = False) Export

    BasicData_ = OPI_Tools.CopyCollection(BasicData);

    CheckBasicData(BasicData_);
    FillObjectURL(BasicData_, Name, Bucket, , Directory);

    Signature = CreateURLSignature(BasicData_, "PUT", Expire, Headers);
    URL       = BasicData_["URL"] + Signature;

    Return URL;

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region Authorization

Function CreateURLSignature(Val DataStructure, Val Method, Val Expire, Val Headers)

    AccessKey = DataStructure["AccessKey"];
    SecretKey = DataStructure["SecretKey"];
    Region    = DataStructure["Region"];
    Service   = DataStructure["Service"];
    URL       = DataStructure["URL"];

    SplitedURL = OPI_Tools.SplitURL(URL);

    Domain  = SplitedURL["Domain"];
    Address = SplitedURL["Address"];

    AdditionalHeaders = New Structure("Host", Domain);
    AddAdditionalHeaders(Headers, AdditionalHeaders);

    CurrentDate = CurrentUniversalDate();
    SignKey     = GetSignatureKey(SecretKey, Region, Service, CurrentDate);
    Scope       = CreateScope(Region, Service, CurrentDate);
    Timestamp   = OPI_Tools.ISOTimestamp(CurrentDate);
    HeadersKeys = GetHeadersKeysString(Headers);
    Base        = EncodeString(AccessKey + "/" + Scope, StringEncodingMethod.URLencoding);

    HeadersString = GetHeadersString(Headers);
    HashString    = "UNSIGNED-PAYLOAD";

    URLParameters = New ValueTable;

    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Algorithm"    , "AWS4-HMAC-SHA256");
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Credential"   , Base);
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Date"         , Timestamp);
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Expires"      , Expire);
    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-SignedHeaders", HeadersKeys);

    ParametersString = OPI_Tools.RequestParametersToString(URLParameters);
    ParametersString = Right(ParametersString, StrLen(ParametersString) - 1);
    RequestTemplate  = "";
    PartsAmount      = 6;

    For N = 1 To PartsAmount Do

        RequestTemplate = RequestTemplate + "%" + String(N) + ?(N = PartsAmount, "", Chars.LF);

    EndDo;

    CanonicalRequest = StrTemplate(RequestTemplate
        , Method
        , Address
        , ParametersString
        , HeadersString
        , HeadersKeys
        , HashString);

    StringToSign = CreateSignatureString(CanonicalRequest, Scope, CurrentDate);
    Signature    = OPI_Cryptography.HMAC(SignKey, StringToSign, "SHA256");
    Signature    = Lower(GetHexStringFromBinaryData(Signature));

    OPI_Tools.AddKeyValue(URLParameters, "X-Amz-Signature", Signature);

    URLSign = OPI_Tools.RequestParametersToString(URLParameters);

    Return URLSign;

EndFunction

Function GetSignatureKey(Val SecretKey, Val Region, Val Service, Val CurrentDate)

    SecretKey  = GetBinaryDataFromString("AWS4" + SecretKey);
    DateData = GetBinaryDataFromString(Format(CurrentDate, "DF=yyyyMMdd;"));
    Region     = GetBinaryDataFromString(Region);
    Service    = GetBinaryDataFromString(Service);
    AWSRequest = GetBinaryDataFromString("aws4_request");
    Sha256_    = "SHA256";

    DataKey    = OPI_Cryptography.HMAC(SecretKey, DateData, Sha256_);
    RegionKey  = OPI_Cryptography.HMAC(DataKey, Region, Sha256_);
    ServiceKey = OPI_Cryptography.HMAC(RegionKey, Service, Sha256_);

    FinalKey = OPI_Cryptography.HMAC(ServiceKey, AWSRequest, Sha256_);

    Return FinalKey;

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

Function GetHeadersString(Val Headers)

    HeadersList = New ValueList;

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

Function GetHeadersKeysString(Val Headers)

    HeadersList = New ValueList;

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

#EndRegion

#Region Miscellaneous

Function SendRequest(Val Method
    , Val BasicData
    , Val Body           = Undefined
    , Val ExpectedBinary = False
    , Val Headers        = Undefined)

    BasicData_ = OPI_Tools.CopyCollection(BasicData);
    CheckBasicData(BasicData_);

    AccessKey = BasicData_["AccessKey"];
    SecretKey = BasicData_["SecretKey"];
    Region    = BasicData_["Region"];
    Service   = BasicData_["Service"];
    URL       = BasicData_["URL"];

    Response = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetHeaders(Headers)
        .SetBinaryBody(Body)
        .AddAWS4Authorization(AccessKey, SecretKey, Region, Service)
        .ProcessRequest(Method);

    HTTPResponse = Response.ReturnResponse(False, True);
    ResponseBody = ?(ExpectedBinary
        , Response.ReturnResponseAsBinaryData(False, True)
        , Response.ReturnResponseAsString(False, True));

    Response = FormResponse(HTTPResponse, ResponseBody);

    Return Response;

EndFunction

Function BucketManagement(Val Name, Val BasicData, Val Directory, Val Method, Val Headers)

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
    Attempts   = 3;

    HeadersArray = New Array;

    While ChunkStart < TotalSize - ChunkSize Do

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

    StreamOfFile = OPI_Tools.CreateStream(SavePath);
    FileWriter   = New DataWriter(StreamOfFile);

    For Each CurrentSet In HeadersArray Do

        For N = 1 To Attempts Do

            Try

                ChunkHeader     = CurrentSet["Title"];
                CurrentPosition = CurrentSet["Item"];

                SourceHeader = New Map();
                SourceHeader.Insert("Range", ChunkHeader);
                AddAdditionalHeaders(Headers, SourceHeader);

                InterimResult = GetFullObject(BasicData, SourceHeader);
                FileWriter.Write(InterimResult);

                KBytes = 1024;
                MByte  = KBytes * KBytes;
                OPI_Tools.ProgressInformation(CurrentPosition, TotalSize, "MB", MByte);

                // !OInt RunGarbageCollection();
                // !OInt FreeObject(InterimResult);

                Break;

            Except

                If N = Attempts Then

                    // !OInt Message(ErrorDescription());
                    Raise "Failed to retrieve the file!!";

                Else
                    // !OInt Message("Chunk upload error " + String(N) + "/" + String(Attempts));
                    Continue;
                EndIf;

            EndTry;

        EndDo;

    EndDo;

    FileWriter.Close();

    ReceivedObject = CloseStreamReceiveData(StreamOfFile, SavePath);

    Return ReceivedObject;

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

Function UploadObjectInParts(Val Name
    , Val Bucket
    , Val Entity
    , Val BasicData
    , Val Headers
    , Val Sizes
    , Val Directory = "")

    OPI_TypeConversion.GetBinaryOrStream(Entity);

    UploadStart = InitPartsUpload(Name, Bucket, BasicData, Headers, Directory);

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

    Error           = False;
    Attempts        = 3;
    LastSuccessCode = 299;

    While BytesRead < TotalSize Do

        For N = 1 To Attempts Do

            Try

                Result      = DataReader.Read(ChunkSize);
                CurrentData = Result.GetBinaryData();

                If CurrentData.Size() = 0 Then
                    Break;
                EndIf;

                Response = UploadObjectPart(Name
                    , Bucket
                    , BasicData
                    , UploadID
                    , PartNumber
                    , CurrentData
                    , Directory);

                If Response["status"] > LastSuccessCode Then
                    Raise "The server returned the status " + String(Response["status"]);
                EndIf;

                BytesRead = SourceStream.CurrentPosition();

                ETag = Response["headers"]["Etag"];
                ETag = ?(ETag = Undefined, Response["headers"]["ETag"], ETag);

                TagsArray.Add(ETag);

                KBytes = 1024;
                MByte  = KBytes * KBytes;
                OPI_Tools.ProgressInformation(BytesRead, TotalSize, "MB", MByte);

                // !OInt RunGarbageCollection();
                // !OInt FreeObject(CurrentData);

                Break;

            Except

                If N = Attempts Then

                    // !OInt Message(OPI_Tools.JSONString(Response));
                    // !OInt Message("Failed to upload part of the file! Aborted upload wiht ID:" + UploadID + "...");

                    Error = True;
                    Break;

                Else

                    // !OInt Message("Chunk upload error " + String(N) + "/" + String(Attempts));
                    // !OInt Message(ErrorDescription());
                    Continue;

                EndIf;

            EndTry;

        EndDo;

        PartNumber = PartNumber + 1;

    EndDo;

    If Error Then
        Response = AbortMultipartUpload(Name, Bucket, BasicData, UploadID, , Directory);
    Else
        Response = FinishPartsUpload(Name, Bucket, BasicData, UploadID, TagsArray, , Directory);
    EndIf;

    Return Response;

EndFunction

Function FormResponse(Val Response, Val Body)

    Status          = Response.StatusCode;
    Headers         = Response.Headers;
    LastSuccessCode = 299;

    If TypeOf(Body) = Type("String") Or Status > LastSuccessCode Then

        ResponseData = New Structure;
        BodyData     = New Structure;

        ResponseBodyInitial    = ?(TypeOf(Body) = Type("String"), Body, Base64String(Body));
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
        ResponseData = Body;
    EndIf;

    Return ResponseData;

EndFunction

Function FormBucketURL(Val URL, Val Name, Val Directory)

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetBoolean(Directory);

    Indication = "://";

    If Directory Then
        URL = URL + Name;
    Else

        If StrFind(URL, Indication) Then
            URL = StrReplace(URL, Indication, Indication + Name + ".");
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

Function CloseStreamReceiveData(Val StreamOfFile, Val SavePath)

    If TypeOf(StreamOfFile) = Type("MemoryStream") Then
        Return StreamOfFile.CloseAndGetBinaryData();
    Else
        StreamOfFile.Close();
        ResponseFile        = New File(SavePath);
        Return ResponseFile.FullName;
    EndIf;

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
            OPI_TypeConversion.GetKeyValueCollection(Receiver, ErrorText);
        EndIf;

        For Each Title In Headers Do
            Receiver.Insert(Title.Key, Title.Value);
        EndDo;

    EndIf;

EndProcedure

Procedure FillObjectURL(BasicData, Name, Bucket, Version = "", Directory = False)

    OPI_TypeConversion.GetLine(Name);

    URL = GetServiceURL(BasicData);
    URL = FormBucketURL(URL, Bucket, Directory);
    URL = URL + Name;

    If ValueIsFilled(Version) Then

        OPI_TypeConversion.GetLine(Version);
        URL = URL + "?versionId=" + Version;

    EndIf;

    BasicData.Insert("URL", URL);

EndProcedure

#EndRegion

#EndRegion
