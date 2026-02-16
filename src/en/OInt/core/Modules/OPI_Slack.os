// OneScript: ./OInt/core/Modules/OPI_Slack.os
// Lib: Slack
// CLI: slack
// Keywords: slack

// DocsCategory: Messenger
// DocsNameRU: Slack
// DocsNameEN: Slack

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
// BSLLS:Typo-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Use "../../tools/main"
#Use "../../tools/http"

#Region Public

#Region ManagementAndSettings

// Get bot information
// Gets basic information about the bot
//
// Parameters:
// Token - String - Bot token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetBotInformation(Val Token) Export

    URL     = "https://slack.com/api/auth.test";
    Headers = GetAuthorizationHeader(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Get workspace list
// Gets a list of workspaces where the bot is connected
//
// Parameters:
// Token  - String - Bot token                                                   - token
// Cursor - String - Pointer from the previous request, if the result rows > 100 - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetWorkspaceList(Val Token, Val Cursor = "") Export

    URL      = "https://slack.com/api/auth.teams.list";
    Response = GeneralDataRetrieval(Token, URL, Cursor);

    Return Response;

EndFunction

// Get user list
// Gets a list of users in the workspace
//
// Parameters:
// Token  - String - Bot token                                                   - token
// Cursor - String - Pointer from the previous request, if the result rows > 100 - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetUserList(Val Token, Val Cursor = "") Export

    URL      = "https://slack.com/api/users.list";
    Response = GeneralDataRetrieval(Token, URL, Cursor);

    Return Response;

EndFunction

#EndRegion

#Region MessageManagement

// Send message
// Sends a message at a selected hour
//
// Parameters:
// Token       - String             - Bot token                        - token
// Channel     - String             - Channel ID                       - channel
// Text        - String             - Message text                     - text
// SendingDate - Date               - Sending date for delayed message - date
// Blocks      - Array of Structure - Array of block descriptions      - blocks
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function SendMessage(Val Token, Val Channel, Val Text = "", Val SendingDate = "", Val Blocks = "") Export

    String_ = "String";
    HasDate = ValueIsFilled(SendingDate);
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel, String_ , Parameters);
    OPI_Tools.AddField("text"   , Text   , String_ , Parameters);
    OPI_Tools.AddField("blocks" , Blocks , "Array" , Parameters);

    If HasDate Then

        URL = "https://slack.com/api/chat.scheduleMessage";
        OPI_Tools.AddField("post_at", SendingDate, "Date", Parameters);

    Else

        URL = "https://slack.com/api/chat.postMessage";

    EndIf;

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Send ephemeral message
// Sends a message that arrives in the channel but is visible
// only to a specific user
//
// Parameters:
// Token   - String             - Bot token                   - token
// Channel - String             - Channel ID                  - channel
// Text    - String             - Message text                - text
// User    - String             - User ID                     - user
// Blocks  - Array of Structure - Array of block descriptions - blocks
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function SendEphemeralMessage(Val Token
    , Val Channel
    , Val Text = ""
    , Val User = ""
    , Val Blocks = "") Export

    String_ = "String";

    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , String_ , Parameters);
    OPI_Tools.AddField("text"   , Text    , String_ , Parameters);
    OPI_Tools.AddField("user"   , User    , String_ , Parameters);
    OPI_Tools.AddField("blocks" , Blocks  , "Array" , Parameters);

    URL = "https://slack.com/api/chat.postEphemeral";

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Edit message
// Edits the content of an existing message
//
// Parameters:
// Token      - String             - Bot token                   - token
// Channel    - String             - Channel ID                  - channel
// Timestamp  - String             - Message timestamp           - stamp
// Text       - String             - New message text            - text
// BlockArray - Array of Structure - Array of block descriptions - blocks
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function EditMessage(Val Token, Val Channel, Val Timestamp, Val Text = "", Val BlockArray = "") Export

    String_ = "String";
    URL     = "https://slack.com/api/chat.update";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel   , String_     , Parameters);
    OPI_Tools.AddField("text"   , Text      , String_     , Parameters);
    OPI_Tools.AddField("ts"     , Timestamp , String_     , Parameters);
    OPI_Tools.AddField("blocks" , BlockArray, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Delete message
// Deletes a channel message by timestamp
//
// Parameters:
// Token     - String  - Bot token                               - token
// Channel   - String  - Channel ID                              - channel
// Timestamp - String  - Timestamp or message ID                 - stamp
// IsDelayed - Boolean - Indicator of deleting a delayed message - issheduled
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function DeleteMessage(Val Token, Val Channel, Val Timestamp, Val IsDelayed = False) Export

    OPI_TypeConversion.GetBoolean(IsDelayed);

    Headers = GetAuthorizationHeader(Token);

    If IsDelayed Then
        URL            = "https://slack.com/api/chat.deleteScheduledMessage";
        TimestampField = "scheduled_message_id";
    Else
        URL            = "https://slack.com/api/chat.delete";
        TimestampField = "ts";
    EndIf;

    Parameters = New Structure;
    OPI_Tools.AddField("channel"     , Channel  , "String", Parameters);
    OPI_Tools.AddField(TimestampField, Timestamp, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get list of delayed messages
// Gets a list of delayed channel messages
//
// Parameters:
// Token   - String - Bot token                                                   - token
// Channel - String - Channel ID                                                  - channel
// Cursor  - String - Pointer from the previous request, if the result rows > 100 - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetDelayedMessageList(Val Token, Val Channel, Val Cursor = "") Export

    URL     = "https://slack.com/api/chat.scheduledMessages.list";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , "String", Parameters);
    OPI_Tools.AddField("cursor" , Cursor  , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get message link
// Gets a permanent URL to the channel message
//
// Parameters:
// Token     - String - Bot token               - token
// Channel   - String - Channel ID              - channel
// Timestamp - String - Timestamp or message ID - stamp
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetMessageLink(Val Token, Val Channel, Val Timestamp) Export

    URL     = "https://slack.com/api/chat.getPermalink";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel"   , Channel  , "String", Parameters);
    OPI_Tools.AddField("message_ts", Timestamp, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get list of message replies
// Gets an array of messages that are replies to the specified
//
// Parameters:
// Token     - String - Bot token                                                   - token
// Channel   - String - Channel ID                                                  - channel
// Timestamp - String - Timestamp or message ID                                     - stamp
// Cursor    - String - Pointer from the previous request, if the result rows > 100 - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetMessageReplyList(Val Token, Val Channel, Val Timestamp, Val Cursor = "") Export

    String_ = "String";
    URL     = "https://slack.com/api/conversations.replies";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel  , String_, Parameters);
    OPI_Tools.AddField("cursor" , Cursor   , String_, Parameters);
    OPI_Tools.AddField("ts"     , Timestamp, String_, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region ChannelManagement

// Get channel list
// Gets a list of available channels
//
// Parameters:
// Token           - String  - Bot token                                                   - token
// ExcludeArchived - Boolean - Indicator of excluding archived channels                    - notarchived
// Cursor          - String  - Pointer from the previous request, if the result rows > 100 - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetChannelList(Val Token, Val ExcludeArchived = False, Val Cursor = "") Export

    URL     = "https://slack.com/api/conversations.list";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("exclude_archived", ExcludeArchived, "Boolean", Parameters);
    OPI_Tools.AddField("cursor"          , Cursor         , "String" , Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get channel user list
// Gets a list of users in the specified channel
//
// Parameters:
// Token   - String - Bot token                                                   - token
// Channel - String - Channel ID                                                  - channel
// Cursor  - String - Pointer from the previous request, if the result rows > 100 - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetChannelUserList(Val Token, Val Channel, Val Cursor = "") Export

    URL     = "https://slack.com/api/conversations.members";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , "String", Parameters);
    OPI_Tools.AddField("cursor" , Cursor  , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create channel
// Creates a new channel
//
// Parameters:
// Token   - String  - Bot token                 - token
// Name    - String  - Channel name              - title
// Private - Boolean - Create channel as private - private
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function CreateChannel(Val Token, Val Name, Val Private = False) Export

    URL     = "https://slack.com/api/conversations.create";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("name"      , Name   , "String" , Parameters);
    OPI_Tools.AddField("is_private", Private, "Boolean", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Archive channel
// Archives an active channel
//
// Parameters:
// Token   - String - Bot token  - token
// Channel - String - Channel ID - channel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function ArchiveChannel(Val Token, Val Channel) Export

    URL      = "https://slack.com/api/conversations.archive";
    Response = DialogManagement(Token, Channel, URL);
    Return Response;

EndFunction

// Get channel
// Gets information about the channel
//
// Parameters:
// Token   - String - Bot token  - token
// Channel - String - Channel ID - channel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetChannel(Val Token, Val Channel) Export

    URL      = "https://slack.com/api/conversations.info";
    Response = DialogManagement(Token, Channel, URL, "GET");
    Return Response;

EndFunction

// Get channel history
// Gets information about channel events
//
// Parameters:
// Token   - String - Bot token  - token
// Channel - String - Channel ID - channel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetChannelHistory(Val Token, Val Channel) Export

    URL      = "https://slack.com/api/conversations.history";
    Response = DialogManagement(Token, Channel, URL, "GET");
    Return Response;

EndFunction

// Invite users to channel
// Adds specified users to the channel
//
// Parameters:
// Token        - String          - Bot token     - token
// Channel      - String          - Channel ID    - channel
// ArrayOfUsers - Array Of String - User ID Array - users
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function InviteUsersToChannel(Val Token, Val Channel, Val ArrayOfUsers) Export

    URL     = "https://slack.com/api/conversations.invite";
    Headers = GetAuthorizationHeader(Token);

    OPI_TypeConversion.GetCollection(ArrayOfUsers);
    ArrayOfUsers = StrConcat(ArrayOfUsers, ",");

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel     , "String", Parameters);
    OPI_Tools.AddField("users"  , ArrayOfUsers, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Kick user from channel
// Removes specified user from channel
//
// Parameters:
// Token   - String - Bot token  - token
// Channel - String - Channel ID - channel
// User    - String - User ID    - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function KickUserFromChannel(Val Token, Val Channel, Val User) Export

    URL     = "https://slack.com/api/conversations.kick";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , "String", Parameters);
    OPI_Tools.AddField("user"   , User    , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Join channel
// Adds the current bot to the channel
//
// Parameters:
// Token   - String - Bot token  - token
// Channel - String - Channel ID - channel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function JoinChannel(Val Token, Val Channel) Export

    URL      = "https://slack.com/api/conversations.join";
    Response = DialogManagement(Token, Channel, URL);
    Return Response;

EndFunction

// Leave channel
// Removes the current bot from the channel
//
// Parameters:
// Token   - String - Bot token  - token
// Channel - String - Channel ID - channel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function LeaveChannel(Val Token, Val Channel) Export

    URL      = "https://slack.com/api/conversations.leave";
    Response = DialogManagement(Token, Channel, URL);
    Return Response;

EndFunction

// Set channel topic
// Sets the channel topic
//
// Parameters:
// Token   - String - Bot token     - token
// Channel - String - Channel ID    - channel
// Topic   - String - Channel topic - theme
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function SetChannelTopic(Val Token, Val Channel, Val Topic) Export

    URL     = "https://slack.com/api/conversations.setTopic";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , "String", Parameters);
    OPI_Tools.AddField("topic"  , Topic   , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Set channel purpose
// Sets the channel purpose (description)
//
// Parameters:
// Token   - String - Bot token       - token
// Channel - String - Channel ID      - channel
// Purpose - String - Channel purpose - purpose
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function SetChannelGoal(Val Token, Val Channel, Val Purpose) Export

    URL     = "https://slack.com/api/conversations.setPurpose";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , "String", Parameters);
    OPI_Tools.AddField("purpose", Purpose , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Rename channel
// Changes the name of the channel
//
// Parameters:
// Token   - String - Bot token        - token
// Channel - String - Channel ID       - channel
// Name    - String - New channel name - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function RenameChannel(Val Token, Val Channel, Val Name) Export

    URL     = "https://slack.com/api/conversations.rename";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , "String", Parameters);
    OPI_Tools.AddField("name"   , Name    , "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region DialogManagement

// Open dialog
// Opens a new dialog with one or more users
//
// Parameters:
// Token        - String          - Bot token     - token
// ArrayOfUsers - Array of String - User ID Array - users
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function OpenDialog(Val Token, Val ArrayOfUsers) Export

    URL     = "https://slack.com/api/conversations.open";
    Headers = GetAuthorizationHeader(Token);

    OPI_TypeConversion.GetCollection(ArrayOfUsers);
    ArrayOfUsers = StrConcat(ArrayOfUsers, ",");

    Parameters = New Structure;
    OPI_Tools.AddField("users", ArrayOfUsers, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Close dialog
// Closes an existing dialog
//
// Parameters:
// Token  - String - Bot token - token
// Dialog - String - Dialog ID - conv
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function CloseDialog(Val Token, Val Dialog) Export

    URL      = "https://slack.com/api/conversations.close";
    Response = DialogManagement(Token, Dialog, URL);
    Return Response;

EndFunction

#EndRegion

#Region FileManagement

// Get list of files
// Gets a list of files of the bot or channel
//
// Parameters:
// Token      - String         - Bot token             - token
// Channel    - String         - Channel for selection - channel
// PageNumber - Number, String - Page number           - page
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetFilesList(Val Token, Val Channel = "", Val PageNumber = 1) Export

    URL     = "https://slack.com/api/files.list";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel   , "String", Parameters);
    OPI_Tools.AddField("page"   , PageNumber, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Upload file
// Uploads a file to Slack servers
//
// Parameters:
// Token    - String             - Bot token                - token
// File     - String, BinaryData - File for upload          - file
// FileName - String             - File name with extension - filename
// Title    - String             - File name in Slack       - title
// Channel  - String             - Channel ID               - channel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function UploadFile(Val Token, Val File, Val FileName, Val Title, Val Channel = "") Export

    OPI_TypeConversion.GetBinaryData(File);
    OPI_TypeConversion.GetLine(FileName);
    OPI_TypeConversion.GetLine(Title);

    String_    = "String";
    Upload_url = "upload_url";
    File_id    = "file_id";
    URL        = "https://slack.com/api/files.getUploadURLExternal";
    Headers    = GetAuthorizationHeader(Token);
    Size       = File.Size();

    Parameters = New Structure;
    OPI_Tools.AddField("filename", FileName, String_, Parameters);
    OPI_Tools.AddField("length"  , Size    , String_, Parameters);

    Response   = OPI_HTTPRequests.Get(URL, Parameters, Headers);
    URL        = Response[Upload_url];
    Identifier = Response[File_id];

    If Not ValueIsFilled(URL) Or Not ValueIsFilled(Identifier) Then
        Return Response;
    EndIf;

    Files = New Map;
    Files.Insert(FileName, File);

    Response  = OPI_HTTPRequests.PostMultipart(URL, , Files, , Headers);
    URL       = "https://slack.com/api/files.completeUploadExternal";
    SlackFile = New Structure("id, title", Identifier, Title);

    Parameters = New Structure;
    OPI_Tools.AddField("filename"  , FileName , String_ , Parameters);
    OPI_Tools.AddField("channel_id", Channel  , String_ , Parameters);
    OPI_Tools.AddField("files"     , SlackFile, "Array" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get file data
// Gets information about the file
//
// Parameters:
// Token  - String - Bot token       - token
// FileID - String - File identifier - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetFileData(Val Token, Val FileID) Export

    URL      = "https://slack.com/api/files.info";
    Response = FileManagement(Token, FileID, URL, "GET");

    Return Response;

EndFunction

// Delete file
// Deletes a file on Slack
//
// Parameters:
// Token  - String - Bot token       - token
// FileID - String - File identifier - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function DeleteFile(Val Token, Val FileID) Export

    URL      = "https://slack.com/api/files.delete";
    Response = FileManagement(Token, FileID, URL);

    Return Response;

EndFunction

// Make file public
// Creates a public URL for the file. Requires user token
//
// Parameters:
// Token  - String - User token      - token
// FileID - String - File identifier - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function MakeFilePublic(Val Token, Val FileID) Export

    URL      = "https://slack.com/api/files.sharedPublicURL";
    Response = FileManagement(Token, FileID, URL);

    Return Response;

EndFunction

// Make file private
// Removes the public URL from the file. Requires user token
//
// Parameters:
// Token  - String - User token      - token
// FileID - String - File identifier - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function MakeFilePrivate(Val Token, Val FileID) Export

    URL      = "https://slack.com/api/files.revokePublicURL";
    Response = FileManagement(Token, FileID, URL);

    Return Response;

EndFunction

#EndRegion

#Region ExternalFilesManagement

// Get list of external files
// Gets a list of external files of a user or channel
//
// Parameters:
// Token   - String - Bot token                                                   - token
// Channel - String - Channel for selection                                       - channel
// Cursor  - String - Pointer from the previous request, if the result rows > 100 - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetExternalFileList(Val Token, Val Channel = "", Val Cursor = "") Export

    URL     = "https://slack.com/api/files.remote.list";
    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel , "String", Parameters);
    OPI_Tools.AddField("cursor" , Cursor  , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get external file
// Gets information about the external file
//
// Parameters:
// Token  - String - Bot token       - token
// FileID - String - File identifier - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function GetExternalFile(Val Token, Val FileID) Export

    URL      = "https://slack.com/api/files.remote.info";
    Response = ExternalFileManagement(Token, FileID, URL);

    Return Response;

EndFunction

// Add external file
// Adds a new external file
//
// Parameters:
// Token - String - Bot token            - token
// URL   - String - URL to external file - url
// Title - String - File title for Slack - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function AddExternalFile(Val Token, Val URL, Val Title) Export

    String_    = "String";
    RequestURL = "https://slack.com/api/files.remote.add";
    Headers    = GetAuthorizationHeader(Token);
    UID        = String(New UUID());

    Parameters = New Structure;
    OPI_Tools.AddField("external_url", URL   , String_, Parameters);
    OPI_Tools.AddField("external_id" , UID   , String_, Parameters);
    OPI_Tools.AddField("title"       , Title , String_, Parameters);

    Response = OPI_HTTPRequests.Get(RequestURL, Parameters, Headers);

    Return Response;

EndFunction

// Send external file
// Sends an external file to a list of channels
//
// Parameters:
// Token        - String          - Bot token                     - token
// FileID       - String          - File identifier               - fileid
// ChannelArray - Array Of String - Array of channels for sending - channels
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function SendExternalFile(Val Token, Val FileID, Val ChannelArray) Export

    URL     = "https://slack.com/api/files.remote.share";
    Headers = GetAuthorizationHeader(Token);

    OPI_TypeConversion.GetCollection(ChannelArray);
    ChannelArray = StrConcat(ChannelArray, ",");

    Parameters = New Structure;
    OPI_Tools.AddField("file"    , FileID       , "String", Parameters);
    OPI_Tools.AddField("channels", ChannelArray , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Delete external file
// Deletes an external file from Slack
//
// Parameters:
// Token  - String - Bot token       - token
// FileID - String - File identifier - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Slack
Function DeleteExternalFile(Val Token, Val FileID) Export

    URL      = "https://slack.com/api/files.remote.remove";
    Response = ExternalFileManagement(Token, FileID, URL);

    Return Response;

EndFunction

#EndRegion

#Region BlockFormation

// Generate image block
// Generates a block with an image to add to the message block array
//
// Parameters:
// URL           - String - Image URL                   - picture
// AlternateText - String - Alternate text of the image - alt
//
// Returns:
// Map Of KeyAndValue - Image block
Function GenerateImageBlock(Val URL, Val AlternateText = "") Export

    String_ = "String";

    Block = New Map;
    OPI_Tools.AddField("type"     , "image"       , String_, Block);
    OPI_Tools.AddField("image_url", URL           , String_, Block);
    OPI_Tools.AddField("alt_text" , AlternateText , String_, Block);

    Return Block;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function GetAuthorizationHeader(Val Token)

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization", "Bearer " + Token);
    Return Headers;

EndFunction

Function DialogManagement(Val Token, Val Channel, Val URL, Val RequestType = "POST")

    Headers     = GetAuthorizationHeader(Token);
    RequestType = Upper(RequestType);

    Parameters = New Structure;
    OPI_Tools.AddField("channel", Channel, "String", Parameters);

    If RequestType = "POST" Then
        Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);
    Else
        Response   = OPI_HTTPRequests.Get(URL, Parameters, Headers);
    EndIf;

    Return Response;

EndFunction

Function FileManagement(Val Token, Val FileID, Val URL, Val RequestType = "POST")

    Headers     = GetAuthorizationHeader(Token);
    RequestType = Upper(RequestType);

    Parameters = New Structure;
    OPI_Tools.AddField("file", FileID , "String", Parameters);

    If RequestType = "POST" Then
        Response   = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);
    Else
        Response   = OPI_HTTPRequests.Get(URL, Parameters, Headers);
    EndIf;

    Return Response;

EndFunction

Function GeneralDataRetrieval(Val Token, Val URL, Val Cursor)

    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("cursor", Cursor, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

Function ExternalFileManagement(Val Token, Val FileID, Val URL)

    Headers = GetAuthorizationHeader(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("file", FileID , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion
#Region Alternate

Function ПолучитьИнформациюОБоте(Val Токен) Export
    Return GetBotInformation(Токен);
EndFunction

Function ПолучитьСписокРабочихОбластей(Val Токен, Val Курсор = "") Export
    Return GetWorkspaceList(Токен, Курсор);
EndFunction

Function ПолучитьСписокПользователей(Val Токен, Val Курсор = "") Export
    Return GetUserList(Токен, Курсор);
EndFunction

Function ОтправитьСообщение(Val Токен, Val Канал, Val Текст = "", Val ДатаОтправки = "", Val Блоки = "") Export
    Return SendMessage(Токен, Канал, Текст, ДатаОтправки, Блоки);
EndFunction

Function ОтправитьЭфемерноеСообщение(Val Токен, Val Канал, Val Текст = "", Val Пользователь = "", Val Блоки = "") Export
    Return SendEphemeralMessage(Токен, Канал, Текст, Пользователь, Блоки);
EndFunction

Function ИзменитьСообщение(Val Токен, Val Канал, Val Отметка, Val Текст = "", Val МассивБлоков = "") Export
    Return EditMessage(Токен, Канал, Отметка, Текст, МассивБлоков);
EndFunction

Function УдалитьСообщение(Val Токен, Val Канал, Val Отметка, Val ЭтоОтложенное = False) Export
    Return DeleteMessage(Токен, Канал, Отметка, ЭтоОтложенное);
EndFunction

Function ПолучитьСписокОтложенныхСообщений(Val Токен, Val Канал, Val Курсор = "") Export
    Return GetDelayedMessageList(Токен, Канал, Курсор);
EndFunction

Function ПолучитьСсылкуНаСообщение(Val Токен, Val Канал, Val Отметка) Export
    Return GetMessageLink(Токен, Канал, Отметка);
EndFunction

Function ПолучитьСписокОтветовНаСообщение(Val Токен, Val Канал, Val Отметка, Val Курсор = "") Export
    Return GetMessageReplyList(Токен, Канал, Отметка, Курсор);
EndFunction

Function ПолучитьСписокКаналов(Val Токен, Val ИсключатьАрхивированные = False, Val Курсор = "") Export
    Return GetChannelList(Токен, ИсключатьАрхивированные, Курсор);
EndFunction

Function ПолучитьСписокПользователейКанала(Val Токен, Val Канал, Val Курсор = "") Export
    Return GetChannelUserList(Токен, Канал, Курсор);
EndFunction

Function СоздатьКанал(Val Токен, Val Название, Val Приватный = False) Export
    Return CreateChannel(Токен, Название, Приватный);
EndFunction

Function АрхивироватьКанал(Val Токен, Val Канал) Export
    Return ArchiveChannel(Токен, Канал);
EndFunction

Function ПолучитьКанал(Val Токен, Val Канал) Export
    Return GetChannel(Токен, Канал);
EndFunction

Function ПолучитьИсториюКанала(Val Токен, Val Канал) Export
    Return GetChannelHistory(Токен, Канал);
EndFunction

Function ПригласитьПользователейВКанал(Val Токен, Val Канал, Val МассивПользователей) Export
    Return InviteUsersToChannel(Токен, Канал, МассивПользователей);
EndFunction

Function ВыгнатьПользователяИзКанала(Val Токен, Val Канал, Val Пользователь) Export
    Return KickUserFromChannel(Токен, Канал, Пользователь);
EndFunction

Function ВступитьВКанал(Val Токен, Val Канал) Export
    Return JoinChannel(Токен, Канал);
EndFunction

Function ПокинутьКанал(Val Токен, Val Канал) Export
    Return LeaveChannel(Токен, Канал);
EndFunction

Function УстановитьТемуКанала(Val Токен, Val Канал, Val Тема) Export
    Return SetChannelTopic(Токен, Канал, Тема);
EndFunction

Function УстановитьЦельКанала(Val Токен, Val Канал, Val Цель) Export
    Return SetChannelGoal(Токен, Канал, Цель);
EndFunction

Function ПереименоватьКанал(Val Токен, Val Канал, Val Название) Export
    Return RenameChannel(Токен, Канал, Название);
EndFunction

Function ОткрытьДиалог(Val Токен, Val МассивПользователей) Export
    Return OpenDialog(Токен, МассивПользователей);
EndFunction

Function ЗакрытьДиалог(Val Токен, Val Диалог) Export
    Return CloseDialog(Токен, Диалог);
EndFunction

Function ПолучитьСписокФайлов(Val Токен, Val Канал = "", Val НомерСтраницы = 1) Export
    Return GetFilesList(Токен, Канал, НомерСтраницы);
EndFunction

Function ЗагрузитьФайл(Val Токен, Val Файл, Val ИмяФайла, Val Заголовок, Val Канал = "") Export
    Return UploadFile(Токен, Файл, ИмяФайла, Заголовок, Канал);
EndFunction

Function ПолучитьДанныеФайла(Val Токен, Val ИдентификаторФайла) Export
    Return GetFileData(Токен, ИдентификаторФайла);
EndFunction

Function УдалитьФайл(Val Токен, Val ИдентификаторФайла) Export
    Return DeleteFile(Токен, ИдентификаторФайла);
EndFunction

Function СделатьФайлПубличным(Val Токен, Val ИдентификаторФайла) Export
    Return MakeFilePublic(Токен, ИдентификаторФайла);
EndFunction

Function СделатьФайлПриватным(Val Токен, Val ИдентификаторФайла) Export
    Return MakeFilePrivate(Токен, ИдентификаторФайла);
EndFunction

Function ПолучитьСписокВнешнихФайлов(Val Токен, Val Канал = "", Val Курсор = "") Export
    Return GetExternalFileList(Токен, Канал, Курсор);
EndFunction

Function ПолучитьВнешнийФайл(Val Токен, Val ИдентификаторФайла) Export
    Return GetExternalFile(Токен, ИдентификаторФайла);
EndFunction

Function ДобавитьВнешнийФайл(Val Токен, Val URL, Val Заголовок) Export
    Return AddExternalFile(Токен, URL, Заголовок);
EndFunction

Function ОтправитьВнешнийФайл(Val Токен, Val ИдентификаторФайла, Val МассивКаналов) Export
    Return SendExternalFile(Токен, ИдентификаторФайла, МассивКаналов);
EndFunction

Function УдалитьВнешнийФайл(Val Токен, Val ИдентификаторФайла) Export
    Return DeleteExternalFile(Токен, ИдентификаторФайла);
EndFunction

Function СформироватьБлокКартинку(Val URL, Val АльтернативныйТекст = "") Export
    Return GenerateImageBlock(URL, АльтернативныйТекст);
EndFunction

#EndRegion