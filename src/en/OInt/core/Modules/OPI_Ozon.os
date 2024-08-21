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

#Region UploadingAndUpdatingProducts

// Create update product
// Creates new products or updates existing products, based on data structures
//
// Note
// Methods of product structure formation: GetProductStructure(), AddProductVideo(), AddProductVideoCover()
// Method at API documentation: [post /v3/product/import](@docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsV3)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductsArray - Array Of String - Array or one structure of product description fields - items
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function CreateUpdateProducts(Val ClientID, Val APIKey, Val ProductsArray) Export

    URL = "https://api-seller.ozon.ru/v3/product/import";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("items", ProductsArray, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get product creation status
// Gets the status of adding a new product by task ID
//
// Note
// Method at API documentation: [post /v1/product/import/info](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetImportProductsInfo)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// TaskID - String, Number - Add product task ID - taskid
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductCreationStatus(Val ClientID, Val APIKey, Val TaskID) Export

    URL = "https://api-seller.ozon.ru/v1/product/import/info";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("task_id", TaskID, "String", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get product structure
// Gets the structure of product standard fields
//
// Note
// This structure should be supplemented with fields that depend on the product category from GetCategoryAttributes()
// The first image in the image array (images field) will be the main image
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Product fields structure
Function GetProductStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ItemStructure = New Structure;
    ItemStructure.Insert("description_category_id", "<ID category product>");
    ItemStructure.Insert("name"                   , "<name product>");
    ItemStructure.Insert("offer_id"               , "<offer>");
    ItemStructure.Insert("barcode"                , "<barcode>");
    ItemStructure.Insert("price"                  , "<price>");
    ItemStructure.Insert("old_price"              , "<old price>");
    ItemStructure.Insert("vat"                    , "<VAT rate, e.g. 0.2>");
    ItemStructure.Insert("height"                 , "<height>");
    ItemStructure.Insert("width"                  , "<width>");
    ItemStructure.Insert("depth"                  , "<depth>");
    ItemStructure.Insert("dimension_unit"         , "<unit of measure for sizes, e.g. mm>");
    ItemStructure.Insert("weight"                 , "<weight>");
    ItemStructure.Insert("weight_unit"            , "<unit of measurement for weight, e.g. g>");
    ItemStructure.Insert("images"                 , "<array of product images URLs>");
    ItemStructure.Insert("images360"              , "<array of 360 images URLs>");
    ItemStructure.Insert("color_image"            , "<marketing color for pictures>");

    If Clear Then
        For Each Field In ItemStructure Do
            Field.Value = "";
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

// Add product video
// Adds video to product attributes
//
// Note
// In 1C the method can be used as a procedure, without getting a return value. Return value is required for CLI version
//
// Parameters:
// ItemStructure - Structure Of String - The basic structure of the product fields. See GetProductStructure - item
// URL - String - URL of the video - url
// Name - String - Technical name of the video - title
//
// Returns:
// Structure of KeyAndValue - Structure of product fields with added video
Function AddProductVideo(ItemStructure, Val URL, Val Name) Export

    OPI_TypeConversion.GetCollection(ItemStructure);
    OPI_TypeConversion.GetLine(URL);
    OPI_TypeConversion.GetLine(Name);

    VideoObject   = New Structure();
    URLStructure  = New Structure("value", URL);
    NameStructure = New Structure("value", Name);

    CompleteComplexAttribute(VideoObject, 21841, 100001, URLStructure);
    CompleteComplexAttribute(VideoObject, 21837, 100001, NameStructure);

    If Not ItemStructure.Property("complex_attributes") Then
        ItemStructure.Insert("complex_attributes", New Array);
    EndIf;

    ItemStructure["complex_attributes"].Add(VideoObject);

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

// Add product video cover
// Adds a video cover to the product attributes
//
// Note
// In 1C the method can be used as a procedure, without getting a return value. Return value is required for CLI version
//
// Parameters:
// ItemStructure - Structure Of String - The basic structure of the product fields. See GetProductStructure - item
// URL - String - URL of the video cover - url
//
// Returns:
// Structure of KeyAndValue - Structure of product fields with added video
Function AddProductVideoCover(ItemStructure, Val URL) Export

    OPI_TypeConversion.GetCollection(ItemStructure);
    OPI_TypeConversion.GetLine(URL);

    CoverObject  = New Structure();
    URLStructure = New Structure("dictionary_value_id,value", 0, URL);

    CompleteComplexAttribute(CoverObject, 21845, 100002, URLStructure);

    If Not ItemStructure.Property("complex_attributes") Then
        ItemStructure.Insert("complex_attributes", New Array);
    EndIf;

    ItemStructure["complex_attributes"].Add(CoverObject);

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

// Complete the complex attribute
// Formats the value in attribute format and adds it to the <attributes> array of the collection
//
// Note
// In 1C the method can be used as a procedure, without getting a return value. Return value is required for CLI version
//
// Parameters:
// Collection - Structure Of String - Complex attribute structure or product structure - object
// AttributeID - String, Number - Attribute ID - attributeid
// ComplexID - String, Number - Complex attribute ID - complexid
// Values - Arbitrary - Value or array of values to add to <values> field - values
//
// Returns:
// Structure - A collection enhanced with a new attribute
Function CompleteComplexAttribute(Collection, Val AttributeID, Val ComplexID, Val Values) Export

    OPI_TypeConversion.GetArray(Values);

    AttributeStructure = New Structure("id,complex_id,values", AttributeID, ComplexID, Values);

    If Not Collection.Property("attributes") Then
        Collection.Insert("attributes", New Array);
    EndIf;

    Collection["attributes"].Add(AttributeStructure);

    //@skip-check constructor-function-return-section
    Return Collection;

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
