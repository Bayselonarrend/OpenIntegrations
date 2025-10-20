// OneScript: ./OInt/core/Modules/OPI_VKTeams.os
// Lib: VKTeams
// CLI: vkteams
// Keywords: vkteams, vk teams

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

#Region CommonMethods

// Check token
// Checks if the bot token is functional
//
// Note
// Method at API documentation: [GET /self/get](@teams.vk.com/botapi/#/self/get_self_get)
//
// Parameters:
// Token - String - Bot token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function CheckToken(Val Token) Export

    URL        = "/self/get";
    Parameters = NormalizeMain(URL, Token);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get events
// Receives bot events in Polling mode
//
// Note
// Method at API documentation: [GET /events/get](@teams.vk.com/botapi/#/events/get_events_get)
//
// Parameters:
// Token - String - Bot token - token
// LastID - String, Number - ID of the last event processed before this event - last
// Timeout - String, Number - Connection hold time for Long Polling - timeout
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function GetEvents(Val Token, Val LastID, Val Timeout = 0) Export

    URL        = "/events/get";
    Parameters = NormalizeMain(URL, Token);
    LastID     = OPI_Tools.NumberToString(LastID);

    OPI_Tools.AddField("lastEventId", LastID  , "String", Parameters);
    OPI_Tools.AddField("pollTime"   , Timeout , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get information about file
// Gets information about a file by ID
//
// Note
// Method at API documentation: [GET /files/getInfo](@teams.vk.com/botapi/#/files/get_files_getInfo)
//
// Parameters:
// Token - String - Bot token - token
// FileID - String, Number - File ID - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function GetFileInformation(Val Token, Val FileID) Export

    URL        = "/files/getInfo";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("fileId", FileID , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region MessageSending

// Send text message
// Sends a text message to a chat
//
// Note
// You can mention a user by appending their userId to the text in the following format @[userId]
// Method at API documentation: [GET /messages/sendText](@teams.vk.com/botapi/#/messages/get_messages_sendText)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID for message sending - chatid
// Text - String - Message text - text
// ReplyID - String, Number - Replying message id if necessary - reply
// Keyboard - Array Of String - Buttons to the message if necessary - keyboard
// Markup - String - Markup type for message text: MarkdownV2 or HTML - parsemod
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function SendTextMessage(Val Token
    , Val ChatID
    , Val Text
    , Val ReplyID = 0
    , Val Keyboard = ""
    , Val Markup = "MarkdownV2") Export

    String_ = "String";

    URL        = "/messages/sendText";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"              , ChatID   , String_     , Parameters);
    OPI_Tools.AddField("text"                , Text     , String_     , Parameters);
    OPI_Tools.AddField("replyMsgId"          , ReplyID  , String_     , Parameters);
    OPI_Tools.AddField("inlineKeyboardMarkup", Keyboard , "Collection", Parameters);
    OPI_Tools.AddField("parseMode"           , Markup   , String_     , Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Send file
// Sends the file to the chat
//
// Note
// Method at API documentation: [POST /messages/sendFile](@teams.vk.com/botapi/#/messages/post_messages_sendFile)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID for sending - chatid
// File - BinaryData, String - File for sending - file
// Text - String - File caption - text
// FileName - String - Displayed file name - filename
// Markup - String - Markup type for message text: MarkdownV2 or HTML - parsemod
// ContentType - String - Content type for sending - type
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function SendFile(Val Token
    , Val ChatID
    , Val File
    , Val Text = ""
    , Val FileName = ""
    , Val Markup = "MarkdownV2"
    , Val ContentType = "image/jpeg") Export

    String_ = "String";

    URL        = "/messages/sendFile";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"   , ChatID , String_, Parameters);
    OPI_Tools.AddField("caption"  , Text   , String_, Parameters);
    OPI_Tools.AddField("parseMode", Markup , String_, Parameters);

    If TypeOf(File)   = Type(String_) Then
        FileObject    = New File(File);
        DisplayedName = FileObject.Name;
    Else
        DisplayedName = "file";
    EndIf;

    OPI_TypeConversion.GetBinaryData(File);
    DisplayedName = ?(ValueIsFilled(FileName), FileName, DisplayedName);

    Files = New Map;
    Files.Insert("file|" + DisplayedName, File);

    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, Files, ContentType);

    Return Response;

EndFunction

// Send voice
// Sends an audio file as a voice message
//
// Note
// If you want the client to display this file as a playable voice message, it must be in aac, ogg, or m4a format
// Method at API documentation: [POST /messages/sendVoice](@teams.vk.com/botapi/#/messages/post_messages_sendVoice)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID for sending - chatid
// File - BinaryData, String - File for sending - file
// FileType - String - Audio type: aac, ogg or m4a - type
// ReplyID - String, Number - Replying message id if necessary - reply
// Keyboard - Array Of String - Buttons to the message if necessary - keyboard
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function SendVoice(Val Token
    , Val ChatID
    , Val File
    , Val FileType = "m4a"
    , Val ReplyID = 0
    , Val Keyboard = "") Export

    URL        = "/messages/sendVoice";
    Parameters = NormalizeMain(URL, Token);

    OPI_TypeConversion.GetLine(FileType);

    MIMETypeMapping = New Map;
    MIMETypeMapping.Insert("m4a", "audio/mp4");
    MIMETypeMapping.Insert("ogg", "audio/ogg");
    MIMETypeMapping.Insert("aac", "audio/aac");

    OPI_Tools.AddField("chatId"              , ChatID   , "String"    , Parameters);
    OPI_Tools.AddField("inlineKeyboardMarkup", Keyboard , "Collection", Parameters);
    OPI_Tools.AddField("replyMsgId"          , ReplyID  , "String"    , Parameters);

    OPI_TypeConversion.GetBinaryData(File);

    Files = New Map;
    Files.Insert("file|voice", File);

    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, Files, MIMETypeMapping[FileType]);

    Return Response;

EndFunction

// Change the message text
// Changes the text of an existing message
//
// Note
// You can mention a user by appending their userId to the text in the following format @[userId]
// Method at API documentation: [GET /messages/editText](@teams.vk.com/botapi/#/messages/get_messages_editText)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID for message sending - chatid
// MessageID - String, Number - Message ID for editing - messageid
// Text - String - New message text - text
// Markup - String - Markup type for message text: MarkdownV2 or HTML - parsemod
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function EditMessageText(Val Token
    , Val ChatID
    , Val MessageID
    , Val Text
    , Val Markup = "MarkdownV2") Export

    String_ = "String";

    URL        = "/messages/editText";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"   , ChatID   , String_, Parameters);
    OPI_Tools.AddField("text"     , Text     , String_, Parameters);
    OPI_Tools.AddField("msgId"    , MessageID, String_, Parameters);
    OPI_Tools.AddField("parseMode", Markup   , String_, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Delete message
// Deletes a message by ID
//
// Note
// Method at API documentation: [GET /messages/deleteMessages](@teams.vk.com/botapi/#/messages/get_messages_deleteMessages)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID for message sending - chatid
// MessageID - String, Number - Message ID for editing - messageid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function DeleteMessage(Val Token, Val ChatID, Val MessageID) Export

    URL        = "/messages/deleteMessages";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId", ChatID   , "String", Parameters);
    OPI_Tools.AddField("msgId" , MessageID, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Resend file
// Sends a previously uploaded file by ID
//
// Note
// Method at API documentation: [GET /messages/sendFile](@teams.vk.com/botapi/#/messages/get_messages_sendFile)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID for sending - chatid
// FileID - String, Number - File ID to send - fileid
// Text - String - File caption - text
// Markup - String - Markup type for message text: MarkdownV2 or HTML - parsemod
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function ResendFile(Val Token
    , Val ChatID
    , Val FileID
    , Val Text = ""
    , Val Markup = "MarkdownV2") Export

    String_ = "String";

    URL        = "/messages/sendFile";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"    , ChatID , String_, Parameters);
    OPI_Tools.AddField("caption"   , Text   , String_, Parameters);
    OPI_Tools.AddField("parseMode" , Markup , String_, Parameters);
    OPI_Tools.AddField("fileId"    , FileID , String_, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Resend voice
// Sends a previously uploaded voice message by ID
//
// Note
// Method at API documentation: [GET /messages/sendVoice](@teams.vk.com/botapi/#/messages/get_messages_sendVoice)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID for sending - chatid
// FileID - String, Number - File ID of voice message - fileid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function ResendVoice(Val Token, Val ChatID, Val FileID) Export

    URL        = "/messages/sendVoice";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId", ChatID , "String", Parameters);
    OPI_Tools.AddField("fileId", FileID , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Forward message
// Forwards an existing message to the current dialog box
//
// Note
// Only the chatId from events can be passed to the FromChatID (the code from the chat link is not suitable))
// Method at API documentation: [GET /messages/sendText](@teams.vk.com/botapi/#/messages/get_messages_sendText)
//
// Parameters:
// Token - String - Bot token - token
// MessageID - String, Number - Original message ID - messageid
// FromChatID - String, Number - Source chat ID - fromid
// ChatID - String, Number - Chat ID for message sending - chatid
// Text - String - Additional message text - text
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function ForwardMessage(Val Token, Val MessageID, Val FromChatID, Val ChatID, Val Text = "") Export

    String_ = "String";

    URL        = "/messages/sendText";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"       , ChatID    , String_, Parameters);
    OPI_Tools.AddField("text"         , Text      , String_, Parameters);
    OPI_Tools.AddField("forwardChatId", FromChatID, String_, Parameters);
    OPI_Tools.AddField("forwardMsgId" , MessageID , String_, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Pin message
// Pins the selected message in the chat room
//
// Note
// To call this method, the bot must be an administrator in the chat room
// Method at API documentation: [GET /chats/pinMessage](@teams.vk.com/botapi/#/chats/get_chats_pinMessage)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// MessageID - String, Number - ID of the message to be pinned - messageid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function PinMessage(Val Token, Val ChatID, Val MessageID) Export

    URL        = "/chats/pinMessage";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId", ChatID   , "String", Parameters);
    OPI_Tools.AddField("msgId" , MessageID, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Unpin message
// Unpins a previously pinned chat message
//
// Note
// To call this method, the bot must be an administrator in the chat room
// Method at API documentation: [GET /chats/unpinMessage](@teams.vk.com/botapi/#/chats/get_chats_unpinMessage)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// MessageID - String, Number - ID of the message to be unpinned - messageid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function UnpinMessage(Val Token, Val ChatID, Val MessageID) Export

    URL        = "/chats/unpinMessage";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId", ChatID   , "String", Parameters);
    OPI_Tools.AddField("msgId" , MessageID, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Answer button event
// Returns a response to the user when a keyboard button is pressed
//
// Note
// This method call should be used in response to receiving a callbackQuery event
// Method at API documentation: [GET /messages/answerCallbackQuery](@teams.vk.com/botapi/#/messages/get_messages_answerCallbackQuery)
//
// Parameters:
// Token - String - Bot token - token
// EventID - String - Identifier of the callback query received by the bot - queryid
// Text - String - Answer text - text
// URL - String - URL to be opened by the client application - url
// AsAlert - Boolean - Display the answer as an alert) - showalert
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function AnswerButtonEvent(Val Token
    , Val EventID
    , Val Text = ""
    , Val URL = ""
    , Val AsAlert = False) Export

    String_ = "String";

    RequestURL = "/messages/answerCallbackQuery";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("queryId"  , EventID , String_  , Parameters);
    OPI_Tools.AddField("text"     , Text    , String_  , Parameters);
    OPI_Tools.AddField("url"      , URL     , String_  , Parameters);
    OPI_Tools.AddField("showAlert", AsAlert , "Boolean", Parameters);

    Response = OPI_HTTPRequests.Get(RequestURL, Parameters);

    Return Response;

EndFunction

// Make action button
// Forms an action button for the message keyboard
//
// Note
// Used for `SendTextMessage` function
//
// Parameters:
// Text - String - Button text - text
// Value - String - The value returned in the event. Only if the URL is not filled - data
// URL - String - URL to create the page open button. Only if the Value is not filled in - url
// Style - String - Button style: primary, attention or base - style
//
// Returns:
// Structure - Button for keyboard
Function MakeActionButton(Val Text, Val Value = "", Val URL = "", Val Style = "base") Export

    String_ = "String";

    ButtonStructure = New Structure;
    OPI_Tools.AddField("text"        , Text  , String_, ButtonStructure);
    OPI_Tools.AddField("callbackData", Value , String_, ButtonStructure);
    OPI_Tools.AddField("url"         , URL   , String_, ButtonStructure);
    OPI_Tools.AddField("style"       , Style , String_, ButtonStructure);

    Return ButtonStructure;

EndFunction

#EndRegion

#Region ChatManagement

// Remove chat members
// Removes users from the chat
//
// Note
// Method at API documentation: [GET /chats/members/delete](@teams.vk.com/botapi/#/chats/get_chats_members_delete)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// Users - String, Number, Array of String, Number - The member or members of the chat room to remove - members
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function RemoveChatMembers(Val Token, Val ChatID, Val Users) Export

    OPI_TypeConversion.GetArray(Users);

    URL        = "/chats/members/delete";
    Parameters = NormalizeMain(URL, Token);

    MembersQuery = "";

    For Each ChatMember In Users Do

        CurrentUser  = OPI_Tools.NumberToString(ChatMember);
        MembersQuery = ?(ValueIsFilled(MembersQuery), MembersQuery + ",", "[");

        MembersQuery = MembersQuery
            + "{""sn"":"""
            + CurrentUser
            + """}";

    EndDo;

    MembersQuery = MembersQuery + "]";

    OPI_Tools.AddField("chatId" , ChatID      , "String", Parameters);
    OPI_Tools.AddField("members", MembersQuery, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Change chat picture
// Changes the chat avatar picture
//
// Note
// Method at API documentation: [POST ​/chats​/avatar​/set](@teams.vk.com/botapi/#/chats/post_chats_avatar_set)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// File - BinaryData, String - Image file - file
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function ChangeChatPicture(Val Token, Val ChatID, Val File) Export

    URL        = "/chats/avatar/set";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId", ChatID, "String", Parameters);

    OPI_TypeConversion.GetBinaryData(File);

    Files = New Map;
    Files.Insert("image|image", File);

    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, Files, "image/xyz");

    Return Response;

EndFunction

// Get information about the chat room
// Gets basic information about the chat
//
// Note
// Method at API documentation: [GET /chats/getInfo](@teams.vk.com/botapi/#/chats/get_chats_getInfo)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function GetChatInfo(Val Token, Val ChatID) Export

    Method   = "/chats/getInfo";
    Response = GetChatData(Token, ChatID, Method);

    Return Response;

EndFunction

// Get chat admins
// Gets the list of chat administrators
//
// Note
// Method at API documentation: [GET /chats/getAdmins](@teams.vk.com/botapi/#/chats/get_chats_getAdmins)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function GetChatAdmins(Val Token, Val ChatID) Export

    Method   = "/chats/getAdmins";
    Response = GetChatData(Token, ChatID, Method);

    Return Response;

EndFunction

// Get chat members
// Gets the list of chat members
//
// Note
// Method at API documentation: [GET /chats/getMembers](@teams.vk.com/botapi/#/chats/get_chats_getMembers)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// Cursor - String - Next page marker from the previous request - cursor
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function GetChatMembers(Val Token, Val ChatID, Val Cursor = "") Export

    Method   = "/chats/getMembers";
    Response = GetChatData(Token, ChatID, Method, Cursor);

    Return Response;

EndFunction

// Get chat blocked users
// Gets the list of blocked chat users
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​/chats​/getBlockedUsers](@teams.vk.com/botapi/#/chats/get_chats_getBlockedUsers)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function GetChatBlockedUsers(Val Token, Val ChatID) Export

    Method   = "/chats/getBlockedUsers";
    Response = GetChatData(Token, ChatID, Method);

    Return Response;

EndFunction

// Get chat join requests
// Gets a list of requests to join the chat room
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​​/chats​/getPendingUsers](@teams.vk.com/botapi/#/chats/get_chats_getPendingUsers)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function GetChatJoinRequests(Val Token, Val ChatID) Export

    Method   = "/chats/getPendingUsers";
    Response = GetChatData(Token, ChatID, Method);

    Return Response;

EndFunction

// Block chat user
// Blocks the selected user in chat
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​​/chats​/blockUser](@teams.vk.com/botapi/#/chats/get_chats_blockUser)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// UserID - String, Number - User ID to be blocked - userid
// DeleteLastMessages - Boolean - Delete last messages before blocking - dellast
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function BlockChatUser(Val Token
    , Val ChatID
    , Val UserID
    , Val DeleteLastMessages = False) Export

    URL        = "/chats/blockUser";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"         , ChatID            , "String" , Parameters);
    OPI_Tools.AddField("userId"         , UserID            , "String" , Parameters);
    OPI_Tools.AddField("delLastMessages", DeleteLastMessages, "Boolean", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Unblock chat user
// Unblocks a previously blocked user in the chat room
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​​/chats/unblockUser](@teams.vk.com/botapi/#/chats/get_chats_unblockUser)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// UserID - String, Number - User ID - userid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function UnblockChatUser(Val Token, Val ChatID, Val UserID) Export

    URL        = "/chats/unblockUser";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId", ChatID , "String", Parameters);
    OPI_Tools.AddField("userId", UserID , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Approve pending
// Confirms the user's request to join a private chat room
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​​/chats/resolvePending](@teams.vk.com/botapi/#/chats/get_chats_resolvePending)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// UserID - String, Number - User ID. For all active requests if not filled in - userid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function ApprovePending(Val Token, Val ChatID, Val UserID = "") Export

    Response = ResolvePending(Token, ChatID, True, UserID);

    Return Response;

EndFunction

// Disapprove pending
// Rejects the user's request to join a private chat room
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​​/chats/resolvePending](@teams.vk.com/botapi/#/chats/get_chats_resolvePending)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// UserID - String, Number - User ID. For all active requests if not filled in - userid
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function DisapprovePending(Val Token, Val ChatID, Val UserID = "") Export

    Response = ResolvePending(Token, ChatID, False, UserID);

    Return Response;

EndFunction

// Set chat title
// Sets new chat title
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​​/chats/setTitle](@teams.vk.com/botapi/#/chats/get_chats_setTitle)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// Text - String - Title text - text
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function SetChatTitle(Val Token, Val ChatID, Val Text) Export

    Response = UpdateChatParameters(Token, ChatID, "title", Text);

    Return Response;

EndFunction

// Set chat description
// Sets new chat description
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET ​​/chats/setAbout](@teams.vk.com/botapi/#/chats/get_chats_setAbout)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// Text - String - Description text - text
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function SetChatDescription(Val Token, Val ChatID, Val Text) Export

    Response = UpdateChatParameters(Token, ChatID, "about", Text);

    Return Response;

EndFunction

// Set chat rules
// Sets new chat rules
//
// Note
// To call this method, the bot must be an administrator in the chat room.
// Method at API documentation: [GET /chats/setRules](@teams.vk.com/botapi/#/chats/get_chats_setRules)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Chat ID - chatid
// Text - String - Rules Text - text
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from VK Teams
Function SetChatRules(Val Token, Val ChatID, Val Text) Export

    Response = UpdateChatParameters(Token, ChatID, "rules", Text);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function NormalizeMain(URL, Val Token)

    URL        = "https://myteam.mail.ru/bot/v1" + URL;
    Parameters = New Structure;
    OPI_Tools.AddField("token", Token, "String", Parameters);

    Return Parameters;

EndFunction

Function GetChatData(Val Token, Val ChatID, Val Method, Val Cursor = "")

    URL        = Method;
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId", ChatID, "String", Parameters);
    OPI_Tools.AddField("cursor", Cursor, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

Function ResolvePending(Val Token, Val ChatID, Val Response, Val UserID = "")

    URL        = "/chats/resolvePending";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId" , ChatID   , "String" , Parameters);
    OPI_Tools.AddField("approve", Response , "Boolean", Parameters);

    If ValueIsFilled(UserID) Then
        OPI_Tools.AddField("userId"  , UserID, "String" , Parameters);
    Else
        OPI_Tools.AddField("everyone", True  , "Boolean", Parameters);
    EndIf;

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

Function UpdateChatParameters(Val Token, Val ChatID, Val Parameter, Val Value)

    URL        = "/chats/set" + Title(Parameter);
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId" , ChatID , "String", Parameters);
    OPI_Tools.AddField(Parameter, Value  , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region Alternate

Function ПроверитьТокен(Val Токен) Export
	Return CheckToken(Токен);
EndFunction

Function ПолучитьСобытия(Val Токен, Val IDПоследнего, Val Таймаут = 0) Export
	Return GetEvents(Токен, IDПоследнего, Таймаут);
EndFunction

Function ПолучитьИнформациюОФайле(Val Токен, Val IDФайла) Export
	Return GetFileInformation(Токен, IDФайла);
EndFunction

Function ОтправитьТекстовоеСообщение(Val Токен, Val IDЧата, Val Текст, Val IDЦитируемого = 0, Val Клавиатура = "", Val Разметка = "MarkdownV2") Export
	Return SendTextMessage(Токен, IDЧата, Текст, IDЦитируемого, Клавиатура, Разметка);
EndFunction

Function ОтправитьФайл(Val Токен, Val IDЧата, Val Файл, Val Текст = "", Val ИмяФайла = "", Val Разметка = "MarkdownV2", Val ТипКонтента = "image/jpeg") Export
	Return SendFile(Токен, IDЧата, Файл, Текст, ИмяФайла, Разметка, ТипКонтента);
EndFunction

Function ОтправитьГолосовоеСообщение(Val Токен, Val IDЧата, Val Файл, Val ТипФайла = "m4a", Val IDЦитируемого = 0, Val Клавиатура = "") Export
	Return SendVoice(Токен, IDЧата, Файл, ТипФайла, IDЦитируемого, Клавиатура);
EndFunction

Function ИзменитьТекстСообщения(Val Токен, Val IDЧата, Val IDСообщения, Val Текст, Val Разметка = "MarkdownV2") Export
	Return EditMessageText(Токен, IDЧата, IDСообщения, Текст, Разметка);
EndFunction

Function УдалитьСообщение(Val Токен, Val IDЧата, Val IDСообщения) Export
	Return DeleteMessage(Токен, IDЧата, IDСообщения);
EndFunction

Function ПереслатьФайл(Val Токен, Val IDЧата, Val IDФайла, Val Текст = "", Val Разметка = "MarkdownV2") Export
	Return ResendFile(Токен, IDЧата, IDФайла, Текст, Разметка);
EndFunction

Function ПереслатьГолосовоеСообщение(Val Токен, Val IDЧата, Val IDФайла) Export
	Return ResendVoice(Токен, IDЧата, IDФайла);
EndFunction

Function ПереслатьСообщение(Val Токен, Val IDСообщения, Val IDЧатаИсточника, Val IDЧата, Val Текст = "") Export
	Return ForwardMessage(Токен, IDСообщения, IDЧатаИсточника, IDЧата, Текст);
EndFunction

Function ЗакрепитьСообщение(Val Токен, Val IDЧата, Val IDСообщения) Export
	Return PinMessage(Токен, IDЧата, IDСообщения);
EndFunction

Function ОткрепитьСообщение(Val Токен, Val IDЧата, Val IDСообщения) Export
	Return UnpinMessage(Токен, IDЧата, IDСообщения);
EndFunction

Function ОтветитьНаСобытиеКлавиатуры(Val Токен, Val IDСобытия, Val Текст = "", Val URL = "", Val ЭтоПредупреждение = False) Export
	Return AnswerButtonEvent(Токен, IDСобытия, Текст, URL, ЭтоПредупреждение);
EndFunction

Function СформироватьКнопкуДействия(Val Текст, Val Значение = "", Val URL = "", Val Стиль = "base") Export
	Return MakeActionButton(Текст, Значение, URL, Стиль);
EndFunction

Function ИсключитьПользователейЧата(Val Токен, Val IDЧата, Val Пользователи) Export
	Return RemoveChatMembers(Токен, IDЧата, Пользователи);
EndFunction

Function ИзменитьАватарЧата(Val Токен, Val IDЧата, Val Файл) Export
	Return ChangeChatPicture(Токен, IDЧата, Файл);
EndFunction

Function ПолучитьИнформациюОЧате(Val Токен, Val IDЧата) Export
	Return GetChatInfo(Токен, IDЧата);
EndFunction

Function ПолучитьАдминистраторовЧата(Val Токен, Val IDЧата) Export
	Return GetChatAdmins(Токен, IDЧата);
EndFunction

Function ПолучитьПользователейЧата(Val Токен, Val IDЧата, Val Курсор = "") Export
	Return GetChatMembers(Токен, IDЧата, Курсор);
EndFunction

Function ПолучитьЗаблокированныхПользователейЧата(Val Токен, Val IDЧата) Export
	Return GetChatBlockedUsers(Токен, IDЧата);
EndFunction

Function ПолучитьЗапросыВступленияЧата(Val Токен, Val IDЧата) Export
	Return GetChatJoinRequests(Токен, IDЧата);
EndFunction

Function ЗаблокироватьПользователяЧата(Val Токен, Val IDЧата, Val IDПользователя, Val УдалитьПоследниеСообщения = False) Export
	Return BlockChatUser(Токен, IDЧата, IDПользователя, УдалитьПоследниеСообщения);
EndFunction

Function РазблокироватьПользователяЧата(Val Токен, Val IDЧата, Val IDПользователя) Export
	Return UnblockChatUser(Токен, IDЧата, IDПользователя);
EndFunction

Function ОдобритьЗаявкуНаВступление(Val Токен, Val IDЧата, Val IDПользователя = "") Export
	Return ApprovePending(Токен, IDЧата, IDПользователя);
EndFunction

Function ОтклонитьЗаявкуНаВступление(Val Токен, Val IDЧата, Val IDПользователя = "") Export
	Return DisapprovePending(Токен, IDЧата, IDПользователя);
EndFunction

Function УстановитьЗаголовокЧата(Val Токен, Val IDЧата, Val Текст) Export
	Return SetChatTitle(Токен, IDЧата, Текст);
EndFunction

Function УстановитьОписаниеЧата(Val Токен, Val IDЧата, Val Текст) Export
	Return SetChatDescription(Токен, IDЧата, Текст);
EndFunction

Function УстановитьПравилаЧата(Val Токен, Val IDЧата, Val Текст) Export
	Return SetChatRules(Токен, IDЧата, Текст);
EndFunction

#EndRegion