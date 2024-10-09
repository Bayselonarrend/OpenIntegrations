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

    Return CompositionTable;
EndFunction

