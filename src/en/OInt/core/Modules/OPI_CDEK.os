// OneScript: ./OInt/core/Modules/OPI_CDEK.os
// Lib: CDEK
// CLI: cdek
// Keywords: cdek

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

#Region Public

#Region CommonMethods

// Get token
// Gets a token based on account ID and password
//
// Note:
// Method at API documentation: [Client authorization](@api-docs.cdek.ru/33828799.html)
//
// Parameters:
// Account - String - Client identifier (Account) - account
// Password - String - Secret key (Password) - pass
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetToken(Val Account, Val Password, TestAPI = False) Export

    String_ = "String";

    URL = FormURL("/oauth/token", TestAPI);

    Parameters = New Structure;
    OPI_Tools.AddField("grant_type"   , "client_credentials", String_, Parameters);
    OPI_Tools.AddField("client_id"    , Account             , String_, Parameters);
    OPI_Tools.AddField("client_secret", Password            , String_, Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, , False);

    Return Response;

EndFunction

// Get cashbox checks by date
// Gets information about checks for a specified date
//
// Note:
// Method at API documentation: [Cashbox check information](@api-docs.cdek.ru/68258028.html)
//
// Parameters:
// Token - String - Auth token - token
// ReceivingDate - Date - Date for which data should be retrieved - date
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetCashboxChecksByDate(Val Token, Val ReceivingDate, Val TestAPI = False) Export

    URL     = FormURL("/check", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("date", ReceivingDate, "DateWithoutTime", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get delivery cash registry
// Receives registers of imposed payments, for which the client was transferred the payment
//
// Note:
// Method at API documentation: [Cash on delivery registry information](@api-docs.cdek.ru/107254821.html)
//
// Parameters:
// Token - String - Auth token - token
// ReceivingDate - Date - Date for which data should be retrieved - date
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetDeliveryCashRegistry(Val Token, Val ReceivingDate, Val TestAPI = False) Export

    URL     = FormURL("/registries", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("date", ReceivingDate, "DateWithoutTime", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get delivery cash transfers
// Gets information about orders for which cash on delivery was transferred to the online store
//
// Note:
// Method at API documentation: [Cash on delivery transfer information](@api-docs.cdek.ru/71060213.html)
//
// Parameters:
// Token - String - Auth token - token
// ReceivingDate - Date - Date for which data should be retrieved - date
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetDeliveryCashTransfers(Val Token, Val ReceivingDate, Val TestAPI = False) Export

    URL     = FormURL("/payment", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("date", ReceivingDate, "DateWithoutTime", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get office list
// Gets a list of offices with or without a filter
//
// Note:
// Method at API documentation: [List of pickup points](@api-docs.cdek.ru/36990336.html)
//
// Parameters:
// Token - String - Auth token - token
// Filter - Structure Of KeyAndValue - Office filter. See GetOfficeFilterDescription - filter
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetOfficeList(Val Token, Val Filter = "", Val TestAPI = False) Export

    OPI_TypeConversion.GetCollection(Filter);

    URL     = FormURL("/deliverypoints", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, Filter, Headers);

    Return Response;

EndFunction

// Get regions list
// Gets the list of available regions
//
// Note:
// Method at API documentation: [List of Regions](@api-docs.cdek.ru/33829453.html)
//
// Parameters:
// Token - String - Auth token - token
// Countrues - Array Of String - Array of country codes in ISO_31661_alpha2 format for selection - countries
// Page - Number - Result page - page
// Lang - String - Language: rus, eng, zho - lang
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetRegionsList(Val Token
    , Val Countrues = Undefined
    , Val Page = 0
    , Val Lang = "rus"
    , Val TestAPI = False) Export

    URL     = FormURL("/location/regions", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("country_codes", Countrues , "Array"  , Parameters);
    OPI_Tools.AddField("page"         , Page      , "Number" , Parameters);
    OPI_Tools.AddField("lang"         , Lang      , "String" , Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get office filter description
// Gets an empty layout of the filter for getting the list of offices in the GetOfficeList function
//
// Note:
// Required fields may depend on the type of order or nesting. Be sure to read the CDEK documentation
// Field descriptions in the documentation: [List of pickup points](@api-docs.cdek.ru/36990336.html)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetOfficeFilterDescription(Val Clear = False) Export

    OPI_TypeConversion.GetBoolean(Clear);

    FilterStructure = New Structure;
    FilterStructure.Insert("postal_code"     , "<Postal code of the city for which the list of offices is required>");
    FilterStructure.Insert("city_code"       , "<CDEC locality code>");
    FilterStructure.Insert("type"            , "<Office type: PVZ, POSTAMAT, ALL>");
    FilterStructure.Insert("country_code"    , "<Country code in ISO_3166-1_alpha-2 format>");
    FilterStructure.Insert("region_code"     , "<Region code according to CDEK database>");
    FilterStructure.Insert("have_cashless"   , "<Availability of payment terminal>");
    FilterStructure.Insert("have_cash"       , "<There is cash intake>");
    FilterStructure.Insert("allowed_cod"     , "<Cash on delivery allowed>");
    FilterStructure.Insert("is_dressing_room", "<Availability of fitting room>");
    FilterStructure.Insert("weight_max"      , "<Maximum weight in kg that the office can accept>");
    FilterStructure.Insert("weight_min"      , "<Minimum weight in kg that the office accepts>");
    FilterStructure.Insert("lang"            , "<Localization of the office>");
    FilterStructure.Insert("take_only"       , "<Is the office only a delivery point>");
    FilterStructure.Insert("is_handout"      , "<Its a shipping point>");
    FilterStructure.Insert("is_reception"    , "<Is there an office to take orders>");
    FilterStructure.Insert("fias_guid"       , "<FIAS city code>");
    FilterStructure.Insert("code"            , "<POZ code>");
    FilterStructure.Insert("is_ltl"          , "<Does the office work with LTL>");
    FilterStructure.Insert("fulfillment"     , "<Does the office work with Fullfilment.Arrival>");
    FilterStructure.Insert("size"            , "<Limiting the result selection>");
    FilterStructure.Insert("page"            , "<Result selection page number>");

    If Clear Then
        FilterStructure = OPI_Tools.ClearCollectionRecursively(FilterStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return FilterStructure;

EndFunction

#EndRegion

#Region OrdersManagement

// Create order
// Creates an order based on field descriptions
//
// Note:
// Method at API documentation: [Order registration](@api-docs.cdek.ru/33828802.html)
//
// Parameters:
// Token - String - Auth token - token
// OrderDescription - Structure Of KeyAndValue - Set of order fields. See GetOrderDescription - order
// OnlineStore - Boolean - Flag of Online store order type - ostore
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreateOrder(Val Token, Val OrderDescription, Val OnlineStore = False, Val TestAPI = False) Export

    OPI_TypeConversion.GetCollection(OrderDescription);
    OPI_TypeConversion.GetBoolean(OnlineStore);

    URL     = FormURL("/orders", TestAPI);
    Headers = CreateRequestHeaders(Token);

    OPI_Tools.AddField("type", ?(OnlineStore, 1, 2), "Number", OrderDescription);

    Response = OPI_HTTPRequests.PostWithBody(URL, OrderDescription, Headers);

    Return Response;

EndFunction

// Update order
// Changes the field values of the selected order
//
// Note:
// Method at API documentation: [Update an order](@api-docs.cdek.ru/36989543.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID for updating - uuid
// OrderDescription - Structure Of KeyAndValue - Set of changing order fields - order
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function UpdateOrder(Val Token, Val UUID, Val OrderDescription, Val TestAPI = False) Export

    OPI_TypeConversion.GetCollection(OrderDescription);

    URL     = FormURL("/orders", TestAPI);
    Headers = CreateRequestHeaders(Token);

    OPI_Tools.AddField("uuid", UUID, "String", OrderDescription);

    Response = OPI_HTTPRequests.PatchWithBody(URL, OrderDescription, Headers);

    Return Response;

EndFunction

// Delete order
// Deletes order by UUID
//
// Note:
// Method at API documentation: [Deleting an order](@api-docs.cdek.ru/33828855.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID for deletion - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function DeleteOrder(Val Token, Val UUID, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/orders/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Delete(URL, , Headers);

    Return Response;

EndFunction

// Get order
// Gets the order by UUID
//
// Note:
// Method at API documentation: [Order details](@api-docs.cdek.ru/33828849.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetOrder(Val Token, Val UUID, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/orders/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Get order by number
// Receives the order by CDEK number or number from customer IB
//
// Note:
// Method at API documentation: [Order details](@api-docs.cdek.ru/33828849.html)
//
// Parameters:
// Token - String - Auth token - token
// OrderNumber - String - Order number - number
// Internal - Boolean - Type of order number. True > number in the customer base, False > CDEK number - internal
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetOrderByNumber(Val Token, Val OrderNumber, Val Internal = False, Val TestAPI = False) Export

    OPI_TypeConversion.GetBoolean(Internal);

    URL     = FormURL("/orders", TestAPI);
    Headers = CreateRequestHeaders(Token);

    ParameterName = ?(Internal, "im_number", "cdek_number");

    Parameters = New Structure;
    OPI_Tools.AddField(ParameterName, OrderNumber, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create customer refund
// Processes customer returns for online store orders
//
// Note:
// This method is used if the direct order was delivered by CDEK and the recipient wants to return it in full
// If the order was delivered by another service, or you need to return not all items, you must use the CreateOrder method with is_client_return = true
// Method at API documentation: [Registration of refusal](@api-docs.cdek.ru/55327686.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID - uuid
// Tariff - Number - Tariff code (from those available under the contract) - tariff
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreateCustomerRefund(Val Token, Val UUID, Val Tariff, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/orders/" + UUID + "/clientReturn", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("tariff_code", Tariff, "Number", Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create refusal
// Creates an order refusal to return to the online store
//
// Note:
// Method at API documentation: [Registration of refusal](@api-docs.cdek.ru/55327686.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreateRefusal(Val Token, Val UUID, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/orders/" + UUID + "/refusal", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, , Headers);

    Return Response;

EndFunction

// Create receipt
// Generates pdf receipts for orders
//
// Note:
// Available receipt types (languages): tpl_china, tpl_armenia, tpl_russia, tpl_english, tpl_italian, tpl_korean, tpl_latvian, tpl_lithuanian, tpl_german, tpl_turkish, tpl_czech, tpl_thailand, tpl_invoice
// It is recommended to specify at least 2 copies per sheet (parameter CopiesPerSheet): one to be glued on the shipment, the other to be kept by the sender
// Method at API documentation: [Creating order receipt](@api-docs.cdek.ru/36969649.html)
//
// Parameters:
// Token - String - Auth token - token
// UUIDArray - String, Array of String - One or an array of order UUIDs - uuids
// Type - String - Receipt type (language) - type
// CopiesPerSheet - Number - Number of copies of one receipt per sheet - count
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreateReceipt(Val Token
    , Val UUIDArray
    , Val Type = "tpl_russia"
    , Val CopiesPerSheet = 2
    , Val TestAPI = False) Export

    OPI_TypeConversion.GetArray(UUIDArray);

    URL     = FormURL("/print/orders", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters    = New Structure;
    ArrayOfOrders = New Array;

    For Each UUID In UUIDArray Do

        OPI_TypeConversion.GetLine(UUID);
        ArrayOfOrders.Add(New Structure("order_uuid", UUID));

    EndDo;

    OPI_Tools.AddField("orders"    , ArrayOfOrders  , "Array"  , Parameters);
    OPI_Tools.AddField("copy_count", CopiesPerSheet , "Number" , Parameters);
    OPI_Tools.AddField("type"      , Type           , "String" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get receipt
// Gets a receipt for the order
//
// Note:
// The receipt must be previously created. See CreateReceipt
// A link to the receipt file for orders is available within 1 hour
// Method at API documentation: [Receiving order receipt](@api-docs.cdek.ru/36969694.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - UUID of the receipt received during its creation - uuid
// GetFile - Boolean - True > PDF file data will be received, False > receives CDEK server response - getfile
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue, BinaryData - serialized JSON response from CDEK or a PDF file
Function GetReceipt(Val Token, Val UUID, Val GetFile = False, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);
    OPI_TypeConversion.GetBoolean(GetFile);

    URL     = FormURL("/print/orders/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    If GetFile Then

        Entity = Response["entity"];

        If Not ValueIsFilled(Entity) Then
            Return Response;
        EndIf;

        URL = Entity["url"];

        If Not ValueIsFilled(URL) Then
            Return Response;
        EndIf;

        Response = OPI_HTTPRequests.Get(URL, , Headers);

    EndIf;

    Return Response;

EndFunction

// Create barcode
// Generates a PDF barcode CP for orders
//
// Note:
// Method at API documentation: [Creating barcode CP for the order](@api-docs.cdek.ru/36969713.html)
//
// Parameters:
// Token - String - Auth token - token
// UUIDArray - String, Array of String - One or an array of order UUIDs - uuids
// Copies - Number - Number of copies - count
// Format - String - Print format: A4, A5, A6, A7 - format
// Lang - String - Barcode language: RUS, ENG - lang
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreateBarcode(Val Token
    , Val UUIDArray
    , Val Copies = 1
    , Val Format = "A4"
    , Val Lang = "RUS"
    , Val TestAPI = False) Export

    OPI_TypeConversion.GetArray(UUIDArray);

    URL     = FormURL("/print/barcodes", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters    = New Structure;
    ArrayOfOrders = New Array;

    For Each UUID In UUIDArray Do

        OPI_TypeConversion.GetLine(UUID);
        ArrayOfOrders.Add(New Structure("order_uuid", UUID));

    EndDo;

    OPI_Tools.AddField("orders"    , ArrayOfOrders, "Array"  , Parameters);
    OPI_Tools.AddField("copy_count", Copies       , "Number" , Parameters);
    OPI_Tools.AddField("format"    , Format       , "String" , Parameters);
    OPI_Tools.AddField("lang"      , Lang         , "String" , Parameters);

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get barcode
// Gets the barcode CP for the order
//
// Note:
// The barcode must be previously created. See CreateBarcode
// The link to the file with the barcode CP is available within 1 hour
// Method at API documentation: [Receiving barcode CP for the order](@api-docs.cdek.ru/36969722.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - The UID of the barcode received when the barcode was created - uuid
// GetFile - Boolean - True > PDF file data will be received, False > receives CDEK server response - getfile
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue, BinaryData - serialized JSON response from CDEK or a PDF file
Function GetBarcode(Val Token, Val UUID, Val GetFile = False, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);
    OPI_TypeConversion.GetBoolean(GetFile);

    URL     = FormURL("/print/barcodes/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    If GetFile Then

        Entity = Response["entity"];

        If Not ValueIsFilled(Entity) Then
            Return Response;
        EndIf;

        URL = Entity["url"];

        If Not ValueIsFilled(URL) Then
            Return Response;
        EndIf;

        Response = OPI_HTTPRequests.Get(URL, , Headers);

    EndIf;

    Return Response;

EndFunction

// Create prealert
// Creates a prealert for the order list
//
// Note:
// Method at API documentation: [Registration of Prealert document](@api-docs.cdek.ru/78935159.html)
//
// Parameters:
// Token - String - Auth token - token
// UUIDArray - String, Array of String - One or an array of order UUIDs - uuids
// TransferDate - Date - Planned date of transfer of orders to CDEK - date
// Point - String - Code of shipment point to which it is planned to transfer orders - point
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreatePrealert(Val Token, Val UUIDArray, Val TransferDate, Val Point, Val TestAPI = False) Export

    Planned_date_ = "planned_date";

    OPI_TypeConversion.GetArray(UUIDArray);

    URL     = FormURL("/prealert", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters    = New Structure;
    ArrayOfOrders = New Array;

    For Each UUID In UUIDArray Do

        OPI_TypeConversion.GetLine(UUID);
        ArrayOfOrders.Add(New Structure("order_uuid", UUID));

    EndDo;

    OPI_Tools.AddField("orders"        , ArrayOfOrders, "Array"   , Parameters);
    OPI_Tools.AddField(Planned_date_   , TransferDate , "DateISO" , Parameters);
    OPI_Tools.AddField("shipment_point", Point        , "String"  , Parameters);

    Parameters[Planned_date_] = Parameters[Planned_date_] + "+0000";

    Response = OPI_HTTPRequests.PostWithBody(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get prealert
// Gets a previously created prealert
//
// Note:
// The prealert must be previously created. See CreatePrealert
// Method at API documentation: [Details of prealert document](@api-docs.cdek.ru/78935281.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Prealert UUID - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetPrealert(Val Token, Val UUID, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/prealert/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Get passport data status
// Receives information on passport data processing status for international orders
//
// Note:
// Method at API documentation: [Passport data information](@api-docs.cdek.ru/55343134.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetPassportDataStatus(Val Token, Val UUID, Val TestAPI = False) Export

    URL     = FormURL("/passport", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("order_uuid", UUID, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get cashbox check
// Receives check information on an order
//
// Note:
// Method at API documentation: [Cashbox check information](@api-docs.cdek.ru/68258028.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetCashboxCheck(Val Token, Val UUID, Val TestAPI = False) Export

    URL     = FormURL("/check", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("order_uuid", UUID, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Get order description
// Gets the layout of order for the CreateOrder function
//
// Note:
// Required fields may depend on the type of order or nesting. Be sure to read the CDEK documentation
// Field descriptions in the documentation: [Order registration](@api-docs.cdek.ru/33828802.html)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// RequiredOnly - Boolean - True > only required fields will be in the set - required
// OnlineStore - Boolean - Flag of including fields in the layout exclusively for online store orders - ostore
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetOrderDescription(Val Clear = False, Val RequiredOnly = False, Val OnlineStore = False) Export

    // BSLLS:DuplicateStringLiteral-off

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(RequiredOnly);
    OPI_TypeConversion.GetBoolean(OnlineStore);

    OrderStructure = New Structure;

    OrderStructure.Insert("tariff_code" , "<Tariff code)>");

        RecipientStructure = New Structure;
        RecipientStructure.Insert("company"               , "<Company name>");
        RecipientStructure.Insert("name"                  , "<Full name of contact person>");
        RecipientStructure.Insert("passport_series"       , "<Passport series>");
        RecipientStructure.Insert("passport_number"       , "<Passport number>");
        RecipientStructure.Insert("passport_date_of_issue", "<Date of issue of passport>");
        RecipientStructure.Insert("passport_organization" , "<Passport issuing authority>");
        RecipientStructure.Insert("tin"                   , "<TIN>");
        RecipientStructure.Insert("passport_date_of_birth", "<Birth date>");
        RecipientStructure.Insert("email"                 , "<Email as RFC 2822>");
        RecipientStructure.Insert("contragent_type"       , "<Sender type: LEGAL_ENTITY, INDIVIDUAL >");

            PhonesArray    = New Array;
            PhoneStructure = New Structure;

            PhoneStructure.Insert("number"    , "<Phone number>");
            PhoneStructure.Insert("additional", "<Additional information (extension number)>");

            PhonesArray.Add(PhoneStructure);

        RecipientStructure.Insert("phones", PhonesArray);

    OrderStructure.Insert("recipient", RecipientStructure);

        PackagesArray    = New Array;
        PackageStructure = New Structure;

        PackageStructure.Insert("number" , "<Package number>");
        PackageStructure.Insert("weight" , "<Total weight (grams)>");
        PackageStructure.Insert("length" , "<Package Dimensions. Length (cm)>");
        PackageStructure.Insert("width"  , "<Package Dimensions. Width (cm)>");
        PackageStructure.Insert("height" , "<Package Dimensions. Height (cm)>");
        PackageStructure.Insert("comment", "<Package withommentary>");

            ItemsArray    = New Array;
            ItemStructure = New Structure;

            ItemStructure.Insert("name"    , "<Product name>");
            ItemStructure.Insert("ware_key", "<Product ID/article>");
            ItemStructure.Insert("marking" , "<Product marking>");

                PaymentStructure = New Structure;
                PaymentStructure.Insert("value"   , "<Amount of cash on delivery, including VAT>");
                PaymentStructure.Insert("vat_sum" , "<VAT amount>");
                PaymentStructure.Insert("vat_rate", "<VAT rate (value - 0, 10, 12, 20, null - no VAT)>");

            ItemStructure.Insert("payment"     , PaymentStructure);
            ItemStructure.Insert("cost"        , "<Declared product price>");
            ItemStructure.Insert("weight"      , "<Weight (per unit, grams)>");
            ItemStructure.Insert("weight_gross", "<Gross weight>");
            ItemStructure.Insert("amount"      , "<Number of units (pcs)>");
            ItemStructure.Insert("name_i18n"   , "<Foreign language name>");
            ItemStructure.Insert("brand"       , "<Brand in a foreign language>");
            ItemStructure.Insert("country_code", "<Country code of the product manufacturer as ISO_3166-1_alpha-2>");
            ItemStructure.Insert("material"    , "<Material code>");
            ItemStructure.Insert("wifi_gsm"    , "<Contains wifi or gsm>");
            ItemStructure.Insert("url"         , "<Link to the website of the online store with the description of the product>");

            ItemsArray.Add(ItemStructure);

        PackageStructure.Insert("items", ItemsArray);
        PackagesArray.Add(PackageStructure);

    OrderStructure.Insert("packages", PackagesArray);

    If Not RequiredOnly Then

        OrderStructure.Insert("additional_order_types" , "<Additional order type>");
        OrderStructure.Insert("comment"                , "<Order comment>");
        OrderStructure.Insert("developer_key"          , "<Developer key (for module developers)>");
        OrderStructure.Insert("shipment_point"         , "<Code of CDEK POZ for self carriage by the customer>");
        OrderStructure.Insert("delivery_point"         , "<Code of CDEK office to which the package will be delivered>");
        OrderStructure.Insert("date_invoice"           , "<Invoice date>");
        OrderStructure.Insert("shipper_name"           , "<Shipper>");
        OrderStructure.Insert("shipper_address"        , "<Shippers address>");

            SenderStructure = New Structure;
            SenderStructure.Insert("company"                , "<Company name>");
            SenderStructure.Insert("name"                   , "<Full name of contact person>");
            SenderStructure.Insert("email"                  , "<Email for alerts as RFC 2822>");
            SenderStructure.Insert("passport_series"        , "<Passport series>");
            SenderStructure.Insert("passport_number"        , "<Passport number>");
            SenderStructure.Insert("passport_date_of_issue" , "<Date of issue of passport>");
            SenderStructure.Insert("passport_organization"  , "<Passport issuing authority>");
            SenderStructure.Insert("tin"                    , "<TIN>");
            SenderStructure.Insert("passport_date_of_birth" , "<Birth date>");
            SenderStructure.Insert("contragent_type"        , "<Sender type: LEGAL_ENTITY, INDIVIDUAL>");

                PhonesArray    = New Array;
                PhoneStructure = New Structure;

                PhoneStructure.Insert("number"    , "<Phone number>");
                PhoneStructure.Insert("additional", "<Additional information (extension number)>");

                PhonesArray.Add(PhoneStructure);

            SenderStructure.Insert("phones", PhonesArray);

        OrderStructure.Insert("sender", SenderStructure);

            AddressStructure = New Structure;
            AddressStructure.Insert("code"        , "<CDEC locality code>");
            AddressStructure.Insert("fias_guid"   , "<Unique FIAS identifier>");
            AddressStructure.Insert("postal_code" , "<Postal code>");
            AddressStructure.Insert("longitude"   , "<Longitude>");
            AddressStructure.Insert("latitude"    , "<Latitude>");
            AddressStructure.Insert("country_code", "<Country code in ISO_3166-1_alpha-2 format>");
            AddressStructure.Insert("region"      , "<Region name, specifying parameter for the city field>");
            AddressStructure.Insert("region_code" , "<CDEK region code, specifying parameter for the city field>");
            AddressStructure.Insert("sub_region"  , "<Name of the region's district, specifying parameter for the region field>");
            AddressStructure.Insert("city"        , "<City name, specifying parameter for postal_code>");
            AddressStructure.Insert("kladr_code"  , "<CLADR code>");
            AddressStructure.Insert("address"     , "<Address string >");

        OrderStructure.Insert("from_location", AddressStructure);
        OrderStructure.Insert("to_location"  , AddressStructure);

            ServiceStructure = New Structure;
            ServiceStructure.Insert("code"     , "<Type of additional service>");
            ServiceStructure.Insert("parameter", "<Additional service parameter>");

        OrderStructure.Insert("services"           , ServiceStructure);
        OrderStructure.Insert("print"              , "<Need to generate a document>");
        OrderStructure.Insert("is_client_return"   , "<Customer refund>");
        OrderStructure.Insert("accompanying_number", "<Number of the accompanying consignment note>");
        OrderStructure.Insert("widget_token"       , "<Token received from widget.cdek.ru>");

        If OnlineStore Then

            OrderStructure.Insert("number", "<Order number in the customers system (uuid, if not filled in)>");

                CollectionStructure = New Structure;
                CollectionStructure.Insert("value"   , "<Amount of additional fee (including VAT)>");
                CollectionStructure.Insert("vat_sum" , "<VAT amount>");
                CollectionStructure.Insert("vat_rate", "<VAT rate (value - 0, 10, 12, 20, null - no VAT)>");

            OrderStructure.Insert("delivery_recipient_cost", CollectionStructure);

                ThresholdsArray    = New Array;
                ThresholdStructure = New Structure;

                ThresholdStructure.Insert("threshold", "<Threshold for the value of goods in whole units of currency>");
                ThresholdStructure.Insert("sum"      , "<Additional fee for delivery of products, the total value of which is in the range>");
                ThresholdStructure.Insert("vat_sum"  , "<VAT included in additional delivery charge>");
                ThresholdStructure.Insert("vat_rate" , "<VAT rate (value - 0, 10, 12, 20, null - no VAT)>");

                ThresholdsArray.Add(ThresholdStructure);

            OrderStructure.Insert("delivery_recipient_cost_adv", ThresholdsArray);

                SellerStructure = New Structure;
                SellerStructure.Insert("name"          , "<Name of the true seller>");
                SellerStructure.Insert("inn"           , "<TIN of the true seller>");
                SellerStructure.Insert("phone"         , "<The true sellers phone number>");
                SellerStructure.Insert("ownership_form", "<Form of ownership code>");
                SellerStructure.Insert("address"       , "<The address of the true seller>");

            OrderStructure.Insert("seller", SellerStructure);

        EndIf;

    EndIf;

    If Clear Then
        OrderStructure = OPI_Tools.ClearCollectionRecursively(OrderStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return OrderStructure;

    // BSLLS:DuplicateStringLiteral-on

EndFunction

#EndRegion

#Region DeliveryManagement

// Get available delivery intervals
// Gets available delivery intervals for order
//
// Note:
// Method at API documentation: [Getting delivery intervals (RU)](@api-docs.cdek.ru/154160502.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Order UUID - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetAvailableDeliveryIntervals(Val Token, Val UUID, Val TestAPI = False) Export

    URL     = FormURL("/delivery/intervals", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Parameters = New Structure;
    OPI_Tools.AddField("order_uuid", UUID, "String", Parameters);

    Response = OPI_HTTPRequests.Get(URL, Parameters, Headers);

    Return Response;

EndFunction

// Create courier invitation
// Creates a new request to call a courier to pick up a shipment
//
// Note:
// Method at API documentation: [Registration of refusal](@api-docs.cdek.ru/55327686.html)
//
// Parameters:
// Token - String - Auth token - token
// InvitationDescription - Structure Of KeyAndValue - Invitations description. See GetCourierInvitationsDescription - intake
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreateCourierInvitation(Val Token, Val InvitationDescription, Val TestAPI = False) Export

    OPI_TypeConversion.GetCollection(InvitationDescription);

    URL     = FormURL("/intakes", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, InvitationDescription, Headers);

    Return Response;

EndFunction

// Get withourier invitation
// Gets withourier invitation by UUID
//
// Note:
// The invitation must be previously created. See CreateCourierInvitation
// Method at API documentation: [Details of a courier invitation(@api-docs.cdek.ru/33828865.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - UUID of the invitation - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetCourierInvitation(Val Token, Val UUID, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/intakes/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Delete courier invitation
//
// Note:
// Method at API documentation: [Deleting a courier invitation](@api-docs.cdek.ru/33828880.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - UUID of the invitation for deletion - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function DeleteCourierInvitation(Val Token, Val UUID, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/intakes/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Delete(URL, , Headers);

    Return Response;

EndFunction

// Register delivery appointment
// Fixes the delivery date, time and address agreed with the customer
//
// Note:
// Method at API documentation: [Registration of delivery appointment](@api-docs.cdek.ru/36989576.html)
//
// Parameters:
// Token - String - Auth token - token
// Appointment - Structure Of KeyAndValue - Appointment description. See GetAppointmentDescription - appt
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function RegisterDeliveryAppointment(Val Token, Val Appointment, Val TestAPI = False) Export

    OPI_TypeConversion.GetCollection(Appointment);

    URL     = FormURL("/delivery", TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.PostWithBody(URL, Appointment, Headers);

    Return Response;

EndFunction

// Get delivery appointment
// Receives information about the delivery date, time and address agreed with the customer
//
// Note:
// The appointment must be previously created. See RegisterDeliveryAppointment
// Method at API documentation: [Information about delivery appointment](@api-docs.cdek.ru/36989601.html)
//
// Parameters:
// Token - String - Auth token - token
// UUID - String - Appointment UUID - uuid
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function GetDeliveryAppointment(Val Token, Val UUID, Val TestAPI = False) Export

    OPI_TypeConversion.GetLine(UUID);

    URL     = FormURL("/delivery/" + UUID, TestAPI);
    Headers = CreateRequestHeaders(Token);

    Response = OPI_HTTPRequests.Get(URL, , Headers);

    Return Response;

EndFunction

// Get courier invitations description
// Gets the layout for creating a request for courier call in the CreateCourierInvitation function
//
// Note:
// Required fields may depend on the type of order or nesting. Be sure to read the CDEK documentation
// Field descriptions in the documentation: [Registration of a courier invitation](@api-docs.cdek.ru/33828859.html)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// RequiredOnly - Boolean - True > only required fields will be in the set - required
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetCourierInvitationsDescription(Val Clear = False, Val RequiredOnly = False) Export

    // BSLLS:DuplicateStringLiteral-off

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(RequiredOnly);

    InvitationStructure = New Structure;

    InvitationStructure.Insert("intake_date"      , "<Courier waiting date>");
    InvitationStructure.Insert("intake_time_from" , "<Start time of waiting for the courier>");
    InvitationStructure.Insert("intake_time_to"   , "<End time of waiting for the courier>");

    If Not RequiredOnly Then

        InvitationStructure.Insert("cdek_number"              , "<CDEK order number>");
        InvitationStructure.Insert("order_uuid"               , "<Order identifier in CDEK system>");
        InvitationStructure.Insert("lunch_time_from"          , "<Lunch start time>");
        InvitationStructure.Insert("lunch_time_to"            , "<Lunch finish time>");
        InvitationStructure.Insert("name"                     , "<Goods description>");
        InvitationStructure.Insert("weight"                   , "<Total weight (grams)>");
        InvitationStructure.Insert("length"                   , "<Package Dimensions. Length (cm)>");
        InvitationStructure.Insert("width"                    , "<Package Dimensions. Width (cm)>");
        InvitationStructure.Insert("height"                   , "<Package Dimensions. Height (cm)>");
        InvitationStructure.Insert("comment"                  , "<Comment to the request for courier>");
        InvitationStructure.Insert("need_call"                , "<Need to call the sender>");
        InvitationStructure.Insert("courier_power_of_attorney", "<The courier needs a letter of attorney>");
        InvitationStructure.Insert("courier_identity_card"    , "<The courier needs an identity document>");

            SenderStructure = New Structure;
            SenderStructure.Insert("company"        , "<Name of senders company>");
            SenderStructure.Insert("name"           , "<Full name of contact person>");
            SenderStructure.Insert("contragent_type", "<Sender type: LEGAL_ENTITY, INDIVIDUAL>");

                PhonesArray = New Array;

                PhoneStructure = New Structure;
                PhoneStructure.Insert("number"    , "<Phone number>");
                PhoneStructure.Insert("additional", "<Additional information (extension number)>");

                PhonesArray.Add(PhoneStructure);

            SenderStructure.Insert("phones", PhonesArray);

        InvitationStructure.Insert("sender" , SenderStructure);

            SendingAddressStructure = New Structure;
            SendingAddressStructure.Insert("code"        , "<CDEC locality code>");
            SendingAddressStructure.Insert("fias_guid"   , "<Unique FIAS identifier>");
            SendingAddressStructure.Insert("postal_code" , "<Postal code>");
            SendingAddressStructure.Insert("longitude"   , "<Longitude>");
            SendingAddressStructure.Insert("latitude"    , "<Latitude>");
            SendingAddressStructure.Insert("country_code", "<Country code>");
            SendingAddressStructure.Insert("region"      , "<Region name, specifying parameter for the city field>");
            SendingAddressStructure.Insert("region_code" , "<CDEK region code, specifying parameter for the city field>");
            SendingAddressStructure.Insert("sub_region"  , "<Name of the region's district, specifying parameter for the region field>");
            SendingAddressStructure.Insert("city"        , "<City name, specifying parameter for postal_code>");
            SendingAddressStructure.Insert("kladr_code"  , "<CLADR code. Deprecated field>");
            SendingAddressStructure.Insert("address"     , "<Address string>");

        InvitationStructure.Insert("from_location" , SendingAddressStructure);

    EndIf;

    If Clear Then
        InvitationStructure = OPI_Tools.ClearCollectionRecursively(InvitationStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return InvitationStructure;

    // BSLLS:DuplicateStringLiteral-on

EndFunction

// Get appointment description
// Gets the layout to create about delivery in the RegisterDeliveryAppointment function
//
// Note:
// Required fields may depend on the type of order or nesting. Be sure to read the CDEK documentation
// Field descriptions in the documentation: [Registration of delivery appointment](@api-docs.cdek.ru/36989576.html)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// RequiredOnly - Boolean - True > only required fields will be in the set - required
//
// Returns:
// Structure Of KeyAndValue - Fields structure
Function GetAppointmentDescription(Val Clear = False, Val RequiredOnly = False) Export

    OPI_TypeConversion.GetBoolean(Clear);
    OPI_TypeConversion.GetBoolean(RequiredOnly);

    AppointmentStructure = New Structure;

    AppointmentStructure.Insert("date", "<Delivery date agreed with the recipient>");

    If Not RequiredOnly Then

        AppointmentStructure.Insert("cdek_number"   , "<CDEK order number>");
        AppointmentStructure.Insert("order_uuid"    , "<Order identifier in CDEK system>");
        AppointmentStructure.Insert("time_from"     , "<Delivery time FROM agreed with the recipient>");
        AppointmentStructure.Insert("time_to"       , "<Delivery time TO agreed with the recipient>");
        AppointmentStructure.Insert("comment"       , "<Comment>");
        AppointmentStructure.Insert("delivery_point", "<Alphanumeric code of CDEK POZ>");

            DeliveryAddressStruct = New Structure;
            DeliveryAddressStruct.Insert("code"        , "<CDEC locality code>");
            DeliveryAddressStruct.Insert("fias_guid"   , "<Unique FIAS identifier>");
            DeliveryAddressStruct.Insert("postal_code" , "<Postal code>");
            DeliveryAddressStruct.Insert("longitude"   , "<Longitude>");
            DeliveryAddressStruct.Insert("latitude"    , "<Latitude>");
            DeliveryAddressStruct.Insert("country_code", "<Country code in ISO_3166-1_alpha-2 format>");
            DeliveryAddressStruct.Insert("region"      , "<Region name>");
            DeliveryAddressStruct.Insert("region_code" , "<Region code>");
            DeliveryAddressStruct.Insert("sub_region"  , "<Name of the area of the region>");
            DeliveryAddressStruct.Insert("city"        , "<City name>");
            DeliveryAddressStruct.Insert("kladr_code"  , "<CLADR code>");
            DeliveryAddressStruct.Insert("address"     , "<Address string>");

        AppointmentStructure.Insert("to_location", DeliveryAddressStruct);

    EndIf;

    If Clear Then
        AppointmentStructure = OPI_Tools.ClearCollectionRecursively(AppointmentStructure);
    EndIf;

    //@skip-check constructor-function-return-section
    Return AppointmentStructure;

EndFunction

#EndRegion

#EndRegion

#Region Private

Function FormURL(Val Method, Val TestAPI)

    OPI_TypeConversion.GetBoolean(TestAPI);

    If TestAPI Then
        URL = "https://api.edu.cdek.ru/v2";
    Else
        URL = "https://api.cdek.ru/v2";
    EndIf;

    URL = URL + Method;

    Return URL;

EndFunction

Function CreateRequestHeaders(Val Token)

    OPI_TypeConversion.GetLine(Token);

    Headers = New Map;
    Headers.Insert("Authorization", "Bearer " + Token);
    Return Headers;

EndFunction

#EndRegion

#Region Alternate

Function ПолучитьТокен(Val Аккаунт, Val Пароль, ТестовыйAPI = False) Export
	Return GetToken(Аккаунт, Пароль, ТестовыйAPI);
EndFunction

Function ПолучитьЧекиНаДату(Val Токен, Val ДатаПолучения, Val ТестовыйAPI = False) Export
	Return GetCashboxChecksByDate(Токен, ДатаПолучения, ТестовыйAPI);
EndFunction

Function ПолучитьРеестрыПлатежейНаДату(Val Токен, Val ДатаПолучения, Val ТестовыйAPI = False) Export
	Return GetDeliveryCashRegistry(Токен, ДатаПолучения, ТестовыйAPI);
EndFunction

Function ПолучитьПереводыПлатежейНаДату(Val Токен, Val ДатаПолучения, Val ТестовыйAPI = False) Export
	Return GetDeliveryCashTransfers(Токен, ДатаПолучения, ТестовыйAPI);
EndFunction

Function ПолучитьСписокОфисов(Val Токен, Val Фильтр = "", Val ТестовыйAPI = False) Export
	Return GetOfficeList(Токен, Фильтр, ТестовыйAPI);
EndFunction

Function ПолучитьСписокРегионов(Val Токен, Val Страны = Undefined, Val Страница = 0, Val Язык = "rus", Val ТестовыйAPI = False) Export
	Return GetRegionsList(Токен, Страны, Страница, Язык, ТестовыйAPI);
EndFunction

Function ПолучитьОписаниеФильтраОфисов(Val Пустая = False) Export
	Return GetOfficeFilterDescription(Пустая);
EndFunction

Function СоздатьЗаказ(Val Токен, Val ОписаниеЗаказа, Val ИнтернетМагазин = False, Val ТестовыйAPI = False) Export
	Return CreateOrder(Токен, ОписаниеЗаказа, ИнтернетМагазин, ТестовыйAPI);
EndFunction

Function ИзменитьЗаказ(Val Токен, Val UUID, Val ОписаниеЗаказа, Val ТестовыйAPI = False) Export
	Return UpdateOrder(Токен, UUID, ОписаниеЗаказа, ТестовыйAPI);
EndFunction

Function УдалитьЗаказ(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return DeleteOrder(Токен, UUID, ТестовыйAPI);
EndFunction

Function ПолучитьЗаказ(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return GetOrder(Токен, UUID, ТестовыйAPI);
EndFunction

Function ПолучитьЗаказПоНомеру(Val Токен, Val НомерЗаказа, Val Внутренний = False, Val ТестовыйAPI = False) Export
	Return GetOrderByNumber(Токен, НомерЗаказа, Внутренний, ТестовыйAPI);
EndFunction

Function ОформитьКлиентскийВозврат(Val Токен, Val UUID, Val Тариф, Val ТестовыйAPI = False) Export
	Return CreateCustomerRefund(Токен, UUID, Тариф, ТестовыйAPI);
EndFunction

Function СоздатьОтказ(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return CreateRefusal(Токен, UUID, ТестовыйAPI);
EndFunction

Function СформироватьКвитанцию(Val Токен, Val МассивUUID, Val Тип = "tpl_russia", Val КопийНаЛисте = 2, Val ТестовыйAPI = False) Export
	Return CreateReceipt(Токен, МассивUUID, Тип, КопийНаЛисте, ТестовыйAPI);
EndFunction

Function ПолучитьКвитанцию(Val Токен, Val UUID, Val ПолучитьФайл = False, Val ТестовыйAPI = False) Export
	Return GetReceipt(Токен, UUID, ПолучитьФайл, ТестовыйAPI);
EndFunction

Function СформироватьШтрихкод(Val Токен, Val МассивUUID, Val Копий = 1, Val Формат = "A4", Val Язык = "RUS", Val ТестовыйAPI = False) Export
	Return CreateBarcode(Токен, МассивUUID, Копий, Формат, Язык, ТестовыйAPI);
EndFunction

Function ПолучитьШтрихкод(Val Токен, Val UUID, Val ПолучитьФайл = False, Val ТестовыйAPI = False) Export
	Return GetBarcode(Токен, UUID, ПолучитьФайл, ТестовыйAPI);
EndFunction

Function СоздатьПреалерт(Val Токен, Val МассивUUID, Val ДатаПередачи, Val ПВЗ, Val ТестовыйAPI = False) Export
	Return CreatePrealert(Токен, МассивUUID, ДатаПередачи, ПВЗ, ТестовыйAPI);
EndFunction

Function ПолучитьПреалерт(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return GetPrealert(Токен, UUID, ТестовыйAPI);
EndFunction

Function ПолучитьСтатусПаспортныхДанных(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return GetPassportDataStatus(Токен, UUID, ТестовыйAPI);
EndFunction

Function ПолучитьЧекЗаказа(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return GetCashboxCheck(Токен, UUID, ТестовыйAPI);
EndFunction

Function ПолучитьОписаниеЗаказа(Val Пустая = False, Val ТолькоОбязательные = False, Val ИнтернетМагазин = False) Export
	Return GetOrderDescription(Пустая, ТолькоОбязательные, ИнтернетМагазин);
EndFunction

Function ПолучитьДоступныеИнтервалыДоставки(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return GetAvailableDeliveryIntervals(Токен, UUID, ТестовыйAPI);
EndFunction

Function СоздатьЗаявкуНаВызовКурьера(Val Токен, Val ОписаниеЗаявки, Val ТестовыйAPI = False) Export
	Return CreateCourierInvitation(Токен, ОписаниеЗаявки, ТестовыйAPI);
EndFunction

Function ПолучитьЗаявкуНаВызовКурьера(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return GetCourierInvitation(Токен, UUID, ТестовыйAPI);
EndFunction

Function УдалитьЗаявкуНаВызовКурьера(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return DeleteCourierInvitation(Токен, UUID, ТестовыйAPI);
EndFunction

Function ЗафиксироватьДоговоренностьОДоставке(Val Токен, Val Договоренность, Val ТестовыйAPI = False) Export
	Return RegisterDeliveryAppointment(Токен, Договоренность, ТестовыйAPI);
EndFunction

Function ПолучитьДоговоренностьОДоставке(Val Токен, Val UUID, Val ТестовыйAPI = False) Export
	Return GetDeliveryAppointment(Токен, UUID, ТестовыйAPI);
EndFunction

Function ПолучитьОписаниеЗаявкиКурьера(Val Пустая = False, Val ТолькоОбязательные = False) Export
	Return GetCourierInvitationsDescription(Пустая, ТолькоОбязательные);
EndFunction

Function ПолучитьОписаниеДоговоренности(Val Пустая = False, Val ТолькоОбязательные = False) Export
	Return GetAppointmentDescription(Пустая, ТолькоОбязательные);
EndFunction

#EndRegion