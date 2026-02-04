// OneScript: ./OInt/core/Modules/OPI_Viber.os
// Lib: Viber
// CLI: viber
// Keywords: viber

// DocsCategory: Messenger
// DocsNameRU: Viber
// DocsNameEN: Viber

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

#Region SettingsAndInformation

// Set Webhook
// IMPORTANT: Setting up Webhook is mandatory according to Viber rules. You need to have a free URL for this.,
// which will return 200 and a genuine SSL certificate. If there is a certificate and the database is published
// on the server - you can use an HTTP service. Information about new messages will also be sent there
// Viber periodically knocks on the Webhook address, so if it is inactive, everything will stop working
//
// Parameters:
// Token - String - Viber Token - token
// URL - String - URL for setting up Webhook - url
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function SetWebhook(Val Token, Val URL) Export

    Parameters = New Structure;
    OPI_Tools.AddField("url"        , URL  , "String", Parameters);
    OPI_Tools.AddField("auth_token" , Token, "String", Parameters);

    Return OPI_HTTPRequests.PostWithBody("https://chatapi.viber.com/pa/set_webhook", Parameters);

EndFunction

// Get channel information
// Here you can get the channel's user IDs. Bot IDs need to be obtained from the Webhook arrivals
// The user ID from channel information is not suitable for sending messages through the bot - they are different
//
// Parameters:
// Token - String - Token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function GetChannelInformation(Val Token) Export

    URL = "https://chatapi.viber.com/pa/get_account_info";
    Return OPI_HTTPRequests.Get(URL, , TokenInHeaders(Token));

EndFunction

// Get user data
// Gets user information by ID
//
// Parameters:
// Token - String - Token - token
// UserID - String, Number - Viber User ID - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function GetUserData(Val Token, Val UserID) Export

    URL = "https://chatapi.viber.com/pa/get_user_details";

    Parameters = New Structure;
    OPI_Tools.AddField("id", UserID, "String", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, TokenInHeaders(Token));

    Return Response;

EndFunction

// Get online users
// Gets the status of a user or multiple users by ID
//
// Parameters:
// Token - String - Viber Token - token
// UserIDs - String,Number,Array of String,Number - Viber User(s) ID - users
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function GetOnlineUsers(Val Token, Val UserIDs) Export

    URL = "https://chatapi.viber.com/pa/get_online";

    Parameters = New Structure;
    OPI_Tools.AddField("ids", UserIDs, "Collection", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, TokenInHeaders(Token));

    Return Response;

EndFunction

#EndRegion

#Region MessageSending

// Send text message
// Sends a text message to a chat or channel
//
// Parameters:
// Token - String - Token - token
// Text - String - Message text - text
// UserID - String, Number - User ID. For channel > administrator, for bot > recipient - user
// SendingToChannel - Boolean - Sending to channel or bot chat - ischannel
// Keyboard - Structure Of String - See CreateKeyboardFromArrayButton - keyboard
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function SendTextMessage(Val Token
    , Val Text
    , Val UserID
    , Val SendingToChannel
    , Val Keyboard = "") Export

    Return SendMessage(Token, "text", UserID, SendingToChannel, , Text, Keyboard);

EndFunction

// Send image
// Sends an image to a chat or channel
//
// Parameters:
// Token - String - Token - token
// URL - String - Image URL - picture
// UserID - String, Number - User ID. For channel > administrator, for bot > recipient - user
// SendingToChannel - boolean - Sending to channel or bot chat - ischannel
// Description - String - Image annotation - description
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function SendImage(Val Token, Val URL, Val UserID, Val SendingToChannel, Val Description = "") Export

    Return SendMessage(Token, "picture", UserID, SendingToChannel, URL, Description);

EndFunction

// Send file
// Sends a file (document) to a chat or channel
//
// Parameters:
// Token - String - Token - token
// URL - String - File URL - file
// UserID - String, Number - User ID. For channel > administrator, for bot > recipient - user
// SendingToChannel - Boolean - Sending to channel or bot chat - ischannel
// Extension - String - File extension - ext
// Size - Number - File size. If not filled in > determined automatically by downloading the file - size
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function SendFile(Val Token
    , Val URL
    , Val UserID
    , Val SendingToChannel
    , Val Extension
    , Val Size = "") Export

    If Not ValueIsFilled(Size) Then

        Response = OPI_HTTPRequests.Get(URL);
        Size     = Response.Size();

    EndIf;

    String_   = "String";
    Extension = StrReplace(Extension, ".", "");

    Parameters = New Structure;
    OPI_Tools.AddField("URL"      , URL      , String_, Parameters);
    OPI_Tools.AddField("Size"     , Size     , String_, Parameters);
    OPI_Tools.AddField("Extension", Extension, String_, Parameters);

    Return SendMessage(Token, "file", UserID, SendingToChannel, Parameters);

EndFunction

// Send contact
// Sends a contact with a phone number to a chat or channel
//
// Parameters:
// Token - String - Token - token
// ContactName - String - Contact name - name
// PhoneNumber - String - Phone number - phone
// UserID - String, Number - User ID. For channel > administrator, for bot > recipient - user
// SendingToChannel - Boolean - Sending to channel or bot chat - ischannel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function SendContact(Val Token
    , Val ContactName
    , Val PhoneNumber
    , Val UserID
    , Val SendingToChannel) Export

    Parameters = New Structure;
    OPI_Tools.AddField("name"        , ContactName , "String", Parameters);
    OPI_Tools.AddField("phone_number", PhoneNumber , "String", Parameters);

    Return SendMessage(Token, "contact", UserID, SendingToChannel, Parameters);

EndFunction

// Send location
// Sends geographic coordinates to a chat or channel
//
// Parameters:
// Token - String - Token - token
// Latitude - String, Number - Geographic latitude - lat
// Longitude - String, Number - Geographic longitude - long
// UserID - String, Number - User ID. For channel > administrator, for bot > recipient - user
// SendingToChannel - Boolean - Sending to channel or bot chat - ischannel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function SendLocation(Val Token, Val Latitude, Val Longitude, Val UserID, Val SendingToChannel) Export

    Parameters = New Structure;
    OPI_Tools.AddField("lat", Latitude , "String", Parameters);
    OPI_Tools.AddField("lon", Longitude, "String", Parameters);

    Return SendMessage(Token, "location", UserID, SendingToChannel, Parameters);

EndFunction

// Send link
// Sends a URL with a preview to a chat or channel
//
// Parameters:
// Token - String - Token - token
// URL - String - SentLink - url
// UserID - String, Number - User ID. For channel > administrator, for bot > recipient - user
// SendingToChannel - Boolean - Sending to channel or bot chat - ischannel
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Viber
Function SendLink(Val Token, Val URL, Val UserID, Val SendingToChannel) Export

    Return SendMessage(Token, "url", UserID, SendingToChannel, URL);

EndFunction

// Create a keyboard from an array of buttons
// Returns a keyboard structure for messages
//
// Parameters:
// ButtonArray - Array of String - Array of buttons - buttons
// ButtonColor - String - HEX color of buttons with # at the beginning - color
//
// Returns:
// Structure - Create a keyboard from an array of buttons:
// * Buttons - Array of Structure - Array of formed buttons
// * Type - String - KeyboardType
Function CreateKeyboardFromArrayButton(Val ButtonArray, Val ButtonColor = "#2db9b9") Export

    OPI_TypeConversion.GetLine(ButtonColor);
    OPI_TypeConversion.GetCollection(ButtonArray);

    ArrayOfButtonStructures = New Array;
    KeyboardStructure       = New Structure;

    For Each ButtonText In ButtonArray Do

        ButtonStructure = New Structure;
        ButtonStructure.Insert("ActionType", "reply");
        ButtonStructure.Insert("ActionBody", ButtonText);
        ButtonStructure.Insert("Text"      , ButtonText);
        ButtonStructure.Insert("BgColor"   , ButtonColor);
        ButtonStructure.Insert("Columns"  , 3);

        ArrayOfButtonStructures.Add(ButtonStructure);

    EndDo;

    KeyboardStructure.Insert("Buttons", ArrayOfButtonStructures);
    KeyboardStructure.Insert("Type"   , "keyboard");

    Return KeyboardStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function SendMessage(Val Token
    , Val Type
    , Val UserID
    , Val IsChannel
    , Val Value    = ""
    , Val Text     = ""
    , Val Keyboard = "")

    OPI_TypeConversion.GetLine(Token);
    OPI_TypeConversion.GetLine(Type);
    OPI_TypeConversion.GetLine(UserID);
    OPI_TypeConversion.GetLine(Text);
    OPI_TypeConversion.GetBoolean(IsChannel);
    OPI_TypeConversion.GetCollection(Keyboard);

    ParametersStructure = ReturnStandardParameters();
    ParametersStructure.Insert("type", Type);

    If (Type = "text" Or Type = "picture") And ValueIsFilled(Text) Then
        ParametersStructure.Insert("text", Text);
    EndIf;

    If TypeOf(Keyboard) = Type("Structure") Then
        ParametersStructure.Insert("keyboard", Keyboard);
    EndIf;

    If ValueIsFilled(Value) Then

        If Type = "file" Then

            ParametersStructure.Insert("media"    , Value.URL);
            ParametersStructure.Insert("size"     , Value.Size);
            ParametersStructure.Insert("file_name", "File." + Value.Extension);

        ElsIf Type = "contact" Then
            ParametersStructure.Insert("contact"  , Value);
        ElsIf Type = "location" Then
            ParametersStructure.Insert("location" , Value);
        Else
            ParametersStructure.Insert("media"    , Value);
        EndIf;

    EndIf;

    If IsChannel Then
        ParametersStructure.Insert("from"    , UserID);
        URL = "https://chatapi.viber.com/pa/post";
    Else
        ParametersStructure.Insert("receiver", UserID);
        URL = "https://chatapi.viber.com/pa/send_message";
    EndIf;

    Response = OPI_HTTPRequests.PostWithBody(URL, ParametersStructure, TokenInHeaders(Token));

    Try
        Return OPI_Tools.JsonToStructure(Response.GetBodyAsBinaryData());
    Except
        Return Response;
    EndTry;

EndFunction

Function ReturnStandardParameters()

    SenderStructure = New Structure;
    SenderStructure.Insert("name"  , "Bot");
    SenderStructure.Insert("avatar", "");

    ParametersStructure = New Structure;
    ParametersStructure.Insert("sender"         , SenderStructure);
    ParametersStructure.Insert("min_api_version", 1);

    Return ParametersStructure;

EndFunction

Function TokenInHeaders(Val Token)

    OPI_TypeConversion.GetLine(Token);

    HeadersStructure = New Map;
    HeadersStructure.Insert("X-Viber-Auth-Token", Token);
    Return HeadersStructure;

EndFunction

#EndRegion

#Region Alternate

Function УстановитьWebhook(Val Токен, Val URL) Export
	Return SetWebhook(Токен, URL);
EndFunction

Function ПолучитьИнформациюОКанале(Val Токен) Export
	Return GetChannelInformation(Токен);
EndFunction

Function ПолучитьДанныеПользователя(Val Токен, Val IDПользователя) Export
	Return GetUserData(Токен, IDПользователя);
EndFunction

Function ПолучитьОнлайнПользователей(Val Токен, Val IDПользователей) Export
	Return GetOnlineUsers(Токен, IDПользователей);
EndFunction

Function ОтправитьТекстовоеСообщение(Val Токен, Val Текст, Val IDПользователя, Val ОтправкаВКанал, Val Клавиатура = "") Export
	Return SendTextMessage(Токен, Текст, IDПользователя, ОтправкаВКанал, Клавиатура);
EndFunction

Function ОтправитьКартинку(Val Токен, Val URL, Val IDПользователя, Val ОтправкаВКанал, Val Описание = "") Export
	Return SendImage(Токен, URL, IDПользователя, ОтправкаВКанал, Описание);
EndFunction

Function ОтправитьФайл(Val Токен, Val URL, Val IDПользователя, Val ОтправкаВКанал, Val Расширение, Val Размер = "") Export
	Return SendFile(Токен, URL, IDПользователя, ОтправкаВКанал, Расширение, Размер);
EndFunction

Function ОтправитьКонтакт(Val Токен, Val ИмяКонтакта, Val НомерТелефона, Val IDПользователя, Val ОтправкаВКанал) Export
	Return SendContact(Токен, ИмяКонтакта, НомерТелефона, IDПользователя, ОтправкаВКанал);
EndFunction

Function ОтправитьЛокацию(Val Токен, Val Широта, Val Долгота, Val IDПользователя, Val ОтправкаВКанал) Export
	Return SendLocation(Токен, Широта, Долгота, IDПользователя, ОтправкаВКанал);
EndFunction

Function ОтправитьСсылку(Val Токен, Val URL, Val IDПользователя, Val ОтправкаВКанал) Export
	Return SendLink(Токен, URL, IDПользователя, ОтправкаВКанал);
EndFunction

Function СформироватьКлавиатуруИзМассиваКнопок(Val МассивКнопок, Val ЦветКнопок = "#2db9b9") Export
	Return CreateKeyboardFromArrayButton(МассивКнопок, ЦветКнопок);
EndFunction

#EndRegion