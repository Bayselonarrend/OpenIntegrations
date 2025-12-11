// OneScript: ./OInt/core/Modules/OPI_Twitter.os
// Lib: Twitter
// CLI: twitter
// Keywords: twitter, x

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
// If you don't know where to start, you should find the GetStandardParameters method()
// and read comments

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region DataAndSettings

// Get authorization link
// Forms a link for authorization via the browser
//
// Parameters:
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// String - URL for browser transition
Function GetAuthorizationLink(Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);

    URLParameters = New Structure;

    URLParameters.Insert("response_type"        , "code");
    URLParameters.Insert("client_id"            , Parameters_["client_id"]);
    URLParameters.Insert("redirect_uri"         , Parameters_["redirect_uri"]);
    URLParameters.Insert("scope"                , Parameters_["scope"]);
    URLParameters.Insert("state"                , "state");
    URLParameters.Insert("code_challenge"       , "challenge");
    URLParameters.Insert("code_challenge_method", "plain");

    URLParameters = OPI_Tools.RequestParametersToString(URLParameters);
    Link          = "https://twitter.com/i/oauth2/authorize" + URLParameters;

    Return Link;

EndFunction

// Get token
// Gets the token by the code received when authorizing using the link from GetAuthorizationLink
//
// Parameters:
// Code - String - Code obtained from authorization See GetAuthorizationLink - code
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function GetToken(Val Code, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Code);

    Parameters_ = GetStandardParameters(Parameters);

    RequestParameters = New Structure;
    RequestParameters.Insert("code"         , Code);
    RequestParameters.Insert("grant_type"   , "authorization_code");
    RequestParameters.Insert("client_id"    , Parameters_["client_id"]);
    RequestParameters.Insert("redirect_uri" , Parameters_["redirect_uri"]);
    RequestParameters.Insert("code_verifier", "challenge");

    Response = OPI_HTTPRequests.PostWithBody("https://api.twitter.com/2/oauth2/token"
        , RequestParameters
        ,
        , False);

    Return Response;

EndFunction

// Refresh token
// Updates the v2 token using the refresh_token
//
// Parameters:
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function RefreshToken(Val Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);
    Refresh     = "refresh_token";

    RequestParameters = New Structure;
    RequestParameters.Insert(Refresh      , Parameters_[Refresh]);
    RequestParameters.Insert("grant_type" , Refresh);
    RequestParameters.Insert("client_id"  , Parameters_["client_id"]);

    Response = OPI_HTTPRequests.PostWithBody("https://api.twitter.com/2/oauth2/token"
        , RequestParameters
        ,
        , False);

    Return Response;

EndFunction

// Handle incoming request after authorization !NOCLI
// Method for insertion into an http service, the address of which is specified in redirect_uri
//
// Note:
// Calls the token acquisition method, as for obtaining a token from the code received^^
// on redirect_uri after authorization via the browser is only 30 seconds
//
// Parameters:
// Request - HTTPServiceRequest - Request coming to the http service
//
// Returns:
// HTTPResponse, Arbitrary, BinaryData - Result of reading the JSON response from the server
Function HandleIncomingRequestAfterAuthorization(Request) Export

    Code          = Request.RequestParameters["code"];
    TokenResponse = GetToken(Code);

    // BSLLS:CommentedCode-off
    // Preferred token storage
    // Constants.TwitterRefresh.Set(ResponseToken["refresh_token"]);
    // Constants.TwitterToken.Set(ResponseToken["access_token"]);
    // BSLLS:CommentedCode-on

    Return TokenResponse;

EndFunction

#EndRegion

#Region Tweets

// Create custom tweet
// Creates a tweet with custom content
//
// Parameters:
// Text - String - Tweet text - text
// MediaArray - Array of String, BinaryData - Array of binary data or file paths - media
// PollOptionsArray - Array of String - Array of poll options, if necessary - options
// PollDuration - String, Number - Poll duration if necessary (poll without duration is not created) - dur
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateCustomTweet(Val Text = ""
    , Val MediaArray = ""
    , Val PollOptionsArray = ""
    , Val PollDuration = ""
    , Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Text);
    OPI_TypeConversion.GetLine(PollDuration);

    If ValueIsFilled(MediaArray) Then
        OPI_TypeConversion.GetCollection(MediaArray);
    EndIf;

    If ValueIsFilled(PollOptionsArray) Then
        OPI_TypeConversion.GetCollection(PollOptionsArray);
    EndIf;

    Parameters_ = GetStandardParameters(Parameters);
    URL         = "https://api.twitter.com/2/tweets";
    Array       = "Array";
    Fields      = New Map;

    If ValueIsFilled(Text) Then
        Fields.Insert("text", Text);
    EndIf;

    If TypeOf(PollOptionsArray) = Type(Array) And ValueIsFilled(PollDuration) Then

        PollDuration = Number(PollDuration);

        If PollOptionsArray.Count() > 0 Then

            OptionStructure = New Structure("options,duration_minutes", PollOptionsArray, PollDuration);
            Fields.Insert("poll", OptionStructure);

        EndIf;

    EndIf;

    If TypeOf(MediaArray) = Type(Array) Then
        If MediaArray.Count() > 0 Then
            Fields.Insert("media", New Structure("media_ids", MediaArray));
        EndIf;
    EndIf;

    If ValueIsFilled(Fields["media"]) Then
        IsV2 = False;
    Else
        IsV2 = True;
    EndIf;

    Response = Post(URL, Fields, Parameters_, True, IsV2);

    Return Response;

EndFunction

// Create text tweet
// Creates a tweet without attachments
//
// Parameters:
// Text - String - Tweet text - text
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateTextTweet(Val Text, Val Parameters = "") Export
    Return CreateCustomTweet(Text, , , , Parameters);
EndFunction

// Create image tweet
// Creates a tweet with an image attachment
//
// Parameters:
// Text - String - Tweet text - text
// ImageArray - Array of String, BinaryData - Image files array - pictures
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateImageTweet(Val Text, Val ImageArray, Val Parameters = "") Export

    MediaArray = UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);

    If TypeOf(MediaArray) = Type("Array") Then
        Result            = CreateCustomTweet(Text, MediaArray, , , Parameters);
    Else
        Result            = MediaArray;
    EndIf;

    Return Result;

EndFunction

// Create gif tweet
// Creates a tweet with a gif attachment
//
// Parameters:
// Text - String - Tweet text - text
// GifsArray - Array of String, BinaryData - Gif files array - gifs
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateGifTweet(Val Text, Val GifsArray, Val Parameters = "") Export

    MediaArray = UploadAttachmentsArray(GifsArray, "tweet_gif", Parameters);

    If TypeOf(MediaArray) = Type("Array") Then
        Result            = CreateCustomTweet(Text, MediaArray, , , Parameters);
    Else
        Result            = MediaArray;
    EndIf;

    Return Result;

EndFunction

// Create video tweet
// Creates a tweet with a video attachment
//
// Parameters:
// Text - String - Tweet text - text
// VideosArray - Array of String, BinaryData - Video files array - videos
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateVideoTweet(Val Text, Val VideosArray, Val Parameters = "") Export

    MediaArray = UploadAttachmentsArray(VideosArray, "tweet_video", Parameters);

    If TypeOf(MediaArray) = Type("Array") Then
        Result            = CreateCustomTweet(Text, MediaArray, , , Parameters);
    Else
        Result            = MediaArray;
    EndIf;

    Return Result;

EndFunction

// Create poll tweet
// Creates a tweet with a poll
//
// Parameters:
// Text - String - Tweet text - text
// OptionArray - Array of String - Poll options array - options
// Duration - String, Number - Poll duration - duration
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreatePollTweet(Val Text, Val OptionArray, Val Duration, Val Parameters = "") Export

    Return CreateCustomTweet(Text, , OptionArray, Duration, Parameters);

EndFunction

// Upload attachments array
// Uploads files to the server and returns their IDs
//
// Parameters:
// ArrayOfFiles - Array of String, BinaryData - Array of files to be uploaded - files
// AttachmentsType - String - Attachment type: tweet_video, tweet_image, tweet_gif - type
// Parameters - Structure Of String - Authorization data. See GetStandardParameters - auth
//
// Returns:
// Array Of String - Media ID array
Function UploadAttachmentsArray(Val ArrayOfFiles, Val AttachmentsType, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(AttachmentsType);
    OPI_TypeConversion.GetCollection(ArrayOfFiles);

    MediaArray  = New Array;
    Parameters_ = GetStandardParameters(Parameters);
    MIS         = "media_id_string";

    If ValueIsFilled(ArrayOfFiles) Then

        For Each SendingFile In ArrayOfFiles Do

            OPI_TypeConversion.GetBinaryData(SendingFile);

            Response = UploadMediaFile(SendingFile, AttachmentsType, Parameters_);
            MediaID  = Response[MIS];

            If Not ValueIsFilled(MediaID) Then
                Return Response;
            EndIf;

            MediaArray.Add(MediaID);

        EndDo;

    EndIf;

    Return MediaArray;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function UploadMediaFile(Val File, Val Type, Val Parameters)

    OPI_TypeConversion.GetBinaryData(File);

    RequestType = "POST";
    Parameters_ = GetStandardParameters(Parameters);
    URL         = "https://upload.twitter.com/1.1/media/upload.json";

    Response = UploadMediaInParts(File, Type, RequestType, URL, Parameters_);

    Return Response;

EndFunction

Function UploadMediaInParts(Val File, Val Type, Val RequestType, Val URL, Parameters)

    Unit    = 1024;
    Count   = 4;
    MID     = "media_id";
    MIS     = "media_id_string";
    Command = "command";
    Size    = File.Size();

    ChunkSize    = Count * Unit * Unit;
    ArrayReading = SplitBinaryData(File, ChunkSize);

    Fields = New Structure;
    Fields.Insert(Command         , "INIT");
    Fields.Insert("total_bytes"   , OPI_Tools.NumberToString(Size));
    Fields.Insert("media_category", Type);

    InitializationResponse = Post(URL, Fields, Parameters);
    InitializationID       = InitializationResponse[MID];
    InitializationIDS      = InitializationResponse[MIS];

    If Not ValueIsFilled(InitializationIDS) Or Not ValueIsFilled(InitializationID) Then
        Return InitializationResponse;
    EndIf;

    Counter = 0;

    For Each Part In ArrayReading Do

        Fields = New Structure;
        Fields.Insert(Command        , "APPEND");
        Fields.Insert(MID            , InitializationIDS);
        Fields.Insert("segment_index", OPI_Tools.NumberToString(Counter));
        Fields.Insert("media"        , Part);

        Response = PostMultipart(URL, Fields, Parameters);

        Counter = Counter + 1;

    EndDo;

    Fields = New Structure;
    Fields.Insert(Command, "FINALIZE");
    Fields.Insert(MID    , InitializationIDS);

    ProcessingStatus = GetProcessingStatus(Parameters, Fields, URL);

    If Not TypeOf(ProcessingStatus) = Type("String") Then
        Return ProcessingStatus;
    EndIf;

    Response = WaitForProcessingCompletion(ProcessingStatus, InitializationIDS, URL, Parameters);

    Return Response;

EndFunction

Function WaitForProcessingCompletion(Val ProcessingStatus, Val InitializationID, Val URL, Val Parameters)

    ProcessingInfo = "processing_info";
    Command        = "command";
    Fields         = New Structure;

    Fields.Insert(Command   , "STATUS");
    Fields.Insert("media_id", InitializationID);

    While String(ProcessingStatus) = "pending" Or String(ProcessingStatus) = "in_progress" Do

        Response    = Get(URL, Fields, Parameters);
        Information = Response[ProcessingInfo];

        If Not ValueIsFilled(Information) Then
            Return Response;
        EndIf;

        ProcessingStatus = Information["state"];

        If Not ValueIsFilled(ProcessingStatus) Then
            Return Response;
        EndIf;

    EndDo;

    If ProcessingStatus = "failed" Then
        Raise "Twitter could not process the video you uploaded";
    EndIf;

    Return Response;

EndFunction

Function GetStandardParameters(Val Parameters = "")

    // The definition of the data required for the work is collected here.
    // For Twitter, this is quite a significant set, which is due to the presence of 2 APIs at once,
    // which, at the same time, are not created for different tasks, but are simply versions of each other.
    // The current version of the API is v2 and it requires obtaining temporary tokens. Despite the fact,
    // that Twitter insists on using this latest version, they somehow managed not to transfer
    // file upload mechanism and some others from the old version - v1.1. Therefore, something needs to be done
    // on version 1.1, and something on 2: up to the point that they removed the ability to post tweets from v1.1,
    // but only through it you can add a picture to the tweet. At the same time, their authentication methods and tokens are different

    // The world gigacorporation of Elon Musk, by the way, a reminder ;)

    // P.S The following is often referred to as the "Twitter Developer settings page" - this
    // https://developer.twitter.com/en/portal/dashboard and chosing of project from list (key icon)

    Parameters_ = New Map;
    Permissions = "tweet.read tweet.write tweet.moderate.write users.read "
        + "follows.read follows.write offline.access space.read mute.read "
        + "mute.write like.read like.write list.read list.write block.read "
        + "block.write bookmark.read bookmark.write";

    // Data for API v2

    // redirect_uri - URL of your http service (or other request handler) for authorization
    // scope - a set of permissions for the received key. Can be any, but offline.access is mandatory
    // client_id - From OAuth 2.0 Client ID and Client Secret settings page of Twitter Developer
    // client_secret - From OAuth 2.0 Client ID and Client Secret settings page of Twitter Developer
    // access_token - GetAuthorizationLink() -> Browser -> code will come to redirect_uri -> GetToken(code)
    // refresh_token - Comes together with access_token and is used to refresh it (access_token lifetime - 2 hr)
    // The update is done using the UpdateToken method with new access_token and refresh_token.
    // For the next update, you need to use a new refresh_token, so hardcode
    // won't work (access_token won't work either)

    // |--> RefreshToken() ->|access_token --> 2 hrs. lifetime
    // | |refresh_token --|
    // |--------[after 2 hrs.]-------------------|

    // Data for API v1.1

    // oauth_token - From Authentication Tokens -> Access Token and Secret settings page of Twitter Developer
    // oauth_token_secret - From Authentication Tokens -> Access Token and Secret settings page of Twitter Developer
    // oauth_consumer_key - From Consumer Keys -> Access Token and Secret settings page of Twitter Developer
    // oauth_consumer_secret - From Consumer Keys -> Access Token and Secret settings page of Twitter Developer

    // These tokens do not need to be updated

    Parameters_.Insert("redirect_uri"         , "");
    Parameters_.Insert("scope"                , Permissions);
    Parameters_.Insert("client_id"            , "");
    Parameters_.Insert("client_secret"        , "");
    Parameters_.Insert("access_token"         , ""); // Should be something like Constants.TwitterToken.Get()
    Parameters_.Insert("refresh_token"        , ""); // Should be something like Constants.TwitterRefresh.Get()
    Parameters_.Insert("oauth_token"          , "");
    Parameters_.Insert("oauth_token_secret"   , "");
    Parameters_.Insert("oauth_consumer_key"   , "");
    Parameters_.Insert("oauth_consumer_secret", "");

    OPI_TypeConversion.GetCollection(Parameters);

    If TypeOf(Parameters) = Type("Structure") Or TypeOf(Parameters) = Type("Map") Then
        For Each PassedParameter In Parameters Do
            Parameters_.Insert(PassedParameter.Key, OPI_Tools.NumberToString(PassedParameter.Value));
        EndDo;
    EndIf;

    Return Parameters_;

EndFunction

Function GetProcessingStatus(Val Parameters, Val Fields, Val URL)

    ProcessingInfo = "processing_info";

    Response    = Post(URL, Fields, Parameters);
    Information = Response[ProcessingInfo];

    If Not ValueIsFilled(Information) Then
        Return Response;
    EndIf;

    ProcessingStatus = Information["state"];

    If Not ValueIsFilled(ProcessingStatus) Then
        Return Response;
    Else
        Return ProcessingStatus;
    EndIf;

EndFunction

Function Get(Val URL, Val Fields, Val SecretData)

    Token       = SecretData["oauth_token"];
    Secret      = SecretData["oauth_token_secret"];
    UsersKey    = SecretData["oauth_consumer_key"];
    UsersSecret = SecretData["oauth_consumer_secret"];
    Version     = "1.0";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetURLParams(Fields)
        .AddOauthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .SetOAuthV1Algorithm("HMAC", "SHA1")
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject(True, True);

    Return Result;

EndFunction

Function Post(Val URL, Val Fields, Val SecretData, Val JSON = False, Val IsV2 = False)

    Token       = SecretData["oauth_token"];
    Secret      = SecretData["oauth_token_secret"];
    UsersKey    = SecretData["oauth_consumer_key"];
    UsersSecret = SecretData["oauth_consumer_secret"];
    Version     = "1.0";

    HttpClient = OPI_HTTPRequests.NewRequest().Initialize(URL);

    If IsV2 Then

        HttpClient.AddHeader("Authorization", "Bearer " + SecretData["access_token"]);

    Else

        ActionWithAttachment = OPI_Tools.CollectionFieldExists(Fields, "media");

        HttpClient.AddOauthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
            .SetOAuthV1Algorithm("HMAC", "SHA1")
            .UseBodyFiledsAtOAuth(Not ActionWithAttachment);

    EndIf;

    If JSON Then
        HttpClient.SetJsonBody(Fields);
    Else
        HttpClient.SetFormBody(Fields);
    EndIf;

    Return HttpClient.ProcessRequest("POST").ReturnResponseAsJSONObject(True, True);

EndFunction

Function PostMultipart(Val URL, Val Fields, Val SecretData)

    Token       = SecretData["oauth_token"];
    Secret      = SecretData["oauth_token_secret"];
    UsersKey    = SecretData["oauth_consumer_key"];
    UsersSecret = SecretData["oauth_consumer_secret"];
    Version     = "1.0";

    HttpClient = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddOauthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .SetOAuthV1Algorithm("HMAC", "SHA1")
        .UseBodyFiledsAtOAuth(False);

    For Each Parameter In Fields Do
        HttpClient.AddMultipartFormDataField(Parameter.Key, Parameter.Value);
    EndDo;

    Result = HttpClient.ProcessRequest("POST").ReturnResponseAsJSONObject(True, True);

    Return Result;

EndFunction

#EndRegion
