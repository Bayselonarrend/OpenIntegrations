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
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Generates a response for a given text query";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--prompt";
    NewLine.Описание    = "Request text";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Additional parameters. See GetRequestParametersStructure (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";

    Return CompositionTable;
EndFunction

