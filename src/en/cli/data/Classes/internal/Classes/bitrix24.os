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
    NewLine.Описание    = "Data inложенandй, где toлюч > andмя file, value > path to file andдand дinоandчные Data (optional, def. val. - Empty)";
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
    NewLine.Описание    = "Data inложенandй, где toлюч > andмя file, value > path to file andдand дinоandчные Data (optional, def. val. - Empty)";
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

    Return CompositionTable;
EndFunction

