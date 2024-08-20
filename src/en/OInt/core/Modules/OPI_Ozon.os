// OneScript: ./OInt/core/Modules/OPI_Ozon.os
// Lib: Ozon
// CLI: ozon

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

#Region AttributesAndFeatures

// Get categories and product types tree
// Returns the categories and types for products in a tree view
//
// Note
// Product creation is only available in the last level categories, compare exactly with the categories on your site. Categories are not created at the user's request
// Carefully choose the category for the product: different commission rates apply for different categories.
// Method at API documentation: [post /v1/description-category/tree](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetTree)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// Lang - String - Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) - lang
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetCategoriesAndProductTypesTree(Val ClientID, Val APIKey, Val Lang = "DEFAULT") Export

    URL = "https://api-seller.ozon.ru/v1/description-category/tree";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("language", Lang, "String", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get category attributes
// Gets the characteristics for the specified category and product type
//
// Note
// If dictionary_id has a value of 0, the attribute has no nested directories. If the value is different, there are directories. You can get them using the GetValuesCharacteristics method()
// Method at API documentation: [post /v1/description-category/attribute](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributes)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// CategoryID - String, Number - Category identifier - categoryid
// TypeID - String, Number - Item type identifier - typeid
// Lang - String - Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) - lang
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetCategoryAttributes(Val ClientID
    , Val APIKey
    , Val CategoryID
    , Val TypeID
    , Val Lang = "DEFAULT") Export

    URL = "https://api-seller.ozon.ru/v1/description-category/attribute";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("description_category_id", CategoryID, "String", Parameters);
    OPI_Tools.AddField("type_id"                , TypeID    , "String", Parameters);
    OPI_Tools.AddField("language"               , Lang      , "String", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get attribute values
// Gets the list of available values of the attribute
//
// Note
// You can find out if there is a nested catalog by the GetCharacteristicsCategories method()
// Method at API documentation: [post /v1/description-category/attribute/values](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_GetAttributeValues)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// CategoryID - String, Number - Category identifier - categoryid
// TypeID - String, Number - Item type identifier - typeid
// AttributeID - String, Number - Attribute IDs for obtaining values - attributeid
// CatalogID - String, Number - ID of the first catalog in the response - start
// Lang - String - Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) - lang
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetAttributeValues(Val ClientID
    , Val APIKey
    , Val CategoryID
    , Val TypeID
    , Val AttributeID
    , Val CatalogID = 1
    , Val Lang = "DEFAULT") Export

    URL = "https://api-seller.ozon.ru/v1/description-category/attribute/values";

    Headers = CreateRequestHeaders(ClientID, APIKey);
    Limit   = 200;

    Parameters = New Structure;
    OPI_Tools.AddField("description_category_id", CategoryID   , "String", Parameters);
    OPI_Tools.AddField("type_id"                , TypeID       , "String", Parameters);
    OPI_Tools.AddField("attribute_id"           , AttributeID  , "String", Parameters);
    OPI_Tools.AddField("language"               , Lang         , "String", Parameters);
    OPI_Tools.AddField("limit"                  , Limit        , "String", Parameters);
    OPI_Tools.AddField("last_value_id"          , CatalogID - 1, "String", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Search attribute value
// Gets the reference values of the attribute by the specified value
//
// Note
// You can find out if there is a nested catalog by the GetCharacteristicsCategories method()
// Method at API documentation: [post /v1/description-category/attribute/values/search](@docs.ozon.ru/api/seller/#operation/DescriptionCategoryAPI_SearchAttributeValues)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// CategoryID - String, Number - Category identifier - categoryid
// TypeID - String, Number - Item type identifier - typeid
// AttributeID - String, Number - Attribute IDs for obtaining values - attributeid
// Value - String - Search value - value
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function SearchAttributeValue(Val ClientID
    , Val APIKey
    , Val CategoryID
    , Val TypeID
    , Val AttributeID
    , Val Value) Export

    URL = "https://api-seller.ozon.ru/v1/description-category/attribute/values/search";

    Headers = CreateRequestHeaders(ClientID, APIKey);
    Limit   = 100;

    Parameters = New Structure;
    OPI_Tools.AddField("description_category_id", CategoryID  , "String", Parameters);
    OPI_Tools.AddField("type_id"                , TypeID      , "String", Parameters);
    OPI_Tools.AddField("attribute_id"           , AttributeID , "String", Parameters);
    OPI_Tools.AddField("limit"                  , Limit       , "String", Parameters);
    OPI_Tools.AddField("value"                  , Value       , "String", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function CreateRequestHeaders(Val ClientID, Val APIKey)

    Headers = New Map;

    OPI_Tools.AddField("Client-Id", ClientID, "String", Headers);
    OPI_Tools.AddField("Api-Key"  , APIKey  , "String", Headers);

    Return Headers;

EndFunction

#EndRegion
