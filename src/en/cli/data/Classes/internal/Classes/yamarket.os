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
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetMarketsList";
    NewLine.МетодПоиска = "GETMARKETSLIST";
    NewLine.Параметр    = "--Key)";
    NewLine.Описание    = "token";
    NewLine.Область     = "Campaigns and business";
    NewLine.ОписаниеМетода   = "Gets the list of shops in the cabinet by token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetMarketsList";
    NewLine.МетодПоиска = "GETMARKETSLIST";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Issue page number of the list (optional, def. val. - 1)";
    NewLine.Область     = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetMarket";
    NewLine.МетодПоиска = "GETMARKET";
    NewLine.Параметр    = "--Key)";
    NewLine.Описание    = "token";
    NewLine.Область     = "Campaigns and business";
    NewLine.ОписаниеМетода   = "Gets information about a market (campaign) by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetMarket";
    NewLine.МетодПоиска = "GETMARKET";
    NewLine.Параметр    = "--campaign";
    NewLine.Описание    = "Market ID (campaignsId)";
    NewLine.Область     = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetBusinessSettings";
    NewLine.МетодПоиска = "GETBUSINESSSETTINGS";
    NewLine.Параметр    = "--Key)";
    NewLine.Описание    = "token";
    NewLine.Область     = "Campaigns and business";
    NewLine.ОписаниеМетода   = "Gets the values of cabinet (business) settings by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetBusinessSettings";
    NewLine.МетодПоиска = "GETBUSINESSSETTINGS";
    NewLine.Параметр    = "--business";
    NewLine.Описание    = "Business ID";
    NewLine.Область     = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetCampaignSettings";
    NewLine.МетодПоиска = "GETCAMPAIGNSETTINGS";
    NewLine.Параметр    = "--Key)";
    NewLine.Описание    = "token";
    NewLine.Область     = "Campaigns and business";
    NewLine.ОписаниеМетода   = "Gets market (campaign) settings by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetCampaignSettings";
    NewLine.МетодПоиска = "GETCAMPAIGNSETTINGS";
    NewLine.Параметр    = "--campaign";
    NewLine.Описание    = "Market ID (campaignsId)";
    NewLine.Область     = "Campaigns and business";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "AddUpdateProducts";
    NewLine.МетодПоиска = "ADDUPDATEPRODUCTS";
    NewLine.Параметр    = "--Key)";
    NewLine.Описание    = "token";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Adds or updates product information in the catalogue";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "AddUpdateProducts";
    NewLine.МетодПоиска = "ADDUPDATEPRODUCTS";
    NewLine.Параметр    = "--business";
    NewLine.Описание    = "Business ID";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "AddUpdateProducts";
    NewLine.МетодПоиска = "ADDUPDATEPRODUCTS";
    NewLine.Параметр    = "--offers";
    NewLine.Описание    = "Array of product descriptions";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "AddUpdateProducts";
    NewLine.МетодПоиска = "ADDUPDATEPRODUCTS";
    NewLine.Параметр    = "--pmedia";
    NewLine.Описание    = "A flag of using only your own product images (optional, def. val. - No)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetCampaignProducts";
    NewLine.МетодПоиска = "GETCAMPAIGNPRODUCTS";
    NewLine.Параметр    = "--Key)";
    NewLine.Описание    = "token";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Gets the list of products of the selected market (campaign)";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetCampaignProducts";
    NewLine.МетодПоиска = "GETCAMPAIGNPRODUCTS";
    NewLine.Параметр    = "--business";
    NewLine.Описание    = "Campaign ID";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetCampaignProducts";
    NewLine.МетодПоиска = "GETCAMPAIGNPRODUCTS";
    NewLine.Параметр    = "--filters";
    NewLine.Описание    = "Product filters (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetCampaignProducts";
    NewLine.МетодПоиска = "GETCAMPAIGNPRODUCTS";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Next page token in case of a large selection (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yamarket";
    NewLine.Модуль      = "OPI_YandexMarket";
    NewLine.Метод       = "GetProductStructure";
    NewLine.МетодПоиска = "GETPRODUCTSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Gets the structure of product standard fields";

    Return CompositionTable;
EndFunction

