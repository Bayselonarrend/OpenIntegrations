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
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetAppAuthLink";
    NewLine.МетодПоиска = "GETAPPAUTHLINK";
    NewLine.Параметр    = "--domain";
    NewLine.Описание    = "Current Bitrix URL (like 'portal.bitrix24.com')";
    NewLine.Область     = "Settings and administartion";
    NewLine.ОписаниеМетода   = "Forms a link for authorization via the browser";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetAppAuthLink";
    NewLine.МетодПоиска = "GETAPPAUTHLINK";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client ID from app settings";
    NewLine.Область     = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client ID from app settings";
    NewLine.Область     = "Settings and administartion";
    NewLine.ОписаниеМетода   = "Get token by auth code";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--clientsecret";
    NewLine.Описание    = "Client secret from app settings";
    NewLine.Область     = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--code";
    NewLine.Описание    = "Code from browser auth page";
    NewLine.Область     = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--clientid";
    NewLine.Описание    = "Client ID from app settings";
    NewLine.Область     = "Settings and administartion";
    NewLine.ОписаниеМетода   = "Update token by refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--clientsecret";
    NewLine.Описание    = "Client secret from app settings";
    NewLine.Область     = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--refresh";
    NewLine.Описание    = "Refresh token";
    NewLine.Область     = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ServerTime";
    NewLine.МетодПоиска = "SERVERTIME";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Settings and administartion";
    NewLine.ОписаниеМетода   = "Get current server time";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ServerTime";
    NewLine.МетодПоиска = "SERVERTIME";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "News feed";
    NewLine.ОписаниеМетода   = "Create a new post at news feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Text of post";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--vision";
    NewLine.Описание    = "Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group (optional, def. val. - UA)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--files";
    NewLine.Описание    = "Data inложенandй, где toлюч > name file, value > path to file andдand дinоandчные Data (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Post title (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--important";
    NewLine.Описание    = "Mark post as important (optional, def. val. - False)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "News feed";
    NewLine.ОписаниеМетода   = "Change post data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Text of post";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--vision";
    NewLine.Описание    = "Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group (optional, def. val. - UA)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--files";
    NewLine.Описание    = "Data inложенandй, где toлюч > name file, value > path to file andдand дinоandчные Data (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Post title (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "News feed";
    NewLine.ОписаниеМетода   = "Remove post from a news feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Id of post to remove";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetImportantPostViewers";
    NewLine.МетодПоиска = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "News feed";
    NewLine.ОписаниеМетода   = "Return list of important post viewers ids";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetImportantPostViewers";
    NewLine.МетодПоиска = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Id of important post";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetImportantPostViewers";
    NewLine.МетодПоиска = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "News feed";
    NewLine.ОписаниеМетода   = "Gen post or array of post with ID or rights selection";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Id of important post (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Post selection by rights: UA all, SGn work group, Un user, DRn depart, Gn group (optional, def. val. - UA)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CrateComment";
    NewLine.МетодПоиска = "CRATECOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "News feed";
    NewLine.ОписаниеМетода   = "Adds a comment to the post";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CrateComment";
    NewLine.МетодПоиска = "CRATECOMMENT";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CrateComment";
    NewLine.МетодПоиска = "CRATECOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CrateComment";
    NewLine.МетодПоиска = "CRATECOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "News feed";
    NewLine.ОписаниеМетода   = "Adds new groups or users to the recipients";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--vision";
    NewLine.Описание    = "Array or a single post target: UA all, SG<X> work group, U<X> user, DR<X> depart., G<X> group";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "News feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskFieldsStructure";
    NewLine.МетодПоиска = "GETTASKFIELDSSTRUCTURE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Gets a structure with a description of the fields for creating a task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskFieldsStructure";
    NewLine.МетодПоиска = "GETTASKFIELDSSTRUCTURE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTask";
    NewLine.МетодПоиска = "GETTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Get task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTask";
    NewLine.МетодПоиска = "GETTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTask";
    NewLine.МетодПоиска = "GETTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Get tasks list (50 at one response max))";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--Structure of task filter (see GetTaskFieldsStructure)";
    NewLine.Описание    = "filter (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Offset of tasks list (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTask";
    NewLine.МетодПоиска = "CREATETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Create new task by fields structure (see GetTaskFieldsStructure)";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTask";
    NewLine.МетодПоиска = "CREATETASK";
    NewLine.Параметр    = "--Task fields structure";
    NewLine.Описание    = "fields";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTask";
    NewLine.МетодПоиска = "CREATETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Update a task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--Task fields structure";
    NewLine.Описание    = "fields";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTask";
    NewLine.МетодПоиска = "DELETETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Delete task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTask";
    NewLine.МетодПоиска = "DELETETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTask";
    NewLine.МетодПоиска = "DELETETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ApproveTask";
    NewLine.МетодПоиска = "APPROVETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Approve task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ApproveTask";
    NewLine.МетодПоиска = "APPROVETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ApproveTask";
    NewLine.МетодПоиска = "APPROVETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisapproveTask";
    NewLine.МетодПоиска = "DISAPPROVETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Disapprove task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisapproveTask";
    NewLine.МетодПоиска = "DISAPPROVETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisapproveTask";
    NewLine.МетодПоиска = "DISAPPROVETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTask";
    NewLine.МетодПоиска = "COMPLETETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Complete task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTask";
    NewLine.МетодПоиска = "COMPLETETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTask";
    NewLine.МетодПоиска = "COMPLETETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTask";
    NewLine.МетодПоиска = "RENEWTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Returns a task to work by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTask";
    NewLine.МетодПоиска = "RENEWTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTask";
    NewLine.МетодПоиска = "RENEWTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeferTask";
    NewLine.МетодПоиска = "DEFERTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Defer task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeferTask";
    NewLine.МетодПоиска = "DEFERTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeferTask";
    NewLine.МетодПоиска = "DEFERTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "PauseTask";
    NewLine.МетодПоиска = "PAUSETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Pause a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "PauseTask";
    NewLine.МетодПоиска = "PAUSETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "PauseTask";
    NewLine.МетодПоиска = "PAUSETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartTask";
    NewLine.МетодПоиска = "STARTTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Start a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartTask";
    NewLine.МетодПоиска = "STARTTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartTask";
    NewLine.МетодПоиска = "STARTTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartWatchingTask";
    NewLine.МетодПоиска = "STARTWATCHINGTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Start watching a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartWatchingTask";
    NewLine.МетодПоиска = "STARTWATCHINGTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartWatchingTask";
    NewLine.МетодПоиска = "STARTWATCHINGTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StopWatchingTask";
    NewLine.МетодПоиска = "STOPWATCHINGTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Stop watching a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StopWatchingTask";
    NewLine.МетодПоиска = "STOPWATCHINGTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StopWatchingTask";
    NewLine.МетодПоиска = "STOPWATCHINGTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Delegate task to another user";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "ID of responsible user";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskToFavorites";
    NewLine.МетодПоиска = "ADDTASKTOFAVORITES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Add task to favorites list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskToFavorites";
    NewLine.МетодПоиска = "ADDTASKTOFAVORITES";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskToFavorites";
    NewLine.МетодПоиска = "ADDTASKTOFAVORITES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RemoveTaskFromFavorites";
    NewLine.МетодПоиска = "REMOVETASKFROMFAVORITES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Delete task from favorites list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RemoveTaskFromFavorites";
    NewLine.МетодПоиска = "REMOVETASKFROMFAVORITES";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RemoveTaskFromFavorites";
    NewLine.МетодПоиска = "REMOVETASKFROMFAVORITES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskHistory";
    NewLine.МетодПоиска = "GETTASKHISTORY";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Get history of task changing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskHistory";
    NewLine.МетодПоиска = "GETTASKHISTORY";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskHistory";
    NewLine.МетодПоиска = "GETTASKHISTORY";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskCommentsList";
    NewLine.МетодПоиска = "GETTASKCOMMENTSLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Get user comments list for a task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskCommentsList";
    NewLine.МетодПоиска = "GETTASKCOMMENTSLIST";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskCommentsList";
    NewLine.МетодПоиска = "GETTASKCOMMENTSLIST";
    NewLine.Параметр    = "--Comments filter structure (see GetCommentsFilterStructure)";
    NewLine.Описание    = "filter (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskCommentsList";
    NewLine.МетодПоиска = "GETTASKCOMMENTSLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Tasks";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksFilterStructure";
    NewLine.МетодПоиска = "GETTASKSFILTERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Return filter structure for GetTasksList";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetCommentsFilterStructure";
    NewLine.МетодПоиска = "GETCOMMENTSFILTERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Область     = "Tasks";
    NewLine.ОписаниеМетода   = "Return filter structure for GetTaskCommentsList";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStoragesList";
    NewLine.МетодПоиска = "GETSTORAGESLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Get list of available files storages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStoragesList";
    NewLine.МетодПоиска = "GETSTORAGESLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetAppStoragesList";
    NewLine.МетодПоиска = "GETAPPSTORAGESLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Get a list of storages with which the application can work to store its data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetAppStoragesList";
    NewLine.МетодПоиска = "GETAPPSTORAGESLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorage";
    NewLine.МетодПоиска = "GETSTORAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Get information about storage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorage";
    NewLine.МетодПоиска = "GETSTORAGE";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage ID";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorage";
    NewLine.МетодПоиска = "GETSTORAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorageObjects";
    NewLine.МетодПоиска = "GETSTORAGEOBJECTS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Get a list of files and folders, located at the root of the storage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorageObjects";
    NewLine.МетодПоиска = "GETSTORAGEOBJECTS";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage ID";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorageObjects";
    NewLine.МетодПоиска = "GETSTORAGEOBJECTS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Upload file to storage root";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "File name with extension";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File for upload";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage id";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--rights";
    NewLine.Описание    = "Rights array if required (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Create new foldera at the storage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage ID";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Folder name";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Delete file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "ID of removing file";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFolder";
    NewLine.МетодПоиска = "DELETEFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Drive";
    NewLine.ОписаниеМетода   = "Remove folder with subfolders";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFolder";
    NewLine.МетодПоиска = "DELETEFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "ID of folder to be deleted";
    NewLine.Область     = "Drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFolder";
    NewLine.МетодПоиска = "DELETEFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty)";
    NewLine.Область     = "Drive";

    Return CompositionTable;
EndFunction

