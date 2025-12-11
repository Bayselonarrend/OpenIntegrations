
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetVersion";
    NewLine.SearchMethod  = "GETVERSION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets a version of Ollama";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetVersion";
    NewLine.SearchMethod  = "GETVERSION";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Generates a response for a given text query";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--prompt";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Request text";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional parameters. See GetRequestParametersStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextResponse";
    NewLine.SearchMethod  = "GETCONTEXTRESPONSE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Receives the next response from the model according to the message history";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextResponse";
    NewLine.SearchMethod  = "GETCONTEXTRESPONSE";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextResponse";
    NewLine.SearchMethod  = "GETCONTEXTRESPONSE";
    NewLine.Parameter     = "--msgs";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Messages log. See GetContextMessageStructure";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextResponse";
    NewLine.SearchMethod  = "GETCONTEXTRESPONSE";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional parameters. See GetRequestParametersStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextResponse";
    NewLine.SearchMethod  = "GETCONTEXTRESPONSE";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the embeddings for the given entries";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--input";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "String or array of request strings";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional parameters. See GetEmbeddingsParameterStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetRequestParameterStructure";
    NewLine.SearchMethod  = "GETREQUESTPARAMETERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the structure of additional parameters for request processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetEmbeddingsParameterStructure";
    NewLine.SearchMethod  = "GETEMBEDDINGSPARAMETERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the structure of additional parameters for processing embeddings requests";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextParameterStructure";
    NewLine.SearchMethod  = "GETCONTEXTPARAMETERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the structure of additional parameters to process the request in context";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextMessageStructure";
    NewLine.SearchMethod  = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Parameter     = "--role";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Message source: system, user, assistant, tool";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the message structure for a list of request messages in context";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextMessageStructure";
    NewLine.SearchMethod  = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextMessageStructure";
    NewLine.SearchMethod  = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Parameter     = "--images";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "List of pictures in Base64 format (for multimodal models like llava) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetContextMessageStructure";
    NewLine.SearchMethod  = "GETCONTEXTMESSAGESTRUCTURE";
    NewLine.Parameter     = "--tools";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "List of tools in JSON format that the model should use (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetModelList";
    NewLine.SearchMethod  = "GETMODELLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Gets a list of local models";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetModelList";
    NewLine.SearchMethod  = "GETMODELLIST";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "ListRunningModels";
    NewLine.SearchMethod  = "LISTRUNNINGMODELS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Gets a list of running models";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "ListRunningModels";
    NewLine.SearchMethod  = "LISTRUNNINGMODELS";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetModelInformation";
    NewLine.SearchMethod  = "GETMODELINFORMATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Gets information about the model";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetModelInformation";
    NewLine.SearchMethod  = "GETMODELINFORMATION";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetModelInformation";
    NewLine.SearchMethod  = "GETMODELINFORMATION";
    NewLine.Parameter     = "--verbose";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Return full model information (optional, def. val.. - True)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetModelInformation";
    NewLine.SearchMethod  = "GETMODELINFORMATION";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CreateModel";
    NewLine.SearchMethod  = "CREATEMODEL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Creates a new model with the specified settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CreateModel";
    NewLine.SearchMethod  = "CREATEMODEL";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CreateModel";
    NewLine.SearchMethod  = "CREATEMODEL";
    NewLine.Parameter     = "--settings";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Model settings. See GetModelSettingsStructure";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CreateModel";
    NewLine.SearchMethod  = "CREATEMODEL";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CopyModel";
    NewLine.SearchMethod  = "COPYMODEL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Copies an existing model";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CopyModel";
    NewLine.SearchMethod  = "COPYMODEL";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Name of existing model";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CopyModel";
    NewLine.SearchMethod  = "COPYMODEL";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "The name of the new model";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CopyModel";
    NewLine.SearchMethod  = "COPYMODEL";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "DeleteModel";
    NewLine.SearchMethod  = "DELETEMODEL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Deletes an existing model";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "DeleteModel";
    NewLine.SearchMethod  = "DELETEMODEL";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "DeleteModel";
    NewLine.SearchMethod  = "DELETEMODEL";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "LoadModelToMemory";
    NewLine.SearchMethod  = "LOADMODELTOMEMORY";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Loads the selected model into RAM";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "LoadModelToMemory";
    NewLine.SearchMethod  = "LOADMODELTOMEMORY";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "LoadModelToMemory";
    NewLine.SearchMethod  = "LOADMODELTOMEMORY";
    NewLine.Parameter     = "--keep";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Model hold time in seconds (optional, def. val.. - 300)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "LoadModelToMemory";
    NewLine.SearchMethod  = "LOADMODELTOMEMORY";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "UnloadModelFromMemory";
    NewLine.SearchMethod  = "UNLOADMODELFROMMEMORY";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Unloads the selected model from memory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "UnloadModelFromMemory";
    NewLine.SearchMethod  = "UNLOADMODELFROMMEMORY";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "UnloadModelFromMemory";
    NewLine.SearchMethod  = "UNLOADMODELFROMMEMORY";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PushModel";
    NewLine.SearchMethod  = "PUSHMODEL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Uploads the model to the model library";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PushModel";
    NewLine.SearchMethod  = "PUSHMODEL";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PushModel";
    NewLine.SearchMethod  = "PUSHMODEL";
    NewLine.Parameter     = "--insecure";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Allows an unsecured connection to the library (optional, def. val.. - False)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PushModel";
    NewLine.SearchMethod  = "PUSHMODEL";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PullModel";
    NewLine.SearchMethod  = "PULLMODEL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Downloads a model from the library";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PullModel";
    NewLine.SearchMethod  = "PULLMODEL";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PullModel";
    NewLine.SearchMethod  = "PULLMODEL";
    NewLine.Parameter     = "--insecure";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Allows an unsecured connection to the library (optional, def. val.. - False)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PullModel";
    NewLine.SearchMethod  = "PULLMODEL";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "GetModelSettingsStructure";
    NewLine.SearchMethod  = "GETMODELSETTINGSSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Gets the settings structure for creating a new model";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PushBlob";
    NewLine.SearchMethod  = "PUSHBLOB";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Working with blob";
    NewLine.MethodDescription   = "Sends binary data to the Ollama server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PushBlob";
    NewLine.SearchMethod  = "PUSHBLOB";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "File data or filepath";
    NewLine.Region      = "Working with blob";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "PushBlob";
    NewLine.SearchMethod  = "PUSHBLOB";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Working with blob";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CheckBlob";
    NewLine.SearchMethod  = "CHECKBLOB";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Ollama server URL";
    NewLine.Region      = "Working with blob";
    NewLine.MethodDescription   = "Checks the existence of a BLOB by its SHA256 digest";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CheckBlob";
    NewLine.SearchMethod  = "CHECKBLOB";
    NewLine.Parameter     = "--digest";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "SHA256 BLOB digest";
    NewLine.Region      = "Working with blob";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ollama";
    NewLine.Module       = "OPI_Ollama";
    NewLine.Method        = "CheckBlob";
    NewLine.SearchMethod  = "CHECKBLOB";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Working with blob";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Ollama = LoadScript(""%1/oint/core/Modules/OPI_Ollama.os"", Context);
        |" + Chars.LF;


EndFunction 
