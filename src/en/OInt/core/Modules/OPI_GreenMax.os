// OneScript: ./OInt/core/Modules/OPI_GreenMax.os
// Lib: Green Max
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

#Region Public

#Region Account

// Form access parameters
// Forms the structure of basic authorization data
//
// Note
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
// Note
// Method at API documentation: [GetWaSettings](@green-api.com/v3/docs/api/account/GetAccountSettings/)
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
// Note
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
// Note
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
// Note
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
// Note
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
// Note
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
// Note
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
// Note
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
// Note
// Method at API documentation: [CheckAccount](@green-api.com/v3/docs/api/account/CheckAccount/)
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

Function ПолучитьСтруктуруНастроекИнстанса(Val Пустая = False) Export
	Return GetInstanceSettingsStructure(Пустая);
EndFunction

#EndRegion