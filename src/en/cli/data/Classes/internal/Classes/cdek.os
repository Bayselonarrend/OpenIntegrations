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
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Creates an order based on field descriptions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--order";
    NewLine.Описание    = "Set of order fields. See GetOrderDescription";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--ostore";
    NewLine.Описание    = "Flag of Online store order type (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateOrder";
    NewLine.МетодПоиска = "CREATEORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Changes the field values of the selected order";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID for updating";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--order";
    NewLine.Описание    = "Set of changing order fields";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "UpdateOrder";
    NewLine.МетодПоиска = "UPDATEORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteOrder";
    NewLine.МетодПоиска = "DELETEORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Deletes order by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteOrder";
    NewLine.МетодПоиска = "DELETEORDER";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID for deletion";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "DeleteOrder";
    NewLine.МетодПоиска = "DELETEORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrder";
    NewLine.МетодПоиска = "GETORDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Gets the order by UUID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrder";
    NewLine.МетодПоиска = "GETORDER";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrder";
    NewLine.МетодПоиска = "GETORDER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Receives the order by CDEK number or number from customer IB";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--number";
    NewLine.Описание    = "Order number";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--internal";
    NewLine.Описание    = "Type of order number. True > number in the customer base, False > CDEK number (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderByNumber";
    NewLine.МетодПоиска = "GETORDERBYNUMBER";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Processes customer returns for online store orders";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--tariff";
    NewLine.Описание    = "Tariff code (from those available under the contract)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateCustomerRefund";
    NewLine.МетодПоиска = "CREATECUSTOMERREFUND";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateRefusal";
    NewLine.МетодПоиска = "CREATEREFUSAL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Creates an order refusal to return to the online store";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateRefusal";
    NewLine.МетодПоиска = "CREATEREFUSAL";
    NewLine.Параметр    = "--uuid";
    NewLine.Описание    = "Order UUID";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "CreateRefusal";
    NewLine.МетодПоиска = "CREATEREFUSAL";
    NewLine.Параметр    = "--testapi";
    NewLine.Описание    = "Flag to use test API for requests (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderDescription";
    NewLine.МетодПоиска = "GETORDERDESCRIPTION";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";
    NewLine.ОписаниеМетода   = "Gets the layout of order for the CreateOrder function";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderDescription";
    NewLine.МетодПоиска = "GETORDERDESCRIPTION";
    NewLine.Параметр    = "--required";
    NewLine.Описание    = "True > only required fields will be in the set (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "cdek";
    NewLine.Модуль      = "OPI_CDEK";
    NewLine.Метод       = "GetOrderDescription";
    NewLine.МетодПоиска = "GETORDERDESCRIPTION";
    NewLine.Параметр    = "--ostore";
    NewLine.Описание    = "Flag of including fields in the layout exclusively for online store orders (optional, def. val. - No)";
    NewLine.Область     = "Orders managment";

    Return CompositionTable;
EndFunction

