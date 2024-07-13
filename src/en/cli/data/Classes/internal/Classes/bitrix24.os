﻿Function ПолучитьСостав() Export

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
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Feed posts managment";
    NewLine.ОписаниеМетода   = "Create a new post at news feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Text of post";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--vision";
    NewLine.Описание    = "Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group (optional, def. val. - UA)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--files";
    NewLine.Описание    = "Attachment data where key > filename, value > file path or binary data (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Post title (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--important";
    NewLine.Описание    = "Mark post as important (optional, def. val. - False)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Feed posts managment";
    NewLine.ОписаниеМетода   = "Change post data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Text of post";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--vision";
    NewLine.Описание    = "Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group (optional, def. val. - UA)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--files";
    NewLine.Описание    = "Attachment data where key > filename, value > file path or binary data (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Post title (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdatePost";
    NewLine.МетодПоиска = "UPDATEPOST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Feed posts managment";
    NewLine.ОписаниеМетода   = "Remove post from a news feed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Id of post to remove";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetImportantPostViewers";
    NewLine.МетодПоиска = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Feed posts managment";
    NewLine.ОписаниеМетода   = "Return list of important post viewers ids";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetImportantPostViewers";
    NewLine.МетодПоиска = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Id of important post";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetImportantPostViewers";
    NewLine.МетодПоиска = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Feed posts managment";
    NewLine.ОписаниеМетода   = "Gen post or array of post with ID or rights selection";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Id of important post (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Post selection by rights: UA all, SGn work group, Un user, DRn depart, Gn group (optional, def. val. - UA)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPosts";
    NewLine.МетодПоиска = "GETPOSTS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostComment";
    NewLine.МетодПоиска = "ADDPOSTCOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Feed posts managment";
    NewLine.ОписаниеМетода   = "Adds a comment to the post";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostComment";
    NewLine.МетодПоиска = "ADDPOSTCOMMENT";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostComment";
    NewLine.МетодПоиска = "ADDPOSTCOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostComment";
    NewLine.МетодПоиска = "ADDPOSTCOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Feed posts managment";
    NewLine.ОписаниеМетода   = "Adds new groups or users to the recipients";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--postid";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--vision";
    NewLine.Описание    = "Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddPostRecipients";
    NewLine.МетодПоиска = "ADDPOSTRECIPIENTS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Feed posts managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTask";
    NewLine.МетодПоиска = "GETTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Get task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTask";
    NewLine.МетодПоиска = "GETTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTask";
    NewLine.МетодПоиска = "GETTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Get tasks list (50 at one response max))";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--Structure of task filter (see GetTaskFieldsStructure)";
    NewLine.Описание    = "filter (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Offset of tasks list (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksList";
    NewLine.МетодПоиска = "GETTASKSLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTask";
    NewLine.МетодПоиска = "CREATETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Create new task by fields structure (see GetTaskFieldsStructure)";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTask";
    NewLine.МетодПоиска = "CREATETASK";
    NewLine.Параметр    = "--Task fields structure (see GetTaskFieldsStructure)";
    NewLine.Описание    = "fields";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTask";
    NewLine.МетодПоиска = "CREATETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Update a task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--Task fields structure";
    NewLine.Описание    = "fields";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTask";
    NewLine.МетодПоиска = "UPDATETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTask";
    NewLine.МетодПоиска = "DELETETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Delete task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTask";
    NewLine.МетодПоиска = "DELETETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTask";
    NewLine.МетодПоиска = "DELETETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AttachFileToTopic";
    NewLine.МетодПоиска = "ATTACHFILETOTOPIC";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Attaches a file to the selected task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AttachFileToTopic";
    NewLine.МетодПоиска = "ATTACHFILETOTOPIC";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AttachFileToTopic";
    NewLine.МетодПоиска = "ATTACHFILETOTOPIC";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AttachFileToTopic";
    NewLine.МетодПоиска = "ATTACHFILETOTOPIC";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ApproveTask";
    NewLine.МетодПоиска = "APPROVETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Approve task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ApproveTask";
    NewLine.МетодПоиска = "APPROVETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ApproveTask";
    NewLine.МетодПоиска = "APPROVETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisapproveTask";
    NewLine.МетодПоиска = "DISAPPROVETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Disapprove task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisapproveTask";
    NewLine.МетодПоиска = "DISAPPROVETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisapproveTask";
    NewLine.МетодПоиска = "DISAPPROVETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTask";
    NewLine.МетодПоиска = "COMPLETETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Complete task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTask";
    NewLine.МетодПоиска = "COMPLETETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTask";
    NewLine.МетодПоиска = "COMPLETETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTask";
    NewLine.МетодПоиска = "RENEWTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Returns a task to work by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTask";
    NewLine.МетодПоиска = "RENEWTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTask";
    NewLine.МетодПоиска = "RENEWTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeferTask";
    NewLine.МетодПоиска = "DEFERTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Defer task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeferTask";
    NewLine.МетодПоиска = "DEFERTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeferTask";
    NewLine.МетодПоиска = "DEFERTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "PauseTask";
    NewLine.МетодПоиска = "PAUSETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Pause a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "PauseTask";
    NewLine.МетодПоиска = "PAUSETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "PauseTask";
    NewLine.МетодПоиска = "PAUSETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartTask";
    NewLine.МетодПоиска = "STARTTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Start a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartTask";
    NewLine.МетодПоиска = "STARTTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartTask";
    NewLine.МетодПоиска = "STARTTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartWatchingTask";
    NewLine.МетодПоиска = "STARTWATCHINGTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Start watching a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartWatchingTask";
    NewLine.МетодПоиска = "STARTWATCHINGTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StartWatchingTask";
    NewLine.МетодПоиска = "STARTWATCHINGTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StopWatchingTask";
    NewLine.МетодПоиска = "STOPWATCHINGTASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Stop watching a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StopWatchingTask";
    NewLine.МетодПоиска = "STOPWATCHINGTASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "StopWatchingTask";
    NewLine.МетодПоиска = "STOPWATCHINGTASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Delegate task to another user";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "ID of responsible user";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DelegateTask";
    NewLine.МетодПоиска = "DELEGATETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskToFavorites";
    NewLine.МетодПоиска = "ADDTASKTOFAVORITES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Add task to favorites list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskToFavorites";
    NewLine.МетодПоиска = "ADDTASKTOFAVORITES";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskToFavorites";
    NewLine.МетодПоиска = "ADDTASKTOFAVORITES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RemoveTaskFromFavorites";
    NewLine.МетодПоиска = "REMOVETASKFROMFAVORITES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Delete task from favorites list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RemoveTaskFromFavorites";
    NewLine.МетодПоиска = "REMOVETASKFROMFAVORITES";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RemoveTaskFromFavorites";
    NewLine.МетодПоиска = "REMOVETASKFROMFAVORITES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskHistory";
    NewLine.МетодПоиска = "GETTASKHISTORY";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Get history of task changing";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskHistory";
    NewLine.МетодПоиска = "GETTASKHISTORY";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskHistory";
    NewLine.МетодПоиска = "GETTASKHISTORY";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CheckTaskAccesses";
    NewLine.МетодПоиска = "CHECKTASKACCESSES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Checks the availability of the task for users";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CheckTaskAccesses";
    NewLine.МетодПоиска = "CHECKTASKACCESSES";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CheckTaskAccesses";
    NewLine.МетодПоиска = "CHECKTASKACCESSES";
    NewLine.Параметр    = "--users";
    NewLine.Описание    = "User IDs for access checking (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CheckTaskAccesses";
    NewLine.МетодПоиска = "CHECKTASKACCESSES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MuteTask";
    NewLine.МетодПоиска = "MUTETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Mute task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MuteTask";
    NewLine.МетодПоиска = "MUTETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MuteTask";
    NewLine.МетодПоиска = "MUTETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UnmuteTask";
    NewLine.МетодПоиска = "UNMUTETASK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Unmute task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UnmuteTask";
    NewLine.МетодПоиска = "UNMUTETASK";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UnmuteTask";
    NewLine.МетодПоиска = "UNMUTETASK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTasksDependencies";
    NewLine.МетодПоиска = "CREATETASKSDEPENDENCIES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Creates the dependency of one task to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTasksDependencies";
    NewLine.МетодПоиска = "CREATETASKSDEPENDENCIES";
    NewLine.Параметр    = "--taskfrom";
    NewLine.Описание    = "From task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTasksDependencies";
    NewLine.МетодПоиска = "CREATETASKSDEPENDENCIES";
    NewLine.Параметр    = "--taskto";
    NewLine.Описание    = "To task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTasksDependencies";
    NewLine.МетодПоиска = "CREATETASKSDEPENDENCIES";
    NewLine.Параметр    = "--linktype";
    NewLine.Описание    = "Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateTasksDependencies";
    NewLine.МетодПоиска = "CREATETASKSDEPENDENCIES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksDependencies";
    NewLine.МетодПоиска = "DELETETASKSDEPENDENCIES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Removes the dependency of one task to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksDependencies";
    NewLine.МетодПоиска = "DELETETASKSDEPENDENCIES";
    NewLine.Параметр    = "--taskfrom";
    NewLine.Описание    = "From task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksDependencies";
    NewLine.МетодПоиска = "DELETETASKSDEPENDENCIES";
    NewLine.Параметр    = "--taskto";
    NewLine.Описание    = "To task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksDependencies";
    NewLine.МетодПоиска = "DELETETASKSDEPENDENCIES";
    NewLine.Параметр    = "--linktype";
    NewLine.Описание    = "Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksDependencies";
    NewLine.МетодПоиска = "DELETETASKSDEPENDENCIES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTasksChecklistElement";
    NewLine.МетодПоиска = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Adds new element of tasks checklist";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTasksChecklistElement";
    NewLine.МетодПоиска = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTasksChecklistElement";
    NewLine.МетодПоиска = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Text (title) of checklist element";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTasksChecklistElement";
    NewLine.МетодПоиска = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--complete";
    NewLine.Описание    = "Mark as completed (optional, def. val. - False)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTasksChecklistElement";
    NewLine.МетодПоиска = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTasksChecklistElement";
    NewLine.МетодПоиска = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Updates text of element of tasks checklist";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTasksChecklistElement";
    NewLine.МетодПоиска = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTasksChecklistElement";
    NewLine.МетодПоиска = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--element";
    NewLine.Описание    = "Checklist element ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTasksChecklistElement";
    NewLine.МетодПоиска = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Text (title) of checklist element";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTasksChecklistElement";
    NewLine.МетодПоиска = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksChecklistElement";
    NewLine.МетодПоиска = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Deletes element from tasks checklist";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksChecklistElement";
    NewLine.МетодПоиска = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksChecklistElement";
    NewLine.МетодПоиска = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--element";
    NewLine.Описание    = "ID of deleted element";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTasksChecklistElement";
    NewLine.МетодПоиска = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksChecklist";
    NewLine.МетодПоиска = "GETTASKSCHECKLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Gets the list of elements on the task checklist";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksChecklist";
    NewLine.МетодПоиска = "GETTASKSCHECKLIST";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksChecklist";
    NewLine.МетодПоиска = "GETTASKSCHECKLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksChecklistElement";
    NewLine.МетодПоиска = "GETTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Gets tasks checklist element by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksChecklistElement";
    NewLine.МетодПоиска = "GETTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksChecklistElement";
    NewLine.МетодПоиска = "GETTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--element";
    NewLine.Описание    = "Element ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksChecklistElement";
    NewLine.МетодПоиска = "GETTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTasksChecklistElement";
    NewLine.МетодПоиска = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Mark an element as completed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTasksChecklistElement";
    NewLine.МетодПоиска = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTasksChecklistElement";
    NewLine.МетодПоиска = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--element";
    NewLine.Описание    = "Element ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CompleteTasksChecklistElement";
    NewLine.МетодПоиска = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTasksChecklistElement";
    NewLine.МетодПоиска = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Unmark an element as completed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTasksChecklistElement";
    NewLine.МетодПоиска = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTasksChecklistElement";
    NewLine.МетодПоиска = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--element";
    NewLine.Описание    = "Element ID";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenewTasksChecklistElement";
    NewLine.МетодПоиска = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetDailyPlan";
    NewLine.МетодПоиска = "GETDAILYPLAN";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Gets the task plan for the current users day";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetDailyPlan";
    NewLine.МетодПоиска = "GETDAILYPLAN";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskFieldsStructure";
    NewLine.МетодПоиска = "GETTASKFIELDSSTRUCTURE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Gets a structure with a description of the fields for creating a task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskFieldsStructure";
    NewLine.МетодПоиска = "GETTASKFIELDSSTRUCTURE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Tasks managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTasksFilterStructure";
    NewLine.МетодПоиска = "GETTASKSFILTERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Область     = "Tasks managment";
    NewLine.ОписаниеМетода   = "Return filter structure for GetTasksList";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskCommentsList";
    NewLine.МетодПоиска = "GETTASKCOMMENTSLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Get user comments list for a task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskCommentsList";
    NewLine.МетодПоиска = "GETTASKCOMMENTSLIST";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskCommentsList";
    NewLine.МетодПоиска = "GETTASKCOMMENTSLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskComment";
    NewLine.МетодПоиска = "GETTASKCOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Gets task comment data by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskComment";
    NewLine.МетодПоиска = "GETTASKCOMMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskComment";
    NewLine.МетодПоиска = "GETTASKCOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "CommentID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskComment";
    NewLine.МетодПоиска = "GETTASKCOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskComment";
    NewLine.МетодПоиска = "ADDTASKCOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Create new comment to the task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskComment";
    NewLine.МетодПоиска = "ADDTASKCOMMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskComment";
    NewLine.МетодПоиска = "ADDTASKCOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskComment";
    NewLine.МетодПоиска = "ADDTASKCOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskComment";
    NewLine.МетодПоиска = "UPDATETASKCOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Changes task comment text";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskComment";
    NewLine.МетодПоиска = "UPDATETASKCOMMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskComment";
    NewLine.МетодПоиска = "UPDATETASKCOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "CommentID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskComment";
    NewLine.МетодПоиска = "UPDATETASKCOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskComment";
    NewLine.МетодПоиска = "UPDATETASKCOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskComment";
    NewLine.МетодПоиска = "DELETETASKCOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Delete task comment by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskComment";
    NewLine.МетодПоиска = "DELETETASKCOMMENT";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskComment";
    NewLine.МетодПоиска = "DELETETASKCOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "ID of comment to remove";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskComment";
    NewLine.МетодПоиска = "DELETETASKCOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetResultsList";
    NewLine.МетодПоиска = "GETRESULTSLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Gets results list for task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetResultsList";
    NewLine.МетодПоиска = "GETRESULTSLIST";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetResultsList";
    NewLine.МетодПоиска = "GETRESULTSLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateResultFromComment";
    NewLine.МетодПоиска = "CREATERESULTFROMCOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Create task result from comment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateResultFromComment";
    NewLine.МетодПоиска = "CREATERESULTFROMCOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "CommentID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateResultFromComment";
    NewLine.МетодПоиска = "CREATERESULTFROMCOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteResultFromComment";
    NewLine.МетодПоиска = "DELETERESULTFROMCOMMENT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Deletes task result, created from a comment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteResultFromComment";
    NewLine.МетодПоиска = "DELETERESULTFROMCOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "CommentID";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteResultFromComment";
    NewLine.МетодПоиска = "DELETERESULTFROMCOMMENT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Comments and results managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetCommentStructure";
    NewLine.МетодПоиска = "GETCOMMENTSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Область     = "Comments and results managment";
    NewLine.ОписаниеМетода   = "Get comment fields structure";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddKanbanStage";
    NewLine.МетодПоиска = "ADDKANBANSTAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Kanban";
    NewLine.ОписаниеМетода   = "Add new stage of kanban or My Plan";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddKanbanStage";
    NewLine.МетодПоиска = "ADDKANBANSTAGE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New stage name";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddKanbanStage";
    NewLine.МетодПоиска = "ADDKANBANSTAGE";
    NewLine.Параметр    = "--color";
    NewLine.Описание    = "HEX of new stage color (optional, def. val. - FFD800)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddKanbanStage";
    NewLine.МетодПоиска = "ADDKANBANSTAGE";
    NewLine.Параметр    = "--prevstage";
    NewLine.Описание    = "ID of the stage after which a new stage should be inserted (at the beginning by default.) (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddKanbanStage";
    NewLine.МетодПоиска = "ADDKANBANSTAGE";
    NewLine.Параметр    = "--entityid";
    NewLine.Описание    = "ID of kanban owner (group or user) (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddKanbanStage";
    NewLine.МетодПоиска = "ADDKANBANSTAGE";
    NewLine.Параметр    = "--admin";
    NewLine.Описание    = "Allows you to add stages without checking permissions (for administrators) (optional, def. val. - False)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddKanbanStage";
    NewLine.МетодПоиска = "ADDKANBANSTAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateKanbansStage";
    NewLine.МетодПоиска = "UPDATEKANBANSSTAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Kanban";
    NewLine.ОписаниеМетода   = "Changes the properties of the existing kanban or My plan stage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateKanbansStage";
    NewLine.МетодПоиска = "UPDATEKANBANSSTAGE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New stages name";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateKanbansStage";
    NewLine.МетодПоиска = "UPDATEKANBANSSTAGE";
    NewLine.Параметр    = "--stage";
    NewLine.Описание    = "Stage ID for change";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateKanbansStage";
    NewLine.МетодПоиска = "UPDATEKANBANSSTAGE";
    NewLine.Параметр    = "--color";
    NewLine.Описание    = "HEX of new stage color (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateKanbansStage";
    NewLine.МетодПоиска = "UPDATEKANBANSSTAGE";
    NewLine.Параметр    = "--prevstage";
    NewLine.Описание    = "Stage ID, after which the selected stage should be inserted (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateKanbansStage";
    NewLine.МетодПоиска = "UPDATEKANBANSSTAGE";
    NewLine.Параметр    = "--admin";
    NewLine.Описание    = "Allows you to add stages without checking permissions (for administrators) (optional, def. val. - False)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateKanbansStage";
    NewLine.МетодПоиска = "UPDATEKANBANSSTAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteKanbanStage";
    NewLine.МетодПоиска = "DELETEKANBANSTAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Kanban";
    NewLine.ОписаниеМетода   = "Removes a kanban (My Plan) stage, provided there are no tasks in it";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteKanbanStage";
    NewLine.МетодПоиска = "DELETEKANBANSTAGE";
    NewLine.Параметр    = "--stage";
    NewLine.Описание    = "ID of stage to dele";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteKanbanStage";
    NewLine.МетодПоиска = "DELETEKANBANSTAGE";
    NewLine.Параметр    = "--admin";
    NewLine.Описание    = "Allows you to add stages without checking permissions (for administrators) (optional, def. val. - False)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteKanbanStage";
    NewLine.МетодПоиска = "DELETEKANBANSTAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetKanbanStages";
    NewLine.МетодПоиска = "GETKANBANSTAGES";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Kanban";
    NewLine.ОписаниеМетода   = "Get kanban (My Plan) stages info";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetKanbanStages";
    NewLine.МетодПоиска = "GETKANBANSTAGES";
    NewLine.Параметр    = "--entityid";
    NewLine.Описание    = "ID of kanban owner (group or user) (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetKanbanStages";
    NewLine.МетодПоиска = "GETKANBANSTAGES";
    NewLine.Параметр    = "--admin";
    NewLine.Описание    = "Allows you to get stages without checking permissions (for administrators) (optional, def. val. - False)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetKanbanStages";
    NewLine.МетодПоиска = "GETKANBANSTAGES";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveTaskToKanbanStage";
    NewLine.МетодПоиска = "MOVETASKTOKANBANSTAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Kanban";
    NewLine.ОписаниеМетода   = "Move task to another kanban stage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveTaskToKanbanStage";
    NewLine.МетодПоиска = "MOVETASKTOKANBANSTAGE";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "ID of task to move";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveTaskToKanbanStage";
    NewLine.МетодПоиска = "MOVETASKTOKANBANSTAGE";
    NewLine.Параметр    = "--stage";
    NewLine.Описание    = "Stage ID";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveTaskToKanbanStage";
    NewLine.МетодПоиска = "MOVETASKTOKANBANSTAGE";
    NewLine.Параметр    = "--before";
    NewLine.Описание    = "ID of the task to put the selected one in front of (if After not filled) (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveTaskToKanbanStage";
    NewLine.МетодПоиска = "MOVETASKTOKANBANSTAGE";
    NewLine.Параметр    = "--after";
    NewLine.Описание    = "ID of the task to be followed by the selected (if Prev not filled) (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveTaskToKanbanStage";
    NewLine.МетодПоиска = "MOVETASKTOKANBANSTAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskTimeAccounting";
    NewLine.МетодПоиска = "ADDTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Timekeeping";
    NewLine.ОписаниеМетода   = "Adds information about the user's time spent to the task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskTimeAccounting";
    NewLine.МетодПоиска = "ADDTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "ID of task for time accounting";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskTimeAccounting";
    NewLine.МетодПоиска = "ADDTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--amount";
    NewLine.Описание    = "Time spent in seconds";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskTimeAccounting";
    NewLine.МетодПоиска = "ADDTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "ID of user for time accounting (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskTimeAccounting";
    NewLine.МетодПоиска = "ADDTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskTimeAccounting";
    NewLine.МетодПоиска = "ADDTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--date";
    NewLine.Описание    = "Date the record was set (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddTaskTimeAccounting";
    NewLine.МетодПоиска = "ADDTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskTimeAccounting";
    NewLine.МетодПоиска = "DELETETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Timekeeping";
    NewLine.ОписаниеМетода   = "Deletes record of time accounting";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskTimeAccounting";
    NewLine.МетодПоиска = "DELETETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "ID of task for time accounting";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskTimeAccounting";
    NewLine.МетодПоиска = "DELETETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Time record ID";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteTaskTimeAccounting";
    NewLine.МетодПоиска = "DELETETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskTimeAccountingList";
    NewLine.МетодПоиска = "GETTASKTIMEACCOUNTINGLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Timekeeping";
    NewLine.ОписаниеМетода   = "Get list of time accounting records for task";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskTimeAccountingList";
    NewLine.МетодПоиска = "GETTASKTIMEACCOUNTINGLIST";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskTimeAccountingList";
    NewLine.МетодПоиска = "GETTASKTIMEACCOUNTINGLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskTimeAccounting";
    NewLine.МетодПоиска = "GETTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Timekeeping";
    NewLine.ОписаниеМетода   = "Get time accounting record data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskTimeAccounting";
    NewLine.МетодПоиска = "GETTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskTimeAccounting";
    NewLine.МетодПоиска = "GETTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Time record ID";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetTaskTimeAccounting";
    NewLine.МетодПоиска = "GETTASKTIMEACCOUNTING";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskTimeAccounting";
    NewLine.МетодПоиска = "UPDATETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Timekeeping";
    NewLine.ОписаниеМетода   = "Update time accounting record data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskTimeAccounting";
    NewLine.МетодПоиска = "UPDATETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--task";
    NewLine.Описание    = "Task ID";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskTimeAccounting";
    NewLine.МетодПоиска = "UPDATETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--record";
    NewLine.Описание    = "Time record ID";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskTimeAccounting";
    NewLine.МетодПоиска = "UPDATETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--amount";
    NewLine.Описание    = "Time spent in seconds";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskTimeAccounting";
    NewLine.МетодПоиска = "UPDATETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskTimeAccounting";
    NewLine.МетодПоиска = "UPDATETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--date";
    NewLine.Описание    = "Date the record was set (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UpdateTaskTimeAccounting";
    NewLine.МетодПоиска = "UPDATETASKTIMEACCOUNTING";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStoragesList";
    NewLine.МетодПоиска = "GETSTORAGESLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get list of available files storages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStoragesList";
    NewLine.МетодПоиска = "GETSTORAGESLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetAppSotrage";
    NewLine.МетодПоиска = "GETAPPSOTRAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get information about storage with which the application can work to store its data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetAppSotrage";
    NewLine.МетодПоиска = "GETAPPSOTRAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorage";
    NewLine.МетодПоиска = "GETSTORAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get information about storage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorage";
    NewLine.МетодПоиска = "GETSTORAGE";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage ID";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorage";
    NewLine.МетодПоиска = "GETSTORAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameStorage";
    NewLine.МетодПоиска = "RENAMESTORAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Change storage name (for app storage only, see. GetAppStorage)";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameStorage";
    NewLine.МетодПоиска = "RENAMESTORAGE";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage ID";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameStorage";
    NewLine.МетодПоиска = "RENAMESTORAGE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New storage name";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameStorage";
    NewLine.МетодПоиска = "RENAMESTORAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorageObjects";
    NewLine.МетодПоиска = "GETSTORAGEOBJECTS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get a list of files and folders, located at the root of the storage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorageObjects";
    NewLine.МетодПоиска = "GETSTORAGEOBJECTS";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage ID";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetStorageObjects";
    NewLine.МетодПоиска = "GETSTORAGEOBJECTS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Upload file to storage root";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "File name with extension";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File for upload";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage id";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--rights";
    NewLine.Описание    = "Rights array if required (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToStorage";
    NewLine.МетодПоиска = "UPLOADFILETOSTORAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Create new foldera at the storage";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--storageid";
    NewLine.Описание    = "Storage ID";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Folder name";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateStorageFolder";
    NewLine.МетодПоиска = "CREATESTORAGEFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderInformation";
    NewLine.МетодПоиска = "GETFOLDERINFORMATION";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get folder information";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderInformation";
    NewLine.МетодПоиска = "GETFOLDERINFORMATION";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderInformation";
    NewLine.МетодПоиска = "GETFOLDERINFORMATION";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateSubfolder";
    NewLine.МетодПоиска = "CREATESUBFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Create new folder inside another folder";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateSubfolder";
    NewLine.МетодПоиска = "CREATESUBFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Parent folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateSubfolder";
    NewLine.МетодПоиска = "CREATESUBFOLDER";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Name of new folder";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateSubfolder";
    NewLine.МетодПоиска = "CREATESUBFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeFolderCopy";
    NewLine.МетодПоиска = "MAKEFOLDERCOPY";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Copy one folder to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeFolderCopy";
    NewLine.МетодПоиска = "MAKEFOLDERCOPY";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeFolderCopy";
    NewLine.МетодПоиска = "MAKEFOLDERCOPY";
    NewLine.Параметр    = "--tagetid";
    NewLine.Описание    = "ID of target folder";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeFolderCopy";
    NewLine.МетодПоиска = "MAKEFOLDERCOPY";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFolder";
    NewLine.МетодПоиска = "MOVEFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Moves one folder inside another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFolder";
    NewLine.МетодПоиска = "MOVEFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFolder";
    NewLine.МетодПоиска = "MOVEFOLDER";
    NewLine.Параметр    = "--tagetid";
    NewLine.Описание    = "ID of target folder";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFolder";
    NewLine.МетодПоиска = "MOVEFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Delete file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "ID of removing file";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFolder";
    NewLine.МетодПоиска = "DELETEFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Remove folder with subfolders";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFolder";
    NewLine.МетодПоиска = "DELETEFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "ID of folder to be deleted";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteFolder";
    NewLine.МетодПоиска = "DELETEFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderExternalLink";
    NewLine.МетодПоиска = "GETFOLDEREXTERNALLINK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get external link to folder";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderExternalLink";
    NewLine.МетодПоиска = "GETFOLDEREXTERNALLINK";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderExternalLink";
    NewLine.МетодПоиска = "GETFOLDEREXTERNALLINK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderItems";
    NewLine.МетодПоиска = "GETFOLDERITEMS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get folder child elements";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderItems";
    NewLine.МетодПоиска = "GETFOLDERITEMS";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderItems";
    NewLine.МетодПоиска = "GETFOLDERITEMS";
    NewLine.Параметр    = "--Items filter (see GetFolderFilterStructure)";
    NewLine.Описание    = "filter (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderItems";
    NewLine.МетодПоиска = "GETFOLDERITEMS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkFolderAsDeleted";
    NewLine.МетодПоиска = "MARKFOLDERASDELETED";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Move folder to recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkFolderAsDeleted";
    NewLine.МетодПоиска = "MARKFOLDERASDELETED";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkFolderAsDeleted";
    NewLine.МетодПоиска = "MARKFOLDERASDELETED";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RestoreFolder";
    NewLine.МетодПоиска = "RESTOREFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Resotre folder form recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RestoreFolder";
    NewLine.МетодПоиска = "RESTOREFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RestoreFolder";
    NewLine.МетодПоиска = "RESTOREFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFolder";
    NewLine.МетодПоиска = "RENAMEFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Change folder name";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFolder";
    NewLine.МетодПоиска = "RENAMEFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFolder";
    NewLine.МетодПоиска = "RENAMEFOLDER";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New folders name";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFolder";
    NewLine.МетодПоиска = "RENAMEFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToFolder";
    NewLine.МетодПоиска = "UPLOADFILETOFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Upload local file to the folder";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToFolder";
    NewLine.МетодПоиска = "UPLOADFILETOFOLDER";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "File name with extension";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToFolder";
    NewLine.МетодПоиска = "UPLOADFILETOFOLDER";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File for upload";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToFolder";
    NewLine.МетодПоиска = "UPLOADFILETOFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "Folder identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "UploadFileToFolder";
    NewLine.МетодПоиска = "UPLOADFILETOFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileInformation";
    NewLine.МетодПоиска = "GETFILEINFORMATION";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get information about file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileInformation";
    NewLine.МетодПоиска = "GETFILEINFORMATION";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileInformation";
    NewLine.МетодПоиска = "GETFILEINFORMATION";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileExternalLink";
    NewLine.МетодПоиска = "GETFILEEXTERNALLINK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Get external link to file";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileExternalLink";
    NewLine.МетодПоиска = "GETFILEEXTERNALLINK";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileExternalLink";
    NewLine.МетодПоиска = "GETFILEEXTERNALLINK";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkFileAsDeleted";
    NewLine.МетодПоиска = "MARKFILEASDELETED";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Move file to recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkFileAsDeleted";
    NewLine.МетодПоиска = "MARKFILEASDELETED";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkFileAsDeleted";
    NewLine.МетодПоиска = "MARKFILEASDELETED";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RestoreFile";
    NewLine.МетодПоиска = "RESTOREFILE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Restore file from recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RestoreFile";
    NewLine.МетодПоиска = "RESTOREFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RestoreFile";
    NewLine.МетодПоиска = "RESTOREFILE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeCopyFile";
    NewLine.МетодПоиска = "MAKECOPYFILE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Copy file from one destination to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeCopyFile";
    NewLine.МетодПоиска = "MAKECOPYFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "Original file ID";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeCopyFile";
    NewLine.МетодПоиска = "MAKECOPYFILE";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "ID of copy destination folder";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MakeCopyFile";
    NewLine.МетодПоиска = "MAKECOPYFILE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFileToFolder";
    NewLine.МетодПоиска = "MOVEFILETOFOLDER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Move file from one destination to another";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFileToFolder";
    NewLine.МетодПоиска = "MOVEFILETOFOLDER";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File ID";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFileToFolder";
    NewLine.МетодПоиска = "MOVEFILETOFOLDER";
    NewLine.Параметр    = "--folderid";
    NewLine.Описание    = "ID of new destination folder";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MoveFileToFolder";
    NewLine.МетодПоиска = "MOVEFILETOFOLDER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFile";
    NewLine.МетодПоиска = "RENAMEFILE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Changes the name of an existing file";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFile";
    NewLine.МетодПоиска = "RENAMEFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFile";
    NewLine.МетодПоиска = "RENAMEFILE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New folders name";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "RenameFile";
    NewLine.МетодПоиска = "RENAMEFILE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderFilterStructure";
    NewLine.МетодПоиска = "GETFOLDERFILTERSTRUCTURE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Storages and files managment";
    NewLine.ОписаниеМетода   = "Returns filter structure for child folder items";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderFilterStructure";
    NewLine.МетодПоиска = "GETFOLDERFILTERSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty values, False > field types at values (optional, def. val. - False)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFolderFilterStructure";
    NewLine.МетодПоиска = "GETFOLDERFILTERSTRUCTURE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Storages and files managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateChat";
    NewLine.МетодПоиска = "CREATECHAT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Creates a new chat based on the field structure";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateChat";
    NewLine.МетодПоиска = "CREATECHAT";
    NewLine.Параметр    = "--Chat fields structure. See GetChatStructure";
    NewLine.Описание    = "fields";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "CreateChat";
    NewLine.МетодПоиска = "CREATECHAT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatUsers";
    NewLine.МетодПоиска = "GETCHATUSERS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Gets the list of chat users by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatUsers";
    NewLine.МетодПоиска = "GETCHATUSERS";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatUsers";
    NewLine.МетодПоиска = "GETCHATUSERS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "LeaveChat";
    NewLine.МетодПоиска = "LEAVECHAT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Removes the current user from the chat room";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "LeaveChat";
    NewLine.МетодПоиска = "LEAVECHAT";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "LeaveChat";
    NewLine.МетодПоиска = "LEAVECHAT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddUsersToChat";
    NewLine.МетодПоиска = "ADDUSERSTOCHAT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Adds users to the chat by ID array";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddUsersToChat";
    NewLine.МетодПоиска = "ADDUSERSTOCHAT";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddUsersToChat";
    NewLine.МетодПоиска = "ADDUSERSTOCHAT";
    NewLine.Параметр    = "--users";
    NewLine.Описание    = "New members IDs";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddUsersToChat";
    NewLine.МетодПоиска = "ADDUSERSTOCHAT";
    NewLine.Параметр    = "--hide";
    NewLine.Описание    = "Hide old messages from new members (optional, def. val. - False)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "AddUsersToChat";
    NewLine.МетодПоиска = "ADDUSERSTOCHAT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteUserFromChat";
    NewLine.МетодПоиска = "DELETEUSERFROMCHAT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Deletes user from chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteUserFromChat";
    NewLine.МетодПоиска = "DELETEUSERFROMCHAT";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteUserFromChat";
    NewLine.МетодПоиска = "DELETEUSERFROMCHAT";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteUserFromChat";
    NewLine.МетодПоиска = "DELETEUSERFROMCHAT";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatTitle";
    NewLine.МетодПоиска = "CHANGECHATTITLE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Change text of chat title";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatTitle";
    NewLine.МетодПоиска = "CHANGECHATTITLE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatTitle";
    NewLine.МетодПоиска = "CHANGECHATTITLE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New title";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatTitle";
    NewLine.МетодПоиска = "CHANGECHATTITLE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatColor";
    NewLine.МетодПоиска = "CHANGECHATCOLOR";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Chat chat color for mobile app";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatColor";
    NewLine.МетодПоиска = "CHANGECHATCOLOR";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatColor";
    NewLine.МетодПоиска = "CHANGECHATCOLOR";
    NewLine.Параметр    = "--color";
    NewLine.Описание    = "New chat color";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatColor";
    NewLine.МетодПоиска = "CHANGECHATCOLOR";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatPicture";
    NewLine.МетодПоиска = "CHANGECHATPICTURE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Setup new chat picture";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatPicture";
    NewLine.МетодПоиска = "CHANGECHATPICTURE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatPicture";
    NewLine.МетодПоиска = "CHANGECHATPICTURE";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Picture data";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatPicture";
    NewLine.МетодПоиска = "CHANGECHATPICTURE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatOwner";
    NewLine.МетодПоиска = "CHANGECHATOWNER";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Change chat owner";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatOwner";
    NewLine.МетодПоиска = "CHANGECHATOWNER";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatOwner";
    NewLine.МетодПоиска = "CHANGECHATOWNER";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ChangeChatOwner";
    NewLine.МетодПоиска = "CHANGECHATOWNER";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisableChatNotifications";
    NewLine.МетодПоиска = "DISABLECHATNOTIFICATIONS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Disable chat notifications";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisableChatNotifications";
    NewLine.МетодПоиска = "DISABLECHATNOTIFICATIONS";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DisableChatNotifications";
    NewLine.МетодПоиска = "DISABLECHATNOTIFICATIONS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EnableChatNotifications";
    NewLine.МетодПоиска = "ENABLECHATNOTIFICATIONS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Enable chat notifications";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EnableChatNotifications";
    NewLine.МетодПоиска = "ENABLECHATNOTIFICATIONS";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EnableChatNotifications";
    NewLine.МетодПоиска = "ENABLECHATNOTIFICATIONS";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMessagesList";
    NewLine.МетодПоиска = "GETCHATMESSAGESLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Gets a list of 20 chat or dialog messages, depending on the FirstID and LastID specified";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMessagesList";
    NewLine.МетодПоиска = "GETCHATMESSAGESLIST";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMessagesList";
    NewLine.МетодПоиска = "GETCHATMESSAGESLIST";
    NewLine.Параметр    = "--last";
    NewLine.Описание    = "Id of last message (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMessagesList";
    NewLine.МетодПоиска = "GETCHATMESSAGESLIST";
    NewLine.Параметр    = "--first";
    NewLine.Описание    = "ID of first message (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMessagesList";
    NewLine.МетодПоиска = "GETCHATMESSAGESLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsReaded";
    NewLine.МетодПоиска = "MARKMESSAGEASREADED";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Mark current and all previous messages as readed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsReaded";
    NewLine.МетодПоиска = "MARKMESSAGEASREADED";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsReaded";
    NewLine.МетодПоиска = "MARKMESSAGEASREADED";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Id of last readed message";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsReaded";
    NewLine.МетодПоиска = "MARKMESSAGEASREADED";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsUnreaded";
    NewLine.МетодПоиска = "MARKMESSAGEASUNREADED";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Mark current and all messages after as unreaded";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsUnreaded";
    NewLine.МетодПоиска = "MARKMESSAGEASUNREADED";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsUnreaded";
    NewLine.МетодПоиска = "MARKMESSAGEASUNREADED";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "ID of last unreaded message";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "MarkMessageAsUnreaded";
    NewLine.МетодПоиска = "MARKMESSAGEASUNREADED";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetDialog";
    NewLine.МетодПоиска = "GETDIALOG";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Get chat data by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetDialog";
    NewLine.МетодПоиска = "GETDIALOG";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetDialog";
    NewLine.МетодПоиска = "GETDIALOG";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMembersList";
    NewLine.МетодПоиска = "GETCHATMEMBERSLIST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Get chat members list";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMembersList";
    NewLine.МетодПоиска = "GETCHATMEMBERSLIST";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatMembersList";
    NewLine.МетодПоиска = "GETCHATMEMBERSLIST";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendWritingNotification";
    NewLine.МетодПоиска = "SENDWRITINGNOTIFICATION";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Send "Writing..." status to dialog..."";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendWritingNotification";
    NewLine.МетодПоиска = "SENDWRITINGNOTIFICATION";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendWritingNotification";
    NewLine.МетодПоиска = "SENDWRITINGNOTIFICATION";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ReadAll";
    NewLine.МетодПоиска = "READALL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Mark all message as readed";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "ReadAll";
    NewLine.МетодПоиска = "READALL";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Send message to dialog";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--blocks";
    NewLine.Описание    = "Array of attachments (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Edit dialog message content";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "ID of the message to be edited";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "New message text (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--blocks";
    NewLine.Описание    = "New blocks array (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SetMessageReaction";
    NewLine.МетодПоиска = "SETMESSAGEREACTION";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Set or remove reaction mark on the message";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SetMessageReaction";
    NewLine.МетодПоиска = "SETMESSAGEREACTION";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Message ID";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "SetMessageReaction";
    NewLine.МетодПоиска = "SETMESSAGEREACTION";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Deletes a dialog message";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "ID of the message to be deleted";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--webhook method used";
    NewLine.Описание    = "token (optional, def. val. - Empty value)";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetChatStructure";
    NewLine.МетодПоиска = "GETCHATSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty values, False > field types at values (optional, def. val. - False)";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Get chat fields structure";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPictureBlock";
    NewLine.МетодПоиска = "GETPICTUREBLOCK";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Picture name";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Make picture block for SendMessage method";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetPictureBlock";
    NewLine.МетодПоиска = "GETPICTUREBLOCK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL of sending picture";
    NewLine.Область     = "Chats and messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileBlock";
    NewLine.МетодПоиска = "GETFILEBLOCK";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Picture name";
    NewLine.Область     = "Chats and messages";
    NewLine.ОписаниеМетода   = "Make file block for SendMessage method";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "bitrix24";
    NewLine.Модуль      = "OPI_Bitrix24";
    NewLine.Метод       = "GetFileBlock";
    NewLine.МетодПоиска = "GETFILEBLOCK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "File URL";
    NewLine.Область     = "Chats and messages";

    Return CompositionTable;
EndFunction

