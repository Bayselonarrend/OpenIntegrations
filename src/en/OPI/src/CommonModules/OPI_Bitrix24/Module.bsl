// OneScript: ./OInt/core/Modules/OPI_Bitrix24.os
// Lib: Bitrix24
// CLI: bitrix24
// Keywords: bitrix24, b24, bitrix

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Region Public

#Region SettingsAndAdministartion

// Get app authentication link
// Forms a link for authorization via the browser
//
// Parameters:
// Domain - String - Current Bitrix URL (like 'portal.bitrix24.com') - domain
// ClientID - String - Client ID from app settings - clientid
//
// Returns:
// String - URL for browser transition
Function GetAppAuthLink(Val Domain, Val ClientID) Export

    OPI_TypeConversion.GetLine(Domain);
    OPI_TypeConversion.GetLine(ClientID);

    If Not StrStartsWith(Domain, "http") Then
        URL = "https://" + Domain;
    EndIf;

    If Not StrEndsWith(URL, "/") Then
        URL = URL + "/";
    EndIf;

    URL = URL + "oauth/authorize/?client_id=" + ClientID;

    Return URL;

EndFunction

// Get token
// Get token by auth code
//
// Parameters:
// ClientID - String - Client ID from app settings - clientid
// ClientSecret - String - Client secret from app settings - clientsecret
// Code - String - Code from browser auth page - code
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetToken(Val ClientID, Val ClientSecret, Val Code) Export

    URL     = "https://oauth.bitrix.info/oauth/token/";
    String_ = "String";

    Parameters = New Structure;
    OPI_Tools.AddField("grant_type"   , "authorization_code", String_, Parameters);
    OPI_Tools.AddField("client_id"    , ClientID            , String_, Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret        , String_, Parameters);
    OPI_Tools.AddField("code"         , Code                , String_, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Refresh token
// Update token by refresh token
//
// Parameters:
// ClientID - String - Client ID from app settings - clientid
// ClientSecret - String - Client secret from app settings - clientsecret
// Refresh - String - Refresh token - refresh
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RefreshToken(Val ClientID, Val ClientSecret, Val Refresh) Export

    URL     = "https://oauth.bitrix.info/oauth/token/";
    String_ = "String";

    Parameters = New Structure;
    OPI_Tools.AddField("grant_type"   , "refresh_token" , String_, Parameters);
    OPI_Tools.AddField("client_id"    , ClientID        , String_, Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret    , String_, Parameters);
    OPI_Tools.AddField("refresh_token", Refresh         , String_, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Server time
// Get current server time
//
// Note:
// Method at API documentation: [server_time](@dev.1c-bitrix.ru/rest_help/general/server_time.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ServerTime(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "server.time");
    Response   = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region FeedPostsManagement

// Create post
// Create a new post at news feed
//
// Note:
// Method at API documentation: [log.blogpost.add](@dev.1c-bitrix.ru/rest_help/log/log_blogpost_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Text - String - Text of post - text
// Visibility - String - Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group - vision
// Files - Map Of KeyAndValue - Key > file name, value > path or binary data - files
// Title - String - Post title - title
// Important - Boolean - Mark post as important - important
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreatePost(Val URL
    , Val Text
    , Val Visibility = "UA"
    , Val Files = ""
    , Val Title = ""
    , Val Important = False
    , Val Token = "") Export

    MakeBoolean(Important);

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "log.blogpost.add");
    OPI_Tools.AddField("POST_MESSAGE", Text       , String_ , Parameters);
    OPI_Tools.AddField("POST_TITLE"  , Title      , String_ , Parameters);
    OPI_Tools.AddField("DEST"        , Visibility , "Array" , Parameters);
    OPI_Tools.AddField("IMPORTANT"   , Important  , String_ , Parameters);

    If ValueIsFilled(Files) Then

        OPI_TypeConversion.GetCollection(Files);

        ArrayOfFiles = NormalizeFiles(Files);

        If Not ArrayOfFiles.Count() = 0 Then
            Parameters.Insert("FILES", ArrayOfFiles);
        EndIf;

    EndIf;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update post
// Change post data
//
// Note:
// Method at API documentation: [log.blogpost.update](@dev.1c-bitrix.ru/rest_help/log/log_blogpost_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Post ID - postid
// Text - String - Text of post - text
// Visibility - String - Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group - vision
// Files - Map Of KeyAndValue - Key > file name, value > path or binary data - files
// Title - String - Post title - title
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdatePost(Val URL
    , Val PostID
    , Val Text
    , Val Visibility = "UA"
    , Val Files = ""
    , Val Title = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "log.blogpost.update");
    OPI_Tools.AddField("POST_MESSAGE", Text       , String_ , Parameters);
    OPI_Tools.AddField("POST_TITLE"  , Title      , String_ , Parameters);
    OPI_Tools.AddField("DEST"        , Visibility , "Array" , Parameters);
    OPI_Tools.AddField("POST_ID"     , PostID     , String_ , Parameters);

    If ValueIsFilled(Files) Then

        OPI_TypeConversion.GetCollection(Files);

        ArrayOfFiles = NormalizeFiles(Files);

        If Not ArrayOfFiles.Count() = 0 Then
            Parameters.Insert("FILES", ArrayOfFiles);
        EndIf;

    EndIf;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete post
// Remove post from a news feed
//
// Note:
// Method at API documentation: [log.blogpost.delete](@dev.1c-bitrix.ru/rest_help/log/log_blogpost_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Id of post to remove - postid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeletePost(Val URL, Val PostID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "log.blogpost.delete");
    OPI_Tools.AddField("POST_ID", PostID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get list of important post viewers
// Return list of important post viewers ids
//
// Note:
// Method at API documentation: [log.blogpost.getusers.important](@dev.1c-bitrix.ru/rest_help/log/log_blogpost_getusers_important.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Id of important post - postid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetImportantPostViewers(Val URL, Val PostID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "log.blogpost.getusers.important");
    OPI_Tools.AddField("POST_ID", PostID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get posts
// Gen post or array of post with ID or rights selection
//
// Note:
// Method at API documentation: [log.blogpost.get](@dev.1c-bitrix.ru/rest_help/log/log_blogpost_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Id of important post - postid
// Filter - String - Post selection by rights: UA all, SGn work group, Un user, DRn depart, Gn group - sel
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetPosts(Val URL, Val PostID = "", Val Filter = "UA", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "log.blogpost.get");

    OPI_Tools.AddField("POST_ID"   , PostID , "String", Parameters);
    OPI_Tools.AddField("LOG_RIGHTS", Filter , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add comment to post
// Adds a comment to the post
//
// Note:
// Method at API documentation: [log.blogcomment.add](@dev.1c-bitrix.ru/rest_help/log/log_blogcomment_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Post ID - postid
// Text - String - Comment text - text
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddPostComment(Val URL, Val PostID, Val Text, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "log.blogcomment.add");

    OPI_Tools.AddField("POST_ID", PostID, "String", Parameters);
    OPI_Tools.AddField("TEXT"   , Text  , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add new recipients to a post
// Adds new groups or users to the recipients
//
// Note:
// Method at API documentation: [log.blogpost.share](@dev.1c-bitrix.ru/rest_help/log/log_blogpost_share.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Post ID - postid
// Visibility - String - Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group - vision
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddPostRecipients(Val URL, Val PostID, Val Visibility, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "log.blogpost.share");

    OPI_Tools.AddField("POST_ID", PostID    , "String", Parameters);
    OPI_Tools.AddField("DEST"   , Visibility, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region TasksManagement

// Get task
// Get task by ID
//
// Note:
// Method at API documentation: [tasks.task.get](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.get", Token, "taskId");
    Return Response;

EndFunction

// Get tasks list
// Get tasks list (50 at one response max) with or without filtering
//
// Note:
// Method at API documentation: [tasks.task.list](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_list.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Filter - Structure of KeyAndValue - Lead filter structure. See GetLeadFilterStructure - filter
// Indent - Number, String - Offset of tasks list - offset
// Token - String - Access token, when app auth method used - token
// Fields - String, Array of String - A list of task fields in the response. All non calculable by default - select
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTasksList(Val URL, Val Filter = "", Val Indent = 0, Val Token = "", Val Fields = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.list");
    OPI_Tools.AddField("filter", Filter , "Collection", Parameters);
    OPI_Tools.AddField("start" , Indent , "String"    , Parameters);
    OPI_Tools.AddField("select", Fields , "Array"     , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Create task
// Create new task by fields structure
//
// Note:
// Method at API documentation: [tasks.task.add](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldsStructure - Structure Of KeyAndValue - Task fields structure. See GetTaskFieldsStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateTask(Val URL, Val FieldsStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.add");
    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update task
// Update a task
//
// Note:
// Method at API documentation: [tasks.task.update](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// FieldsStructure - Structure Of KeyAndValue - Task fields structure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateTask(Val URL, Val TaskID, Val FieldsStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.update");
    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);
    OPI_Tools.AddField("taskId", TaskID         , "String"    , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete task
// Delete task by ID
//
// Note:
// Method at API documentation: [tasks.task.delete](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.delete", Token, "taskId");
    Return Response;

EndFunction

// Attach file to the topic
// Attaches a file to the selected task
//
// Note:
// Method at API documentation: [tasks.task.files.attach](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_files_attach.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// FileID - Number, String - File ID - fileid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AttachFileToTopic(Val URL, Val TaskID, Val FileID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.files.attach");
    OPI_Tools.AddField("fileId", FileID , "String", Parameters);
    OPI_Tools.AddField("taskId", TaskID , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Approve task
// Approve task by ID
//
// Note:
// Method at API documentation: [tasks.task.approve](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_approve.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ApproveTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.approve", Token, "taskId");
    Return Response;

EndFunction

// Disapprove task
// Disapprove task by ID
//
// Note:
// Method at API documentation: [tasks.task.disapprove](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_disapprove.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DisapproveTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.disapprove", Token, "taskId");
    Return Response;

EndFunction

// Complete task
// Complete task by ID
//
// Note:
// Method at API documentation: [tasks.task.complete](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_complete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CompleteTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.complete", Token, "taskId");
    Return Response;

EndFunction

// Renew task
// Returns a task to work by ID
//
// Note:
// Method at API documentation: [tasks.task.renew](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_renew.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenewTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.renew", Token, "taskId");
    Return Response;

EndFunction

// Defer task
// Defer task by ID
//
// Note:
// Method at API documentation: [tasks.task.defer](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_defer.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeferTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.defer", Token, "taskId");
    Return Response;

EndFunction

// Pause task
// Pause a task by ID
//
// Note:
// Method at API documentation: [tasks.task.pause](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_pause.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function PauseTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.pause", Token, "taskId");
    Return Response;

EndFunction

// Start a task
// Start a task by ID
//
// Note:
// Method at API documentation: [tasks.task.start](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_start.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StartTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.start", Token, "taskId");
    Return Response;

EndFunction

// Start watching a task
// Start watching a task by ID
//
// Note:
// Method at API documentation: [tasks.task.startwatch](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_startwatch.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StartWatchingTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.startwatch", Token, "taskId");
    Return Response;

EndFunction

// Stop watching the task
// Stop watching a task by ID
//
// Note:
// Method at API documentation: [tasks.task.stopwatch](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_stopwatch.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StopWatchingTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.stopwatch", Token, "taskId");
    Return Response;

EndFunction

// Delegate task
// Delegate task to another user
//
// Note:
// Method at API documentation: [tasks.task.delegate](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_delegate.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// UserID - Number, String - ID of responsible user - user
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DelegateTask(Val URL, Val TaskID, Val UserID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.delegate");
    OPI_Tools.AddField("taskId", TaskID , "String", Parameters);
    OPI_Tools.AddField("userId", UserID , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add task to favorites list
// Add task to favorites list
//
// Note:
// Method at API documentation: [tasks.task.favorite.add](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_favorite_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddTaskToFavorites(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.favorite.add", Token, "taskId");
    Return Response;

EndFunction

// Remove task from favorites list
// Delete task from favorites list
//
// Note:
// Method at API documentation: [tasks.task.favorite.remove](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_favorite_remove.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RemoveTaskFromFavorites(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.favorite.remove", Token, "taskId");
    Return Response;

EndFunction

// Get task history
// Get history of task changing
//
// Note:
// Method at API documentation: [tasks.task.history.list](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_history_list.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskHistory(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.history.list", Token, "taskId");
    Return Response;

EndFunction

// Check task accesses for users
// Checks the availability of the task for users
//
// Note:
// Method at API documentation: [tasks.task.getaccess](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_getaccess.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Users - Array of String - User IDs for access checking - users
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CheckTaskAccesses(Val URL, Val TaskID, Val Users = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.getaccess");
    OPI_Tools.AddField("taskId", TaskID , "String" , Parameters);
    OPI_Tools.AddField("users" , Users  , "Array"  , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Mute task
// Mute task by ID
//
// Note:
// Method at API documentation: [tasks.task.mute](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/mute_unmute.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MuteTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.mute", Token, "taskId");
    Return Response;

EndFunction

// Unmute task
// Unmute task by ID
//
// Note:
// Method at API documentation: [tasks.task.unmute](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/mute_unmute.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UnmuteTask(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.unmute", Token, "taskId");
    Return Response;

EndFunction

// Create tasks dependencies
// Creates the dependency of one task to another
//
// Note:
// Method at API documentation: [task.dependence.add](@dev.1c-bitrix.ru/rest_help/tasks/task/dependence/task_dependence_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FromID - String, Number - From task ID - taskfrom
// DestinationID - String, Number - To task ID - taskto
// LinkType - String, Number - Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish - linktype
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateTasksDependencies(Val URL, Val FromID, Val DestinationID, Val LinkType, Val Token = "") Export

    String_ = "String";

    OPI_TypeConversion.GetLine(LinkType);

    Parameters = NormalizeAuth(URL, Token, "task.dependence.add");
    OPI_Tools.AddField("taskIdFrom", FromID       , String_, Parameters);
    OPI_Tools.AddField("taskIdTo"  , DestinationID, String_, Parameters);
    OPI_Tools.AddField("linkType"  , LinkType     , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete tasks dependencies
// Removes the dependency of one task to another
//
// Note:
// Method at API documentation: [task.dependence.delete](@dev.1c-bitrix.ru/rest_help/tasks/task/dependence/task_dependence_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FromID - String, Number - From task ID - taskfrom
// DestinationID - String, Number - To task ID - taskto
// LinkType - String, Number - Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish - linktype
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTasksDependencies(Val URL, Val FromID, Val DestinationID, Val LinkType, Val Token = "") Export

    String_ = "String";

    OPI_TypeConversion.GetLine(LinkType);

    Parameters = NormalizeAuth(URL, Token, "task.dependence.delete");
    OPI_Tools.AddField("taskIdFrom", FromID       , String_, Parameters);
    OPI_Tools.AddField("taskIdTo"  , DestinationID, String_, Parameters);
    OPI_Tools.AddField("linkType"  , LinkType     , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get users daily tasks plan
// Gets the task plan for the current users day
//
// Note:
// Method at API documentation: [task.planner.getlist](@dev.1c-bitrix.ru/rest_help/tasks/task/planner/getlist.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetDailyPlan(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.planner.getlist");

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get task fields structure
// Gets a structure with a description of the fields for creating a task
//
// Note:
// Method at API documentation: [tasks.task.getFields](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_getFields.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskFieldsStructure(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.getFields");
    Response   = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get structure of tasks filter
// Return filter structure for GetTasksList
//
// Note:
// Returning fields as a map allows you to specify the filtering type before the filtered field name
// Types of filtration: !, <, <=, >, >=. For example: !ID:3 (ID not equal to 3)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns the filter fields as a map - map
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetTasksFilterStructure(Val Clear = False, Val AsMap = False) Export

    // More
    // https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_list.php

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        FilterStructure = New Map;
    Else
        FilterStructure = New Structure;
    EndIf;

    FilterStructure.Insert("ID"               , "<task identifier>");
    FilterStructure.Insert("PARENT_ID"        , "<parent task identifier>");
    FilterStructure.Insert("GROUP_ID"         , "<workgroup identifier>");
    FilterStructure.Insert("CREATED_BY"       , "<producer>");
    FilterStructure.Insert("STATUS_CHANGED_BY", "<the user who last changed the task status>");
    FilterStructure.Insert("PRIORITY"         , "<priority>");
    FilterStructure.Insert("FORUM_TOPIC_ID"   , "<forum topic identifier>");
    FilterStructure.Insert("RESPONSIBLE_ID"   , "<performer>");
    FilterStructure.Insert("TITLE"            , "<task name (can be searched using the template [%_])>");
    FilterStructure.Insert("TAG"              , "<tag>");
    FilterStructure.Insert("REAL_STATUS"      , "<task status>");
    FilterStructure.Insert("MARK"             , "<mark>");
    FilterStructure.Insert("SITE_ID"          , "<site identifier>");
    FilterStructure.Insert("ADD_IN_REPORT"    , "<task in the report (Y|N))>");
    FilterStructure.Insert("DATE_START"       , "<start date>");
    FilterStructure.Insert("DEADLINE"         , "<deadline>");
    FilterStructure.Insert("CREATED_DATE"     , "<date of creation>");
    FilterStructure.Insert("CLOSED_DATE"      , "<completion date>");
    FilterStructure.Insert("CHANGED_DATE"     , "<date of last modification>");
    FilterStructure.Insert("ACCOMPLICE"       , "<co-executor identifier>");
    FilterStructure.Insert("AUDITOR"          , "<auditor identifier>");
    FilterStructure.Insert("DEPENDS_ON"       , "<previous task identifier>");
    FilterStructure.Insert("ONLY_ROOT_TASKS"  , "<only tasks that are not subtasks (Y|N))>");
    FilterStructure.Insert("STAGE_ID"         , "<stage>");
    FilterStructure.Insert("UF_CRM_TASK"      , "<CRM elements>");
    FilterStructure.Insert("STATUS"
        , "<status for sorting. Similar to REAL_STATUS, but has three additional meta-statuses>");

    If Clear Then
        FilterStructure = OPI_Tools.ClearCollectionRecursively(FilterStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;

EndFunction

#EndRegion

#Region CustomsTasksFieldsManagement

// Get list of custom task fields
// Gets list of custom task fields
//
// Note:
// Method at API documentation: [task.item.userfield.getlist](@dev.1c-bitrix.ru/rest_help/tasks/task/userfield/getlist.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCustomTaskFieldsList(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.item.userfield.getlist");

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add custom task field
// Adds a new custom field to be added to the task
//
// Note:
// Method at API documentation: [task.item.userfield.add](@dev.1c-bitrix.ru/rest_help/tasks/task/userfield/add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Type - String - Field type: string, double, date, boolean - type
// Name - String - Text identifier (name) of the field - fieldname
// ExternalID - String - Text identifier for external integration - externalid
// Title - String - Field title - title
// Signature - Structure Of KeyAndValue - Form label. Key: en or ru, Value: Lable text - label
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddCustomTaskField(Val URL
    , Val Type
    , Val Name
    , Val ExternalID = ""
    , Val Title = ""
    , Val Signature = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.item.userfield.add");
    Fields     = New Structure;

    OPI_Tools.AddField("USER_TYPE_ID"   , Type      , String_     , Fields);
    OPI_Tools.AddField("FIELD_NAME"     , Name      , String_     , Fields);
    OPI_Tools.AddField("XML_ID"         , ExternalID, String_     , Fields);
    OPI_Tools.AddField("LABEL"          , Title     , String_     , Fields);
    OPI_Tools.AddField("EDIT_FORM_LABEL", Signature , "Collection", Fields);

    OPI_Tools.AddField("PARAMS", Fields, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update custom task field
// Updates a custom task field data
//
// Note:
// Method at API documentation: [task.item.userfield.update](@dev.1c-bitrix.ru/rest_help/tasks/task/userfield/update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldID - String, Number - Field ID for updating - fieldid
// ExternalID - String - Text identifier for external integration - externalid
// Title - String - Field title - title
// Signature - Structure Of KeyAndValue - Form label. Key: en or ru, Value: Lable text - label
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateCustomTaskField(Val URL
    , Val FieldID
    , Val ExternalID = ""
    , Val Title = ""
    , Val Signature = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.item.userfield.update");
    Fields     = New Structure;

    OPI_Tools.AddField("XML_ID"         , ExternalID, String_     , Fields);
    OPI_Tools.AddField("LABEL"          , Title     , String_     , Fields);
    OPI_Tools.AddField("EDIT_FORM_LABEL", Signature , "Collection", Fields);

    OPI_Tools.AddField("ID"  , FieldID, String_     , Parameters);
    OPI_Tools.AddField("DATA", Fields , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Gets a custom task field
// Get custom task field data
//
// Note:
// Method at API documentation: [task.item.userfield.get](@dev.1c-bitrix.ru/rest_help/tasks/task/userfield/get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldID - String, Number - Field ID for retrieval - fieldid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCustomTaskField(Val URL, Val FieldID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.item.userfield.get");

    OPI_Tools.AddField("ID", FieldID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete custom task field
// Deletes a custom task field
//
// Note:
// Method at API documentation: [task.item.userfield.delete](@dev.1c-bitrix.ru/rest_help/tasks/task/userfield/delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldID - String, Number - Field ID for deletion - fieldid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteCustomTaskField(Val URL, Val FieldID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.item.userfield.delete");

    OPI_Tools.AddField("ID", FieldID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region TasksChecklistsManagement

// Add tasks checklist element
// Adds new element of tasks checklist
//
// Note:
// Method at API documentation: [task.checklistitem.add](@dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Text - String - Text (title) of checklist element - text
// Completed - Boolean - Mark as completed - complete
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddTasksChecklistElement(Val URL, Val TaskID, Val Text, Val Completed = False, Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.checklistitem.add");
    Fields     = New Structure;

    MakeBoolean(Completed);

    OPI_Tools.AddField("TITLE"      , Text     , String_, Fields);
    OPI_Tools.AddField("IS_COMPLETE", Completed, String_, Fields);

    OPI_Tools.AddField("TASKID", TaskID , String_     , Parameters);
    OPI_Tools.AddField("FIELDS", Fields , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update tasks checklist element
// Updates text of element of tasks checklist
//
// Note:
// Method at API documentation: [task.checklistitem.update](@dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// ElementID - Number, String - Checklist element ID - element
// Text - String - Text (title) of checklist element - text
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Text, Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.checklistitem.update");
    Fields     = New Structure;

    OPI_Tools.AddField("TITLE", Text, String_, Fields);

    OPI_Tools.AddField("TASKID", TaskID   , String_     , Parameters);
    OPI_Tools.AddField("ITEMID", ElementID, String_     , Parameters);
    OPI_Tools.AddField("FIELDS", Fields   , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete tasks checklist element
// Deletes element from tasks checklist
//
// Note:
// Method at API documentation: [task.checklistitem.delete](@dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// ElementID - Number, String - ID of deleted element - element
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export

    Response = ChecklistElementManagement(URL, TaskID, ElementID, "task.checklistitem.delete", Token);

    Return Response;

EndFunction

// Get tasks checklist
// Gets the list of elements on the task checklist
//
// Note:
// Method at API documentation: [task.checklistitem.getlist](@dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/getlist.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTasksChecklist(Val URL, Val TaskID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.checklistitem.getlist");

    OPI_Tools.AddField("TASKID", TaskID , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get tasks checklist element
// Gets tasks checklist element by ID
//
// Note:
// Method at API documentation: [task.checklistitem.get](@dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// ElementID - Number, String - Element ID - element
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export

    Response = ChecklistElementManagement(URL, TaskID, ElementID, "task.checklistitem.get", Token);

    Return Response;

EndFunction

// Complete tasks checklist element
// Mark an element as completed
//
// Note:
// Method at API documentation: [task.checklistitem.complete](@dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/complete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// ElementID - Number, String - Element ID - element
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CompleteTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export

    Response = ChecklistElementManagement(URL, TaskID, ElementID, "task.checklistitem.complete", Token);

    Return Response;

EndFunction

// Renew tasks checklist element
// Unmark an element as completed
//
// Note:
// Method at API documentation: [task.checklistitem.renew](@dev.1c-bitrix.ru/rest_help/tasks/task/checklistitem/renew.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// ElementID - Number, String - Element ID - element
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenewTasksChecklistElement(Val URL, Val TaskID, Val ElementID, Val Token = "") Export

    Response = ChecklistElementManagement(URL, TaskID, ElementID, "task.checklistitem.renew", Token);

    Return Response;

EndFunction

#EndRegion

#Region CommentsAndResultsManagement

// Get comments list for a task
// Get user comments list for a task
//
// Note:
// Method at API documentation: [task.commentitem.getlist](@dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/getlist.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskCommentsList(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "task.commentitem.getlist", Token, "taskId");
    Return Response;

EndFunction

// Get task comment
// Gets task comment data by ID
//
// Note:
// Method at API documentation: [task.commentitem.get](@dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// CommentID - Number, String - CommentID - comment
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskComment(Val URL, Val TaskID, Val CommentID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.commentitem.get");
    OPI_Tools.AddField("TASKID", TaskID   , "String", Parameters);
    OPI_Tools.AddField("ITEMID", CommentID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add comment to task
// Create new comment to the task
//
// Note:
// Method at API documentation: [task.commentitem.add](@dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Text - String - Comment text - text
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddTaskComment(Val URL, Val TaskID, Val Text, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.commentitem.add");

    Comment = New Structure;
    OPI_Tools.AddField("POST_MESSAGE", Text, "String", Comment);

    OPI_Tools.AddField("TASKID", TaskID , "String"    , Parameters);
    OPI_Tools.AddField("FIELDS", Comment, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update task comment
// Changes task comment text
//
// Note:
// Method at API documentation: [task.commentitem.update](@dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// CommentID - Number, String - CommentID - comment
// Text - String - Comment text - text
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateTaskComment(Val URL, Val TaskID, Val CommentID, Val Text, Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.commentitem.update");

    Comment = New Structure;
    OPI_Tools.AddField("POST_MESSAGE", Text, "String", Comment);

    OPI_Tools.AddField("TASKID", TaskID   , String_     , Parameters);
    OPI_Tools.AddField("ITEMID", CommentID, String_     , Parameters);
    OPI_Tools.AddField("FIELDS", Comment  , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete comment
// Delete task comment by ID
//
// Note:
// Method at API documentation: [task.commentitem.delete](@dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// CommentID - Number, String - ID of comment to remove - comment
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTaskComment(Val URL, Val TaskID, Val CommentID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.commentitem.delete");

    OPI_Tools.AddField("TASKID", TaskID   , "String", Parameters);
    OPI_Tools.AddField("ITEMID", CommentID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get results list
// Gets results list for task
//
// Note:
// Method at API documentation: [tasks.task.result.list](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result.list.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetResultsList(Val URL, Val TaskID, Val Token = "") Export

    Response = PrimaryControlAction(URL, TaskID, "tasks.task.result.list", Token, "taskId");
    Return Response;

EndFunction

// Create result from comment
// Create task result from comment
//
// Note:
// Method at API documentation: [tasks.task.result.addFromComment](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result_addFromComment.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// CommentID - Number, String - CommentID - comment
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateResultFromComment(Val URL, Val CommentID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.result.addFromComment");
    OPI_Tools.AddField("commentId", CommentID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete result from comment
// Deletes task result, created from a comment
//
// Note:
// Method at API documentation: [tasks.task.result.deleteFromComment](@dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_result_deleteFromComment.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// CommentID - Number, String - CommentID - comment
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteResultFromComment(Val URL, Val CommentID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.result.deleteFromComment");
    OPI_Tools.AddField("commentId", CommentID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get comment structure
// Get comment fields structure
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetCommentStructure(Val Clear = False) Export

    // More
    // https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/add.php

    OPI_TypeConversion.GetBoolean(Clear);

    FieldsStructure = New Structure;
    FieldsStructure.Insert("AUTHOR_ID"            , "<comment author identifier>");
    FieldsStructure.Insert("AUTHOR_NAME"          , "<Users name (optional)>");
    FieldsStructure.Insert("AUTHOR_EMAIL"         , "<Users email (optional)>");
    FieldsStructure.Insert("USE_SMILES"           , "<(Y|N) - parse comments for emoticons or not>");
    FieldsStructure.Insert("POST_MESSAGE"         , "<Message text>");
    FieldsStructure.Insert("UF_FORUM_MESSAGE_DOC" , "<Array of files from disk to attach>");

    If Clear Then
        For Each Field In FieldsStructure Do
            FieldsStructure.Insert(Field.Key, "");
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return FieldsStructure;

EndFunction

#EndRegion

#Region Kanban

// Add kanban stage
// Add new stage of kanban or My Plan
//
// Note:
// Method at API documentation: [task.stages.add](@dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Name - String - New stage name - title
// Color - String - HEX of new stage color - color
// PrevStageID - String, Number - ID of the stage after which a new stage should be inserted (at the beginning by default.) - prevstage
// EntityID - String, Number - ID of kanban owner (group or user) - entityid
// AsAdmin - Boolean - Allows you to add stages without checking permissions (for administrators) - admin
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddKanbanStage(Val URL
    , Val Name
    , Val Color = "FFD800"
    , Val PrevStageID = 0
    , Val EntityID = 0
    , Val AsAdmin = False
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.stages.add");
    Fields     = New Structure;

    MakeBoolean(AsAdmin);

    OPI_Tools.AddField("TITLE"    , Name        , String_, Fields);
    OPI_Tools.AddField("COLOR"    , Color       , String_, Fields);
    OPI_Tools.AddField("AFTER_ID" , PrevStageID , String_, Fields);
    OPI_Tools.AddField("ENTITY_ID", EntityID    , String_, Fields);
    OPI_Tools.AddField("isAdmin"  , AsAdmin     , String_, Fields);

    Parameters.Insert("fields", Fields);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Change kanban stage
// Changes the properties of the existing kanban or My plan stage
//
// Note:
// Method at API documentation: [task.stages.update](@dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Name - String - New stages name - title
// StageID - String, Number - Stage ID for change - stage
// Color - String - HEX of new stage color - color
// PrevStageID - String, Number - Stage ID, after which the selected stage should be inserted - prevstage
// AsAdmin - Boolean - Allows you to add stages without checking permissions (for administrators) - admin
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateKanbansStage(Val URL
    , Val Name
    , Val StageID
    , Val Color = ""
    , Val PrevStageID = 0
    , Val AsAdmin = False
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.stages.update");
    Fields     = New Structure;

    OPI_Tools.AddField("TITLE"    , Name        , String_  , Fields);
    OPI_Tools.AddField("COLOR"    , Color       , String_  , Fields);
    OPI_Tools.AddField("AFTER_ID" , PrevStageID , String_  , Fields);
    OPI_Tools.AddField("isAdmin"  , AsAdmin     , "Boolean", Fields);

    OPI_Tools.AddField("id"    , StageID, String_     , Parameters);
    OPI_Tools.AddField("fields", Fields , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// ID of the stage to be deleted
// Removes a kanban (My Plan) stage, provided there are no tasks in it
//
// Note:
// Method at API documentation: [task.stages.delete](@dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StageID - String, Number - ID of stage to dele - stage
// AsAdmin - Boolean - Allows you to add stages without checking permissions (for administrators) - admin
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteKanbanStage(Val URL, Val StageID, Val AsAdmin = False, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.stages.delete");

    MakeBoolean(AsAdmin);

    OPI_Tools.AddField("id"     , StageID , "String", Parameters);
    OPI_Tools.AddField("isAdmin", AsAdmin , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get kanban stages
// Get kanban (My Plan) stages info
//
// Note:
// Method at API documentation: [task.stages.get](@dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// EntityID - String, Number - ID of kanban owner (group or user) - entityid
// AsAdmin - Boolean - Allows you to get stages without checking permissions (for administrators) - admin
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetKanbanStages(Val URL, Val EntityID = 0, Val AsAdmin = False, Val Token = "") Export

    EntityID   = OPI_Tools.NumberToString(EntityID);
    Parameters = NormalizeAuth(URL, Token, "task.stages.get");

    MakeBoolean(AsAdmin);

    OPI_Tools.AddField("entityId", EntityID , "String", Parameters);
    OPI_Tools.AddField("isAdmin" , AsAdmin  , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Move task to kanban stage
// Move task to another kanban stage
//
// Note:
// Method at API documentation: [task.stages.movetask](@dev.1c-bitrix.ru/rest_help/tasks/task/kanban/task_stages_movetask.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - String, Number - ID of task to move - task
// StageID - String, Number - Stage ID - stage
// Prev - String, Number - ID of the task to put the selected one in front of (if After not filled) - before
// After - String, Number - ID of the task to be followed by the selected (if Prev not filled) - after
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MoveTaskToKanbanStage(Val URL
    , Val TaskID
    , Val StageID
    , Val Prev = 0
    , Val After = 0
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.stages.movetask");

    OPI_Tools.AddField("id"     , TaskID , String_, Parameters);
    OPI_Tools.AddField("stageId", StageID, String_, Parameters);

    If ValueIsFilled(Prev) Then

        OPI_Tools.AddField("before", Prev, String_, Parameters);

    Else

        OPI_TypeConversion.GetLine(After);
        OPI_Tools.AddField("after", After, String_, Parameters);

    EndIf;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region Timekeeping

// Add task time accounting
// Adds information about the user's time spent to the task
//
// Note:
// Method at API documentation: [task.elapseditem.add](@dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - String, Number - ID of task for time accounting - task
// Time - String, Number - Time spent in seconds - amount
// UserID - String, Number - ID of user for time accounting - user
// Text - String - Comment text - text
// SetupDate - String - Date the record was set - date
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddTaskTimeAccounting(Val URL
    , Val TaskID
    , Val Time
    , Val UserID = ""
    , Val Text = ""
    , Val SetupDate = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.elapseditem.add");
    Fields     = New Structure;

    OPI_Tools.AddField("SECONDS"     , Time      , String_  , Fields);
    OPI_Tools.AddField("COMMENT_TEXT", Text      , String_  , Fields);
    OPI_Tools.AddField("USER_ID"     , UserID    , String_  , Fields);
    OPI_Tools.AddField("CREATED_DATE", SetupDate , "DateISO", Fields);

    OPI_Tools.AddField("TASKID"  , TaskID , String_     , Parameters);
    OPI_Tools.AddField("ARFIELDS", Fields , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete task time accounting
// Deletes record of time accounting
//
// Note:
// Method at API documentation: [task.elapseditem.delete](@dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - String, Number - ID of task for time accounting - task
// RecordID - String, Number - Time record ID - record
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTaskTimeAccounting(Val URL, Val TaskID, Val RecordID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.elapseditem.delete");

    OPI_Tools.AddField("TASKID", TaskID  , "String", Parameters);
    OPI_Tools.AddField("ITEMID", RecordID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get task time accounting list
// Get list of time accounting records for task
//
// Note:
// Method at API documentation: [task.elapseditem.getlist](@dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/getlist.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - String, Number - Task ID - task
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskTimeAccountingList(Val URL, Val TaskID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.elapseditem.getlist");

    OPI_Tools.AddField("TASKID", TaskID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get task time accounting
// Get time accounting record data
//
// Note:
// Method at API documentation: [task.elapseditem.get](@dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - String, Number - Task ID - task
// RecordID - String, Number - Time record ID - record
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskTimeAccounting(Val URL, Val TaskID, Val RecordID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "task.elapseditem.get");

    OPI_Tools.AddField("TASKID", TaskID  , "String", Parameters);
    OPI_Tools.AddField("ITEMID", RecordID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update task time accounting
// Update time accounting record data
//
// Note:
// Method at API documentation: [task.elapseditem.update](@dev.1c-bitrix.ru/rest_help/tasks/task/elapseditem/update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - String, Number - Task ID - task
// RecordID - String, Number - Time record ID - record
// Time - String, Number - Time spent in seconds - amount
// Text - String - Comment text - text
// SetupDate - String - Date the record was set - date
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateTaskTimeAccounting(Val URL
    , Val TaskID
    , Val RecordID
    , Val Time
    , Val Text = ""
    , Val SetupDate = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "task.elapseditem.update");
    Fields     = New Structure;

    OPI_Tools.AddField("SECONDS"     , Time      , String_  , Fields);
    OPI_Tools.AddField("COMMENT_TEXT", Text      , String_  , Fields);
    OPI_Tools.AddField("CREATED_DATE", SetupDate , "DateISO", Fields);

    OPI_Tools.AddField("TASKID"  , TaskID  , String_     , Parameters);
    OPI_Tools.AddField("ITEMID"  , RecordID, String_     , Parameters);
    OPI_Tools.AddField("ARFIELDS", Fields  , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Start timekeeping
// Starts user timekeeping
//
// Note:
// Method at API documentation: [timeman.open](@dev.1c-bitrix.ru/rest_help/timeman/base/timeman_open.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - Users ID. Current by default - userid
// Time - Date - Start time. The date must match the current. Current time by default. - time
// Report - String - Reason for change. Required when Time is specified and free schedule is disabled - report
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StartTimekeeping(Val URL
    , Val UserID = ""
    , Val Time = ""
    , Val Report = ""
    , Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "timeman.open");

    OPI_Tools.AddField("USER_ID", UserID , "String"  , Parameters);
    OPI_Tools.AddField("TIME"   , Time   , "DateISOZ", Parameters);
    OPI_Tools.AddField("REPORT" , Report , "String"  , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Stop timekeeping
// Stops user timekeeping
//
// Note:
// Method at API documentation: [timeman.close](@dev.1c-bitrix.ru/rest_help/timeman/base/timeman_close.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - Users ID. Current by default - userid
// Time - Date - Stop time. The date must match the current. Current time by default. - time
// Report - String - Reason for change. Required when Time is specified and free schedule is disabled - report
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StopTimekeeping(Val URL
    , Val UserID = ""
    , Val Time = ""
    , Val Report = ""
    , Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "timeman.close");

    OPI_Tools.AddField("USER_ID", UserID , "String"  , Parameters);
    OPI_Tools.AddField("TIME"   , Time   , "DateISOZ", Parameters);
    OPI_Tools.AddField("REPORT" , Report , "String"  , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Stop timekeeping
// Pauses user timekeeping
//
// Note:
// Method at API documentation: [timeman.pause](@dev.1c-bitrix.ru/rest_help/timeman/base/timeman_pause.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - Users ID. Current by default - userid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function PauseTimekeeping(Val URL, Val UserID = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "timeman.pause");

    OPI_Tools.AddField("USER_ID", UserID, "String" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get timekeeping status
// Gets user timekeeping status
//
// Note:
// Method at API documentation: [timeman.status](@dev.1c-bitrix.ru/rest_help/timeman/base/timeman_status.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - Users ID. Current by default - userid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTimekeepingStatus(Val URL, Val UserID = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "timeman.status");

    OPI_Tools.AddField("USER_ID", UserID, "String" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get timekeeping settings
// Gets user timekeeping settings
//
// Note:
// Method at API documentation: [timeman.settings](@dev.1c-bitrix.ru/rest_help/timeman/base/timeman_settings.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - Users ID. Current by default - userid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTimekeepingSettings(Val URL, Val UserID = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "timeman.settings");

    OPI_Tools.AddField("USER_ID", UserID, "String" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region StoragesManagement

// Get list of storages
// Get list of available files storages
//
// Note:
// Method at API documentation: [disk.storage.getlist](@dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getlist.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetStoragesList(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.storage.getlist");
    Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get storage for application data
// Get information about storage with which the application can work to store its data
//
// Note:
// Method at API documentation: [disk.storage.getforapp](@dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getforapp.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetAppStorage(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.storage.getforapp");
    Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get storage
// Get information about storage
//
// Note:
// Method at API documentation: [disk.storage.get](@dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String, Number - Storage ID - storageid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetStorage(Val URL, Val StorageID, Val Token = "") Export

    Response = PrimaryControlAction(URL, StorageID, "disk.storage.get", Token);
    Return Response;

EndFunction

// Rename storage
// Change storage name (for app storage only, see. GetAppStorage)
//
// Note:
// Method at API documentation: [disk.storage.rename](@dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_rename.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String, Number - Storage ID - storageid
// Name - String - New storage name - title
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenameStorage(Val URL, Val StorageID, Val Name, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.storage.rename");

    OPI_Tools.AddField("id"     , StorageID , "String", Parameters);
    OPI_Tools.AddField("newName", Name      , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get a list of child storage objects
// Get a list of files and folders, located at the root of the storage
//
// Note:
// Method at API documentation: [disk.storage.getchildren](@dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_getchildren.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String, Number - Storage ID - storageid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetStorageObjects(Val URL, Val StorageID, Val Token = "") Export

    Response = PrimaryControlAction(URL, StorageID, "disk.storage.getchildren", Token);
    Return Response;

EndFunction

// Create folder at the storage
// Create new foldera at the storage
//
// Note:
// Method at API documentation: [disk.storage.addfolder](@dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_addfolder.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String - Storage ID - storageid
// Name - String - Folder name - title
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateStorageFolder(Val URL, Val StorageID, Val Name, Val Token = "") Export

    OPI_TypeConversion.GetLine(Name);

    FolderStructure = New Structure("NAME", Name);

    Parameters = NormalizeAuth(URL, Token, "disk.storage.addfolder");

    OPI_Tools.AddField("id"  , StorageID      , "String"    , Parameters);
    OPI_Tools.AddField("data", FolderStructure, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region CatalogsManagement

// Get information about folder
// Get folder information
//
// Note:
// Method at API documentation: [disk.folder.get](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFolderInformation(Val URL, Val FolderID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FolderID, "disk.folder.get", Token);
    Return Response;

EndFunction

// Create new subfolder
// Create new folder inside another folder
//
// Note:
// Method at API documentation: [disk.folder.addsubfolder](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_addsubfolder.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Parent folder identifier - folderid
// Name - String - Name of new folder - title
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateSubfolder(Val URL, Val FolderID, Val Name, Val Token = "") Export

    OPI_TypeConversion.GetLine(Name);

    FolderStructure = New Structure("NAME", Name);

    Parameters = NormalizeAuth(URL, Token, "disk.folder.addsubfolder");

    OPI_Tools.AddField("id"  , FolderID       , "String"    , Parameters);
    OPI_Tools.AddField("data", FolderStructure, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Copy folder
// Copy one folder to another
//
// Note:
// Method at API documentation: [disk.folder.copyto](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_copyto.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// DestinationID - String, Number - ID of target folder - tagetid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MakeFolderCopy(Val URL, Val FolderID, Val DestinationID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.folder.copyto");

    OPI_Tools.AddField("id"            , FolderID     , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", DestinationID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Move folder
// Moves one folder inside another
//
// Note:
// Method at API documentation: [disk.folder.moveto](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_moveto.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// DestinationID - String, Number - ID of target folder - tagetid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MoveFolder(Val URL, Val FolderID, Val DestinationID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.folder.moveto");

    OPI_Tools.AddField("id"            , FolderID     , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", DestinationID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete folder
// Remove folder with subfolders
//
// Note:
// Method at API documentation: [disk.folder.deletetree](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_deletetree.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - ID of folder to be deleted - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteFolder(Val URL, Val FolderID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FolderID, "disk.folder.deletetree", Token);
    Return Response;

EndFunction

// Get external link for folder
// Get external link to folder
//
// Note:
// Method at API documentation: [disk.folder.getExternalLink](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getexternallink.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFolderExternalLink(Val URL, Val FolderID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FolderID, "disk.folder.getExternalLink", Token);
    Return Response;

EndFunction

// Get folder child elements
// Get folder child elements
//
// Note:
// Method at API documentation: [disk.folder.getchildren](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getchildren.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Filter - Structure of KeyAndValue - Items filter. See GetFolderFilterStructure - filter
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFolderItems(Val URL, Val FolderID, Val Filter = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.folder.getchildren");
    OPI_Tools.AddField("id"    , FolderID, "String"    , Parameters);
    OPI_Tools.AddField("filter", Filter  , "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Mark folder as deleted
// Move folder to recycle bin
//
// Note:
// Method at API documentation: [disk.folder.markdeleted](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_markdeleted.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MarkFolderAsDeleted(Val URL, Val FolderID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FolderID, "disk.folder.markdeleted", Token);
    Return Response;

EndFunction

// Restore folder
// Resotre folder form recycle bin
//
// Note:
// Method at API documentation: [disk.folder.restore](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_restore.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RestoreFolder(Val URL, Val FolderID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FolderID, "disk.folder.restore", Token);
    Return Response;

EndFunction

// Rename folder
// Change folder name
//
// Note:
// Method at API documentation: [disk.folder.rename](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_rename.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Name - String - New folders name - title
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenameFolder(Val URL, Val FolderID, Val Name, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.folder.rename");

    OPI_Tools.AddField("id"     , FolderID , "String", Parameters);
    OPI_Tools.AddField("newName", Name     , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get fields structure for folder items filter
// Returns filter structure for child folder items
//
// Note:
// Method at API documentation: [disk.folder.getfields](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_getfields.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Clear - Boolean - True > structure with empty values, False > field types at values - empty
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetFolderFilterStructure(Val URL, Val Clear = False, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.folder.getfields");
    Filter     = New Structure;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);
    Fields   = Response["result"];

    For Each Field In Fields Do

        Name        = Field.Key;
        Description = Field.Value;

        If Description["USE_IN_FILTER"] Then

            DataType = ?(Clear, "", Description["TYPE"]);
            Filter.Insert(Name, DataType);

        EndIf;

    EndDo;

    Return Filter;

EndFunction

#EndRegion

#Region FileManagement

// Upload file to a storage
// Upload file to storage root
//
// Note:
// Method at API documentation: [disk.storage.uploadfile](@dev.1c-bitrix.ru/rest_help/disk/storage/disk_storage_uploadfile.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Name - String - File name with extension - title
// File - String, BinaryData - File for upload - file
// StorageID - String - Storage id - storageid
// Rights - String - Rights array if required - rights
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UploadFileToStorage(Val URL
    , Val Name
    , Val File
    , Val StorageID
    , Val Rights = ""
    , Val Token = "") Export

    OPI_TypeConversion.GetLine(StorageID);
    OPI_TypeConversion.GetLine(Name);

    Method = "disk.storage.uploadfile";

    FileData    = New Structure("NAME", Name);
    FileContent = New Map();
    FileContent.Insert(Name, File);

    Parameters = NormalizeAuth(URL, Token, Method);
    OPI_Tools.AddField("data"  , FileData , "Collection", Parameters);
    OPI_Tools.AddField("rights", Rights   , "Array"     , Parameters);
    OPI_Tools.AddField("id"    , StorageID, "String"    , Parameters);

    FileArray = NormalizeFiles(FileContent);

    If Not FileArray.Count() = 0 Then
        Parameters.Insert("fileContent", FileArray[0]);
    EndIf;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Upload file to the folder
// Upload local file to the folder
//
// Note:
// Method at API documentation: [disk.folder.uploadfile](@dev.1c-bitrix.ru/rest_help/disk/folder/disk_folder_uploadfile.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Name - String - File name with extension - title
// File - String, BinaryData - File for upload - file
// FolderID - String - Folder identifier - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UploadFileToFolder(Val URL, Val Name, Val File, Val FolderID, Val Token = "") Export

    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetBinaryData(File);

    Parameters = NormalizeAuth(URL, Token, "disk.folder.uploadFile");
    OPI_Tools.AddField("id", FolderID, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);
    Result   = Response["result"];

    If ValueIsFilled(Result) Then

        FieldName = Result["field"];
        UploadURL = Result["uploadUrl"];

        If ValueIsFilled(FieldName) And ValueIsFilled(UploadURL) Then

            FieldName = TrimAll(FieldName);
            UploadURL = TrimAll(UploadURL);
            FileName  = FieldName + "|" + Name;

            FileMapping = New Map;
            FileMapping.Insert(FileName, File);

            Response = OPI_HTTPRequests.PostMultipart(UploadURL, , FileMapping, "");

        EndIf;

    EndIf;

    Return Response;

EndFunction

// Get information about file
// Get information about file by ID
//
// Note:
// Method at API documentation: [disk.file.get](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFileInformation(Val URL, Val FileID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FileID, "disk.file.get", Token);
    Return Response;

EndFunction

// Delete file
// Delete file by ID
//
// Note:
// Method at API documentation: [disk.file.delete](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - ID of removing file - fileid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteFile(Val URL, Val FileID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FileID, "disk.file.delete", Token);
    Return Response;

EndFunction

// Get external link for a file
// Get external link to file
//
// Note:
// The method has suddenly disappeared from the API on the cloud Bitrix24 where it was being tested (09/24). It might still work on other versions, but it's not guaranteed
// Method at API documentation: [disk.file.getExternalLink](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_getexternallink.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFileExternalLink(Val URL, Val FileID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FileID, "disk.file.getExternalLink", Token);
    Return Response;

EndFunction

// Mark file as deleted
// Move file to recycle bin
//
// Note:
// Method at API documentation: [disk.file.markdeleted](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_markdeleted.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MarkFileAsDeleted(Val URL, Val FileID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FileID, "disk.file.markdeleted", Token);
    Return Response;

EndFunction

// Restore file
// Restore file from recycle bin
//
// Note:
// Method at API documentation: [disk.file.restore](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_restore.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RestoreFile(Val URL, Val FileID, Val Token = "") Export

    Response = PrimaryControlAction(URL, FileID, "disk.file.restore", Token);
    Return Response;

EndFunction

// Copy file
// Copy file from one destination to another
//
// Note:
// Method at API documentation: [disk.file.copyto](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_copyto.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - Original file ID - fileid
// FolderID - String, Number - ID of copy destination folder - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MakeFileCopy(Val URL, Val FileID, Val FolderID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.file.copyto");

    OPI_Tools.AddField("id"            , FileID  , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", FolderID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Move file
// Move file from one destination to another
//
// Note:
// Method at API documentation: [disk.file.moveto](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_moveto.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File ID - fileid
// FolderID - String, Number - ID of new destination folder - folderid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MoveFileToFolder(Val URL, Val FileID, Val FolderID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.file.moveto");

    OPI_Tools.AddField("id"            , FileID  , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", FolderID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Rename file
// Changes the name of an existing file
//
// Note:
// Method at API documentation: [disk.file.rename](@dev.1c-bitrix.ru/rest_help/disk/file/disk_file_rename.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Name - String - New folders name - title
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenameFile(Val URL, Val FileID, Val Name, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "disk.file.rename");

    OPI_Tools.AddField("id"     , FileID , "String", Parameters);
    OPI_Tools.AddField("newName", Name   , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region ChatsAndDialogsManagement

// Create chat
// Creates a new chat based on the field structure
//
// Note:
// Method at API documentation: [im.chat.add](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12093)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatStructure - Structure Of KeyAndValue - Chat fields structure. See GetChatStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateChat(Val URL, Val ChatStructure, Val Token = "") Export

    OPI_TypeConversion.GetCollection(ChatStructure);

    Parameters = NormalizeAuth(URL, Token, "im.chat.add");

    For Each Element In ChatStructure Do
        Parameters.Insert(Element.Key, Element.Value);
    EndDo;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get chats users
// Gets the list of chat users by ID
//
// Note:
// Method at API documentation: [im.chat.user.list](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12095)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetChatUsers(Val URL, Val ChatID, Val Token = "") Export

    Response = PrimaryControlAction(URL, ChatID, "im.chat.user.list", Token, "CHAT_ID");
    Return Response;

EndFunction

// Leave chat
// Removes the current user from the chat room
//
// Note:
// Method at API documentation: [im.chat.leave](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12101)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function LeaveChat(Val URL, Val ChatID, Val Token = "") Export

    Response = PrimaryControlAction(URL, ChatID, "im.chat.leave", Token, "CHAT_ID");
    Return Response;

EndFunction

// Get users
// Get users information for dialog
//
// Note:
// Method at API documentation: [im.user.list.get ](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11493)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserIDs - Array of String, Number - Usesr ID or array of users IDs - users
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetUsers(Val URL, Val UserIDs, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.user.list.get");

    OPI_Tools.AddField("ID", UserIDs, "Array", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add users to chat
// Adds users to the chat by ID array
//
// Note:
// Method at API documentation: [im.chat.user.add](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12097)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// UserIDs - Array of string, number - New members IDs - users
// HideHistory - Boolean - Hide old messages from new members - hide
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddUsersToChat(Val URL
    , Val ChatID
    , Val UserIDs
    , Val HideHistory = False
    , Val Token = "") Export

    MakeBoolean(HideHistory);

    Parameters = NormalizeAuth(URL, Token, "im.chat.user.add");

    OPI_Tools.AddField("CHAT_ID"     , ChatID      , "String"    , Parameters);
    OPI_Tools.AddField("USERS"       , UserIDs     , "Collection", Parameters);
    OPI_Tools.AddField("HIDE_HISTORY", HideHistory , "String"    , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete user from chat
// Deletes user from chat
//
// Note:
// Method at API documentation: [im.chat.user.delete](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12099)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// UserID - String, Number - User ID - user
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteUserFromChat(Val URL, Val ChatID, Val UserID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.chat.user.delete");

    OPI_Tools.AddField("CHAT_ID", ChatID , "String", Parameters);
    OPI_Tools.AddField("USER_ID", UserID , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Change chat title
// Change text of chat title
//
// Note:
// Method at API documentation: [im.chat.updateTitle](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12105)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Title - String - New title - title
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ChangeChatTitle(Val URL, Val ChatID, Val Title, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.chat.updateTitle");

    OPI_Tools.AddField("CHAT_ID", ChatID , "String", Parameters);
    OPI_Tools.AddField("TITLE"  , Title  , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Change chat color
// Chat chat color for mobile app
//
// Note:
// Method at API documentation: [im.chat.updateTitle](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12105)
// Available colours: RED, GREEN, MINT, LIGHT_BLUE, DARK_BLUE, PURPLE, AQUA, PINK, LIME, BROWN, AZURE, KHAKI, SAND, MARENGO, GRAY, GRAPHITE
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Color - String - New chat color - color
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ChangeChatColor(Val URL, Val ChatID, Val Color, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.chat.updateColor");

    OPI_Tools.AddField("CHAT_ID", ChatID, "String", Parameters);
    OPI_Tools.AddField("COLOR"  , Color , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Change chat picture
// Setup new chat picture
//
// Note:
// Method at API documentation: [im.chat.updateAvatar](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12109)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Image - String, BinaryData - Picture data - picture
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ChangeChatPicture(Val URL, Val ChatID, Val Image, Val Token = "") Export

    OPI_TypeConversion.GetBinaryData(Image);

    Image      = Base64String(Image);
    Parameters = NormalizeAuth(URL, Token, "im.chat.updateAvatar");

    OPI_Tools.AddField("CHAT_ID", ChatID , "String", Parameters);
    OPI_Tools.AddField("AVATAR" , Image  , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Change chat owner
// Change chat owner
//
// Note:
// Method at API documentation: [im.chat.setOwner](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12111)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// UserID - String, Number - User ID - user
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ChangeChatOwner(Val URL, Val ChatID, Val UserID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.chat.setOwner");

    OPI_Tools.AddField("CHAT_ID", ChatID , "String", Parameters);
    OPI_Tools.AddField("USER_ID", UserID , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Disable chat notifications
// Disable chat notifications
//
// Note:
// Method at API documentation: [im.chat.mute](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=11473)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DisableChatNotifications(Val URL, Val ChatID, Val Token = "") Export

    Response = ChatNotificationsSwitch(URL, ChatID, True, Token);
    Return Response;

EndFunction

// Enable chat notifications
// Enable chat notifications
//
// Note:
// Method at API documentation: [im.chat.mute](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=11473)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function EnableChatNotifications(Val URL, Val ChatID, Val Token = "") Export

    Response = ChatNotificationsSwitch(URL, ChatID, False, Token);
    Return Response;

EndFunction

// Get chat messages list
// Gets a list of 20 chat or dialog messages, depending on the FirstID and LastID specified
//
// Note:
// Method at API documentation: [im.dialog.messages.get](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=11479)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID (as chatXXX) or User ID (as XXX) - chat
// LastID - String, Number - Id of last message - last
// FirstID - String, Number - ID of first message - first
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetChatMessagesList(Val URL
    , Val ChatID
    , Val LastID = ""
    , Val FirstID = ""
    , Val Token = "") Export

    String_ = "String";

    OPI_TypeConversion.GetLine(LastID);
    OPI_TypeConversion.GetLine(FirstID);

    Parameters = NormalizeAuth(URL, Token, "im.dialog.messages.get");

    OPI_Tools.AddField("DIALOG_ID", ChatID  , String_, Parameters);
    OPI_Tools.AddField("LAST_ID"  , LastID  , String_, Parameters);
    OPI_Tools.AddField("FIRST_ID" , FirstID , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get dialog
// Get chat data by ID
//
// Note:
// Method at API documentation: [im.dialog.get](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12886)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID (as chatXXX) or User ID (as XXX) - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetDialog(Val URL, Val ChatID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.dialog.get");

    OPI_Tools.AddField("DIALOG_ID", ChatID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get chat members list
// Get chat members list
//
// Note:
// Method at API documentation: [im.dialog.users.list](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23800)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID (as chatXXX) or User ID (as XXX) - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetChatMembersList(Val URL, Val ChatID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.dialog.users.list");

    OPI_Tools.AddField("DIALOG_ID", ChatID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send write notification
// Send Writing... status to dialog...
//
// Note:
// Method at API documentation: [im.dialog.writing](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23802)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID (as chatXXX) or User ID (as XXX) - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function SendWritingNotification(Val URL, Val ChatID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.dialog.writing");

    OPI_Tools.AddField("DIALOG_ID", ChatID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get user status
// Gets the status (online) of the current user
//
// Note:
// Method at API documentation: [im.user.status.get](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11497)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetUserStatus(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.user.status.get");

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Set user status
// Sets the status (online) of the current user
//
// Note:
// Method at API documentation: [im.user.status.set](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11499)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Status - String, Number - Status value: online, dnd, away - status
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function SetUserStatus(Val URL, Val Status, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.user.status.set");

    OPI_Tools.AddField("STATUS", Status, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Read all
// Mark all message as readed
//
// Note:
// Method at API documentation: [im.dialog.read.all](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=23804)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ReadAll(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.dialog.read.all");
    Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get chat files folder
// Get information about folder for chat files
//
// Note:
// Method at API documentation: [im.disk.folder.get](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11483)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetChatFilesFolder(Val URL, Val ChatID, Val Token = "") Export

    Response = PrimaryControlAction(URL, ChatID, "im.disk.folder.get", Token, "CHAT_ID");
    Return Response;

EndFunction

// Get chats structure
// Get chat fields structure
//
// Parameters:
// Clear - Boolean - True > structure with empty values, False > field types at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetChatStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE"       , "<Chat type OPEN (Public) | CHAT (Private)>");
    ChatStructure.Insert("TITLE"      , "<Chat title>");
    ChatStructure.Insert("DESCRIPTION", "<Chat description>");
    ChatStructure.Insert("COLOR"      , "<Chat color: RED, GREEN, MINT, LIGHT_BLUE, DARK_BLUE, PURPLE, AQUA, ...>");
    ChatStructure.Insert("MESSAGE"    , "<First chat message>");
    ChatStructure.Insert("USERS"      , "<Chat members array>");
    ChatStructure.Insert("AVATAR"     , "<Base64 chat picture>");
    ChatStructure.Insert("OWNER_ID"   , "<ID of chat owner. Current user by default>");

    If Clear Then
        For Each Field In ChatStructure Do
            ChatStructure.Insert(Field.Key, "");
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return ChatStructure;

EndFunction

#EndRegion

#Region MessageManagement

// Send message
// Send message to dialog
//
// Note:
// Method at API documentation: [im.message.add](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12115)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID (as chatXXX) or User ID (as XXX) - chat
// Text - String - Message text - text
// Attachments - Array of Structure - Array of attachments - blocks
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function SendMessage(Val URL, Val ChatID, Val Text, Val Attachments = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.message.add");

    OPI_Tools.AddField("DIALOG_ID", ChatID     , "String", Parameters);
    OPI_Tools.AddField("MESSAGE"  , Text       , "String", Parameters);
    OPI_Tools.AddField("ATTACH"   , Attachments, "Array" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Edit message
// Edit dialog message content
//
// Note:
// Method at API documentation: [im.message.update](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12117)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// MessageID - String, Number - ID of the message to be edited - message
// Text - String - New message text - text
// Attachments - Array of Structure - New blocks array - blocks
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function EditMessage(Val URL, Val MessageID, Val Text = "", Val Attachments = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.message.update");

    OPI_Tools.AddField("MESSAGE_ID", MessageID   , "String", Parameters);
    OPI_Tools.AddField("MESSAGE"   , Text        , "String", Parameters);
    OPI_Tools.AddField("ATTACH"    , Attachments , "Array" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Set message reaction
// Set or remove reaction mark on the message
//
// Note:
// Method at API documentation: [im.message.like](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12121)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// MessageID - String, Number - Message ID - message
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function SetMessageReaction(Val URL, Val MessageID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.message.like");

    OPI_Tools.AddField("MESSAGE_ID", MessageID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete message
// Deletes a dialog message
//
// Note:
// Method at API documentation: [im.message.delete](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12119)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// MessageID - String, Number - ID of the message to be deleted - message
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteMessage(Val URL, Val MessageID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.message.delete");

    OPI_Tools.AddField("MESSAGE_ID", MessageID , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send file
// Send disk file to chat
//
// Note:
// Method at API documentation: [im.disk.file.commit](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=11485)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID - chat
// FileID - String, Number - File ID from UploadFileToFolder method - fileid
// Description - String - File description - description
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function SendFile(Val URL, Val ChatID, Val FileID, Val Description = "", Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "im.disk.file.commit");

    OPI_Tools.AddField("CHAT_ID"  , ChatID     , String_, Parameters);
    OPI_Tools.AddField("UPLOAD_ID", FileID     , String_, Parameters);
    OPI_Tools.AddField("MESSAGE"  , Description, String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Mark message as readed
// Mark current and all previous messages as readed
//
// Note:
// Method at API documentation: [im.dialog.read](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12053)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID (as chatXXX) or User ID (as XXX) - chat
// MessageID - String, Number - Id of last readed message - message
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MarkMessageAsReaded(Val URL, Val ChatID, Val MessageID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.dialog.read");

    OPI_Tools.AddField("DIALOG_ID" , ChatID   , "String", Parameters);
    OPI_Tools.AddField("MESSAGE_ID", MessageID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Mark message as unreaded
// Mark current and all messages after as unreaded
//
// Note:
// Method at API documentation: [im.dialog.unread](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&LESSON_ID=12055)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// ChatID - String, Number - Chat ID (as chatXXX) or User ID (as XXX) - chat
// MessageID - String, Number - ID of last unreaded message - message
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MarkMessageAsUnreaded(Val URL, Val ChatID, Val MessageID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.dialog.unread");

    OPI_Tools.AddField("DIALOG_ID" , ChatID   , "String", Parameters);
    OPI_Tools.AddField("MESSAGE_ID", MessageID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get picture block
// Make picture block for SendMessage method
//
// Note:
// Blocks at API documentation: [Link](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&CHAPTER_ID=07867)
//
// Parameters:
// Name - String - Picture name - title
// URL - String - URL of sending picture - url
//
// Returns:
// Structure - PictureBlock
Function GetPictureBlock(Val Name, Val URL) Export

    PictureStructure = New Structure;
    OPI_Tools.AddField("NAME", Name, "String", PictureStructure);
    OPI_Tools.AddField("LINK", URL , "String", PictureStructure);

    //@skip-check constructor-function-return-section
    Return New Structure("IMAGE", PictureStructure);

EndFunction

// Get file block
// Make file block for SendMessage method
//
// Note:
// Blocks at API documentation: [Link](@dev.1c-bitrix.ru/learning/course/?COURSE_ID=93&CHAPTER_ID=07867)
//
// Parameters:
// Name - String - Picture name - title
// URL - String - File URL - url
//
// Returns:
// Structure - FileBlock
Function GetFileBlock(Val Name, Val URL) Export

    PictureStructure = New Structure;
    OPI_Tools.AddField("NAME", Name, "String", PictureStructure);
    OPI_Tools.AddField("LINK", URL , "String", PictureStructure);

    //@skip-check constructor-function-return-section
    Return New Structure("FILE", PictureStructure);

EndFunction

#EndRegion

#Region NotificationsManagement

// Create personal notification
// Creates a personal notification to the user
//
// Note:
// Method at API documentation: [im.notify.personal.add](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=12129)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - User ID for sending the notification - user
// Text - String - Notification text - text
// Tag - String - Uniqueness Tag. If already exist, other notif. will be deleted - tag
// Attachments - Array of Structure - Array of attachments - blocks
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreatePersonalNotification(Val URL
    , Val UserID
    , Val Text
    , Val Tag = ""
    , Val Attachments = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "im.notify.personal.add");

    OPI_Tools.AddField("USER_ID", UserID      , String_ , Parameters);
    OPI_Tools.AddField("MESSAGE", Text        , String_ , Parameters);
    OPI_Tools.AddField("TAG"    , Tag         , String_ , Parameters);
    OPI_Tools.AddField("ATTACH" , Attachments , "Array" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Create system notification
// Creates a system notification to the user
//
// Note:
// Method at API documentation: [im.notify.system.add](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=12131)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - User ID for sending the notification - user
// Text - String - Notification text - text
// Tag - String - Uniqueness Tag. If already exist, other notif. will be deleted - tag
// Attachments - Array of Structure - Array of attachments - blocks
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateSystemNotification(Val URL
    , Val UserID
    , Val Text
    , Val Tag = ""
    , Val Attachments = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "im.notify.system.add");

    OPI_Tools.AddField("USER_ID", UserID      , String_ , Parameters);
    OPI_Tools.AddField("MESSAGE", Text        , String_ , Parameters);
    OPI_Tools.AddField("TAG"    , Tag         , String_ , Parameters);
    OPI_Tools.AddField("ATTACH" , Attachments , "Array" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete notification
// Delete notification by ID
//
// Note:
// Method at API documentation: [im.notify.delete](@dev.1c-bitrix.ru/learning/course/index.php?COURSE_ID=93&LESSON_ID=12133)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// NotificationID - String, Number - Notification ID - notif
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteNotification(Val URL, Val NotificationID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "im.notify.delete");

    OPI_Tools.AddField("ID", NotificationID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region DepartmentsManagement

// Create department
// Creates a new department
//
// Note:
// Method at API documentation: [department.add](@dev.1c-bitrix.ru/rest_help/departments/department_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Name - String - Department name - title
// ParentID - String, Number - ID of parent department - parentid
// HeadID - String, Number - ID of department manager - headid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateDepartment(Val URL
    , Val Name
    , Val ParentID = ""
    , Val HeadID = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "department.add");

    OPI_Tools.AddField("NAME"   , Name     , String_, Parameters);
    OPI_Tools.AddField("PARENT" , ParentID , String_, Parameters);
    OPI_Tools.AddField("UF_HEAD", HeadID   , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update department
// Update an existing department
//
// Note:
// Method at API documentation: [department.update](@dev.1c-bitrix.ru/rest_help/departments/department_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// DepartmentID - String, Number - Department ID - depid
// Name - String - Department name - title
// ParentID - String, Number - ID of parent department - parentid
// HeadID - String, Number - ID of department manager - headid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateDepartment(Val URL
    , Val DepartmentID
    , Val Name = ""
    , Val ParentID = ""
    , Val HeadID = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "department.update");

    OPI_Tools.AddField("ID"     , DepartmentID, String_, Parameters);
    OPI_Tools.AddField("NAME"   , Name        , String_, Parameters);
    OPI_Tools.AddField("PARENT" , ParentID    , String_, Parameters);
    OPI_Tools.AddField("UF_HEAD", HeadID      , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get departments
// Gets a list of departments by ID or filter
//
// Note:
// Method at API documentation: [department.get](@dev.1c-bitrix.ru/rest_help/departments/department_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// DepartmentID - String, Number - Selection by department ID - depid
// Name - String - Filter by name - title
// ParentID - String, Number - Filter by parent ID - parentid
// HeadID - String, Number - Filter by manager ID - headid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetDepartments(Val URL
    , Val DepartmentID = ""
    , Val Name = ""
    , Val ParentID = ""
    , Val HeadID = ""
    , Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "department.get");

    OPI_Tools.AddField("ID"     , DepartmentID, String_, Parameters);
    OPI_Tools.AddField("NAME"   , Name        , String_, Parameters);
    OPI_Tools.AddField("PARENT" , ParentID    , String_, Parameters);
    OPI_Tools.AddField("UF_HEAD", HeadID      , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete department
// Delets department by ID
//
// Note:
// Method at API documentation: [department.delete](@dev.1c-bitrix.ru/rest_help/departments/department_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// DepartmentID - String, Number - Department ID for deletion - depid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteDepartment(Val URL, Val DepartmentID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "department.delete");

    OPI_Tools.AddField("ID", DepartmentID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region UsersManagement

// Get current user
// Get current user data
//
// Note:
// Method at API documentation: [user.current](@dev.1c-bitrix.ru/rest_help/users/user_current.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCurrentUser(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "user.current");

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get user
// Gets user information by ID
//
// Note:
// Method at API documentation: [user.get](@dev.1c-bitrix.ru/rest_help/users/user_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - User ID - userid
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetUser(Val URL, Val UserID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "user.get");

    OPI_Tools.AddField("ID", UserID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Create user
// Create new user by fields structure
//
// Note:
// Method at API documentation: [user.add](@dev.1c-bitrix.ru/rest_help/users/user_add.php)
// If you want to add an extranet user, you must pass in the fields: EXTRANET: Y and SONET_GROUP_ID: [...]
// If you want to add an intranet user, you must pass UF_DEPARTMENT field: [...]
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldsStructure - Structure Of KeyAndValue - New user data. See. GetUserFieldsStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateUser(Val URL, Val FieldsStructure, Val Token = "") Export

    OPI_TypeConversion.GetCollection(FieldsStructure);

    Parameters = NormalizeAuth(URL, Token, "user.add");

    For Each Field In FieldsStructure Do
        Parameters.Insert(Field.Key, Field.Value);
    EndDo;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update user
// Updates user data
//
// Note:
// Method at API documentation: [user.update](@dev.1c-bitrix.ru/rest_help/users/user_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - User ID - userid
// FieldsStructure - Structure Of KeyAndValue - New user data. See. GetUserFieldsStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateUser(Val URL, Val UserID, Val FieldsStructure, Val Token = "") Export

    OPI_TypeConversion.GetCollection(FieldsStructure);

    Parameters = NormalizeAuth(URL, Token, "user.update");

    For Each Field In FieldsStructure Do
        Parameters.Insert(Field.Key, Field.Value);
    EndDo;

    OPI_Tools.AddField("ID", UserID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Change user status
// Activates or deactivates (fire) the selected user
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// UserID - String, Number - User ID - userid
// Fire - Boolean - True > Deactivation, False > Activation - fire
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ChangeUserStatus(Val URL, Val UserID, Val Fire = True, Val Token = "") Export

    OPI_TypeConversion.GetBoolean(Fire);

    Active = Not Fire;

    MakeBoolean(Active);

    Parameters = New Structure("ACTIVE", Active);

    Response = UpdateUser(URL, UserID, Parameters, Token);

    Return Response;

EndFunction

// Find users
// Gets the list of users according to the specified filter
//
// Note:
// Method at API documentation: [user.update](@dev.1c-bitrix.ru/rest_help/users/user_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FilterStructure - Structure Of KeyAndValue - Filter. See GetUserFilterStructure - filter
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function FindUsers(Val URL, Val FilterStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "user.search");

    OPI_Tools.AddField("FILTER", FilterStructure, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get user fields structure
// Gets the field structure for creating or modifying user information
//
// Note:
// Method at API documentation: [user.fields](@dev.1c-bitrix.ru/rest_help/users/user_fields.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetUserFieldsStructure(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "user.fields");

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get user filter structure
// Returns the field structure for filtering users in the FindUsers method
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetUserFilterStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FilterStructure = New Structure;
    FilterStructure.Insert("NAME"              , "<name>");
    FilterStructure.Insert("LAST_NAME"         , "<surname>");
    FilterStructure.Insert("WORK_POSITION"     , "<position>");
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "<department name>");
    FilterStructure.Insert("USER_TYPE"         , "<type: employee, extranet, email>");

    If Clear Then
        For Each Field In FilterStructure Do
            FilterStructure.Insert(Field.Key, "");
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;

EndFunction

#EndRegion

#Region LeadsManagement

// Create lead
// Creates a new lead by fields structure
//
// Note:
// Method at API documentation: [crm.lead.add](@dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldsStructure - Structure Of KeyAndValue - Lead fields structure. See GetLeadStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateLead(Val URL, Val FieldsStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.lead.add");

    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete lead
// Deletes a lead by ID
//
// Note:
// Method at API documentation: [crm.lead.delete](@dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// LeadID - Number, String - Lead ID - lead
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteLead(Val URL, Val LeadID, Val Token = "") Export

    Response = PrimaryControlAction(URL, LeadID, "crm.lead.delete", Token);
    Return Response;

EndFunction

// Get lead
// Gets a lead by ID
//
// Note:
// Method at API documentation: [crm.lead.get](@dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// LeadID - Number, String - Lead ID - lead
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetLead(Val URL, Val LeadID, Val Token = "") Export

    Response = PrimaryControlAction(URL, LeadID, "crm.lead.get", Token);
    Return Response;

EndFunction

// Get leads list
// Gets a list of leads (50 per request max) with or without filtering
//
// Note:
// Method at API documentation: [crm.lead.list](@dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_list.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Filter - Structure of KeyAndValue - Lead filter structure. See GetLeadFilterStructure - filter
// Indent - Number, String - Offset from the beginning of the list to get leads > 50 recursively - offset
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetLeadsList(Val URL, Val Filter = "", Val Indent = 0, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.lead.list");

    OPI_Tools.AddField("filter", Filter, "Collection", Parameters);
    OPI_Tools.AddField("start" , Indent, "String"    , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update lead
// Modifies an existing lead
//
// Note:
// Method at API documentation: [crm.lead.update](@dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// LeadID - Number, String - Lead ID - lead
// FieldsStructure - Structure Of KeyAndValue - Structure of lead fields - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateLead(Val URL, Val LeadID, Val FieldsStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.lead.update");

    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);
    OPI_Tools.AddField("id"    , LeadID         , "String"    , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get lead structure
// Gets a structure with field descriptions for creating a lead
//
// Note:
// Method at API documentation: [crm.lead.fields](@dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_fields.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetLeadStructure(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.lead.fields");
    Response   = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get lead filter structure
// Returns the field structure for filtering leads in the GetLeadsList method
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetLeadFilterStructure(Val Clear = False) Export

    // More
    // https://dev.1c-bitrix.ru/rest_help/crm/leads/crm_lead_list.php

    OPI_TypeConversion.GetBoolean(Clear);

    FilterStructure = New Structure;
    FilterStructure.Insert("ID"                 , "<lead identifier>");
    FilterStructure.Insert("ASSIGNED_BY_ID"     , "<responsible person identifier>");
    FilterStructure.Insert("COMPANY_ID"         , "<company identifier>");
    FilterStructure.Insert("COMPANY_TITLE"      , "<company name>");
    FilterStructure.Insert("CONTACT_ID"         , "<contact identifier>");
    FilterStructure.Insert("CREATED_BY_ID"      , "<author identifier>");
    FilterStructure.Insert("CURRENCY_ID"        , "<currency identifier>");
    FilterStructure.Insert("DATE_CLOSED"        , "<closing date>");
    FilterStructure.Insert("DATE_CREATE"        , "<date of creation>");
    FilterStructure.Insert("DATE_MODIFY"        , "<date of change>");
    FilterStructure.Insert("EMAIL"              , "<email address>");
    FilterStructure.Insert("HAS_EMAIL"          , "<Email is filled (Y|N)>");
    FilterStructure.Insert("HAS_PHONE"          , "<phone field is filled (Y|N)>");
    FilterStructure.Insert("IS_RETURN_CUSTOMER" , "<reused lead flag (Y|N)>");
    FilterStructure.Insert("MODIFY_BY_ID"       , "<author ID of the last change>");
    FilterStructure.Insert("MOVED_BY_ID"        , "<identifier of the author of moving the lead to the current stage>");
    FilterStructure.Insert("MOVED_TIME"         , "<date of moving the lead to the current stage>");
    FilterStructure.Insert("OPENED"             , "<feature is available for all (Y|N)>");
    FilterStructure.Insert("OPPORTUNITY"        , "<expected amount>");
    FilterStructure.Insert("STATUS_ID"          , "<status identifier>");
    FilterStructure.Insert("TITLE"              , "<lead name (can be searched using the template [% [%_])>");

    If Clear Then
        For Each Field In FilterStructure Do
            FilterStructure.Insert(Field.Key, "");
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;

EndFunction

#EndRegion

#Region DealsManagement

// Create deal
// Creates a new deal by field structure
//
// Note:
// Method at API documentation: [crm.deal.add](@dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_add.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldsStructure - Structure Of KeyAndValue - Deal fields structure. See. GetDealStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateDeal(Val URL, Val FieldsStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.deal.add");

    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete deal
// Deletes deal by ID
//
// Note:
// Method at API documentation: [crm.deal.delete](@dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_delete.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// DealID - Number, String - Deal ID - deal
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteDeal(Val URL, Val DealID, Val Token = "") Export

    Response = PrimaryControlAction(URL, DealID, "crm.deal.delete", Token);
    Return Response;

EndFunction

// Get deal
// Gets deal by ID
//
// Note:
// Method at API documentation: [crm.deal.get](@dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_get.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// DealID - Number, String - Deal ID - deal
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetDeal(Val URL, Val DealID, Val Token = "") Export

    Response = PrimaryControlAction(URL, DealID, "crm.deal.get", Token);
    Return Response;

EndFunction

// Get deals list
// Gets the list of deals (50 pcs per query max) with or without filtering
//
// Note:
// Method at API documentation: [crm.deal.list](@dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_list.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Filter - Structure of KeyAndValue - Deals filter structure. See GetDealsFilterStructure - filter
// Indent - Number, String - Offset from the beginning of the list to retrieve deals > 50 pcs recursively - offset
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetDealsList(Val URL, Val Filter = "", Val Indent = 0, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.deal.list");

    OPI_Tools.AddField("filter", Filter, "Collection", Parameters);
    OPI_Tools.AddField("start" , Indent, "String"    , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update deal
// Modifies an existing deal
//
// Note:
// Method at API documentation: [crm.deal.update](@dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_update.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// DealID - Number, String - Deal ID - deal
// FieldsStructure - Structure Of KeyAndValue - Deal fields structure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateDeal(Val URL, Val DealID, Val FieldsStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.deal.update");

    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);
    OPI_Tools.AddField("id"    , DealID         , "String"    , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get deal structure
// Gets a structure with field descriptions for creating a deal
//
// Note:
// Method at API documentation: [crm.deal.fields](@dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_fields.php)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetDealStructure(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "crm.deal.fields");
    Response   = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get deals filter structure
// Returns the field structure for filtering deals in the GetDealsList method
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetDealsFilterStructure(Val Clear = False) Export

    // More
    // https://dev.1c-bitrix.ru/rest_help/crm/cdeals/crm_deal_list.php

    OPI_TypeConversion.GetBoolean(Clear);

    FilterStructure = New Structure;
    FilterStructure.Insert("ID"                 , "<Deal identifier>");
    FilterStructure.Insert("ASSIGNED_BY_ID"     , "<responsible person identifier>");
    FilterStructure.Insert("BEGINDATE"          , "<start date>");
    FilterStructure.Insert("CATEGORY_ID"        , "<direction identifier>");
    FilterStructure.Insert("CLOSEDATE"          , "<completion date>");
    FilterStructure.Insert("COMPANY_ID"         , "<company identifier>");
    FilterStructure.Insert("CONTACT_ID"         , "<contact identifier>");
    FilterStructure.Insert("CREATED_BY_ID"      , "<author identifier>");
    FilterStructure.Insert("CURRENCY_ID"        , "<currency identifier>");
    FilterStructure.Insert("DATE_CREATE"        , "<date of creation>");
    FilterStructure.Insert("DATE_MODIFY"        , "<date of change>");
    FilterStructure.Insert("IS_NEW"             , "<new deal flag (Y|N)>");
    FilterStructure.Insert("IS_RECURRING"       , "<is pattern (Y|N)>");
    FilterStructure.Insert("IS_RETURN_CUSTOMER" , "<reused lead flag (Y|N)>");
    FilterStructure.Insert("LEAD_ID"            , "<linked lead identifier>");
    FilterStructure.Insert("MODIFY_BY_ID"       , "<author ID of the last change>");
    FilterStructure.Insert("MOVED_BY_ID"        , "<identifier of the author of moving the deal to the current stage>");
    FilterStructure.Insert("MOVED_TIME"         , "<date of moving the deal to the current stage>");
    FilterStructure.Insert("OPENED"             , "<feature is available for all (Y|N)>");
    FilterStructure.Insert("OPPORTUNITY"        , "<expected amount>");
    FilterStructure.Insert("PROBABILITY"        , "<probability>");
    FilterStructure.Insert("REQUISITE_ID"       , "<prop identifier>");
    FilterStructure.Insert("STAGE_ID"           , "<stage identifier>");
    FilterStructure.Insert("TITLE"              , "<deal name (can be searched using the template [% [%_])>");
    FilterStructure.Insert("TYPE_ID"            , "<deal type>");

    If Clear Then
        For Each Field In FilterStructure Do
            FilterStructure.Insert(Field.Key, "");
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;

EndFunction

#EndRegion

#Region CalendarsManagement

// Get list of calendars
// Gets a list of calendars of the specified owner
//
// Note:
// Method at API documentation: [calendar.section.get](@apidocs.bitrix24.ru/api-reference/calendar/calendar-section-get.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// OwnerID - String, Number - Calendar owner ID - owner
// Type - String - Calendar type: user, group, company_calendar, location, etc. - type
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCalendarList(Val URL, Val OwnerID, Val Type, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "calendar.section.get");

    OPI_Tools.AddField("type"   , Type   , "String", Parameters);
    OPI_Tools.AddField("ownerId", OwnerID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Create calendar
// Creates a new calendar
//
// Note:
// Method at API documentation: [calendar.section.add](@apidocs.bitrix24.ru/api-reference/calendar/calendar-section-add.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldsStructure - Structure Of KeyAndValue - Calendar fields structure. See GetCalendarStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateCalendar(Val URL, Val FieldsStructure, Val Token = "") Export

    OPI_TypeConversion.GetKeyValueCollection(FieldsStructure);

    Parameters = NormalizeAuth(URL, Token, "calendar.section.add");

    For Each Field In FieldsStructure Do
        Parameters.Insert(Field.Key, Field.Value);
    EndDo;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Edit calendar
// Changes the calendar settings
//
// Note:
// Method at API documentation: [calendar.section.update](@apidocs.bitrix24.ru/api-reference/calendar/calendar-section-update.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// CalendarID - String, Number - Calendar ID - calendar
// FieldsStructure - Structure Of KeyAndValue - Deal fields structure. See. GetDealStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateCalendar(Val URL, Val CalendarID, Val FieldsStructure, Val Token = "") Export

    OPI_TypeConversion.GetKeyValueCollection(FieldsStructure);

    Parameters = NormalizeAuth(URL, Token, "calendar.section.update");

    OPI_Tools.AddField("id", CalendarID, "String", Parameters);

    For Each Field In FieldsStructure Do
        Parameters.Insert(Field.Key, Field.Value);
    EndDo;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete calendar
// Deletes an existing calendar
//
// Note:
// Method at API documentation: [calendar.section.delete](@apidocs.bitrix24.ru/api-reference/calendar/calendar-section-delete.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// CalendarID - String, Number - Calendar ID - calendar
// OwnerID - String, Number - Calendar owner ID - owner
// Type - String - Calendar type: user, group - type
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteCalendar(Val URL, Val CalendarID, Val OwnerID, Val Type, Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "calendar.section.delete");

    OPI_Tools.AddField("type"   , Type      , String_, Parameters);
    OPI_Tools.AddField("ownerId", OwnerID   , String_, Parameters);
    OPI_Tools.AddField("id"     , CalendarID, String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get user busy
// Gets an array of user events in the specified interval
//
// Note:
// Method at API documentation: [calendar.accessibility.get](@apidocs.bitrix24.ru/api-reference/calendar/calendar-accessibility-get.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Users - Number, Array Of Number - IDs of users or a single user - users
// StartDate - Date - Start date of the period - from
// EndDate - Date - End date of the period - to
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetUserBusy(Val URL, Val Users, Val StartDate, Val EndDate, Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "calendar.accessibility.get");

    OPI_Tools.AddField("users", Users, "Array", Parameters);

    OPI_Tools.AddField("from" , Format(StartDate , "DF=yyyy-MM-dd"), String_ , Parameters);
    OPI_Tools.AddField("to"   , Format(EndDate   , "DF=yyyy-MM-dd"), String_ , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get custom calendar settings
// Gets the current users custom calendar settings
//
// Note:
// Method at API documentation: [calendar.user.settings.get](@apidocs.bitrix24.ru/api-reference/calendar/calendar-user-settings-get.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCustomCalendarSettings(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "calendar.user.settings.get");
    Response   = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Set custom calendar settings
// Sets new custom calendar settings
//
// Note:
// Method at API documentation: [calendar.user.settings.set](@apidocs.bitrix24.ru/api-reference/calendar/calendar-user-settings-set.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// SettingsStructure - Structure Of KeyAndValue - Settings structure. See GetCalednarCustomSettingsStructure - settings
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function SetCustomCalendarSettings(Val URL, Val SettingsStructure, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "calendar.user.settings.set");

    OPI_Tools.AddField("settings", SettingsStructure, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get calendar settings structure
// Gets the structure of the default calendar settings
//
// Note:
// Method at API documentation: [calendar.settings.get](@apidocs.bitrix24.ru/api-reference/calendar/calendar-settings-get.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCalendarSettingsStructure(Val URL, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "calendar.settings.get");
    Response   = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get calednar custom settings structure
// Gets an empty structure for setting custom calendar settings
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetCalednarCustomSettingsStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    SettingsStructure = New Structure;

    SettingsStructure.Insert("view"              , "<standard presentation: day, week, month, list>");
    SettingsStructure.Insert("meetSection"       , "<invitation calendar>");
    SettingsStructure.Insert("crmSection"        , "<calendar for CRM>");
    SettingsStructure.Insert("showDeclined"      , "<show rejected events>");
    SettingsStructure.Insert("denyBusyInvitation", "<disallow invitations to an event if the time is full>");
    SettingsStructure.Insert("collapseOffHours"  , "<hide off hours: Y,N>");
    SettingsStructure.Insert("showWeekNumbers"   , "<show week number: Y,N>");
    SettingsStructure.Insert("showTasks"         , "<display tasks: Y,N>");
    SettingsStructure.Insert("syncTasks"         , "<synchronise the task calendar: Y,N>");
    SettingsStructure.Insert("showCompletedTasks", "<display completed tasks: Y,N>");
    SettingsStructure.Insert("lastUsedSection"   , "<default event calendar>");
    SettingsStructure.Insert("sendFromEmail"     , "<E-mail for sending invitations>");
    SettingsStructure.Insert("defaultSections"   , "<preset calendar settings>");
    SettingsStructure.Insert("syncPeriodPast"    , "<number of months to synchronise in the past period>");
    SettingsStructure.Insert("syncPeriodFuture"  , "<number of months to synchronise in the future period>");

        RemindersStructure = New Structure;

            ReminderSettingsArray = New Array;
                ReminderSetting   = New Structure;
                ReminderSetting.Insert("type" , "<reminder time type: min, hour, day>");
                ReminderSetting.Insert("count", "<numeric value of the time interval>");
            ReminderSettingsArray.Add(ReminderSetting);

        RemindersStructure.Insert("fullDay" , ReminderSettingsArray);
        RemindersStructure.Insert("withTime", ReminderSettingsArray);

    SettingsStructure.Insert("defaultReminders", RemindersStructure);

    If Clear Then
        SettingsStructure = OPI_Tools.ClearCollectionRecursively(SettingsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

// Get calendar structure
// Returns the structure of the calendar description fields
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetCalendarStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    CalendarsStructure = New Structure;

    CalendarsStructure.Insert("type"       , "<calendar type: user, group)>");
    CalendarsStructure.Insert("ownerId"    , "<owner identifier>");
    CalendarsStructure.Insert("name"       , "<calendars name>");
    CalendarsStructure.Insert("description", "<calendar description>");
    CalendarsStructure.Insert("color"      , "<calendar color>");
    CalendarsStructure.Insert("text_color" , "<calendar text color>");

        ExportStructure = New Structure;
        ExportStructure.Insert("ALLOW", "<calendar export permission (bool)>");
        ExportStructure.Insert("SET"  , "<export period: all, 3_9 (example: 3 months before and 9 after)>");

    CalendarsStructure.Insert("export", ExportStructure);

    If Clear Then
        CalendarsStructure = OPI_Tools.ClearCollectionRecursively(CalendarsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return CalendarsStructure;

EndFunction

#EndRegion

#Region CalendarEventsManagement

// Create calendar event
// Creates a new calendar event
//
// Note:
// Method at API documentation: [calendar.event.add](@apidocs.bitrix24.ru/api-reference/calendar/calendar-event/calendar-event-add.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// EventDescription - Structure Of KeyAndValue - Event description. See GetCalendarEventsStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateCalendarEvent(Val URL, Val EventDescription, Val Token = "") Export

    OPI_TypeConversion.GetKeyValueCollection(EventDescription);

    Parameters = NormalizeAuth(URL, Token, "calendar.event.add");

    For Each Field In EventDescription Do
        Parameters.Insert(Field.Key, Field.Value);
    EndDo;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update calendar event
// Modifies calendar event data
//
// Note:
// Method at API documentation: [calendar.event.update](@apidocs.bitrix24.ru/api-reference/calendar/calendar-event/calendar-event-update.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// EventID - Number - Calednar event ID - event
// EventDescription - Structure Of KeyAndValue - Event description. See GetCalendarEventsStructure - fields
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateCalendarEvent(Val URL, Val EventID, Val EventDescription, Val Token = "") Export

    OPI_TypeConversion.GetKeyValueCollection(EventDescription);

    Parameters = NormalizeAuth(URL, Token, "calendar.event.update");
    OPI_Tools.AddField("id", EventID, "String", Parameters);

    For Each Field In EventDescription Do
        Parameters.Insert(Field.Key, Field.Value);
    EndDo;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get calendar event
// Gets a calendar event by ID
//
// Note:
// Method at API documentation: [calendar.event.getbyid](@apidocs.bitrix24.ru/api-reference/calendar/calendar-event/calendar-event-get-by-id.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// EventID - Number - Event ID to retrieve - event
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCalendarEvent(Val URL, Val EventID, Val Token = "") Export

    Response = PrimaryControlAction(URL, EventID, "calendar.event.getbyid", Token);
    Return Response;

EndFunction

// Get calendar events
// Gets events of calendars with or without filters
//
// Note:
// Method at API documentation: [calendar.event.get](@apidocs.bitrix24.ru/api-reference/calendar/calendar-event/calendar-event-get.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// OwnerID - String, Number - Calendar owner ID - owner
// Type - String - Calendar type: user, group, company_calendar - type
// Filter - Structure Of KeyAndValue - Events filter. See GetCalendarEventsFilterStructure - filter
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetCalendarEvents(Val URL, Val OwnerID, Val Type, Val Filter = "", Val Token = "") Export

    String_ = "String";

    Parameters = NormalizeAuth(URL, Token, "calendar.event.get");

    OPI_Tools.AddField("type"   , Type   , String_, Parameters);
    OPI_Tools.AddField("ownerId", OwnerID, String_, Parameters);

    If ValueIsFilled(Filter) Then

        OPI_TypeConversion.GetKeyValueCollection(Filter);

        For Each Element In Filter Do

            CurrentKey   = String(Element.Key);
            CurrentValue = Element.Value;

            If CurrentKey = "section" Then

                OPI_TypeConversion.GetArray(CurrentValue);

            ElsIf CurrentKey = "from" Or CurrentKey = "to" Then

                OPI_TypeConversion.GetDate(CurrentValue);
                CurrentValue = Format(CurrentValue, "DF=yyyy-MM-dd");

            Else
                Continue;
            EndIf;

            Parameters.Insert(CurrentKey, CurrentValue);

        EndDo;

    EndIf;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete calendar event
// Deletes an event from the calendar
//
// Note:
// Method at API documentation: [calendar.event.delete](@apidocs.bitrix24.ru/api-reference/calendar/calendar-event/calendar-event-delete.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// EventID - Number - ID of the event to be deleted - event
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteCalendarEvent(Val URL, Val EventID, Val Token = "") Export

    Response = PrimaryControlAction(URL, EventID, "calendar.event.delete", Token);
    Return Response;

EndFunction

// Get user participation status
// Gets the event participation status of the current user
//
// Note:
// Method at API documentation: [calendar.meeting.status.get](@apidocs.bitrix24.ru/api-reference/calendar/calendar-event/calendar-meeting-status-get.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// EventID - Number - Calednar event ID - event
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetUserParticipationStatus(Val URL, Val EventID, Val Token = "") Export

    Response = PrimaryControlAction(URL, EventID, "calendar.meeting.status.get", Token, "eventId");
    Return Response;

EndFunction

// Set user participation status
// Sets the event participation status for the current user
//
// Note:
// Method at API documentation: [calendar.meeting.status.set](@apidocs.bitrix24.ru/api-reference/calendar/calendar-event/calendar-meeting-status-set.html)
//
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// EventID - Number - Calednar event ID - event
// Status - String - Participation status: Y (agreed), N (refused), Q (did not answer) - status
// Token - String - Access token, when app auth method used - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function SetUserParticipationStatus(Val URL, Val EventID, Val Status, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "calendar.meeting.status.set");

    OPI_Tools.AddField("eventId", EventID, "String", Parameters);
    OPI_Tools.AddField("status" , Status , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get calendar events structure
// Returns the structure of the calendar event fields
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetCalendarEventsStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    EventStucture = New Structure;

    EventStucture.Insert("type"         , "<calendar type: user, group, company_calendar>");
    EventStucture.Insert("ownerId"      , "<calendar owner identifier>");
    EventStucture.Insert("from"         , "<event start date and time (as string)>");
    EventStucture.Insert("to"           , "<event end date (as string)>");
    EventStucture.Insert("from_ts"      , "<date and time in timestamp format (instead of from)>");
    EventStucture.Insert("to_ts"        , "<date and time in timestamp format (instead of to)>");
    EventStucture.Insert("section"      , "<calendar identifier>");
    EventStucture.Insert("name"         , "<event name>");
    EventStucture.Insert("skip_time"    , "<pass date value without time in from and to parameters: Y,N>");
    EventStucture.Insert("timezone_from", "<start time zone (default - t.z. of the user)>");
    EventStucture.Insert("timezone_to"  , "<end time zone (default - t.z. of the user)>");
    EventStucture.Insert("description"  , "<event description>");
    EventStucture.Insert("color"        , "<event background colour. Symbol # - in unicode format as %23>");
    EventStucture.Insert("text_color"   , "<the colour of the event text. Symbol # - in unicode format as %23>");
    EventStucture.Insert("accessibility", "<availability at the time of the event: busy, absent, quest, free>");
    EventStucture.Insert("importance"   , "<importance: high, normal, low>");
    EventStucture.Insert("private_event", "<private event: Y,N>");

        RepeatabilityStructure = New Structure;
        RepeatabilityStructure.Insert("FREQ"    , "<repetition rate: DAILY, WEEKLY, MONTHLY, YEARLY>");
        RepeatabilityStructure.Insert("COUNT"   , "<number of repetitions>");
        RepeatabilityStructure.Insert("INTERVAL", "<repetition interval>");

            DaysArray = New Array;
            DaysArray.Add("<days of the week: SU, MO, TU, WE, TH, FR, SA>");

        RepeatabilityStructure.Insert("BYDAY" , DaysArray);
        RepeatabilityStructure.Insert("UNTIL" , "<repetition end date>");

    EventStucture.Insert("rrule"     , RepeatabilityStructure);
    EventStucture.Insert("is_meeting", "<flag of meeting with participants: Y,N>");
    EventStucture.Insert("location"  , "<venue>");

        RemindersArray = New Array;

            ReminderStructure = New Structure;
            ReminderStructure.Insert("type" , "<time type: min, hour, day>");
            ReminderStructure.Insert("count", "<numeric value of the time interval>");

        RemindersArray.Add(ReminderStructure);

    EventStucture.Insert("remind"   , RemindersArray);
    EventStucture.Insert("attendees", "<array of event participant IDs. If is_meeting = Y>");
    EventStucture.Insert("host"     , "<The identifier of the event organiser. If is_meeting = Y>");

        MeetingStructure = New Structure;
        MeetingStructure.Insert("notify"      , "<flag for notification of confirmation or cancellation of participants>");
        MeetingStructure.Insert("reinvite"    , "<flag for requesting re-confirmation of participation when editing an event>");
        MeetingStructure.Insert("allow_invite", "<flag to allow participants to invite others to the event>");
        MeetingStructure.Insert("hide_guests" , "<flag to hide the list of participants>");

    EventStucture.Insert("meeting", MeetingStructure);

    If Clear Then
        EventStucture = OPI_Tools.ClearCollectionRecursively(EventStucture);
    EndIf;

    //@skip-check constructor-function-return-section
    Return EventStucture;

EndFunction

// Get calendar events filter structure
// Gets the filter structure for the function GetCalendarEvents
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetCalendarEventsFilterStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FilterStructure = New Structure;

    FilterStructure.Insert("from"   , "<selection start date. 3 months before the current default>");
    FilterStructure.Insert("to"     , "<selection end date. 3 months after the current default>");
    FilterStructure.Insert("section", "<array of calendar identifiers>");

    If Clear Then
        FilterStructure = OPI_Tools.ClearCollectionRecursively(FilterStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

Procedure MakeBoolean(Value)

    OPI_TypeConversion.GetBoolean(Value);
    Value = ?(Value, "Y", "N");

EndProcedure

Function NormalizeAuth(URL, Val Token, Val Method = "")

    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(Token);

    Parameters  = New Structure;
    IsTokenAuth = ValueIsFilled(Token);

    UncorrectItems = New Array;
    UncorrectItems.Add("https://");
    UncorrectItems.Add("http://");
    UncorrectItems.Add("www.");

    For Each DeletedElement In UncorrectItems Do
        URL = StrReplace(URL, DeletedElement, "");
    EndDo;

    URL = TrimAll(URL);

    If Not StrEndsWith(URL, "/") Then
        URL = URL + "/";
    EndIf;

    If IsTokenAuth Then

        If Not StrEndsWith(URL, "rest/") Then
            URL = URL + "rest/";
        EndIf;

        Parameters.Insert("auth", Token);

    EndIf;

    If ValueIsFilled(Method) Then
        URL = URL + TrimAll(Method);
    EndIf;

    Return Parameters;

EndFunction

Function NormalizeFiles(Val Files)

    NormalizedFiles = New Array;

    If TypeOf(Files) = Type("Map") Then

        For Each File In Files Do

            CurrentArray = New Array;
            CurrentFile  = File.Value;
            CurrentName  = File.Key;

            OPI_TypeConversion.GetBinaryData(CurrentFile);
            OPI_TypeConversion.GetLine(CurrentName);

            CurrentArray.Add(CurrentName);
            CurrentArray.Add(Base64String(CurrentFile));

            NormalizedFiles.Add(CurrentArray);

        EndDo;

    EndIf;

    Return NormalizedFiles;

EndFunction

Function PrimaryControlAction(Val URL, Val ObjectID, Val Method, Val Token = "", Val FieldID = "id")

    Parameters = NormalizeAuth(URL, Token, Method);
    OPI_Tools.AddField(FieldID, ObjectID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

Function ChecklistElementManagement(Val URL, Val TaskID, Val ElementID, Val Method, Val Token = "")

    Parameters = NormalizeAuth(URL, Token, Method);

    OPI_Tools.AddField("TASKID", TaskID   , "String", Parameters);
    OPI_Tools.AddField("ITEMID", ElementID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

Function ChatNotificationsSwitch(Val URL, Val ChatID, Val Off, Val Token = "")

    MakeBoolean(Off);

    Parameters = NormalizeAuth(URL, Token, "im.chat.mute");

    OPI_Tools.AddField("CHAT_ID", ChatID , "String", Parameters);
    OPI_Tools.AddField("MUTE"   , Off    , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion
