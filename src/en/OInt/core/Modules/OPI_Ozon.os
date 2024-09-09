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

// Get products requests limits
// Get requests limits for products managment methods
//
// Note
// Method at API documentation: [post /v4/product/info/limit](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetUploadQuota)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductsRequestsLimits(Val ClientID, Val APIKey) Export

    URL = "https://api-seller.ozon.ru/v4/product/info/limit";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Response = OPI_Tools.Post(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region UploadingAndUpdatingProducts

// Get product list
// Gets a list of products with or without filter
//
// Note
// Method at API documentation: [post /v2/product/list](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// Filter - Structure of KeyAndValue - Product selection filter. See GetProductsFilterStructure - filter
// LastID - String, Number - ID of the last value (last_id) from the previous response - last
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductList(Val ClientID, Val APIKey, Val Filter = "", Val LastID = 0) Export

    URL = "https://api-seller.ozon.ru/v2/product/list";

    Headers = CreateRequestHeaders(ClientID, APIKey);
    Limit   = 200;

    Parameters = New Structure;
    OPI_Tools.AddField("filter" , Filter , "Collection", Parameters);
    OPI_Tools.AddField("limit"  , Limit  , "String"    , Parameters);
    OPI_Tools.AddField("last_id", LastID , "String"    , Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get products attributes data
// Retrieves product attributes descriptions with or without filtering
//
// Note
// Method at API documentation: [post /v3/products/info/attributes](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductAttributesV3)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// Filter - Structure of KeyAndValue - Product selection filter. See GetProductsFilterStructure - filter
// LastID - String, Number - ID of the last value (last_id) from the previous response - last
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductsAttributesData(Val ClientID
    , Val APIKey
    , Val Filter = ""
    , Val LastID = 0) Export

    URL = "https://api-seller.ozon.ru/v3/products/info/attributes";

    Headers = CreateRequestHeaders(ClientID, APIKey);
    Limit   = 200;

    Parameters = New Structure;
    OPI_Tools.AddField("filter" , Filter , "Collection", Parameters);
    OPI_Tools.AddField("limit"  , Limit  , "String"    , Parameters);
    OPI_Tools.AddField("last_id", LastID , "String"    , Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get products informations
// Gets information about products by an array of identifiers
//
// Note
// Specify the minimum price of the product after all promotions have been applied in your personal cabinet. The min_price parameter from the method response is being reworked and returns 0
// The active_product parameter is deprecated, use the values of the visible parameter
// The fbs_sku and fbo_sku parameters from the method response were disabled on August 15, 2023
// The body of the request must contain a single identifier or an array of identical identifiers, the response will be an array of items
// Method at API documentation: [post /v2/product/info/list](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoListV2)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductsID - Number, Array Of Number - Products identifier - productid
// SKU - Number, Array Of Number - Products identifiers in the Ozon system (SKU) - sku
// Articles - String, Array of String - Item identifiers in the vendor's system (Article) - offerid
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductsInformation(Val ClientID
    , Val APIKey
    , Val ProductsID = 0
    , Val SKU = 0
    , Val Articles = "") Export

    URL = "https://api-seller.ozon.ru/v2/product/info/list";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("offer_id"  , Articles  , "Array" , Parameters);
    OPI_Tools.AddField("product_id", ProductsID, "Array" , Parameters);
    OPI_Tools.AddField("sku"       , SKU       , "Array" , Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get product description
// Get product description by IDs
//
// Note
// Method at API documentation: [post /v1/product/info/description](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoDescription)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductID - String, Number - Product identifier - productid
// Article - String, Number - Item identifier in the vendor's system (Article) - offerid
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductDescription(Val ClientID, Val APIKey, Val ProductID = 0, Val Article = "") Export

    URL = "https://api-seller.ozon.ru/v1/product/info/description";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("offer_id"  , Article  , "String" , Parameters);
    OPI_Tools.AddField("product_id", ProductID, "Number" , Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get products content rating
// Gets products content rating by SKU
//
// Note
// Method at API documentation: [post /v1/product/rating-by-sku](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductRatingBySku)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// SKU - Number, Array Of Number - Products identifiers in the Ozon system (SKU) - sku
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductsContentRating(Val ClientID, Val APIKey, Val SKU) Export

    URL = "https://api-seller.ozon.ru/v1/product/rating-by-sku";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("skus", SKU, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create update product
// Creates new products or updates existing products, based on data structures
//
// Note
// Methods of product structure formation: GetProductStructure(), AddProductVideo(), AddProductVideoCover()
// Uploading status check - GetProductCreationStatus()
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

    Response = SendObjectsDescription(ClientID, APIKey, ProductsArray, URL);

    Return Response;

EndFunction

// Create products by Ozon ID
// Creates a product by specified Ozon ID
//
// Note
// You can get an empty structure using the GetSimplifiedProductStructure method()
// It is not possible to update a product fields by Ozon ID
// Method at API documentation: [post /v1/product/import-by-sku](@docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsBySKU)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductsArray - Array Of String - Array or one simplified structure of product fields - items
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function CreateProductByOzonID(Val ClientID, Val APIKey, Val ProductsArray) Export

    URL = "https://api-seller.ozon.ru/v1/product/import-by-sku";

    Response = SendObjectsDescription(ClientID, APIKey, ProductsArray, URL);

    Return Response;

EndFunction

// Update products attributes
// Updates the attributes of the selected items
//
// Note
// You can get an empty structure using the GetAttributesUpdateStructure method()
// Method at API documentation: [post /v1/product/attributes/update](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUpdateAttributes)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// AttributesArray - Array Of String - Array or one structure of product attribute fields - items
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function UpdateProductsAttributes(Val ClientID, Val APIKey, Val AttributesArray) Export

    URL = "https://api-seller.ozon.ru/v1/product/attributes/update";

    Response = SendObjectsDescription(ClientID, APIKey, AttributesArray, URL);

    Return Response;

EndFunction

// Update product images
// Update images and marketing color
//
// Note
// On each method call, send all the images that should be on the product card
// To upload, pass the URL of the image to public cloud storage. The format of the image is JPG or PNG
// If you want to change the composition or order of the images, get the information using the GetProductInformation() method, copy the data of the images, images360, color_image fields, change and complete the composition or order as needed
// Method at API documentation: [post /v1/product/pictures/import](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductImportPictures)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductID - String, Number - Product identifier - productid
// ImagesArray - Array Of String - Array of images URLs - images
// Array360 - Array Of String - Array of 360 images - images360
// MarketingColor - String - Marketing color - color
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function UpdateProductImages(Val ClientID
    , Val APIKey
    , Val ProductID
    , Val ImagesArray = ""
    , Val Array360 = ""
    , Val MarketingColor = "") Export

    URL = "https://api-seller.ozon.ru/v1/product/pictures/import";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("product_id" , ProductID     , "Number" , Parameters);
    OPI_Tools.AddField("color_image", MarketingColor, "String" , Parameters);
    OPI_Tools.AddField("images"     , ImagesArray   , "Array"  , Parameters);
    OPI_Tools.AddField("images360"  , Array360      , "Array"  , Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Check products images upload
// Check images upload by products IDs
//
// Note
// Method at API documentation: [post /v1/product/pictures/info](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductInfoPictures)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductsID - String, Number, Array of String, Number - Product IDs to be inspected - products
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function CheckProductsImagesUpload(Val ClientID, Val APIKey, Val ProductsID) Export

    URL = "https://api-seller.ozon.ru/v1/product/pictures/info";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("product_id", ProductsID, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Update products articles
// Modifies articles of existing products
//
// Note
// Method at API documentation: [post /v1/product/update/offer-id](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUpdateOfferID)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ArticlesMap - Map Of KeyAndValue - Articles: Key > current, Value > new - offers
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function UpdateProductsArticles(Val ClientID, Val APIKey, Val ArticlesMap) Export

    OPI_TypeConversion.GetCollection(ArticlesMap);

    If TypeOf(ArticlesMap) = Type("Array") Then
        Raise "Article value type error ";
    EndIf;

    ArrayOfObjects = New Array;

    For Each ArticlesPair In ArticlesMap Do
        ArrayOfObjects.Add(New Structure("offer_id,new_offer_id", ArticlesPair.Key, ArticlesPair.Value));
    EndDo;

    URL = "https://api-seller.ozon.ru/v1/product/update/offer-id";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("update_offer_id", ArrayOfObjects, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Archive products
// Moves selected items to the archive
//
// Note
// You can pass up to 100 identifiers at a time
// Method at API documentation: [post /v1/product/archive](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductArchive)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductsID - String, Number, Array of String, Number - Product IDs for archiving - products
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function ArchiveProducts(Val ClientID, Val APIKey, Val ProductsID) Export

    URL = "https://api-seller.ozon.ru/v1/product/archive";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("product_id", ProductsID, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Unarchive products
// Returns selected items from the archive
//
// Note
// You can restore from the archive no more than 10 products that were automatically archived per day. There are no restrictions on unarchiving products that were manually moved to the archive.
// Method at API documentation: [post /v1/product/unarchive](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductUnarchive)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductsID - String, Number, Array of String, Number - Product IDs for recovery - products
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function UnarchiveProducts(Val ClientID, Val APIKey, Val ProductsID) Export

    URL = "https://api-seller.ozon.ru/v1/product/unarchive";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("product_id", ProductsID, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Delete products without SKU
// Deletes products without SKU from archive
//
// Note
// The product must be pre-archived (see ArchiveProducts)
// Up to 500 identifiers can be passed in one request
// Method at API documentation: [post /v2/products/delete](@docs.ozon.ru/api/seller/#operation/ProductAPI_DeleteProducts)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// Articles - String, Number, Array of String, Number - Products articles - articles
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function DeleteProductsWithoutSKU(Val ClientID, Val APIKey, Val Articles) Export

    OPI_TypeConversion.GetArray(Articles);

    URL = "https://api-seller.ozon.ru/v2/products/delete";

    Headers       = CreateRequestHeaders(ClientID, APIKey);
    ProductsArray = New Array;

    For Each Article In Articles Do

        CurrentArticle = OPI_Tools.NumberToString(Article);
        ProductsArray.Add(New Structure("offer_id", CurrentArticle));

    EndDo;

    Parameters = New Structure;
    OPI_Tools.AddField("products", ProductsArray, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Upload product activations codes
// Uploads activation codes for a digital product or service
//
// Note
// The activation code is linked to the digital product card
// Uploading status check - GetCodesUploadStatus()
// Method at API documentation: [post /v1/product/upload_digital_codes](@docs.ozon.ru/api/seller/#operation/ProductAPI_UploadDigitalCode)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductID - Number - Product ID - productid
// Codes - String, Array of String - Digital product activation codes - codes
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function UploadProductActivationCodes(Val ClientID, Val APIKey, Val ProductID, Val Codes) Export

    URL = "https://api-seller.ozon.ru/v1/product/upload_digital_codes";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("product_id"   , ProductID, "Number" , Parameters);
    OPI_Tools.AddField("digital_codes", Codes    , "Array"  , Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get product subscribers count
// Gets the number of users who clicked Know about arrival button on the product page
//
// Note
// Method at API documentation: [post /v1/product/info/subscription](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoSubscription)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// SKU - Number, Array Of Number - Products identifiers in the Ozon system (SKU) - sku
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductSubscribersCount(Val ClientID, Val APIKey, Val SKU) Export

    URL = "https://api-seller.ozon.ru/v1/product/info/subscription";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("skus", SKU, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get related SKUs
// Gets a single SKU from the old SKU FBS and SKU FBO identifiers
//
// Note
// The response will contain all SKUs associated with the passed SKUs. The method can process any SKU, even hidden or deleted.
// Send up to 200 SKUs in a single request.
// Method at API documentation: [post /v1/product/related-sku/get](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductGetRelatedSKU)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// SKU - Number, Array Of Number - Products identifiers in the Ozon system (SKU) - sku
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetRelatedSKUs(Val ClientID, Val APIKey, Val SKU) Export

    URL = "https://api-seller.ozon.ru/v1/product/related-sku/get";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("sku", SKU, "Array", Parameters);

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

// Get codes upload status
// Gets the status of digital item codes upload by task ID
//
// Note
// Method at API documentation: [post /v1/product/upload_digital_codes/info](@docs.ozon.ru/api/seller/#operation/ProductAPI_UploadDigitalCodeInfo)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// TaskID - String, Number - Add product task ID - taskid
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetCodesUploadStatus(Val ClientID, Val APIKey, Val TaskID) Export

    URL = "https://api-seller.ozon.ru/v1/product/upload_digital_codes/info";

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
    ItemStructure.Insert("description_category_id", "<Product category ID>");
    ItemStructure.Insert("name"                   , "<product name>");
    ItemStructure.Insert("offer_id"               , "<article>");
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

// Get simplified product structure
// Gets the structure for creating a product based on Ozon ID in the CreateProductByOzonID function()
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Product fields structure
Function GetSimplifiedProductStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ItemStructure = New Structure;

    ItemStructure.Insert("name"         , "<name>");
    ItemStructure.Insert("sku"          , "<product identifier in the Ozon system>");
    ItemStructure.Insert("offer_id"     , "<article>");
    ItemStructure.Insert("price"        , "<price>");
    ItemStructure.Insert("old_price"    , "<old price>");
    ItemStructure.Insert("vat"          , "<VAT rate, e.g. 0.2>");
    ItemStructure.Insert("currency_code", "<currency>");

    If Clear Then
        For Each Field In ItemStructure Do
            Field.Value = "";
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

// Get attributes update structure
// Gets the structure for updating product characteristics in the UpdateProductsAttributes function()
//
// Note
// <Attributes> are structures with complex_id, id and values fields. For their quick creation there is the CompleteComplexAttribute method()
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Product fields structure
Function GetAttributesUpdateStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ItemStructure = New Structure;

    ItemStructure.Insert("offer_id"  , "<article>");
    ItemStructure.Insert("attributes", "<array of updatable attributes>");

    If Clear Then
        For Each Field In ItemStructure Do
            Field.Value = "";
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

// Get products filter structure
// Gets the structure for selecting the list of goods in the functions GetProductList and GetProductsStocks
//
// Note
// The description of the filter fields can be found on the documentation page for product list retrieving method: [post /v2/product/list](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductList)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Filter fields structure
Function GetProductsFilterStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ItemStructure = New Structure;

    ItemStructure.Insert("offer_id"  , "<articles array>");
    ItemStructure.Insert("product_id", "<Products IDs array>");
    ItemStructure.Insert("visibility", "<visibility>");

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

#Region Barcodes

// Bind barcodes
// Binds barcodes to products
//
// Note
// Method at API documentation: [post /v1/barcode/add](@docs.ozon.ru/api/seller/#operation/add-barcode)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// BarcodesMap - Map Of KeyAndValue - Key > product SKU, Value > barcode - barcodes
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function BindBarcodes(Val ClientID, Val APIKey, Val BarcodesMap) Export

    OPI_TypeConversion.GetCollection(BarcodesMap);

    URL = "https://api-seller.ozon.ru/v1/barcode/add";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    BarcodesArray = New Array;

    For Each Barcode In BarcodesMap Do

        BarcodeStructure = New Structure;
        OPI_Tools.AddField("sku"    , Barcode.Key  , "Number" , BarcodeStructure);
        OPI_Tools.AddField("barcode", Barcode.Value, "String" , BarcodeStructure);

        BarcodesArray.Add(BarcodeStructure);

    EndDo;

    Parameters = New Structure;
    OPI_Tools.AddField("barcodes", BarcodesArray, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create barcodes
// Generates new barcodes for products
//
// Note
// You can create barcodes for a maximum of 100 products per request
// From one merchant account, you can use the method no more than 20 times per minute
// Method at API documentation: [post /v1/barcode/generate](@docs.ozon.ru/api/seller/#operation/generate-barcode)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// ProductsID - String, Array of String - Products IDs for barcodes creating - productids
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function CreateBarcodes(Val ClientID, Val APIKey, Val ProductsID) Export

    URL = "https://api-seller.ozon.ru/v1/barcode/generate";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("product_ids", ProductsID, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion

#Region PricesAndStocks

// Get products stocks
// Gets the number of items in the balance with or without filtering
//
// Note
// Method at API documentation: [post /v3/product/info/stocks](@docs.ozon.ru/api/seller/#operation/ProductAPI_GetProductInfoStocksV3)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// Filter - Structure of KeyAndValue - Product selection filter. See GetProductsFilterStructure - filter
// LastID - String, Number - ID of the last value (last_id) from the previous response - last
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetProductsStocks(Val ClientID, Val APIKey, Val Filter = "", Val LastID = 0) Export

    URL = "https://api-seller.ozon.ru/v3/product/info/stocks";

    Headers = CreateRequestHeaders(ClientID, APIKey);
    Limit   = 100;

    Parameters = New Structure;
    OPI_Tools.AddField("filter" , Filter , "Collection", Parameters);
    OPI_Tools.AddField("limit"  , Limit  , "String"    , Parameters);
    OPI_Tools.AddField("last_id", LastID , "String"    , Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Update products stocks
// Changes the information about the stock amount of a product
//
// Note
// You can change availability for 100 products per request. You can send up to 80 requests per minute from one merchant account.
// You can only update the stock of an item in one warehouse once every 2 minutes. You can set the availability of a product only after its status changes to price_sent
// Stocks of bulky goods can only be renewed in the warehouses designated for them
// Method at API documentation: [post /v2/products/stocks](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductsStocksV2)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// Stocks - Array of Structure - Array of stocks data. See GetProductStocksStructure - stocks
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function UpdateProductsStocks(Val ClientID, Val APIKey, Val Stocks) Export

    URL = "https://api-seller.ozon.ru/v2/products/stocks";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("stocks", Stocks, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Update products prices
// Changes the price of one or more items
//
// Note
// Method at API documentation: [post /v1/product/import/prices](@docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsPrices)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
// Prices - Array of Structure - Products prices. See GetProductPriceStructure - prices
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function UpdateProductsPrices(Val ClientID, Val APIKey, Val Prices) Export

    URL = "https://api-seller.ozon.ru/v1/product/import/prices";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("prices", Prices, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get product stocks structure
// Gets the data structure for udpating product stocks in the UpdateProductsStocks function
//
// Note
// The description of the filter fields can be found on the documentation page for product list retrieving method: [post /v2/products/stocks](@docs.ozon.ru/api/seller/#operation/ProductAPI_ProductsStocksV2)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Filter fields structure
Function GetProductStocksStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ItemStructure = New Structure;

    ItemStructure.Insert("offer_id"    , "<article>");
    ItemStructure.Insert("product_id"  , "<Product ID>");
    ItemStructure.Insert("stock"       , "<amount>");
    ItemStructure.Insert("warehouse_id", "<Warehouse ID>");

    If Clear Then
        For Each Field In ItemStructure Do
            Field.Value = "";
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

// Get product price structure
// Gets the product price structure for the UpdateProductsPrices function
//
// Note
// The description of the filter fields can be found on the documentation page for product list retrieving method: [post /v1/product/import/prices](@docs.ozon.ru/api/seller/#operation/ProductAPI_ImportProductsPrices)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Filter fields structure
Function GetProductPriceStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ItemStructure = New Structure;

    ItemStructure.Insert("auto_action_enabled"   , "<Enable auto application of shares: ENABLED or DISABLED>");
    ItemStructure.Insert("currency_code"         , "<currency>");
    ItemStructure.Insert("min_price"             , "<minimum price of product after promotions have been applied>");
    ItemStructure.Insert("offer_id"              , "<product identifier in the sellers system>");
    ItemStructure.Insert("old_price"             , "<price before discounts; specify 0 if no discounts are available>");
    ItemStructure.Insert("price"                 , "<product price with discounts>");
    ItemStructure.Insert("price_strategy_enabled", "<auto application of price strategies: ENABLED or DISABLED>");
    ItemStructure.Insert("product_id"            , "<Product ID>");


    If Clear Then
        For Each Field In ItemStructure Do
            Field.Value = "";
        EndDo;
    EndIf;

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

#EndRegion

#Region WarehousesManagment

// Get warehouses list
// Gets compnay warehouses list
//
// Note
// Method at API documentation: [post /v1/warehouse/list](@docs.ozon.ru/api/seller/#operation/WarehouseAPI_WarehouseList)
//
// Parameters:
// ClientID - String - Client identifier - clientid
// APIKey - String - API key - apikey
//
// Returns:
// Map Of KeyAndValue - Serialized JSON response from Ozon Seller API
Function GetWarehousesList(Val ClientID, Val APIKey) Export

    URL = "https://api-seller.ozon.ru/v1/warehouse/list";

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Response = OPI_Tools.Post(URL, , Headers);

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

Function SendObjectsDescription(Val ClientID, Val APIKey, Val ArrayOfObjects, Val URL)

    Headers = CreateRequestHeaders(ClientID, APIKey);

    Parameters = New Structure;
    OPI_Tools.AddField("items", ArrayOfObjects, "Array", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

#EndRegion
