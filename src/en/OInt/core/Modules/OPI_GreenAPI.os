// OneScript: ./OInt/core/Modules/OPI_GreenAPI.os
// Lib: GreenAPI
// CLI: greenapi
// Keywords: greenapi, whatsapp

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

#Region Public

#Region Account

// Form access parameters
// Forms the structure of basic authorization data
//
// Note
// More details in the API documentation: [Get access parameters to instance](@green-api.com/en/docs/before-start/#parameters)
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
// Note
// Method at API documentation: [GetWaSettings](@green-api.com/docs/api/account/GetWaSettings/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetAccountInformation(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "getWaSettings");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Get instance settings
// Gets the current instance settings
//
// Note
// Method at API documentation: [GetSettings](@green-api.com/docs/api/account/GetSettings/)
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
// Method at API documentation: [SetSettings](@green-api.com/docs/api/account/SetSettings/)
//
// Parameters:
// Settings - Structure Of KeyAndValue - Instance settings. See GetInstanceSettingsStructure - settings
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetInstanceSettings(Val Settings, Val AccessParameters) Export

    OPI_TypeConversion.GetKeyValueCollection(AccessParameters);
    OPI_TypeConversion.GetKeyValueCollection(Settings);

    URL      = FormPrimaryURL(AccessParameters, "setSettings");
    Response = OPI_HTTPRequests.PostWithBody(URL, Settings);

    Return Response;

EndFunction

// Get instance status
// Gets instance status
//
// Note
// Method at API documentation: [GetStateInstance](@green-api.com/docs/api/account/GetStateInstance/)
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

// Reboot instance
// Restarts the instance
//
// Note
// Method at API documentation: [Reboot](@green-api.com/docs/api/account/Reboot/)
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

// Logout instance
// Unlogging the instance
//
// Note
// Method at API documentation: [Logout](@green-api.com/docs/api/account/Logout/)
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

// Get QR
// Receives authorization QR code
//
// Note
// Method at API documentation: [QR](@green-api.com/docs/api/account/QR/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// BinaryData, Map Of KeyAndValue - QR code or error information
Function GetQR(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "qr");
    Response = OPI_HTTPRequests.Get(URL);

    Try

        If Response["type"] = "qrCode" Then
            Result          = Base64Value(Response["message"]);
        EndIf;

    Except
        Result = Response;
    EndTry;

    Return Result;

EndFunction

// Get authorization code
// Receives the authorization code for phone number linking
//
// Note
// Method at API documentation: [GetAuthorizationCode](@green-api.com/docs/api/account/GetAuthorizationCode/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// PhoneNumber - String, Number - Phone number in international format without + and 00 - phone
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetAuthorizationCode(Val AccessParameters, Val PhoneNumber) Export

    Parameters = New Structure;

    OPI_Tools.AddField("phoneNumber", PhoneNumber, "Number", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getAuthorizationCode");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Set profile picture
// Sets a new profile picture
//
// Note
// Method at API documentation: [SetProfilePicture](@green-api.com/docs/api/account/SetProfilePicture/)
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

// Archive chat
// Archives the selected chat
//
// Note
// Method at API documentation: [ArchiveChat](@green-api.com/docs/api/service/archiveChat/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat ID for archiving - chat
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function ArchiveChat(Val AccessParameters, Val ChatID) Export

    Return ChatArchivingManagement(AccessParameters, ChatID, True);

EndFunction

// Unarchive chat
// Unarchives the selected chat
//
// Note
// Method at API documentation: [UnarchiveChat](@green-api.com/docs/api/service/unarchiveChat/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat ID for dearchiving - chat
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function UnarchiveChat(Val AccessParameters, Val ChatID) Export

    Return ChatArchivingManagement(AccessParameters, ChatID, False);

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
    SettingsStructure.Insert("deviceWebhook"                    , "<receive notifications about the device (phone) and battery level: yes, no>");
    SettingsStructure.Insert("keepOnlineStatus"                 , "<sets the 'Online' status for your account>");
    SettingsStructure.Insert("pollMessageWebhook"               , "<receive notifications when a poll is created and voted on: yes, no>");
    SettingsStructure.Insert("incomingBlockWebhook"             , "<receive notifications when a chat is added to the blocked contacts list: yes, no>");
    SettingsStructure.Insert("incomingCallWebhook"              , "<receive notifications about incoming call statuses: yes, no>");
    SettingsStructure.Insert("editedMessageWebhook"             , "<to be notified when a message has been edited: yes, no>");
    SettingsStructure.Insert("deletedMessageWebhook"            , "<receive notifications when a message has been deleted: yes, no>");

    If Clear Then
        SettingsStructure = OPI_Tools.ClearCollectionRecursively(SettingsStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return SettingsStructure;

EndFunction

#EndRegion

#Region GroupManagement

// Get group information
// Gets group chat data
//
// Note
// Method at API documentation: [GetGroupData](@green-api.com/docs/api/groups/GetGroupData/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetGroupInformation(Val AccessParameters, Val GroupID) Export

    Parameters = New Structure;

    OPI_Tools.AddField("groupId", GroupID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getGroupData");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Create group
// Creates a new group chat
//
// Note
// Method at API documentation: [CreateGroup](@green-api.com/docs/api/groups/CreateGroup/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Name - String - Name of the group chat - name
// Members - Array Of String - Chat members array - members
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function CreateGroup(Val AccessParameters, Val Name, Val Members = Undefined) Export

    If Not ValueIsFilled(Members) Then
        Members = New Array;
    EndIf;

    Parameters = New Structure;

    OPI_Tools.AddField("groupName", Name   , "String"    , Parameters);
    OPI_Tools.AddField("chatIds"  , Members, "Collection", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "createGroup");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Update group name
// Changes the name of an existing group
//
// Note
// Method at API documentation: [UpdateGroupName](@green-api.com/docs/api/groups/UpdateGroupName/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
// Name - String - New group chat name - name
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function UpdateGroupName(Val AccessParameters, Val GroupID, Val Name) Export

    Parameters = New Structure;

    OPI_Tools.AddField("groupId"  , GroupID, "String", Parameters);
    OPI_Tools.AddField("groupName", Name   , "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "updateGroupName");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Add group member
// Adds a participant to a group chat
//
// Note
// Method at API documentation: [AddGroupParticipant](@green-api.com/docs/api/groups/AddGroupParticipant/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
// UserID - String - User ID to add - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function AddGroupMember(Val AccessParameters, Val GroupID, Val UserID) Export

    Response = GroupMemberAction(AccessParameters, GroupID, UserID, "addGroupParticipant");

    Return Response;

EndFunction

// Exclude group member
// Excludes a member from the group
//
// Note
// Method at API documentation: [RemoveGroupParticipant](@green-api.com/docs/api/groups/RemoveGroupParticipant/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
// UserID - String - User ID to add - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function ExcludeGroupMember(Val AccessParameters, Val GroupID, Val UserID) Export

    Response = GroupMemberAction(AccessParameters, GroupID, UserID, "removeGroupParticipant");

    Return Response;

EndFunction

// Set admin rights
// Assigns the user as the group administrator
//
// Note
// Method at API documentation: [SetGroupAdmin](@green-api.com/docs/api/groups/SetGroupAdmin/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
// UserID - String - User ID to add - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetAdminRights(Val AccessParameters, Val GroupID, Val UserID) Export

    Response = GroupMemberAction(AccessParameters, GroupID, UserID, "setGroupAdmin");

    Return Response;

EndFunction

// Revoke admin rights
// Revokes administrator rights from the user
//
// Note
// Method at API documentation: [RemoveAdmin](@green-api.com/docs/api/groups/RemoveAdmin/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
// UserID - String - User ID to add - user
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function RevokeAdminRights(Val AccessParameters, Val GroupID, Val UserID) Export

    Response = GroupMemberAction(AccessParameters, GroupID, UserID, "removeAdmin");

    Return Response;

EndFunction

// Leave group
// Logs the current account out of group chat
//
// Note
// Method at API documentation: [LeaveGroup](@green-api.com/docs/api/groups/LeaveGroup/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function LeaveGroup(Val AccessParameters, Val GroupID) Export

    Parameters = New Structure;

    OPI_Tools.AddField("groupId", GroupID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "leaveGroup");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Set group picture
// Sets the group chat picture
//
// Note
// Method at API documentation: [SetGroupPicture](@green-api.com/docs/api/groups/SetGroupPicture/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// GroupID - String - Group chat identifier - group
// Image - BinaryData, String - Profile picture - picture
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetGroupPicture(Val AccessParameters, Val GroupID, Val Image) Export

    OPI_TypeConversion.GetBinaryData(Image);

    Parameters = New Structure;

    OPI_Tools.AddField("groupId", GroupID, "String", Parameters);

    PictureMap = New Map();
    PictureMap.Insert("file|file.jpg", Image);

    URL      = FormPrimaryURL(AccessParameters, "setGroupPicture");
    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, PictureMap);

    Return Response;

EndFunction

#EndRegion

#Region MessageSending

// Send text message
// Sends a text message to the selected chat room
//
// Note
// Method at API documentation: [SendMessage](@green-api.com/docs/api/sending/SendMessage/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// Text - String - Message text - text
// ReplyID - String - Replying message id if necessary - quoted
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendTextMessage(Val AccessParameters, Val ChatID, Val Text, Val ReplyID = "") Export

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID , String_, Parameters);
    OPI_Tools.AddField("message"        , Text   , String_, Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID, String_, Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendMessage");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send file
// Sends the file to the selected chat room
//
// Note
// Method at API documentation: [SendFileByUpload](@green-api.com/docs/api/sending/SendFileByUpload/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// File - String, BinaryData - File data or filepath - file
// FileName - String - Name of the file with the extension - filename
// Description - String - Message text below the file - caption
// ReplyID - String - Replying message id if necessary - quoted
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendFile(Val AccessParameters
    , Val ChatID
    , Val File
    , Val FileName
    , Val Description = ""
    , Val ReplyID = "") Export

    OPI_TypeConversion.GetBinaryData(File);

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID      , String_, Parameters);
    OPI_Tools.AddField("fileName"       , FileName    , String_, Parameters);
    OPI_Tools.AddField("caption"        , Description , String_, Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID     , String_, Parameters);

    FileMapping = New Map();
    FileMapping.Insert(StrTemplate("file|%1", FileName), File);

    URL      = FormMediaURL(AccessParameters, "SendFileByUpload");
    Response = OPI_HTTPRequests.PostMultipart(URL, Parameters, FileMapping);

    Return Response;

EndFunction

// Send file by URL
// Sends a file from web to the selected chat room
//
// Note
// Method at API documentation: [SendFileByUrl](@green-api.com/docs/api/sending/SendFileByUrl/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// FileURL - String - File URL - url
// FileName - String - Name of the file with the extension - filename
// Description - String - Message text below the file - caption
// ReplyID - String - Replying message id if necessary - quoted
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendFileByURL(Val AccessParameters
    , Val ChatID
    , Val FileURL
    , Val FileName
    , Val Description = ""
    , Val ReplyID = "") Export

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID      , String_, Parameters);
    OPI_Tools.AddField("urlFile"        , FileURL     , String_, Parameters);
    OPI_Tools.AddField("fileName"       , FileName    , String_, Parameters);
    OPI_Tools.AddField("caption"        , Description , String_, Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID     , String_, Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendFileByUrl");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send poll
// Sends a poll with answer choices to the selected chat room
//
// Note
// Method at API documentation: [SendPoll](@green-api.com/docs/api/sending/SendPoll/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// Text - String - Message text - text
// Variants - Array Of String - Answer options - options
// MultipleSelect - Boolean - Allows to select more than one answer choice - multi
// ReplyID - String - Replying message id if necessary - quoted
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendPoll(Val AccessParameters
    , Val ChatID
    , Val Text
    , Val Variants
    , Val MultipleSelect = False
    , Val ReplyID = "") Export

    String_     = "String";
    Parameters  = New Structure;
    OptionArray = New Array;

    OPI_TypeConversion.GetArray(Variants);

    For Each Option In Variants Do
        OptionArray.Add(New Structure("optionName", Option));
    EndDo;

    OPI_Tools.AddField("chatId"         , ChatID        , String_     , Parameters);
    OPI_Tools.AddField("message"        , Text          , String_     , Parameters);
    OPI_Tools.AddField("options"        , OptionArray   , "Collection", Parameters);
    OPI_Tools.AddField("multipleAnswers", MultipleSelect, "Boolean"   , Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID       , String_     , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendPoll");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send location
// Sends location data to the specified chat room
//
// Note
// Method at API documentation: [SendPoll](@green-api.com/docs/api/sending/SendPoll/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// Location - Structure Of KeyAndValue - Location description. See GetLocationDescription - loc
// ReplyID - String - Replying message id if necessary - quoted
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendLocation(Val AccessParameters, Val ChatID, Val Location, Val ReplyID = "") Export

    OPI_TypeConversion.GetKeyValueCollection(Location);

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID , "String", Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID, "String", Parameters);

    For Each Element In Location Do
        Parameters.Insert(Element.Key, Element.Value);
    EndDo;

    URL      = FormPrimaryURL(AccessParameters, "sendLocation");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Send contact
// Sends a contact with a phone number to the selected chat room
//
// Note
// Method at API documentation: [SendContact](@green-api.com/docs/api/sending/SendContact/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// Contact - Structure Of KeyAndValue - Contact description. See GetContactDescription - contact
// ReplyID - String - Replying message id if necessary - quoted
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendContact(Val AccessParameters, Val ChatID, Val Contact, Val ReplyID = "") Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID  , "String"    , Parameters);
    OPI_Tools.AddField("contact"        , Contact , "Collection", Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID , "String"    , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendContact");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Forward messages
// Sends messages from one chat room to another
//
// Note
// Method at API documentation: [ForwardMessages](@green-api.com/docs/api/sending/ForwardMessages/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// From - String - Message source chat ID - from
// Target - String - Message receiver chat ID - to
// Messages - String, Array of String - Messages or a single message to be sent - msgs
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function ForwardMessages(Val AccessParameters, Val From, Val Target, Val Messages) Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"    , Target  , "String"    , Parameters);
    OPI_Tools.AddField("chatIdFrom", From    , "String"    , Parameters);
    OPI_Tools.AddField("messages"  , Messages, "Collection", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "forwardMessages");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Change the message text
// Changes the text of the message
//
// Note
// Method at API documentation: [EditMessage](@green-api.com/docs/api/service/EditMessage/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// MessageID - String - Message identifier - message
// Text - String - New message text - text
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function EditMessageText(Val AccessParameters, Val ChatID, Val MessageID, Val Text) Export

    String_    = "String";
    Parameters = New Structure;

    OPI_Tools.AddField("chatId"   , ChatID   , String_, Parameters);
    OPI_Tools.AddField("idMessage", MessageID, String_, Parameters);
    OPI_Tools.AddField("message"  , Text     , String_, Parameters);

    URL      = FormPrimaryURL(AccessParameters, "editMessage");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Delete message
// Deletes a message in the selected chat room
//
// Note
// Method at API documentation: [DeleteMessage](@green-api.com/docs/api/service/deleteMessage/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// MessageID - String - Message identifier - message
// ForSenderOnly - Boolean - Delete for sender only - sender
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function DeleteMessage(Val AccessParameters, Val ChatID, Val MessageID, Val ForSenderOnly = False) Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"          , ChatID       , "String" , Parameters);
    OPI_Tools.AddField("idMessage"       , MessageID    , "String" , Parameters);
    OPI_Tools.AddField("onlySenderDelete", ForSenderOnly, "Boolean", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "deleteMessage");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get contact description
// Gets the contact description for the SendContact function
//
// Parameters:
// Phone - Number - Phone number in international format without a plus sign - phone
// Name - String - Contact name - name
// LastName - String - Contact last name - surname
// Patronymic - String - Contacts patronymic or middle name - midname
// Company - String - Name of the contact company - company
//
// Returns:
// Structure Of KeyAndValue - Contact description
Function GetContactDescription(Val Phone
    , Val Name = ""
    , Val LastName = ""
    , Val Patronymic = ""
    , Val Company = "") Export

    String_ = "String";
    Contact = New Structure;

    OPI_Tools.AddField("phoneContact", Phone     , "Number", Contact);
    OPI_Tools.AddField("firstName"   , Name      , String_ , Contact);
    OPI_Tools.AddField("middleName"  , LastName  , String_ , Contact);
    OPI_Tools.AddField("lastName"    , Patronymic, String_ , Contact);
    OPI_Tools.AddField("company"     , Company   , String_ , Contact);

    Return Contact;

EndFunction

// Get location description
// Gets the description of the location to send with SendLocation method
//
// Parameters:
// Latitude - Number - Geographic latitude - lat
// Longitude - Number - Geographic longitude - long
// Address - String - Location address - addr
// Name - String - Location name - name
//
// Returns:
// Structure Of KeyAndValue - Location description
Function GetLocationDescription(Val Latitude, Val Longitude, Val Address = "", Val Name = "") Export

    Location = New Structure;

    OPI_Tools.AddField("latitude"    , Latitude  , "Number" , Location);
    OPI_Tools.AddField("longitude"   , Longitude , "Number" , Location);
    OPI_Tools.AddField("address"     , Address   , "String" , Location);
    OPI_Tools.AddField("nameLocation", Name      , "String" , Location);

    Return Location;

EndFunction

#EndRegion

#Region NotificationsReceiving

// Get notification
// Receives one notification from the queue
//
// Note
// Once the notification has been successfully accepted, you must remove it from the queue using the `DeleteNotificationFromQueue` method
// Method at API documentation: [ReceiveNotification](@green-api.com/docs/api/receiving/technology-http-api/ReceiveNotification/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Timeout - Number - Timeout for waiting for new messages when the queue is empty - timeout
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetNotification(Val AccessParameters, Val Timeout = 5) Export

    Parameters = New Structure;

    OPI_Tools.AddField("receiveTimeout", Timeout, "Number", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "receiveNotification");
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    Return Response;

EndFunction

// Delete notification from queue
// Deletes the notification from the queue after successful receipt
//
// Note
// Method at API documentation: [DeleteNotification](@green-api.com/docs/api/receiving/technology-http-api/DeleteNotification/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ReceiptID - String, Number - Receipt identifier from the GetNotification method - receipt
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function DeleteNotificationFromQueue(Val AccessParameters, Val ReceiptID) Export

    OPI_TypeConversion.GetLine(ReceiptID);

    URL = FormPrimaryURL(AccessParameters, "deleteNotification");
    URL = StrTemplate("%1/%2", URL, ReceiptID);

    Response = OPI_HTTPRequests.Delete(URL);

    Return Response;

EndFunction

// Download message file
// Gets a link to download a file from an incoming message
//
// Note
// Method at API documentation: [DownloadFile](@green-api.com/docs/api/receiving/files/DownloadFile/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// MessageID - String - Identifier of the message with the file - message
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function DownloadMessageFile(Val AccessParameters, Val ChatID, Val MessageID) Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"   , ChatID   , "String", Parameters);
    OPI_Tools.AddField("idMessage", MessageID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "downloadFile");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Set read mark
// Sets the Read mark for a message or all chat messages
//
// Note
// Method at API documentation: [ReadChat](@green-api.com/docs/api/marks/ReadChat/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// MessageID - String - Message ID. All messages, if not filled in - message
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SetReadMark(Val AccessParameters, Val ChatID, Val MessageID = "") Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"    , ChatID   , "String", Parameters);
    OPI_Tools.AddField("idMessage" , MessageID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "readChat");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

#EndRegion

#Region MessageQueue

// Get message queue
// Gets the list of messages in the queue to be sent
//
// Note
// Method at API documentation: [ShowMessagesQueue](@green-api.com/docs/api/queues/ShowMessagesQueue/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetMessageQueue(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "showMessagesQueue");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

// Clear message queue
// Clears the queue of messages to be sent
//
// Note
// Method at API documentation: [ClearMessagesQueue](@green-api.com/docs/api/queues/ClearMessagesQueue/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function ClearMessageQueue(Val AccessParameters) Export

    URL      = FormPrimaryURL(AccessParameters, "clearMessagesQueue");
    Response = OPI_HTTPRequests.Get(URL);

    Return Response;

EndFunction

#EndRegion

#Region MessageLogs

// Get chat history
// Retrieves the chat message history
//
// Note
// Method at API documentation: [GetChatHistory](@green-api.com/docs/api/journals/GetChatHistory/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// Count - Number - Number of messages to receive - count
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetChatHistory(Val AccessParameters, Val ChatID, Val Count = 100) Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId", ChatID , "String" , Parameters);
    OPI_Tools.AddField("count" , Count  , "Number" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getChatHistory");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get message
// Gets information about the chat message by ID
//
// Note
// Method at API documentation: [GetMessage](@green-api.com/docs/api/journals/GetMessage/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// ChatID - String - Chat identifier - chat
// MessageID - String - Message identifier - msg
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetMessage(Val AccessParameters, Val ChatID, Val MessageID) Export

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"   , ChatID   , "String" , Parameters);
    OPI_Tools.AddField("idMessage", MessageID, "String" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "getMessage");
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

// Get incoming message log
// Gets the list of incoming messages of the instance for the specified period
//
// Note
// Method at API documentation: [LastIncomingMessages](@green-api.com/docs/api/journals/LastIncomingMessages/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Period - Number - Time in minutes for which messages need to be received - period
//
// Returns:
// Array Of Arbitrary - serialized JSON response from Green API
Function GetIncomingMessageLog(Val AccessParameters, Val Period = 1440) Export

    Parameters = New Structure;

    OPI_Tools.AddField("minutes", Period, "Number" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "lastIncomingMessages");
    Response = OPI_HTTPRequests.Get(URL, Parameters);

    If Not ValueIsFilled(Response) Then
        Return New Array;
    EndIf;

    Return Response;

EndFunction

// Get outgoing message log
// Gets the list of outgoing messages of the instance for the specified period
//
// Note
// Method at API documentation: [LastOutgoingMessages](@green-api.com/docs/api/journals/LastOutgoingMessages/)
//
// Parameters:
// AccessParameters - Structure Of KeyAndValue - Access parameters. See FormAccessParameters - access
// Period - Number - Time in minutes for which messages need to be received - period
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function GetOutgoingMessageLog(Val AccessParameters, Val Period = 1440) Export

    Parameters = New Structure;

    OPI_Tools.AddField("minutes", Period, "Number" , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "lastOutgoingMessages");
    Response = OPI_HTTPRequests.Get(URL, Parameters);

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

Function GroupMemberAction(Val AccessParameters, Val GroupID, Val UserID, Val Method)

    Parameters = New Structure;

    OPI_Tools.AddField("groupId"          , GroupID , "String", Parameters);
    OPI_Tools.AddField("participantChatId", UserID  , "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, Method);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

EndFunction

Function ChatArchivingManagement(Val AccessParameters, Val ChatID, Val Archiving)

    Method     = ?(Archiving, "archiveChat", "unarchiveChat");
    Parameters = New Structure;

    OPI_Tools.AddField("chatId", ChatID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, Method);
    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters);

    Return Response;

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

Function ПолучитьСостояниеИнстанса(Val ПараметрыДоступа) Export
	Return GetInstanceStatus(ПараметрыДоступа);
EndFunction

Function ПерезапуститьИнстанс(Val ПараметрыДоступа) Export
	Return RebootInstance(ПараметрыДоступа);
EndFunction

Function РазлогинитьИнстанс(Val ПараметрыДоступа) Export
	Return LogoutInstance(ПараметрыДоступа);
EndFunction

Function ПолучитьQR(Val ПараметрыДоступа) Export
	Return GetQR(ПараметрыДоступа);
EndFunction

Function ПолучитьКодАвторизации(Val ПараметрыДоступа, Val НомерТелефона) Export
	Return GetAuthorizationCode(ПараметрыДоступа, НомерТелефона);
EndFunction

Function УстановитьКартинкуПрофиля(Val ПараметрыДоступа, Val Картинка) Export
	Return SetProfilePicture(ПараметрыДоступа, Картинка);
EndFunction

Function АрхивироватьЧат(Val ПараметрыДоступа, Val IDЧата) Export
	Return ArchiveChat(ПараметрыДоступа, IDЧата);
EndFunction

Function РазархивироватьЧат(Val ПараметрыДоступа, Val IDЧата) Export
	Return UnarchiveChat(ПараметрыДоступа, IDЧата);
EndFunction

Function ПолучитьСтруктуруНастроекИнстанса(Val Пустая = False) Export
	Return GetInstanceSettingsStructure(Пустая);
EndFunction

Function ПолучитьИнформациюОГруппе(Val ПараметрыДоступа, Val IDГруппы) Export
	Return GetGroupInformation(ПараметрыДоступа, IDГруппы);
EndFunction

Function СоздатьГруппу(Val ПараметрыДоступа, Val Имя, Val Участники = Undefined) Export
	Return CreateGroup(ПараметрыДоступа, Имя, Участники);
EndFunction

Function ИзменитьИмяГруппы(Val ПараметрыДоступа, Val IDГруппы, Val Имя) Export
	Return UpdateGroupName(ПараметрыДоступа, IDГруппы, Имя);
EndFunction

Function ДобавитьУчастникаВГруппу(Val ПараметрыДоступа, Val IDГруппы, Val IDПользователя) Export
	Return AddGroupMember(ПараметрыДоступа, IDГруппы, IDПользователя);
EndFunction

Function ИсключитьУчастникаГруппы(Val ПараметрыДоступа, Val IDГруппы, Val IDПользователя) Export
	Return ExcludeGroupMember(ПараметрыДоступа, IDГруппы, IDПользователя);
EndFunction

Function НазначитьПраваАдминистратора(Val ПараметрыДоступа, Val IDГруппы, Val IDПользователя) Export
	Return SetAdminRights(ПараметрыДоступа, IDГруппы, IDПользователя);
EndFunction

Function ОтозватьПраваАдминистратора(Val ПараметрыДоступа, Val IDГруппы, Val IDПользователя) Export
	Return RevokeAdminRights(ПараметрыДоступа, IDГруппы, IDПользователя);
EndFunction

Function ПокинутьГруппу(Val ПараметрыДоступа, Val IDГруппы) Export
	Return LeaveGroup(ПараметрыДоступа, IDГруппы);
EndFunction

Function УстановитьКартинкуГруппы(Val ПараметрыДоступа, Val IDГруппы, Val Картинка) Export
	Return SetGroupPicture(ПараметрыДоступа, IDГруппы, Картинка);
EndFunction

Function ОтправитьТекстовоеСообщение(Val ПараметрыДоступа, Val IDЧата, Val Текст, Val IDЦитируемого = "") Export
	Return SendTextMessage(ПараметрыДоступа, IDЧата, Текст, IDЦитируемого);
EndFunction

Function ОтправитьФайл(Val ПараметрыДоступа, Val IDЧата, Val Файл, Val ИмяФайла, Val Описание = "", Val IDЦитируемого = "") Export
	Return SendFile(ПараметрыДоступа, IDЧата, Файл, ИмяФайла, Описание, IDЦитируемого);
EndFunction

Function ОтправитьФайлПоURL(Val ПараметрыДоступа, Val IDЧата, Val URLФайла, Val ИмяФайла, Val Описание = "", Val IDЦитируемого = "") Export
	Return SendFileByURL(ПараметрыДоступа, IDЧата, URLФайла, ИмяФайла, Описание, IDЦитируемого);
EndFunction

Function ОтправитьОпрос(Val ПараметрыДоступа, Val IDЧата, Val Текст, Val Варианты, Val МножественныйВыбор = False, Val IDЦитируемого = "") Export
	Return SendPoll(ПараметрыДоступа, IDЧата, Текст, Варианты, МножественныйВыбор, IDЦитируемого);
EndFunction

Function ОтправитьЛокацию(Val ПараметрыДоступа, Val IDЧата, Val Локация, Val IDЦитируемого = "") Export
	Return SendLocation(ПараметрыДоступа, IDЧата, Локация, IDЦитируемого);
EndFunction

Function ОтправитьКонтакт(Val ПараметрыДоступа, Val IDЧата, Val Контакт, Val IDЦитируемого = "") Export
	Return SendContact(ПараметрыДоступа, IDЧата, Контакт, IDЦитируемого);
EndFunction

Function ПереслатьСообщения(Val ПараметрыДоступа, Val Откуда, Val Куда, Val Сообщения) Export
	Return ForwardMessages(ПараметрыДоступа, Откуда, Куда, Сообщения);
EndFunction

Function ИзменитьТекстСообщения(Val ПараметрыДоступа, Val IDЧата, Val IDСообщения, Val Текст) Export
	Return EditMessageText(ПараметрыДоступа, IDЧата, IDСообщения, Текст);
EndFunction

Function УдалитьСообщение(Val ПараметрыДоступа, Val IDЧата, Val IDСообщения, Val ТолькоУОтправителя = False) Export
	Return DeleteMessage(ПараметрыДоступа, IDЧата, IDСообщения, ТолькоУОтправителя);
EndFunction

Function ПолучитьОписаниеКонтакта(Val Телефон, Val Имя = "", Val Фамилия = "", Val Отчество = "", Val Компания = "") Export
	Return GetContactDescription(Телефон, Имя, Фамилия, Отчество, Компания);
EndFunction

Function ПолучитьОписаниеЛокации(Val Широта, Val Долгота, Val Адрес = "", Val Название = "") Export
	Return GetLocationDescription(Широта, Долгота, Адрес, Название);
EndFunction

Function ПолучитьУведомление(Val ПараметрыДоступа, Val Таймаут = 5) Export
	Return GetNotification(ПараметрыДоступа, Таймаут);
EndFunction

Function УдалитьУведомлениеИзОчереди(Val ПараметрыДоступа, Val IDДоставки) Export
	Return DeleteNotificationFromQueue(ПараметрыДоступа, IDДоставки);
EndFunction

Function СкачатьФайлСообщения(Val ПараметрыДоступа, Val IDЧата, Val IDСообщения) Export
	Return DownloadMessageFile(ПараметрыДоступа, IDЧата, IDСообщения);
EndFunction

Function УстановитьОтметкуПрочтения(Val ПараметрыДоступа, Val IDЧата, Val IDСообщения = "") Export
	Return SetReadMark(ПараметрыДоступа, IDЧата, IDСообщения);
EndFunction

Function ПолучитьОчередьСообщений(Val ПараметрыДоступа) Export
	Return GetMessageQueue(ПараметрыДоступа);
EndFunction

Function ОчиститьОчередьСообщений(Val ПараметрыДоступа) Export
	Return ClearMessageQueue(ПараметрыДоступа);
EndFunction

Function ПолучитьИсториюЧата(Val ПараметрыДоступа, Val IDЧата, Val Количество = 100) Export
	Return GetChatHistory(ПараметрыДоступа, IDЧата, Количество);
EndFunction

Function ПолучитьСообщение(Val ПараметрыДоступа, Val IDЧата, Val IDСообщения) Export
	Return GetMessage(ПараметрыДоступа, IDЧата, IDСообщения);
EndFunction

Function ПолучитьЖурналВходящихСообщений(Val ПараметрыДоступа, Val Период = 1440) Export
	Return GetIncomingMessageLog(ПараметрыДоступа, Период);
EndFunction

Function ПолучитьЖурналИсходящихСообщений(Val ПараметрыДоступа, Val Период = 1440) Export
	Return GetOutgoingMessageLog(ПараметрыДоступа, Период);
EndFunction

#EndRegion