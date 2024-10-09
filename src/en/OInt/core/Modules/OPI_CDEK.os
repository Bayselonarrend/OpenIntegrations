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
#Use "../../tools"

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

#Region OrdersManagment

// Create order
// Creates an order based on field descriptions
//
// Note
// Method at API documentation: [Order registration](@api-docs.cdek.ru/29923926.html)
//
// Parameters:
// Token - String - Auth token - token
// OrderDescription - Structure of KeyAndValue - Set of order fields. See GetOrderDescription - order
// OnlineStore - Boolean - Flag of Online store order type - ostore
// TestAPI - Boolean - Flag to use test API for requests - testapi
//
// Returns:
// Map Of KeyAndValue - serialized JSON response from CDEK
Function CreateOrder(Val Token, Val OrderDescription, Val OnlineStore = False, TestAPI = False) Export

    OPI_TypeConversion.GetCollection(OrderDescription);
    OPI_TypeConversion.GetBoolean(OnlineStore);

    URL = FormURL("/orders", TestAPI);

    Parameters = New Structure;

    For Each OrderField In OrderDescription Do
        OPI_Tools.AddField(OrderField.Key, OrderField.Value, "Current", Parameters);
    EndDo;

    OPI_Tools.AddField("type", ?(OnlineStore, 1, 2), "Number", Parameters);

    Response = OPI_Tools.Post(URL, OrderDescription, , False);

    Return Response;

EndFunction

// Get order description
// Gets the layout of order for the CreateOrder function
//
// Note
// Required fields may depend on the type of order or nesting. Be sure to read the CDEK documentation
// Field descriptions in the documentation: [Order registration](@api-docs.cdek.ru/29923926.html)
//
// Parameters:
// Clear - Boolean - True > structure with empty valuse, False > field descriptions at values - empty
// RequiredOnly - Boolean - True > only required fields will be in the set - required
// OnlineStore - Boolean - Flag of including fields in the layout exclusively for online store orders - ostore
//
// Returns:
// Structure of KeyAndValue - Fields structure
Function GetOrderDescription(Val Clear = False, Val RequiredOnly = False, Val OnlineStore = False) Export

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
                PaymentStructure.Insert("value" , "<Amount of cash on delivery, including VAT>");
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
            SenderStructure.Insert("contragent_type"        , "<Sender type: LEGAL_ENTITY, INDIVIDUAL >");

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
            AddressStructure.Insert("country_code", "<Code withтраны in format ISO_3166-1_alpha-2>");
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
