// OneScript: ./OInt/core/Modules/OPI_VKTeams.os
// Lib: VKTeams
// CLI: vkteams

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
// BSLLS:IncorrectLineBreak-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

// Uncomment if OneScript is executed
// #Use "../../tools"

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
// Map Of KeyAndValue - Serialized JSON response from VK Teams
Function CheckToken(Val Token) Export

    URL        = "/self/get";
    Parameters = NormalizeMain(URL, Token);

    Response = OPI_Tools.Get(URL, Parameters);

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
// Map Of KeyAndValue - Serialized JSON response from VK Teams
Function GetEvents(Val Token, Val LastID, Val Timeout = 0) Export

    URL        = "/events/get";
    Parameters = NormalizeMain(URL, Token);
    LastID     = OPI_Tools.NumberToString(LastID);

    OPI_Tools.AddField("lastEventId", LastID  , "String", Parameters);
    OPI_Tools.AddField("pollTime"   , Timeout , "String", Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

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
// Map Of KeyAndValue - Serialized JSON response from VK Teams
Function GetFileInformation(Val Token, Val FileID) Export

    URL        = "/files/getInfo";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("fileId", FileID , "String", Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

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
// Map Of KeyAndValue - Serialized JSON response from VK Teams
Function SendTextMessage(Val Token
    , Val ChatID
    , Val Text
    , Val ReplyID = 0
    , Val Keyboard = ""
    , Val Markup = "MarkdownV2") Export

    URL        = "/messages/sendText";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"              , ChatID   , "String"    , Parameters);
    OPI_Tools.AddField("text"                , Text     , "String"    , Parameters);
    OPI_Tools.AddField("replyMsgId"          , ReplyID  , "String"    , Parameters);
    OPI_Tools.AddField("inlineKeyboardMarkup", Keyboard , "Collection", Parameters);
    OPI_Tools.AddField("parseMode"           , Markup   , "String"    , Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// SendFile
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
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from VK Teams
Function SendFile(Val Token
    , Val ChatID
    , Val File
    , Val Text = ""
    , Val FileName = ""
    , Val Markup = "MarkdownV2") Export

    URL        = "/messages/sendFile";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"    , ChatID , "String" , Parameters);
    OPI_Tools.AddField("caption"   , Text   , "String" , Parameters);
    OPI_Tools.AddField("parseMode" , Markup , "String" , Parameters);

    If TypeOf(File)   = Type("String") Then
        FileObject    = New File(File);
        DisplayedName = FileObject.Name;
    Else
        DisplayedName = "file";
    EndIf;

    OPI_TypeConversion.GetBinaryData(File);
    DisplayedName = ?(ValueIsFilled(FileName), FileName, DisplayedName);

    Files = New Map;
    Files.Insert("file|" + DisplayedName, File);

    Response = OPI_Tools.PostMultipart(URL, Parameters, Files, "");

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
// FileName - String - Displayed file name - filename
// Markup - String - Markup type for message text: MarkdownV2 or HTML - parsemod
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from VK Teams
Function ResendFile(Val Token
    , Val ChatID
    , Val FileID
    , Val Text = ""
    , Val FileName = ""
    , Val Markup = "MarkdownV2") Export

    URL        = "/messages/sendFile";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"    , ChatID , "String", Parameters);
    OPI_Tools.AddField("caption"   , Text   , "String", Parameters);
    OPI_Tools.AddField("parseMode" , Markup , "String", Parameters);
    OPI_Tools.AddField("fileId"    , FileID , "String", Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

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
// MessageID - String, Number - Original message ID - message
// FromChatID - String, Number - Source chat ID - fromid
// ChatID - String, Number - Chat ID for message sending - chatid
// Text - String - Additional message text - text
//
// Returns:
// HTTPResponse - Forward message
Function ForwardMessage(Val Token, Val MessageID, Val FromChatID, Val ChatID, Val Text = "") Export

    URL        = "/messages/sendText";
    Parameters = NormalizeMain(URL, Token);

    OPI_Tools.AddField("chatId"       , ChatID    , "String", Parameters);
    OPI_Tools.AddField("text"         , Text      , "String", Parameters);
    OPI_Tools.AddField("forwardChatId", FromChatID, "String", Parameters);
    OPI_Tools.AddField("forwardMsgId" , MessageID , "String", Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

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

#EndRegion
