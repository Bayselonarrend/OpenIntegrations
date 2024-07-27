// OneScript: ./OInt/core/Modules/OPI_Twitter.os
// Lib: Twitter
// CLI: twitter

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
// If you don't know where to start, you should find the GetStandardParameters method()
// and read comments

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off

//@skip-check method-too-many-params
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region Public

#Region DataAndSettings

// Get authorization link
// Forms a link for authorization via the browser
//
// Parameters:
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
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
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
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

    Response = OPI_Tools.Post("https://api.twitter.com/2/oauth2/token"
        , RequestParameters, , False);

    Return Response;

EndFunction

// Refresh token
// Updates the v2 token using the refresh_token
//
// Parameters:
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
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

    Response = OPI_Tools.Post("https://api.twitter.com/2/oauth2/token"
    , RequestParameters, , False);

    Return Response;

EndFunction

// !NOCLI
// Method for insertion into an http service, the address of which is specified in redirect_uri
// Calls the token acquisition method, as for obtaining a token from the code received
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

// !NOCLI
// Create custom tweet
//
// Parameters:
// Text - String - Tweet text
// MediaArray - Array of String, BinaryData - Array of binary data or file paths
// PollOptionsArray - Array of String - Array of poll options, if necessary
// PollDuration - String, Number - Poll duration if necessary (poll without duration is not created)
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
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

    Authorization = CreateAuthorizationHeaderV2(Parameters_);
    Response      = OPI_Tools.Post(URL, Fields, Authorization);

    Return Response;

EndFunction

// Create text tweet
// Creates a tweet without attachments
//
// Parameters:
// Text - String - Tweet text - text
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
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
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateImageTweet(Val Text, Val ImageArray, Val Parameters = "") Export

    MediaArray = UploadAttachmentsArray(ImageArray, "photo", Parameters);
    Return CreateCustomTweet(Text, MediaArray, , , Parameters);

EndFunction

// Create gif tweet
// Creates a tweet with a gif attachment
//
// Parameters:
// Text - String - Tweet text - text
// GifsArray - Array of String, BinaryData - Gif files array - gifs
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateGifTweet(Val Text, Val GifsArray, Val Parameters = "") Export

    MediaArray = UploadAttachmentsArray(GifsArray, "animated_gif", Parameters);
    Return CreateCustomTweet(Text, MediaArray, , , Parameters);

EndFunction

// Create video tweet
// Creates a tweet with a video attachment
//
// Parameters:
// Text - String - Tweet text - text
// VideosArray - Array of String, BinaryData - Video files array - videos
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreateVideoTweet(Val Text, Val VideosArray, Val Parameters = "") Export

    MediaArray = UploadAttachmentsArray(VideosArray, "video", Parameters);
    Return CreateCustomTweet(Text, MediaArray, , , Parameters);

EndFunction

// Create poll tweet
// Creates a tweet with a poll
//
// Parameters:
// Text - String - Tweet text - text
// OptionArray - Array of String - Poll options array - options
// Duration - String, Number - Poll duration - duration
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Twitter
Function CreatePollTweet(Val Text, Val OptionArray, Val Duration, Val Parameters = "") Export

    Return CreateCustomTweet(Text, , OptionArray, Duration, Parameters);

EndFunction

// Upload attachments array !NOCLI
// Uploads files to the server and returns their IDs
//
// Parameters:
// ArrayOfFiles - Array of String, BinaryData - Files array
// AttachmentsType - String - Attachments type
// Parameters - Structure Of String - See GetStandardParameters - auth - Authorization JSON or path to .json
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

    If Type = "photo" Then

        Fields = New Structure;
        Fields.Insert("media_data"    , Base64String(File));
        Fields.Insert("media_category", Type);

        Authorization = CreateAuthorizationHeaderV1(Parameters_, Fields, RequestType, URL);
        Response      = OPI_Tools.Post(URL, Fields, Authorization, False);

    Else

        Response = UploadMediaInParts(File, Type, RequestType, URL, Parameters_);

    EndIf;

    Return Response;

EndFunction

Function UploadMediaInParts(Val File, Val Type, Val RequestType, Val URL, Parameters)

    Unit     = 1024;
    Count    = 4;
    MediaKey = "media_key";
    MIS      = "media_id_string";
    Command  = "command";
    Size     = File.Size();

    MIMETypeMapping = New Map;
    MIMETypeMapping.Insert("photo"       , "image/jpeg");
    MIMETypeMapping.Insert("video"       , "video/mp4");
    MIMETypeMapping.Insert("animated_gif", "image/gif");

    ChunkSize    = Count * Unit * Unit;
    ArrayReading = SplitBinaryData(File, ChunkSize);

    Fields = New Structure;
    Fields.Insert(Command          , "INIT");
    Fields.Insert("total_bytes"    , OPI_Tools.NumberToString(Size));
    Fields.Insert("media_type"     , MIMETypeMapping.Get(Type));
    Fields.Insert("media_category" , Type);

    Authorization = CreateAuthorizationHeaderV1(Parameters, Fields, RequestType, URL);

    InitializationResponse = OPI_Tools.Post(URL, Fields, Authorization, False);
    InitializationKey      = InitializationResponse[MediaKey];
    InitializationID       = InitializationResponse[MIS];

    If Not ValueIsFilled(InitializationKey) Or Not ValueIsFilled(InitializationID) Then
        Return InitializationResponse;
    EndIf;

    Counter = 0;

    For Each Part In ArrayReading Do

        Fields = New Structure;
        Fields.Insert(Command         , "APPEND");
        Fields.Insert("media_key"     , InitializationKey);
        Fields.Insert("segment_index" , OPI_Tools.NumberToString(Counter));
        Fields.Insert("media"         , Part);

        Authorization = CreateAuthorizationHeaderV1(Parameters, New Structure, RequestType, URL);

        OPI_Tools.PostMultipart(URL, Fields, , , Authorization);

        Counter = Counter + 1;

    EndDo;

    Fields = New Structure;
    Fields.Insert(Command   , "FINALIZE");
    Fields.Insert("media_id", InitializationID);

    ProcessingStatus = GetProcessingStatus(Parameters, Fields, URL);

    If Not TypeOf(ProcessingStatus) = Type("String") Then
        Return ProcessingStatus;
    EndIf;

    Response = WaitForProcessingCompletion(ProcessingStatus, InitializationID, URL, Parameters);

    Return Response;

EndFunction

Function WaitForProcessingCompletion(Val ProcessingStatus, Val InitializationID, Val URL, Val Parameters)

    ProcessingInfo = "processing_info";
    Command        = "command";
    Fields         = New Structure;

    Fields.Insert(Command   , "STATUS");
    Fields.Insert("media_id", InitializationID);

    WHile String(ProcessingStatus) = "pending" Or String(ProcessingStatus) = "in_progress" Do

        Authorization = CreateAuthorizationHeaderV1(Parameters, Fields, "GET", URL);
        Response      = OPI_Tools.Get(URL, Fields, Authorization);
        Information   = Response[ProcessingInfo];

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

Function CreateAuthorizationHeaderV1(Val Parameters, Val Fields, Val RequestType, Val URL)

    CurrentDate         = OPI_Tools.GetCurrentDate();
    AuthorizationHeader = "";
    HashingMethod       = "HMAC-SHA1";
    APIVersion          = "1.0";
    SignatureString     = "";
    Signature           = "";
    OCK = "oauth_consumer_key";
    OTK = "oauth_token";
    CurrentUNIXDate     = OPI_Tools.UNIXTime(CurrentDate);
    CurrentUNIXDate     = OPI_Tools.NumberToString(CurrentUNIXDate);
    ParametersTable     = New ValueTable;
    ParametersTable.Columns.Add("Key");
    ParametersTable.Columns.Add("Value");

    For Each Field In Fields Do

        NewLine       = ParametersTable.Add();
        NewLine.Key   = Field.Key;
        NewLine.Value = Field.Value;

    EndDo;

    NewLine       = ParametersTable.Add();
    NewLine.Key   = OCK;
    NewLine.Value = Parameters[OCK];

    NewLine       = ParametersTable.Add();
    NewLine.Key   = OTK;
    NewLine.Value = Parameters[OTK];

    NewLine       = ParametersTable.Add();
    NewLine.Key   = "oauth_version";
    NewLine.Value = APIVersion;

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
            + "         ="
            + TableRow.Value
            + "&";

    EndDo;

    SignatureString = Left(SignatureString, StrLen(SignatureString) - 1);
    SignatureString = Upper(RequestType)
        + "&"
        + EncodeString(URL            , StringEncodingMethod.URLencoding)
        + "&"
        + EncodeString(SignatureString, StringEncodingMethod.URLencoding);

    Signature = EncodeString(Parameters["oauth_consumer_secret"], StringEncodingMethod.URLencoding)
        + "&"
        + EncodeString(Parameters["oauth_token_secret"], StringEncodingMethod.URLencoding);

    Signature = OPI_Cryptography.HMAC(GetBinaryDataFromString(Signature)
        , GetBinaryDataFromString(SignatureString)
        , HashFunction.SHA1
        , 64);

    Signature = EncodeString(Base64String(Signature), StringEncodingMethod.URLencoding);

    Delimiter = """,";
    AuthorizationHeader          = AuthorizationHeader
        + "OAuth "
        + "oauth_consumer_key    =""" + Parameters[OCK] + Delimiter
        + "oauth_token           =""" + Parameters[OTK] + Delimiter
        + "oauth_signature_method=""" + HashingMethod + Delimiter
        + "oauth_timestamp       =""" + CurrentUNIXDate + Delimiter
        + "oauth_nonce           =""" + CurrentUNIXDate + Delimiter
        + "oauth_version         =""" + APIVersion + Delimiter
        + "oauth_signature       =""" + Signature;

        HeaderMapping = New Map;
        HeaderMapping.Insert("authorization", AuthorizationHeader);

    Return HeaderMapping;

EndFunction

Function CreateAuthorizationHeaderV2(Val Parameters)

    ReturnMapping = New Map;
    ReturnMapping.Insert("Authorization", "Bearer " + Parameters["access_token"]);

    Return ReturnMapping;

EndFunction

Function GetProcessingStatus(Val Parameters, Val Fields, Val URL)

	ProcessingInfo   = "processing_info";
    Authorization = CreateAuthorizationHeaderV1(Parameters, Fields, "POST", URL);

    Response    = OPI_Tools.Post(URL, Fields, Authorization, False);
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

#EndRegion
