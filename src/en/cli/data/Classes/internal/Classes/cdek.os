Function ПолучитьСостав() Export

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

