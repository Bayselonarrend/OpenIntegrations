// OneScript: ./OInt/core/Modules/OPI_Telegram.os
// Lib: Telegram
// CLI: telegram

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
// BSLLS:UnreachableCode-off
// BSLLS:CommentedCode-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
// #Use "../../tools"

#Region Public

#Region DataRetrievalAndSettings

// Get bot information
// Executes the /getMe request, returning basic bot information: name, id, ability to add the bot to groups, etc..
// 
// Parameters:
// Token - String - Bot token - token
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function GetBotInformation(Val Token) Export

    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/getMe";
    Response = OPI_Tools.Get(URL);
    
    Return Response;

EndFunction

// Get updates
// Executes a request /getUpdates, returning information about bot events. Used in polling mode
//
// Parameters:
// Token - String - Bot token - token
// Timeout - String, Number - Waiting time for new events - timeout
// Offset - String, Number - Offset in the list of received messages - offset
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function GetUpdates(Val Token, Val Timeout = 0, Val Offset = "") Export

    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/getUpdates";
    
    Parameters = New Structure;
    OPI_Tools.AddField("timeout", Timeout , "String", Parameters);
    OPI_Tools.AddField("offset" , Offset, "String", Parameters);
    
    Response = OPI_Tools.Get(URL, Parameters);
    Return Response;

EndFunction

// Set Webhook
// Set webhook URL for bot event handling in webhook mode 
//          
// Parameters:
// Token - String - Bot token - token
// URL - String - Request handling address from Telegram (with https:) - url
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SetWebhook(Val Token, Val URL) Export

    OPI_TypeConversion.GetLine(Token);
    
    Parameters = New Structure;
    OPI_Tools.AddField("url", URL, "String", Parameters);

    URL = "api.telegram.org/bot" + Token + "/setWebHook";
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;

EndFunction

// Delete webhook
// Deletes the bot event handler URL for webhook operation
// 
// Parameters:
// Token - String - Bot token - token
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function DeleteWebhook(Val Token) Export

    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/deleteWebHook";
    Response = OPI_Tools.Get(URL);
    
    Return Response;

EndFunction

// Download file
// Download file from Telegram servers
// 
// Parameters:
// Token - String - Token - token
// FileID - String - File ID for downloading - fileid
// 
// Returns:
// BinaryData - file's binary data
Function DownloadFile(Val Token, Val FileID) Export

    Result = "result";
    
    OPI_TypeConversion.GetLine(Token); 
    OPI_TypeConversion.GetLine(FileID);    
            
    Parameters = New Structure("file_id", FileID);

    URL = "api.telegram.org/bot" + Token + "/getFile";
    Response = OPI_Tools.Get(URL, Parameters);
    
    Path = Response[Result]["file_path"];
    
    If Not ValueIsFilled(Path) Then
        Return Response;
    EndIf;
    
    URL = "api.telegram.org/file/bot" + Token + "/" + Path;
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;   
    
EndFunction

// Process Telegram Mini App data
// Processes TMA data and determines its validity
// 
// Parameters:
// DataString - String - Query from Telegram.WebApp.initData
// Token - String - Bot token
// 
// Returns:
// Map of String - Map of data with the result of verification in the passed field
Function ProcessTMAData(Val DataString, Val Token) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(DataString);
    
    DataString = DecodeString(DataString, StringEncodingMethod.URLencoding);
    DataStructure = OPI_Tools.RequestParametersToMap(DataString);
    KeyString = "WebAppData";
    Hash = "";
    BinaryKey = GetBinaryDataFromString(KeyString);

    Result = OPI_Cryptography.HMACSHA256(BinaryKey, GetBinaryDataFromString(Token));

    TValue = New ValueTable;
    TValue.Columns.Add("Key");
    TValue.Columns.Add("Value");

    For Each Data In DataStructure Do

        NewLine = TValue.Add();
        NewLine.Key = Data.Key;
        NewLine.Value = Data.Value;

    EndDo;

    TValue.Sort("Key");

    ReturnMapping = New Map;
    DCS = "";

    For Each DataString In TValue Do

        If DataString.Key <> "hash" Then
            DCS = DCS + DataString.Key + "=" + DataString.Value + Chars.LF;
            ReturnMapping.Insert(DataString.Key, DataString.Value);
        Else
            Hash = DataString.Value;
        EndIf;

    EndDo;

    DCS = Left(DCS, StrLen(DCS) - 1);
    Signature = OPI_Cryptography.HMACSHA256(Result, GetBinaryDataFromString(DCS));

    Final = GetHexStringFromBinaryData(Signature);

    If Final = Upper(Hash) Then
        Response = True;
    Else
        Response = False;
    EndIf;

    ReturnMapping.Insert("passed", Response);

    Return ReturnMapping;

EndFunction

#EndRegion

#Region DataSending

// Send text message
// Sends a text message to a chat or channel
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// RepliedID - String, Number - Reply to message ID - reply
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendTextMessage(Val Token
	, Val ChatID
	, Val Text
	, Val Keyboard = ""
	, Val Markup = "Markdown"
	, Val RepliedID = 0) Export

    OPI_TypeConversion.GetLine(Token);    
    OPI_Tools.ReplaceSpecialCharacters(Text, Markup);
            
    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode" , Markup , "String" , Parameters);
    OPI_Tools.AddField("text" , Text , "String" , Parameters);
    OPI_Tools.AddField("reply_markup" , Keyboard , "FileString", Parameters);
    OPI_Tools.AddField("reply_to_message_id", RepliedID, "String" , Parameters);
    
    AddChatIdentifier(ChatID, Parameters);
    
    URL = "api.telegram.org/bot" + Token + "/sendMessage";
    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Send image
// Sends an image to a chat or channel
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Image - BinaryData,String - Image file - picture
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendImage(Val Token
	, Val ChatID
	, Val Text
	, Val Image
	, Val Keyboard = ""
	, Val Markup = "Markdown") Export

    Return SendFile(Token, ChatID, Text, Image, "photo", Keyboard, Markup);

EndFunction

// Send video
// Sends a video to a chat or channel
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Video - BinaryData,String - Video file - video
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendVideo(Val Token
	, Val ChatID
	, Val Text
	, Val Video
	, Val Keyboard = ""
	, Val Markup = "Markdown") Export

    Return SendFile(Token, ChatID, Text, Video, "video", Keyboard, Markup);

EndFunction

// Send audio
// Sends an audio file to a chat or channel
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Audio - BinaryData,String - Audio file - audio
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendAudio(Val Token
	, Val ChatID
	, Val Text
	, Val Audio
	, Val Keyboard = ""
	, Val Markup = "Markdown") Export

    Return SendFile(Token, ChatID, Text, Audio, "audio", Keyboard, Markup);

EndFunction

// Send document
// Sends a document to a chat or channel
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Document - BinaryData,String - Document file - doc
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendDocument(Val Token
	, Val ChatID
	, Val Text
	, Val Document
	, Val Keyboard = ""
	, Val Markup = "Markdown") Export

    Return SendFile(Token, ChatID, Text, Document, "document", Keyboard, Markup);

EndFunction

// Send GIF
// Sends a GIF to a chat or channel
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// GIF - BinaryData,String - GIF file - gif
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendGif(Val Token
	, Val ChatID
	, Val Text
	, Val GIF
	, Val Keyboard = ""
	, Val Markup = "Markdown") Export

    Return SendFile(Token, ChatID, Text, GIF, "animation", Keyboard, Markup);

EndFunction

// Send media group
// Sends a set of files to a chat or channel. Media types: audio, document, photo, video
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// FileMapping - Map of String - File collection - media - File JSON or path to .json
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendMediaGroup(Val Token
	, Val ChatID
	, Val Text
	, Val FileMapping
	, Val Keyboard = ""
	, Val Markup = "Markdown") Export
    
    // FileMapping
    // Key - File, Value - Type
    // Types: audio, document, photo, video
    // Different types cannot be mixed!

	String_ = "String";
	
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetCollection(FileMapping);
    
    OPI_Tools.ReplaceSpecialCharacters(Text, Markup);

    URL = "api.telegram.org/bot" + Token + "/sendMediaGroup";
    FileStructure = New Structure;
    Media = New Array;
    Parameters = New Structure;
    
    AddChatIdentifier(ChatID, Parameters);
    FormMediaArray(FileMapping, Text, FileStructure, Media);
    
    OPI_Tools.AddField("parse_mode" , Markup , String_ , Parameters);
    OPI_Tools.AddField("caption" , Text , String_ , Parameters);
    OPI_Tools.AddField("media" , Media , String_ , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard, "FileString", Parameters);

    Response = OPI_Tools.PostMultipart(URL, Parameters, FileStructure, "mixed");

    Return Response;

EndFunction

// Send location
// Sends location by geographic latitude and longitude to a chat or channel
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Latitude - String, Number - Geographic latitude - lat
// Longitude - String, Number - Geographic longitude - long
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendLocation(Val Token, Val ChatID, Val Latitude, Val Longitude, Val Keyboard = "") Export

	String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    
    URL = "api.telegram.org/bot" + Token + "/sendLocation";
    
    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode" , "Markdown" , String_ , Parameters);
    OPI_Tools.AddField("latitude" , Latitude , String_ , Parameters);
    OPI_Tools.AddField("longitude" , Longitude , String_ , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard , "FileString", Parameters);
    
    AddChatIdentifier(ChatID, Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Send contact
// Sends a contact with name and phone number
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Name - String - Contact name - name
// LastName - String - Contact last name - surname
// Phone - String - Contact phone number - phone
// Keyboard - String - See GenerateKeyboardFromArray - keyboard - Keyboard JSON or path to .json
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendContact(Val Token, Val ChatID, Val Name, Val LastName, Val Phone, Val Keyboard = "") Export

	String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    
    URL = "api.telegram.org/bot" + Token + "/sendContact";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode" , "Markdown", String_ , Parameters);
    OPI_Tools.AddField("first_name" , Name , String_ , Parameters);
    OPI_Tools.AddField("last_name" , LastName , String_ , Parameters);
    OPI_Tools.AddField("phone_number", Phone , String_ , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard, "FileString", Parameters);
    
    AddChatIdentifier(ChatID, Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Send poll
// Sends a poll with answer options
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Question - String - Poll question - question
// AnswersArray - Array of String - Array of answer options - options
// Anonymous - Boolean - Poll anonymity - anonymous
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function SendPoll(Val Token, Val ChatID, Val Question, Val AnswersArray, Val Anonymous = True) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetCollection(AnswersArray);

    OPI_TypeConversion.GetBoolean(Anonymous);
    
    URL = "api.telegram.org/bot" + Token + "/sendPoll";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown" , "String" , Parameters);
    OPI_Tools.AddField("question" , Question , "String" , Parameters);
    OPI_Tools.AddField("options" , AnswersArray, "FileString", Parameters);
    
    Parameters.Insert("is_anonymous", ?(Anonymous, 1, 0));   
    AddChatIdentifier(ChatID, Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Forward message
// Forwards a message between chats or within a chat
// 
// Parameters:
// Token - String - Bot token - token
// OriginalID - String, Number - Original message ID - message
// FromID - String, Number - Chat ID of the original message - from
// ToID - String, Number - Target chat ID or ChatID*TopicID - to
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function ForwardMessage(Val Token, Val OriginalID, Val FromID, Val ToID) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(OriginalID);
    OPI_TypeConversion.GetLine(FromID);
    OPI_TypeConversion.GetLine(ToID);
    
    URL = "api.telegram.org/bot" + Token + "/forwardMessage";
    
    Parameters = New Structure;
    OPI_Tools.AddField("from_chat_id", FromID , "String", Parameters);
    OPI_Tools.AddField("message_id" , OriginalID, "String", Parameters);

    AddChatIdentifier(ToID, Parameters);
    
    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Generate keyboard from array of buttons
// Generates a simple JSON keyboard from an array of buttons for a message or bottom panel
// 
// Parameters:
// ButtonArray - Array of String - Array of buttons - buttons 
// UnderMessage - Boolean - Keyboard under the message or on the bottom panel - under
// OneByOne - Boolean - True > buttons are displayed in a column, False > in a row - column
// 
// Returns:
// String - Keyboard JSON
Function FormKeyboardFromButtonArray(Val ButtonArray
    , Val UnderMessage = False
    , Val OneByOne = True) Export

    OPI_TypeConversion.GetBoolean(UnderMessage);
    OPI_TypeConversion.GetBoolean(OneByOne);
    OPI_TypeConversion.GetCollection(ButtonArray);
    
    If OneByOne Then
        Strings = CreateTallKeyboard(ButtonArray);
    Else
        Strings = CreateLongKeyboard(ButtonArray);
    EndIf;

    If UnderMessage Then
        ParameterStructure = New Structure("inline_keyboard,rows", Strings, 1);
    Else
        ParameterStructure = New Structure("keyboard,resize_keyboard", Strings, True);
    EndIf;

    Keyboard = OPI_Tools.JSONString(ParameterStructure);

    Return Keyboard;

EndFunction

#EndRegion

#Region Administration

// Ban
// Bans a user in the selected chat
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// UserID - String, Number - Target user ID - user
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function Ban(Val Token, Val ChatID, Val UserID) Export

	String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/banChatMember";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown" , String_, Parameters);
    OPI_Tools.AddField("chat_id" , ChatID , String_, Parameters);
    OPI_Tools.AddField("user_id" , UserID, String_, Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Unban
// Unbans a previously banned user
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// UserID - String, Number - Target user ID - user
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function Unban(Val Token, Val ChatID, Val UserID) Export

	String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/unbanChatMember";

    Parameters = New Structure;   
    OPI_Tools.AddField("parse_mode" , "Markdown" , String_ , Parameters);
    OPI_Tools.AddField("chat_id" , ChatID , String_ , Parameters);
    OPI_Tools.AddField("user_id" , UserID, String_ , Parameters);
    OPI_Tools.AddField("only_if_banned", False , "Boolean", Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Create invitation link
// Creates a link for joining a closed chat
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Title - String - Invitation title - title
// ExpirationDate - Date - Link expiration date (permanent if not specified) - expire
// UserLimit - Number - User limit (infinite if not specified) - limit
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function CreateInvitationLink(Val Token
    , Val ChatID
    , Val Title = ""
    , Val ExpirationDate = ""
    , Val UserLimit = 0) Export

	String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/createChatInviteLink";
    
    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode" , "Markdown" , String_ , Parameters);
    OPI_Tools.AddField("chat_id" , ChatID , String_ , Parameters);
    OPI_Tools.AddField("name" , Title , String_ , Parameters);
    OPI_Tools.AddField("member_limit" , UserLimit, String_ , Parameters);
    OPI_Tools.AddField("expire_date" , ExpirationDate , "Date" , Parameters);
    
    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Pin message
// Pins a message in the chat header
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - Target message ID - message
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function PinMessage(Val Token, Val ChatID, Val MessageID) Export
    
    String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/pinChatMessage";
    
    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode" , "Markdown" , String_ , Parameters);
    OPI_Tools.AddField("chat_id" , ChatID , String_ , Parameters);
    OPI_Tools.AddField("message_id" , MessageID, String_ , Parameters);
    OPI_Tools.AddField("disable_notification", False , "Boolean", Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Unpin message
// Unpins a message in the chat header
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - Target message ID - message
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function UnpinMessage(Val Token, Val ChatID, Val MessageID) Export
    
    String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/unpinChatMessage";
    
    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown" , String_, Parameters);
    OPI_Tools.AddField("chat_id" , ChatID , String_, Parameters);
    OPI_Tools.AddField("message_id", MessageID, String_, Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Get participant count
// Gets the total number of chat participants
// 
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID - chat
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function GetParticipantCount(Val Token, Val ChatID) Export

    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/getChatMemberCount";
    
    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown" , "String", Parameters);
    OPI_Tools.AddField("chat_id" , ChatID , "String", Parameters);

    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;

EndFunction

// Delete message
// 
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number -  - message
// 
// Returns:
//  - 
Function DeleteMessage(Val Token, Val ChatID, Val MessageID) Export
	
	OPI_TypeConversion.GetLine(Token);
	
	URL = "api.telegram.org/bot" + Token + "/deleteMessage";
	
	Parameters = New Structure;
	OPI_Tools.AddField("message_id", MessageID, "String", Parameters);
	OPI_Tools.AddField("chat_id" , ChatID , "String", Parameters);
	
	Response = OPI_Tools.Get(URL, Parameters);
	Return Response;

EndFunction

#EndRegion

#Region ForumTopicManagement

// Get avatar icon list
// Gets the mapping of Emoji IDs for setting as forum theme icons
// 
// Parameters:
// Token - String - Token - token
// 
// Returns:
// Map Of KeyAndValue - Key > ID, Value > Emoji
Function GetAvatarIconList(Val Token) Export
    
    OPI_TypeConversion.GetLine(Token);
    
    Result = "result";
    URL = "api.telegram.org/bot" + Token + "/getForumTopicIconStickers";     
    Response = OPI_Tools.Get(URL);    
    Icons = Response[Result];
    
    If Not ValueIsFilled(Icons) Then
    	Return Response;
    EndIf; 
    
    Collection = New Map;
    
    For Each Icon In Icons Do
        Collection.Insert(Icon["custom_emoji_id"], Icon["emoji"]);
    EndDo;
       
    Return Collection;

EndFunction

// Create forum thread
// Creates a new thread in the group with theme functionality enabled
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread creation chat ID - forum
// Title - String - Thread title - title
// IconID - String - See GetAvatarIconList - icon
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function CreateForumThread(Val Token, Val ChatID, Val Title, Val IconID = "") Export
	
    Return ForumTopicManagement(Token, ChatID, Title, IconID);
    
EndFunction

// Edit forum thread
// Creates a new thread in the group with theme functionality enabled
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread creation chat ID - forum
// ThreadID - String, Number - Thread ID - topic
// Title - String - New title - title
// IconID - String - See GetAvatarIconList - icon
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function EditForumTopic(Val Token
    , Val ChatID
    , Val ThreadID
    , Val Title = Undefined
    , Val IconID = Undefined) Export   
     
    Return ForumTopicManagement(Token, ChatID, Title, IconID, ThreadID);
EndFunction

// Close forum thread
// Closes the thread for new messages
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread chat ID - forum
// ThreadID - String, Number - Thread ID - topic
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function CloseForumThread(Val Token, Val ChatID, Val ThreadID = "") Export
	
    Return ManageForumThreadState(Token, ChatID, 2, ThreadID);  
      
EndFunction

// Open forum thread
// Reopens a previously closed forum thread
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread chat ID - forum
// ThreadID - String, Number - Thread ID - topic
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function OpenForumThread(Val Token, Val ChatID, Val ThreadID = "") Export
	
    Return ManageForumThreadState(Token, ChatID, 1, ThreadID); 
       
EndFunction

// Delete forum thread
// Deletes a forum thread
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread chat ID - forum
// ThreadID - String, Number - Thread ID - topic
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function DeleteForumTopic(Val Token, Val ChatID, Val ThreadID) Export
	
    Return ManageForumThreadState(Token, ChatID, 3, ThreadID);   
     
EndFunction

// Hide main forum thread
// Hides the main forum thread
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread chat ID - forum
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function HideMainForumTopic(Val Token, Val ChatID) Export
	
    Return ManageMainTopicVisibility(Token, ChatID, True);
    
EndFunction

// Show main forum thread
// Shows a previously hidden main forum thread
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread chat ID - forum
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function ShowMainForumTopic(Val Token, Val ChatID) Export
	
    Return ManageMainTopicVisibility(Token, ChatID, False);
    
EndFunction

// Edit main forum thread name
// Edits the name of the main forum thread
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread chat ID - forum
// Title - String - New main thread name - title
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function EditMainForumTopicName(Val Token, Val ChatID, Val Title) Export
    
    OPI_TypeConversion.GetLine(Token);
    
    URL = "api.telegram.org/bot" + Token + "/editGeneralForumTopic";
    
    Parameters = New Structure;
    OPI_Tools.AddField("chat_id", ChatID , "String", Parameters);
    OPI_Tools.AddField("name" , Title, "String", Parameters);
    
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;

EndFunction

// Clear thread's pinned messages list
// Clears the list of pinned messages in the forum thread
// 
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Thread chat ID - forum
// ThreadID - String, Number - Thread ID. Main if not filled - topic
// 
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Telegram
Function ClearThreadPinnedMessagesList(Val Token, Val ChatID, Val ThreadID = "") Export
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetLine(ThreadID);
    
    Parameters = New Structure;
    OPI_Tools.AddField("chat_id" , ChatID, "String", Parameters);
    OPI_Tools.AddField("message_thread_id", ThreadID, "String", Parameters);
    
    If ValueIsFilled(ThreadID) Then
        Method = "/unpinAllForumTopicMessages";
    Else
        Method = "/unpinAllGeneralForumTopicMessages";
    EndIf;
        
    URL = "api.telegram.org/bot" + Token + Method;
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function SendFile(Val Token, Val ChatID, Val Text, Val File, Val View, Val Keyboard, Val Markup)

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetLine(View);

    Extension = "";
    Method = "";
    
    DetermineSendMethod(View, Method, Extension);
    ConvertFileData(File, Extension, View);
    OPI_Tools.ReplaceSpecialCharacters(Text, Markup);
    
    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode" , Markup , "String" , Parameters);
    OPI_Tools.AddField("caption" , Text , "String" , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard, "FileString", Parameters);
    
    AddChatIdentifier(ChatID, Parameters);

    FileStructure = New Structure;
    FileStructure.Insert(View + Extension, File);

    URL = "api.telegram.org/bot" + Token + Method;
    Response = OPI_Tools.PostMultipart(URL, Parameters, FileStructure, "mixed");

    Return Response;

EndFunction

Function ForumTopicManagement(Val Token
    , Val ChatID
    , Val Title = Undefined
    , Val IconID = Undefined
    , Val ThreadID = "")
    
    String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    
    Parameters = New Structure;
    OPI_Tools.AddField("name" , Title, String_, Parameters);
    OPI_Tools.AddField("chat_id" , ChatID , String_, Parameters);
    OPI_Tools.AddField("icon_custom_emoji_id", IconID , String_, Parameters);
    OPI_Tools.AddField("message_thread_id" , ThreadID , String_, Parameters);
    
    If ValueIsFilled(ThreadID) Then
        Method = "/editForumTopic";    
    Else    
        Method = "/createForumTopic";    
    EndIf;
    
    OPI_Tools.RemoveEmptyCollectionFields(Parameters);       
    Response = OPI_Tools.Get("api.telegram.org/bot" + Token + Method, Parameters);
    
    Return Response;

EndFunction

Function ManageForumThreadState(Val Token, Val ChatID, Val Status, Val ThreadID = "") 
        
    OPI_TypeConversion.GetLine(Token);
    
    If ValueIsFilled(ThreadID) Then
        Forum = "Forum";
    Else
        Forum = "GeneralForum";
    EndIf;
    
    Method = DetermineForumManagementMethod(Status, Forum);
    
    Parameters = New Structure;
    OPI_Tools.AddField("chat_id" , ChatID, "String", Parameters);
    OPI_Tools.AddField("message_thread_id", ThreadID, "String", Parameters);
   
    URL = "api.telegram.org/bot" + Token + Method;
    Response = OPI_Tools.Get(URL, Parameters);

    Return Response;
    
EndFunction

Function ManageMainTopicVisibility(Val Token, Val ChatID, Val Hide)
    
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetBoolean(Hide);

    If Hide Then
        Method = "/hideGeneralForumTopic";
    Else
        Method = "/unhideGeneralForumTopic";
    EndIf;
    
    Parameters = New Structure;
    OPI_Tools.AddField("chat_id", ChatID, "String", Parameters);
    
    URL = "api.telegram.org/bot" + Token + Method;
    Response = OPI_Tools.Get(URL, Parameters);
    
    Return Response;

EndFunction                 

Function DetermineForumManagementMethod(Val Status, Val Forum) 
    
    Open = 1;
    Close = 2;
    Delete = 3;
    
    If Status = Open Then 
        Method = "/reopen" + Forum + "Topic";
    ElsIf Status = Close Then
        Method = "/close" + Forum + "Topic";
    ElsIf Status = Delete Then
        Method = "/deleteForumTopic";
    Else 
        Raise "Incorrect forum management status";
    EndIf;
    
    Return Method;

EndFunction

Function CreateTallKeyboard(Val ButtonArray)
    
    Strings = New Array;
    
    For Each Button In ButtonArray Do
        Buttons = New Array;
        Button = OPI_Tools.NumberToString(Button);
        Buttons.Add(New Structure("text,callback_data", Button, Button));
        Strings.Add(Buttons);
    EndDo;

    Return Strings;
    
EndFunction

Function CreateLongKeyboard(Val ButtonArray)
    
    Strings = New Array;
    Buttons = New Array;
    
    For Each Button In ButtonArray Do
        Button = OPI_Tools.NumberToString(Button);
        Buttons.Add(New Structure("text,callback_data", Button, Button));
    EndDo;
    
    Strings.Add(Buttons);
    
    Return Strings;

EndFunction

Procedure FormMediaArray(Val FileMapping, Val Text, FileStructure, Media)
    
    Counter = 0;
    
    OPI_TypeConversion.GetCollection(FileMapping);
    OPI_TypeConversion.GetLine(Text);
    
    If TypeOf(FileMapping) <> Type("Map") Then
        // !OInt RaiseException("Failed to get information from json media!");
        Return;
    EndIf;
   
    For Each CurrentFile In FileMapping Do
        
        If Not TypeOf(CurrentFile.Key) = Type("BinaryData") Then
            
            Binary = CurrentFile.Key;
            OPI_TypeConversion.GetBinaryData(Binary);
            
            ThisFile = New File(CurrentFile.Key);           
            MediaName = CurrentFile.Value 
                + String(Counter) 
                + ?(CurrentFile.Value = "document", ThisFile.Extension, "");
                
            FullMediaName = StrReplace(MediaName, ".", "___");
            
        Else
            Binary = CurrentFile.Key;
            MediaName = CurrentFile.Value + String(Counter);
            FullMediaName = MediaName;
        EndIf;
        
        FileStructure.Insert(FullMediaName, Binary);
        
        MediaStructure = New Structure;
        MediaStructure.Insert("type" , CurrentFile.Value);
        MediaStructure.Insert("media", "attach://" + MediaName);
        
        If Counter = 0 Then
            MediaStructure.Insert("caption", Text);
        EndIf;
        
        Media.Add(MediaStructure);
        
        Counter = Counter + 1;
        
    EndDo;

    Media = OPI_Tools.JSONString(Media);
    
EndProcedure

Procedure AddChatIdentifier(Val ChatID, Parameters)
    
    ChatID = OPI_Tools.NumberToString(ChatID);
    ChatArray = StrSplit(ChatID, "*", False);
    
    If ChatArray.Count() > 1 Then
        
        ChatID = ChatArray[0];
        ThreadID = ChatArray[1];
        
        Parameters.Insert("message_thread_id", ThreadID);
        
    EndIf;
    
    Parameters.Insert("chat_id", ChatID);

EndProcedure

Procedure DetermineSendMethod(Val View, Method, Extension)
    
    If View = "photo" Then
        Method = "/sendPhoto";
    ElsIf View = "video" Then
        Method = "/sendVideo";
    ElsIf View = "audio" Then
        Method = "/sendAudio";
    ElsIf View = "document" Then
        Method = "/sendDocument";
    ElsIf View = "animation" Then
        Method = "/sendAnimation";
        Extension = ".gif";
    Else
        Raise "Incorrect sending view";
    EndIf;

EndProcedure

Procedure ConvertFileData(File, Extension, View)
    
    If Not TypeOf(File) = Type("BinaryData") Then
        
        CurrentFile = New File(File);
        Extension = ?(View = "document", CurrentFile.Extension, Extension);
        OPI_TypeConversion.GetBinaryData(File);
        
    EndIf;

    Extension = StrReplace(Extension, ".", "___");
    
EndProcedure

#EndRegion
