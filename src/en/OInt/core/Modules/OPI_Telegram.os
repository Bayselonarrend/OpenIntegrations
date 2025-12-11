// OneScript: ./OInt/core/Modules/OPI_Telegram.os
// Lib: Telegram
// CLI: telegram
// Keywords: telegram

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
// BSLLS:UnreachableCode-off
// BSLLS:CommentedCode-off
// BSLLS:UsingServiceTag-off
// BSLLS:NumberOfParams-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region DataRetrievalAndSettings

// Get bot information
// Executes the request, returning basic bot information: name, id, ability to add the bot to groups, etc..
//
// Note:
// Method at API documentation: [getMe](@core.telegram.org/bots/api#getme)
//
// Parameters:
// Token - String - Bot token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function GetBotInformation(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    URL      = "api.telegram.org/bot" + Token + "/getMe";
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Get updates
// Executes a request, returning information about bot events. Used in polling mode
//
// Note:
// Method at API documentation: [getUpdates](@core.telegram.org/bots/api#getupdates)
//
// Parameters:
// Token - String - Bot token - token
// Timeout - Number - Waiting time for new events - timeout
// Offset - Number - Offset in the list of received messages - offset
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function GetUpdates(Val Token, Val Timeout = 0, Val Offset = "") Export

    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/getUpdates";

    Parameters = New Structure;
    OPI_Tools.AddField("timeout", Timeout , "String", Parameters);
    OPI_Tools.AddField("offset" , Offset  , "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);
    Return Response;

EndFunction

// Set Webhook
// Set webhook URL for bot event handling in webhook mode
//
// Note:
// Method at API documentation: [setWebhook](@core.telegram.org/bots/api#setwebhook)
//
// Parameters:
// Token - String - Bot token - token
// URL - String - Request handling address from Telegram (with https:) - url
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function SetWebhook(Val Token, Val URL) Export

    OPI_TypeConversion.GetLine(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("url", URL, "String", Parameters);

    URL      = "api.telegram.org/bot" + Token + "/setWebHook";
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Delete webhook
// Deletes the bot event handler URL for webhook operation
//
// Note:
// Method at API documentation: [deleteWebhook](@core.telegram.org/bots/api#deletewebhook)
//
// Parameters:
// Token - String - Bot token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function DeleteWebhook(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    URL      = "api.telegram.org/bot" + Token + "/deleteWebHook";
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Download file
// Download file from Telegram servers
//
// Note:
// Method at API documentation: [getFile](@core.telegram.org/bots/api#getfile)
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

    URL      = "api.telegram.org/bot" + Token + "/getFile";
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Path = Response[Result]["file_path"];

    If Not ValueIsFilled(Path) Then

        Ready = False;

        For N = 1 To 5 Do

            OPI_Tools.Pause(N);

            Response = OPI_HTTPRequests.Get(URL, Parameters);
            Path     = Response[Result]["file_path"];

            Ready = ValueIsFilled(Path);

            If Ready Then
                Break;
            EndIf;

        EndDo;

        If Not Ready Then
            Return Response;
        EndIf;

    EndIf;

    URL      = "api.telegram.org/file/bot" + Token + "/" + Path;
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Process Telegram Mini App data !NOCLI
// Processes Telegram Mini App data and determines its validity
//
// Parameters:
// DataString - String - query from Telegram.WebApp.initData - datastring
// Token - String - Bot token - token
//
// Returns:
// Map of String - Map of data with the result of verification in the passed field
Function ProcessTMAData(Val DataString, Val Token) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(DataString);

    If StrStartsWith(DataString, "?") Then
        DataString = Right(DataString, StrLen(DataString) - 1);
    EndIf;

    EncodingString = OPI_Tools.RequestParametersToMap(DataString);
    DataStructure  = New Map;

    For Each DataElement In EncodingString Do

        CurrentKey   = DecodeString(DataElement.Key, StringEncodingMethod.URLencoding);
        CurrentValue = DecodeString(DataElement.Value, StringEncodingMethod.URLencoding);

        DataStructure.Insert(CurrentKey, CurrentValue);

    EndDo;

    KeyString = "WebAppData";
    Hash      = "";
    BinaryKey = GetBinaryDataFromString(KeyString);

    Result = OPI_Cryptography.HMAC(BinaryKey, GetBinaryDataFromString(Token), "SHA256");

    TValue = New ValueTable;
    TValue.Columns.Add("Key");
    TValue.Columns.Add("Value");

    For Each Data In DataStructure Do

        NewLine       = TValue.Add();
        NewLine.Key   = Data.Key;
        NewLine.Value = Data.Value;

    EndDo;

    TValue.Sort("Key");

    ReturnMapping = New Map;
    DCS           = "";

    For Each DataString In TValue Do

        If DataString.Key <> "hash" And DataString.Key <> "cookie" Then
            DCS = DCS + DataString.Key + "=" + DataString.Value + Chars.LF;
            ReturnMapping.Insert(DataString.Key, DataString.Value);
        Else
            Hash = DataString.Value;
        EndIf;

    EndDo;

    DCS       = Left(DCS, StrLen(DCS) - 1);
    Signature = OPI_Cryptography.HMAC(Result, GetBinaryDataFromString(DCS), "SHA256");

    Final = GetHexStringFromBinaryData(Signature);

    If Final     = Upper(Hash) Then
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
// Note:
// Method at API documentation: [sendMessage](@core.telegram.org/bots/api#sendmessage)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// RepliedID - String, Number - Reply to message ID - reply
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function SendTextMessage(Val Token
    , Val ChatID
    , Val Text
    , Val Keyboard = ""
    , Val Markup = "Markdown"
    , Val RepliedID = 0) Export

    OPI_TypeConversion.GetLine(Token);
    PrepareString(Text, Markup);

    String_ = "String";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode"         , Markup   , String_      , Parameters);
    OPI_Tools.AddField("text"               , Text     , String_      , Parameters);
    OPI_Tools.AddField("reply_markup"       , Keyboard , "Collection" , Parameters);
    OPI_Tools.AddField("reply_to_message_id", RepliedID, "Number"     , Parameters);

    AddChatIdentifier(ChatID, Parameters);

    URL      = "api.telegram.org/bot" + Token + "/sendMessage";
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send image
// Sends an image to a chat or channel
//
// Note:
// Method at API documentation: [sendPhoto](@core.telegram.org/bots/api#sendphoto)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Image - BinaryData, String - Image file - picture
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
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
// Note:
// Method at API documentation: [sendVideo](@core.telegram.org/bots/api#sendvideo)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Video - BinaryData, String - Video file - video
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
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
// Note:
// Method at API documentation: [sendAudio](@core.telegram.org/bots/api#sendaudio)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Audio - BinaryData, String - Audio file - audio
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
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
// Note:
// Method at API documentation: [sendDocument](@core.telegram.org/bots/api#senddocument)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// Document - BinaryData, String - Document file - doc
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
// FileName - String - Custom displayed file name with extension, if necessary - filename
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function SendDocument(Val Token
    , Val ChatID
    , Val Text
    , Val Document
    , Val Keyboard = ""
    , Val Markup = "Markdown"
    , Val FileName = "") Export

    Return SendFile(Token, ChatID, Text, Document, "document", Keyboard, Markup, FileName);

EndFunction

// Send GIF
// Sends a GIF to a chat or channel
//
// Note:
// Method at API documentation: [sendAnimation](@core.telegram.org/bots/api#sendanimation)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// GIF - BinaryData, String - GIF file - gif
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
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
// Note:
// Method at API documentation: [sendMediaGroup](@core.telegram.org/bots/api#sendmediagroup)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Text - String - Message text - text
// FileMapping - Map of KeyAndValue - File collection: Key > File, Value > Media Type - media
// Keyboard - String - Keyboard. See FormKeyboardFromButtonArray - keyboard
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function SendMediaGroup(Val Token
    , Val ChatID
    , Val Text
    , Val FileMapping
    , Val Keyboard = ""
    , Val Markup = "Markdown") Export

    // FileMapping
    // Key - File, Value - Type
    // Types: audio, document, photo, video
    // Different types cannot be mixed!!

    String_ = "String";

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetCollection(FileMapping);

    PrepareString(Text, Markup);

    URL        = "api.telegram.org/bot" + Token + "/sendMediaGroup";
    Media      = New Array;
    Parameters = New Structure;

    AddChatIdentifier(ChatID, Parameters);
    ConvertFilesToMedia(FileMapping, Text, Media);

    OPI_Tools.AddField("parse_mode"  , Markup  , String_      , Parameters);
    OPI_Tools.AddField("caption"     , Text    , String_      , Parameters);
    OPI_Tools.AddField("media"       , Media   , String_      , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard, "Collection" , Parameters);

    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, FileMapping, "mixed");

    Return Response;

EndFunction

// Send location
// Sends location by geographic latitude and longitude to a chat or channel
//
// Note:
// Method at API documentation: [sendLocation](@core.telegram.org/bots/api#sendlocation)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Latitude - String, Number - Geographic latitude - lat
// Longitude - String, Number - Geographic longitude - long
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function SendLocation(Val Token, Val ChatID, Val Latitude, Val Longitude, Val Keyboard = "") Export

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);

    URL = "api.telegram.org/bot" + Token + "/sendLocation";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode"  , "Markdown" , String_     , Parameters);
    OPI_Tools.AddField("latitude"    , Latitude   , String_     , Parameters);
    OPI_Tools.AddField("longitude"   , Longitude  , String_     , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard   , "Collection", Parameters);

    AddChatIdentifier(ChatID, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Send contact
// Sends a contact with name and phone number
//
// Note:
// Method at API documentation: [sendContact](@core.telegram.org/bots/api#sendcontact)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Name - String - Contact name - name
// LastName - String - Contact last name - surname
// Phone - String - Contact phone number - phone
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function SendContact(Val Token, Val ChatID, Val Name, Val LastName, Val Phone, Val Keyboard = "") Export

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);

    URL = "api.telegram.org/bot" + Token + "/sendContact";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode"  , "Markdown", String_     , Parameters);
    OPI_Tools.AddField("first_name"  , Name      , String_     , Parameters);
    OPI_Tools.AddField("last_name"   , LastName  , String_     , Parameters);
    OPI_Tools.AddField("phone_number", Phone     , String_     , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard  , "Collection", Parameters);

    AddChatIdentifier(ChatID, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Send poll
// Sends a poll with answer options
//
// Note:
// Method at API documentation: [sendPoll](@core.telegram.org/bots/api#sendpoll)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Question - String - Poll question - question
// AnswersArray - Array of String - Array of answer options - options
// Anonymous - Boolean - Survey anonymity flag - anonymous
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function SendPoll(Val Token, Val ChatID, Val Question, Val AnswersArray, Val Anonymous = True) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetCollection(AnswersArray);

    OPI_TypeConversion.GetBoolean(Anonymous);

    URL = "api.telegram.org/bot" + Token + "/sendPoll";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown"  , "String"    , Parameters);
    OPI_Tools.AddField("question"  , Question    , "String"    , Parameters);
    OPI_Tools.AddField("options"   , AnswersArray, "Collection", Parameters);

    Parameters.Insert("is_anonymous", ?(Anonymous, 1, 0));
    AddChatIdentifier(ChatID, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Forward message
// Forwards a message between chats or within a chat
//
// Note:
// Method at API documentation: [forwardMessage](@core.telegram.org/bots/api#forwardmessage)
//
// Parameters:
// Token - String - Bot token - token
// OriginalID - String, Number - Original message ID - message
// FromID - String, Number - Chat ID of the original message - from
// ToID - String, Number - Target chat ID or ChatID*TopicID - to
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function ForwardMessage(Val Token, Val OriginalID, Val FromID, Val ToID) Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(OriginalID);
    OPI_TypeConversion.GetLine(FromID);
    OPI_TypeConversion.GetLine(ToID);

    URL = "api.telegram.org/bot" + Token + "/forwardMessage";

    Parameters = New Structure;
    OPI_Tools.AddField("from_chat_id", FromID    , "Number", Parameters);
    OPI_Tools.AddField("message_id"  , OriginalID, "Number", Parameters);

    AddChatIdentifier(ToID, Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Delete message
// Delete message from chat or channel
//
// Note:
// Method at API documentation: [deleteMessage](@core.telegram.org/bots/api#deletemessage)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - ID of message to delete - message
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function DeleteMessage(Val Token, Val ChatID, Val MessageID) Export

    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/deleteMessage";

    Parameters = New Structure;
    OPI_Tools.AddField("message_id", MessageID, "Number", Parameters);
    OPI_Tools.AddField("chat_id"   , ChatID   , "Number", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);
    Return Response;

EndFunction

// Replace message keyboard
// Replaces the message keyboard with a new one
//
// Note:
// Method at API documentation: [editMessageReplyMarkup](@core.telegram.org/bots/api#editmessagereplymarkup)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - ID of message to delete - message
// Keyboard - String, Structure Of KeyAndValue - Keyboard. See FormKeyboardFromButtonArray - keyboard
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function ReplaceMessageKeyboard(Val Token, Val ChatID, Val MessageID, Val Keyboard) Export

    OPI_TypeConversion.GetLine(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("message_id"  , MessageID, "Number"    , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard , "Collection", Parameters);

    AddChatIdentifier(ChatID, Parameters);

    URL      = "api.telegram.org/bot" + Token + "/editMessageReplyMarkup";
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Replace message text
// Replaces the message text with a new one
//
// Note:
// Method at API documentation: [editMessageText](@core.telegram.org/bots/api#editmessagetext)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - ID of message to delete - message
// Text - String - New message text - text
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function ReplaceMessageText(Val Token
    , Val ChatID
    , Val MessageID
    , Val Text
    , Val Markup = "") Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Text);

    PrepareString(Text, Markup);

    String_ = "String";

    Parameters = New Structure;
    OPI_Tools.AddField("message_id", MessageID, "Number", Parameters);
    OPI_Tools.AddField("text"      , Text     , String_ , Parameters);
    OPI_Tools.AddField("parse_mode", Markup   , String_ , Parameters);

    AddChatIdentifier(ChatID, Parameters);

    URL      = "api.telegram.org/bot" + Token + "/editMessageText";
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Replace message caption
// Replaces text in a message with media attachments
//
// Note:
// Method at API documentation: [editMessageCaption](@core.telegram.org/bots/api#editmessagecaption)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - ID of message to delete - message
// Description - String - New message description - caption
// Markup - String - Text processing type (HTML, Markdown, MarkdownV2) - parsemode
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function ReplaceMessageCaption(Val Token
    , Val ChatID
    , Val MessageID
    , Val Description
    , Val Markup = "") Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Description);

    PrepareString(Description, Markup);

    String_ = "String";

    Parameters = New Structure;
    OPI_Tools.AddField("message_id", MessageID   , "Number", Parameters);
    OPI_Tools.AddField("caption"   , Description , String_ , Parameters);
    OPI_Tools.AddField("parse_mode", Markup      , String_ , Parameters);

    AddChatIdentifier(ChatID, Parameters);

    URL      = "api.telegram.org/bot" + Token + "/editMessageCaption";
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Generate keyboard from array of buttons
// Generates a simple JSON keyboard from an array of buttons for a message or bottom panel
//
// Note:
// About keyboards in the API documentation: [InlineKeyboardMarkup](@core.telegram.org/bots/api#inlinekeyboardmarkup)
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
        ParameterStructure = New Structure("inline_keyboard,rows"    , Strings, 1);
    Else
        ParameterStructure = New Structure("keyboard,resize_keyboard", Strings, True);
    EndIf;

    ParameterStructure = OPI_Tools.JSONString(ParameterStructure, , False, False);

    Return ParameterStructure;

EndFunction

#EndRegion

#Region Administration

// Ban
// Bans a user in the selected chat
//
// Note:
// Method at API documentation: [banChatMember](@core.telegram.org/bots/api#banchatmember)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// UserID - String, Number - Target user ID - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function Ban(Val Token, Val ChatID, Val UserID) Export

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/banChatMember";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown" , String_ , Parameters);
    OPI_Tools.AddField("chat_id"   , ChatID     , "Number", Parameters);
    OPI_Tools.AddField("user_id"   , UserID     , "Number", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Unban
// Unbans a previously banned user
//
// Note:
// Method at API documentation: [unbanChatMember](@core.telegram.org/bots/api#unbanchatmember)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// UserID - String, Number - Target user ID - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function Unban(Val Token, Val ChatID, Val UserID) Export

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/unbanChatMember";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode"    , "Markdown" , String_  , Parameters);
    OPI_Tools.AddField("chat_id"       , ChatID     , "Number" , Parameters);
    OPI_Tools.AddField("user_id"       , UserID     , "Number" , Parameters);
    OPI_Tools.AddField("only_if_banned", False      , "Boolean", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Create invitation link
// Creates a link for joining a closed chat
//
// Note:
// Method at API documentation: [createChatInviteLink](@core.telegram.org/bots/api#createchatinvitelink)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID or ChatID*TopicID - chat
// Title - String - Invitation title - title
// ExpirationDate - Date - Link expiration date (permanent if not specified) - expire
// UserLimit - Number - User limit (infinite if not specified) - limit
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function CreateInvitationLink(Val Token
    , Val ChatID
    , Val Title = ""
    , Val ExpirationDate = ""
    , Val UserLimit = 0) Export

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/createChatInviteLink";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode"   , "Markdown"     , String_  , Parameters);
    OPI_Tools.AddField("chat_id"      , ChatID         , "Number" , Parameters);
    OPI_Tools.AddField("name"         , Title          , String_  , Parameters);
    OPI_Tools.AddField("member_limit" , UserLimit      , "Number" , Parameters);
    OPI_Tools.AddField("expire_date"  , ExpirationDate , "Date"   , Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Pin message
// Pins a message in the chat header
//
// Note:
// Method at API documentation: [pinChatMessage](@core.telegram.org/bots/api#pinchatmessage)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - Target message ID - message
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function PinMessage(Val Token, Val ChatID, Val MessageID) Export

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/pinChatMessage";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode"          , "Markdown" , String_  , Parameters);
    OPI_Tools.AddField("chat_id"             , ChatID     , "Number" , Parameters);
    OPI_Tools.AddField("message_id"          , MessageID  , "Number" , Parameters);
    OPI_Tools.AddField("disable_notification", False      , "Boolean", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Unpin message
// Unpins a message in the chat header
//
// Note:
// Method at API documentation: [unpinChatMessage](@core.telegram.org/bots/api#unpinchatmessage)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID - chat
// MessageID - String, Number - Target message ID - message
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function UnpinMessage(Val Token, Val ChatID, Val MessageID) Export

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/unpinChatMessage";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown" , String_ , Parameters);
    OPI_Tools.AddField("chat_id"   , ChatID     , "Number", Parameters);
    OPI_Tools.AddField("message_id", MessageID  , "Number", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get participant count
// Gets the total number of chat participants
//
// Note:
// Method at API documentation: [getChatMemberCount](@core.telegram.org/bots/api#getchatmembercount)
//
// Parameters:
// Token - String - Bot token - token
// ChatID - String, Number - Target chat ID - chat
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function GetParticipantCount(Val Token, Val ChatID) Export

    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/getChatMemberCount";

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode", "Markdown" , "String" , Parameters);
    OPI_Tools.AddField("chat_id"   , ChatID     , "Number" , Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region ForumTopicManagement

// Get avatar icon list
// Gets the mapping of Emoji IDs for setting as forum theme icons
//
// Note:
// Method at API documentation: [getForumTopicIconStickers](@core.telegram.org/bots/api#getforumtopiciconstickers)
//
// Parameters:
// Token - String - Token - token
//
// Returns:
// Map Of KeyAndValue - Key > ID, Value > Emoji
Function GetAvatarIconList(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    Result   = "result";
    URL      = "api.telegram.org/bot" + Token + "/getForumTopicIconStickers";
    Response = OPI_HTTPRequests.Get(URL);
    Icons    = Response[Result];

    If Not ValueIsFilled(Icons) Then
        Return Response;
    EndIf;

    Collection = New Map;

    For Each Icon In Icons Do
        Collection.Insert(Icon["custom_emoji_id"], Icon["emoji"]);
    EndDo;

    Return Collection;

EndFunction

// Create forum topic
// Creates a new topic in the group with theme functionality enabled
//
// Note:
// Method at API documentation: [createForumTopic](@core.telegram.org/bots/api#createforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic creation chat ID - forum
// Title - String - Topic title - title
// IconID - String - See GetAvatarIconList - icon
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function CreateForumTopic(Val Token, Val ChatID, Val Title, Val IconID = "") Export

    Return ForumTopicManagement(Token, ChatID, Title, IconID);

EndFunction

// Edit forum topic
// Creates a new topic in the group with theme functionality enabled
//
// Note:
// Method at API documentation: [editForumTopic](@core.telegram.org/bots/api#editforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic creation chat ID - forum
// TopicID - String, Number - Topic ID - topic
// Title - String - New title - title
// IconID - String - See GetAvatarIconList - icon
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function EditForumTopic(Val Token
    , Val ChatID
    , Val TopicID
    , Val Title = Undefined
    , Val IconID = Undefined) Export

    Return ForumTopicManagement(Token, ChatID, Title, IconID, TopicID);
EndFunction

// Close forum topic
// Closes the topic for new messages
//
// Note:
// Method at API documentation: [closeForumTopic](@core.telegram.org/bots/api#closeforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic chat ID - forum
// TopicID - String, Number - Topic ID - topic
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function CloseForumTopic(Val Token, Val ChatID, Val TopicID = "") Export

    Return ManageForumTopicState(Token, ChatID, 2, TopicID);

EndFunction

// Open forum topic
// Reopens a previously closed forum topic
//
// Note:
// Method at API documentation: [reopenForumTopic](@core.telegram.org/bots/api#reopenforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic chat ID - forum
// TopicID - String, Number - Topic ID - topic
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function OpenForumTopic(Val Token, Val ChatID, Val TopicID = "") Export

    Return ManageForumTopicState(Token, ChatID, 1, TopicID);

EndFunction

// Delete forum topic
// Deletes a forum topic
//
// Note:
// Method at API documentation: [deleteForumTopic](@core.telegram.org/bots/api#deleteforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic chat ID - forum
// TopicID - String, Number - Topic ID - topic
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function DeleteForumTopic(Val Token, Val ChatID, Val TopicID) Export

    Return ManageForumTopicState(Token, ChatID, 3, TopicID);

EndFunction

// Hide main forum topic
// Hides the main forum topic
//
// Note:
// Method at API documentation: [hideGeneralForumTopic](@core.telegram.org/bots/api#hidegeneralforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic chat ID - forum
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function HideMainForumTopic(Val Token, Val ChatID) Export

    Return ManageMainTopicVisibility(Token, ChatID, True);

EndFunction

// Show main forum topic
// Shows a previously hidden main forum topic
//
// Note:
// Method at API documentation: [unhideGeneralForumTopic](@core.telegram.org/bots/api#unhidegeneralforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic chat ID - forum
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function ShowMainForumTopic(Val Token, Val ChatID) Export

    Return ManageMainTopicVisibility(Token, ChatID, False);

EndFunction

// Edit main forum topic name
// Edits the name of the main forum topic
//
// Note:
// Method at API documentation: [editGeneralForumTopic](@core.telegram.org/bots/api#editgeneralforumtopic)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic chat ID - forum
// Title - String - New main topic name - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function EditMainForumTopicName(Val Token, Val ChatID, Val Title) Export

    OPI_TypeConversion.GetLine(Token);

    URL = "api.telegram.org/bot" + Token + "/editGeneralForumTopic";

    Parameters = New Structure;
    OPI_Tools.AddField("chat_id", ChatID , "Number" , Parameters);
    OPI_Tools.AddField("name"   , Title  , "String" , Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Clear topics pinned messages list
// Clears the list of pinned messages in the forum topic
//
// Note:
// Method at API documentation: [unpinAllForumTopicMessages](@core.telegram.org/bots/api#unpinallforumtopicmessages)
//
// Parameters:
// Token - String - Token - token
// ChatID - String, Number - Topic chat ID - forum
// TopicID - String, Number - Topic ID. Main if not filled - topic
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Telegram
Function ClearTopicPinnedMessagesList(Val Token, Val ChatID, Val TopicID = "") Export

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetLine(TopicID);

    Parameters = New Structure;
    OPI_Tools.AddField("chat_id"          , ChatID , "String", Parameters);
    OPI_Tools.AddField("message_thread_id", TopicID, "String", Parameters);

    If ValueIsFilled(TopicID) Then
        Method = "/unpinAllForumTopicMessages";
    Else
        Method = "/unpinAllGeneralForumTopicMessages";
    EndIf;

    URL      = "api.telegram.org/bot" + Token + Method;
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function SendFile(Val Token
    , Val ChatID
    , Val Text
    , Val File
    , Val View
    , Val Keyboard
    , Val Markup
    , Val FileName = "")

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(ChatID);
    OPI_TypeConversion.GetLine(View);

    PrepareString(Text, Markup);

    If Not ValueIsFilled(FileName) Then
        FileName = ConvertFileData(File, View, "");
    Else
        OPI_TypeConversion.GetBinaryData(File);
    EndIf;

    FileName = View + "|" + FileName;

    Parameters = New Structure;
    OPI_Tools.AddField("parse_mode"  , Markup  , "String"    , Parameters);
    OPI_Tools.AddField("caption"     , Text    , "String"    , Parameters);
    OPI_Tools.AddField("reply_markup", Keyboard, "Collection", Parameters);

    AddChatIdentifier(ChatID, Parameters);

    FileMapping = New Map;
    FileMapping.Insert(FileName, File);

    Method   = DetermineSendMethod(View);
    URL      = "api.telegram.org/bot" + Token + Method;
    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, FileMapping, "mixed");

    Return Response;

EndFunction

Function ForumTopicManagement(Val Token
    , Val ChatID
    , Val Title   = Undefined
    , Val IconID  = Undefined
    , Val TopicID = "")

    String_ = "String";
    OPI_TypeConversion.GetLine(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("name"                , Title   , String_ , Parameters);
    OPI_Tools.AddField("chat_id"             , ChatID  , "Number", Parameters);
    OPI_Tools.AddField("icon_custom_emoji_id", IconID  , String_ , Parameters);
    OPI_Tools.AddField("message_thread_id"   , TopicID , "Number", Parameters);

    If ValueIsFilled(TopicID) Then
        Method = "/editForumTopic";
    Else
        Method = "/createForumTopic";
    EndIf;

    Response = OPI_HTTPRequests.Get("api.telegram.org/bot" + Token + Method, Parameters);

    Return Response;

EndFunction

Function ManageForumTopicState(Val Token, Val ChatID, Val Status, Val TopicID = "")

    OPI_TypeConversion.GetLine(Token);

    If ValueIsFilled(TopicID) Then
        Forum = "Forum";
    Else
        Forum = "GeneralForum";
    EndIf;

    Method = DetermineForumManagementMethod(Status, Forum);

    Parameters = New Structure;
    OPI_Tools.AddField("chat_id"          , ChatID , "Number", Parameters);
    OPI_Tools.AddField("message_thread_id", TopicID, "Number", Parameters);

    URL      = "api.telegram.org/bot" + Token + Method;
    Response = OPI_HTTPRequests.Get(URL, Parameters);

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

    URL      = "api.telegram.org/bot" + Token + Method;
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

Function DetermineForumManagementMethod(Val Status, Val Forum)

    Open   = 1;
    Close  = 2;
    Delete = 3;

    If Status    = Open Then
        Method   = "/reopen" + Forum + "Topic";
    ElsIf Status = Close Then
        Method   = "/close" + Forum + "Topic";
    ElsIf Status = Delete Then
        Method   = "/deleteForumTopic";
    Else
        Raise "Incorrect forum management status";
    EndIf;

    Return Method;

EndFunction

Function CreateTallKeyboard(Val ButtonArray)

    Strings = New Array;

    For Each Button In ButtonArray Do
        Buttons = New Array;
        Button  = OPI_Tools.NumberToString(Button);
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

Function DetermineSendMethod(Val View)

    If View    = "photo" Then
        Method = "/sendPhoto";
    ElsIf View = "video" Then
        Method = "/sendVideo";
    ElsIf View = "audio" Then
        Method = "/sendAudio";
    ElsIf View = "animation" Then
        Method = "/sendAnimation";
    Else
        Method = "/sendDocument";
    EndIf;

    Return Method;

EndFunction

Function ConvertFileData(File, View, Counter)

    FileName = "";

    If TypeOf(File) = Type("String") And View = "document" Then

        CurrentFile = New File(File);
        FileName    = CurrentFile.Name;

    EndIf;

    If Not ValueIsFilled(FileName) Then
        FileName = View + String(Counter);

        If View      = "animation" Then
            FileName = FileName + ".gif";
        EndIf;

    EndIf;

    OPI_TypeConversion.GetBinaryData(File);

    Return FileName;

EndFunction

Procedure ConvertFilesToMedia(FileMapping, Text, Media)

    OPI_TypeConversion.GetCollection(FileMapping);
    OPI_TypeConversion.GetLine(Text);

    If TypeOf(FileMapping) <> Type("Map") Then
        Raise("Failed to Retrieve Information from JSON media!!");
        Return;
    EndIf;

    TempMap = New Map;
    Counter = 0;

    For Each CurrentFile In FileMapping Do

        CurrentData = CurrentFile.Key;
        TypeOfMedia = CurrentFile.Value;

        MediaName = ConvertFileData(CurrentData, TypeOfMedia, Counter);

        TempMap.Insert(MediaName + "|" + MediaName, CurrentData);

        MediaStructure = New Structure;
        MediaStructure.Insert("type" , TypeOfMedia);
        MediaStructure.Insert("media", "attach://" + MediaName);

        If Counter = 0 Then
            MediaStructure.Insert("caption", Text);
        EndIf;

        Media.Add(MediaStructure);

        Counter = Counter + 1;

    EndDo;

    Media       = OPI_Tools.JSONString(Media);
    FileMapping = TempMap;

EndProcedure

Procedure AddChatIdentifier(Val ChatID, Parameters)

    ChatID    = OPI_Tools.NumberToString(ChatID);
    ChatArray = StrSplit(ChatID, "*", False);

    If ChatArray.Count() > 1 Then

        ChatID  = ChatArray[0];
        TopicID = ChatArray[1];

        OPI_TypeConversion.GetNumber(TopicID);
        Parameters.Insert("message_thread_id", TopicID);

    EndIf;

    Parameters.Insert("chat_id", ChatID);

EndProcedure

Procedure PrepareString(Text, Markup = "Markdown") Export

    OPI_TypeConversion.GetLine(Text);
    ReplaceSpecialCharacters(Text, Markup);

    Text = DecodeString(Text, StringEncodingMethod.URLInURLEncoding);

EndProcedure

Procedure ReplaceSpecialCharacters(Text, Markup) Export

    OPI_TypeConversion.GetLine(Markup);

    CharacterMapping = New Map;

    If Markup = "HTML" Then

        CharacterMapping.Insert("&", "&amp;");

    ElsIf Markup = "MarkdownV2" Then

        CharacterMapping.Insert("-", "\-");
        CharacterMapping.Insert("+", "\+");
        CharacterMapping.Insert("#", "\#");
        CharacterMapping.Insert("=", "\=");
        CharacterMapping.Insert("{", "\{");
        CharacterMapping.Insert("}", "\}");
        CharacterMapping.Insert(".", "\.");

    Else
        Return;
    EndIf;

    Marker = "╗█▓█╗";

    Text = StrReplace(Text, "\", Marker);

    For Each ArraySymbol In CharacterMapping Do
        Text = StrReplace(Text, ArraySymbol.Key, ArraySymbol.Value);
    EndDo;

    Text = StrReplace(Text, Marker + "\", "\");
    Text = StrReplace(Text, Marker      , "\");

EndProcedure

#EndRegion

#Region Alternate

Function ПолучитьИнформациюБота(Val Токен) Export
	Return GetBotInformation(Токен);
EndFunction

Function ПолучитьОбновления(Val Токен, Val Таймаут = 0, Val Смещение = "") Export
	Return GetUpdates(Токен, Таймаут, Смещение);
EndFunction

Function УстановитьWebhook(Val Токен, Val URL) Export
	Return SetWebhook(Токен, URL);
EndFunction

Function УдалитьWebhook(Val Токен) Export
	Return DeleteWebhook(Токен);
EndFunction

Function СкачатьФайл(Val Токен, Val IDФайла) Export
	Return DownloadFile(Токен, IDФайла);
EndFunction

Function ОбработатьДанныеTMA(Val СтрокаДанных, Val Токен) Export
	Return ProcessTMAData(СтрокаДанных, Токен);
EndFunction

Function ОтправитьТекстовоеСообщение(Val Токен, Val IDЧата, Val Текст, Val Клавиатура = "", Val Разметка = "Markdown", Val IDВходящего = 0) Export
	Return SendTextMessage(Токен, IDЧата, Текст, Клавиатура, Разметка, IDВходящего);
EndFunction

Function ОтправитьКартинку(Val Токен, Val IDЧата, Val Текст, Val Картинка, Val Клавиатура = "", Val Разметка = "Markdown") Export
	Return SendImage(Токен, IDЧата, Текст, Картинка, Клавиатура, Разметка);
EndFunction

Function ОтправитьВидео(Val Токен, Val IDЧата, Val Текст, Val Видео, Val Клавиатура = "", Val Разметка = "Markdown") Export
	Return SendVideo(Токен, IDЧата, Текст, Видео, Клавиатура, Разметка);
EndFunction

Function ОтправитьАудио(Val Токен, Val IDЧата, Val Текст, Val Аудио, Val Клавиатура = "", Val Разметка = "Markdown") Export
	Return SendAudio(Токен, IDЧата, Текст, Аудио, Клавиатура, Разметка);
EndFunction

Function ОтправитьДокумент(Val Токен, Val IDЧата, Val Текст, Val Документ, Val Клавиатура = "", Val Разметка = "Markdown", Val ИмяФайла = "") Export
	Return SendDocument(Токен, IDЧата, Текст, Документ, Клавиатура, Разметка, ИмяФайла);
EndFunction

Function ОтправитьГифку(Val Токен, Val IDЧата, Val Текст, Val Гифка, Val Клавиатура = "", Val Разметка = "Markdown") Export
	Return SendGif(Токен, IDЧата, Текст, Гифка, Клавиатура, Разметка);
EndFunction

Function ОтправитьМедиагруппу(Val Токен, Val IDЧата, Val Текст, Val СоответствиеФайлов, Val Клавиатура = "", Val Разметка = "Markdown") Export
	Return SendMediaGroup(Токен, IDЧата, Текст, СоответствиеФайлов, Клавиатура, Разметка);
EndFunction

Function ОтправитьМестоположение(Val Токен, Val IDЧата, Val Широта, Val Долгота, Val Клавиатура = "") Export
	Return SendLocation(Токен, IDЧата, Широта, Долгота, Клавиатура);
EndFunction

Function ОтправитьКонтакт(Val Токен, Val IDЧата, Val Имя, Val Фамилия, Val Телефон, Val Клавиатура = "") Export
	Return SendContact(Токен, IDЧата, Имя, Фамилия, Телефон, Клавиатура);
EndFunction

Function ОтправитьОпрос(Val Токен, Val IDЧата, Val Вопрос, Val МассивОтветов, Val Анонимный = True) Export
	Return SendPoll(Токен, IDЧата, Вопрос, МассивОтветов, Анонимный);
EndFunction

Function ПереслатьСообщение(Val Токен, Val IDОригинала, Val ОткудаID, Val КудаID) Export
	Return ForwardMessage(Токен, IDОригинала, ОткудаID, КудаID);
EndFunction

Function УдалитьСообщение(Val Токен, Val IDЧата, Val IDСообщения) Export
	Return DeleteMessage(Токен, IDЧата, IDСообщения);
EndFunction

Function ЗаменитьКлавиатуруСообщения(Val Токен, Val IDЧата, Val IDСообщения, Val Клавиатура) Export
	Return ReplaceMessageKeyboard(Токен, IDЧата, IDСообщения, Клавиатура);
EndFunction

Function ЗаменитьТекстСообщения(Val Токен, Val IDЧата, Val IDСообщения, Val Текст, Val Разметка = "") Export
	Return ReplaceMessageText(Токен, IDЧата, IDСообщения, Текст, Разметка);
EndFunction

Function ЗаменитьОписаниеСообщения(Val Токен, Val IDЧата, Val IDСообщения, Val Описание, Val Разметка = "") Export
	Return ReplaceMessageCaption(Токен, IDЧата, IDСообщения, Описание, Разметка);
EndFunction

Function СформироватьКлавиатуруПоМассивуКнопок(Val МассивКнопок, Val ПодСообщением = False, Val ОднаПодОдной = True) Export
	Return FormKeyboardFromButtonArray(МассивКнопок, ПодСообщением, ОднаПодОдной);
EndFunction

Function Бан(Val Токен, Val IDЧата, Val IDПользователя) Export
	Return Ban(Токен, IDЧата, IDПользователя);
EndFunction

Function Разбан(Val Токен, Val IDЧата, Val IDПользователя) Export
	Return Unban(Токен, IDЧата, IDПользователя);
EndFunction

Function СоздатьСсылкуПриглашение(Val Токен, Val IDЧата, Val Заголовок = "", Val ДатаИстечения = "", Val ЛимитПользователей = 0) Export
	Return CreateInvitationLink(Токен, IDЧата, Заголовок, ДатаИстечения, ЛимитПользователей);
EndFunction

Function ЗакрепитьСообщение(Val Токен, Val IDЧата, Val IDСообщения) Export
	Return PinMessage(Токен, IDЧата, IDСообщения);
EndFunction

Function ОткрепитьСообщение(Val Токен, Val IDЧата, Val IDСообщения) Export
	Return UnpinMessage(Токен, IDЧата, IDСообщения);
EndFunction

Function ПолучитьЧислоУчастников(Val Токен, Val IDЧата) Export
	Return GetParticipantCount(Токен, IDЧата);
EndFunction

Function ПолучитьСписокИконокАватаров(Val Токен) Export
	Return GetAvatarIconList(Токен);
EndFunction

Function СоздатьТемуФорума(Val Токен, Val IDЧата, Val Заголовок, Val IDИконки = "") Export
	Return CreateForumTopic(Токен, IDЧата, Заголовок, IDИконки);
EndFunction

Function ИзменитьТемуФорума(Val Токен, Val IDЧата, Val IDТемы, Val Заголовок = Undefined, Val IDИконки = Undefined) Export
	Return EditForumTopic(Токен, IDЧата, IDТемы, Заголовок, IDИконки);
EndFunction

Function ЗакрытьТемуФорума(Val Токен, Val IDЧата, Val IDТемы = "") Export
	Return CloseForumTopic(Токен, IDЧата, IDТемы);
EndFunction

Function ОткрытьТемуФорума(Val Токен, Val IDЧата, Val IDТемы = "") Export
	Return OpenForumTopic(Токен, IDЧата, IDТемы);
EndFunction

Function УдалитьТемуФорума(Val Токен, Val IDЧата, Val IDТемы) Export
	Return DeleteForumTopic(Токен, IDЧата, IDТемы);
EndFunction

Function СкрытьГлавнуюТемуФорума(Val Токен, Val IDЧата) Export
	Return HideMainForumTopic(Токен, IDЧата);
EndFunction

Function ПоказатьГлавнуюТемуФорума(Val Токен, Val IDЧата) Export
	Return ShowMainForumTopic(Токен, IDЧата);
EndFunction

Function ИзменитьИмяГлавнойТемыФорума(Val Токен, Val IDЧата, Val Заголовок) Export
	Return EditMainForumTopicName(Токен, IDЧата, Заголовок);
EndFunction

Function ОчиститьСписокЗакрепленныхСообщенийТемы(Val Токен, Val IDЧата, Val IDТемы = "") Export
	Return ClearTopicPinnedMessagesList(Токен, IDЧата, IDТемы);
EndFunction

Procedure ПодготовитьСтроку(Текст, Разметка = "Markdown") Export
	PrepareString(Текст, Разметка);
EndProcedure

Procedure ЗаменитьСпецСимволы(Текст, Разметка) Export
	ReplaceSpecialCharacters(Текст, Разметка);
EndProcedure

#EndRegion