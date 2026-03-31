// OneScript: ./OInt/tests/Modules/OPItc_S3.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use asserts
//#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("S3");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("S3");

EndFunction

#Region Internal

#Region RunnableTests

#Region S3

Procedure AWS_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetS3ParameterOptions();

    For Each TestParameters In OptionArray Do

        S3_GetBasicDataStructure(TestParameters);
        S3_SendRequestWithoutBody(TestParameters);
        S3_SendRequestWithBody(TestParameters);

   EndDo;

EndProcedure

Procedure AWS_BucketsManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetS3ParameterOptions();

    For Each TestParameters In OptionArray Do

        S3_CreateBucket(TestParameters);
        S3_ListBuckets(TestParameters);
        S3_HeadBucket(TestParameters);
        S3_PutBucketTagging(TestParameters);
        S3_GetBucketTagging(TestParameters);
        S3_DeleteBucketTagging(TestParameters);
        S3_PutBucketEncryption(TestParameters);
        S3_GetBucketEncryption(TestParameters);
        S3_DeleteBucketEncryption(TestParameters);
        S3_PutBucketVersioning(TestParameters);
        S3_GetBucketVersioning(TestParameters);
        S3_DeleteBucket(TestParameters);

    EndDo;

EndProcedure

Procedure AWS_ObjectsManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetS3ParameterOptions();

    For Each TestParameters In OptionArray Do

        S3_CreateBucket(TestParameters);
        S3_PutObject(TestParameters);
        S3_UploadFullObject(TestParameters);
        S3_InitPartsUpload(TestParameters);
        S3_UploadObjectPart(TestParameters);
        S3_FinishPartsUpload(TestParameters);
        S3_AbortMultipartUpload(TestParameters);
        S3_HeadObject(TestParameters);
        S3_CopyObject(TestParameters);
        S3_PutObjectTagging(TestParameters);
        S3_GetObjectTagging(TestParameters);
        S3_DeleteObjectTagging(TestParameters);
        S3_ListObjects(TestParameters);
        S3_ListObjectVersions(TestParameters);
        S3_GetObject(TestParameters);
        S3_GetObjectDownloadLink(TestParameters);
        S3_DeleteObject(TestParameters);
        S3_DeleteBucket(TestParameters);
        S3_GetObjectUploadLink(TestParameters);

    EndDo;

EndProcedure

#EndRegion // S3

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region S3

Procedure S3_GetBasicDataStructure(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetBasicDataStructure");

EndProcedure

Procedure S3_SendRequestWithoutBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"] + "/opi-newbucket2";
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);
    Method    = "GET";

    Options = New Structure;
    Options.Insert("method", Method);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "SendRequestWithoutBody", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "SendRequestWithoutBody");

EndProcedure

Procedure S3_SendRequestWithBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Method = "PUT";
    Body   = "C:\test_data\document.docx"; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("method", Method);
    Options.Insert("basic", BasicData);
    Options.Insert("body", Body);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "SendRequestWithBody", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "SendRequestWithBody");

EndProcedure

Procedure S3_CreateBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Result = OPI_S3.DeleteBucket(Name, BasicData, Directory); // SKIP
    OPI_TestDataRetrieval.Process(Result, "S3", "CreateBucket", "Deletion"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "CreateBucket", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "CreateBucket");

EndProcedure

Procedure S3_DeleteBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucket", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "DeleteBucket");

EndProcedure

Procedure S3_ListBuckets(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);
    Options = New Structure;
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListBuckets", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "ListBuckets");

EndProcedure

Procedure S3_HeadBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadBucket", Options);

    OPI_TestDataRetrieval.Process(Result, "S3", "HeadBucket"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);
    Options.Insert("account", "1234");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadBucket", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "HeadBucket", "Account");

EndProcedure

Procedure S3_GetBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketEncryption", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetBucketEncryption");

EndProcedure

Procedure S3_DeleteBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucketEncryption", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "DeleteBucketEncryption");

EndProcedure

Procedure S3_PutBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    XmlConfig = "<ServerSideEncryptionConfiguration xmlns=""http://s3.amazonaws.com/doc/2006-03-01/"">
                      | <Rule>
                      | <ApplyServerSideEncryptionByDefault>
                      | <SSEAlgorithm>AES256</SSEAlgorithm>
                      | </ApplyServerSideEncryptionByDefault>
                      | </Rule>
                      |</ServerSideEncryptionConfiguration>";

    TFN       = GetTempFileName("xml"); // SKIP
    GetBinaryDataFromString(XmlConfig).Write(TFN); // SKIP
    XmlConfig = TFN; // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("conf", XmlConfig);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketEncryption", Options);

    // END

    OPI_Tools.RemoveFileWithTry(XmlConfig, "Error deleting file after test");

    OPI_TestDataRetrieval.Process(Result, "S3", "PutBucketEncryption");

EndProcedure

Procedure S3_GetBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketTagging", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetBucketTagging");

EndProcedure

Procedure S3_PutBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    TagStructure = New Structure;
    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("tagset", TagStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketTagging", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "PutBucketTagging");

EndProcedure

Procedure S3_DeleteBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucketTagging", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "DeleteBucketTagging");

EndProcedure

Procedure S3_GetBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketVersioning", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetBucketVersioning");

EndProcedure

Procedure S3_PutBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);
    Status    = True;

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = FunctionParameters["S3_DB"];
    Name = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("status", Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketVersioning", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "PutBucketVersioning");

EndProcedure

Procedure S3_PutObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Name   = "picture.jpg";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data", Entity);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObject", Options);

    OPI_TestDataRetrieval.Process(Result, "S3", "PutObject"); // SKIP

    Name   = "fileChunked.mp3";
    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data

    BasicData.Insert("ChunkSize", 5242880); // Size parts for upload in multiple of requests

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data", Entity);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObject", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "PutObject", "ByParts");

    OPI_S3.DeleteObject(Name, Bucket, BasicData, , , Directory);

EndProcedure

Procedure S3_UploadFullObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "pictureSmall.jpg";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data", Entity);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "UploadFullObject", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "UploadFullObject");

    OPI_S3.DeleteObject(Name, Bucket, BasicData, , , Directory);

EndProcedure

Procedure S3_DeleteObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteObject", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "DeleteObject");

EndProcedure

Procedure S3_HeadObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadObject", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "HeadObject");

EndProcedure

Procedure S3_CopyObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    SourcePath        = "picture.jpg";
    DestinationBucket = "newbucket2";

    DestinationPath = "new_picture.jpg";
    SourceBucket    = FunctionParameters["S3_DB"];
    SourceBucket    = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("sname", SourcePath);
    Options.Insert("sbucket", DestinationBucket);
    Options.Insert("name", DestinationPath);
    Options.Insert("bucket", SourceBucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "CopyObject", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "CopyObject");

    OPI_S3.DeleteObject(DestinationPath, SourceBucket, BasicData, , , Directory);

EndProcedure

Procedure S3_PutObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    TagStructure = New Structure;

    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("tagset", TagStructure);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObjectTagging", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "PutObjectTagging");

EndProcedure

Procedure S3_GetObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectTagging", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObjectTagging");

EndProcedure

Procedure S3_DeleteObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteObjectTagging", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "DeleteObjectTagging");

EndProcedure

Procedure S3_ListObjects(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListObjects", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "ListObjects");

EndProcedure

Procedure S3_ListObjectVersions(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Prefix = "pic";
    Options = New Structure;
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("prefix", Prefix);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListObjectVersions", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "ListObjectVersions");

EndProcedure

Procedure S3_GetObject(FunctionParameters)

    Image        = FunctionParameters["Picture"]; // SKIP
    OPI_TypeConversion.GetBinaryData(Image); // SKIP
    RequiredSize = Image.Size(); // SKIP

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObject", , RequiredSize); // SKIP

    TempFile = GetTempFileName();
    BasicData.Insert("ChunkSize", 200000);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("out", TempFile);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObject", "File", RequiredSize);

    Name   = "bigfile.exe";
    Bucket = "newbucket2";

    BigTempFile = GetTempFileName();
    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("out", BigTempFile);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObject", "Big file", 34432400);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObject", "Big BD", 34432400);

    OPI_Tools.RemoveFileWithTry(BigTempFile, "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(TempFile   , "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure S3_InitPartsUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OPI_TestDataRetrieval.Process(Result, "S3", "InitPartsUpload"); // SKIP

    UploadID   = Result["response"]["InitiateMultipartUploadResult"]["UploadId"];
    TotalSize  = Entity.Size();
    ChunkSize  = 5242880;
    BytesRead  = 0;
    PartNumber = 1;

    DataReader   = New DataReader(Entity);
    SourceStream = DataReader.SourceStream();
    TagsArray    = New Array;

    While BytesRead < TotalSize Do

        CurrentReading = DataReader.Read(ChunkSize);
        CurrentData    = CurrentReading.GetBinaryData();

        If CurrentData.Size() = 0 Then
            Break;
        EndIf;

        Result = OPI_S3.UploadObjectPart(Name
            , Bucket
            , BasicData
            , UploadID
            , PartNumber
            , CurrentData
            , Directory);

        OPI_TestDataRetrieval.Process(Result, "S3", "InitPartsUpload", "Part"); // SKIP

        BytesRead = SourceStream.CurrentPosition();

        ETag = Result["headers"]["Etag"];
        ETag = ?(ETag = Undefined, Result["headers"]["ETag"], ETag);

        TagsArray.Add(ETag);

        PartNumber = PartNumber + 1;

    EndDo;

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("tags", TagsArray);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "FinishPartsUpload", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "InitPartsUpload", "Completion");

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_FinishPartsUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);

    OPI_TestDataRetrieval.Process(Result, "S3", "FinishPartsUpload", "Start"); // SKIP

    UploadID   = Result["response"]["InitiateMultipartUploadResult"]["UploadId"];
    TotalSize  = Entity.Size();
    ChunkSize  = 5242880;
    BytesRead  = 0;
    PartNumber = 1;

    DataReader   = New DataReader(Entity);
    SourceStream = DataReader.SourceStream();
    TagsArray    = New Array;

    While BytesRead < TotalSize Do

        CurrentReading = DataReader.Read(ChunkSize);
        CurrentData    = CurrentReading.GetBinaryData();

        If CurrentData.Size() = 0 Then
            Break;
        EndIf;

        Result = OPI_S3.UploadObjectPart(Name
            , Bucket
            , BasicData
            , UploadID
            , PartNumber
            , CurrentData
            , Directory);

        OPI_TestDataRetrieval.Process(Result, "S3", "FinishPartsUpload", "Part"); // SKIP

        BytesRead = SourceStream.CurrentPosition();

        ETag = Result["headers"]["Etag"];
        ETag = ?(ETag = Undefined, Result["headers"]["ETag"], ETag);

        TagsArray.Add(ETag);

        PartNumber = PartNumber + 1;

    EndDo;

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("tags", TagsArray);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "FinishPartsUpload", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "FinishPartsUpload");

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_UploadObjectPart(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);

    OPI_TestDataRetrieval.Process(Result, "S3", "UploadObjectPart", "Start"); // SKIP

    UploadID   = Result["response"]["InitiateMultipartUploadResult"]["UploadId"];
    TotalSize  = Entity.Size();
    ChunkSize  = 5242880;
    BytesRead  = 0;
    PartNumber = 1;

    DataReader   = New DataReader(Entity);
    SourceStream = DataReader.SourceStream();
    TagsArray    = New Array;

    While BytesRead < TotalSize Do

        CurrentReading = DataReader.Read(ChunkSize);
        CurrentData    = CurrentReading.GetBinaryData();

        If CurrentData.Size() = 0 Then
            Break;
        EndIf;

        Result = OPI_S3.UploadObjectPart(Name
            , Bucket
            , BasicData
            , UploadID
            , PartNumber
            , CurrentData
            , Directory);

        // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

        OPI_TestDataRetrieval.Process(Result, "S3", "UploadObjectPart"); // SKIP

        BytesRead = SourceStream.CurrentPosition();

        ETag = Result["headers"]["Etag"];
        ETag = ?(ETag = Undefined, Result["headers"]["ETag"], ETag);

        TagsArray.Add(ETag);

        PartNumber = PartNumber + 1;

    EndDo;

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("tags", TagsArray);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "FinishPartsUpload", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "UploadObjectPart", "Completion"); // SKIP

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_AbortMultipartUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Start = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);
    UploadID = Start["response"]["InitiateMultipartUploadResult"]["UploadId"];

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "AbortMultipartUpload", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "AbortMultipartUpload");

EndProcedure

Procedure S3_GetObjectDownloadLink(FunctionParameters)

    Image        = FunctionParameters["Picture"]; // SKIP
    OPI_TypeConversion.GetBinaryData(Image); // SKIP
    RequiredSize = Image.Size(); // SKIP

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = FunctionParameters["S3_DB"];
    Bucket = ?(Directory, FunctionParameters["S3_DB"], FunctionParameters["S3_GPB"]); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("expires", 7200);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectDownloadLink", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObjectDownloadLink");

    Result = OPI_HTTPRequests.Get(Result);

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObjectDownloadLink", "Check", RequiredSize);

EndProcedure

Procedure S3_GetObjectUploadLink(FunctionParameters)

    Image        = FunctionParameters["Picture"]; // SKIP
    OPI_TypeConversion.GetBinaryData(Image); // SKIP
    RequiredSize = Image.Size(); // SKIP

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "pictureU.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "newbucket2";

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("expires", 7200);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectUploadLink", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObjectUploadLink");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(Result)
        .SetBinaryBody(Image)
        .ProcessRequest("PUT");

    OPI_TestDataRetrieval.Process(Result, "S3", "GetObjectUploadLink", "Upload");

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadObject", Options);

    OPI_TestDataRetrieval.Process(Check, "S3", "GetObjectUploadLink", "Check", RequiredSize);

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

#EndRegion // S3

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure AWS_ОбщиеМетоды() Export
    AWS_CommonMethods();
EndProcedure

Procedure AWS_РаботаСБакетами() Export
    AWS_BucketsManagement();
EndProcedure

Procedure AWS_РаботаСОбъектами() Export
    AWS_ObjectsManagement();
EndProcedure

#EndRegion
