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
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--address";
    NewLine.Описание    = "Address and port";
    NewLine.Область     = "Client methods";
    NewLine.ОписаниеМетода   = "Sends a single request to a specified address and receives a response using the default settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Data or text to be sent (optional, def. val. - Empty value)";
    NewLine.Область     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--string";
    NewLine.Описание    = "An attribute of receiving the response as a string (optional, def. val. - Yes)";
    NewLine.Область     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--tls";
    NewLine.Описание    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Область     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "GetTlsSettings";
    NewLine.МетодПоиска = "GETTLSSETTINGS";
    NewLine.Параметр    = "--trust";
    NewLine.Описание    = "Allows to work with invalid certificates, including self signed";
    NewLine.Область     = "Client methods";
    NewLine.ОписаниеМетода   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "GetTlsSettings";
    NewLine.МетодПоиска = "GETTLSSETTINGS";
    NewLine.Параметр    = "--cert";
    NewLine.Описание    = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val. - Empty value)";
    NewLine.Область     = "Client methods";

    Return CompositionTable;
EndFunction

