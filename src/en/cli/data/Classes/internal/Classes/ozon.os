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
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoriesAndProductTypesTree";
    NewLine.МетодПоиска = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Attributes and features";
    NewLine.ОписаниеМетода   = "Returns the categories and types for products in a tree view";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoriesAndProductTypesTree";
    NewLine.МетодПоиска = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoriesAndProductTypesTree";
    NewLine.МетодПоиска = "GETCATEGORIESANDPRODUCTTYPESTREE";
    NewLine.Параметр    = "--lang";
    NewLine.Описание    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client identifier";
    NewLine.Область     = "Attributes and features";
    NewLine.ОписаниеМетода   = "Gets the characteristics for the specified category and product type";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--apikey";
    NewLine.Описание    = "API key";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--categoryid";
    NewLine.Описание    = "Category identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--typeid";
    NewLine.Описание    = "Item type identifier";
    NewLine.Область     = "Attributes and features";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ozon";
    NewLine.Модуль      = "OPI_Ozon";
    NewLine.Метод       = "GetCategoryAttributes";
    NewLine.МетодПоиска = "GETCATEGORYATTRIBUTES";
    NewLine.Параметр    = "--lang";
    NewLine.Описание    = "Response language: DEFAULT (Russian), RU, EN, TR (Turkish), ZH_HANS (Chinese)) (optional, def. val. - DEFAULT)";
    NewLine.Область     = "Attributes and features";

    Return CompositionTable;
EndFunction

