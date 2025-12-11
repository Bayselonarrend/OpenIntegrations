// OneScript: ./OInt/core/Modules/OPI_GoogleWorkspace.os
// Lib: Google Workspace
// CLI: google

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

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:LineLength-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Region Public

// Generate code retrieval link
// Returns URL for browser authorization
//
// Parameters:
// ClientID - String - Client ID - id
// Calendar - Boolean - Calendar methods permission - calendar
// Drive - Boolean - Drive methods permission - drive
// Sheets - Boolean - Sheets methods permission - sheets
//
// Returns:
// String - Code retrieval link
Function FormCodeRetrievalLink(Val ClientID
    , Val Calendar = True
    , Val Drive = True
    , Val Sheets = True) Export

    OPI_TypeConversion.GetLine(ClientID);
    OPI_TypeConversion.GetBoolean(Calendar);
    OPI_TypeConversion.GetBoolean(Sheets);
    OPI_TypeConversion.GetBoolean(Drive);

    URL = "https://accounts.google.com/o/oauth2/auth";

    URLParameters = New Structure;
    URLParameters.Insert("response_type", "code");
    URLParameters.Insert("client_id"    , ClientID);
    URLParameters.Insert("redirect_uri" , "http://localhost");
    URLParameters.Insert("access_type"  , "offline");
    URLParameters.Insert("scope"        , GetPermissionsList(Calendar, Drive, Sheets));

    URL = URL + OPI_Tools.RequestParametersToString(URLParameters);

    Return URL;

EndFunction

// Get token by code
// Gets token by code from browser authorization
//
// Parameters:
// ClientID - String - Client ID - id
// ClientSecret - String - Client secret - secret
// Code - String - Code from browser - code
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetTokenByCode(Val ClientID, Val ClientSecret, Val Code) Export

    OPI_TypeConversion.GetLine(ClientID);
    OPI_TypeConversion.GetLine(ClientSecret);
    OPI_TypeConversion.GetLine(Code);

    URL = "https://accounts.google.com/o/oauth2/token";

    URLParameters = New Structure;
    URLParameters.Insert("grant_type"   , "authorization_code");
    URLParameters.Insert("client_id"    , ClientID);
    URLParameters.Insert("client_secret", ClientSecret);
    URLParameters.Insert("redirect_uri" , "http://localhost");
    URLParameters.Insert("code"         , Code);

    Response = OPI_HTTPRequests.PostWithBody(URL, URLParameters, , False);

    Return Response;

EndFunction

// Refresh token
// Updates token by Refresh token
//
// Parameters:
// ClientID - String - Client ID - id
// ClientSecret - String - Client secret - secret
// RefreshToken - String - Refresh token - refresh
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function RefreshToken(Val ClientID, Val ClientSecret, Val RefreshToken) Export

    OPI_TypeConversion.GetLine(ClientID);
    OPI_TypeConversion.GetLine(ClientSecret);
    OPI_TypeConversion.GetLine(RefreshToken);

    URL = "https://accounts.google.com/o/oauth2/token";

    URLParameters = New Structure;
    URLParameters.Insert("grant_type"   , "refresh_token");
    URLParameters.Insert("client_id"    , ClientID);
    URLParameters.Insert("client_secret", ClientSecret);
    URLParameters.Insert("refresh_token", RefreshToken);

    Response = OPI_HTTPRequests.PostWithBody(URL, URLParameters, , False);

    Return Response;

EndFunction

// Get service account token
// Gets authorization token by service account data
//
// Note:
// List of available scopes: [developers.google.com](https://developers.google.com/identity/protocols/oauth2/scopes)
//
// Parameters:
// Data - Arbitrary - JSON authorization data as a file, collection or binary data - auth
// Scope - Array Of String - Scope or array of scopes - scope
// Expire - Number - Token lifetime in seconds - exp
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Google
Function GetServiceAccountToken(Val Data, Val Scope, Val Expire = 3600) Export

    ErrorText = "The passed service account data is not valid JSON";
    OPI_TypeConversion.GetKeyValueCollection(Data, ErrorText);
    OPI_TypeConversion.GetNumber(Expire);
    OPI_TypeConversion.GetArray(Scope);

    RequiredFieldsArray = New Array;
    RequiredFieldsArray.Add("token_uri");
    RequiredFieldsArray.Add("client_email");
    RequiredFieldsArray.Add("private_key");
    RequiredFieldsArray.Add("private_key_id");

    MissingFields = OPI_Tools.FindMissingCollectionFields(Data, RequiredFieldsArray);

    If ValueIsFilled(MissingFields) Then

        FieldsErrorPattern = "There are no required fields in the service account data: %1";
        FieldsErrorText    = StrTemplate(FieldsErrorPattern, StrConcat(MissingFields, ", "));
        Raise FieldsErrorText;

    EndIf;

    ScopeAsString = StrConcat(Scope, " ");
    SignKey       = Data["private_key"];
    URL           = Data["token_uri"];

    CurrentDate = CurrentUniversalDate();
    ExpireDate  = CurrentDate + Expire;

    UnixTime = OPI_Tools.UnixTime(CurrentDate);
    ExpTime  = OPI_Tools.UnixTime(ExpireDate);

    Payload = New Structure;

    Payload.Insert("iss"  , Data["client_email"]);
    Payload.Insert("scope", ScopeAsString);
    Payload.Insert("aud"  , URL);
    Payload.Insert("exp"  , Number(ExpTime));
    Payload.Insert("iat"  , Number(UnixTime));

    AdditionalHeaders = New Structure("kid", Data["private_key_id"]);

    JWT = OPI_Cryptography.JWT(Payload, SignKey, "RS256", AdditionalHeaders);

    Grant         = "urn:ietf:params:oauth:grant-type:jwt-bearer";
    BodyStructure = New Structure("grant_type,assertion", Grant, JWT);

    Response = OPI_HTTPRequests.PostWithBody(URL, BodyStructure, , False);

    Return Response;

EndFunction

#EndRegion

#Region Internal

Function GetAuthorizationHeader(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization", "Bearer " + Token);

    Return Headers;

EndFunction

#EndRegion

#Region ServiceProceduresAndFunctions

Function GetPermissionsList(Calendar, Drive, Sheets)

    PermissionsArray = New Array;

    If Calendar Then
        PermissionsArray.Add("https://www.googleapis.com/auth/calendar");
    EndIf;

    If Drive Then
        PermissionsArray.Add("https://www.googleapis.com/auth/drive");
    EndIf;

    If Sheets Then
        PermissionsArray.Add("https://www.googleapis.com/auth/spreadsheets");
    EndIf;

    Return StrConcat(PermissionsArray, " ");

EndFunction

#EndRegion

#Region Alternate

Function СформироватьСсылкуПолученияКода(Val ClientID, Val Calendar = True, Val Drive = True, Val Sheets = True) Export
	Return FormCodeRetrievalLink(ClientID, Calendar, Drive, Sheets);
EndFunction

Function ПолучитьТокенПоКоду(Val ClientID, Val ClientSecret, Val Code) Export
	Return GetTokenByCode(ClientID, ClientSecret, Code);
EndFunction

Function ОбновитьТокен(Val ClientID, Val ClientSecret, Val RefreshToken) Export
	Return RefreshToken(ClientID, ClientSecret, RefreshToken);
EndFunction

Function ПолучитьТокенServiceАккаунта(Val Данные, Val ОбластиДействия, Val ВремяЖизни = 3600) Export
	Return GetServiceAccountToken(Данные, ОбластиДействия, ВремяЖизни);
EndFunction

Function ПолучитьЗаголовокАвторизации(Val Токен) Export
	Return GetAuthorizationHeader(Токен);
EndFunction

#EndRegion