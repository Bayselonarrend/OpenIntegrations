// OneScript: ./OInt/core/Modules/OPI_GreenAPI.os
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
#Use "../../tools"

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

#EndRegion

#Region Private

Function FormPrimaryURL(Val AccessParameters, Val Method)

    OPI_TypeConversion.GetKeyValueCollection(AccessParameters);
    OPI_TypeConversion.GetLine(Method);

    RequiredFields = StrSplit("apiUrl,idInstance,apiTokenInstance", ",");
    MissingFields  = OPI_Tools.FindMissingCollectionFields(AccessParameters, RequiredFields);

    If MissingFields.Count() > 0 Then
        Raise "Missing mandatory fields in access parameters!";
    EndIf;

    ApiUrl           = AccessParameters["apiUrl"];
    IdInstance       = AccessParameters["idInstance"];
    ApiTokenInstance = AccessParameters["apiTokenInstance"];

    URL = StrTemplate("%1/waInstance%2/%3/%4", ApiUrl, IdInstance, Method, ApiTokenInstance);

    Return URL;

EndFunction

#EndRegion
