
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
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Generates a response for a given text query";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--msgs";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Conversation messages. See GetMessageStructure";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetResponse";
    NewLine.SearchMethod  = "GETRESPONSE";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImages";
    NewLine.SearchMethod  = "GETIMAGES";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Generates images based on the specified description";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImages";
    NewLine.SearchMethod  = "GETIMAGES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImages";
    NewLine.SearchMethod  = "GETIMAGES";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImages";
    NewLine.SearchMethod  = "GETIMAGES";
    NewLine.Parameter     = "--descr";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Generation parameters. See GetImageDescriptionStructure";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImages";
    NewLine.SearchMethod  = "GETIMAGES";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the embeddings for the given entries";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--input";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "String or array of request strings";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetEmbeddings";
    NewLine.SearchMethod  = "GETEMBEDDINGS";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetMessageStructure";
    NewLine.SearchMethod  = "GETMESSAGESTRUCTURE";
    NewLine.Parameter     = "--role";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Source of the message: system, user, assistant, etc..";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the structure of an arbitrary message for the request message list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetMessageStructure";
    NewLine.SearchMethod  = "GETMESSAGESTRUCTURE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetMessageStructure";
    NewLine.SearchMethod  = "GETMESSAGESTRUCTURE";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of participant in conversation (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetUserMessage";
    NewLine.SearchMethod  = "GETUSERMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the structure of a message from the user for use in a request";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetUserMessage";
    NewLine.SearchMethod  = "GETUSERMESSAGE";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Name of participant in conversation (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetAssistantMessage";
    NewLine.SearchMethod  = "GETASSISTANTMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the structure of a message from the assistant for use in a request";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetSystemMessage";
    NewLine.SearchMethod  = "GETSYSTEMMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the structure of a system message for use in a request";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageMessageStructure";
    NewLine.SearchMethod  = "GETIMAGEMESSAGESTRUCTURE";
    NewLine.Parameter     = "--role";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Message source: system, user, developer";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Gets the message structure based on the image for the request message list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageMessageStructure";
    NewLine.SearchMethod  = "GETIMAGEMESSAGESTRUCTURE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Image file ID. See UploadFile";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageMessageStructure";
    NewLine.SearchMethod  = "GETIMAGEMESSAGESTRUCTURE";
    NewLine.Parameter     = "--prompt";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Input text query for image processing (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageDescriptionStructure";
    NewLine.SearchMethod  = "GETIMAGEDESCRIPTIONSTRUCTURE";
    NewLine.Parameter     = "--prompt";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text description of the image for generation";
    NewLine.Region      = "Requests processing";
    NewLine.MethodDescription   = "Get image description structure for generation";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageDescriptionStructure";
    NewLine.SearchMethod  = "GETIMAGEDESCRIPTIONSTRUCTURE";
    NewLine.Parameter     = "--amount";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Number of images to generate";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageDescriptionStructure";
    NewLine.SearchMethod  = "GETIMAGEDESCRIPTIONSTRUCTURE";
    NewLine.Parameter     = "--bg";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Generation background option: transparent, opaque, auto (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageDescriptionStructure";
    NewLine.SearchMethod  = "GETIMAGEDESCRIPTIONSTRUCTURE";
    NewLine.Parameter     = "--size";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Size option for generated images (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetImageDescriptionStructure";
    NewLine.SearchMethod  = "GETIMAGEDESCRIPTIONSTRUCTURE";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetAssistantsList";
    NewLine.SearchMethod  = "GETASSISTANTSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Assistants";
    NewLine.MethodDescription   = "Retrieves a list of assistants with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetAssistantsList";
    NewLine.SearchMethod  = "GETASSISTANTSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetAssistantsList";
    NewLine.SearchMethod  = "GETASSISTANTSLIST";
    NewLine.Parameter     = "--limit";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Maximum number of assistants returned (optional, def. val.. - 20)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetAssistantsList";
    NewLine.SearchMethod  = "GETASSISTANTSLIST";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetAssistantsList";
    NewLine.SearchMethod  = "GETASSISTANTSLIST";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateAssistant";
    NewLine.SearchMethod  = "CREATEASSISTANT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Assistants";
    NewLine.MethodDescription   = "Creates an assistant based on the model and instruction";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateAssistant";
    NewLine.SearchMethod  = "CREATEASSISTANT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateAssistant";
    NewLine.SearchMethod  = "CREATEASSISTANT";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateAssistant";
    NewLine.SearchMethod  = "CREATEASSISTANT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Assistant name (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateAssistant";
    NewLine.SearchMethod  = "CREATEASSISTANT";
    NewLine.Parameter     = "--inst";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "System instruction for the assistant (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateAssistant";
    NewLine.SearchMethod  = "CREATEASSISTANT";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateAssistant";
    NewLine.SearchMethod  = "CREATEASSISTANT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "RetrieveAssistant";
    NewLine.SearchMethod  = "RETRIEVEASSISTANT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Assistants";
    NewLine.MethodDescription   = "Retrieves information about an assistant by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "RetrieveAssistant";
    NewLine.SearchMethod  = "RETRIEVEASSISTANT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "RetrieveAssistant";
    NewLine.SearchMethod  = "RETRIEVEASSISTANT";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Assistant ID";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "RetrieveAssistant";
    NewLine.SearchMethod  = "RETRIEVEASSISTANT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteAssistant";
    NewLine.SearchMethod  = "DELETEASSISTANT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Assistants";
    NewLine.MethodDescription   = "Deletes a previously created assistant";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteAssistant";
    NewLine.SearchMethod  = "DELETEASSISTANT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteAssistant";
    NewLine.SearchMethod  = "DELETEASSISTANT";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Assistant ID";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteAssistant";
    NewLine.SearchMethod  = "DELETEASSISTANT";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Get a list of files with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--limit";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Maximum number of assistants returned (optional, def. val.. - 10000)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Uploads a file for further use in other requests";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "File name with extension";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Path to file or data";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--purpose";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "File purpose: assistants, batch, vision, user_data, evals";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Gets information about the file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "File ID";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Get file data from the server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "File ID";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Deletes a previously uploaded file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "File ID";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GenerateSpeech";
    NewLine.SearchMethod  = "GENERATESPEECH";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Audio processing";
    NewLine.MethodDescription   = "Generates audio with the specified text for speech synthesis";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GenerateSpeech";
    NewLine.SearchMethod  = "GENERATESPEECH";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GenerateSpeech";
    NewLine.SearchMethod  = "GENERATESPEECH";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GenerateSpeech";
    NewLine.SearchMethod  = "GENERATESPEECH";
    NewLine.Parameter     = "--input";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Text for speech synthesis";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GenerateSpeech";
    NewLine.SearchMethod  = "GENERATESPEECH";
    NewLine.Parameter     = "--voice";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Voice type: alloy, ash, ballad, coral, echo, etc.. (optional, def. val.. - alloy)";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GenerateSpeech";
    NewLine.SearchMethod  = "GENERATESPEECH";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GenerateSpeech";
    NewLine.SearchMethod  = "GENERATESPEECH";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateTranscription";
    NewLine.SearchMethod  = "CREATETRANSCRIPTION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Audio processing";
    NewLine.MethodDescription   = "Creates a text transcription for the selected audio file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateTranscription";
    NewLine.SearchMethod  = "CREATETRANSCRIPTION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateTranscription";
    NewLine.SearchMethod  = "CREATETRANSCRIPTION";
    NewLine.Parameter     = "--model";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Models name";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateTranscription";
    NewLine.SearchMethod  = "CREATETRANSCRIPTION";
    NewLine.Parameter     = "--audio";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Audio file";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateTranscription";
    NewLine.SearchMethod  = "CREATETRANSCRIPTION";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "MIME type of audio file (optional, def. val.. - audio/mpeg)";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateTranscription";
    NewLine.SearchMethod  = "CREATETRANSCRIPTION";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Additional request parameters, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "CreateTranscription";
    NewLine.SearchMethod  = "CREATETRANSCRIPTION";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Audio processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetModelList";
    NewLine.SearchMethod  = "GETMODELLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "OpenAI server URL";
    NewLine.Region      = "Models management";
    NewLine.MethodDescription   = "Receives a list of available models";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetModelList";
    NewLine.SearchMethod  = "GETMODELLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "OpenAI authorization token";
    NewLine.Region      = "Models management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "openai";
    NewLine.Module       = "OPI_OpenAI";
    NewLine.Method        = "GetModelList";
    NewLine.SearchMethod  = "GETMODELLIST";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Models management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_OpenAI = LoadScript(""%1/oint/core/Modules/OPI_OpenAI.os"", Context);
        |" + Chars.LF;


EndFunction 
