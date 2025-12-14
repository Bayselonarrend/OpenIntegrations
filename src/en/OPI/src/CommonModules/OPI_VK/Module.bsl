// OneScript: ./OInt/core/Modules/OPI_VK.os
// Lib: VK
// CLI: vk
// Keywords: vk, vkontakte

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

// BSLLS:NumberOfOptionalParams-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:LineLength-off

//@skip-check method-too-many-params
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region Authorization

// Create token retrieval link
// Getting a link for interactive token retrieval (access_token), which is necessary
// for further actions
//
// Parameters:
// app_id - String, Number - app_id from application settings - app
//
// Returns:
// String - URL to go to in the browser
Function CreateTokenRetrievalLink(Val App_id) Export

    OPI_TypeConversion.GetLine(App_id);

    // access_token will need to be taken from the parameter in the browser address bar
    Return "https://oauth.vk.com/authorize?client_id=" + App_id
        + "&scope=offline,wall,groups,photos,stats,stories,ads,market,video"
        + "&v=5.131&response_type=token&redirect_uri=https://api.vk.com/blank.html";

EndFunction

// Get auth parameters
// Gets the structure of authorization parameters
//
// Parameters:
// GroupID - String, Number - Group ID - group
// AppID - String, Number - App ID - app
// AuthToken - String - Auth token - token
//
// Returns:
// Structure - Get auth parameters
Function GetAuthParameters(Val GroupID, Val AppID, Val AuthToken) Export

    String_ = "String";

    OPI_TypeConversion.GetLine(GroupID);

    AuthParameters = New Structure;

    OPI_Tools.AddField("v"            , "5.131"       , String_, AuthParameters);
    OPI_Tools.AddField("from_group"   , "1"           , String_, AuthParameters);
    OPI_Tools.AddField("group_id"     , GroupID       , String_, AuthParameters);
    OPI_Tools.AddField("owner_id"     , "-" + GroupID , String_, AuthParameters);
    OPI_Tools.AddField("app_id"       , AppID         , String_, AuthParameters);
    OPI_Tools.AddField("access_token" , AuthToken     , String_, AuthParameters);

    Return AuthParameters;

EndFunction

#EndRegion

#Region CommunityManagement

// Create post
// Creates a post with images
//
// Parameters:
// Text - String - Post text - text
// ImageArray - Array of String, BinaryData - Array of images - pictures
// Advertisement - Boolean - Sign ""This is an ad"" - ad
// LinkUnderPost - String - Link (URL) under the post - url
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreatePost(Val Text
    , Val ImageArray
    , Val Advertisement = False
    , Val LinkUnderPost = ""
    , Val Parameters = "") Export

    OPI_TypeConversion.GetCollection(ImageArray);

    Parameters_      = GetStandardParameters(Parameters);
    AttachmentsArray = New Array;

    For Each PostImage In ImageArray Do

        Parameters_ = GetStandardParameters(Parameters);
        ResponseMap = GetImageMap(PostImage, Parameters_, "Post");

        OwnerId  = ResponseMap.Get("owner_id");
        ObjectId = ResponseMap.Get("id");

        If Not ValueIsFilled(OwnerId) Or Not ValueIsFilled(ObjectId) Then
            Return ResponseMap;
        EndIf;

        OwnerId  = OPI_Tools.NumberToString(OwnerId);
        ObjectId = OPI_Tools.NumberToString(ObjectId);

        PhotoID = "photo" + OwnerId + "_" + ObjectId;

        AttachmentsArray.Add(PhotoID);

    EndDo;

    Response = CreateCompositePost(Text, AttachmentsArray, Advertisement, LinkUnderPost, Parameters);

    Return Response;

EndFunction

// Create composite post
// Creates a post based on an array of object identifiers (images, videos, etc..)
//
// Parameters:
// Text - String - Post text - text
// Objects - Array of String - Array of identifiers like photo123_123 - objects
// Advertisement - Boolean - Sign ""This is an ad"" - ad
// LinkUnderPost - String - Link (URL) under the post - url
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateCompositePost(Val Text
    , Val Objects
    , Val Advertisement = False
    , Val LinkUnderPost = ""
    , Val Parameters = "") Export

    OPI_TypeConversion.GetLine(LinkUnderPost);
    OPI_TypeConversion.GetBoolean(Advertisement);
    OPI_TypeConversion.GetArray(Objects);

    Parameters_       = GetStandardParameters(Parameters);
    AttachmentsString = StrConcat(Objects, ",");
    AttachmentsString = AttachmentsString + LinkUnderPost;
    AdsNumber         = ?(Advertisement, 1, 0);

    OPI_Tools.AddField("message"       , Text             , "String" , Parameters_);
    OPI_Tools.AddField("attachments"   , AttachmentsString, "String" , Parameters_);
    OPI_Tools.AddField("mark_as_ads"   , AdsNumber        , "Number" , Parameters_);
    OPI_Tools.AddField("close_comments", AdsNumber        , "Number" , Parameters_);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/wall.post", Parameters_);

    Return Response;

EndFunction

// Delete post
// Deletes a post by ID
//
// Parameters:
// PostID - String, Number - Post ID - post
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function DeletePost(Val PostID, Val Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);
    OPI_Tools.AddField("post_id", PostID, "String", Parameters_);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/wall.delete", Parameters_);

    Return Response;

EndFunction

// Create poll
// Creates a poll with answer options
//
// Parameters:
// Question - String - Poll question - question
// AnswersArray - Array of String - Array of answer options - options
// Image - String, BinaryData - Poll image. Required if there is no text - picture
// Text - String - Post text. Required if there is no picture - text
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreatePoll(Val Question, Val AnswersArray, Val Image = "", Val Text = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Question);
    OPI_TypeConversion.GetLine(Text);
    OPI_TypeConversion.GetCollection(AnswersArray);

    Parameters_ = GetStandardParameters(Parameters);
    Response_   = "response";

    Parameters_.Insert("is_anonymous", 1);
    Parameters_.Insert("is_multiple" , 0);

    Answers = StrConcat(AnswersArray, """,""");
    Answers = "[""" + Answers + """]";

    Parameters_.Insert("add_answers", Answers);
    Parameters_.Insert("question"   , Question);

    Poll    = OPI_HTTPRequests.Get("api.vk.com/method/polls.create", Parameters_);
    PollMap = Poll.Get(Response_);

    If Not ValueIsFilled(PollMap) Then
        Return Poll;
    EndIf;

    OwnerId  = PollMap.Get("owner_id");
    ObjectId = PollMap.Get("id");

    If Not ValueIsFilled(OwnerId) Or Not ValueIsFilled(ObjectId) Then
        Return Poll;
    EndIf;

    OPI_TypeConversion.GetLine(OwnerId);
    OPI_TypeConversion.GetLine(ObjectId);

    AttachmentsArray = New Array;

    PollID = StrTemplate("poll%1_%2", OwnerId, ObjectId);
    AttachmentsArray.Add(PollID);

    If ValueIsFilled(Image) Then

        OPI_TypeConversion.GetBinaryData(Image);

        ResponseMap = GetImageMap(Image, Parameters_, "Post");

        OwnerId  = ResponseMap.Get("owner_id");
        ObjectId = ResponseMap.Get("id");

        If Not ValueIsFilled(OwnerId) Or Not ValueIsFilled(ObjectId) Then
            Return ResponseMap;
        EndIf;

        OwnerId  = OPI_Tools.NumberToString(OwnerId);
        ObjectId = OPI_Tools.NumberToString(ObjectId);

        PhotoID = "photo" + OwnerId + "_" + ObjectId;

        AttachmentsArray.Add(PhotoID);

    EndIf;

    If ValueIsFilled(Text) Then
        Parameters_.Insert("message", Text);
    EndIf;

    Parameters_.Insert("attachments", StrConcat(AttachmentsArray, ","));

    Response = OPI_HTTPRequests.Get("api.vk.com/method/wall.post", Parameters_);

    Return Response;

EndFunction

// Create album
// Creates an album to store images
//
// Parameters:
// Name - String - Album name - title
// Description - String - Album description - description
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateAlbum(Val Name, Val Description = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Description);

    Parameters_ = GetStandardParameters(Parameters);

    Parameters_.Insert("title"                , Name);
    Parameters_.Insert("description"          , Description);
    Parameters_.Insert("upload_by_admins_only", 1);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/photos.createAlbum", Parameters_);

    Return Response;

EndFunction

// Delete album
// Deletes a previously created album
//
// Parameters:
// AlbumID - String, Number - Album ID - album
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function DeleteAlbum(Val AlbumID, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(AlbumID);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("album_id", OPI_Tools.NumberToString(AlbumID));

    Response = OPI_HTTPRequests.Get("api.vk.com/method/photos.deleteAlbum", Parameters_);

    Return Response;

EndFunction

// Create story
// Creates a story from an image
//
// Parameters:
// Image - String, BinaryData - Story background - picture
// URL - String - URL for button under the story - url
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateStory(Val Image, Val URL = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(URL);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("link_text"  , "more");
    Parameters_.Insert("link_url"   , URL);
    Parameters_.Insert("add_to_news", "1");

    Response = UploadPhotoToServer(Image, Parameters_, "Story");
    Return Response;

EndFunction

// Save image to album
// Saves an image to the community album
//
// Parameters:
// AlbumID - String, Number - Album ID - album
// Image - BinaryData, String - Image file - picture
// Description - String - Image description - description
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function SaveImageToAlbum(Val AlbumID, Val Image, Val Description = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(AlbumID);
    OPI_TypeConversion.GetLine(Description);

    Parameters_ = GetStandardParameters(Parameters);

    Parameters_.Insert("album_id", AlbumID);
    Parameters_.Insert("caption" , Description);

    Return UploadPhotoToServer(Image, Parameters_, "Album");

EndFunction

// Delete image
// Deletes an image from the album
//
// Parameters:
// ImageID - String, Number - Image ID - pictureid
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function DeleteImage(Val ImageID, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(ImageID);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("photo_id", ImageID);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/photos.delete", Parameters_);

    Return Response;

EndFunction

// Upload video to server
// Uploads video to the group for further use
//
// Parameters:
// Video - String, BinaryData - Video file - file
// Name - String - Video name - title
// Description - String - Video description - description
// Album - String - Album ID, if necessary - album
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function UploadVideoToServer(Val Video
    , Val Name
    , Val Description = ""
    , Val Album = ""
    , Val Parameters = "") Export

    String_    = "String";
    Parameters = GetStandardParameters(Parameters);

    OPI_Tools.AddField("name"       , Name        , String_, Parameters);
    OPI_Tools.AddField("description", Description , String_, Parameters);
    OPI_Tools.AddField("album_id"   , Album       , String_, Parameters);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/video.save", Parameters);

    Result = Response["response"];

    If Not ValueIsFilled(Result) Then
        Return Response;
    EndIf;

    URL = Result["upload_url"];

    If Not ValueIsFilled(URL) Then
        Return Response;
    EndIf;

    FileMapping = New Map;
    OPI_Tools.AddField("video_file.mp4", Video, "BinaryData", FileMapping);

    DataSize = FileMapping["video_file.mp4"].Size();
    DataSize = OPI_Tools.NumberToString(DataSize);

    Response = OPI_HTTPRequests.PostMultipart(URL, , FileMapping, "video/mp4");

    Return Response;

EndFunction

// Upload photo to server
// Uploads photo to server for further use
//
// Parameters:
// Image - String, BinaryData - Image file - file
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
// View - String - Upload type (Post, Product, Story, Poll, Other) - type
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function UploadPhotoToServer(Val Image, Val Parameters = "", Val View = "Post") Export

    Parameters = GetStandardParameters(Parameters);
    Method     = DetermineImageUploadMethod(View);
    Files      = New Map;

    Response_ = "response";
    URL       = "api.vk.com/method/";
    Upload    = URL + Method["Upload"];
    Save      = URL + Method["Save"];

    If TypeOf(Image) = Type("String") Then
        ImageKey     = StrReplace(Image, ".", "___");
        OPI_TypeConversion.GetBinaryData(Image);
    Else
        ImageKey     = "image___jpeg";
    EndIf;

    Files.Insert(ImageKey, Image);

    Response = OPI_HTTPRequests.Get(Upload, Parameters);
    Result   = Response[Response_];

    If ValueIsFilled(Result) Then

        URL = Result["upload_url"];

        If Not ValueIsFilled(URL) Then
            Return Response;
        EndIf;

    Else
        Return Response;
    EndIf;

    Parameters.Insert("upload_url", URL);

    For N = 1 To 5 Do

        Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, Files);

        If TypeOf(Response) <> Type("Map") Then
            Continue;
        EndIf;

        Success = FillPhotoUploadParameters(Method, Response, Parameters);

        If Not Success Then
            Continue;
        Else
            Break;
        EndIf;

    EndDo;

    Response = OPI_HTTPRequests.Get(Save, Parameters);

    If TypeOf(Response) = Type("BinaryData") Then
        Return GetStringFromBinaryData(Response);
    EndIf;

    Return Response;

EndFunction

#EndRegion

#Region DiscussionManagement

// Create discussion
// Creates a new discussion
//
// Parameters:
// Name - String - Discussion name - title
// FirstMessageText - String - Text of the first message - text
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateDiscussion(Val Name, Val FirstMessageText, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(FirstMessageText);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("title", Name);
    Parameters_.Insert("text" , FirstMessageText);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/board.addTopic", Parameters_);

    Return Response;

EndFunction

// Close discussion
// Close or delete discussion
//
// Parameters:
// DiscussionID - String, Number - Discussion ID - topic
// DeleteCompletely - Boolean - Delete completely (True) or close - remove
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CloseDiscussion(Val DiscussionID, Val DeleteCompletely = False, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(DiscussionID);
    OPI_TypeConversion.GetBoolean(DeleteCompletely);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("topic_id", DiscussionID);

    Method   = ?(DeleteCompletely, "deleteTopic", "closeTopic");
    Response = OPI_HTTPRequests.Get("api.vk.com/method/board." + Method, Parameters_);

    Return Response;

EndFunction

// Open discussion
// Opens a previously closed discussion
//
// Parameters:
// DiscussionID - String, Number - Discussion ID - topic
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function OpenDiscussion(Val DiscussionID, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(DiscussionID);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("topic_id", DiscussionID);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/board.openTopic", Parameters_);

    Return Response;

EndFunction

// Write in discussion
// Adds a message to the discussion on behalf of the group
//
// Parameters:
// DiscussionID - String, Number - Discussion ID - topic
// Text - String - Message text - text
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function WriteInDiscussion(Val DiscussionID, Val Text, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(DiscussionID);
    OPI_TypeConversion.GetLine(Text);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("topic_id", DiscussionID);
    Parameters_.Insert("message" , Text);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/board.createComment", Parameters_);

    Return Response;

EndFunction

#EndRegion

#Region InteractiveActions

// Like
// Likes a post
//
// Parameters:
// PostID - String, Number - Post ID - post
// WallID - String, Number - ID of the wall where the post is located - wall
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function LikePost(Val PostID, Val WallID = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(PostID);
    OPI_TypeConversion.GetLine(WallID);

    Parameters_ = GetStandardParameters(Parameters);
    WallID      = ?(ValueIsFilled(WallID), WallID, Parameters_["owner_id"]);
    VKObject    = "wall" + WallID + "_" + OPI_Tools.NumberToString(PostID);

    Parameters_.Insert("type"       , "post");
    Parameters_.Insert("object"     , VKObject);
    Parameters_.Insert("item_id"    , OPI_Tools.NumberToString(PostID));
    Parameters_.Insert("owner_id"   , OPI_Tools.NumberToString(WallID));
    Parameters_.Insert("from_group" , 0);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/likes.add", Parameters_);

    Return Response;

EndFunction

// Make repost
// Reposts the record
//
// Parameters:
// PostID - String, Number - Post ID - post
// WallID - String, Number - ID of the wall where the post is located - from
// TargetWall - String, Number - ID of the target wall or group - to
// Advertising - Boolean - Sign of an advertising post - ad
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function MakeRepost(Val PostID
    , Val WallID = ""
    , Val TargetWall = ""
    , Val Advertising = False
    , Val Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);
    GroupId     = Parameters_["group_id"];

    OPI_TypeConversion.GetLine(GroupId);
    OPI_TypeConversion.GetLine(PostID);
    OPI_TypeConversion.GetLine(WallID);
    OPI_TypeConversion.GetLine(TargetWall);
    OPI_TypeConversion.GetBoolean(Advertising);

    Source   = ?(ValueIsFilled(WallID), WallID, GroupId);
    Receiver = ?(ValueIsFilled(TargetWall), TargetWall, GroupId);

    Parameters_.Insert("object"      , "wall" + Source + "_" + OPI_Tools.NumberToString(PostID));
    Parameters_.Insert("group_id"    , StrReplace(Receiver, "-", ""));
    Parameters_.Insert("mark_as_ads" , ?(Advertising      , 1  , 0));

    Response = OPI_HTTPRequests.Get("api.vk.com/method/wall.repost", Parameters_);

    Return Response;

EndFunction

// Write a message
// Write a message to a user in the community's dialog
//
// Parameters:
// Text - String - Message text - text
// UserID - String - Recipient user ID - user
// Communitytoken - String - Community chat bot token, which can be obtained in the settings - ct
// Keyboard - String - Keyboard JSON. See FormKeyboard - keyboard
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function WriteMessage(Val Text
    , Val UserID
    , Val Communitytoken
    , Val Keyboard = ""
    , Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Text);
    OPI_TypeConversion.GetLine(UserID);
    OPI_TypeConversion.GetLine(Communitytoken);
    OPI_TypeConversion.GetCollection(Keyboard);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("access_token", Communitytoken);

    Parameters_.Insert("user_id"    , UserID);
    Parameters_.Insert("peer_id"    , UserID);
    Parameters_.Insert("parse_mode" , "Markdown");
    Parameters_.Insert("random_id"  , 0);
    Parameters_.Insert("message"    , Text);

    If ValueIsFilled(Keyboard) Then
        Parameters_.Insert("keyboard", Keyboard);
    EndIf;

    Response = OPI_HTTPRequests.Get("api.vk.com/method/messages.send", Parameters_);

    Return Response;

EndFunction

// Write a comment
// Creates a comment under the selected record
//
// Parameters:
// PostID - String, Number - ID of the target post - post
// WallID - String, Number - ID of the wall where the post is located - wall
// Text - String - Comment text - text
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function WriteComment(Val PostID, Val WallID, Val Text, Val Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);
    GroupId     = Parameters_["group_id"];

    OPI_TypeConversion.GetLine(GroupId);
    OPI_TypeConversion.GetLine(PostID);
    OPI_TypeConversion.GetLine(WallID);
    OPI_TypeConversion.GetLine(Text);

    Parameters_.Insert("owner_id"   , WallID);
    Parameters_.Insert("from_group" , GroupId);
    Parameters_.Insert("post_id"    , PostID);
    Parameters_.Insert("message"    , Text);

    Parameters_.Delete("group_id");

    Response = OPI_HTTPRequests.Get("api.vk.com/method/wall.createComment", Parameters_);

    Return Response;

EndFunction

// Shorten link
// Creates a shortened URL from a regular one
//
// Parameters:
// URL - String - URL for shortening - url
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// String - Shortened URL
Function ShortenLink(Val URL, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(URL);

    Response_   = "response";
    Parameters_ = New Structure;
    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("url", URL);

    Response = OPI_HTTPRequests.Get("https://api.vk.com/method/utils.getShortLink", Parameters_);
    Result   = Response[Response_];

    If ValueIsFilled(Result) Then

        URL = Result["short_url"];

        If ValueIsFilled(URL) Then
            Return URL;
        Else
            Return Response;
        EndIf;

    Else
        Return Response;
    EndIf;

EndFunction

#EndRegion

#Region Statistics

// Get statistics
// Gets the overall community statistics for a period
//
// Parameters:
// StartDate - Date - Start date of the period - datefrom
// EndDate - Date - End date of the period - dateto
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function GetStatistics(Val StartDate, Val EndDate, Val Parameters = "") Export

    OPI_TypeConversion.GetDate(StartDate);
    OPI_TypeConversion.GetDate(EndDate);

    Parameters_ = GetStandardParameters(Parameters);

    StartDate = OPI_Tools.UNIXTime(StartDate);
    EndDate   = OPI_Tools.UNIXTime(EndDate);

    Parameters_.Insert("timestamp_from", StartDate);
    Parameters_.Insert("timestamp_to"  , EndDate);
    Parameters_.Insert("stats_groups"  , "visitors, reach, activity");

    Response = OPI_HTTPRequests.Get("api.vk.com/method/stats.get", Parameters_);

    Return Response;

EndFunction

// Get post statistics
// Gets statistics in terms of posts
//
// Parameters:
// PostIDsArray - Array of string, number - Array of post IDs - posts
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Array of Arbitrary - Array of post statistics data
Function GetPostStatistics(Val PostIDsArray, Val Parameters = "") Export

    OPI_TypeConversion.GetCollection(PostIDsArray);

    Parameters_  = GetStandardParameters(Parameters);
    AnswersArray = New Array;
    SetsArray    = New Array;
    MaximumPosts = 30;
    Response_    = "response";

    For Each Post In PostIDsArray Do

        SetsArray.Add(OPI_Tools.NumberToString(Post));

        If SetsArray.Count() = MaximumPosts Then

            NumbersString = StrConcat(SetsArray, ",");
            Parameters_.Insert("post_ids", NumbersString);

            Statistics      = OPI_HTTPRequests.Get("api.vk.com/method/stats.getPostReach", Parameters_);
            StatisticsArray = Statistics[Response_];

            For Each StatisticsItem In StatisticsArray Do
                AnswersArray.Add(StatisticsItem);
            EndDo;

            SetsArray = New Array;

        EndIf;

    EndDo;

    NumbersString = StrConcat(SetsArray, ",");
    Parameters_.Insert("post_ids", NumbersString);

    Statistics      = OPI_HTTPRequests.Get("api.vk.com/method/stats.getPostReach", Parameters_);
    StatisticsArray = Statistics[Response_];

    If TypeOf(StatisticsArray) = Type("Array") Then
        For Each StatisticsItem In StatisticsArray Do
            AnswersArray.Add(StatisticsItem);
        EndDo;
    EndIf;

    Return AnswersArray;

EndFunction

#EndRegion

#Region AdAccountManagement

// Create advertising campaign
// Creates a campaign in the selected advertising account
//
// Parameters:
// AccountID - String, Number - Advertising account ID - cabinet
// Name - String - Campaign name - title
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateAdvertisingCampaign(Val AccountID, Val Name, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(AccountID);
    OPI_TypeConversion.GetLine(Name);

    CurrentDate = OPI_Tools.GetCurrentDate();
    EndDate     = AddMonth(CurrentDate, 24);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("account_id", AccountID);

    StructuresArray = New Array;
    StartDate       = OPI_Tools.UNIXTime(CurrentDate);
    EndDate         = OPI_Tools.UNIXTime(EndDate);

    CampaignStructure = New Structure;
    CampaignStructure.Insert("type"       , "promoted_posts");
    CampaignStructure.Insert("name"       , Name);
    CampaignStructure.Insert("day_limit"  , 0);
    CampaignStructure.Insert("all_limit"  , 0);
    CampaignStructure.Insert("start_time" , StartDate);
    CampaignStructure.Insert("stop_time"  , EndDate);
    CampaignStructure.Insert("status"     , 1);

    StructuresArray.Add(CampaignStructure);

    Parameters_.Insert("data", StructuresArray);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/ads.createCampaigns", Parameters_);

    Return Response;

EndFunction

// Create advertising post
// Creates an advertising post based on a post
//
// Parameters:
// CampaignNumber - String, Number - Advertising campaign ID - campaign
// DailyLimit - String, Number - Daily limit in rubles - limit
// CategoryNumber - String, Number - Advertising category number - category
// PostID - String, Number - ID of the post used for advertising - post
// AccountID - String, Number - Advertising account ID - cabinet
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateAd(Val CampaignNumber
    , Val DailyLimit
    , Val CategoryNumber
    , Val PostID
    , Val AccountID
    , Val Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);
    GroupId     = Parameters_["group_id"];

    OPI_TypeConversion.GetLine(GroupId);
    OPI_TypeConversion.GetLine(CampaignNumber);
    OPI_TypeConversion.GetLine(DailyLimit);
    OPI_TypeConversion.GetLine(CategoryNumber);
    OPI_TypeConversion.GetLine(PostID);
    OPI_TypeConversion.GetLine(AccountID);

    Link = "https://vk.com/wall-" + GroupId + "_" + PostID;

    StructuresArray   = New Array;
    CampaignStructure = New Structure;
    CampaignStructure.Insert("campaign_id"              , CampaignNumber);
    CampaignStructure.Insert("ad_format"                , 9);
    CampaignStructure.Insert("conversion_event_id"      , 1);
    CampaignStructure.Insert("autobidding"              , 1);
    CampaignStructure.Insert("cost_type"                , 3);
    CampaignStructure.Insert("goal_type"                , 2);
    CampaignStructure.Insert("ad_platform"              , "all");
    CampaignStructure.Insert("publisher_platforms"      , "vk");
    CampaignStructure.Insert("publisher_platforms_auto" , "1");
    CampaignStructure.Insert("day_limit"                , DailyLimit);
    CampaignStructure.Insert("all_limit"                , "0");
    CampaignStructure.Insert("category1_id"             , CategoryNumber);
    CampaignStructure.Insert("age_restriction"          , 0);
    CampaignStructure.Insert("status"                   , 1);
    CampaignStructure.Insert("name"                     , "Ad");
    CampaignStructure.Insert("link_url"                 , Link);

    StructuresArray.Add(CampaignStructure);

    Parameters_.Insert("data"       , StructuresArray);
    Parameters_.Insert("account_id" , AccountID);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/ads.createAds", Parameters_);

    Return Response;

EndFunction

// Pause advertising post
// Pauses the display of the advertising post
//
// Parameters:
// AccountID - String, Number - Advertising account ID - cabinet
// AdID - String, Number - Ad ID - adv
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function PauseAdvertising(Val AccountID, Val AdID, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(AccountID);
    OPI_TypeConversion.GetLine(AdID);

    Parameters_ = GetStandardParameters(Parameters);

    Parameters_.Insert("account_id", AccountID);

    StructuresArray   = New Array;
    CampaignStructure = New Structure;

    CampaignStructure.Insert("ad_id"  , AdID);
    CampaignStructure.Insert("status" , 0);

    StructuresArray.Add(CampaignStructure);

    OPI_TypeConversion.GetLine(StructuresArray, True);

    Parameters_.Insert("data", StructuresArray);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/ads.updateAds", Parameters_);

    Return Response;

EndFunction

// Get a list of advertising categories
// Gets a list of advertising category IDs for creating an advertising post
//
// Parameters:
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function GetAdvertisingCategoryList(Val Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);
    Response    = OPI_HTTPRequests.Get("api.vk.com/method/ads.getCategories", Parameters_);

    Return Response;

EndFunction

#EndRegion

#Region ProductManagement

// Get a list of product categories
// Gets a list of product category IDs to specify when creating a product
//
// Parameters:
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of String - Key - ID, Value - Name
Function GetProductCategoryList(Val Parameters = "") Export

    Response_   = "response";
    Parameters_ = GetStandardParameters(Parameters);
    Response    = OPI_HTTPRequests.Get("api.vk.com/method/market.getCategories", Parameters_);
    Result      = Response[Response_];

    If ValueIsFilled(Result) Then

        Count = Result["count"];

        If Not ValueIsFilled(Count) Then
            Return Response;
        EndIf;

    Else
        Return Response;
    EndIf;

    Parameters_.Insert("count", Count);
    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.getCategories", Parameters_);
    Result   = Response[Response_];

    If ValueIsFilled(Result) Then

        Categories = Result["items"];

        If Not ValueIsFilled(Categories) Then
            Return Response;
        EndIf;

    Else
        Return Response;
    EndIf;

    CategoryMap = New Map;

    For Each Category In Categories Do
        CategoryMap.Insert(Category["id"], Category["name"]);
    EndDo;

    Return CategoryMap;

EndFunction

// Get product list
// Gets the community's product list
//
// Parameters:
// Selection - String, Number - Selection ID, if filtering is needed - sel
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - Array of product maps
Function GetProductList(Val Selection = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Selection);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("count"        , 200);
    Parameters_.Insert("extended"     , 1);
    Parameters_.Insert("with_disabled", 1);

    If ValueIsFilled(Selection) Then
        Parameters_.Insert("album_id", Selection);
    EndIf;

    ProductsArray = New Array;
    GetProductListRecursively(ProductsArray, Parameters_);

    Return ProductsArray;

EndFunction

// Get products by ID
// Gets information about products by array of IDs
//
// Parameters:
// Products - String, Array of String - Array of product IDs - items
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function GetProductsByID(Val Products, Val Parameters = "") Export

    OPI_TypeConversion.GetCollection(Products);

    ItemsStringsArray = New Array;
    Parameters_       = GetStandardParameters(Parameters);
    ProductsString    = "";
    OwnerID           = Parameters_["owner_id"];

    OPI_TypeConversion.GetLine(OwnerID);

    For Each Product In Products Do

        CurrentProduct = OPI_Tools.NumberToString(Product);
        CurrentProduct = OwnerID + "_" + CurrentProduct;

        ItemsStringsArray.Add(CurrentProduct);

    EndDo;

    ProductsString = StrConcat(ItemsStringsArray, ",");

    Parameters_.Insert("item_ids", ProductsString);
    Parameters_.Insert("extended", 1);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.getById", Parameters_);

    Return Response;

EndFunction

// Add product
// Adds a new product to the community's catalog
//
// Parameters:
// ProductDescription - Map Of KeyAndValue - Product description. See GetProductDescription - product
// Selection - String - Selection ID for placing the product, if needed - sel
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function AddProduct(Val ProductDescription, Val Selection = "", Val Parameters = "") Export

    Return ProductManagement(ProductDescription, , Selection, Parameters);

EndFunction

// Edit product
// Edits a previously created product
//
// Parameters:
// Product - Number, String - Identifier of the product being edited - item
// ProductDescription - Map Of KeyAndValue - Product description. See GetProductDescription - product
// Selection - String - Identifier of the new selection, if needed - sel
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function EditProduct(Val Product, Val ProductDescription, Val Selection = "", Val Parameters = "") Export

    Return ProductManagement(ProductDescription, Product, Selection, Parameters);

EndFunction

// Delete product
// Deletes a previously created product
//
// Parameters:
// Product - String, Number - Product ID - item
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function DeleteProduct(Val Product, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Product);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("item_id", Product);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.delete", Parameters_);

    Return Response;

EndFunction

// Group products
// Groups products based on similar sets of properties
//
// Parameters:
// ProductsArray - Array Of String - Array of product IDs - items
// ExistingGroup - String - ID of the existing group, if needed - sellgroup
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function GroupProducts(Val ProductsArray, Val ExistingGroup = "", Val Parameters = "") Export

    OPI_TypeConversion.GetLine(ExistingGroup);
    OPI_TypeConversion.GetCollection(ProductsArray);

    Parameters_      = GetStandardParameters(Parameters);
    ArrayOfProducts_ = New Array;

    For Each Product In ProductsArray Do
        ArrayOfProducts_.Add(OPI_Tools.NumberToString(Product));
    EndDo;

    Products = StrConcat(ArrayOfProducts_, ",");

    Parameters_.Insert("item_ids", Products);

    If ValueIsFilled(ExistingGroup) Then
        Parameters_.Insert("item_group_id", ExistingGroup);
    EndIf;

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.groupItems", Parameters_);

    Return Response;

EndFunction

// Get product description
// Gets the description template for creating a product
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Map Of KeyAndValue - Fields map
Function GetProductDescription(Val Clear = False) Export

    Product = New Map();
    Product.Insert("Name"             , "New product"); // Product name
    Product.Insert("Description"      , "Product description"); // Product description
    Product.Insert("Category"         , "20173"); // See GetProductCategoryList()
    Product.Insert("Price"            , 1); // Price.
    Product.Insert("OldPrice"         , Undefined); // For reflection change price
    Product.Insert("MainPhoto"        , Undefined); // BD or path to main. photo
    Product.Insert("URL"              , Undefined); // Link to page store
    Product.Insert("AdditionalPhotos" , New Array); // Array paths or BD for add. photo
    Product.Insert("PropertyValues"   , New Array); // Values properties (variants). Maximum 2
    Product.Insert("MainInGroup"      , False); // Make main in of its group
    Product.Insert("Width"            , Undefined); // In millimeters
    Product.Insert("Height"           , Undefined); // In millimeters
    Product.Insert("Depth"            , Undefined); // In millimeters
    Product.Insert("Weight"           , Undefined); // In grams
    Product.Insert("SKU"              , Undefined); // Article
    Product.Insert("AvailableBalance" , 1);

    If Clear Then
        For Each DescField In Product Do
            Product.Insert(DescField.Key, "");
        EndDo;
    EndIf;

    Return Product;

EndFunction

#EndRegion

#Region ProductSelectionManagement

// Get selection list
// Gets the list of product selections
//
// Parameters:
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - Array of selection maps
Function GetSelectionList(Val Parameters = "") Export

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("count", 100);

    ArrayOfAlbums = New Array;
    GetAlbumListRecursively(ArrayOfAlbums, Parameters_);

    Return ArrayOfAlbums;

EndFunction

// Get selections by ID
// Gets the list of selections by array of IDs
//
// Parameters:
// Selections - String, Array of String - Selection IDs - sels
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function GetSelectionsByID(Val Selections, Val Parameters = "") Export

    OPI_TypeConversion.GetCollection(Selections);

    Parameters_      = GetStandardParameters(Parameters);
    Selections_      = New Array;
    SelectionsString = "";

    For Each Selection In Selections Do
        Selections_.Add(OPI_Tools.NumberToString(Selection));
    EndDo;

    SelectionsString = StrConcat(Selections_, ",");

    Parameters_.Insert("album_ids", SelectionsString);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.getAlbumById", Parameters_);

    Return Response;

EndFunction

// Create product selection
// Creates an empty product selection
//
// Parameters:
// Name - String - Selection name - title
// Image - String, BinaryData - Image file - picture
// Main - Boolean - Main - main
// Hidden - Boolean - Hidden - hidden
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateProductCollection(Val Name
    , Val Image
    , Val Main = False
    , Val Hidden = False
    , Val Parameters = "") Export

    Return SelectionManagement(Name, Image, , Main, Hidden, Parameters);

EndFunction

// Edit product selection
// Edits the properties of a product selection
//
// Parameters:
// Name - String - New selection name - title
// Selection - String - Selection ID - sel
// Image - String, BinaryData - New selection image - picture
// Main - Boolean - Main - main
// Hidden - Boolean - Hidden - hidden
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function EditProductCollection(Val Name
    , Val Selection
    , Val Image = ""
    , Val Main = False
    , Val Hidden = False
    , Val Parameters = "") Export

    Return SelectionManagement(Name, Image, Selection, Main, Hidden, Parameters);

EndFunction

// Add product to selection
// Adds a product to the selection
//
// Parameters:
// ProductsArray - Array of string, number - Array of products or product - items
// Selection - String - Selection ID - sel
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function AddProductToCollection(Val ProductsArray, Val Selection, Val Parameters = "") Export

    OPI_TypeConversion.GetCollection(ProductsArray);
    OPI_TypeConversion.GetLine(Selection);

    Parameters_      = GetStandardParameters(Parameters);
    ArrayOfProducts_ = New Array;

    For Each Product In ProductsArray Do
        ArrayOfProducts_.Add(OPI_Tools.NumberToString(Product));
    EndDo;

    ProductList = StrConcat(ArrayOfProducts_, ",");

    Parameters_.Insert("item_ids" , ProductList);
    Parameters_.Insert("album_ids", Selection);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.addToAlbum", Parameters_);

    Return Response;

EndFunction

// Remove product from selection
// Removes a previously added product from the selection
//
// Parameters:
// Product - String - Product ID - item
// Selection - String - Selection ID - sel
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function RemoveProductFromSelection(Val Product, Val Selection, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Product);
    OPI_TypeConversion.GetLine(Selection);

    Parameters_ = GetStandardParameters(Parameters);

    Parameters_.Insert("item_id"  , Product);
    Parameters_.Insert("album_ids", Selection);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.removeFromAlbum", Parameters_);

    Return Response;

EndFunction

// Delete selection
// Deletes the selection by ID
//
// Parameters:
// Selection - String - Selection ID - sel
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function DeleteSelection(Val Selection, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Selection);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("album_id", Selection);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.deleteAlbum", Parameters_);

    Return Response;

EndFunction

#EndRegion

#Region ProductPropertiesManagement

// Get property list
// Gets the list of properties of group products
//
// Parameters:
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function GetPropertyList(Val Parameters = "") Export

    Response_   = "response";
    Parameters_ = GetStandardParameters(Parameters);

    Response   = OPI_HTTPRequests.Get("api.vk.com/method/market.getProperties", Parameters_);
    Properties = Response[Response_]["items"];

    Return Properties;

EndFunction

// Create product property
// Creates a new property for use in products
//
// Parameters:
// Name - String - Property name - title
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function CreateProductProperty(Val Name, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Name);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("title", Name);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.addProperty", Parameters_);

    Return Response;

EndFunction

// Edit product property
// Edits the existing product property
//
// Parameters:
// Name - String - New name - title
// Property - String, Number - Property ID - prop
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function EditProductProperty(Val Name, Val Property, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(Property);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("title"      , Name);
    Parameters_.Insert("property_id", Property);
    Parameters_.Insert("type"       , "text");

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.editProperty", Parameters_);

    Return Response;

EndFunction

// Delete product property
// Deletes the existing product property
//
// Parameters:
// Property - String, Number - Property ID - prop
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function DeleteProductProperty(Val Property, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Property);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("property_id", Property);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.deleteProperty", Parameters_);

    Return Response;

EndFunction

// Add product property variant
// Adds a variant for an existing property
//
// Parameters:
// Value - String - Property value - value
// Property - String, Number - Property ID where the variant is added - prop
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function AddProductPropertyVariant(Val Value, Val Property, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Property);
    OPI_TypeConversion.GetLine(Value);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("property_id", Property);
    Parameters_.Insert("title"      , Value);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.addPropertyVariant", Parameters_);

    Return Response;

EndFunction

// Edit product property variant
// Edits the value of an existing product property variant
//
// Parameters:
// Value - String - New property value - value
// Property - String, Number - Property ID - prop
// Option - String, Number - Variant ID - option
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function EditProductPropertyVariant(Val Value, Val Property, Val Option, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Value);
    OPI_TypeConversion.GetLine(Property);
    OPI_TypeConversion.GetLine(Option);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("property_id", Property);
    Parameters_.Insert("variant_id" , Option);
    Parameters_.Insert("title"      , Value);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.editPropertyVariant", Parameters_);

    Return Response;

EndFunction

// Delete product property variant
// Deletes the previously created product property variant
//
// Parameters:
// Option - String, Number - Variant ID - option
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function DeleteProductPropertyVariant(Val Option, Val Parameters = "") Export

    OPI_TypeConversion.GetLine(Option);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("variant_id", Option);

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market.deletePropertyVariant", Parameters_);

    Return Response;

EndFunction

#EndRegion

#Region OrderManagement

// Get order list
// Returns the community's order list
//
// Parameters:
// Parameters - Structure Of String - Authorization parameters. See GetAuthParameters - auth
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK
Function GetOrderList(Val Parameters = "") Export

    Parameters = GetStandardParameters(Parameters);
    Parameters.Insert("count", 50);

    ArrayOfOrders = New Array;
    GetOrderListRecursively(ArrayOfOrders, Parameters);

    Return ArrayOfOrders;

EndFunction

#EndRegion

#Region Others

// Create keyboard
// Forms a keyboard from an array of buttons
//
// Parameters:
// ButtonArray - Array of String - Array of button titles - buttons
//
// Returns:
// String - Keyboard JSON
Function FormKeyboard(Val ButtonArray) Export

    OPI_TypeConversion.GetCollection(ButtonArray);

    Keyboard      = New Structure;
    KeyboardArray = New Array;
    ArrayBlock    = New Array;

    For Each Action In ButtonArray Do

        Button     = New Structure;
        Expression = New Structure;

        Expression.Insert("type" , "text");
        Expression.Insert("label", Action);

        Button.Insert("action", Expression);
        ArrayBlock.Add(Button);

    EndDo;

    KeyboardArray.Add(ArrayBlock);

    Keyboard.Insert("buttons" , KeyboardArray);
    Keyboard.Insert("one_time", False);

    Return OPI_Tools.JSONString(Keyboard, , False);

EndFunction

#EndRegion

#EndRegion

#Region Private

Function GetStandardParameters(Val Parameters = "")

    // Here is a collection of data definitions for working with the VK API
    // You can override them by passing them as a parameter
    // Matching fields will be overwritten with the parameter of the function

    Parameters_ = New Structure;

    // access_token - can be obtained in the browser via the URL from the CreateTokenRetrievalLink function()
    // from_group - actions will be performed on behalf of the group
    // owner_id - group ID with "-" at the beginning. Can be found in the settings of the VK group or in its URL if not set
    // set your
    // app_id - application ID that needs to be created in the profile on the developer page
    // group_id - owner_id, but without "-"

    Parameters_.Insert("access_token" , "");
    Parameters_.Insert("from_group"   , "1");
    Parameters_.Insert("owner_id"     , "");
    Parameters_.Insert("v"            , "5.131");
    Parameters_.Insert("app_id"       , "");
    Parameters_.Insert("group_id"     , "");

    OPI_TypeConversion.GetCollection(Parameters);

    If TypeOf(Parameters) = Type("Structure") Or TypeOf(Parameters) = Type("Map") Then
        For Each PassedParameter In Parameters Do
            Parameters_.Insert(PassedParameter.Key, OPI_Tools.NumberToString(PassedParameter.Value));
        EndDo;
    EndIf;

    Return Parameters_;

EndFunction

Function GetImageID(Val Image, Val Parameters, Val View)

    Response_ = "response";
    Response  = UploadPhotoToServer(Image, Parameters, View);
    Result    = Response[Response_];

    If ValueIsFilled(Result) Then
        PhotoID = Result["photo_id"];

        If Not ValueIsFilled(PhotoID) Then
            Return Response;
        EndIf;

    Else
        Return Response;
    EndIf;

    PhotoID = OPI_Tools.NumberToString(PhotoID);
    Return PhotoID;

EndFunction

Function GetImageMap(Val Image, Val Parameters, Val View)

    Response      = UploadPhotoToServer(Image, Parameters, View);
    ResponseArray = Response.Get("response");

    If Not ValueIsFilled(ResponseArray) Or Not TypeOf(ResponseArray) = Type("Array") Then
        Return Response;
    Else
        If ResponseArray.Count()                                     = 0 Then
            Return Response;
        Else
            ResponseMap                                              = ResponseArray[0];
        EndIf;
    EndIf;

    Return ResponseMap;

EndFunction

Function GetSelectionArray(Val Selections, Val Parameters = "")

    Response_  = "response";
    Selections = GetSelectionsByID(Selections, Parameters);
    Result     = Selections[Response_];

    If ValueIsFilled(Result) Then

        SelectionArray = Result["items"];

        If Not ValueIsFilled(SelectionArray) Then
            Return Selections;
        EndIf;

    Else
        Return Selections;
    EndIf;

    Return SelectionArray;

EndFunction

Function DetermineImageUploadMethod(Val View)

    MethodMap = New Map;
    Upload    = "Upload";
    Save      = "Save";
    Way       = "Way";
    Photo     = "Photo";

    If View = "Post" Then

        MethodMap.Insert(Upload , "photos.getWallUploadServer");
        MethodMap.Insert(Save   , "photos.saveWallPhoto");
        MethodMap.Insert(Photo  , "photo");
        MethodMap.Insert(Way    , 1);

    ElsIf View = "Product" Then

        MethodMap.Insert(Upload , "market.getProductPhotoUploadServer");
        MethodMap.Insert(Save   , "market.saveProductPhoto");
        MethodMap.Insert(Way    , 2);

    ElsIf View = "Story" Then

        MethodMap.Insert(Upload , "stories.getPhotoUploadServer");
        MethodMap.Insert(Save   , "stories.save");
        MethodMap.Insert(Way    , 3);

    ElsIf View = "Poll" Then

        MethodMap.Insert(Upload , "polls.getPhotoUploadServer");
        MethodMap.Insert(Save   , "polls.savePhoto");
        MethodMap.Insert(Photo  , "photo");
        MethodMap.Insert(Way    , 1);

    Else

        MethodMap.Insert(Upload , "photos.getUploadServer");
        MethodMap.Insert(Save   , "photos.save");
        MethodMap.Insert(Photo  , "photos_list");
        MethodMap.Insert(Way    , 1);

    EndIf;

    Return MethodMap;

EndFunction

Function GetProductParameterMapping()

    Fields = New Map();
    Fields.Insert("Name"             , "name");
    Fields.Insert("Description"      , "description");
    Fields.Insert("Category"         , "category_id");
    Fields.Insert("Price"            , "price");
    Fields.Insert("OldPrice"         , "old_price");
    Fields.Insert("URL"              , "url");
    Fields.Insert("MainInGroup"      , "is_main_variant");
    Fields.Insert("Width"            , "dimension_width");
    Fields.Insert("Height"           , "dimension_height");
    Fields.Insert("Depth"            , "dimension_length");
    Fields.Insert("Weight"           , "weight");
    Fields.Insert("SKU"              , "sku");
    Fields.Insert("AvailableBalance" , "stock_amount");

    Return Fields;

EndFunction

Function ProductManagement(Val ProductDescription, Val ProductID = "", Val Selection = "", Val Parameters = "")

    OPI_TypeConversion.GetLine(ProductID);
    OPI_TypeConversion.GetLine(Selection);
    OPI_TypeConversion.GetCollection(ProductDescription);

    Parameters_ = GetStandardParameters(Parameters);
    Parameters_.Insert("v", "5.199");

    Response_ = "response";

    FillProductRequestFields(ProductDescription, Parameters_);

    If ValueIsFilled(ProductID) Then
        Parameters_.Insert("item_id", ProductID);
        Method = "edit";
    Else
        Method = "add";
    EndIf;

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market." + Method, Parameters_);
    Result   = Response[Response_];

    If Not ValueIsFilled(ProductID) And ValueIsFilled(Result) Then

        ProductID = Result["market_item_id"];

        If Not ValueIsFilled(ProductID) Then
            Return Response;
        EndIf;

    Else
        Return Response;
    EndIf;

    If ValueIsFilled(Selection) And ValueIsFilled(ProductID) Then
        AddProductToCollection(ProductID, Selection, Parameters_);
    EndIf;

    Return Response;

EndFunction

Function SelectionManagement(Val Name
    , Val Image       = ""
    , Val SelectionID = ""
    , Val Main        = False
    , Val Hidden      = False
    , Val Parameters  = "")

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetLine(SelectionID);
    OPI_TypeConversion.GetBoolean(Main);
    OPI_TypeConversion.GetBoolean(Hidden);

    Parameters_ = GetStandardParameters(Parameters);
    Response    = AddImageParameter(Image, SelectionID, Parameters_);

    If ValueIsFilled(Response) Then
        Return Response;
    EndIf;

    Parameters_.Insert("title"      , Name);
    Parameters_.Insert("main_album" , ?(Main   , 1, 0));
    Parameters_.Insert("is_hidden"  , ?(Hidden , 1, 0));

    If ValueIsFilled(SelectionID) Then
        Parameters_.Insert("album_id", SelectionID);
        Method = "editAlbum";
    Else
        Method = "addAlbum";
    EndIf;

    Response = OPI_HTTPRequests.Get("api.vk.com/method/market." + Method, Parameters_);

    Return Response;

EndFunction

Function AddImageParameter(Val Image, Val SelectionID, Parameters)

    PhotoID_ = "photo_id";

    If ValueIsFilled(Image) Then

        PhotoID = GetImageID(Image, Parameters, "Product");

        If Not TypeOf(PhotoID) = Type("String") Then
            Return PhotoID;
        EndIf;

        Parameters.Insert(PhotoID_, PhotoID);

    Else

        If ValueIsFilled(SelectionID) Then

            Selections = GetSelectionArray(SelectionID, Parameters);

            If Not TypeOf(Selections) = Type("Array") Then
                Return Selections;
            EndIf;

            If Not Selections.Count() = 0 Then
                PhotoID               = Selections[0]["photo"]["id"];
                OPI_TypeConversion.GetLine(PhotoID);
                Parameters.Insert(PhotoID_, PhotoID);
            EndIf;

        EndIf;

    EndIf;

    Return "";

EndFunction

Function FillPhotoUploadParameters(Val Method, Val Response, Parameters)

    Response_      = "response";
    Way            = Method["Way"];
    StandardMethod = 1;
    NewMethod      = 2;

    If Way = StandardMethod Then

        Hash  = "hash";
        Serv  = "server";
        Aid   = "aid";
        Photo = Method["Photo"];

        PhotoID = Response[Photo];

        If Not ValueIsFilled(PhotoID) Then
            Return False;
        EndIf;

        Parameters.Insert(Hash , Response[Hash]);
        Parameters.Insert(Photo, Response[Photo]);

        PhotoServer = Response.Get(Serv);

        If ValueIsFilled(PhotoServer) Then
            PhotoServer = OPI_Tools.NumberToString(PhotoServer);
            Parameters.Insert(Serv, PhotoServer);
        EndIf;

        Identifier = Response.Get(Aid);

        If ValueIsFilled(Identifier) Then
            Identifier = OPI_Tools.NumberToString(Identifier);
            Parameters.Insert(Aid , Identifier);
        EndIf;

    ElsIf Way = NewMethod Then

        If Not ValueIsFilled(Response["album_id"]) Or Not ValueIsFilled(Response["meta"]) Then
            Return False;
        EndIf;

        Parameters.Insert("upload_response", Response);

    Else

        UploadResponse = Response[Response_];

        If Not ValueIsFilled(UploadResponse) Then
            Return False;
        EndIf;

        UploadResult = UploadResponse["upload_result"];

        If Not ValueIsFilled(UploadResult) Then
            Return False;
        EndIf;

        Parameters.Insert("upload_results", UploadResult);

    EndIf;

    Return True;

EndFunction

Procedure FillProductRequestFields(Val ProductDescription, Parameters)

    Response_       = "response";
    MainPhoto       = ProductDescription["MainPhoto"];
    AdditionalPhoto = ProductDescription["AdditionalPhotos"];
    Properties      = ProductDescription["PropertyValues"];

    If ValueIsFilled(MainPhoto) Then

        Response = UploadPhotoToServer(MainPhoto, Parameters, "Product");
        Result   = Response[Response_];

        If ValueIsFilled(Result) Then

            PhotoID = Result["photo_id"];

            If Not ValueIsFilled(PhotoID) Then
                Return;
            EndIf;

        Else
            Return;
        EndIf;

        PhotoID = OPI_Tools.NumberToString(PhotoID);
        Parameters.Insert("main_photo_id", PhotoID);

    EndIf;

    If TypeOf(Properties) = Type("Array") Then

        Properties_ = New Array;

        For Each Property In Properties Do
            Properties_.Add(OPI_Tools.NumberToString(Property));
        EndDo;

        Properties = StrConcat(Properties_, ",");

    EndIf;

    If ValueIsFilled(Properties) Then
        Parameters.Insert("variant_ids", OPI_Tools.NumberToString(Properties));
    EndIf;

    AddAdditionalProductPhotos(AdditionalPhoto, Parameters);

    For Each Field In GetProductParameterMapping() Do

        Value = ProductDescription[Field.Key];

        If Value <> Undefined Then
            Parameters.Insert(Field.Value, ProductDescription[Field.Key]);
        EndIf;

    EndDo;

EndProcedure

Procedure AddAdditionalProductPhotos(Val PhotoArray, Parameters)

    If TypeOf(PhotoArray) = Type("Array") Then
        If PhotoArray.Count() > 0 Then

            PhotoString = "";

            For Each Photo In PhotoArray Do

                PhotoID = GetImageID(Photo, Parameters, "Product");

                If Not TypeOf(PhotoID) = Type("String") Then
                    Return;
                EndIf;

                PhotoString = PhotoString + PhotoID + ",";

            EndDo;

            PhotoString = Left(PhotoString, StrLen(PhotoString) - 1);
            Parameters.Insert("photo_ids", PhotoString);
        EndIf;
    EndIf;

EndProcedure

Procedure GetProductListRecursively(ProductsArray, Parameters, Shift = 0)

    Response_    = "response";
    MaxInRequest = 200;
    Response     = OPI_HTTPRequests.Get("api.vk.com/method/market.get", Parameters);
    Products     = Response[Response_]["items"];

    If Products.Count() = 0 Then
        Return;
    EndIf;

    For Each Product In Products Do
        ProductsArray.Add(Product);
    EndDo;

    Shift = Shift + MaxInRequest;
    Parameters.Insert("offset", Shift);
    GetProductListRecursively(ProductsArray, Parameters, Shift);

EndProcedure

Procedure GetAlbumListRecursively(ArrayOfAlbums, Parameters, Shift = 0)

    Response_    = "response";
    MaxInRequest = 100;
    Response     = OPI_HTTPRequests.Get("api.vk.com/method/market.getAlbums", Parameters);
    Albums       = Response[Response_]["items"];

    If Albums.Count() = 0 Then
        Return;
    EndIf;

    For Each Album In Albums Do
        ArrayOfAlbums.Add(Album);
    EndDo;

    Shift = Shift + MaxInRequest;
    Parameters.Insert("offset", Shift);
    GetAlbumListRecursively(ArrayOfAlbums, Parameters, Shift);

EndProcedure

Procedure GetOrderListRecursively(ArrayOfOrders, Parameters, Shift = 0)

    Response_    = "response";
    MaxInRequest = 50;
    Response     = OPI_HTTPRequests.Get("api.vk.com/method/market.getGroupOrders", Parameters);
    Orders       = Response[Response_]["items"];

    If Orders.Count() = 0 Then
        Return;
    EndIf;

    For Each Order In Orders Do
        ArrayOfOrders.Add(Order);
    EndDo;

    Shift = Shift + MaxInRequest;
    Parameters.Insert("offset", Shift);
    GetOrderListRecursively(ArrayOfOrders, Parameters, Shift);

EndProcedure

#EndRegion
