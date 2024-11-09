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
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "CreateTag";
    NewLine.МетодПоиска = "CREATETAG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Creates a tag with the specified name";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "CreateTag";
    NewLine.МетодПоиска = "CREATETAG";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Tag title";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "UpdateTag";
    NewLine.МетодПоиска = "UPDATETAG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Changes the tag name by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "UpdateTag";
    NewLine.МетодПоиска = "UPDATETAG";
    NewLine.Параметр    = "--label";
    NewLine.Описание    = "Tag ID to change";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "UpdateTag";
    NewLine.МетодПоиска = "UPDATETAG";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New name";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "GetTag";
    NewLine.МетодПоиска = "GETTAG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Gets the tag by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "GetTag";
    NewLine.МетодПоиска = "GETTAG";
    NewLine.Параметр    = "--label";
    NewLine.Описание    = "Tag ID";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "DeleteTag";
    NewLine.МетодПоиска = "DELETETAG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Deletes a tag by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "DeleteTag";
    NewLine.МетодПоиска = "DELETETAG";
    NewLine.Параметр    = "--label";
    NewLine.Описание    = "ID of the tag to be deleted";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "GetTagsList";
    NewLine.МетодПоиска = "GETTAGSLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Gets a list of the users tags";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "metrika";
    NewLine.Модуль      = "OPI_YandexMetrika";
    NewLine.Метод       = "GetCounterStructure";
    NewLine.МетодПоиска = "GETCOUNTERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Counters management";
    NewLine.ОписаниеМетода   = "Gets the structure of standard fields for counter creation";

    Return CompositionTable;
EndFunction

