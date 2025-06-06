﻿Function GetComposition() Export

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
    NewLine.Description    = "OpenAI server URL";
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
    NewLine.Description    = "Additional request parameters, if necessary (optional, def. val. - Empty value)";
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
    NewLine.Description    = "OpenAI server URL";
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
    NewLine.Description    = "Additional request parameters, if necessary (optional, def. val. - Empty value)";
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


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetAssistantsList";
    NewLine.SearchMethod = "GETASSISTANTSLIST";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "Assistants";
    NewLine.MethodDescription   = "Retrieves a list of assistants with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetAssistantsList";
    NewLine.SearchMethod = "GETASSISTANTSLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetAssistantsList";
    NewLine.SearchMethod = "GETASSISTANTSLIST";
    NewLine.Parameter    = "--limit";
    NewLine.Description    = "Maximum number of assistants returned (optional, def. val. - 20)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetAssistantsList";
    NewLine.SearchMethod = "GETASSISTANTSLIST";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "Additional request parameters, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetAssistantsList";
    NewLine.SearchMethod = "GETASSISTANTSLIST";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "CreateAssistant";
    NewLine.SearchMethod = "CREATEASSISTANT";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "Assistants";
    NewLine.MethodDescription   = "Creates an assistant based on the model and instruction";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "CreateAssistant";
    NewLine.SearchMethod = "CREATEASSISTANT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "CreateAssistant";
    NewLine.SearchMethod = "CREATEASSISTANT";
    NewLine.Parameter    = "--model";
    NewLine.Description    = "Models name";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "CreateAssistant";
    NewLine.SearchMethod = "CREATEASSISTANT";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Assistant name (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "CreateAssistant";
    NewLine.SearchMethod = "CREATEASSISTANT";
    NewLine.Parameter    = "--inst";
    NewLine.Description    = "System instruction for the assistant (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "CreateAssistant";
    NewLine.SearchMethod = "CREATEASSISTANT";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "Additional request parameters, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "CreateAssistant";
    NewLine.SearchMethod = "CREATEASSISTANT";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "RetrieveAssistant";
    NewLine.SearchMethod = "RETRIEVEASSISTANT";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "Assistants";
    NewLine.MethodDescription   = "Retrieves information about an assistant by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "RetrieveAssistant";
    NewLine.SearchMethod = "RETRIEVEASSISTANT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "RetrieveAssistant";
    NewLine.SearchMethod = "RETRIEVEASSISTANT";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Assistant ID";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "RetrieveAssistant";
    NewLine.SearchMethod = "RETRIEVEASSISTANT";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteAssistant";
    NewLine.SearchMethod = "DELETEASSISTANT";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "Assistants";
    NewLine.MethodDescription   = "Deletes a previously created assistant";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteAssistant";
    NewLine.SearchMethod = "DELETEASSISTANT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteAssistant";
    NewLine.SearchMethod = "DELETEASSISTANT";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Assistant ID";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteAssistant";
    NewLine.SearchMethod = "DELETEASSISTANT";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Assistants";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "File management";
    NewLine.MethodDescription   = "Get a list of files with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--limit";
    NewLine.Description    = "Maximum number of assistants returned (optional, def. val. - 10000)";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "Additional request parameters, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "File management";
    NewLine.MethodDescription   = "Uploads a file for further use in other requests";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "File name with extension";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--data";
    NewLine.Description    = "Path to file or data";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--purpose";
    NewLine.Description    = "File purpose: assistants, batch, vision, user_data, evals";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFileInformation";
    NewLine.SearchMethod = "GETFILEINFORMATION";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "File management";
    NewLine.MethodDescription   = "Gets information about the file";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFileInformation";
    NewLine.SearchMethod = "GETFILEINFORMATION";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFileInformation";
    NewLine.SearchMethod = "GETFILEINFORMATION";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "File ID";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "GetFileInformation";
    NewLine.SearchMethod = "GETFILEINFORMATION";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "File management";
    NewLine.MethodDescription   = "Get file data from the server";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "File ID";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteFile";
    NewLine.SearchMethod = "DELETEFILE";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "OpenAI server URL";
    NewLine.Region     = "File management";
    NewLine.MethodDescription   = "Deletes a previously uploaded file";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteFile";
    NewLine.SearchMethod = "DELETEFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "OpenAI authorization token";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteFile";
    NewLine.SearchMethod = "DELETEFILE";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "File ID";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "openai";
    NewLine.Module      = "OPI_OpenAI";
    NewLine.Method       = "DeleteFile";
    NewLine.SearchMethod = "DELETEFILE";
    NewLine.Parameter    = "--headers";
    NewLine.Description    = "Additional request headers, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "File management";

    Return CompositionTable;
EndFunction

