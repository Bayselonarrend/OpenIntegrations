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
    NewLine.Библиотека  = "yandex";
    NewLine.Модуль      = "OPI_YandexID";
    NewLine.Метод       = "GetConfirmationCode";
    NewLine.МетодПоиска = "GETCONFIRMATIONCODE";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Client id";
    NewLine.Область     = "Public";
    NewLine.ОписаниеМетода   = "Gets the confirmation code and the address of the page where it needs to be entered";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yandex";
    NewLine.Модуль      = "OPI_YandexID";
    NewLine.Метод       = "ConvertCodeToToken";
    NewLine.МетодПоиска = "CONVERTCODETOTOKEN";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Client id";
    NewLine.Область     = "Public";
    NewLine.ОписаниеМетода   = "Converts the code to a token after entering the code when executing GetConfirmationCode";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yandex";
    NewLine.Модуль      = "OPI_YandexID";
    NewLine.Метод       = "ConvertCodeToToken";
    NewLine.МетодПоиска = "CONVERTCODETOTOKEN";
    NewLine.Параметр    = "--secret";
    NewLine.Описание    = "Client secret";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yandex";
    NewLine.Модуль      = "OPI_YandexID";
    NewLine.Метод       = "ConvertCodeToToken";
    NewLine.МетодПоиска = "CONVERTCODETOTOKEN";
    NewLine.Параметр    = "--device";
    NewLine.Описание    = "device_code from GetConfirmationCode()";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yandex";
    NewLine.Модуль      = "OPI_YandexID";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Client id";
    NewLine.Область     = "Public";
    NewLine.ОписаниеМетода   = "Updates token by Refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yandex";
    NewLine.Модуль      = "OPI_YandexID";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--secret";
    NewLine.Описание    = "Client secret";
    NewLine.Область     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yandex";
    NewLine.Модуль      = "OPI_YandexID";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--refresh";
    NewLine.Описание    = "Refresh token";
    NewLine.Область     = "Public";

    Return CompositionTable;
EndFunction

