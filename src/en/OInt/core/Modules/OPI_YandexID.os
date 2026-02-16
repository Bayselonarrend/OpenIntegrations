// OneScript: ./OInt/core/Modules/OPI_YandexID.os
// Lib: YandexID
// CLI: yandex

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content

#Use "../../tools/main"
#Use "../../tools/http"

#Region Public

// Get confirmation code
// Gets the confirmation code and the address of the page where it needs to be entered
//
// Parameters:
// ClientId - String - Client id - id
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetConfirmationCode(Val ClientId) Export // Service

    OPI_TypeConversion.GetLine(ClientId);

    Parameters = New Structure("client_id", ClientId);
    Response   = OPI_HTTPRequests.PostWithBody("https://oauth.yandex.ru/device/code", Parameters, , False);

    Return Response;

EndFunction

// Convert code to token
// Converts the code to a token after entering the code when executing GetConfirmationCode
//
// Parameters:
// ClientId     - String - Client id                              - id
// ClientSecret - String - Client secret                          - secret
// DeviceCode   - String - device_code from GetConfirmationCode() - device
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function ConvertCodeToToken(Val ClientId, Val ClientSecret, Val DeviceCode) Export // Service

    OPI_TypeConversion.GetLine(ClientId);
    OPI_TypeConversion.GetLine(ClientSecret);
    OPI_TypeConversion.GetLine(DeviceCode);

    Parameters = New Structure;
    Parameters.Insert("grant_type"    , "device_code");
    Parameters.Insert("code"          , DeviceCode);
    Parameters.Insert("client_id"     , ClientId);
    Parameters.Insert("client_secret" , ClientSecret);

    Response = OPI_HTTPRequests.PostWithBody("https://oauth.yandex.ru/token", Parameters, , False);

    Return Response;

EndFunction

// Refresh token
// Updates token by Refresh token
//
// Parameters:
// ClientId     - String - Client id     - id
// ClientSecret - String - Client secret - secret
// RefreshToken - String - Refresh token - refresh
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function RefreshToken(Val ClientId, Val ClientSecret, Val RefreshToken) Export // Service

    OPI_TypeConversion.GetLine(ClientId);
    OPI_TypeConversion.GetLine(ClientSecret);
    OPI_TypeConversion.GetLine(RefreshToken);

    Parameters = New Structure;
    Parameters.Insert("grant_type"    , "refresh_token");
    Parameters.Insert("refresh_token" , RefreshToken);
    Parameters.Insert("client_id"     , ClientId);
    Parameters.Insert("client_secret" , ClientSecret);

    Response = OPI_HTTPRequests.PostWithBody("https://oauth.yandex.ru/token", Parameters, , False);

    Return Response;

EndFunction

#EndRegion

#Region Internal

Function GetAuthorizationHeader(Val Token) Export

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization", "OAuth " + Token);

    Return Headers;

EndFunction

#EndRegion
#Region Alternate

Function ПолучитьКодПодтверждения(Val ClientId) Export
    Return GetConfirmationCode(ClientId);
EndFunction

Function ПреобразоватьКодВТокен(Val ClientId, Val ClientSecret, Val КодУстройства) Export
    Return ConvertCodeToToken(ClientId, ClientSecret, КодУстройства);
EndFunction

Function ОбновитьТокен(Val ClientId, Val ClientSecret, Val RefreshToken) Export
    Return RefreshToken(ClientId, ClientSecret, RefreshToken);
EndFunction

Function ПолучитьЗаголовокАвторизации(Val Токен) Export
    Return GetAuthorizationHeader(Токен);
EndFunction

#EndRegion