// OneScript: ./OInt/core/Modules/OPI_CDEK.os
// Lib: CDEK
// CLI: cdek

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

#Region CommonMethods

// Get token
// Gets a token based on account ID and password
//
// Note
// Method at API documentation: [Client authorization](@api-docs.cdek.ru/29923918.html)
//
// Parameters:
// Account - String - Client identifier (Account) - account
// Password - String - Secret key (Password) - pass
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetToken(Val Account, Val Password, TestAPI = False) Export

    URL = FormURL("/oauth/token", TestAPI);

    Parameters = New Structure;
    OPI_Tools.AddField("grant_type"   , "client_credentials", "String", Parameters);
    OPI_Tools.AddField("client_id"    , Account             , "String", Parameters);
    OPI_Tools.AddField("client_secret", Password            , "String", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, , False);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function FormURL(Val Method, Val TestAPI)

    OPI_TypeConversion.GetBoolean(TestAPI);

    If TestAPI Then
        URL = "https://api.edu.cdek.ru/v2";
    Else
        URL = "https://api.cdek.ru";
    EndIf;

    URL = URL + Method;

    Return URL;

EndFunction

#EndRegion
