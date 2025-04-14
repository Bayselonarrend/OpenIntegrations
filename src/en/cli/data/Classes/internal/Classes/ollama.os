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
    NewLine.Метод       = "GetVersion";
    NewLine.МетодПоиска = "GETVERSION";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Gets a version of Ollama";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetVersion";
    NewLine.МетодПоиска = "GETVERSION";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


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
    NewLine.Метод       = "GetEmbeddings";
    NewLine.МетодПоиска = "GETEMBEDDINGS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Gets the embeddings for the given entries";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetEmbeddings";
    NewLine.МетодПоиска = "GETEMBEDDINGS";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetEmbeddings";
    NewLine.МетодПоиска = "GETEMBEDDINGS";
    NewLine.Параметр    = "--input";
    NewLine.Описание    = "String or array of request strings";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetEmbeddings";
    NewLine.МетодПоиска = "GETEMBEDDINGS";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Additional parameters. See GetEmbeddingsParameterStructure (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetEmbeddings";
    NewLine.МетодПоиска = "GETEMBEDDINGS";
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
    NewLine.Метод       = "GetEmbeddingsParameterStructure";
    NewLine.МетодПоиска = "GETEMBEDDINGSPARAMETERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Gets the structure of additional parameters for processing embeddings requests";


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
    NewLine.Параметр    = "--role";
    NewLine.Описание    = "Message source: system, user, assistant, tool";
    NewLine.Область     = "Requests processing";
    NewLine.ОписаниеМетода   = "Gets the message structure for a list of request messages in context";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextMessageStructure";
    NewLine.МетодПоиска = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextMessageStructure";
    NewLine.МетодПоиска = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Параметр    = "--images";
    NewLine.Описание    = "List of pictures in Base64 format (for multimodal models like llava) (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetContextMessageStructure";
    NewLine.МетодПоиска = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Параметр    = "--tools";
    NewLine.Описание    = "List of tools in JSON format that the model should use (optional, def. val. - Empty value)";
    NewLine.Область     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetModelList";
    NewLine.МетодПоиска = "GETMODELLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Gets a list of local models";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetModelList";
    NewLine.МетодПоиска = "GETMODELLIST";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "ListRunningModels";
    NewLine.МетодПоиска = "LISTRUNNINGMODELS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Gets a list of running models";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "ListRunningModels";
    NewLine.МетодПоиска = "LISTRUNNINGMODELS";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetModelInformation";
    NewLine.МетодПоиска = "GETMODELINFORMATION";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Gets information about the model";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetModelInformation";
    NewLine.МетодПоиска = "GETMODELINFORMATION";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetModelInformation";
    NewLine.МетодПоиска = "GETMODELINFORMATION";
    NewLine.Параметр    = "--verbose";
    NewLine.Описание    = "Return full model information (optional, def. val. - Yes)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetModelInformation";
    NewLine.МетодПоиска = "GETMODELINFORMATION";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CreateModel";
    NewLine.МетодПоиска = "CREATEMODEL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Creates a new model with the specified settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CreateModel";
    NewLine.МетодПоиска = "CREATEMODEL";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CreateModel";
    NewLine.МетодПоиска = "CREATEMODEL";
    NewLine.Параметр    = "--settings";
    NewLine.Описание    = "Model settings. See GetModelSettingsStructure";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CreateModel";
    NewLine.МетодПоиска = "CREATEMODEL";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CopyModel";
    NewLine.МетодПоиска = "COPYMODEL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Copies an existing model";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CopyModel";
    NewLine.МетодПоиска = "COPYMODEL";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Name of existing model";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CopyModel";
    NewLine.МетодПоиска = "COPYMODEL";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "The name of the new model";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "CopyModel";
    NewLine.МетодПоиска = "COPYMODEL";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "DeleteModel";
    NewLine.МетодПоиска = "DELETEMODEL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Deletes an existing model";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "DeleteModel";
    NewLine.МетодПоиска = "DELETEMODEL";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "DeleteModel";
    NewLine.МетодПоиска = "DELETEMODEL";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "LoadModelToMemory";
    NewLine.МетодПоиска = "LOADMODELTOMEMORY";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Loads the selected model into RAM";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "LoadModelToMemory";
    NewLine.МетодПоиска = "LOADMODELTOMEMORY";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "LoadModelToMemory";
    NewLine.МетодПоиска = "LOADMODELTOMEMORY";
    NewLine.Параметр    = "--keep";
    NewLine.Описание    = "Model hold time in seconds (optional, def. val. - 300)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "LoadModelToMemory";
    NewLine.МетодПоиска = "LOADMODELTOMEMORY";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "UnloadModelFromMemory";
    NewLine.МетодПоиска = "UNLOADMODELFROMMEMORY";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Unloads the selected model from memory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "UnloadModelFromMemory";
    NewLine.МетодПоиска = "UNLOADMODELFROMMEMORY";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "UnloadModelFromMemory";
    NewLine.МетодПоиска = "UNLOADMODELFROMMEMORY";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PushModel";
    NewLine.МетодПоиска = "PUSHMODEL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Uploads the model to the model library";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PushModel";
    NewLine.МетодПоиска = "PUSHMODEL";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PushModel";
    NewLine.МетодПоиска = "PUSHMODEL";
    NewLine.Параметр    = "--insecure";
    NewLine.Описание    = "Allows an unsecured connection to the library (optional, def. val. - No)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PushModel";
    NewLine.МетодПоиска = "PUSHMODEL";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PullModel";
    NewLine.МетодПоиска = "PULLMODEL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Downloads a model from the library";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PullModel";
    NewLine.МетодПоиска = "PULLMODEL";
    NewLine.Параметр    = "--model";
    NewLine.Описание    = "Models name";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PullModel";
    NewLine.МетодПоиска = "PULLMODEL";
    NewLine.Параметр    = "--insecure";
    NewLine.Описание    = "Allows an unsecured connection to the library (optional, def. val. - No)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PullModel";
    NewLine.МетодПоиска = "PULLMODEL";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "GetModelSettingsStructure";
    NewLine.МетодПоиска = "GETMODELSETTINGSSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Models management";
    NewLine.ОписаниеМетода   = "Gets the settings structure for creating a new model";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PushBlob";
    NewLine.МетодПоиска = "PUSHBLOB";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Ollama server URL";
    NewLine.Область     = "Working with blob";
    NewLine.ОписаниеМетода   = "Sends binary data to the Ollama server";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PushBlob";
    NewLine.МетодПоиска = "PUSHBLOB";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "File data or filepath";
    NewLine.Область     = "Working with blob";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "ollama";
    NewLine.Модуль      = "OPI_Ollama";
    NewLine.Метод       = "PushBlob";
    NewLine.МетодПоиска = "PUSHBLOB";
    NewLine.Параметр    = "--headers";
    NewLine.Описание    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Working with blob";

    Return CompositionTable;
EndFunction

