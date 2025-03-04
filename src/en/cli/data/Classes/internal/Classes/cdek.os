﻿Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--account";
    NewLine.Описание    = "Client identifier (Account)";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Gets a token based on account ID and password";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--pass";
    NewLine.Описание    = "Secret key (Password)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCashboxChecksByDate";
    NewLine.МетодПоиска = "GETCASHBOXCHECKSBYDATE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Gets information about checks for a specified date";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCashboxChecksByDate";
    NewLine.МетодПоиска = "GETCASHBOXCHECKSBYDATE";
    NewLine.Параметр    = "--date";
    NewLine.Описание    = "Date for which data should be retrieved";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCashboxChecksByDate";
    NewLine.МетодПоиска = "GETCASHBOXCHECKSBYDATE";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryCashRegistry";
    NewLine.МетодПоиска = "GETDELIVERYCASHREGISTRY";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Receives registers of imposed payments, for which the client was transferred the payment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryCashRegistry";
    NewLine.МетодПоиска = "GETDELIVERYCASHREGISTRY";
    NewLine.Параметр    = "--date";
    NewLine.Описание    = "Date for which data should be retrieved";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryCashRegistry";
    NewLine.МетодПоиска = "GETDELIVERYCASHREGISTRY";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryCashTransfers";
    NewLine.МетодПоиска = "GETDELIVERYCASHTRANSFERS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Gets information about orders for which cash on delivery was transferred to the online store";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryCashTransfers";
    NewLine.МетодПоиска = "GETDELIVERYCASHTRANSFERS";
    NewLine.Параметр    = "--date";
    NewLine.Описание    = "Date for which data should be retrieved";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryCashTransfers";
    NewLine.МетодПоиска = "GETDELIVERYCASHTRANSFERS";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOfficeList";
    NewLine.МетодПоиска = "GETOFFICELIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Gets a list of offices with or without a filter";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOfficeList";
    NewLine.МетодПоиска = "GETOFFICELIST";
    NewLine.Параметр    = "--filter";
    NewLine.Описание    = "Office filter. See GetOfficeFilterDescription (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOfficeList";
    NewLine.МетодПоиска = "GETOFFICELIST";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetRegionsList";
    NewLine.МетодПоиска = "GETREGIONSLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Gets the list of available regions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetRegionsList";
    NewLine.МетодПоиска = "GETREGIONSLIST";
    NewLine.Параметр    = "--countries";
    NewLine.Описание    = "Array of country codes in ISO_31661_alpha2 format for selection (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetRegionsList";
    NewLine.МетодПоиска = "GETREGIONSLIST";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Result page (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetRegionsList";
    NewLine.МетодПоиска = "GETREGIONSLIST";
    NewLine.Параметр    = "--lang";
    NewLine.Описание    = "Language: rus, eng, zho (optional, def. val. - rus)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetRegionsList";
    NewLine.МетодПоиска = "GETREGIONSLIST";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOfficeFilterDescription";
    NewLine.МетодПоиска = "GETOFFICEFILTERDESCRIPTION";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Gets an empty layout of the filter for getting the list of offices in the GetOfficeList function";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Creates an order based on field descriptions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--order";
    NewLine.Описание    = "Set of order fields. See GetOrderDescription";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--ostore";
    NewLine.Описание    = "Flag of Online store order type (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Changes the field values of the selected order";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID for updating";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--order";
    NewLine.Описание    = "Set of changing order fields";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteOrder";
    NewLine.МетодПоиска = "DELETEORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Deletes order by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteOrder";
    NewLine.МетодПоиска = "DELETEORDER";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID for deletion";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteOrder";
    NewLine.МетодПоиска = "DELETEORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrder";
    NewLine.МетодПоиска = "GETORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Gets the order by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrder";
    NewLine.МетодПоиска = "GETORDER";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrder";
    NewLine.МетодПоиска = "GETORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Receives the order by CDEK number or number from customer IB";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--number";
    NewLine.Описание    = "Order number";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--internal";
    NewLine.Описание    = "Type of order number. True > number in the customer base, False > CDEK number (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Processes customer returns for online store orders";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--tariff";
    NewLine.Описание    = "Tariff code (from those available under the contract)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateRefusal";
    NewLine.МетодПоиска = "CREATEREFUSAL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Creates an order refusal to return to the online store";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateRefusal";
    NewLine.МетодПоиска = "CREATEREFUSAL";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateRefusal";
    NewLine.МетодПоиска = "CREATEREFUSAL";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateReceipt";
    NewLine.МетодПоиска = "CREATERECEIPT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Generates pdf receipts for orders";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateReceipt";
    NewLine.МетодПоиска = "CREATERECEIPT";
    NewLine.Параметр    = "--uuids";
    NewLine.Описание    = "One or an array of order UUIDs";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateReceipt";
    NewLine.МетодПоиска = "CREATERECEIPT";
    NewLine.Параметр    = "--type";
    NewLine.Описание    = "Receipt type (language) (optional, def. val. - tpl_russia)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateReceipt";
    NewLine.МетодПоиска = "CREATERECEIPT";
    NewLine.Параметр    = "--count";
    NewLine.Описание    = "Number of copies of one receipt per sheet (optional, def. val. - 2)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateReceipt";
    NewLine.МетодПоиска = "CREATERECEIPT";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetReceipt";
    NewLine.МетодПоиска = "GETRECEIPT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Gets a receipt for the order";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetReceipt";
    NewLine.МетодПоиска = "GETRECEIPT";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "UUID of the receipt received during its creation";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetReceipt";
    NewLine.МетодПоиска = "GETRECEIPT";
    NewLine.Параметр    = "--getfile";
    NewLine.Описание    = "True > PDF file data will be received, False > receives CDEK server response (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetReceipt";
    NewLine.МетодПоиска = "GETRECEIPT";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateBarcode";
    NewLine.МетодПоиска = "CREATEBARCODE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Generates a PDF barcode CP for orders";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateBarcode";
    NewLine.МетодПоиска = "CREATEBARCODE";
    NewLine.Параметр    = "--uuids";
    NewLine.Описание    = "One or an array of order UUIDs";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateBarcode";
    NewLine.МетодПоиска = "CREATEBARCODE";
    NewLine.Параметр    = "--count";
    NewLine.Описание    = "Number of copies (optional, def. val. - 1)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateBarcode";
    NewLine.МетодПоиска = "CREATEBARCODE";
    NewLine.Параметр    = "--format";
    NewLine.Описание    = "Print format: A4, A5, A6, A7 (optional, def. val. - A4)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateBarcode";
    NewLine.МетодПоиска = "CREATEBARCODE";
    NewLine.Параметр    = "--lang";
    NewLine.Описание    = "Barcode language: RUS, ENG (optional, def. val. - RUS)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateBarcode";
    NewLine.МетодПоиска = "CREATEBARCODE";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetBarcode";
    NewLine.МетодПоиска = "GETBARCODE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Gets the barcode CP for the order";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetBarcode";
    NewLine.МетодПоиска = "GETBARCODE";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "The UID of the barcode received when the barcode was created";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetBarcode";
    NewLine.МетодПоиска = "GETBARCODE";
    NewLine.Параметр    = "--getfile";
    NewLine.Описание    = "True > PDF file data will be received, False > receives CDEK server response (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetBarcode";
    NewLine.МетодПоиска = "GETBARCODE";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreatePrealert";
    NewLine.МетодПоиска = "CREATEPREALERT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Creates a prealert for the order list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreatePrealert";
    NewLine.МетодПоиска = "CREATEPREALERT";
    NewLine.Параметр    = "--uuids";
    NewLine.Описание    = "One or an array of order UUIDs";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreatePrealert";
    NewLine.МетодПоиска = "CREATEPREALERT";
    NewLine.Параметр    = "--date";
    NewLine.Описание    = "Planned date of transfer of orders to CDEK";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreatePrealert";
    NewLine.МетодПоиска = "CREATEPREALERT";
    NewLine.Параметр    = "--point";
    NewLine.Описание    = "Code of shipment point to which it is planned to transfer orders";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreatePrealert";
    NewLine.МетодПоиска = "CREATEPREALERT";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetPrealert";
    NewLine.МетодПоиска = "GETPREALERT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Gets a previously created prealert";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetPrealert";
    NewLine.МетодПоиска = "GETPREALERT";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Prealert UUID";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetPrealert";
    NewLine.МетодПоиска = "GETPREALERT";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetPassportDataStatus";
    NewLine.МетодПоиска = "GETPASSPORTDATASTATUS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Receives information on passport data processing status for international orders";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetPassportDataStatus";
    NewLine.МетодПоиска = "GETPASSPORTDATASTATUS";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetPassportDataStatus";
    NewLine.МетодПоиска = "GETPASSPORTDATASTATUS";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCashboxCheck";
    NewLine.МетодПоиска = "GETCASHBOXCHECK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Receives check information on an order";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCashboxCheck";
    NewLine.МетодПоиска = "GETCASHBOXCHECK";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCashboxCheck";
    NewLine.МетодПоиска = "GETCASHBOXCHECK";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderDescription";
    NewLine.МетодПоиска = "GETORDERDESCRIPTION";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Orders management";
    NewLine.ОписаниеМетода   = "Gets the layout of order for the CreateOrder function";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderDescription";
    NewLine.МетодПоиска = "GETORDERDESCRIPTION";
    NewLine.Параметр    = "--required";
    NewLine.Описание    = "True > only required fields will be in the set (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderDescription";
    NewLine.МетодПоиска = "GETORDERDESCRIPTION";
    NewLine.Параметр    = "--ostore";
    NewLine.Описание    = "Flag of including fields in the layout exclusively for online store orders (optional, def. val. - No)";
    NewLine.Область     = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetAvailableDeliveryIntervals";
    NewLine.МетодПоиска = "GETAVAILABLEDELIVERYINTERVALS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Delivery management";
    NewLine.ОписаниеМетода   = "Gets available delivery intervals for order";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetAvailableDeliveryIntervals";
    NewLine.МетодПоиска = "GETAVAILABLEDELIVERYINTERVALS";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetAvailableDeliveryIntervals";
    NewLine.МетодПоиска = "GETAVAILABLEDELIVERYINTERVALS";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCourierInvitation";
    NewLine.МетодПоиска = "CREATECOURIERINVITATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Delivery management";
    NewLine.ОписаниеМетода   = "Creates a new request to call a courier to pick up a shipment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCourierInvitation";
    NewLine.МетодПоиска = "CREATECOURIERINVITATION";
    NewLine.Параметр    = "--intake";
    NewLine.Описание    = "Invitations description. See GetCourierInvitationsDescription";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCourierInvitation";
    NewLine.МетодПоиска = "CREATECOURIERINVITATION";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCourierInvitation";
    NewLine.МетодПоиска = "GETCOURIERINVITATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Delivery management";
    NewLine.ОписаниеМетода   = "Gets withourier invitation by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCourierInvitation";
    NewLine.МетодПоиска = "GETCOURIERINVITATION";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "UUID of the invitation";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCourierInvitation";
    NewLine.МетодПоиска = "GETCOURIERINVITATION";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteCourierInvitation";
    NewLine.МетодПоиска = "DELETECOURIERINVITATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteCourierInvitation";
    NewLine.МетодПоиска = "DELETECOURIERINVITATION";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "UUID of the invitation for deletion";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteCourierInvitation";
    NewLine.МетодПоиска = "DELETECOURIERINVITATION";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "RegisterDeliveryAppointment";
    NewLine.МетодПоиска = "REGISTERDELIVERYAPPOINTMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Delivery management";
    NewLine.ОписаниеМетода   = "Fixes the delivery date, time and address agreed with the customer";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "RegisterDeliveryAppointment";
    NewLine.МетодПоиска = "REGISTERDELIVERYAPPOINTMENT";
    NewLine.Параметр    = "--appt";
    NewLine.Описание    = "Appointment description. See GetAppointmentDescription";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "RegisterDeliveryAppointment";
    NewLine.МетодПоиска = "REGISTERDELIVERYAPPOINTMENT";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryAppointment";
    NewLine.МетодПоиска = "GETDELIVERYAPPOINTMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Delivery management";
    NewLine.ОписаниеМетода   = "Receives information about the delivery date, time and address agreed with the customer";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryAppointment";
    NewLine.МетодПоиска = "GETDELIVERYAPPOINTMENT";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Appointment UUID";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetDeliveryAppointment";
    NewLine.МетодПоиска = "GETDELIVERYAPPOINTMENT";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCourierInvitationsDescription";
    NewLine.МетодПоиска = "GETCOURIERINVITATIONSDESCRIPTION";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";
    NewLine.ОписаниеМетода   = "Gets the layout for creating a request for courier call in the CreateCourierInvitation function";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetCourierInvitationsDescription";
    NewLine.МетодПоиска = "GETCOURIERINVITATIONSDESCRIPTION";
    NewLine.Параметр    = "--required";
    NewLine.Описание    = "True > only required fields will be in the set (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetAppointmentDescription";
    NewLine.МетодПоиска = "GETAPPOINTMENTDESCRIPTION";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";
    NewLine.ОписаниеМетода   = "Gets the layout to create about delivery in the RegisterDeliveryAppointment function";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetAppointmentDescription";
    NewLine.МетодПоиска = "GETAPPOINTMENTDESCRIPTION";
    NewLine.Параметр    = "--required";
    NewLine.Описание    = "True > only required fields will be in the set (optional, def. val. - No)";
    NewLine.Область     = "Delivery management";

    Return CompositionTable;
EndFunction

