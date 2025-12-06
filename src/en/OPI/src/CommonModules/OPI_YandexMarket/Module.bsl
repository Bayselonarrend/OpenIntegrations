// OneScript: ./OInt/core/Modules/OPI_YandexMarket.os
// Lib: Yandex Market
// CLI: yamarket
// Depends: OPI_YandexID

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

//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check wrong-string-literal-content
//@skip-check method-too-many-params

#Region Public

#Region CampaignsAndBusiness

// Get markets list
// Gets the list of shops in the cabinet by token
//
// Note
// Method at API documentation: [List of users shops](@yandex.ru/dev/market/partner-api/doc/ru/reference/campaigns/getCampaigns)
//
// Parameters:
// Token - String - Authorization token (Api-Key) - token
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

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get market
// Gets information about a market (campaign) by ID
//
// Note
// Method at API documentation: [Market information](@yandex.ru/dev/market/partner-api/doc/ru/reference/campaigns/getCampaign)
//
// Parameters:
// Token - String - Authorization token (Api-Key) - token
// CampaignID - String, Number - Market ID (campaignsId) - campaign
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetMarket(Val Token, Val CampaignID) Export

    OPI_TypeConversion.GetLine(CampaignID);

    URL     = "https://api.partner.market.yandex.ru/campaigns/" + CampaignID;
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Get business settings
// Gets the values of cabinet (business) settings by ID
//
// Note
// Method at API documentation: [Cabinet settings](@yandex.ru/dev/market/partner-api/doc/ru/reference/businesses/getBusinessSettings)
//
// Parameters:
// Token - String - Authorization token (Api-Key) - token
// AccountID - String, Number - Business ID - business
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetBusinessSettings(Val Token, Val AccountID) Export

    OPI_TypeConversion.GetLine(AccountID);

    URL     = "https://api.partner.market.yandex.ru/businesses/%1/settings";
    URL     = StrTemplate(URL, AccountID);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, , Headers);

    Return Response;

EndFunction

// Get campaign settings
// Gets market (campaign) settings by ID
//
// Note
// Method at API documentation: [Market settings](@yandex.ru/dev/market/partner-api/doc/ru/reference/campaigns/getCampaignSettings)
//
// Parameters:
// Token - String - Authorization token (Api-Key) - token
// CampaignID - String, Number - Market ID (campaignsId) - campaign
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetCampaignSettings(Val Token, Val CampaignID) Export

    OPI_TypeConversion.GetLine(CampaignID);

    URL     = "https://api.partner.market.yandex.ru/campaigns/%1/settings";
    URL     = StrTemplate(URL, CampaignID);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

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
// Token - String - Authorization token (Api-Key) - token
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

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get campaign products
// Gets the list of products of the selected market (campaign)
//
// Note
// Method at API documentation: [Information o productх, that рaзмещены in зaдaнbutм мaгaзandnot](@https://yandex.ru/dev/market/partner-api/doc/ru/reference/assortment/getCampaignOffers)
//
// Parameters:
// Token - String - Authorization token (Api-Key) - token
// CampaignID - String, Number - Campaign ID - business
// Filters - Structure Of KeyAndValue - Product filters - filters
// PageToken - String - Next page token in case of a large selection - page
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetCampaignProducts(Val Token, Val CampaignID, Val Filters = "", Val PageToken = "") Export

    OPI_TypeConversion.GetLine(CampaignID);
    OPI_TypeConversion.GetLine(PageToken);

    URL     = "https://api.partner.market.yandex.ru/campaigns/%1/offers";
    URL     = StrTemplate(URL, CampaignID);
    Headers = CreateRequestHeaders(Token);

    If ValueIsFilled(PageToken) Then
        URL = URL + "?page_token=" + PageToken;
    EndIf;

    If ValueIsFilled(Filters) Then
        OPI_TypeConversion.GetCollection(Filters);
        Response = OPI_HTTPRequests.PostWithBody(URL, Filters, Headers);
    Else
        Response = OPI_HTTPRequests.PostWithBody(URL,        , Headers);
    EndIf;

    Return Response;

EndFunction

// Get business products
// Gets the list of products of the business
//
// Parameters:
// Token - String - Authorization token (Api-Key) - token
// AccountID - String, Number - Business ID - business
// Filters - Structure Of KeyAndValue - Product filters - filters
// PageToken - String - Next page token in case of a large selection - page
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from Yandex Market
Function GetBusinessProducts(Val Token, Val AccountID, Val Filters = "", Val PageToken = "") Export

    OPI_TypeConversion.GetLine(AccountID);
    OPI_TypeConversion.GetLine(PageToken);

    URL     = "https://api.partner.market.yandex.ru/businesses/%1/offer-mappings";
    URL     = StrTemplate(URL, AccountID);
    Headers = CreateRequestHeaders(Token);

    If ValueIsFilled(PageToken) Then
        URL = URL + "?page_token=" + PageToken;
    EndIf;

    If ValueIsFilled(Filters) Then
        OPI_TypeConversion.GetCollection(Filters);
        Response = OPI_HTTPRequests.PostWithBody(URL, Filters, Headers);
    Else
        Response = OPI_HTTPRequests.PostWithBody(URL,        , Headers);
    EndIf;

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
// Structure Of KeyAndValue - Product fields structure
Function GetProductStructure(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    // BSLLS:DuplicateStringLiteral-off

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

    ItemStructure.Insert("customsCommodityCode", "<commodity code TN VED>");
    ItemStructure.Insert("description"         , "<detailed product description>");
    ItemStructure.Insert("downloadable"        , "<digital attribute>");

        PeriodStructure = New Structure;
        PeriodStructure.Insert("timePeriod", "<duration value>");
        PeriodStructure.Insert("timeUnit"  , "<unit>");
        PeriodStructure.Insert("comment"   , "<comment>");

    ItemStructure.Insert("guaranteePeriod", PeriodStructure);
    ItemStructure.Insert("lifeTime"       , PeriodStructure);

        ManualsArray = New Array;

            ManualStructure = New Structure;
            ManualStructure.Insert("url"  , "<URL to manual>");
            ManualStructure.Insert("title", "<manual title>");

        ManualsArray.Add(ManualStructure);

    ItemStructure.Insert("manuals", ManualsArray);

        CountriesArray = New Array;
        CountriesArray.Add("<country of manufacture>");

    ItemStructure.Insert("manufacturerCountries", CountriesArray);
    ItemStructure.Insert("marketCategoryId"     , "<category identifier on the Market>");
    ItemStructure.Insert("name"                 , "<product name>");

        AttributesArray = New Array;

            AttributesStructure = New Structure;
            AttributesStructure.Insert("parameterId", "<attribute ID>");
            AttributesStructure.Insert("unitId"     , "<unit ID>");
            AttributesStructure.Insert("value"      , "<value>");
            AttributesStructure.Insert("valueId"    , "<enum ID>");

        AttributesArray.Add(AttributesStructure);

    ItemStructure.Insert("parameterValues", AttributesArray);

        ImageArray = New Array;
        ImageArray.Add("<product picture link>");

    ItemStructure.Insert("pictures" , ImageArray);

        PurchasePriceStructure = New Structure;
        PurchasePriceStructure.Insert("currencyId" , "<Currency code>");
        PurchasePriceStructure.Insert("value"      , "<price>");

    ItemStructure.Insert("purchasePrice", PurchasePriceStructure);
    ItemStructure.Insert("shelfLife"    , PeriodStructure);

        TagsArray = New Array;
        TagsArray.Add("<tag>");

    ItemStructure.Insert("tags"      , TagsArray);
    ItemStructure.Insert("type"      , "<specific product type>");
    ItemStructure.Insert("vendor"    , "<brand or manufacturer name>");
    ItemStructure.Insert("vendorCode", "<manufacturers item number>");

        VideosArray = New Array;
        VideosArray.Add("<video URL>");

    ItemStructure.Insert("videos" , VideosArray);

        SizesStructure = New Structure;
        SizesStructure.Insert("height", "<height, cm.>");
        SizesStructure.Insert("length", "<length, cm.>");
        SizesStructure.Insert("weight", "<weight, kg (gross)>");
        SizesStructure.Insert("width" , "<width, cm.>");

    ItemStructure.Insert("weightDimensions", "<product dimensions and weight>");

    // BSLLS:DuplicateStringLiteral-on

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
