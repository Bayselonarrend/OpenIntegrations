// OneScript: ./OInt/api/dropbox/Modules/OPI_Dropbox.os
// Lib: Dropbox
// CLI: dropbox
// Keywords: dropbox

// DocsCategory: Folder
// DocsNameRU: Dropbox
// DocsNameEN: Dropbox

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

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

// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// #Use "../../../tools/main"
// #Use "../../../tools/http"

#Region Public

#Region AccountAndAuthorization

// Get authorization link
// Generates an authorization link for browser transition
//
// Parameters:
// AppKey - String - Application key - appkey
//
// Returns:
// String - URL for browser transition
Function GetAuthorizationLink(Val AppKey) Export

    OPI_TypeConversion.GetLine(AppKey);
    Return "https://www.dropbox.com/oauth2/authorize?client_id="
        + AppKey
        + "&response_type=code&token_access_type=offline";

EndFunction

// Get token
// Gets token based on the code from the GetAuthorizationLink page
//
// Parameters:
// AppKey    - String - Application key                  - appkey
// AppSecret - String - Application secret               - appsecret
// Code      - String - Code from the authorization page - code
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetToken(Val AppKey, Val AppSecret, Val Code) Export

    URL = "https://api.dropbox.com/oauth2/token";

    Parameters = New Structure;
    OPI_Tools.AddField("code"      , Code                , "String", Parameters);
    OPI_Tools.AddField("grant_type", "authorization_code", "String", Parameters);

    Response = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetFormBody(Parameters)
        .AddBasicAuthorization(AppKey, AppSecret)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject(True, True);

    Return Response;

EndFunction

// Refresh token
// Gets a new token based on the refresh token
//
// Parameters:
// AppKey       - String - Application key    - appkey
// AppSecret    - String - Application secret - appsecret
// RefreshToken - String - Refresh token      - refresh
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function RefreshToken(Val AppKey, Val AppSecret, Val RefreshToken) Export

    String_ = "String";
    URL     = "https://api.dropbox.com/oauth2/token";

    Parameters = New Structure;
    OPI_Tools.AddField("refresh_token", RefreshToken    , String_, Parameters);
    OPI_Tools.AddField("grant_type"   , "refresh_token" , String_, Parameters);
    OPI_Tools.AddField("client_id"    , AppKey          , String_, Parameters);
    OPI_Tools.AddField("client_secret", AppSecret       , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, , False);

    Return Response;

EndFunction

// Get account information
// Gets account information
//
// Parameters:
// Token   - String - Token                                           - token
// Account - String - Account ID. Current token account if not filled - account
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetAccountInformation(Val Token, Val Account = "") Export

    If ValueIsFilled(Account) Then
        Result = GetAccount(Token, Account);
    Else
        Result = GetOwnAccount(Token);
    EndIf;

    Return Result;

EndFunction

// Get space usage data
// Gets information on the amount of used disk space
//
// Parameters:
// Token - String - Token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetSpaceUsageData(Val Token) Export

    URL     = "https://api.dropboxapi.com/2/users/get_space_usage";
    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody("null")
        .SetHeaders(Headers)
        .SetDataType("text/plain; charset=dropbox-cors-hack")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject(True, True);

    Return Response;

EndFunction

#EndRegion

#Region FileAndDirectoryManagement

// Get object information
// Gets information about a file or directory
//
// Parameters:
// Token    - String  - Token                                 - token
// Path     - String  - Path to the object                    - path
// Detailed - Boolean - Add information fields for mediafiles - detail
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetObjectInformation(Val Token, Val Path, Val Detailed = False) Export

    URL = "https://api.dropboxapi.com/2/files/get_metadata";

    Parameters = New Structure;
    OPI_Tools.AddField("path"              , Path    , "String" , Parameters);
    OPI_Tools.AddField("include_media_info", Detailed, "Boolean", Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get list of folder files
// Gets the list of the first files in the directory or continues getting the next ones when the cursor is specified
//
// Parameters:
// Token    - String  - Token                                                         - token
// Path     - String  - Path to the directory. Optional if the cursor is specified    - path
// Detailed - Boolean - Add information fields for mediafiles                         - detail
// Cursor   - String  - Cursor from the previous request to get the next set of files - cursor
//
// Returns:
// HTTPResponse - Get list of folder files
Function GetListOfFolderFiles(Val Token, Val Path = "", Val Detailed = False, Val Cursor = "") Export

    If Not ValueIsFilled(Cursor) Then

        URL = "https://api.dropboxapi.com/2/files/list_folder";

        Parameters = New Structure;
        OPI_Tools.AddField("path"              , Path     , "String" , Parameters);
        OPI_Tools.AddField("include_media_info", Detailed , "Boolean", Parameters);

    Else

        URL = "https://api.dropboxapi.com/2/files/list_folder/continue";

        Parameters = New Structure;
        OPI_Tools.AddField("cursor", Cursor, "String", Parameters);

    EndIf;

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get preview
// Gets PDF or HTML preview of the object (for documents only)
//
// Parameters:
// Token - String - Token              - token
// Path  - String - Path to the object - path
//
// Returns:
// BinaryData - document preview
Function GetPreview(Val Token, Val Path) Export

    URL      = "https://content.dropboxapi.com/2/files/get_preview";
    Response = ProcessObject(Token, URL, Path, True);

    Return Response;

EndFunction

// Upload file
// Uploads a file to the cloud drive
//
// Parameters:
// Token     - String             - Token                                    - token
// File      - String, BinaryData - Data file for upload                     - file
// Path      - String             - Save path on Dropbox                     - path
// Overwrite - Boolean            - Overwrite file in case of path conflicts - overwrite
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function UploadFile(Val Token, Val File, Val Path, Val Overwrite = False) Export

    OPI_TypeConversion.GetBinaryData(File);
    OPI_TypeConversion.GetBoolean(Overwrite);
    OPI_TypeConversion.GetLine(Path);

    Mode   = ?(Overwrite, "overwrite", "add");
    Size   = File.Size();
    Border = 100000000;

    If Size > Border Then
        Response = UploadLargeFile(Token, File, Path, Mode);
    Else
        Response = UploadSmallFile(Token, File, Path, Mode);
    EndIf;

    Return Response;

EndFunction

// Upload file by URL
// Uploads a file to the cloud drive by fetching it from the specified URL
//
// Parameters:
// Token   - String - Token                  - token
// FileURL - String - URL source of the file - url
// Path    - String - Save path on Dropbox   - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function UploadFileByURL(Val Token, Val FileURL, Val Path) Export

    URL = "https://api.dropboxapi.com/2/files/save_url";

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path    , "String", Parameters);
    OPI_Tools.AddField("url" , FileURL , "String", Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get upload status by URL
// Gets the upload status of the file by URL
//
// Parameters:
// Token - String - Token                                          - token
// JobID - String - ID of async jsob from UploadFileByURL response - job
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetUploadStatusByURL(Val Token, Val JobID) Export

    URL = "https://api.dropboxapi.com/2/files/save_url/check_job_status";

    Parameters = New Structure;
    OPI_Tools.AddField("async_job_id", JobID, "String", Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Delete object
// Deletes an object from the cloud drive
//
// Parameters:
// Token         - String - Token                                             - token
// Path          - String - Path to the object to delete                      - path
// Irrecoverable - String - Delete object without the possibility of recovery - permanently
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function DeleteObject(Val Token, Val Path, Val Irrecoverable = False) Export

    OPI_TypeConversion.GetBoolean(Irrecoverable);

    If Irrecoverable Then
        URL = "https://api.dropboxapi.com/2/files/permanently_delete";
    Else
        URL = "https://api.dropboxapi.com/2/files/delete_v2";
    EndIf;

    Response = ProcessObject(Token, URL, Path);

    Return Response;

EndFunction

// Copy object
// Copies a file or directory to the selected path
//
// Parameters:
// Token  - String - Token                          - token
// From   - String - Path to the original object    - from
// Target - String - Target path for the new object - to
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function CopyObject(Val Token, Val From, Val Target) Export

    URL = "https://api.dropboxapi.com/2/files/copy_v2";

    Parameters = New Structure;
    OPI_Tools.AddField("from_path", From   , "String", Parameters);
    OPI_Tools.AddField("to_path"  , Target , "String", Parameters);

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Move object
// Moves an object to the selected path
//
// Parameters:
// Token  - String - Token                          - token
// From   - String - Path to the original object    - from
// Target - String - Target path for the new object - to
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function MoveObject(Val Token, Val From, Val Target) Export

    URL = "https://api.dropboxapi.com/2/files/move_v2";

    Parameters = New Structure;
    OPI_Tools.AddField("from_path", From   , "String", Parameters);
    OPI_Tools.AddField("to_path"  , Target , "String", Parameters);

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create folder
// Creates an empty directory at the selected path
//
// Parameters:
// Token - String - Token                                  - token
// Path  - String - Target path for creating the directory - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function CreateFolder(Val Token, Val Path) Export

    URL      = "https://api.dropboxapi.com/2/files/create_folder_v2";
    Response = ProcessObject(Token, URL, Path);

    Return Response;

EndFunction

// Download file
// Downloads a file by the specified path or ID
//
// Parameters:
// Token - String - Token                  - token
// Path  - String - Path or ID of the file - path
//
// Returns:
// BinaryData - binary data of the file
Function DownloadFile(Val Token, Val Path) Export

    URL      = "https://content.dropboxapi.com/2/files/download";
    Response = ProcessObject(Token, URL, Path, True);

    Return Response;

EndFunction

// Download folder
// Downloads a zip archive with the contents of the specified directory
//
// Parameters:
// Token - String - Token                       - token
// Path  - String - Path or ID of the directory - path
//
// Returns:
// BinaryData - binary data of the zip archive with the contents of the directory
Function DownloadFolder(Val Token, Val Path) Export

    URL      = "https://content.dropboxapi.com/2/files/download_zip";
    Response = ProcessObject(Token, URL, Path, True);

    Return Response;

EndFunction

// Get list of object versions
// Gets the list of versions (revisions) of the object
//
// Parameters:
// Token - String         - Token                                                  - token
// Path  - String         - Path to the object                                     - path
// Count - String, Number - Number of the latest versions of the object to display - amount
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetObjectVersionList(Val Token, Val Path, Val Count = 10) Export

    URL = "https://api.dropboxapi.com/2/files/list_revisions";

    Parameters = New Structure;
    OPI_Tools.AddField("path" , Path , "String" , Parameters);
    OPI_Tools.AddField("limit", Count, "Number" , Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Restore object to version
// Restores object state to required version (revision)
//
// Parameters:
// Token   - String - Token                                        - token
// Path    - String - Path to the object                           - path
// Version - String - ID of the version (revision) for restoration - rev
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function RestoreObjectToVersion(Val Token, Val Path, Val Version) Export

    URL = "https://api.dropboxapi.com/2/files/restore";

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path   , "String", Parameters);
    OPI_Tools.AddField("rev" , Version, "String", Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region TagsManagement

// Get list of tags
// Gets the list of tags of the selected files
//
// Parameters:
// Token - String                  - Token                             - token
// Paths - String, Array of String - Path or set of paths to the files - paths
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetTagList(Val Token, Val Paths) Export

    URL = "https://api.dropboxapi.com/2/files/tags/get";

    Parameters = New Structure;
    OPI_Tools.AddField("paths", Paths, "Array", Parameters);

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Add tag
// Add new tag to file or folder
//
// Parameters:
// Token - String - Token                                                    - token
// Path  - String - Path to the object for which the tag needs to be created - path
// Tag   - String - Tag text                                                 - tag
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function AddTag(Val Token, Val Path, Val Tag) Export

    Return ProcessTag(Token, Path, Tag);

EndFunction

// Delete tag
// Deletes the text tag of a file or directory
//
// Parameters:
// Token - String - Token                                            - token
// Path  - String - Path to the object whose tag needs to be deleted - path
// Tag   - String - Tag text                                         - tag
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function DeleteTag(Val Token, Val Path, Val Tag) Export

    Return ProcessTag(Token, Path, Tag, True);

EndFunction

#EndRegion

#Region SharedAccessSettings

// Publish folder
// Sets the directory to public access mode
//
// Parameters:
// Token - String - Token                        - token
// Path  - String - Path to the target directory - path
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function PublishFolder(Val Token, Val Path) Export

    URL      = "https://api.dropboxapi.com/2/sharing/share_folder";
    Response = ProcessObject(Token, URL, Path);

    Return Response;

EndFunction

// Unpublish folder
// Cancels the public access mode for the directory
//
// Parameters:
// Token    - String - Token                                       - token
// FolderID - String - ID of the public catalog (shared folder ID) - folder
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function CancelFolderPublication(Val Token, Val FolderID) Export

    URL = "https://api.dropboxapi.com/2/sharing/unshare_folder";

    Parameters = New Structure;
    OPI_Tools.AddField("shared_folder_id", FolderID, "String", Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Add users to file
// Defines access to the file for third-party users
//
// Parameters:
// Token          - String                  - Token                                        - token
// FileID         - String                  - ID of the file to be accessed                - fileid
// EmailAddresses - String, Array of String - List of email addresses of users being added - emails
// ViewOnly       - Boolean                 - Prohibits file editing for the external user - readonly
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function AddUsersToFile(Val Token, Val FileID, Val EmailAddresses, Val ViewOnly = True) Export

    String_ = "String";

    OPI_TypeConversion.GetArray(EmailAddresses);
    OPI_TypeConversion.GetLine(FileID);
    OPI_TypeConversion.GetBoolean(ViewOnly);

    If Not StrStartsWith(FileID, "id:") Then
        FileID = "id:" + FileID;
    EndIf;

    URL = "https://api.dropboxapi.com/2/sharing/add_file_member";

    ArrayOfUsers = New Array;

    For Each Address In EmailAddresses Do

        UserData = New Map;
        OPI_Tools.AddField(".tag" , "email" , String_, UserData);
        OPI_Tools.AddField("email", Address , String_, UserData);

        ArrayOfUsers.Add(UserData);

    EndDo;

    Parameters = New Structure;
    OPI_Tools.AddField("file"   , FileID      , String_ , Parameters);
    OPI_Tools.AddField("members", ArrayOfUsers, "Array" , Parameters);

    Mode = ?(ViewOnly, "viewer", "editor");

    OPI_Tools.AddField("access_level", Mode , String_, Parameters);

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Add users to folder
// Grants external users access to the directory
//
// Parameters:
// Token          - String                  - Token                                        - token
// FolderID       - String                  - ID of the public catalog (shared folder ID)  - folder
// EmailAddresses - String, Array of String - List of email addresses of users being added - emails
// ViewOnly       - Boolean                 - Prohibits file editing for the external user - readonly
//
// Returns:
// Undefined - empty response
Function AddUsersToFolder(Val Token, Val FolderID, Val EmailAddresses, Val ViewOnly = True) Export

    String_ = "String";

    OPI_TypeConversion.GetArray(EmailAddresses);
    OPI_TypeConversion.GetBoolean(ViewOnly);
    Mode = ?(ViewOnly, "viewer", "editor");

    URL = "https://api.dropboxapi.com/2/sharing/add_folder_member";

    ArrayOfUsers = New Array;

    For Each Address In EmailAddresses Do

        UserData = New Map;
        OPI_Tools.AddField(".tag" , "email" , String_, UserData);
        OPI_Tools.AddField("email", Address , String_, UserData);

        UserStructure = New Structure("member,access_level", UserData, Mode);

        ArrayOfUsers.Add(UserStructure);

    EndDo;

    Parameters = New Structure;
    OPI_Tools.AddField("shared_folder_id", FolderID     , String_ , Parameters);
    OPI_Tools.AddField("members"         , ArrayOfUsers , "Array" , Parameters);

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get asynchronous change status
// Get async job status for access changes
//
// Parameters:
// Token - String - Token             - token
// JobID - String - AsynchronousJobID - job
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function GetAsynchronousChangeStatus(Val Token, Val JobID) Export

    URL = "https://api.dropboxapi.com/2/sharing/check_job_status";

    Parameters = New Structure;
    OPI_Tools.AddField("async_job_id", JobID, "String", Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Unpublish file
// Prohibits access to the file for external users
//
// Parameters:
// Token  - String - Token                         - token
// FileID - String - ID of the file to be accessed - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Dropbox
Function CancelFilePublication(Val Token, Val FileID) Export

    OPI_TypeConversion.GetLine(FileID);

    If Not StrStartsWith(FileID, "id:") Then
        FileID = "id:" + FileID;
    EndIf;

    URL = "https://api.dropboxapi.com/2/sharing/unshare_file";

    Parameters = New Structure;
    OPI_Tools.AddField("file", FileID, "String", Parameters);

    Headers  = GetRequestHeaders(Token);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function PostBinary(Val URL, Val Data, Val Headers) Export

    OPI_TypeConversion.GetBinaryData(Data);

    HttpClient = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetDataType("application/octet-stream")
        .SetHeaders(Headers);

    If Data.Size() > 0 Then
        HttpClient.SetBinaryBody(Data);
    EndIf;

    Return HttpClient.ProcessRequest("POST").ReturnResponseAsJSONObject(True, True);

EndFunction

Function ProcessObject(Val Token, Val URL, Val Path, Val InHeaders = False)

    Parameters = New Structure;
    OPI_Tools.AddField("path", Path, "String", Parameters);

    If InHeaders Then
        Headers  = GetRequestHeaders(Token, Parameters);
        Response = PostBinary(URL, GetBinaryDataFromString(""), Headers);
    Else
        Headers  = GetRequestHeaders(Token);
        Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);
    EndIf;

    Return Response;

EndFunction

Function ProcessTag(Val Token, Val Path, Val Tag, Val ThisIsDeletion = False)

    If ThisIsDeletion Then
        URL = "https://api.dropboxapi.com/2/files/tags/remove";
    Else
        URL = "https://api.dropboxapi.com/2/files/tags/add";
    EndIf;

    Parameters = New Structure;
    OPI_Tools.AddField("path"     , Path, "String", Parameters);
    OPI_Tools.AddField("tag_text" , Tag , "String", Parameters);

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

Function GetRequestHeaders(Val Token, Val Parameters = "")

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization" , "Bearer " + Token);

    If ValueIsFilled(Parameters) Then

        JSON = OPI_Tools.JSONString(Parameters, "None");
        JSON = StrReplace(JSON, Chars.CR + Chars.LF, "");

        Headers.Insert("Dropbox-API-Arg", JSON);

    EndIf;

    Return Headers;

EndFunction

Function UploadLargeFile(Val Token, Val File, Val Path, Val Mode)

    URL = "https://content.dropboxapi.com/2/files/upload_session/append_v2";

    ChunkSize       = 100000000;
    CurrentPosition = 0;
    BytesRead       = 0;
    TotalSize       = File.Size();
    Session         = OpenSession(Token);

    If OPI_Tools.ThisIsCollection(Session) Then
        Return Session;
    EndIf;

    While BytesRead < TotalSize Do

        Indent = CurrentPosition;
        Cursor = New Structure("offset,session_id", Indent, Session);

        Parameters = New Structure("cursor", Cursor);
        Headers    = GetRequestHeaders(Token, Parameters);

        DataReader   = New DataReader(File);
        BytesRead    = DataReader.Skip(CurrentPosition);
        Result       = DataReader.Read(ChunkSize);
        CurrentData  = Result.GetBinaryData();
        CurrentSize  = CurrentData.Size();
        NextPosition = CurrentPosition + CurrentSize;

        If CurrentSize = 0 Then
            Break;
        EndIf;

        Response = PostBinary(URL, CurrentData, Headers);

        CurrentPosition = NextPosition;

        KBytes = 1024;
        MByte  = KBytes * KBytes;
        OPI_Tools.ProgressInformation(CurrentPosition, TotalSize, "MB", MByte);

        // !OInt RunGarbageCollection();
        // !OInt FreeObject(CurrentData);

    EndDo;

    Response = CloseSession(Token, Path, Mode, TotalSize, Session);

    Return Response;

EndFunction

Function UploadSmallFile(Val Token, Val File, Val Path, Val Mode)

    Boolean_ = "Boolean";
    String_  = "String";
    URL      = "https://content.dropboxapi.com/2/files/upload";

    Parameters = New Structure;

    OPI_Tools.AddField("autorename"     , False , Boolean_, Parameters);
    OPI_Tools.AddField("mode"           , Mode  , String_ , Parameters);
    OPI_Tools.AddField("mute"           , False , Boolean_, Parameters);
    OPI_Tools.AddField("path"           , Path  , String_ , Parameters);
    OPI_Tools.AddField("strict_conflict", False , Boolean_, Parameters);

    Headers = GetRequestHeaders(Token, Parameters);

    Response = PostBinary(URL, File, Headers);

    Return Response;

EndFunction

Function OpenSession(Val Token)

    SessionId = "session_id";
    URL       = "https://content.dropboxapi.com/2/files/upload_session/start";
    Headers   = GetRequestHeaders(Token);

    Response = PostBinary(URL, GetBinaryDataFromString(""), Headers);

    Session = Response[SessionId];

    If Session  = Undefined Then
        Session = Response;
    EndIf;

    Return Session;

EndFunction

Function CloseSession(Val Token, Val Path, Val Mode, Val TotalSize, Val Session)

    URL = "https://content.dropboxapi.com/2/files/upload_session/finish";

    Commit = New Structure();
    OPI_Tools.AddField("mode", Mode , "String", Commit);
    OPI_Tools.AddField("path", Path , "String", Commit);

    Cursor = New Structure("offset,session_id", TotalSize, Session);

    Parameters = New Structure("commit,cursor", Commit, Cursor);
    Headers    = GetRequestHeaders(Token, Parameters);

    Response = PostBinary(URL, GetBinaryDataFromString(""), Headers);

    Return Response;

EndFunction

Function GetAccount(Val Token, Val Account)

    URL = "https://api.dropboxapi.com/2/users/get_account";

    Parameters = New Structure;
    OPI_Tools.AddField("account_id", Account, "String", Parameters);

    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

Function GetOwnAccount(Val Token)

    URL     = "https://api.dropboxapi.com/2/users/get_current_account";
    Headers = GetRequestHeaders(Token);

    Response = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody("null")
        .SetHeaders(Headers)
        .SetDataType("text/plain; charset=dropbox-cors-hack")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject(True, True);

    Return Response;

EndFunction

#EndRegion
