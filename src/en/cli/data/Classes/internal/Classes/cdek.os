
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--account";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Client identifier (Account)";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets a token based on account ID and password";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Secret key (Password)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCashboxChecksByDate";
    NewLine.SearchMethod  = "GETCASHBOXCHECKSBYDATE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets information about checks for a specified date";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCashboxChecksByDate";
    NewLine.SearchMethod  = "GETCASHBOXCHECKSBYDATE";
    NewLine.Parameter     = "--date";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Date for which data should be retrieved";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCashboxChecksByDate";
    NewLine.SearchMethod  = "GETCASHBOXCHECKSBYDATE";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryCashRegistry";
    NewLine.SearchMethod  = "GETDELIVERYCASHREGISTRY";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Receives registers of imposed payments, for which the client was transferred the payment";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryCashRegistry";
    NewLine.SearchMethod  = "GETDELIVERYCASHREGISTRY";
    NewLine.Parameter     = "--date";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Date for which data should be retrieved";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryCashRegistry";
    NewLine.SearchMethod  = "GETDELIVERYCASHREGISTRY";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryCashTransfers";
    NewLine.SearchMethod  = "GETDELIVERYCASHTRANSFERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets information about orders for which cash on delivery was transferred to the online store";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryCashTransfers";
    NewLine.SearchMethod  = "GETDELIVERYCASHTRANSFERS";
    NewLine.Parameter     = "--date";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Date for which data should be retrieved";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryCashTransfers";
    NewLine.SearchMethod  = "GETDELIVERYCASHTRANSFERS";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOfficeList";
    NewLine.SearchMethod  = "GETOFFICELIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets a list of offices with or without a filter";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOfficeList";
    NewLine.SearchMethod  = "GETOFFICELIST";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Office filter. See GetOfficeFilterDescription (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOfficeList";
    NewLine.SearchMethod  = "GETOFFICELIST";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetRegionsList";
    NewLine.SearchMethod  = "GETREGIONSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets the list of available regions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetRegionsList";
    NewLine.SearchMethod  = "GETREGIONSLIST";
    NewLine.Parameter     = "--countries";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Array of country codes in ISO_31661_alpha2 format for selection (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetRegionsList";
    NewLine.SearchMethod  = "GETREGIONSLIST";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Result page (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetRegionsList";
    NewLine.SearchMethod  = "GETREGIONSLIST";
    NewLine.Parameter     = "--lang";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Language: rus, eng, zho (optional, def. val.. - rus)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetRegionsList";
    NewLine.SearchMethod  = "GETREGIONSLIST";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOfficeFilterDescription";
    NewLine.SearchMethod  = "GETOFFICEFILTERDESCRIPTION";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets an empty layout of the filter for getting the list of offices in the GetOfficeList function";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateOrder";
    NewLine.SearchMethod  = "CREATEORDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Creates an order based on field descriptions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateOrder";
    NewLine.SearchMethod  = "CREATEORDER";
    NewLine.Parameter     = "--order";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Set of order fields. See GetOrderDescription";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateOrder";
    NewLine.SearchMethod  = "CREATEORDER";
    NewLine.Parameter     = "--ostore";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag of Online store order type (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateOrder";
    NewLine.SearchMethod  = "CREATEORDER";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "UpdateOrder";
    NewLine.SearchMethod  = "UPDATEORDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Changes the field values of the selected order";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "UpdateOrder";
    NewLine.SearchMethod  = "UPDATEORDER";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID for updating";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "UpdateOrder";
    NewLine.SearchMethod  = "UPDATEORDER";
    NewLine.Parameter     = "--order";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Set of changing order fields";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "UpdateOrder";
    NewLine.SearchMethod  = "UPDATEORDER";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "DeleteOrder";
    NewLine.SearchMethod  = "DELETEORDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Deletes order by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "DeleteOrder";
    NewLine.SearchMethod  = "DELETEORDER";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID for deletion";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "DeleteOrder";
    NewLine.SearchMethod  = "DELETEORDER";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrder";
    NewLine.SearchMethod  = "GETORDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Gets the order by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrder";
    NewLine.SearchMethod  = "GETORDER";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrder";
    NewLine.SearchMethod  = "GETORDER";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrderByNumber";
    NewLine.SearchMethod  = "GETORDERBYNUMBER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Receives the order by CDEK number or number from customer IB";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrderByNumber";
    NewLine.SearchMethod  = "GETORDERBYNUMBER";
    NewLine.Parameter     = "--number";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Order number";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrderByNumber";
    NewLine.SearchMethod  = "GETORDERBYNUMBER";
    NewLine.Parameter     = "--internal";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Type of order number. True > number in the customer base, False > CDEK number (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrderByNumber";
    NewLine.SearchMethod  = "GETORDERBYNUMBER";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateCustomerRefund";
    NewLine.SearchMethod  = "CREATECUSTOMERREFUND";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Processes customer returns for online store orders";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateCustomerRefund";
    NewLine.SearchMethod  = "CREATECUSTOMERREFUND";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateCustomerRefund";
    NewLine.SearchMethod  = "CREATECUSTOMERREFUND";
    NewLine.Parameter     = "--tariff";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Tariff code (from those available under the contract)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateCustomerRefund";
    NewLine.SearchMethod  = "CREATECUSTOMERREFUND";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateRefusal";
    NewLine.SearchMethod  = "CREATEREFUSAL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Creates an order refusal to return to the online store";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateRefusal";
    NewLine.SearchMethod  = "CREATEREFUSAL";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateRefusal";
    NewLine.SearchMethod  = "CREATEREFUSAL";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateReceipt";
    NewLine.SearchMethod  = "CREATERECEIPT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Generates pdf receipts for orders";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateReceipt";
    NewLine.SearchMethod  = "CREATERECEIPT";
    NewLine.Parameter     = "--uuids";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "One or an array of order UUIDs";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateReceipt";
    NewLine.SearchMethod  = "CREATERECEIPT";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Receipt type (language) (optional, def. val.. - tpl_russia)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateReceipt";
    NewLine.SearchMethod  = "CREATERECEIPT";
    NewLine.Parameter     = "--count";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Number of copies of one receipt per sheet (optional, def. val.. - 2)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateReceipt";
    NewLine.SearchMethod  = "CREATERECEIPT";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetReceipt";
    NewLine.SearchMethod  = "GETRECEIPT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Gets a receipt for the order";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetReceipt";
    NewLine.SearchMethod  = "GETRECEIPT";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "UUID of the receipt received during its creation";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetReceipt";
    NewLine.SearchMethod  = "GETRECEIPT";
    NewLine.Parameter     = "--getfile";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "True > PDF file data will be received, False > receives CDEK server response (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetReceipt";
    NewLine.SearchMethod  = "GETRECEIPT";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateBarcode";
    NewLine.SearchMethod  = "CREATEBARCODE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Generates a PDF barcode CP for orders";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateBarcode";
    NewLine.SearchMethod  = "CREATEBARCODE";
    NewLine.Parameter     = "--uuids";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "One or an array of order UUIDs";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateBarcode";
    NewLine.SearchMethod  = "CREATEBARCODE";
    NewLine.Parameter     = "--count";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Number of copies (optional, def. val.. - 1)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateBarcode";
    NewLine.SearchMethod  = "CREATEBARCODE";
    NewLine.Parameter     = "--format";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Print format: A4, A5, A6, A7 (optional, def. val.. - A4)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateBarcode";
    NewLine.SearchMethod  = "CREATEBARCODE";
    NewLine.Parameter     = "--lang";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Barcode language: RUS, ENG (optional, def. val.. - RUS)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateBarcode";
    NewLine.SearchMethod  = "CREATEBARCODE";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetBarcode";
    NewLine.SearchMethod  = "GETBARCODE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Gets the barcode CP for the order";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetBarcode";
    NewLine.SearchMethod  = "GETBARCODE";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "The UID of the barcode received when the barcode was created";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetBarcode";
    NewLine.SearchMethod  = "GETBARCODE";
    NewLine.Parameter     = "--getfile";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "True > PDF file data will be received, False > receives CDEK server response (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetBarcode";
    NewLine.SearchMethod  = "GETBARCODE";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreatePrealert";
    NewLine.SearchMethod  = "CREATEPREALERT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Creates a prealert for the order list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreatePrealert";
    NewLine.SearchMethod  = "CREATEPREALERT";
    NewLine.Parameter     = "--uuids";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "One or an array of order UUIDs";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreatePrealert";
    NewLine.SearchMethod  = "CREATEPREALERT";
    NewLine.Parameter     = "--date";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Planned date of transfer of orders to CDEK";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreatePrealert";
    NewLine.SearchMethod  = "CREATEPREALERT";
    NewLine.Parameter     = "--point";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Code of shipment point to which it is planned to transfer orders";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreatePrealert";
    NewLine.SearchMethod  = "CREATEPREALERT";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetPrealert";
    NewLine.SearchMethod  = "GETPREALERT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Gets a previously created prealert";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetPrealert";
    NewLine.SearchMethod  = "GETPREALERT";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Prealert UUID";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetPrealert";
    NewLine.SearchMethod  = "GETPREALERT";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetPassportDataStatus";
    NewLine.SearchMethod  = "GETPASSPORTDATASTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Receives information on passport data processing status for international orders";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetPassportDataStatus";
    NewLine.SearchMethod  = "GETPASSPORTDATASTATUS";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetPassportDataStatus";
    NewLine.SearchMethod  = "GETPASSPORTDATASTATUS";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCashboxCheck";
    NewLine.SearchMethod  = "GETCASHBOXCHECK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Receives check information on an order";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCashboxCheck";
    NewLine.SearchMethod  = "GETCASHBOXCHECK";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCashboxCheck";
    NewLine.SearchMethod  = "GETCASHBOXCHECK";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrderDescription";
    NewLine.SearchMethod  = "GETORDERDESCRIPTION";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";
    NewLine.MethodDescription   = "Gets the layout of order for the CreateOrder function";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrderDescription";
    NewLine.SearchMethod  = "GETORDERDESCRIPTION";
    NewLine.Parameter     = "--required";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "True > only required fields will be in the set (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetOrderDescription";
    NewLine.SearchMethod  = "GETORDERDESCRIPTION";
    NewLine.Parameter     = "--ostore";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Flag of including fields in the layout exclusively for online store orders (optional, def. val.. - False)";
    NewLine.Region      = "Orders management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetAvailableDeliveryIntervals";
    NewLine.SearchMethod  = "GETAVAILABLEDELIVERYINTERVALS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Delivery management";
    NewLine.MethodDescription   = "Gets available delivery intervals for order";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetAvailableDeliveryIntervals";
    NewLine.SearchMethod  = "GETAVAILABLEDELIVERYINTERVALS";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Order UUID";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetAvailableDeliveryIntervals";
    NewLine.SearchMethod  = "GETAVAILABLEDELIVERYINTERVALS";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateCourierInvitation";
    NewLine.SearchMethod  = "CREATECOURIERINVITATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Delivery management";
    NewLine.MethodDescription   = "Creates a new request to call a courier to pick up a shipment";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateCourierInvitation";
    NewLine.SearchMethod  = "CREATECOURIERINVITATION";
    NewLine.Parameter     = "--intake";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Invitations description. See GetCourierInvitationsDescription";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "CreateCourierInvitation";
    NewLine.SearchMethod  = "CREATECOURIERINVITATION";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCourierInvitation";
    NewLine.SearchMethod  = "GETCOURIERINVITATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Delivery management";
    NewLine.MethodDescription   = "Gets withourier invitation by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCourierInvitation";
    NewLine.SearchMethod  = "GETCOURIERINVITATION";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "UUID of the invitation";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCourierInvitation";
    NewLine.SearchMethod  = "GETCOURIERINVITATION";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "DeleteCourierInvitation";
    NewLine.SearchMethod  = "DELETECOURIERINVITATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "DeleteCourierInvitation";
    NewLine.SearchMethod  = "DELETECOURIERINVITATION";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "UUID of the invitation for deletion";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "DeleteCourierInvitation";
    NewLine.SearchMethod  = "DELETECOURIERINVITATION";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "RegisterDeliveryAppointment";
    NewLine.SearchMethod  = "REGISTERDELIVERYAPPOINTMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Delivery management";
    NewLine.MethodDescription   = "Fixes the delivery date, time and address agreed with the customer";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "RegisterDeliveryAppointment";
    NewLine.SearchMethod  = "REGISTERDELIVERYAPPOINTMENT";
    NewLine.Parameter     = "--appt";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Appointment description. See GetAppointmentDescription";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "RegisterDeliveryAppointment";
    NewLine.SearchMethod  = "REGISTERDELIVERYAPPOINTMENT";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryAppointment";
    NewLine.SearchMethod  = "GETDELIVERYAPPOINTMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Delivery management";
    NewLine.MethodDescription   = "Receives information about the delivery date, time and address agreed with the customer";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryAppointment";
    NewLine.SearchMethod  = "GETDELIVERYAPPOINTMENT";
    NewLine.Parameter     = "--uuid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Appointment UUID";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetDeliveryAppointment";
    NewLine.SearchMethod  = "GETDELIVERYAPPOINTMENT";
    NewLine.Parameter     = "--testapi";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Flag to use test API for requests (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCourierInvitationsDescription";
    NewLine.SearchMethod  = "GETCOURIERINVITATIONSDESCRIPTION";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";
    NewLine.MethodDescription   = "Gets the layout for creating a request for courier call in the CreateCourierInvitation function";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetCourierInvitationsDescription";
    NewLine.SearchMethod  = "GETCOURIERINVITATIONSDESCRIPTION";
    NewLine.Parameter     = "--required";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "True > only required fields will be in the set (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetAppointmentDescription";
    NewLine.SearchMethod  = "GETAPPOINTMENTDESCRIPTION";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";
    NewLine.MethodDescription   = "Gets the layout to create about delivery in the RegisterDeliveryAppointment function";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "cdek";
    NewLine.Module       = "OPI_CDEK";
    NewLine.Method        = "GetAppointmentDescription";
    NewLine.SearchMethod  = "GETAPPOINTMENTDESCRIPTION";
    NewLine.Parameter     = "--required";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "True > only required fields will be in the set (optional, def. val.. - False)";
    NewLine.Region      = "Delivery management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_CDEK = LoadScript(""%1/oint/core/Modules/OPI_CDEK.os"", Context);
        |" + Chars.LF;


EndFunction 
