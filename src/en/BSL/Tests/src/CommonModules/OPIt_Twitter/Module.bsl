// OneScript: ./OInt/tests/Modules/OPIt_Twitter.os

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

// #Use oint
// #Use asserts
// #Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Twitter");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Twitter");

EndFunction

#Region Internal

#Region RunnableTests

#Region Twitter

Procedure TwitterAPI_AccountData() Export

    TestParameters = New Structure;

    Twitter_GetToken(TestParameters);
    Twitter_GetAuthorizationLink(TestParameters);
    // !DISABLED! Twitter_UpdateToken(TestParameters);

EndProcedure

Procedure TwitterAPI_Tweets() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GIF"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"   , TestParameters);

    Twitter_CreateTextTweet(TestParameters);
    Twitter_UploadAttachmentsArray(TestParameters);
    Twitter_CreateVideoTweet(TestParameters);
    Twitter_CreateImageTweet(TestParameters);
    Twitter_CreateGifTweet(TestParameters);
    Twitter_CreatePollTweet(TestParameters);
    Twitter_CreateCustomTweet(TestParameters);

EndProcedure

#EndRegion // Twitter

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

Function GetTwitterAuthData()

    Parameters = New Map;

    ServerToken = OPI_TestDataRetrieval.GetParameter("Access_Token");

    URL = OPI_TestDataRetrieval.GetParameter("Twitter_TokenURL");

    Result = OPI_HTTPRequests.NewRequest().Initialize().SetURL(URL).AddBearerAuthorization(
        ServerToken) // <---
    .ProcessRequest("GET").ReturnResponseAsJSONObject();

    Token = Result["data"];

    Parameters.Insert("redirect_uri"      , OPI_TestDataRetrieval.GetParameter("Twitter_Redirect"));
    Parameters.Insert("client_id"         , OPI_TestDataRetrieval.GetParameter("Twitter_ClientID"));
    Parameters.Insert("client_secret"     , OPI_TestDataRetrieval.GetParameter("Twitter_ClientSecret"));
    Parameters.Insert("access_token"      , Token);
    Parameters.Insert("refresh_token"     , OPI_TestDataRetrieval.GetParameter("Twitter_Refresh"));
    Parameters.Insert("oauth_token"       , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthToken"));
    Parameters.Insert("oauth_token_secret", OPI_TestDataRetrieval.GetParameter("Twitter_OAuthSecret"));

    Parameters.Insert("oauth_consumer_key"   , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthConsumerKey"));
    Parameters.Insert("oauth_consumer_secret", OPI_TestDataRetrieval.GetParameter(
        "Twitter_OAuthConsumerSecret"));

    Return Parameters;

EndFunction

#Region AtomicTests

#Region Twitter

Procedure Twitter_GetToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Code       = "123456";

    Result = OPI_Twitter.GetToken(Code, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "GetToken");

EndProcedure

Procedure Twitter_GetAuthorizationLink(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.GetAuthorizationLink(Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "GetAuthorizationLink");

EndProcedure

Procedure Twitter_RefreshToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.RefreshToken(Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "RefreshToken");

EndProcedure

Procedure Twitter_CreateTextTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateTextTweet", , Text);

EndProcedure

Procedure Twitter_CreateImageTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image  = FunctionParameters["Picture"]; // URL, Binary or File path
    Image2 = FunctionParameters["Picture2"]; // URL, Binary or File path

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(Image2);

    Result = OPI_Twitter.CreateImageTweet(Text, ImageArray, Parameters);

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateImageTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateImageTweet", "Single", Text);

    Image = OPI_HTTPRequests.Get(Image);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateImageTweet", "Binary", Text);

EndProcedure

Procedure Twitter_CreateVideoTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Video  = FunctionParameters["Video"]; // URL, Binary or File path
    Video2 = FunctionParameters["Video"]; // URL, Binary or File path

    VideosArray = New Array;
    VideosArray.Add(Video);
    VideosArray.Add(Video2);

    Result = OPI_Twitter.CreateVideoTweet(Text, VideosArray, Parameters);

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateVideoTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateVideoTweet", "Single", Text);

    Video = OPI_HTTPRequests.Get(Video);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateVideoTweet", "Binary", Text);

EndProcedure

Procedure Twitter_CreateGifTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    GIF  = FunctionParameters["GIF"]; // URL, Binary or File path
    Gif2 = FunctionParameters["GIF"]; // URL, Binary or File path

    GifsArray = New Array;
    GifsArray.Add(GIF);
    GifsArray.Add(Gif2);

    Result = OPI_Twitter.CreateGifTweet(Text, GifsArray, Parameters);

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateGifTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateGifTweet", "Single", Text);

    GIF = OPI_HTTPRequests.Get(GIF);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateGifTweet", "Binary", Text);

EndProcedure

Procedure Twitter_CreatePollTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    AnswersArray = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");

    Result = OPI_Twitter.CreatePollTweet(Text, AnswersArray, 60, Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreatePollTweet", , Text);

EndProcedure

Procedure Twitter_CreateCustomTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or File path
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or File path

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    MediaArray = OPI_Twitter.UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);
    Result     = OPI_Twitter.CreateCustomTweet(Text, MediaArray, , , Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "CreateCustomTweet", , Text);

EndProcedure

Procedure Twitter_UploadAttachmentsArray(FunctionParameters)

    Parameters = GetTwitterAuthData();

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or File path
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or File path

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Result = OPI_Twitter.UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "Twitter", "UploadAttachmentsArray");

EndProcedure

#EndRegion // Twitter

#EndRegion // AtomicTests

#EndRegion // Private
