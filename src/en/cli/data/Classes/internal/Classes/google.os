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
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "FormCodeRetrievalLink";
    NewLine.МетодПоиска = "FORMCODERETRIEVALLINK";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Client ID";
    NewLine.Область     = "Public";
    NewLine.ОписаниеМетода   = "Returns URL for browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "FormCodeRetrievalLink";
    NewLine.МетодПоиска = "FORMCODERETRIEVALLINK";
    NewLine.Параметр    = "--calendar";
    NewLine.Описание    = "Calendar methods permission (optional, def. val. - Yes)";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "FormCodeRetrievalLink";
    NewLine.МетодПоиска = "FORMCODERETRIEVALLINK";
    NewLine.Параметр    = "--drive";
    NewLine.Описание    = "Drive methods permission (optional, def. val. - Yes)";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "FormCodeRetrievalLink";
    NewLine.МетодПоиска = "FORMCODERETRIEVALLINK";
    NewLine.Параметр    = "--sheets";
    NewLine.Описание    = "Sheets methods permission (optional, def. val. - Yes)";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "GetTokenByCode";
    NewLine.МетодПоиска = "GETTOKENBYCODE";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Client ID";
    NewLine.Область     = "Public";
    NewLine.ОписаниеМетода   = "Gets token by code from browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "GetTokenByCode";
    NewLine.МетодПоиска = "GETTOKENBYCODE";
    NewLine.Параметр    = "--secret";
    NewLine.Описание    = "Client secret";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "GetTokenByCode";
    NewLine.МетодПоиска = "GETTOKENBYCODE";
    NewLine.Параметр    = "--code";
    NewLine.Описание    = "Code from browser";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Client ID";
    NewLine.Область     = "Public";
    NewLine.ОписаниеМетода   = "Updates token by Refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--secret";
    NewLine.Описание    = "Client secret";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "google";
    NewLine.Модуль      = "OPI_GoogleWorkspace";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--refresh";
    NewLine.Описание    = "Refresh token";
    NewLine.Область     = "Public";

    Return CompositionTable;
EndFunction

