// OneScript: ./OInt/tests/Modules/OPIt_HTTP.os

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
//@skip-check use-non-recommended-method

#Use oint
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("HTTP");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("HTTP");

EndFunction

#Region Internal

#Region RunnableTests

#Region HTTP

Procedure HTTP_Initialization() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL" , TestParameters);

    HTTP_Initialize(TestParameters);
    HTTP_SetURL(TestParameters);
    HTTP_SetURLParams(TestParameters);
    HTTP_SetResponseFile(TestParameters);
    HTTP_SetDataType(TestParameters);
    HTTP_GetLog(TestParameters);
    HTTP_SetProxy(TestParameters);
    HTTP_SetTimeout(TestParameters);

EndProcedure

Procedure HTTP_BodySet() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTP_SetBinaryBody(TestParameters);
    HTTP_SetStringBody(TestParameters);
    HTTP_SetJsonBody(TestParameters);
    HTTP_SetFormBody(TestParameters);
    HTTP_StartMultipartBody(TestParameters);
    HTTP_AddMultipartFormDataField(TestParameters);
    HTTP_AddMultipartFormDataFile(TestParameters);
    HTTP_AddDataAsRelated(TestParameters);

EndProcedure

Procedure HTTP_Settings() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTP_UseEncoding(TestParameters);
    HTTP_UseGzipCompression(TestParameters);
    HTTP_UseBodyFiledsAtOAuth(TestParameters);
    HTTP_UseURLEncoding(TestParameters);
    HTTP_SplitArraysInURL(TestParameters);
    HTTP_MaxRedirects(TestParameters);
    HTTP_MaxAttempts(TestParameters);
    HTTP_ReturnSettings(TestParameters);

EndProcedure

Procedure HTTP_HeadersSetting() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);

    HTTP_SetHeaders(TestParameters);
    HTTP_AddHeader(TestParameters);

EndProcedure

Procedure HTTP_Authorization() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);

    HTTP_AddBasicAuthorization(TestParameters);
    HTTP_AddBearerAuthorization(TestParameters);
    HTTP_AddAWS4Authorization(TestParameters);
    HTTP_AddOAuthV1Authorization(TestParameters);
    HTTP_SetOAuthV1Algorithm(TestParameters);

EndProcedure

Procedure HTTP_RequestProcessing() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTP_ProcessRequest(TestParameters);
    HTTP_ExecuteRequest(TestParameters);
    HTTP_ReturnRequest(TestParameters);
    HTTP_ReturnConnection(TestParameters);
    HTTP_SendDataInParts(TestParameters);
    HTTP_SendPart(TestParameters);

EndProcedure

Procedure HTTP_ResponseReceiving() Export

    OPI_TestDataRetrieval.SetCLITestFlag(False);

    If OPI_TestDataRetrieval.IsCLITest() Then
        Message("CLI SKIP");
        Return;
    EndIf;

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTP_ReturnResponse(TestParameters);
    HTTP_ReturnResponseAsJSONObject(TestParameters);
    HTTP_ReturnResponseAsBinaryData(TestParameters);
    HTTP_ReturnResponseAsString(TestParameters);
    HTTP_ReturnResponseFilename(TestParameters);

EndProcedure

#EndRegion

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region HTTP

Procedure HTTP_Initialize(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "Initialize");

    HTTPClient = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .ProcessRequest("POST", False);

    OPI_TestDataRetrieval.Process(HTTPClient, "HTTP", "Initialize", "Check 1", FunctionParameters);

    AnotherRequest = HTTPClient.SetURL(FunctionParameters["HTTP_URL"] + "/post")
        .ProcessRequest("POST", False)
        .ReturnRequest();

    OPI_TestDataRetrieval.Process(AnotherRequest, "HTTP", "Initialize", "Check 2");

EndProcedure

Procedure HTTP_SetURL(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetURL");

    HTTPClient = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("POST", False);

    OPI_TestDataRetrieval.Process(HTTPClient, "HTTP", "SetURL", "Check", FunctionParameters);

EndProcedure

Procedure HTTP_SetURLParams(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ParametersStructure = New Structure("param1,param2", "text", 10);

    Result = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .SetURLParams(ParametersStructure) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetURLParams", , FunctionParameters);

    HTTPClient = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetURLParams(ParametersStructure)
        .ProcessRequest("POST", False);

    HTTPRequest = HTTPClient.ReturnRequest();

    OPI_TestDataRetrieval.Process(HTTPRequest, "HTTP", "SetURLParams", "Check");

    // Encoding check

    // Complex

    ParameterStructure1 = New Structure;
    ParameterStructure1.Insert("param1", "search?text");
    ParameterStructure1.Insert("param2", "John Doe");
    ParameterStructure1.Insert("param3", "value&another");
    ParameterStructure1.Insert("param4", "кириллица");
    ParameterStructure1.Insert("param5", "<script>alert('XSS')</script>");

    ResourceAddress1 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParameterStructure1)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    OPI_TestDataRetrieval.Process(ResourceAddress1, "HTTP", "SetURLParams", "Option 1");

    ParameterStructure2 = New Structure;
    ParameterStructure2.Insert("param1", "search?text");
    ParameterStructure2.Insert("param2", "John Doe");

    // Parameters in the original URL

    ResourceAddress2 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page?existing=value")
        .SetURLParams(ParameterStructure2)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    OPI_TestDataRetrieval.Process(ResourceAddress2, "HTTP", "SetURLParams", "Option 2");

    // Empty parameter string

    ParameterStructure3 = New Structure;
    ParameterStructure3.Insert("param1", "search?text");
    ParameterStructure3.Insert("param2", "John Doe");

    ResourceAddress3 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page?")
        .SetURLParams(ParameterStructure3)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    OPI_TestDataRetrieval.Process(ResourceAddress3, "HTTP", "SetURLParams", "Variant 3");

    // Special characters at path

    ParameterStructure4 = New Structure;
    ParameterStructure4.Insert("param1", "search?text");
    ParameterStructure4.Insert("param2", "John Doe");

    ResourceAddress4 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/path with spaces")
        .SetURLParams(ParameterStructure4)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    OPI_TestDataRetrieval.Process(ResourceAddress4, "HTTP", "SetURLParams", "Variant 4");

    // URL with a snippet

    ParameterStructure5 = New Structure;
    ParameterStructure5.Insert("param1", "search?text");
    ParameterStructure5.Insert("param2", "John Doe");

    ResourceAddress5 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page#section")
        .SetURLParams(ParameterStructure5)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    OPI_TestDataRetrieval.Process(ResourceAddress5, "HTTP", "SetURLParams", "Variant 5");

    // Cyrillic at path

    ParameterStructure6 = New Structure;
    ParameterStructure6.Insert("param1", "search?text");
    ParameterStructure6.Insert("param2", "John Doe");

    ResourceAddress6 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/путь")
        .SetURLParams(ParameterStructure6)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    OPI_TestDataRetrieval.Process(ResourceAddress6, "HTTP", "SetURLParams", "Variant 6");

    // Multiple parameters and encoding

    ParameterStructure7 = New Structure;
    ParameterStructure7.Insert("param1", "value1");
    ParameterStructure7.Insert("param2", "value two");
    ParameterStructure7.Insert("param3", "value<three>");

    ResourceAddress7 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParameterStructure7)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    OPI_TestDataRetrieval.Process(ResourceAddress7, "HTTP", "SetURLParams", "Variant 7");

EndProcedure

Procedure HTTP_SetResponseFile(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    TFN = GetTempFileName();

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetResponseFile(TFN) // <---
        .ProcessRequest("GET")
        .ReturnResponseFilename();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetResponseFile", , TFN);

    CheckResult = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetResponseFile(TFN) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsBinaryData();

    OPI_TestDataRetrieval.Process(CheckResult, "HTTP", "SetResponseFile", "Body", TFN);

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure HTTP_SetDataType(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    MIMEType = "text/markdown";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetStringBody("# Hello world!!")
        .SetDataType(MIMEType) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetDataType");

EndProcedure

Procedure HTTP_GetLog(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ParametersStructure = New Structure("param1,param2", "text", 10);

    HTTPClient = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .SetURLParams(ParametersStructure)
        .ProcessRequest("GET");

    Response = HTTPClient.ReturnResponseAsJSONObject();
    Log      = HTTPClient.GetLog(True);

    // END

    OPI_TestDataRetrieval.Process(Log, "HTTP", "GetLog");

EndProcedure

Procedure HTTP_SetBinaryBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetBinaryBody", , Image);

EndProcedure

Procedure HTTP_SetStringBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Text     = "Hello world!!";
    Encoding = "Windows-1251";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .UseEncoding(Encoding)
        .SetStringBody(Text) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetStringBody");

EndProcedure

Procedure HTTP_SetJsonBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    RandomArray = New Array;
    RandomArray.Add("A");
    RandomArray.Add("B");
    RandomArray.Add("C");

    Data = New Structure("Field1,Field2,Field3", 10, "Text", RandomArray);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetJsonBody(Data) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetJsonBody", , Data);

EndProcedure

Procedure HTTP_SetFormBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Data = New Structure("Field1,Field2", "10", "Text");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetFormBody(Data) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetFormBody", , Data);

EndProcedure

Procedure HTTP_StartMultipartBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody() // <---
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("Field1", "Text")
        .AddMultipartFormDataField("Field2", "10")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "StartMultipartBody", , Image);

EndProcedure

Procedure HTTP_AddMultipartFormDataFile(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png") // <---
        .AddMultipartFormDataField("Field1", "Text")
        .AddMultipartFormDataField("Field2", "10")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddMultipartFormDataFile", , Image);

EndProcedure

Procedure HTTP_AddMultipartFormDataField(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("Field1", "Text") // <---
        .AddMultipartFormDataField("Field2", "10") // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddMultipartFormDataField", , Image);

EndProcedure

Procedure HTTP_AddDataAsRelated(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    RandomArray = New Array;
    RandomArray.Add("A");
    RandomArray.Add("B");
    RandomArray.Add("C");

    Data = New Structure("Field1,Field2,Field3", 10, "Text", RandomArray);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody(True, "related")
        .AddDataAsRelated(Data, "application/json; charset=UTF-8") // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddDataAsRelated");

EndProcedure

Procedure HTTP_UseEncoding(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Text     = "Hello world!!";
    Encoding = "Windows-1251";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .UseEncoding(Encoding) // <---
        .SetStringBody(Text)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "UseEncoding");

EndProcedure

Procedure HTTP_UseGzipCompression(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .UseGzipCompression(False) // <---
        .ProcessRequest("POST", False)
        .ReturnRequest();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "UseGzipCompression");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .UseGzipCompression(True) // <---
        .ProcessRequest("POST", False)
        .ReturnRequest();

    OPI_TestDataRetrieval.Process(Result, "HTTP", "UseGzipCompression", "Enabled");

EndProcedure

Procedure HTTP_UseBodyFiledsAtOAuth(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Token       = "***";
    Secret      = "***";
    UsersKey    = "***";
    UsersSecret = "***";
    Version     = "1.0";

    NewRequest = OPI_HTTPRequests.NewRequest().Initialize(URL);

    Result = NewRequest
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("field1", "Text")
        .AddMultipartFormDataField("field2", "10")
        .UseBodyFiledsAtOAuth(False) // <---
        .AddOauthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    LogAsString = NewRequest.GetLog(True);
    OPI_TestDataRetrieval.Process(Result, "HTTP", "UseBodyFiledsAtOAuth", , LogAsString);

    Result = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("field1", "Text")
        .AddMultipartFormDataField("field2", "10")
        .UseBodyFiledsAtOAuth(True) // <---
        .AddOauthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .ProcessRequest("POST", False)
        .GetLog(True);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "UseBodyFiledsAtOAuth", "Enabled");

EndProcedure

Procedure HTTP_SetHeaders(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Headers = New Map;
    Headers.Insert("X-Header1", "Value1");
    Headers.Insert("X-Header2", "Value2");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetHeaders(Headers) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetHeaders");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("1111")
        .SetHeaders(Headers, True) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetHeaders", "Rewrite");

EndProcedure

Procedure HTTP_AddHeader(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddHeader("X-Header1", "Value1") // <---
        .AddHeader("X-Header2", "Value2") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddHeader");

    Headers = New Map;
    Headers.Insert("X-Header1", "Value1");
    Headers.Insert("X-Header2", "Value2");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("1111")
        .AddHeader("X-Header3", "BadValue") // <---
        .AddHeader("X-Header4", "BadValue")
        .SetHeaders(Headers, True) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddHeader", "Replace");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("1111")
        .AddHeader("X-Header3", "BadValue") // <---
        .AddHeader("X-Header4", "BadValue")
        .SetHeaders(Headers) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddHeader", "Addition");

EndProcedure

Procedure HTTP_AddBasicAuthorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBasicAuthorization("user", "password") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddBasicAuthorization");

EndProcedure

Procedure HTTP_AddBearerAuthorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("123123") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddBearerAuthorization");

EndProcedure

Procedure HTTP_AddAWS4Authorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    AccessKey = "AccessKey";
    SecretKey = "SecretKey";
    Region    = "Region";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddAWS4Authorization(AccessKey, SecretKey, Region) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddAWS4Authorization");

EndProcedure

Procedure HTTP_AddOAuthV1Authorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Token       = "***";
    Secret      = "***";
    UsersKey    = "***";
    UsersSecret = "***";
    Version     = "1.0";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .AddOAuthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "AddOAuthV1Authorization");

EndProcedure

Procedure HTTP_SetOAuthV1Algorithm(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Token       = "***";
    Secret      = "***";
    UsersKey    = "***";
    UsersSecret = "***";
    Version     = "1.0";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .AddOAuthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .SetOAuthV1Algorithm("HMAC", "SHA1") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetOAuthV1Algorithm");

EndProcedure

Procedure HTTP_ProcessRequest(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET") // <---
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ProcessRequest");

EndProcedure

Procedure HTTP_ExecuteRequest(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ExecuteRequest() // <---
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ExecuteRequest");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ReturnResponse(True);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ExecuteRequest", "No execution");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ExecuteRequest()
        .ReturnResponse(True);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ExecuteRequest", "Execution");

EndProcedure

Procedure HTTP_ReturnRequest(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ReturnRequest(); // <---

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnRequest");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ReturnRequest(True);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnRequest", "Forced");

EndProcedure

Procedure HTTP_ReturnConnection(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ReturnConnection(); // <---

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnConnection");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ReturnConnection(True);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnConnection", "Forced");

EndProcedure

Procedure HTTP_ReturnResponse(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponse(); // <---

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnResponse");

EndProcedure

Procedure HTTP_ReturnResponseAsJSONObject(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject(); // <---

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnResponseAsJSONObject");

EndProcedure

Procedure HTTP_ReturnResponseAsBinaryData(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponseAsBinaryData(); // <---

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnResponseAsBinaryData");

EndProcedure

Procedure HTTP_ReturnResponseAsString(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponseAsString(); // <---

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnResponseAsString");

EndProcedure

Procedure HTTP_ReturnResponseFilename(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    TFN = GetTempFileName();

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetResponseFile(TFN) // <---
        .ProcessRequest("GET")
        .ReturnResponseFilename();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnResponseFilename", , TFN);

    OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure HTTP_SetProxy(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ProxySettings = New InternetProxy;
    ProxySettings.Set("https", "proxy.com", 443, "user", "password", False);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetProxy(ProxySettings) // <---
        .ProcessRequest("GET", False)
        .ReturnConnection();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetProxy");

EndProcedure

Procedure HTTP_SetTimeout(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetTimeout(60) // <---
        .ProcessRequest("GET", False)
        .ReturnConnection();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SetTimeout");

EndProcedure

Procedure HTTP_UseURLEncoding(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ParametersStructure = New Structure;
    ParametersStructure.Insert("param1", "search?text");
    ParametersStructure.Insert("param2", "John Doe");
    ParametersStructure.Insert("param3", "value&another");
    ParametersStructure.Insert("param4", "кириллица");
    ParametersStructure.Insert("param5", "<script>alert('XSS')</script>");

    NoEncoding = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .UseURLEncoding(False) // <---
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    WithEncoding = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    // END

    Result = New Map;
    Result.Insert("No encoding"   , NoEncoding);
    Result.Insert("With encoding" , WithEncoding);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "UseURLEncoding");

EndProcedure

Procedure HTTP_SplitArraysInURL(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ArrayParam = New Array;
    ArrayParam.Add("val1");
    ArrayParam.Add("val2");
    ArrayParam.Add("val3");

    ParametersStructure = New Structure("arrayfield", ArrayParam);

    Separation = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .SplitArraysInURL(True) // <---
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    SeparationPhp = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .SplitArraysInURL(True, True) // <---
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    NoSeparation = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    // END

    Result = New Map;
    Result.Insert("No separation", NoSeparation);
    Result.Insert("Separation"   , Separation);
    Result.Insert("PHP"          , SeparationPhp);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SplitArraysInURL");

EndProcedure

Procedure HTTP_SendDataInParts(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/put";

    ChunkSize = 524288;
    Image     = FunctionParameters["Picture"]; // URL, Path or Binary data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .SendDataInParts(ChunkSize) // <---
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SendDataInParts");

EndProcedure

Procedure HTTP_SendPart(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/put";

    ChunkSize = 524288;
    Data      = GetBinaryDataFromString("Some data for sending");

    // Sending only "data for"
    StartPosition = 5;
    Bytes = 8;

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Data)
        .SendPart(StartPosition, Bytes) // <---
        .ReturnResponseAsJSONObject();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "SendPart");

EndProcedure

Procedure HTTP_MaxAttempts(FunctionParameters)

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .MaxAttempts(10)
        .ReturnSettings();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "MaxAttempts");

EndProcedure

Procedure HTTP_MaxRedirects(FunctionParameters)

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .MaxRedirects(15)
        .ReturnSettings();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "MaxRedirects");

EndProcedure

Procedure HTTP_ReturnSettings(FunctionParameters)

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .ReturnSettings();

    // END

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnSettings");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .ReturnSettings("EncodeRequestBody");

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnSettings", "Single");

    SettingArray = New Array;
    SettingArray.Add("MaxAttempts");
    SettingArray.Add("MaxRedirects");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .MaxAttempts(5)
        .ReturnSettings(SettingArray);

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnSettings", "Array");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .ReturnSettings("AAA");

    OPI_TestDataRetrieval.Process(Result, "HTTP", "ReturnSettings", "Nonexistent");

EndProcedure

#EndRegion

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure HTTP_Инициализация() Export
    HTTP_Initialization();
EndProcedure

Procedure HTTP_УстановкаТела() Export
    HTTP_BodySet();
EndProcedure

Procedure HTTP_Настройки() Export
    HTTP_Settings();
EndProcedure

Procedure HTTP_УстановкаЗаголовков() Export
    HTTP_HeadersSetting();
EndProcedure

Procedure HTTP_Авторизация() Export
    HTTP_Authorization();
EndProcedure

Procedure HTTP_ОбработкаЗапроса() Export
    HTTP_RequestProcessing();
EndProcedure

Procedure HTTP_ПолучениеОтвета() Export
    HTTP_ResponseReceiving();
EndProcedure

#EndRegion