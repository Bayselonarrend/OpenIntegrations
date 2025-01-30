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
    NewLine.Метод       = "AddRequestsHandler";
    NewLine.МетодПоиска = "ADDREQUESTSHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Project setup";
    NewLine.ОписаниеМетода   = "Adds a new handler to the project";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "AddRequestsHandler";
    NewLine.МетодПоиска = "ADDREQUESTSHANDLER";
    NewLine.Параметр    = "--func";
    NewLine.Описание    = "OpenIntegrations function name";
    NewLine.Область     = "Project setup";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "AddRequestsHandler";
    NewLine.МетодПоиска = "ADDREQUESTSHANDLER";
    NewLine.Параметр    = "--method";
    NewLine.Описание    = "HTTP method that will process the handler: GET, POST, MULTIPART (optional, def. val. - GET)";
    NewLine.Область     = "Project setup";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetRequestHandlersList";
    NewLine.МетодПоиска = "GETREQUESTHANDLERSLIST";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Project setup";
    NewLine.ОписаниеМетода   = "Gets the list of handlers in the project";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetRequestsHandler";
    NewLine.МетодПоиска = "GETREQUESTSHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Project setup";
    NewLine.ОписаниеМетода   = "Gets information about the handler by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "GetRequestsHandler";
    NewLine.МетодПоиска = "GETREQUESTSHANDLER";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Project setup";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "DeleteRequestHandler";
    NewLine.МетодПоиска = "DELETEREQUESTHANDLER";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Project setup";
    NewLine.ОписаниеМетода   = "Removes the request handler from the project";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "DeleteRequestHandler";
    NewLine.МетодПоиска = "DELETEREQUESTHANDLER";
    NewLine.Параметр    = "--handler";
    NewLine.Описание    = "Handler key";
    NewLine.Область     = "Project setup";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "Start";
    NewLine.МетодПоиска = "START";
    NewLine.Параметр    = "--port";
    NewLine.Описание    = "Servers port";
    NewLine.Область     = "Project setup";
    NewLine.ОписаниеМетода   = "Launches integration proxy server";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "OPI_IntegrationProxy";
    NewLine.Метод       = "Start";
    NewLine.МетодПоиска = "START";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Project setup";

    Return CompositionTable;
EndFunction

