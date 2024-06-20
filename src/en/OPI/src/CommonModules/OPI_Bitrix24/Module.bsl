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
    
    Parameters = New Structure;
    OPI_Tools.AddField("grant_type" , "authorization_code", "String", Parameters);
    OPI_Tools.AddField("client_id" , ClientID , "String", Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret , "String", Parameters);
    OPI_Tools.AddField("code" , Code , "String", Parameters);  
    
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
    
    Parameters = New Structure;
    OPI_Tools.AddField("grant_type" , "refresh_token" , "String", Parameters);
    OPI_Tools.AddField("client_id" , ClientID , "String", Parameters);
    OPI_Tools.AddField("client_secret", ClientSecret , "String", Parameters);
    OPI_Tools.AddField("refresh_token", Refresh , "String", Parameters);  
    
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
// Visibility - String - Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group - vision
// Files - String - Data inложенandй, где toлюч > name file, value > path to file andдand дinоandчные Data - files
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
    
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.add");
    OPI_Tools.AddField("POST_MESSAGE", Text , "String", Parameters);
    OPI_Tools.AddField("POST_TITLE" , Title , "String", Parameters);
    OPI_Tools.AddField("DEST" , Visibility , "Array", Parameters);
    OPI_Tools.AddField("IMPORTANT" , Important , "String", Parameters);
    
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
// Visibility - String - Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group - vision
// Files - String - Data inложенandй, где toлюч > name file, value > path to file andдand дinоandчные Data - files
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
        
    Parameters = NormalizeAuth(URL, Token, "log.blogpost.update");
    OPI_Tools.AddField("POST_MESSAGE", Text , "String", Parameters);
    OPI_Tools.AddField("POST_TITLE" , Title , "String", Parameters);
    OPI_Tools.AddField("DEST" , Visibility , "Array", Parameters);
    OPI_Tools.AddField("POST_ID" , PostID , "String", Parameters);
    
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

// Create comment
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
Function CrateComment(Val URL, Val PostID, Val Text, Val Token = "") Export
    
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
// Visibility - String - Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group - vision
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
// FieldsStructure - Structure of Key-Value - Task fields structure - fields
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

// Get comments list for a task
// Get user comments list for a task
// 
// Parameters:
// URL - String - URL of webhook or a Bitrix24 domain, when token used - url
// TaskID - Number, String - Task ID - task
// Filter - Structure of Key-Value - Comments filter structure (see GetCommentsFilterStructure) - filter
// Token - String - Access token, when not-webhook method used - token
// 
// Returns:
// Map Of KeyAndValue - serialized JSON of answer from Bitrix24 API
Function GetTaskCommentsList(Val URL, Val TaskID, Val Filter = "", Val Token = "") Export

    Parameters = NormalizeAuth(URL, Token, "tasks.task.delegate");
    OPI_Tools.AddField("TASKID", TaskID, "String" , Parameters);
    OPI_Tools.AddField("FILTER", Filter , "Collection", Parameters);
    
    Response = OPI_Tools.Post(URL, Parameters);
    
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

// Get structure of comments filter
// Return filter structure for GetTaskCommentsList
// 
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//  
// Returns:
// Structure of Key-Value - Fields structure 
Function GetCommentsFilterStructure(Val Clear = False) Export
	
	// More
	// https://dev.1c-bitrix.ru/rest_help/tasks/task/commentitem/getlist.php
	
	OPI_TypeConversion.GetBoolean(Clear);
	
	FilterStructure = New Structure;
	FilterStructure.Insert("ID" , "<comment identifier>");
	FilterStructure.Insert("AUTHOR_ID " , "<comment author identifier>");
	FilterStructure.Insert("AUTHOR_NAME ", "<author's name>");
	FilterStructure.Insert("POST_DATE " , "<comment publication date>");
	
	If Clear Then
    	For Each Filter In FilterStructure Do
    		Filter.Value = "";
    	EndDo;
	EndIf;
	    
    //@skip-check constructor-function-return-section
	Return FilterStructure;
	
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

#EndRegion

#EndRegion

#Region Internal

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
