// OneScript: ./OInt/core/Modules/OPI_YandexMarket.os
// Lib: Yandex Market
// CLI: yamarket

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

#Region CampaignsAndBusiness

// Get markets list
// Gets the list of shops in the cabinet by token
//
// Note
// Method at API documentation: [List of users shops](@yandex.ru/dev/market/partner-api/doc/ru/reference/campaigns/getCampaigns)
//
// Parameters:
// Token - String - Authorisation token (Api-Key) - token
// Page - Number - Issue page number of the list - page
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetMarketsList(Val Token, Val Page = 1) Export

    URL     = "https://api.partner.market.yandex.ru/campaigns";
    Headers = CreateRequestHeaders(Token);

    PageSize = 100;

    Parameters = New Structure;
    OPI_Tools.AddField("page"    , Page    , "Number", Parameters);
    OPI_Tools.AddField("pageSize", PageSize, "Number", Parameters);

    Response = OPI_Tools.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get market
// Gets information about a market (campaign) by ID
//
// Note
// Method at API documentation: [Market information](@yandex.ru/dev/market/partner-api/doc/ru/reference/campaigns/getCampaign)
//
// Parameters:
// Token - String - Authorisation token (Api-Key) - token
// CampaignID - String, Number - Market ID (campaignsId) - campaign
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetMarket(Val Token, Val CampaignID) Export

    OPI_TypeConversion.GetLine(CampaignID);

    URL     = "https://api.partner.market.yandex.ru/campaigns/" + CampaignID;
    Headers = CreateRequestHeaders(Token);

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

// Get business settings
// Gets the values of cabinet (business) settings by ID
//
// Note
// Method at API documentation: [Cabinet settings](@yandex.ru/dev/market/partner-api/doc/ru/reference/businesses/getBusinessSettings)
//
// Parameters:
// Token - String - Authorisation token (Api-Key) - token
// AccountID - String, Number - Business ID - business
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetBusinessSettings(Val Token, Val AccountID) Export

    OPI_TypeConversion.GetLine(AccountID);

    URL     = "https://api.partner.market.yandex.ru/businesses/%1/settings";
    URL     = StrTemplate(URL, AccountID);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_Tools.Post(URL, , Headers);

    Return Response;

EndFunction

// Get campaign settings
// Gets market (campaign) settings by ID
//
// Note
// Method at API documentation: [Market settings](@yandex.ru/dev/market/partner-api/doc/ru/reference/campaigns/getCampaignSettings)
//
// Parameters:
// Token - String - Authorisation token (Api-Key) - token
// CampaignID - String, Number - Market ID (campaignsId) - campaign
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetCampaignSettings(Val Token, Val CampaignID) Export

    OPI_TypeConversion.GetLine(CampaignID);

    URL     = "https://api.partner.market.yandex.ru/campaigns/%1/settings";
    URL     = StrTemplate(URL, CampaignID);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_Tools.Get(URL, , Headers);

    Return Response;

EndFunction

#EndRegion

#Region ProductManagement

// Add update products
// Adds or updates product information in the catalogue
//
// Note
// Method at API documentation: [Adding products to the catalogue and changing information about them](@yandex.ru/dev/market/partner-api/doc/ru/reference/business-assortment/updateOfferMappings)
//
// Parameters:
// Token - String - Authorisation token (Api-Key) - token
// AccountID - String, Number - Business ID - business
// ProductsArray - Structure, Array of Structure - Array of product descriptions - offers
// OwnImages - Boolean - A flag of using only your own product images - pmedia
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function AddUpdateProducts(Val Token, Val AccountID, Val ProductsArray, Val OwnImages = False) Export

    OPI_TypeConversion.GetLine(AccountID);

    URL     = "https://api.partner.market.yandex.ru/businesses/%1/offer-mappings/update";
    URL     = StrTemplate(URL, AccountID);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("offerMappings"          , ProductsArray , "Array"  , Parameters);
    OPI_Tools.AddField("onlyPartnerMediaContent", OwnImages     , "Boolean", Parameters);

    Response = OPI_Tools.Post(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get product structure
// Gets the structure of product standard fields
//
// Note
// Description in the API documentation: [UpdateOfferDTO](@https://yandex.ru/dev/market/partner-api/doc/ru/reference/business-assortment/updateOfferMappings#updateofferdto)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure of KeyAndValue - Product fields structure
Function GetProductStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    ItemStructure = New Structure;
    ItemStructure.Insert("offerId", "<item ID in your system>");

        ExpenseStructure = New Structure;
        ExpenseStructure.Insert("currencyId" , "<Currency code>");
        ExpenseStructure.Insert("value"      , "<additional costs>");

    ItemStructure.Insert("additionalExpenses", ExpenseStructure);
    ItemStructure.Insert("adult"             , "<parameter includes mark for the product 18+>");

        AgeStructure = New Structure;
        AgeStructure.Insert("ageUnit", "<unit: YEAR, MONTH>");
        AgeStructure.Insert("value"  , "<age limit>");

    ItemStructure.Insert("age", AgeStructure);

        BarcodesArray = New Array;
        BarcodesArray.Add("<barcode>");

    ItemStructure.Insert("barcodes", BarcodesArray);

        BasePriceStructure = New Structure;
        BasePriceStructure.Insert("currencyId"  , "<Currency code>");
        BasePriceStructure.Insert("value"       , "<price>");
        BasePriceStructure.Insert("discountBase", "<pre-discount price>");

    ItemStructure.Insert("basicPrice", BasePriceStructure);
    ItemStructure.Insert("boxCount"  , "<number of cargo spaces>");
    ItemStructure.Insert("category"  , "<product category in your shop>");

        CertificatesArray = New Array;
        CertificatesArray.Add("<item document number>");

    ItemStructure.Insert("certificates", CertificatesArray);

        PriceForDiscountsStructure = New Structure;
        PriceForDiscountsStructure.Insert("currencyId" , "<Currency code>");
        PriceForDiscountsStructure.Insert("value"      , "<price>");

    ItemStructure.Insert("cofinancePrice", PriceForDiscountsStructure);

        StateStructure = New Structure;
        StateStructure.Insert("quality", "<product appearance>");
        StateStructure.Insert("reason" , "<defect description>");
        StateStructure.Insert("type"   , "<discount type>");

    ItemStructure.Insert("condition", StateStructure);

    // TODO: Finish
    ItemStructure.Insert("customsCommodityCode", "<commodity code TN VED>");
    ItemStructure.Insert("description", "<detailed product description>");
    ItemStructure.Insert("downloadable", "<digital attribute>");
    ItemStructure.Insert("guaranteePeriod", "<warranty period>");
    ItemStructure.Insert("lifeTime", "<lifespan>");

        ManualsArray = New Array;
        ManualsArray.Add("<manual>");

    ItemStructure.Insert("manuals", ManualsArray);

        CountriesArray = New Array;
        CountriesArray.Add("<country of manufacture>");

    ItemStructure.Insert("manufacturerCountries", CountriesArray);
    ItemStructure.Insert("marketCategoryId"     , "<category identifier on the Market>");
    ItemStructure.Insert("name"                 , "<product name>");

        AttributesArray = New Array;
        AttributesArray.Add("<feature>");

    ItemStructure.Insert("parameterValues", AttributesArray);

        ImageArray = New Array;
        ImageArray.Add("<product picture link>");

    ItemStructure.Insert("pictures"     , ImageArray);
    ItemStructure.Insert("purchasePrice", "<cost price>");
    ItemStructure.Insert("shelfLife"    , "<expiry date>");

        TagsArray = New Array;
        TagsArray.Add("<tag>");

    ItemStructure.Insert("tags"      , TagsArray);
    ItemStructure.Insert("type"      , "<specific product type>");
    ItemStructure.Insert("vendor"    , "<brand or manufacturer name>");
    ItemStructure.Insert("vendorCode", "<manufacturers item number>");

        VideosArray = New Array;
        VideosArray.Add("<video URL>");

    ItemStructure.Insert("videos"          , VideosArray);
    ItemStructure.Insert("weightDimensions", "<product dimensions and weight>");

    If Clear Then
        ItemStructure = OPI_Tools.ClearCollectionRecursively(ItemStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return ItemStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function CreateRequestHeaders(Val Token)

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Api-Key", Token);
    Return Headers;

EndFunction

#EndRegion
