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
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "CreateProject";
    NewLine.МетодПоиска = "CREATEPROJECT";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Project setup";
    NewLine.ОписаниеМетода   = "Creates a project file at the selected path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "LaunchProject";
    NewLine.МетодПоиска = "LAUNCHPROJECT";
    NewLine.Параметр    = "--port";
    NewLine.Описание    = "Servers port";
    NewLine.Область     = "Project setup";
    NewLine.ОписаниеМетода   = "Launches integration proxy server";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "LaunchProject";
    NewLine.МетодПоиска = "LAUNCHPROJECT";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Project setup";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "AddRequestsHandler";
    NewLine.МетодПоиска = "ADDREQUESTSHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Handlers configuration";
    NewLine.ОписаниеМетода   = "Adds a new handler to the project";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "AddRequestsHandler";
    NewLine.МетодПоиска = "ADDREQUESTSHANDLER";
    NewLine.Параметр    = "--lib";
    NewLine.Описание    = "Library name in CLI command format";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "AddRequestsHandler";
    NewLine.МетодПоиска = "ADDREQUESTSHANDLER";
    NewLine.Параметр    = "--func";
    NewLine.Описание    = "OpenIntegrations function name";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "AddRequestsHandler";
    NewLine.МетодПоиска = "ADDREQUESTSHANDLER";
    NewLine.Параметр    = "--method";
    NewLine.Описание    = "HTTP method that will process the handler: GET, POST, MULTIPART (optional, def. val. - GET)";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetRequestHandlersList";
    NewLine.МетодПоиска = "GETREQUESTHANDLERSLIST";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Handlers configuration";
    NewLine.ОписаниеМетода   = "Gets the list of handlers in the project";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetRequestsHandler";
    NewLine.МетодПоиска = "GETREQUESTSHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Handlers configuration";
    NewLine.ОписаниеМетода   = "Gets information about the handler by key";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetRequestsHandler";
    NewLine.МетодПоиска = "GETREQUESTSHANDLER";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "DeleteRequestHandler";
    NewLine.МетодПоиска = "DELETEREQUESTHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Handlers configuration";
    NewLine.ОписаниеМетода   = "Removes the request handler from the project";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "DeleteRequestHandler";
    NewLine.МетодПоиска = "DELETEREQUESTHANDLER";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "UpdateRequestsHandler";
    NewLine.МетодПоиска = "UPDATEREQUESTSHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Handlers configuration";
    NewLine.ОписаниеМетода   = "Changes the values of the request handler fields";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "UpdateRequestsHandler";
    NewLine.МетодПоиска = "UPDATEREQUESTSHANDLER";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "UpdateRequestsHandler";
    NewLine.МетодПоиска = "UPDATEREQUESTSHANDLER";
    NewLine.Параметр    = "--lib";
    NewLine.Описание    = "Library name in CLI command format (optional, def. val. - Empty value)";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "UpdateRequestsHandler";
    NewLine.МетодПоиска = "UPDATEREQUESTSHANDLER";
    NewLine.Параметр    = "--func";
    NewLine.Описание    = "OpenIntegrations function name (optional, def. val. - Empty value)";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "UpdateRequestsHandler";
    NewLine.МетодПоиска = "UPDATEREQUESTSHANDLER";
    NewLine.Параметр    = "--method";
    NewLine.Описание    = "HTTP method that will process the handler: GET, POST, MULTIPART (optional, def. val. - Empty value)";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "DisableRequestsHandler";
    NewLine.МетодПоиска = "DISABLEREQUESTSHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Handlers configuration";
    NewLine.ОписаниеМетода   = "Disables the handler by key";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "DisableRequestsHandler";
    NewLine.МетодПоиска = "DISABLEREQUESTSHANDLER";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "EnableRequestsHandler";
    NewLine.МетодПоиска = "ENABLEREQUESTSHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Handlers configuration";
    NewLine.ОписаниеМетода   = "Enables the handler by key";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "EnableRequestsHandler";
    NewLine.МетодПоиска = "ENABLEREQUESTSHANDLER";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Handlers configuration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "SetHandlerArguments";
    NewLine.МетодПоиска = "SETHANDLERARGUMENTS";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Argument setting";
    NewLine.ОписаниеМетода   = "Sets the argument to the function, allowing it to be unspecified when the handler is called";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "SetHandlerArguments";
    NewLine.МетодПоиска = "SETHANDLERARGUMENTS";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Argument setting";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "SetHandlerArguments";
    NewLine.МетодПоиска = "SETHANDLERARGUMENTS";
    NewLine.Параметр    = "--arg";
    NewLine.Описание    = "CLI argument (option) for the handler function";
    NewLine.Область     = "Argument setting";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "SetHandlerArguments";
    NewLine.МетодПоиска = "SETHANDLERARGUMENTS";
    NewLine.Параметр    = "--value";
    NewLine.Описание    = "String argument value";
    NewLine.Область     = "Argument setting";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "SetHandlerArguments";
    NewLine.МетодПоиска = "SETHANDLERARGUMENTS";
    NewLine.Параметр    = "--strict";
    NewLine.Описание    = "True > argument cannot be overwritten by a request data (optional, def. val. - Yes)";
    NewLine.Область     = "Argument setting";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetHandlerArguments";
    NewLine.МетодПоиска = "GETHANDLERARGUMENTS";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Argument setting";
    NewLine.ОписаниеМетода   = "Gets the list of defined handler arguments";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetHandlerArguments";
    NewLine.МетодПоиска = "GETHANDLERARGUMENTS";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Argument setting";

    Return CompositionTable;
EndFunction

