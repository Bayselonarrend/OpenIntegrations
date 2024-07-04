// OneScript: ./OInt/core/Modules/OPI_Bitrix24.os
// Lib: Bitrix24
// CLI: bitrix24

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Uncomment if OneScript is executed
// #Use "../../tools"

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
    
    URL = "https://oauth.bitrix.info/oauth/token/";
    String_ = "String";
    
    Parameters = New Structure;
    OPI_Tools.AddField("grant_type" , "authorization_code", String_, Parameters);
    OPI_Tools.AddField("client_id" , ClientID , String_, Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret , String_, Parameters);
    OPI_Tools.AddField("code" , Code , String_, Parameters);  
    
    Response = OPI_Tools.Get(URL, Parameters);
    
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
    
    URL = "https://oauth.bitrix.info/oauth/token/";
    String_ = "String";
    
    Parameters = New Structure;
    OPI_Tools.AddField("grant_type" , "refresh_token" , String_, Parameters);
    OPI_Tools.AddField("client_id" , ClientID , String_, Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret , String_, Parameters);
    OPI_Tools.AddField("refresh_token", Refresh , String_, Parameters);  
    
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;

EndFunction

// Server time
// Get current server time
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ServerTime(Val URL, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "server.time");
	Response = OPI_Tools.Get(URL, Parameters);
	
	Return Response;
		
EndFunction

#EndRegion

#Region FeedPostsManagment

// Create post
// Create a new post at news feed
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Text - String - Text of post - text
// Visibility - String - Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group - vision
// Files - String - Attachment data where key > filename, value > file path or binary data - files
// Title - String - Post title - title
// Important - Boolean - Mark post as important - important 
// Token - String - Access token, when not-webhook method used - token
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
    OPI_Tools.AddField("POST_MESSAGE", Text , String_, Parameters);
    OPI_Tools.AddField("POST_TITLE" , Title , String_, Parameters);
    OPI_Tools.AddField("DEST" , Visibility , "Array", Parameters);
    OPI_Tools.AddField("IMPORTANT" , Important , String_, Parameters);
    
    If ValueIsFilled(Files) Then
        
        OPI_TypeConversion.GetCollection(Files);
        
        ArrayOfFiles = NormalizeFiles(Files);
        
        If Not ArrayOfFiles.Count() = 0 Then
            Parameters.Insert("FILES", ArrayOfFiles);
        EndIf;
        
    EndIf;
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Update post
// Change post data
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Post ID - postid
// Text - String - Text of post - text
// Visibility - String - Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group - vision
// Files - String - Attachment data where key > filename, value > file path or binary data - files
// Title - String - Post title - title
// Token - String - Access token, when not-webhook method used - token
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
    OPI_Tools.AddField("POST_MESSAGE", Text , String_, Parameters);
    OPI_Tools.AddField("POST_TITLE" , Title , String_, Parameters);
    OPI_Tools.AddField("DEST" , Visibility , "Array", Parameters);
    OPI_Tools.AddField("POST_ID" , PostID , String_, Parameters);
    
    If ValueIsFilled(Files) Then
        
        OPI_TypeConversion.GetCollection(Files);
        
        ArrayOfFiles = NormalizeFiles(Files);
        
        If Not ArrayOfFiles.Count() = 0 Then
            Parameters.Insert("FILES", ArrayOfFiles);
        EndIf;
        
    EndIf;
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Delete post
// Remove post from a news feed
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Id of post to remove - postid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeletePost(Val URL, Val PostID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.delete");
    OPI_Tools.AddField("POST_ID", PostID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Get list of important post viewers
// Return list of important post viewers ids
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Id of important post - postid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetImportantPostViewers(Val URL, Val PostID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.getusers.important");
    OPI_Tools.AddField("POST_ID", PostID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Get posts
// Gen post or array of post with ID or rights selection
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Id of important post - postid
// Filter - String - Post selection by rights: UA all, SGn work group, Un user, DRn depart, Gn group - sel 
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetPosts(Val URL, Val PostID = "", Val Filter = "UA", Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.get");
    
    OPI_Tools.AddField("POST_ID" , PostID, "String", Parameters);
    OPI_Tools.AddField("LOG_RIGHTS", Filter , "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Add comment to post
// Adds a comment to the post
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url 
// PostID - String, Number - Post ID - postid
// Text - String - Comment text - text
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddPostComment(Val URL, Val PostID, Val Text, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogcomment.add");
    
    OPI_Tools.AddField("POST_ID" , PostID, "String", Parameters);
    OPI_Tools.AddField("TEXT" , Text , "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Add new recipients to a post
// Adds new groups or users to the recipients
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// PostID - String, Number - Post ID - postid
// Visibility - String - Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group - vision
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddPostRecipients(Val URL, Val PostID, Val Visibility, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.share");
    
    OPI_Tools.AddField("POST_ID" , PostID, "String", Parameters);
    OPI_Tools.AddField("DEST" , Visibility, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

#EndRegion

#Region TasksManagment

// Get task
// Get task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.get", Token);
    Return Response;
    
EndFunction

// Get tasks list
// Get tasks list (50 at one response max))
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Filter - Structure of Key-Value - Structure of task filter (see GetTaskFieldsStructure) - filter
// Indent - Number, String - Offset of tasks list - offset
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTasksList(Val URL, Val Filter = "", Val Indent = 0, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "tasks.task.list");
    OPI_Tools.AddField("filter", Filter, "Collection", Parameters);
    OPI_Tools.AddField("start" , Indent, "String" , Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Create task
// Create new task by fields structure (see GetTaskFieldsStructure)
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FieldsStructure - Structure of Key-Value - Task fields structure (see GetTaskFieldsStructure) - fields
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateTask(Val URL, Val FieldsStructure, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "tasks.task.add");
    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;

EndFunction

// Update task
// Update a task
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// FieldsStructure - Structure of Key-Value - Task fields structure - fields
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateTask(Val URL, Val TaskID, Val FieldsStructure, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "tasks.task.update");
    OPI_Tools.AddField("fields", FieldsStructure, "Collection", Parameters);
    OPI_Tools.AddField("taskId", TaskID , "String" , Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;

EndFunction

// Delete task
// Delete task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.delete", Token);
    Return Response;
    
EndFunction

// Attach file to the topic
// Attaches a file to the selected task
// 
// Parameters:
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// FileID - Number, String - File ID - fileid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AttachFileToTopic(Val URL, Val TaskID, Val FileID, Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.files.attach");
    OPI_Tools.AddField("fileId", FileID , "String", Parameters);
    OPI_Tools.AddField("taskId", TaskID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
        
EndFunction

// Approve task
// Approve task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function ApproveTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.approve", Token);
    Return Response;
    
EndFunction

// Disapprove task
// Disapprove task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DisapproveTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.disapprove", Token);
    Return Response;
    
EndFunction

// Complete task
// Complete task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CompleteTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.complete", Token);
    Return Response;
    
EndFunction

// Renew task
// Returns a task to work by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenewTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.renew", Token);
    Return Response;
    
EndFunction

// Defer task
// Defer task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeferTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.defer", Token);
    Return Response;
    
EndFunction

// Pause task
// Pause a task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function PauseTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.pause", Token);
    Return Response;
    
EndFunction

// Start a task
// Start a task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StartTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.start", Token);
    Return Response;
    
EndFunction

// Start watching a task
// Start watching a task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StartWatchingTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.startwatch", Token);
    Return Response;
    
EndFunction

// Stop watching the task
// Stop watching a task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function StopWatchingTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.stopwatch", Token);
    Return Response;
    
EndFunction

// Delegate task
// Delegate task to another user
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// UserID - Number, String - ID of responsible user - user
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DelegateTask(Val URL, Val TaskID, Val UserID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "tasks.task.delegate");
    OPI_Tools.AddField("taskId", TaskID , "String", Parameters);
    OPI_Tools.AddField("userId", UserID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Add task to favorites list
// Add task to favorites list
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddTaskToFavorites(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.favorite.add", Token);
    Return Response;
    
EndFunction

// Remove task from favorites list
// Delete task from favorites list
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RemoveTaskFromFavorites(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.favorite.remove", Token);
    Return Response;
    
EndFunction

// Get task history
// Get history of task changing
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskHistory(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.history.list", Token);
    Return Response;
    
EndFunction

// Check task acesses for users
// Checks the availability of the task for users
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Users - Array of String - User IDs for access checking - users
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CheckTaskAccesses(Val URL, Val TaskID, Val Users = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.getaccess");
    OPI_Tools.AddField("taskId", TaskID , "String" , Parameters);
    OPI_Tools.AddField("users" , Users, "Array", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
        
EndFunction

// Mute task
// Mute task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MuteTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.mute", Token);
    Return Response;
    
EndFunction

// Unmute task
// Unmute task by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UnmuteTask(Val URL, Val TaskID, Val Token = "") Export
    
    Response = ManageTask(URL, TaskID, "tasks.task.unmute", Token);
    Return Response;
    
EndFunction

// Create tasks dependencies
// Creates the dependency of one task to another
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FromID - String, Number - From task ID - taskfrom
// DestinationID - String, Number - To task ID - taskto
// LinkType - String, Number - Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish - linktype
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateTasksDependencies(Val URL, Val FromID, Val DestinationID, Val LinkType, Val Token = "") Export
    
    OPI_TypeConversion.GetLine(LinkType);
    
    Parameters = NormalizeAuth(URL, Token, "task.dependence.add");
    OPI_Tools.AddField("taskIdFrom", FromID, "String" , Parameters);
    OPI_Tools.AddField("taskIdTo" , DestinationID, "String" , Parameters);
    OPI_Tools.AddField("linkType" , LinkType , "String" , Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
     
EndFunction

// Delete tasks dependencies
// Removes the dependency of one task to another
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FromID - String, Number - From task ID - taskfrom
// DestinationID - String, Number - To task ID - taskto
// LinkType - String, Number - Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish - linktype
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTasksDependencies(Val URL, Val FromID, Val DestinationID, Val LinkType, Val Token = "") Export
    
    OPI_TypeConversion.GetLine(LinkType);
    
    Parameters = NormalizeAuth(URL, Token, "task.dependence.delete");
    OPI_Tools.AddField("taskIdFrom", FromID, "String" , Parameters);
    OPI_Tools.AddField("taskIdTo" , DestinationID, "String" , Parameters);
    OPI_Tools.AddField("linkType" , LinkType , "String" , Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
     
EndFunction

// Get task fields structure
// Gets a structure with a description of the fields for creating a task
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskFieldsStructure(Val URL, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "tasks.task.getFields");
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;
    
EndFunction    

// Get structure of tasks filter
// Return filter structure for GetTasksList
// 
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// 
// Returns:
// Structure of Key-Value - Fields structure 
Function GetTasksFilterStructure(Val Clear = False) Export
    
    // More
    // https://dev.1c-bitrix.ru/rest_help/tasks/task/tasks/tasks_task_list.php
    
    OPI_TypeConversion.GetBoolean(Clear);
    
    FilterStructure = New Structure;
    FilterStructure.Insert("ID" , "<task identifier>");
    FilterStructure.Insert("PARENT_ID" , "<parent task identifier>");
    FilterStructure.Insert("GROUP_ID" , "<workgroup identifier>");
    FilterStructure.Insert("CREATED_BY" , "<producer>");
    FilterStructure.Insert("STATUS_CHANGED_BY", "<the user who last changed the task status>");
    FilterStructure.Insert("PRIORITY" , "<priority>");
    FilterStructure.Insert("FORUM_TOPIC_ID" , "<forum topic identifier>");
    FilterStructure.Insert("RESPONSIBLE_ID" , "<performer>");
    FilterStructure.Insert("TITLE" , "<task name (can be searched using the template [%_])>");
    FilterStructure.Insert("TAG" , "<tag>");
    FilterStructure.Insert("REAL_STATUS" , "<task status>");
    FilterStructure.Insert("MARK" , "<mark>");
    FilterStructure.Insert("SITE_ID" , "<site identifier>");
    FilterStructure.Insert("ADD_IN_REPORT" , "<task in the report (Y|N)>");
    FilterStructure.Insert("DATE_START" , "<start date>");
    FilterStructure.Insert("DEADLINE" , "<deadline>");
    FilterStructure.Insert("CREATED_DATE" , "<date of creation>");
    FilterStructure.Insert("CLOSED_DATE" , "<completion date>");
    FilterStructure.Insert("CHANGED_DATE" , "<date of last modification>");
    FilterStructure.Insert("ACCOMPLICE" , "<co-executor identifier>");
    FilterStructure.Insert("AUDITOR" , "<auditor identifier>");
    FilterStructure.Insert("DEPENDS_ON" , "<previous task identifier>");
    FilterStructure.Insert("ONLY_ROOT_TASKS" , "<only tasks that are not subtasks (Y|N)>");
    FilterStructure.Insert("STAGE_ID" , "<stage>");
    FilterStructure.Insert("UF_CRM_TASK" , "<CRM elements>");
    FilterStructure.Insert("STATUS"
        , "<status for sorting. Similar to REAL_STATUS, but has three additional meta-statuses>");
        
    If Clear Then
    	For Each Filter In FilterStructure Do
    		Filter.Value = "";
    	EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;
        
EndFunction

#EndRegion

#Region CommentsAndResultsManagment

// Get comments list for a task
// Get user comments list for a task
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskCommentsList(Val URL, Val TaskID, Val Token = "") Export

    Response = ManageTask(URL, TaskID, "task.commentitem.getlist", Token);
    Return Response;

EndFunction

// Get task comment
// Gets task comment data by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// CommentID - Number, String - CommentID - comment
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskComment(Val URL, Val TaskID, Val CommentID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "task.commentitem.get");
    OPI_Tools.AddField("TASKID", TaskID , "String", Parameters);
    OPI_Tools.AddField("ITEMID", CommentID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Add comment to task
// Create new comment to the task
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Text - String - Comment text - text
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function AddTaskComment(Val URL, Val TaskID, Val Text, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "task.commentitem.add");
    
    Comment = New Structure;
    OPI_Tools.AddField("POST_MESSAGE", Text, "String", Comment);
    
    OPI_Tools.AddField("TASKID", TaskID , "String" , Parameters);
    OPI_Tools.AddField("FIELDS", Comment, "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Update task comment
// Changes task comment text
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// CommentID - Number, String - CommentID - comment
// Text - String - Comment text - text
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UpdateTaskComment(Val URL, Val TaskID, Val CommentID, Val Text, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "task.commentitem.update");
    
    Comment = New Structure;
    OPI_Tools.AddField("POST_MESSAGE", Text, "String", Comment);
    
    OPI_Tools.AddField("TASKID", TaskID , "String" , Parameters);
    OPI_Tools.AddField("ITEMID", CommentID, "String" , Parameters);
    OPI_Tools.AddField("FIELDS", Comment , "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Delete comment
// Delete task comment by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// CommentID - Number, String - ID of comment to remove - comment
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteTaskComment(Val URL, Val TaskID, Val CommentID, Val Token = "") Export
      
    Parameters = NormalizeAuth(URL, Token, "task.commentitem.delete");
    OPI_Tools.AddField("TASKID", TaskID , "String", Parameters);
    OPI_Tools.AddField("ITEMID", CommentID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
      
EndFunction

// Get results list
// Gets results list for task
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetResultsList(Val URL, Val TaskID, Val Token = "") Export
	
	Response = ManageTask(URL, TaskID, "tasks.task.result.list", Token);
    Return Response;
    
EndFunction

// Create result from comment
// Create task result from comment
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// CommentID - Number, String - CommentID - comment
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateResultFromComment(Val URL, Val CommentID, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "tasks.task.result.addFromComment");
    OPI_Tools.AddField("commentId", CommentID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Delete result from comment
// Deletes task result, created from a comment
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// CommentID - Number, String - CommentID - comment
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteResultFromComment(Val URL, Val CommentID, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "tasks.task.result.deleteFromComment");
    OPI_Tools.AddField("commentId", CommentID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Get comment structure
// Get comment fields structure
// 
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//  
// Returns:
// Structure of Key-Value - Fields structure 
Function GetCommentStructure(Val Clear = False) Export
    
    // More
    // https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/add.php
    
    OPI_TypeConversion.GetBoolean(Clear);
    
    FieldsStructure = New Structure;
    FieldsStructure.Insert("AUTHOR_ID" , "<comment author identifier>");
    FieldsStructure.Insert("AUTHOR_NAME" , "<Name of user (optional)>");
    FieldsStructure.Insert("AUTHOR_EMAIL" , "<E-mail of user (optional)>");
    FieldsStructure.Insert("USE_SMILES" , "<(Y|N) - parse comments for emoticons or not>");
    FieldsStructure.Insert("POST_MESSAGE" , "<Message text>");
    FieldsStructure.Insert("UF_FORUM_MESSAGE_DOC" , "<Files array with of drive for of attachments>");
    
    If Clear Then
        For Each Field In FieldsStructure Do
            Field.Value = "";
        EndDo;
    EndIf;
        
    //@skip-check constructor-function-return-section
    Return FieldsStructure;
    
EndFunction

#EndRegion

#Region StoragesAndFilesManagment

// Get list of storages
// Get list of available files storages
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetStoragesList(Val URL, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "disk.storage.getlist");
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;

EndFunction

// Get storage for application data
// Get information about storage with which the application can work to store its data
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetAppSotrage(Val URL, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "disk.storage.getforapp");
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Get storage
// Get information about storage
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String, Number - Storage ID - storageid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetStorage(Val URL, Val StorageID, Val Token = "") Export
	
	Response = FileManagement(URL, StorageID, "disk.storage.get", Token);
	Return Response;
	
EndFunction

// Rename storage
// Change storage name (for app storage only, see. GetAppStorage)
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String, Number - Storage ID - storageid
// Name - String - New storage name - title
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// HTTPResponse - Rename storage
Function RenameStorage(Val URL, Val StorageID, Val Name, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "disk.storage.rename");
	
    OPI_Tools.AddField("id" , StorageID , "String", Parameters);
    OPI_Tools.AddField("newName", Name, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Get a list of child storage objects
// Get a list of files and folders, located at the root of the storage
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String, Number - Storage ID - storageid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetStorageObjects(Val URL, Val StorageID, Val Token = "") Export
	
	Response = FileManagement(URL, StorageID, "disk.storage.getchildren", Token);
	Return Response;
	
EndFunction

// Upload file to a storage
// Upload file to storage root
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Name - String - File name with extension - title
// File - String, BinaryData - File for upload - file        
// StorageID - String - Storage id - storageid
// Rights - String - Rights array if required - rights
// Token - String - Access token, when not-webhook method used - token
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

    FileData = New Structure("NAME", Name);
    FileContent = New Map();
    FileContent.Insert(Name, File);
    
    Parameters = NormalizeAuth(URL, Token, Method);
    OPI_Tools.AddField("data" , FileData, "Collection", Parameters);
    OPI_Tools.AddField("rights", Rights , "Array" , Parameters);
    OPI_Tools.AddField("id" , StorageID, "String" , Parameters);

    FileArray = NormalizeFiles(FileContent);
    
    If Not FileArray.Count() = 0 Then
        Parameters.Insert("fileContent", FileArray[0]);
    EndIf;
  
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Create folder at the storage
// Create new foldera at the storage
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// StorageID - String - Storage ID - storageid
// Name - String - Folder name - title
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateStorageFolder(Val URL, Val StorageID, Val Name, Val Token = "") Export
	
	OPI_TypeConversion.GetLine(Name);
	
	FolderStructure = New Structure("NAME", Name);
	
	Parameters = NormalizeAuth(URL, Token, "disk.storage.addfolder");
	
    OPI_Tools.AddField("id" , StorageID , "String" , Parameters);
    OPI_Tools.AddField("data", FolderStructure, "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;	
    
EndFunction

// Get information about folder
// Get folder information
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFolderInformation(Val URL, Val FolderID, Val Token = "") Export
    
    Response = FileManagement(URL, FolderID, "disk.folder.get", Token);
    Return Response;
    
EndFunction

// Create new subfolder
// Create new folder inside another folder
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Parent folder identifier - folderid
// Name - String - Name of new folder - title
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function CreateSubfolder(Val URL, Val FolderID, Val Name, Val Token = "") Export
    
    OPI_TypeConversion.GetLine(Name);
    
    FolderStructure = New Structure("NAME", Name);
    
    Parameters = NormalizeAuth(URL, Token, "disk.folder.addsubfolder");
    
    OPI_Tools.AddField("id" , FolderID , "String" , Parameters);
    OPI_Tools.AddField("data", FolderStructure, "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;  
    
EndFunction

// Copy folder
// Copy one folder to another
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// DestinationID - String, Number - ID of target folder - tagetid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MakeFolderCopy(Val URL, Val FolderID, Val DestinationID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "disk.folder.copyto");
    
    OPI_Tools.AddField("id" , FolderID , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", DestinationID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response; 
    
EndFunction

// Move folder
// Moves one folder inside another
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// DestinationID - String, Number - ID of target folder - tagetid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MoveFolder(Val URL, Val FolderID, Val DestinationID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "disk.folder.moveto");
    
    OPI_Tools.AddField("id" , FolderID , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", DestinationID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response; 
    
EndFunction

// Delete file
// Delete file by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - ID of removing file - fileid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteFile(Val URL, Val FileID, Val Token = "") Export
    
	Response = FileManagement(URL, FileID, "disk.file.delete", Token);
	Return Response;

EndFunction

// Delete folder
// Remove folder with subfolders
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - ID of folder to be deleted - folderid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function DeleteFolder(Val URL, Val FolderID, Val Token = "") Export
	
	Response = FileManagement(URL, FolderID, "disk.folder.deletetree", Token);
	Return Response;
	
EndFunction

// Get external link for folder
// Get external link to folder
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFolderExternalLink(Val URL, Val FolderID, Val Token = "") Export
	
	Response = FileManagement(URL, FolderID, "disk.folder.getExternalLink", Token);
	Return Response;
	
EndFunction

// Get folder child elements
// Get folder child elements
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Filter - Structure of Key-Value - Items filter (see GetFolderFilterStructure) - filter
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFolderItems(Val URL, Val FolderID, Val Filter = "", Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "disk.folder.getchildren");
	OPI_Tools.AddField("id" , FolderID, "String" , Parameters);
    OPI_Tools.AddField("filter", Filter , "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

// Mark folder as deleted
// Move folder to recycle bin
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MarkFolderAsDeleted(Val URL, Val FolderID, Val Token = "") Export
	
    Response = FileManagement(URL, FolderID, "disk.folder.markdeleted", Token);
	Return Response;
	
EndFunction

// Restore folder
// Resotre folder form recycle bin
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RestoreFolder(Val URL, Val FolderID, Val Token = "") Export
 
    Response = FileManagement(URL, FolderID, "disk.folder.restore", Token);
    Return Response;  
     
EndFunction

// Rename folder
// Change folder name
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FolderID - String, Number - Folder identifier - folderid
// Name - String - New folders name - title
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenameFolder(Val URL, Val FolderID, Val Name, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "disk.folder.rename");
    
    OPI_Tools.AddField("id" , FolderID , "String", Parameters);
    OPI_Tools.AddField("newName", Name, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response; 
    
EndFunction

// Upload file to the folder
// Upload local file to the folder
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Name - String - File name with extension - title
// File - String, BinaryData - File for upload - file        
// FolderID - String - Folder identifier - folderid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function UploadFileToFolder(Val URL, Val Name, Val File, Val FolderID, Val Token = "") Export


    OPI_TypeConversion.GetLine(Name);
    OPI_TypeConversion.GetBinaryData(File);
        
    Parameters = NormalizeAuth(URL, Token, "disk.folder.uploadFile");
    OPI_Tools.AddField("id", FolderID, "String", Parameters);
    
    Response = OPI_Tools.Get(URL, Parameters);
    Result = Response["result"];
    
    If ValueIsFilled(Result) Then
        
        FieldName = Result["field"];
        UploadURL = Result["uploadUrl"];
        
        If ValueIsFilled(FieldName) And ValueIsFilled(UploadURL) Then
        
            FieldName = TrimAll(FieldName);
            UploadURL = TrimAll(UploadURL);
            FileName = FieldName + "|" + Name;
            
            FileMapping = New Map;
            FileMapping.Insert(FileName, File);   
            
            Response = OPI_Tools.PostMultipart(UploadURL, , FileMapping); 
             
        EndIf;
        
    EndIf;
    
    
    Return Response;  
      
EndFunction

// Get information about file
// Get information about file by ID
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFileInformation(Val URL, Val FileID, Val Token = "") Export
    
    Response = FileManagement(URL, FileID, "disk.file.get", Token);
    Return Response;
    
EndFunction

// Get external link for a file
// Get external link to file
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetFileExternalLink(Val URL, Val FileID, Val Token = "") Export
    
    Response = FileManagement(URL, FileID, "disk.file.getExternalLink", Token);
    Return Response;
    
EndFunction

// Mark file as deleted
// Move file to recycle bin
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MarkFileAsDeleted(Val URL, Val FileID, Val Token = "") Export
    
    Response = FileManagement(URL, FileID, "disk.file.markdeleted", Token);
    Return Response;
    
EndFunction

// Restore file
// Restore file from recycle bin
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RestoreFile(Val URL, Val FileID, Val Token = "") Export
    
    Response = FileManagement(URL, FileID, "disk.file.restore", Token);
    Return Response;
    
EndFunction

// Copy file
// Copy file from one destination to another
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - Original file ID - fileid
// FolderID - String, Number - ID of copy destination folder - folderid                                   
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MakeFileCopy(Val URL, Val FileID, Val FolderID, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "disk.file.copyto");
    
    OPI_Tools.AddField("id" , FileID , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", FolderID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response; 
    
EndFunction

// Move file
// Move file from one destination to another
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File ID - fileid
// FolderID - String, Number - ID of new destination folder - folderid                                   
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function MoveFileToFolder(Val URL, Val FileID, Val FolderID, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "disk.file.moveto");
    
    OPI_Tools.AddField("id" , FileID , "String", Parameters);
    OPI_Tools.AddField("targetFolderId", FolderID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response; 
    
EndFunction

// Rename file
// Changes the name of an existing file
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// FileID - String, Number - File identifier - fileid
// Name - String - New folders name - title
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function RenameFile(Val URL, Val FileID, Val Name, Val Token = "") Export
    
    Parameters = NormalizeAuth(URL, Token, "disk.file.rename");
    
    OPI_Tools.AddField("id" , FileID , "String", Parameters);
    OPI_Tools.AddField("newName", Name, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response; 
    
EndFunction

// Get fields structure for folder items filter
// Returns filter structure for child folder items
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// Clear - Boolean - True > structure with empty values, False > field types at values - empty
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Structure of Key-Value - Fields structure 
Function GetFolderFilterStructure(Val URL, Val Clear = False, Val Token = "") Export
	
	Parameters = NormalizeAuth(URL, Token, "disk.folder.getfields");
	Filter = New Structure;
	
	Response = OPI_Tools.Post(URL, Parameters);
	Fields = Response["result"];
	
	For Each Field In Fields Do
		
		Name = Field.Key;
		Description = Field.Value;
		
		If Description["USE_IN_FILTER"] Then
		
			DataType = ?(Clear, "", Description["TYPE"]);	
			Filter.Insert(Name, DataType);
		
		EndIf;
		
	EndDo;
	
	Return Filter;
	
EndFunction

#EndRegion

#EndRegion

#Region Private

Function NormalizeAuth(URL, Val Token, Val Method = "")
    
    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(Token);
    
    Parameters = New Structure;
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
            CurrentFile = File.Value;
            CurrentName = File.Key;
            
            OPI_TypeConversion.GetBinaryData(CurrentFile);
            OPI_TypeConversion.GetLine(CurrentName);
            
            CurrentArray.Add(CurrentName);
            CurrentArray.Add(Base64String(CurrentFile));
            
            NormalizedFiles.Add(CurrentArray);
            
        EndDo;
    
    EndIf;
    
    Return NormalizedFiles;
    
EndFunction

Procedure MakeBoolean(Value)

    OPI_TypeConversion.GetBoolean(Value);
    Value = ?(Value, "Y", "N");
    
EndProcedure

Function ManageTask(Val URL, Val TaskID, Val Method, Val Token = "")
    
    Parameters = NormalizeAuth(URL, Token, Method);
    OPI_Tools.AddField("taskId", TaskID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;
    
EndFunction

Function FileManagement(Val URL, Val FileID, Val Method, Val Token = "")

    Parameters = NormalizeAuth(URL, Token, Method);
    OPI_Tools.AddField("id", FileID, "String", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
    Return Response;	 
    
EndFunction

#EndRegion
