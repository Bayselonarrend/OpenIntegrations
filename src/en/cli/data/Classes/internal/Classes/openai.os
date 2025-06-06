Function GetComposition() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetResponse";
    NewLine.SearchMethod = "GETRESPONSE";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Ollama server URL";
    NewLine.Region     = "Requests processing";
    NewLine.MethodDescription   = "Generates a response for a given text query";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetResponse";
    NewLine.SearchMethod = "GETRESPONSE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetResponse";
    NewLine.SearchMethod = "GETRESPONSE";
    NewLine.Parameter    = "--model";
    NewLine.Description    = "Models name";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetResponse";
    NewLine.SearchMethod = "GETRESPONSE";
    NewLine.Parameter    = "--msgs";
    NewLine.Description    = "Conversation messages. See GetMessageStructure";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetResponse";
    NewLine.SearchMethod = "GETRESPONSE";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "KeyValue collection of additional parameters (optional, def. val. - Empty value)";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetResponse";
    NewLine.SearchMethod = "GETRESPONSE";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetEmbeddings";
    NewLine.SearchMethod = "GETEMBEDDINGS";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Ollama server URL";
    NewLine.Region     = "Requests processing";
    NewLine.MethodDescription   = "Gets the embeddings for the given entries";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetEmbeddings";
    NewLine.SearchMethod = "GETEMBEDDINGS";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetEmbeddings";
    NewLine.SearchMethod = "GETEMBEDDINGS";
    NewLine.Parameter    = "--model";
    NewLine.Description    = "Models name";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetEmbeddings";
    NewLine.SearchMethod = "GETEMBEDDINGS";
    NewLine.Parameter    = "--input";
    NewLine.Description    = "String or array of request strings";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetEmbeddings";
    NewLine.SearchMethod = "GETEMBEDDINGS";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "Additional parameters. See GetEmbeddingsParameterStructure (optional, def. val. - Empty value)";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetEmbeddings";
    NewLine.SearchMethod = "GETEMBEDDINGS";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetMessageStructure";
    NewLine.SearchMethod = "GETMESSAGESTRUCTURE";
    NewLine.Parameter    = "--role";
    NewLine.Description    = "Message source: system, user, developer";
    NewLine.Region     = "Requests processing";
    NewLine.MethodDescription   = "Receives the message structure for the request message list";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetMessageStructure";
    NewLine.SearchMethod = "GETMESSAGESTRUCTURE";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Requests processing";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetMessageStructure";
    NewLine.SearchMethod = "GETMESSAGESTRUCTURE";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Name of participant in conversation (optional, def. val. - Empty value)";
    NewLine.Region     = "Requests processing";

    Return CompositionTable;
EndFunction

