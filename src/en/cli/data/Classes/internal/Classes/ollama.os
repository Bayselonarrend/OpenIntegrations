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
    NewLine.Метод       = "GetResponse";
    NewLine.МетодПоиска = "GETRESPONSE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Generates a response for a given text query";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetResponse";
    NewLine.МетодПоиска = "GETRESPONSE";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetResponse";
    NewLine.МетодПоиска = "GETRESPONSE";
    NewLine.Параметр    = "--prompt";
    NewLine.Описание    = "Request text";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetResponse";
    NewLine.МетодПоиска = "GETRESPONSE";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Additional parameters. See GetRequestParametersStructure (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetResponse";
    NewLine.МетодПоиска = "GETRESPONSE";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextResponse";
    NewLine.МетодПоиска = "GETCONTEXTRESPONSE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Receives the next response from the model according to the message history";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextResponse";
    NewLine.МетодПоиска = "GETCONTEXTRESPONSE";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextResponse";
    NewLine.МетодПоиска = "GETCONTEXTRESPONSE";
    NewLine.Параметр    = "--msgs";
    NewLine.Описание    = "Messages log. See GetContextMessageStructure";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextResponse";
    NewLine.МетодПоиска = "GETCONTEXTRESPONSE";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Additional parameters. See GetRequestParametersStructure (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextResponse";
    NewLine.МетодПоиска = "GETCONTEXTRESPONSE";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetRequestParameterStructure";
    NewLine.МетодПоиска = "GETREQUESTPARAMETERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Gets the structure of additional parameters for request processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextParameterStructure";
    NewLine.МетодПоиска = "GETCONTEXTPARAMETERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Gets the structure of additional parameters to process the request in context";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextMessageStructure";
    NewLine.МетодПоиска = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Gets the message structure for a list of request messages in context";

    Return CompositionTable;
EndFunction

