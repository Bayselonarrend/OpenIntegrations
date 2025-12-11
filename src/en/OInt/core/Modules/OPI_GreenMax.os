// OneScript: ./OInt/core/Modules/OPI_GreenMax.os
// Lib: GreenMax
// CLI: greenmax
// Keywords: greenapi, max

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
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params
//@skip-check bsl-legacy-check-string-literal
//@skip-check doc-comment-collection-item-type

#Region Public

#Region Account

// Form access parameters
// Forms the structure of basic authorization data
//
// Note:
// More details in the API documentation: [Get access parameters to instance](@green-api.com/v3/docs/before-start/#parameters)
//
// Parameters:
// ApiUrl - String - API host link - api
// MediaUrl - String - Link to host API for sending files - media
// IdInstance - String - Unique instance number - id
// ApiTokenInstance - String - Instance access key - token
//
// Returns:
// Structure - Structure of access parameters
Function FormAccessParameters(Val ApiUrl, Val MediaUrl, Val IdInstance, Val ApiTokenInstance) Export

    String_ = "String";

    Parameters = New Structure;
    OPI_Tools.AddField("apiUrl"          , ApiUrl          , String_, Parameters);
    OPI_Tools.AddField("mediaUrl"        , MediaUrl        , String_, Parameters);
    OPI_Tools.AddField("idInstance"      , IdInstance      , String_, Parameters);
    OPI_Tools.AddField("apiTokenInstance", ApiTokenInstance, String_, Parameters);

    Return Parameters;

EndFunction

// Get account information
// Gets account information
//
// Note:
// Method at API documentation: [GetWaSettings](@green-api.com/v3/docs/api/account/GetWaSettings/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetAccountInformation(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "getAccountSettings");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Get instance settings
// Gets the current instance settings
//
// Note:
// Method at API documentation: [GetSettings](@green-api.com/v3/docs/api/account/GetSettings/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetInstanceSettings(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "getSettings");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Set instance settings
// Sets the instance settings
//
// Note
// Method at API documentation: [SetSettings](@green-api.com/v3/docs/api/account/SetSettings/)
//
// Parameters:
// Settings - Structure Of KeyAndValue - Instance settings. See GetInstanceSettingsStructure - settings
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetInstanceSettings(Val Settings, Val AccessParameters) Export

    OPI_TypeConversion.GetKeyValueCollection(Settings);

    URL      = FormPrimaryURL(AccessParameters, "setSettings");
    Response = OPI_HTTPRequests.PostWithBody(URL, Settings);

    Return Response;

EndFunction

// Get authorization code
// Sends an SMS to the specified number to obtain a confirmation code
//
// Note:
// Method at API documentation: [StartAuthorization](@green-api.com/v3/docs/api/account/StartAuthorization/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// PhoneNumber - String, Number - Phone number without + - phone
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetAuthorizationCode(Val AccessParameters, Val PhoneNumber) Export

    OPI_TypeConversion.GetLine(PhoneNumber);

    PhoneNumber = StrReplace(PhoneNumber, "+", "");

    Parameters = New Structure;
    OPI_Tools.AddField("phoneNumber", PhoneNumber, "Number", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "startAuthorization");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send authorization code
// Authorizes the instance using the access code from SMS
//
// Note:
// Method at API documentation: [SendAuthorizationCode](@green-api.com/v3/docs/api/account/SendAuthorizationCode/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// AuthCode - String - Authorization code - code
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendAuthorizationCode(Val AccessParameters, Val AuthCode) Export

    Parameters = New Structure;

    OPI_Tools.AddField("code", AuthCode, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendAuthorizationCode");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get instance status
// Gets instance status
//
// Note:
// Method at API documentation: [GetStateInstance](@green-api.com/v3/docs/api/account/GetStateInstance/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetInstanceStatus(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "getStateInstance");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Set profile picture
// Sets a new profile picture
//
// Note:
// Method at API documentation: [SetProfilePicture](@green-api.com/v3/docs/api/account/SetProfilePicture/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Image - BinaryData, String - Profile picture - picture
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetProfilePicture(Val AccessParameters, Val Image) Export

    OPI_TypeConversion.GetBinaryData(Image);

    PictureMap = New Map();
    PictureMap.Insert("file|file.jpg", Image);

    URL      = FormPrimaryURL(AccessParameters, "setProfilePicture");
    Response = OPI_HTTPRequests.PostMultipart(URL, , PictureMap);

    Return Response;

EndFunction

// Logout instance
// Unlogging the instance
//
// Note:
// Method at API documentation: [Logout](@green-api.com/v3/docs/api/account/Logout/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function LogoutInstance(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "logout");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Reboot instance
// Restarts the instance
//
// Note:
// Method at API documentation: [Reboot](@green-api.com/v3/docs/api/account/Reboot/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function RebootInstance(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "reboot");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Check account
// Checks the existence of a Max account by phone number
//
// Note:
// Method at API documentation: [CheckAccount](@green-api.com/v3/docs/api/service/CheckAccount/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// PhoneNumber - String, Number - Phone number for verification without + - phone
// IgnoreCache - Boolean - Ignore cache on repeated verification request - force
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function CheckAccount(Val AccessParameters, Val PhoneNumber, Val IgnoreCache = False) Export

    OPI_TypeConversion.GetLine(PhoneNumber);

    PhoneNumber = StrReplace(PhoneNumber, "+", "");

    Parameters = New Structure;
    OPI_Tools.AddField("phoneNumber", PhoneNumber , "Number" , Parameters);
    OPI_Tools.AddField("force"      , IgnoreCache , "Boolean", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "checkAccount");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get contact list
// Gets account contact list
//
// Note:
// Method at API documentation: [GetContacts](@green-api.com/v3/docs/api/service/GetContacts/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Count - Number - Contact count to retrieve. All if not specified - count
//
// Returns:
// Array Of Map - serialized JSON response from Green API
Function GetContactList(Val AccessParameters, Val Count = Undefined) Export

    Parameters = New Structure;
    OPI_Tools.AddField("count", Count, "Number" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getContacts");
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get contact information
// Gets information about the selected contact
//
// Note:
// Method at API documentation: [GetContactInfo](@green-api.com/v3/docs/api/service/GetContactInfo/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetContactInformation(Val AccessParameters, Val ChatID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId", ChatID , "String" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getContactInfo");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get chat list
// Gets account chat list
//
// Note:
// Method at API documentation: [GetChats](@green-api.com/v3/docs/api/service/GetChats/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Array Of Map - serialized JSON response from Green API
Function GetChatList(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "getChats");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Get chat avatar
// Gets chat image URL
//
// Note:
// Method at API documentation: [GetAvatar](@green-api.com/v3/docs/api/service/GetAvatar/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetChatAvatar(Val AccessParameters, Val ChatID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId", ChatID , "String" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getAvatar");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get instance settings structure
// Gets the structure template for instance settings
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Structure of instance settings
Function GetInstanceSettingsStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    SettingsStructure = New Structure;

    SettingsStructure.Insert("webhookUrl"                       , "<URL for notification sending>");
    SettingsStructure.Insert("webhookUrlToken"                  , "<a token to access your notification server, if required>");
    SettingsStructure.Insert("delaySendMessagesMilliseconds"    , "<message sending interval in milliseconds>");
    SettingsStructure.Insert("markIncomingMessagesReaded"       , "<mark incoming messages as read: yes, no>");
    SettingsStructure.Insert("markIncomingMessagesReadedOnReply", "<mark incoming messages as read when sending a message to chat: yes, no>");
    SettingsStructure.Insert("outgoingWebhook"                  , "<receive notifications about the send/deliver/read status of outgoing messages: yes, no>");
    SettingsStructure.Insert("outgoingMessageWebhook"           , "<receive notifications of messages sent from phone: yes, no>");
    SettingsStructure.Insert("outgoingAPIMessageWebhook"        , "<receive notifications about messages sent via API: yes, no>");
    SettingsStructure.Insert("stateWebhook"                     , "<receive notifications about changes in the authorization state of the instance: yes, no>");
    SettingsStructure.Insert("incomingWebhook"                  , "<receive notifications of incoming messages and files: yes, no>");

    If Clear Then
        SettingsStructure = OPI_Tools.ClearCollectionRecursively(SettingsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

#EndRegion

#Region GroupManagement

// Create group
// Creates a new group chat with the specified name
//
// Note:
// Method at API documentation: [CreateGroup](@green-api.com/v3/docs/api/groups/CreateGroup/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Name - String - Group name - name
// Members - Array Of String, String - Array of group member IDs or a single ID - members
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function CreateGroup(Val AccessParameters, Val Name, Val Members) Export

    Parameters = New Structure;
    OPI_Tools.AddField("groupName", Name, "String", Parameters);

    If ValueIsFilled(Members) Then
        OPI_Tools.AddField("chatIds", Members, "Array", Parameters);
    Else
        Parameters.Insert("chatIds", New Array);
    EndIf;

    URL      = FormPrimaryURL(AccessParameters, "createGroup");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get group information
// Gets information about the group chat
//
// Note:
// Method at API documentation: [GetGroupData](@green-api.com/v3/docs/api/groups/GetGroupData/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetGroupInformation(Val AccessParameters, Val ChatID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId" , ChatID , "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getGroupData");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update group name
// Change group chat name
//
// Note:
// Method at API documentation: [UpdateGroupName](@green-api.com/v3/docs/api/groups/UpdateGroupName/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
// Name - String - New chat name - name
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function UpdateGroupName(Val AccessParameters, Val ChatID, Val Name) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId"   , ChatID , "String", Parameters);
    OPI_Tools.AddField("groupName", Name   , "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "updateGroupName");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Set group picture
// Sets the image as the group chat avatar
//
// Note:
// Method at API documentation: [SetGroupPicture](@green-api.com/v3/docs/api/groups/SetGroupPicture/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
// Image - String, BinaryData - Image in jpg format - picture
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetGroupPicture(Val AccessParameters, Val ChatID, Val Image) Export

    OPI_TypeConversion.GetBinaryData(Image);

    PictureMap = New Map();
    PictureMap.Insert("file|file.jpg", Image);

    Parameters = New Structure;
    OPI_Tools.AddField("chatId", ChatID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "setGroupPicture");
    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, PictureMap);

    Return Response;

EndFunction

// Change group settings
// Changes selected group chat settings
//
// Note:
// Method at API documentation: [UpdateGroupSettings](@green-api.com/v3/docs/api/groups/UpdateGroupSettings/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
// Settings - Structure Of KeyAndValue - Group chat settings. See GetGroupSettingsStructure - set
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function ChangeGroupSettings(Val AccessParameters, Val ChatID, Val Settings) Export

    OPI_TypeConversion.GetKeyValueCollection(Settings);

    Parameters = New Structure;
    OPI_Tools.AddField("chatId", ChatID, "String", Parameters);

    For Each KeyValue In Settings Do
        OPI_Tools.AddField(KeyValue.Key, KeyValue.Value, "Current", Parameters);
    EndDo;

    URL      = FormPrimaryURL(AccessParameters, "updateGroupSettings");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add group member
// Adds a new member to the selected group chat
//
// Note:
// Method at API documentation: [AddGroupParticipant](@green-api.com/v3/docs/api/groups/AddGroupParticipant/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
// MemberID - String - Member ID for addition - member
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function AddGroupMember(Val AccessParameters, Val ChatID, Val MemberID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId"           , ChatID  , "String", Parameters);
    OPI_Tools.AddField("participantChatId", MemberID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "addGroupParticipant");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Remove group member
// Removes a member from the selected group chat
//
// Note:
// Method at API documentation: [RemoveGroupParticipant](@green-api.com/v3/docs/api/groups/RemoveGroupParticipant/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
// MemberID - String - Member ID for removal - member
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function RemoveGroupMember(Val AccessParameters, Val ChatID, Val MemberID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId"           , ChatID  , "String", Parameters);
    OPI_Tools.AddField("participantChatId", MemberID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "removeGroupParticipant");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Set admin rights
// Assigns administrator rights to the specified group chat member
//
// Note:
// Method at API documentation: [SetGroupAdmin](@green-api.com/v3/docs/api/groups/SetGroupAdmin/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
// MemberID - String - Member ID - member
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetAdminRights(Val AccessParameters, Val ChatID, Val MemberID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId"           , ChatID  , "String", Parameters);
    OPI_Tools.AddField("participantChatId", MemberID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "setGroupAdmin");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Revoke admin rights
// Revokes administrator rights from the specified group chat member
//
// Note:
// Method at API documentation: [RemoveAdmin](@green-api.com/v3/docs/api/groups/RemoveAdmin/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
// MemberID - String - Member ID - member
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function RevokeAdminRights(Val AccessParameters, Val ChatID, Val MemberID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId"           , ChatID  , "String", Parameters);
    OPI_Tools.AddField("participantChatId", MemberID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "removeAdmin");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Leave group
// Excludes the current account from the specified group
//
// Note:
// Method at API documentation: [LeaveGroup](@green-api.com/v3/docs/api/groups/LeaveGroup/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Group chat ID - chat
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function LeaveGroup(Val AccessParameters, Val ChatID) Export

    Parameters = New Structure;
    OPI_Tools.AddField("chatId", ChatID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "leaveGroup");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get group settings structure
// Returns the structure of group chat settings fields
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// AsMap - Boolean - True > returns settings fields as a mapping - map
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetGroupSettingsStructure(Val Clear = False, Val AsMap = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(AsMap);

    If AsMap Then
        Settings = New Map;
    Else
        Settings = New Structure;
    EndIf;

    Settings.Insert("allowParticipantsEditGroupSettings" , "<allow members to change group settings>");
    Settings.Insert("allowParticipantsPinMessages"       , "<allow members to pin messages>");
    Settings.Insert("allowParticipantsAddMembers"        , "<allow members to add new participants>");

    If Clear Then
        Settings = OPI_Tools.ClearCollectionRecursively(Settings);
    EndIf;

    //@skip-check constructor-function-return-section
    Return Settings;

EndFunction

#EndRegion

#Region MessageSending

// Send text message
// Sends a text message to the selected chat room
//
// Note:
// Method at API documentation: [SendMessage](@green-api.com/v3/docs/api/sending/SendMessage/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// Text - String - Message text - text
// TypingTime - Number - Time to show the typing indicator before sending (in ms.) - typing
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendTextMessage(Val AccessParameters, Val ChatID, Val Text, Val TypingTime = 0) Export

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"    , ChatID    , String_ , Parameters);
    OPI_Tools.AddField("message"   , Text      , String_ , Parameters);
    OPI_Tools.AddField("typingTime", TypingTime, "Number", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendMessage");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send file
// Sends the file to the selected chat room
//
// Note:
// Method at API documentation: [SendFileByUpload](@green-api.com/v3/docs/api/sending/SendFileByUpload/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// File - String, BinaryData - File data or filepath - file
// FileName - String - Name of the file with the extension - filename
// Description - String - Message text below the file - caption
// TypingTime - Number - Time to show typing indicator before sending (in ms.) - typing
// TypingType - String - Typing type: text, recording, video, image, file - ttype
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendFile(Val AccessParameters
    , Val ChatID
    , Val File
    , Val FileName
    , Val Description = ""
    , Val TypingTime = 0
    , Val TypingType = "file") Export

    OPI_TypeConversion.GetBinaryData(File);

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"    , ChatID      , String_ , Parameters);
    OPI_Tools.AddField("fileName"  , FileName    , String_ , Parameters);
    OPI_Tools.AddField("caption"   , Description , String_ , Parameters);
    OPI_Tools.AddField("typingTime", TypingTime  , "Number", Parameters);

    If ValueIsFilled(TypingTime) Then
        OPI_Tools.AddField("typingType", TypingType , String_, Parameters);
    EndIf;

    FileMapping = New Map();
    FileMapping.Insert(StrTemplate("file|%1", FileName), File);

    URL      = FormMediaURL(AccessParameters, "SendFileByUpload");
    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, FileMapping, "application/octet-stream");

    Return Response;

EndFunction

// Send file by URL
// Sends a file from web to the selected chat room
//
// Note:
// Method at API documentation: [SendFileByUrl](@green-api.com/v3/docs/api/sending/SendFileByUrl/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// FileURL - String - File URL - url
// FileName - String - Name of the file with the extension - filename
// Description - String - Message text below the file - caption
// TypingTime - Number - Time to show typing indicator before sending (in ms.) - typing
// TypingType - String - Typing type: text, recording, video, image, file - ttype
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendFileByURL(Val AccessParameters
    , Val ChatID
    , Val FileURL
    , Val FileName
    , Val Description = ""
    , Val TypingTime = 0
    , Val TypingType = "file") Export

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"     , ChatID      , String_ , Parameters);
    OPI_Tools.AddField("urlFile"    , FileURL     , String_ , Parameters);
    OPI_Tools.AddField("fileName"   , FileName    , String_ , Parameters);
    OPI_Tools.AddField("caption"    , Description , String_ , Parameters);
    OPI_Tools.AddField("typingTime" , TypingTime  , "Number", Parameters);

    If ValueIsFilled(TypingTime) Then
        OPI_Tools.AddField("typingType", TypingType , String_, Parameters);
    EndIf;

    URL      = FormPrimaryURL(AccessParameters, "sendFileByUrl");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region Notifications

// Get notification
// Gets the latest notification from the queue
//
// Note:
// To get the next notification, the current notification must be deleted
// Method at API documentation: [ReceiveNotification](@green-api.com/v3/docs/api/receiving/technology-http-api/ReceiveNotification/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Timeout - Number - Timeout for waiting for a notification if the queue is empty - timeout
// Delete - Boolean - Delete notification from the queue after retrieval - del
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetNotification(Val AccessParameters, Val Timeout = 5, Val Delete = False) Export

    OPI_TypeConversion.GetBoolean(Delete);

    URL = FormPrimaryURL(AccessParameters, "receiveNotification");

    Parameters = New Structure;
    OPI_Tools.AddField("receiveTimeout", Timeout, "Number", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters);

    If Delete Then

        NotificationID = Response["receiptId"];

        If ValueIsFilled(NotificationID) Then
            Response.Insert("deleting", DeleteNotification(AccessParameters, NotificationID));
        EndIf;

    EndIf;

    Return Response;

EndFunction

// Delete notification
// Deletes the specified notification from the queue
//
// Note:
// Method at API documentation: [DeleteNotification](@green-api.com/v3/docs/api/receiving/technology-http-api/DeleteNotification/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// NotificationID - Number - Notification ID - id
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function DeleteNotification(Val AccessParameters, Val NotificationID) Export

    OPI_TypeConversion.GetLine(NotificationID);

    URL = FormPrimaryURL(AccessParameters, "deleteNotification");
    URL = StrTemplate("%1/%2", URL, NotificationID);

    Response = OPI_HTTPRequests.Delete(URL);

    Return Response;

EndFunction

#EndRegion

#Region MessageHistory

// Get chat message history
// Gets the latest messages from the chat history
//
// Note:
// Method at API documentation: [GetChatHistory](@green-api.com/v3/docs/api/journals/GetChatHistory/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat ID - chat
// Count - Number - Number of messages to receive - count
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetChatMessageHistory(Val AccessParameters, Val ChatID, Val Count = 100) Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId", ChatID , "String" , Parameters);
    OPI_Tools.AddField("count" , Count  , "Number" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getChatHistory");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get chat message
// Gets information about the chat message by ID
//
// Note:
// Method at API documentation: [GetMessage](@green-api.com/v3/docs/api/journals/GetMessage/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat ID - chat
// MessageID - String - Message ID - message
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetChatMessage(Val AccessParameters, Val ChatID, Val MessageID) Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"   , ChatID   , "String" , Parameters);
    OPI_Tools.AddField("idMessage", MessageID, "String" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getMessage");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get incoming message log
// Gets the latest incoming messages of the instance
//
// Note:
// Method at API documentation: [LastIncomingMessages](@green-api.com/v3/docs/api/journals/LastIncomingMessages/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Period - Number - Time in minutes for which messages need to be received - span
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetIncomingMessageLog(Val AccessParameters, Val Period = 1440) Export

    Parameters = New Structure;

    OPI_Tools.AddField("minutes", Period, "Number", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "lastIncomingMessages");
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Get outgoing message log
// Gets the latest outgoing messages of the instance
//
// Note:
// Method at API documentation: [LastOutgoingMessages](@green-api.com/v3/docs/api/journals/LastOutgoingMessages/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Period - Number - Time in minutes for which messages need to be received - span
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetOutgoingMessageLog(Val AccessParameters, Val Period = 1440) Export

    Parameters = New Structure;

    OPI_Tools.AddField("minutes", Period, "Number", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "lastOutgoingMessages");
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Mark messages as read
// Marks messages in the chat as read
//
// Note:
// When specifying the message ID, all messages after the specified one will be marked as read
// Method at API documentation: [ReadChat](@green-api.com/v3/docs/api/marks/ReadChat/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat ID - chat
// MessageID - String - Message ID. All messages, unless specified - message
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function MarkMessagesAsRead(Val AccessParameters, Val ChatID, Val MessageID = "") Export

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"   , ChatID   , String_, Parameters);
    OPI_Tools.AddField("idMessage", MessageID, String_, Parameters);

    URL      = FormPrimaryURL(AccessParameters, "readChat");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region Queues

// Get outgoing message count
// Gets the number of messages in the outgoing queue
//
// Note:
// Method at API documentation: [GetMessagesCount](@green-api.com/v3/docs/api/queues/GetMessagesCount/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetOutgoingMessageCount(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "getMessagesCount");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Get outgoing message queue
// Gets the list of messages to be sent
//
// Note:
// Method at API documentation: [ShowMessagesQueue](@green-api.com/v3/docs/api/queues/ShowMessagesQueue/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetOutgoingMessageQueue(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "showMessagesQueue");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Clear outgoing message queue
// Clears the list of messages to be sent
//
// Note:
// Method at API documentation: [ClearMessagesQueue](@green-api.com/v3/docs/api/queues/ClearMessagesQueue/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function ClearOutgoingMessageQueue(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "clearMessagesQueue");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Get incoming notification count
// Gets the number of notifications in the incoming queue
//
// Note:
// Method at API documentation: [GetWebhooksCount](@green-api.com/v3/docs/api/queues/GetWebhooksCount/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetIncomingNotificationCount(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "getWebhooksCount");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Clear incoming notification queue
// Clears the incoming notification queue
//
// Note:
// Method at API documentation: [ClearWebhooksQueue](@green-api.com/v3/docs/api/queues/ClearWebhooksQueue/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function ClearIncomingNotificationQueue(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "clearWebhooksQueue");
    Response = OPI_HTTPRequests.Delete(URL);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function FormPrimaryURL(Val AccessParameters, Val Method)

    Return FormURL(AccessParameters, Method, "apiUrl");

EndFunction

Function FormMediaURL(Val AccessParameters, Val Method)

    Return FormURL(AccessParameters, Method, "mediaUrl");

EndFunction

Function FormURL(AccessParameters, Method, URLField)

    OPI_TypeConversion.GetKeyValueCollection(AccessParameters);
    OPI_TypeConversion.GetLine(Method);

    RequiredFields = StrSplit(URLField + ",idInstance,apiTokenInstance", ",");
    MissingFields  = OPI_Tools.FindMissingCollectionFields(AccessParameters, RequiredFields);

    If MissingFields.Count() > 0 Then
        Raise "Missing mandatory fields in access parameters!";
    EndIf;

    Url              = AccessParameters[URLField];
    IdInstance       = AccessParameters["idInstance"];
    ApiTokenInstance = AccessParameters["apiTokenInstance"];

    URL = StrTemplate("%1/waInstance%2/%3/%4", Url, IdInstance, Method, ApiTokenInstance);

    Return URL;

EndFunction

#EndRegion

#Region Alternate

Function СформироватьПараметрыДоступа(Val ApiUrl, Val MediaUrl, Val IdInstance, Val ApiTokenInstance) Export
	Return FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
EndFunction

Function ПолучитьИнформациюОбАккаунте(Val ПараметрыДоступа) Export
	Return GetAccountInformation(ПараметрыДоступа);
EndFunction

Function ПолучитьНастройкиИнстанса(Val ПараметрыДоступа) Export
	Return GetInstanceSettings(ПараметрыДоступа);
EndFunction

Function УстановитьНастройкиИнстанса(Val Настройки, Val ПараметрыДоступа) Export
	Return SetInstanceSettings(Настройки, ПараметрыДоступа);
EndFunction

Function ПолучитьКодАвторизации(Val ПараметрыДоступа, Val НомерТелефона) Export
	Return GetAuthorizationCode(ПараметрыДоступа, НомерТелефона);
EndFunction

Function ОтправитьКодАвторизации(Val ПараметрыДоступа, Val КодАвторизации) Export
	Return SendAuthorizationCode(ПараметрыДоступа, КодАвторизации);
EndFunction

Function ПолучитьСостояниеИнстанса(Val ПараметрыДоступа) Export
	Return GetInstanceStatus(ПараметрыДоступа);
EndFunction

Function УстановитьКартинкуПрофиля(Val ПараметрыДоступа, Val Картинка) Export
	Return SetProfilePicture(ПараметрыДоступа, Картинка);
EndFunction

Function РазлогинитьИнстанс(Val ПараметрыДоступа) Export
	Return LogoutInstance(ПараметрыДоступа);
EndFunction

Function ПерезапуститьИнстанс(Val ПараметрыДоступа) Export
	Return RebootInstance(ПараметрыДоступа);
EndFunction

Function ПроверитьАккаунт(Val ПараметрыДоступа, Val НомерТелефона, Val ИгнорироватьКэш = False) Export
	Return CheckAccount(ПараметрыДоступа, НомерТелефона, ИгнорироватьКэш);
EndFunction

Function ПолучитьСписокКонтактов(Val ПараметрыДоступа, Val Количество = Undefined) Export
	Return GetContactList(ПараметрыДоступа, Количество);
EndFunction

Function ПолучитьИнформациюОКонтакте(Val ПараметрыДоступа, Val IDЧата) Export
	Return GetContactInformation(ПараметрыДоступа, IDЧата);
EndFunction

Function ПолучитьСписокЧатов(Val ПараметрыДоступа) Export
	Return GetChatList(ПараметрыДоступа);
EndFunction

Function ПолучитьАватарЧата(Val ПараметрыДоступа, Val IDЧата) Export
	Return GetChatAvatar(ПараметрыДоступа, IDЧата);
EndFunction

Function ПолучитьСтруктуруНастроекИнстанса(Val Пустая = False) Export
	Return GetInstanceSettingsStructure(Пустая);
EndFunction

Function СоздатьГруппу(Val ПараметрыДоступа, Val Наименование, Val Участники) Export
	Return CreateGroup(ПараметрыДоступа, Наименование, Участники);
EndFunction

Function ПолучитьИнформациюОГруппе(Val ПараметрыДоступа, Val IDЧата) Export
	Return GetGroupInformation(ПараметрыДоступа, IDЧата);
EndFunction

Function ИзменитьИмяГруппы(Val ПараметрыДоступа, Val IDЧата, Val Наименование) Export
	Return UpdateGroupName(ПараметрыДоступа, IDЧата, Наименование);
EndFunction

Function УстановитьКартинкуГруппы(Val ПараметрыДоступа, Val IDЧата, Val Картинка) Export
	Return SetGroupPicture(ПараметрыДоступа, IDЧата, Картинка);
EndFunction

Function ИзменитьНастройкиГруппы(Val ПараметрыДоступа, Val IDЧата, Val Настройки) Export
	Return ChangeGroupSettings(ПараметрыДоступа, IDЧата, Настройки);
EndFunction

Function ДобавитьУчастникаГруппы(Val ПараметрыДоступа, Val IDЧата, Val IDУчастника) Export
	Return AddGroupMember(ПараметрыДоступа, IDЧата, IDУчастника);
EndFunction

Function УдалитьУчастникаГруппы(Val ПараметрыДоступа, Val IDЧата, Val IDУчастника) Export
	Return RemoveGroupMember(ПараметрыДоступа, IDЧата, IDУчастника);
EndFunction

Function НазначитьПраваАдминистратора(Val ПараметрыДоступа, Val IDЧата, Val IDУчастника) Export
	Return SetAdminRights(ПараметрыДоступа, IDЧата, IDУчастника);
EndFunction

Function ОтозватьПраваАдминистратора(Val ПараметрыДоступа, Val IDЧата, Val IDУчастника) Export
	Return RevokeAdminRights(ПараметрыДоступа, IDЧата, IDУчастника);
EndFunction

Function ВыйтиИзГруппы(Val ПараметрыДоступа, Val IDЧата) Export
	Return LeaveGroup(ПараметрыДоступа, IDЧата);
EndFunction

Function ПолучитьСтруктуруНастроекГруппы(Val Пустая = False, Val КакСоответствие = False) Export
	Return GetGroupSettingsStructure(Пустая, КакСоответствие);
EndFunction

Function ОтправитьТекстовоеСообщение(Val ПараметрыДоступа, Val IDЧата, Val Текст, Val ВремяНабора = 0) Export
	Return SendTextMessage(ПараметрыДоступа, IDЧата, Текст, ВремяНабора);
EndFunction

Function ОтправитьФайл(Val ПараметрыДоступа, Val IDЧата, Val Файл, Val ИмяФайла, Val Описание = "", Val ВремяНабора = 0, Val ТипНабора = "file") Export
	Return SendFile(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание, ВремяНабора, ТипНабора);
EndFunction

Function ОтправитьФайлПоURL(Val ПараметрыДоступа, Val IDЧата, Val URLФайла, Val ИмяФайла, Val Описание = "", Val ВремяНабора = 0, Val ТипНабора = "file") Export
	Return SendFileByURL(ПараметрыДоступа, IDЧата, URLФайла, ИмяФайла, Описание, ВремяНабора, ТипНабора);
EndFunction

Function ПолучитьУведомление(Val ПараметрыДоступа, Val Таймаут = 5, Val Удалять = False) Export
	Return GetNotification(ПараметрыДоступа, Таймаут, Удалять);
EndFunction

Function УдалитьУведомление(Val ПараметрыДоступа, Val IDУведомления) Export
	Return DeleteNotification(ПараметрыДоступа, IDУведомления);
EndFunction

Function ПолучитьИсториюСообщенийЧата(Val ПараметрыДоступа, Val IDЧата, Val Количество = 100) Export
	Return GetChatMessageHistory(ПараметрыДоступа, IDЧата, Количество);
EndFunction

Function ПолучитьСообщениеЧата(Val ПараметрыДоступа, Val IDЧата, Val IDСообщения) Export
	Return GetChatMessage(ПараметрыДоступа, IDЧата, IDСообщения);
EndFunction

Function ПолучитьЖурналВходящихСообщений(Val ПараметрыДоступа, Val Период = 1440) Export
	Return GetIncomingMessageLog(ПараметрыДоступа, Период);
EndFunction

Function ПолучитьЖурналИсходящихСообщений(Val ПараметрыДоступа, Val Период = 1440) Export
	Return GetOutgoingMessageLog(ПараметрыДоступа, Период);
EndFunction

Function ОтметитьСообщенияКакПрочитанные(Val ПараметрыДоступа, Val IDЧата, Val IDСообщения = "") Export
	Return MarkMessagesAsRead(ПараметрыДоступа, IDЧата, IDСообщения);
EndFunction

Function ПолучитьКоличествоСообщенийКОтправке(Val ПараметрыДоступа) Export
	Return GetOutgoingMessageCount(ПараметрыДоступа);
EndFunction

Function ПолучитьОчередьСообщенийКОтправке(Val ПараметрыДоступа) Export
	Return GetOutgoingMessageQueue(ПараметрыДоступа);
EndFunction

Function ОчиститьОчередьСообщенийКОтправке(Val ПараметрыДоступа) Export
	Return ClearOutgoingMessageQueue(ПараметрыДоступа);
EndFunction

Function ПолучитьКоличествоВходящихУведомлений(Val ПараметрыДоступа) Export
	Return GetIncomingNotificationCount(ПараметрыДоступа);
EndFunction

Function ОчиститьОчередьВходящихУведомлений(Val ПараметрыДоступа) Export
	Return ClearIncomingNotificationQueue(ПараметрыДоступа);
EndFunction

#EndRegion