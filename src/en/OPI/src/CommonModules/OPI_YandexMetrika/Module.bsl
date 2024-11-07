// OneScript: ./OInt/core/Modules/OPI_YandexMetrika.os
// Lib: Yandex Metrika
// CLI: metrika

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

#Region TagsManagment

// Create tag
// Creates a tag with the specified name
//
// Note
// Method at API documentation: [Creating a tag](@yandex.ru/dev/metrika/en/management/openapi/label/createLabel)
//
// Parameters:
// Token - String - Auth token - token
// Name - String - Tag title - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function CreateTag(Val Token, Val Name) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/labels";

    Label = New Structure;
    OPI_Tools.AddField("name", Name, "String", Label);

    Response = OPI_Tools.Post(URL, New Structure("label", Label), Headers);

    Return Response;

EndFunction

// Update tag
// Changes the tag name by ID
//
// Note
// Method at API documentation: [Changing a tag](@yandex.ru/dev/metrika/en/management/openapi/label/updateLabel)
//
// Parameters:
// Token - String - Auth token - token
// TagID - String - Tag ID to change - label
// Name - String - New name - title
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function UpdateTag(Val Token, Val TagID, Val Name) Export

    OPI_TypeConversion.GetLine(TagID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/label/" + TagID;

    Label = New Structure;
    OPI_Tools.AddField("name", Name, "String", Label);

    Response = OPI_Tools.Put(URL, New Structure("label", Label), Headers);

    Return Response;

EndFunction

// Get tag
// Gets the tag by ID
//
// Note
// Method at API documentation: [Tag information](@yandex.ru/dev/metrika/en/management/openapi/label/getLabel)
//
// Parameters:
// Token - String - Auth token - token
// TagID - String - Tag ID - label
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetTag(Val Token, Val TagID) Export

    OPI_TypeConversion.GetLine(TagID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/label/" + TagID;

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

// Delete tag
// Deletes a tag by ID
//
// Note
// Method at API documentation: [Deleting a tag](@yandex.ru/dev/metrika/en/management/openapi/label/deleteLabel)
//
// Parameters:
// Token - String - Auth token - token
// TagID - String - ID of the tag to be deleted - label
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function DeleteTag(Val Token, Val TagID) Export

    OPI_TypeConversion.GetLine(TagID);

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/label/" + TagID;

    Response = OPI_Tools.Delete(URL, , Headers);

    Return Response;

EndFunction

// Get tags list
// Gets a list of the users tags
//
// Note
// Method at API documentation: [List of user tags](@yandex.ru/dev/metrika/en/management/openapi/label/getLabels)
//
// Parameters:
// Token - String - Auth token - token
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex
Function GetTagsList(Val Token) Export

    Headers = OPI_YandexID.GetAuthorizationHeader(Token);
    URL     = "https://api-metrika.yandex.net/management/v1/labels";

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion
