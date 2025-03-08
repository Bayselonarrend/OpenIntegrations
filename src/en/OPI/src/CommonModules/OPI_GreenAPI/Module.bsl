﻿// OneScript: ./OInt/core/Modules/OPI_GreenAPI.os
// Lib: Green API
// CLI: greenapi

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
    Response = OPI_Tools.Get(URL);

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
    Response = OPI_Tools.Get(URL);

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
    Response = OPI_Tools.Post(URL, Settings);

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
    Response = OPI_Tools.Get(URL);

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
    Response = OPI_Tools.Get(URL);

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
    Response = OPI_Tools.Get(URL);

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
    Response = OPI_Tools.Get(URL);

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
    Response = OPI_Tools.Post(URL, Parameters);

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
    Response = OPI_Tools.PostMultipart(URL, , PictureMap);

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
    Response = OPI_Tools.Post(URL, Parameters);

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
    Response = OPI_Tools.Post(URL, Parameters);

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
    Response = OPI_Tools.Post(URL, Parameters);

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
    Response = OPI_Tools.Post(URL, Parameters);

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
    Response = OPI_Tools.PostMultipart(URL, Parameters, PictureMap);

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

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID , "String", Parameters);
    OPI_Tools.AddField("message"        , Text   , "String", Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID, "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendMessage");
    Response = OPI_Tools.Post(URL, Parameters);

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

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID      , "String", Parameters);
    OPI_Tools.AddField("fileName"       , FileName    , "String", Parameters);
    OPI_Tools.AddField("caption"        , Description , "String", Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID     , "String", Parameters);

    FileMapping = New Map();
    FileMapping.Insert(StrTemplate("file|%1", FileName), File);

    URL      = FormMediaURL(AccessParameters, "SendFileByUpload");
    Response = OPI_Tools.PostMultipart(URL, Parameters, FileMapping);

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
// FileURL - String, - File URL - url
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

    Parameters = New Structure;

    OPI_Tools.AddField("chatId"         , ChatID      , "String", Parameters);
    OPI_Tools.AddField("urlFile"        , FileURL     , "String", Parameters);
    OPI_Tools.AddField("fileName"       , FileName    , "String", Parameters);
    OPI_Tools.AddField("caption"        , Description , "String", Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID     , "String", Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendFileByUrl");
    Response = OPI_Tools.Post(URL, Parameters);

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
// Options - Array Of String - Answer options - options
// MultipleSelect - Boolean - Allows to select more than one answer choice - multi
// ReplyID - String - Replying message id if necessary - quoted
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Green API
Function SendPoll(Val AccessParameters
    , Val ChatID
    , Val Text
    , Val Options
    , Val MultipleSelect = False
    , Val ReplyID = "") Export

    Parameters  = New Structure;
    OptionArray = New Array;

    OPI_TypeConversion.GetArray(Options);

    For Each Option In Options Do
        OptionArray.Add(New Structure("optionName", Option));
    EndDo;

    OPI_Tools.AddField("chatId"         , ChatID        , "String"    , Parameters);
    OPI_Tools.AddField("message"        , Text          , "String"    , Parameters);
    OPI_Tools.AddField("options"        , OptionArray   , "Collection", Parameters);
    OPI_Tools.AddField("multipleAnswers", MultipleSelect, "Boolean"   , Parameters);
    OPI_Tools.AddField("quotedMessageId", ReplyID       , "String"    , Parameters);

    URL      = FormPrimaryURL(AccessParameters, "sendPoll");
    Response = OPI_Tools.Post(URL, Parameters);

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
    Response = OPI_Tools.Post(URL, Parameters);

    Return Response;

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

    OPI_Tools.AddField("latitude"    , Latitude  , "Number", Location);
    OPI_Tools.AddField("longitude"   , Longitude , "Number", Location);
    OPI_Tools.AddField("address"     , Address   , "String", Location);
    OPI_Tools.AddField("nameLocation", Name      , "String", Location);

    Return Location;

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
    Response = OPI_Tools.Post(URL, Parameters);

    Return Response;

EndFunction

#EndRegion
