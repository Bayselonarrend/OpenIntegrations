
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
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetAppAuthLink";
    NewLine.SearchMethod  = "GETAPPAUTHLINK";
    NewLine.Parameter     = "--domain";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Current Bitrix URL (like 'portal.bitrix24.com')";
    NewLine.Region      = "Settings and administartion";
    NewLine.MethodDescription   = "Forms a link for authorization via the browser";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetAppAuthLink";
    NewLine.SearchMethod  = "GETAPPAUTHLINK";
    NewLine.Parameter     = "--clientid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Client ID from app settings";
    NewLine.Region      = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--clientid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Client ID from app settings";
    NewLine.Region      = "Settings and administartion";
    NewLine.MethodDescription   = "Get token by auth code";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--clientsecret";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Client secret from app settings";
    NewLine.Region      = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--code";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Code from browser auth page";
    NewLine.Region      = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--clientid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Client ID from app settings";
    NewLine.Region      = "Settings and administartion";
    NewLine.MethodDescription   = "Update token by refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--clientsecret";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Client secret from app settings";
    NewLine.Region      = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--refresh";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Refresh token";
    NewLine.Region      = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ServerTime";
    NewLine.SearchMethod  = "SERVERTIME";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Settings and administartion";
    NewLine.MethodDescription   = "Get current server time";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ServerTime";
    NewLine.SearchMethod  = "SERVERTIME";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Settings and administartion";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Feed posts management";
    NewLine.MethodDescription   = "Create a new post at news feed";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Text of post";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--vision";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group (optional, def. val.. - UA)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--files";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Key > file name, value > path or binary data (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Post title (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--important";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Mark post as important (optional, def. val.. - False)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdatePost";
    NewLine.SearchMethod  = "UPDATEPOST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Feed posts management";
    NewLine.MethodDescription   = "Change post data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdatePost";
    NewLine.SearchMethod  = "UPDATEPOST";
    NewLine.Parameter     = "--postid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Post ID";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdatePost";
    NewLine.SearchMethod  = "UPDATEPOST";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Text of post";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdatePost";
    NewLine.SearchMethod  = "UPDATEPOST";
    NewLine.Parameter     = "--vision";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group (optional, def. val.. - UA)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdatePost";
    NewLine.SearchMethod  = "UPDATEPOST";
    NewLine.Parameter     = "--files";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Key > file name, value > path or binary data (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdatePost";
    NewLine.SearchMethod  = "UPDATEPOST";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Post title (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdatePost";
    NewLine.SearchMethod  = "UPDATEPOST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeletePost";
    NewLine.SearchMethod  = "DELETEPOST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Feed posts management";
    NewLine.MethodDescription   = "Remove post from a news feed";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeletePost";
    NewLine.SearchMethod  = "DELETEPOST";
    NewLine.Parameter     = "--postid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Id of post to remove";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeletePost";
    NewLine.SearchMethod  = "DELETEPOST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetImportantPostViewers";
    NewLine.SearchMethod  = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Feed posts management";
    NewLine.MethodDescription   = "Return list of important post viewers ids";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetImportantPostViewers";
    NewLine.SearchMethod  = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Parameter     = "--postid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Id of important post";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetImportantPostViewers";
    NewLine.SearchMethod  = "GETIMPORTANTPOSTVIEWERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetPosts";
    NewLine.SearchMethod  = "GETPOSTS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Feed posts management";
    NewLine.MethodDescription   = "Gen post or array of post with ID or rights selection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetPosts";
    NewLine.SearchMethod  = "GETPOSTS";
    NewLine.Parameter     = "--postid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Id of important post (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetPosts";
    NewLine.SearchMethod  = "GETPOSTS";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Post selection by rights: UA all, SGn work group, Un user, DRn depart, Gn group (optional, def. val.. - UA)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetPosts";
    NewLine.SearchMethod  = "GETPOSTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostComment";
    NewLine.SearchMethod  = "ADDPOSTCOMMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Feed posts management";
    NewLine.MethodDescription   = "Adds a comment to the post";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostComment";
    NewLine.SearchMethod  = "ADDPOSTCOMMENT";
    NewLine.Parameter     = "--postid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Post ID";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostComment";
    NewLine.SearchMethod  = "ADDPOSTCOMMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Comment text";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostComment";
    NewLine.SearchMethod  = "ADDPOSTCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostRecipients";
    NewLine.SearchMethod  = "ADDPOSTRECIPIENTS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Feed posts management";
    NewLine.MethodDescription   = "Adds new groups or users to the recipients";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostRecipients";
    NewLine.SearchMethod  = "ADDPOSTRECIPIENTS";
    NewLine.Parameter     = "--postid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Post ID";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostRecipients";
    NewLine.SearchMethod  = "ADDPOSTRECIPIENTS";
    NewLine.Parameter     = "--vision";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Array or 1 recipient: UA all, SGn w. group, Un user, DRn department, Gn group";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddPostRecipients";
    NewLine.SearchMethod  = "ADDPOSTRECIPIENTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Feed posts management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTask";
    NewLine.SearchMethod  = "GETTASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Get task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTask";
    NewLine.SearchMethod  = "GETTASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTask";
    NewLine.SearchMethod  = "GETTASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksList";
    NewLine.SearchMethod  = "GETTASKSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Get tasks list (50 at one response max) with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksList";
    NewLine.SearchMethod  = "GETTASKSLIST";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Lead filter structure. See GetLeadFilterStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksList";
    NewLine.SearchMethod  = "GETTASKSLIST";
    NewLine.Parameter     = "--offset";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Offset of tasks list (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksList";
    NewLine.SearchMethod  = "GETTASKSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksList";
    NewLine.SearchMethod  = "GETTASKSLIST";
    NewLine.Parameter     = "--select";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "A list of task fields in the response. All non calculable by default (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTask";
    NewLine.SearchMethod  = "CREATETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Create new task by fields structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTask";
    NewLine.SearchMethod  = "CREATETASK";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Task fields structure. See GetTaskFieldsStructure";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTask";
    NewLine.SearchMethod  = "CREATETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTask";
    NewLine.SearchMethod  = "UPDATETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Update a task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTask";
    NewLine.SearchMethod  = "UPDATETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTask";
    NewLine.SearchMethod  = "UPDATETASK";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Task fields structure";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTask";
    NewLine.SearchMethod  = "UPDATETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTask";
    NewLine.SearchMethod  = "DELETETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Delete task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTask";
    NewLine.SearchMethod  = "DELETETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTask";
    NewLine.SearchMethod  = "DELETETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AttachFileToTopic";
    NewLine.SearchMethod  = "ATTACHFILETOTOPIC";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Attaches a file to the selected task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AttachFileToTopic";
    NewLine.SearchMethod  = "ATTACHFILETOTOPIC";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AttachFileToTopic";
    NewLine.SearchMethod  = "ATTACHFILETOTOPIC";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AttachFileToTopic";
    NewLine.SearchMethod  = "ATTACHFILETOTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ApproveTask";
    NewLine.SearchMethod  = "APPROVETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Approve task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ApproveTask";
    NewLine.SearchMethod  = "APPROVETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ApproveTask";
    NewLine.SearchMethod  = "APPROVETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DisapproveTask";
    NewLine.SearchMethod  = "DISAPPROVETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Disapprove task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DisapproveTask";
    NewLine.SearchMethod  = "DISAPPROVETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DisapproveTask";
    NewLine.SearchMethod  = "DISAPPROVETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CompleteTask";
    NewLine.SearchMethod  = "COMPLETETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Complete task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CompleteTask";
    NewLine.SearchMethod  = "COMPLETETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CompleteTask";
    NewLine.SearchMethod  = "COMPLETETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenewTask";
    NewLine.SearchMethod  = "RENEWTASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Returns a task to work by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenewTask";
    NewLine.SearchMethod  = "RENEWTASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenewTask";
    NewLine.SearchMethod  = "RENEWTASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeferTask";
    NewLine.SearchMethod  = "DEFERTASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Defer task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeferTask";
    NewLine.SearchMethod  = "DEFERTASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeferTask";
    NewLine.SearchMethod  = "DEFERTASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "PauseTask";
    NewLine.SearchMethod  = "PAUSETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Pause a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "PauseTask";
    NewLine.SearchMethod  = "PAUSETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "PauseTask";
    NewLine.SearchMethod  = "PAUSETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTask";
    NewLine.SearchMethod  = "STARTTASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Start a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTask";
    NewLine.SearchMethod  = "STARTTASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTask";
    NewLine.SearchMethod  = "STARTTASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartWatchingTask";
    NewLine.SearchMethod  = "STARTWATCHINGTASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Start watching a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartWatchingTask";
    NewLine.SearchMethod  = "STARTWATCHINGTASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartWatchingTask";
    NewLine.SearchMethod  = "STARTWATCHINGTASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopWatchingTask";
    NewLine.SearchMethod  = "STOPWATCHINGTASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Stop watching a task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopWatchingTask";
    NewLine.SearchMethod  = "STOPWATCHINGTASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopWatchingTask";
    NewLine.SearchMethod  = "STOPWATCHINGTASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DelegateTask";
    NewLine.SearchMethod  = "DELEGATETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Delegate task to another user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DelegateTask";
    NewLine.SearchMethod  = "DELEGATETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DelegateTask";
    NewLine.SearchMethod  = "DELEGATETASK";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "ID of responsible user";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DelegateTask";
    NewLine.SearchMethod  = "DELEGATETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskToFavorites";
    NewLine.SearchMethod  = "ADDTASKTOFAVORITES";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Add task to favorites list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskToFavorites";
    NewLine.SearchMethod  = "ADDTASKTOFAVORITES";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskToFavorites";
    NewLine.SearchMethod  = "ADDTASKTOFAVORITES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RemoveTaskFromFavorites";
    NewLine.SearchMethod  = "REMOVETASKFROMFAVORITES";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Delete task from favorites list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RemoveTaskFromFavorites";
    NewLine.SearchMethod  = "REMOVETASKFROMFAVORITES";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RemoveTaskFromFavorites";
    NewLine.SearchMethod  = "REMOVETASKFROMFAVORITES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskHistory";
    NewLine.SearchMethod  = "GETTASKHISTORY";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Get history of task changing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskHistory";
    NewLine.SearchMethod  = "GETTASKHISTORY";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskHistory";
    NewLine.SearchMethod  = "GETTASKHISTORY";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CheckTaskAccesses";
    NewLine.SearchMethod  = "CHECKTASKACCESSES";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Checks the availability of the task for users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CheckTaskAccesses";
    NewLine.SearchMethod  = "CHECKTASKACCESSES";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CheckTaskAccesses";
    NewLine.SearchMethod  = "CHECKTASKACCESSES";
    NewLine.Parameter     = "--users";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User IDs for access checking (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CheckTaskAccesses";
    NewLine.SearchMethod  = "CHECKTASKACCESSES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MuteTask";
    NewLine.SearchMethod  = "MUTETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Mute task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MuteTask";
    NewLine.SearchMethod  = "MUTETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MuteTask";
    NewLine.SearchMethod  = "MUTETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UnmuteTask";
    NewLine.SearchMethod  = "UNMUTETASK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Unmute task by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UnmuteTask";
    NewLine.SearchMethod  = "UNMUTETASK";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UnmuteTask";
    NewLine.SearchMethod  = "UNMUTETASK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTasksDependencies";
    NewLine.SearchMethod  = "CREATETASKSDEPENDENCIES";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Creates the dependency of one task to another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTasksDependencies";
    NewLine.SearchMethod  = "CREATETASKSDEPENDENCIES";
    NewLine.Parameter     = "--taskfrom";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "From task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTasksDependencies";
    NewLine.SearchMethod  = "CREATETASKSDEPENDENCIES";
    NewLine.Parameter     = "--taskto";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "To task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTasksDependencies";
    NewLine.SearchMethod  = "CREATETASKSDEPENDENCIES";
    NewLine.Parameter     = "--linktype";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateTasksDependencies";
    NewLine.SearchMethod  = "CREATETASKSDEPENDENCIES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksDependencies";
    NewLine.SearchMethod  = "DELETETASKSDEPENDENCIES";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Removes the dependency of one task to another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksDependencies";
    NewLine.SearchMethod  = "DELETETASKSDEPENDENCIES";
    NewLine.Parameter     = "--taskfrom";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "From task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksDependencies";
    NewLine.SearchMethod  = "DELETETASKSDEPENDENCIES";
    NewLine.Parameter     = "--taskto";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "To task ID";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksDependencies";
    NewLine.SearchMethod  = "DELETETASKSDEPENDENCIES";
    NewLine.Parameter     = "--linktype";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Link type: 0 start>start, 1 start>finish, 2 finish>start, 3 finish>finish";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksDependencies";
    NewLine.SearchMethod  = "DELETETASKSDEPENDENCIES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDailyPlan";
    NewLine.SearchMethod  = "GETDAILYPLAN";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Gets the task plan for the current users day";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDailyPlan";
    NewLine.SearchMethod  = "GETDAILYPLAN";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskFieldsStructure";
    NewLine.SearchMethod  = "GETTASKFIELDSSTRUCTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Gets a structure with a description of the fields for creating a task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskFieldsStructure";
    NewLine.SearchMethod  = "GETTASKFIELDSSTRUCTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksFilterStructure";
    NewLine.SearchMethod  = "GETTASKSFILTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Tasks management";
    NewLine.MethodDescription   = "Return filter structure for GetTasksList";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksFilterStructure";
    NewLine.SearchMethod  = "GETTASKSFILTERSTRUCTURE";
    NewLine.Parameter     = "--map";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "True > returns the filter fields as a map (optional, def. val.. - False)";
    NewLine.Region      = "Tasks management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCustomTaskFieldsList";
    NewLine.SearchMethod  = "GETCUSTOMTASKFIELDSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Customs tasks fields management";
    NewLine.MethodDescription   = "Gets list of custom task fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCustomTaskFieldsList";
    NewLine.SearchMethod  = "GETCUSTOMTASKFIELDSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddCustomTaskField";
    NewLine.SearchMethod  = "ADDCUSTOMTASKFIELD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Customs tasks fields management";
    NewLine.MethodDescription   = "Adds a new custom field to be added to the task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddCustomTaskField";
    NewLine.SearchMethod  = "ADDCUSTOMTASKFIELD";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field type: string, double, date, boolean";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddCustomTaskField";
    NewLine.SearchMethod  = "ADDCUSTOMTASKFIELD";
    NewLine.Parameter     = "--fieldname";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Text identifier (name) of the field";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddCustomTaskField";
    NewLine.SearchMethod  = "ADDCUSTOMTASKFIELD";
    NewLine.Parameter     = "--externalid";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Text identifier for external integration (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddCustomTaskField";
    NewLine.SearchMethod  = "ADDCUSTOMTASKFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Field title (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddCustomTaskField";
    NewLine.SearchMethod  = "ADDCUSTOMTASKFIELD";
    NewLine.Parameter     = "--label";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Form label. Key: en or ru, Value: Lable text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddCustomTaskField";
    NewLine.SearchMethod  = "ADDCUSTOMTASKFIELD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCustomTaskField";
    NewLine.SearchMethod  = "UPDATECUSTOMTASKFIELD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Customs tasks fields management";
    NewLine.MethodDescription   = "Updates a custom task field data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCustomTaskField";
    NewLine.SearchMethod  = "UPDATECUSTOMTASKFIELD";
    NewLine.Parameter     = "--fieldid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Field ID for updating";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCustomTaskField";
    NewLine.SearchMethod  = "UPDATECUSTOMTASKFIELD";
    NewLine.Parameter     = "--externalid";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Text identifier for external integration (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCustomTaskField";
    NewLine.SearchMethod  = "UPDATECUSTOMTASKFIELD";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Field title (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCustomTaskField";
    NewLine.SearchMethod  = "UPDATECUSTOMTASKFIELD";
    NewLine.Parameter     = "--label";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Form label. Key: en or ru, Value: Lable text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCustomTaskField";
    NewLine.SearchMethod  = "UPDATECUSTOMTASKFIELD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCustomTaskField";
    NewLine.SearchMethod  = "GETCUSTOMTASKFIELD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Customs tasks fields management";
    NewLine.MethodDescription   = "Get custom task field data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCustomTaskField";
    NewLine.SearchMethod  = "GETCUSTOMTASKFIELD";
    NewLine.Parameter     = "--fieldid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Field ID for retrieval";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCustomTaskField";
    NewLine.SearchMethod  = "GETCUSTOMTASKFIELD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCustomTaskField";
    NewLine.SearchMethod  = "DELETECUSTOMTASKFIELD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Customs tasks fields management";
    NewLine.MethodDescription   = "Deletes a custom task field";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCustomTaskField";
    NewLine.SearchMethod  = "DELETECUSTOMTASKFIELD";
    NewLine.Parameter     = "--fieldid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Field ID for deletion";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCustomTaskField";
    NewLine.SearchMethod  = "DELETECUSTOMTASKFIELD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Customs tasks fields management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTasksChecklistElement";
    NewLine.SearchMethod  = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks checklists management";
    NewLine.MethodDescription   = "Adds new element of tasks checklist";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTasksChecklistElement";
    NewLine.SearchMethod  = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTasksChecklistElement";
    NewLine.SearchMethod  = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Text (title) of checklist element";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTasksChecklistElement";
    NewLine.SearchMethod  = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--complete";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Mark as completed (optional, def. val.. - False)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTasksChecklistElement";
    NewLine.SearchMethod  = "ADDTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTasksChecklistElement";
    NewLine.SearchMethod  = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks checklists management";
    NewLine.MethodDescription   = "Updates text of element of tasks checklist";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTasksChecklistElement";
    NewLine.SearchMethod  = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTasksChecklistElement";
    NewLine.SearchMethod  = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--element";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Checklist element ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTasksChecklistElement";
    NewLine.SearchMethod  = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Text (title) of checklist element";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTasksChecklistElement";
    NewLine.SearchMethod  = "UPDATETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksChecklistElement";
    NewLine.SearchMethod  = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks checklists management";
    NewLine.MethodDescription   = "Deletes element from tasks checklist";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksChecklistElement";
    NewLine.SearchMethod  = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksChecklistElement";
    NewLine.SearchMethod  = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--element";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "ID of deleted element";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTasksChecklistElement";
    NewLine.SearchMethod  = "DELETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksChecklist";
    NewLine.SearchMethod  = "GETTASKSCHECKLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks checklists management";
    NewLine.MethodDescription   = "Gets the list of elements on the task checklist";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksChecklist";
    NewLine.SearchMethod  = "GETTASKSCHECKLIST";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksChecklist";
    NewLine.SearchMethod  = "GETTASKSCHECKLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksChecklistElement";
    NewLine.SearchMethod  = "GETTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks checklists management";
    NewLine.MethodDescription   = "Gets tasks checklist element by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksChecklistElement";
    NewLine.SearchMethod  = "GETTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksChecklistElement";
    NewLine.SearchMethod  = "GETTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--element";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Element ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTasksChecklistElement";
    NewLine.SearchMethod  = "GETTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CompleteTasksChecklistElement";
    NewLine.SearchMethod  = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks checklists management";
    NewLine.MethodDescription   = "Mark an element as completed";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CompleteTasksChecklistElement";
    NewLine.SearchMethod  = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CompleteTasksChecklistElement";
    NewLine.SearchMethod  = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--element";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Element ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CompleteTasksChecklistElement";
    NewLine.SearchMethod  = "COMPLETETASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenewTasksChecklistElement";
    NewLine.SearchMethod  = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Tasks checklists management";
    NewLine.MethodDescription   = "Unmark an element as completed";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenewTasksChecklistElement";
    NewLine.SearchMethod  = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenewTasksChecklistElement";
    NewLine.SearchMethod  = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--element";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Element ID";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenewTasksChecklistElement";
    NewLine.SearchMethod  = "RENEWTASKSCHECKLISTELEMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tasks checklists management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskCommentsList";
    NewLine.SearchMethod  = "GETTASKCOMMENTSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Get user comments list for a task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskCommentsList";
    NewLine.SearchMethod  = "GETTASKCOMMENTSLIST";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskCommentsList";
    NewLine.SearchMethod  = "GETTASKCOMMENTSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskComment";
    NewLine.SearchMethod  = "GETTASKCOMMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Gets task comment data by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskComment";
    NewLine.SearchMethod  = "GETTASKCOMMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskComment";
    NewLine.SearchMethod  = "GETTASKCOMMENT";
    NewLine.Parameter     = "--comment";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "CommentID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskComment";
    NewLine.SearchMethod  = "GETTASKCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskComment";
    NewLine.SearchMethod  = "ADDTASKCOMMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Create new comment to the task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskComment";
    NewLine.SearchMethod  = "ADDTASKCOMMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskComment";
    NewLine.SearchMethod  = "ADDTASKCOMMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Comment text";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskComment";
    NewLine.SearchMethod  = "ADDTASKCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskComment";
    NewLine.SearchMethod  = "UPDATETASKCOMMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Changes task comment text";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskComment";
    NewLine.SearchMethod  = "UPDATETASKCOMMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskComment";
    NewLine.SearchMethod  = "UPDATETASKCOMMENT";
    NewLine.Parameter     = "--comment";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "CommentID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskComment";
    NewLine.SearchMethod  = "UPDATETASKCOMMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Comment text";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskComment";
    NewLine.SearchMethod  = "UPDATETASKCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskComment";
    NewLine.SearchMethod  = "DELETETASKCOMMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Delete task comment by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskComment";
    NewLine.SearchMethod  = "DELETETASKCOMMENT";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskComment";
    NewLine.SearchMethod  = "DELETETASKCOMMENT";
    NewLine.Parameter     = "--comment";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "ID of comment to remove";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskComment";
    NewLine.SearchMethod  = "DELETETASKCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetResultsList";
    NewLine.SearchMethod  = "GETRESULTSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Gets results list for task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetResultsList";
    NewLine.SearchMethod  = "GETRESULTSLIST";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetResultsList";
    NewLine.SearchMethod  = "GETRESULTSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateResultFromComment";
    NewLine.SearchMethod  = "CREATERESULTFROMCOMMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Create task result from comment";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateResultFromComment";
    NewLine.SearchMethod  = "CREATERESULTFROMCOMMENT";
    NewLine.Parameter     = "--comment";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "CommentID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateResultFromComment";
    NewLine.SearchMethod  = "CREATERESULTFROMCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteResultFromComment";
    NewLine.SearchMethod  = "DELETERESULTFROMCOMMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Deletes task result, created from a comment";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteResultFromComment";
    NewLine.SearchMethod  = "DELETERESULTFROMCOMMENT";
    NewLine.Parameter     = "--comment";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "CommentID";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteResultFromComment";
    NewLine.SearchMethod  = "DELETERESULTFROMCOMMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Comments and results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCommentStructure";
    NewLine.SearchMethod  = "GETCOMMENTSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Comments and results management";
    NewLine.MethodDescription   = "Get comment fields structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddKanbanStage";
    NewLine.SearchMethod  = "ADDKANBANSTAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Kanban";
    NewLine.MethodDescription   = "Add new stage of kanban or My Plan";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddKanbanStage";
    NewLine.SearchMethod  = "ADDKANBANSTAGE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New stage name";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddKanbanStage";
    NewLine.SearchMethod  = "ADDKANBANSTAGE";
    NewLine.Parameter     = "--color";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "HEX of new stage color (optional, def. val.. - FFD800)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddKanbanStage";
    NewLine.SearchMethod  = "ADDKANBANSTAGE";
    NewLine.Parameter     = "--prevstage";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "ID of the stage after which a new stage should be inserted (at the beginning by default.) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddKanbanStage";
    NewLine.SearchMethod  = "ADDKANBANSTAGE";
    NewLine.Parameter     = "--entityid";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "ID of kanban owner (group or user) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddKanbanStage";
    NewLine.SearchMethod  = "ADDKANBANSTAGE";
    NewLine.Parameter     = "--admin";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Allows you to add stages without checking permissions (for administrators) (optional, def. val.. - False)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddKanbanStage";
    NewLine.SearchMethod  = "ADDKANBANSTAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateKanbansStage";
    NewLine.SearchMethod  = "UPDATEKANBANSSTAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Kanban";
    NewLine.MethodDescription   = "Changes the properties of the existing kanban or My plan stage";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateKanbansStage";
    NewLine.SearchMethod  = "UPDATEKANBANSSTAGE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New stages name";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateKanbansStage";
    NewLine.SearchMethod  = "UPDATEKANBANSSTAGE";
    NewLine.Parameter     = "--stage";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Stage ID for change";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateKanbansStage";
    NewLine.SearchMethod  = "UPDATEKANBANSSTAGE";
    NewLine.Parameter     = "--color";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "HEX of new stage color (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateKanbansStage";
    NewLine.SearchMethod  = "UPDATEKANBANSSTAGE";
    NewLine.Parameter     = "--prevstage";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Stage ID, after which the selected stage should be inserted (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateKanbansStage";
    NewLine.SearchMethod  = "UPDATEKANBANSSTAGE";
    NewLine.Parameter     = "--admin";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Allows you to add stages without checking permissions (for administrators) (optional, def. val.. - False)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateKanbansStage";
    NewLine.SearchMethod  = "UPDATEKANBANSSTAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteKanbanStage";
    NewLine.SearchMethod  = "DELETEKANBANSTAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Kanban";
    NewLine.MethodDescription   = "Removes a kanban (My Plan) stage, provided there are no tasks in it";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteKanbanStage";
    NewLine.SearchMethod  = "DELETEKANBANSTAGE";
    NewLine.Parameter     = "--stage";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "ID of stage to dele";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteKanbanStage";
    NewLine.SearchMethod  = "DELETEKANBANSTAGE";
    NewLine.Parameter     = "--admin";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Allows you to add stages without checking permissions (for administrators) (optional, def. val.. - False)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteKanbanStage";
    NewLine.SearchMethod  = "DELETEKANBANSTAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetKanbanStages";
    NewLine.SearchMethod  = "GETKANBANSTAGES";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Kanban";
    NewLine.MethodDescription   = "Get kanban (My Plan) stages info";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetKanbanStages";
    NewLine.SearchMethod  = "GETKANBANSTAGES";
    NewLine.Parameter     = "--entityid";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "ID of kanban owner (group or user) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetKanbanStages";
    NewLine.SearchMethod  = "GETKANBANSTAGES";
    NewLine.Parameter     = "--admin";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Allows you to get stages without checking permissions (for administrators) (optional, def. val.. - False)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetKanbanStages";
    NewLine.SearchMethod  = "GETKANBANSTAGES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveTaskToKanbanStage";
    NewLine.SearchMethod  = "MOVETASKTOKANBANSTAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Kanban";
    NewLine.MethodDescription   = "Move task to another kanban stage";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveTaskToKanbanStage";
    NewLine.SearchMethod  = "MOVETASKTOKANBANSTAGE";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "ID of task to move";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveTaskToKanbanStage";
    NewLine.SearchMethod  = "MOVETASKTOKANBANSTAGE";
    NewLine.Parameter     = "--stage";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Stage ID";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveTaskToKanbanStage";
    NewLine.SearchMethod  = "MOVETASKTOKANBANSTAGE";
    NewLine.Parameter     = "--before";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "ID of the task to put the selected one in front of (if After not filled) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveTaskToKanbanStage";
    NewLine.SearchMethod  = "MOVETASKTOKANBANSTAGE";
    NewLine.Parameter     = "--after";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "ID of the task to be followed by the selected (if Prev not filled) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveTaskToKanbanStage";
    NewLine.SearchMethod  = "MOVETASKTOKANBANSTAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Kanban";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskTimeAccounting";
    NewLine.SearchMethod  = "ADDTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Adds information about the user's time spent to the task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskTimeAccounting";
    NewLine.SearchMethod  = "ADDTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "ID of task for time accounting";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskTimeAccounting";
    NewLine.SearchMethod  = "ADDTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--amount";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Time spent in seconds";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskTimeAccounting";
    NewLine.SearchMethod  = "ADDTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "ID of user for time accounting (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskTimeAccounting";
    NewLine.SearchMethod  = "ADDTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Comment text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskTimeAccounting";
    NewLine.SearchMethod  = "ADDTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--date";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Date the record was set (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddTaskTimeAccounting";
    NewLine.SearchMethod  = "ADDTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskTimeAccounting";
    NewLine.SearchMethod  = "DELETETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Deletes record of time accounting";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskTimeAccounting";
    NewLine.SearchMethod  = "DELETETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "ID of task for time accounting";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskTimeAccounting";
    NewLine.SearchMethod  = "DELETETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Time record ID";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteTaskTimeAccounting";
    NewLine.SearchMethod  = "DELETETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskTimeAccountingList";
    NewLine.SearchMethod  = "GETTASKTIMEACCOUNTINGLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Get list of time accounting records for task";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskTimeAccountingList";
    NewLine.SearchMethod  = "GETTASKTIMEACCOUNTINGLIST";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskTimeAccountingList";
    NewLine.SearchMethod  = "GETTASKTIMEACCOUNTINGLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskTimeAccounting";
    NewLine.SearchMethod  = "GETTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Get time accounting record data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskTimeAccounting";
    NewLine.SearchMethod  = "GETTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskTimeAccounting";
    NewLine.SearchMethod  = "GETTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Time record ID";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTaskTimeAccounting";
    NewLine.SearchMethod  = "GETTASKTIMEACCOUNTING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskTimeAccounting";
    NewLine.SearchMethod  = "UPDATETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Update time accounting record data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskTimeAccounting";
    NewLine.SearchMethod  = "UPDATETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--task";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Task ID";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskTimeAccounting";
    NewLine.SearchMethod  = "UPDATETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--record";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Time record ID";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskTimeAccounting";
    NewLine.SearchMethod  = "UPDATETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--amount";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Time spent in seconds";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskTimeAccounting";
    NewLine.SearchMethod  = "UPDATETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Comment text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskTimeAccounting";
    NewLine.SearchMethod  = "UPDATETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--date";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Date the record was set (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateTaskTimeAccounting";
    NewLine.SearchMethod  = "UPDATETASKTIMEACCOUNTING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTimekeeping";
    NewLine.SearchMethod  = "STARTTIMEKEEPING";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Starts user timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTimekeeping";
    NewLine.SearchMethod  = "STARTTIMEKEEPING";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Users ID. Current by default (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTimekeeping";
    NewLine.SearchMethod  = "STARTTIMEKEEPING";
    NewLine.Parameter     = "--time";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Start time. The date must match the current. Current time by default. (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTimekeeping";
    NewLine.SearchMethod  = "STARTTIMEKEEPING";
    NewLine.Parameter     = "--report";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Reason for change. Required when Time is specified and free schedule is disabled (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StartTimekeeping";
    NewLine.SearchMethod  = "STARTTIMEKEEPING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopTimekeeping";
    NewLine.SearchMethod  = "STOPTIMEKEEPING";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Stops user timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopTimekeeping";
    NewLine.SearchMethod  = "STOPTIMEKEEPING";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Users ID. Current by default (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopTimekeeping";
    NewLine.SearchMethod  = "STOPTIMEKEEPING";
    NewLine.Parameter     = "--time";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Stop time. The date must match the current. Current time by default. (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopTimekeeping";
    NewLine.SearchMethod  = "STOPTIMEKEEPING";
    NewLine.Parameter     = "--report";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Reason for change. Required when Time is specified and free schedule is disabled (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "StopTimekeeping";
    NewLine.SearchMethod  = "STOPTIMEKEEPING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "PauseTimekeeping";
    NewLine.SearchMethod  = "PAUSETIMEKEEPING";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Pauses user timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "PauseTimekeeping";
    NewLine.SearchMethod  = "PAUSETIMEKEEPING";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Users ID. Current by default (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "PauseTimekeeping";
    NewLine.SearchMethod  = "PAUSETIMEKEEPING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTimekeepingStatus";
    NewLine.SearchMethod  = "GETTIMEKEEPINGSTATUS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Gets user timekeeping status";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTimekeepingStatus";
    NewLine.SearchMethod  = "GETTIMEKEEPINGSTATUS";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Users ID. Current by default (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTimekeepingStatus";
    NewLine.SearchMethod  = "GETTIMEKEEPINGSTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTimekeepingSettings";
    NewLine.SearchMethod  = "GETTIMEKEEPINGSETTINGS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Timekeeping";
    NewLine.MethodDescription   = "Gets user timekeeping settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTimekeepingSettings";
    NewLine.SearchMethod  = "GETTIMEKEEPINGSETTINGS";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Users ID. Current by default (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetTimekeepingSettings";
    NewLine.SearchMethod  = "GETTIMEKEEPINGSETTINGS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Timekeeping";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStoragesList";
    NewLine.SearchMethod  = "GETSTORAGESLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Storages management";
    NewLine.MethodDescription   = "Get list of available files storages";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStoragesList";
    NewLine.SearchMethod  = "GETSTORAGESLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetAppStorage";
    NewLine.SearchMethod  = "GETAPPSTORAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Storages management";
    NewLine.MethodDescription   = "Get information about storage with which the application can work to store its data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetAppStorage";
    NewLine.SearchMethod  = "GETAPPSTORAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStorage";
    NewLine.SearchMethod  = "GETSTORAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Storages management";
    NewLine.MethodDescription   = "Get information about storage";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStorage";
    NewLine.SearchMethod  = "GETSTORAGE";
    NewLine.Parameter     = "--storageid";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Storage ID";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStorage";
    NewLine.SearchMethod  = "GETSTORAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameStorage";
    NewLine.SearchMethod  = "RENAMESTORAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Storages management";
    NewLine.MethodDescription   = "Change storage name (for app storage only, see. GetAppStorage)";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameStorage";
    NewLine.SearchMethod  = "RENAMESTORAGE";
    NewLine.Parameter     = "--storageid";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Storage ID";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameStorage";
    NewLine.SearchMethod  = "RENAMESTORAGE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New storage name";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameStorage";
    NewLine.SearchMethod  = "RENAMESTORAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStorageObjects";
    NewLine.SearchMethod  = "GETSTORAGEOBJECTS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Storages management";
    NewLine.MethodDescription   = "Get a list of files and folders, located at the root of the storage";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStorageObjects";
    NewLine.SearchMethod  = "GETSTORAGEOBJECTS";
    NewLine.Parameter     = "--storageid";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Storage ID";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetStorageObjects";
    NewLine.SearchMethod  = "GETSTORAGEOBJECTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateStorageFolder";
    NewLine.SearchMethod  = "CREATESTORAGEFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Storages management";
    NewLine.MethodDescription   = "Create new foldera at the storage";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateStorageFolder";
    NewLine.SearchMethod  = "CREATESTORAGEFOLDER";
    NewLine.Parameter     = "--storageid";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Storage ID";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateStorageFolder";
    NewLine.SearchMethod  = "CREATESTORAGEFOLDER";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Folder name";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateStorageFolder";
    NewLine.SearchMethod  = "CREATESTORAGEFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Storages management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderInformation";
    NewLine.SearchMethod  = "GETFOLDERINFORMATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Get folder information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderInformation";
    NewLine.SearchMethod  = "GETFOLDERINFORMATION";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderInformation";
    NewLine.SearchMethod  = "GETFOLDERINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSubfolder";
    NewLine.SearchMethod  = "CREATESUBFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Create new folder inside another folder";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSubfolder";
    NewLine.SearchMethod  = "CREATESUBFOLDER";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Parent folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSubfolder";
    NewLine.SearchMethod  = "CREATESUBFOLDER";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Name of new folder";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSubfolder";
    NewLine.SearchMethod  = "CREATESUBFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFolderCopy";
    NewLine.SearchMethod  = "MAKEFOLDERCOPY";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Copy one folder to another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFolderCopy";
    NewLine.SearchMethod  = "MAKEFOLDERCOPY";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFolderCopy";
    NewLine.SearchMethod  = "MAKEFOLDERCOPY";
    NewLine.Parameter     = "--tagetid";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "ID of target folder";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFolderCopy";
    NewLine.SearchMethod  = "MAKEFOLDERCOPY";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFolder";
    NewLine.SearchMethod  = "MOVEFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Moves one folder inside another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFolder";
    NewLine.SearchMethod  = "MOVEFOLDER";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFolder";
    NewLine.SearchMethod  = "MOVEFOLDER";
    NewLine.Parameter     = "--tagetid";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "ID of target folder";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFolder";
    NewLine.SearchMethod  = "MOVEFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteFolder";
    NewLine.SearchMethod  = "DELETEFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Remove folder with subfolders";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteFolder";
    NewLine.SearchMethod  = "DELETEFOLDER";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of folder to be deleted";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteFolder";
    NewLine.SearchMethod  = "DELETEFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderExternalLink";
    NewLine.SearchMethod  = "GETFOLDEREXTERNALLINK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Get external link to folder";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderExternalLink";
    NewLine.SearchMethod  = "GETFOLDEREXTERNALLINK";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderExternalLink";
    NewLine.SearchMethod  = "GETFOLDEREXTERNALLINK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderItems";
    NewLine.SearchMethod  = "GETFOLDERITEMS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Get folder child elements";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderItems";
    NewLine.SearchMethod  = "GETFOLDERITEMS";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderItems";
    NewLine.SearchMethod  = "GETFOLDERITEMS";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Items filter. See GetFolderFilterStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderItems";
    NewLine.SearchMethod  = "GETFOLDERITEMS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkFolderAsDeleted";
    NewLine.SearchMethod  = "MARKFOLDERASDELETED";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Move folder to recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkFolderAsDeleted";
    NewLine.SearchMethod  = "MARKFOLDERASDELETED";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkFolderAsDeleted";
    NewLine.SearchMethod  = "MARKFOLDERASDELETED";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RestoreFolder";
    NewLine.SearchMethod  = "RESTOREFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Resotre folder form recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RestoreFolder";
    NewLine.SearchMethod  = "RESTOREFOLDER";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RestoreFolder";
    NewLine.SearchMethod  = "RESTOREFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFolder";
    NewLine.SearchMethod  = "RENAMEFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Change folder name";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFolder";
    NewLine.SearchMethod  = "RENAMEFOLDER";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFolder";
    NewLine.SearchMethod  = "RENAMEFOLDER";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New folders name";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFolder";
    NewLine.SearchMethod  = "RENAMEFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderFilterStructure";
    NewLine.SearchMethod  = "GETFOLDERFILTERSTRUCTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Catalogs management";
    NewLine.MethodDescription   = "Returns filter structure for child folder items";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderFilterStructure";
    NewLine.SearchMethod  = "GETFOLDERFILTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty values, False > field types at values (optional, def. val.. - False)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFolderFilterStructure";
    NewLine.SearchMethod  = "GETFOLDERFILTERSTRUCTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Catalogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToStorage";
    NewLine.SearchMethod  = "UPLOADFILETOSTORAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Upload file to storage root";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToStorage";
    NewLine.SearchMethod  = "UPLOADFILETOSTORAGE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "File name with extension";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToStorage";
    NewLine.SearchMethod  = "UPLOADFILETOSTORAGE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File for upload";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToStorage";
    NewLine.SearchMethod  = "UPLOADFILETOSTORAGE";
    NewLine.Parameter     = "--storageid";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Storage id";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToStorage";
    NewLine.SearchMethod  = "UPLOADFILETOSTORAGE";
    NewLine.Parameter     = "--rights";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Rights array if required (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToStorage";
    NewLine.SearchMethod  = "UPLOADFILETOSTORAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToFolder";
    NewLine.SearchMethod  = "UPLOADFILETOFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Upload local file to the folder";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToFolder";
    NewLine.SearchMethod  = "UPLOADFILETOFOLDER";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "File name with extension";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToFolder";
    NewLine.SearchMethod  = "UPLOADFILETOFOLDER";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File for upload";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToFolder";
    NewLine.SearchMethod  = "UPLOADFILETOFOLDER";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Folder identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UploadFileToFolder";
    NewLine.SearchMethod  = "UPLOADFILETOFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Get information about file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Delete file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of removing file";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileExternalLink";
    NewLine.SearchMethod  = "GETFILEEXTERNALLINK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Get external link to file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileExternalLink";
    NewLine.SearchMethod  = "GETFILEEXTERNALLINK";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileExternalLink";
    NewLine.SearchMethod  = "GETFILEEXTERNALLINK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkFileAsDeleted";
    NewLine.SearchMethod  = "MARKFILEASDELETED";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Move file to recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkFileAsDeleted";
    NewLine.SearchMethod  = "MARKFILEASDELETED";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkFileAsDeleted";
    NewLine.SearchMethod  = "MARKFILEASDELETED";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RestoreFile";
    NewLine.SearchMethod  = "RESTOREFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Restore file from recycle bin";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RestoreFile";
    NewLine.SearchMethod  = "RESTOREFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RestoreFile";
    NewLine.SearchMethod  = "RESTOREFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFileCopy";
    NewLine.SearchMethod  = "MAKEFILECOPY";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Copy file from one destination to another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFileCopy";
    NewLine.SearchMethod  = "MAKEFILECOPY";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Original file ID";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFileCopy";
    NewLine.SearchMethod  = "MAKEFILECOPY";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "ID of copy destination folder";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MakeFileCopy";
    NewLine.SearchMethod  = "MAKEFILECOPY";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFileToFolder";
    NewLine.SearchMethod  = "MOVEFILETOFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Move file from one destination to another";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFileToFolder";
    NewLine.SearchMethod  = "MOVEFILETOFOLDER";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File ID";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFileToFolder";
    NewLine.SearchMethod  = "MOVEFILETOFOLDER";
    NewLine.Parameter     = "--folderid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "ID of new destination folder";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MoveFileToFolder";
    NewLine.SearchMethod  = "MOVEFILETOFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFile";
    NewLine.SearchMethod  = "RENAMEFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Changes the name of an existing file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFile";
    NewLine.SearchMethod  = "RENAMEFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFile";
    NewLine.SearchMethod  = "RENAMEFILE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New folders name";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "RenameFile";
    NewLine.SearchMethod  = "RENAMEFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateChat";
    NewLine.SearchMethod  = "CREATECHAT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Creates a new chat based on the field structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateChat";
    NewLine.SearchMethod  = "CREATECHAT";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Chat fields structure. See GetChatStructure";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateChat";
    NewLine.SearchMethod  = "CREATECHAT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatUsers";
    NewLine.SearchMethod  = "GETCHATUSERS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Gets the list of chat users by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatUsers";
    NewLine.SearchMethod  = "GETCHATUSERS";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatUsers";
    NewLine.SearchMethod  = "GETCHATUSERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "LeaveChat";
    NewLine.SearchMethod  = "LEAVECHAT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Removes the current user from the chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "LeaveChat";
    NewLine.SearchMethod  = "LEAVECHAT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "LeaveChat";
    NewLine.SearchMethod  = "LEAVECHAT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Get users information for dialog";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--users";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Usesr ID or array of users IDs";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUsers";
    NewLine.SearchMethod  = "GETUSERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddUsersToChat";
    NewLine.SearchMethod  = "ADDUSERSTOCHAT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Adds users to the chat by ID array";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddUsersToChat";
    NewLine.SearchMethod  = "ADDUSERSTOCHAT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddUsersToChat";
    NewLine.SearchMethod  = "ADDUSERSTOCHAT";
    NewLine.Parameter     = "--users";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New members IDs";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddUsersToChat";
    NewLine.SearchMethod  = "ADDUSERSTOCHAT";
    NewLine.Parameter     = "--hide";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Hide old messages from new members (optional, def. val.. - False)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "AddUsersToChat";
    NewLine.SearchMethod  = "ADDUSERSTOCHAT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteUserFromChat";
    NewLine.SearchMethod  = "DELETEUSERFROMCHAT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Deletes user from chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteUserFromChat";
    NewLine.SearchMethod  = "DELETEUSERFROMCHAT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteUserFromChat";
    NewLine.SearchMethod  = "DELETEUSERFROMCHAT";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteUserFromChat";
    NewLine.SearchMethod  = "DELETEUSERFROMCHAT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatTitle";
    NewLine.SearchMethod  = "CHANGECHATTITLE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Change text of chat title";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatTitle";
    NewLine.SearchMethod  = "CHANGECHATTITLE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatTitle";
    NewLine.SearchMethod  = "CHANGECHATTITLE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New title";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatTitle";
    NewLine.SearchMethod  = "CHANGECHATTITLE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatColor";
    NewLine.SearchMethod  = "CHANGECHATCOLOR";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Chat chat color for mobile app";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatColor";
    NewLine.SearchMethod  = "CHANGECHATCOLOR";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatColor";
    NewLine.SearchMethod  = "CHANGECHATCOLOR";
    NewLine.Parameter     = "--color";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New chat color";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatColor";
    NewLine.SearchMethod  = "CHANGECHATCOLOR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatPicture";
    NewLine.SearchMethod  = "CHANGECHATPICTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Setup new chat picture";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatPicture";
    NewLine.SearchMethod  = "CHANGECHATPICTURE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatPicture";
    NewLine.SearchMethod  = "CHANGECHATPICTURE";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Picture data";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatPicture";
    NewLine.SearchMethod  = "CHANGECHATPICTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatOwner";
    NewLine.SearchMethod  = "CHANGECHATOWNER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Change chat owner";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatOwner";
    NewLine.SearchMethod  = "CHANGECHATOWNER";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatOwner";
    NewLine.SearchMethod  = "CHANGECHATOWNER";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeChatOwner";
    NewLine.SearchMethod  = "CHANGECHATOWNER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DisableChatNotifications";
    NewLine.SearchMethod  = "DISABLECHATNOTIFICATIONS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Disable chat notifications";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DisableChatNotifications";
    NewLine.SearchMethod  = "DISABLECHATNOTIFICATIONS";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DisableChatNotifications";
    NewLine.SearchMethod  = "DISABLECHATNOTIFICATIONS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EnableChatNotifications";
    NewLine.SearchMethod  = "ENABLECHATNOTIFICATIONS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Enable chat notifications";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EnableChatNotifications";
    NewLine.SearchMethod  = "ENABLECHATNOTIFICATIONS";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EnableChatNotifications";
    NewLine.SearchMethod  = "ENABLECHATNOTIFICATIONS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMessagesList";
    NewLine.SearchMethod  = "GETCHATMESSAGESLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Gets a list of 20 chat or dialog messages, depending on the FirstID and LastID specified";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMessagesList";
    NewLine.SearchMethod  = "GETCHATMESSAGESLIST";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMessagesList";
    NewLine.SearchMethod  = "GETCHATMESSAGESLIST";
    NewLine.Parameter     = "--last";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Id of last message (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMessagesList";
    NewLine.SearchMethod  = "GETCHATMESSAGESLIST";
    NewLine.Parameter     = "--first";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of first message (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMessagesList";
    NewLine.SearchMethod  = "GETCHATMESSAGESLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDialog";
    NewLine.SearchMethod  = "GETDIALOG";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Get chat data by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDialog";
    NewLine.SearchMethod  = "GETDIALOG";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDialog";
    NewLine.SearchMethod  = "GETDIALOG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMembersList";
    NewLine.SearchMethod  = "GETCHATMEMBERSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Get chat members list";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMembersList";
    NewLine.SearchMethod  = "GETCHATMEMBERSLIST";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatMembersList";
    NewLine.SearchMethod  = "GETCHATMEMBERSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendWritingNotification";
    NewLine.SearchMethod  = "SENDWRITINGNOTIFICATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Send Writing... status to dialog...";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendWritingNotification";
    NewLine.SearchMethod  = "SENDWRITINGNOTIFICATION";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendWritingNotification";
    NewLine.SearchMethod  = "SENDWRITINGNOTIFICATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserStatus";
    NewLine.SearchMethod  = "GETUSERSTATUS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Gets the status (online) of the current user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserStatus";
    NewLine.SearchMethod  = "GETUSERSTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetUserStatus";
    NewLine.SearchMethod  = "SETUSERSTATUS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Sets the status (online) of the current user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetUserStatus";
    NewLine.SearchMethod  = "SETUSERSTATUS";
    NewLine.Parameter     = "--status";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Status value: online, dnd, away";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetUserStatus";
    NewLine.SearchMethod  = "SETUSERSTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ReadAll";
    NewLine.SearchMethod  = "READALL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Mark all message as readed";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ReadAll";
    NewLine.SearchMethod  = "READALL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatFilesFolder";
    NewLine.SearchMethod  = "GETCHATFILESFOLDER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Get information about folder for chat files";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatFilesFolder";
    NewLine.SearchMethod  = "GETCHATFILESFOLDER";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatFilesFolder";
    NewLine.SearchMethod  = "GETCHATFILESFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Chats and dialogs management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetChatStructure";
    NewLine.SearchMethod  = "GETCHATSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty values, False > field types at values (optional, def. val.. - False)";
    NewLine.Region      = "Chats and dialogs management";
    NewLine.MethodDescription   = "Get chat fields structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Send message to dialog";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--blocks";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Array of attachments (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Edit dialog message content";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of the message to be edited";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New message text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--blocks";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "New blocks array (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetMessageReaction";
    NewLine.SearchMethod  = "SETMESSAGEREACTION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Set or remove reaction mark on the message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetMessageReaction";
    NewLine.SearchMethod  = "SETMESSAGEREACTION";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Message ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetMessageReaction";
    NewLine.SearchMethod  = "SETMESSAGEREACTION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Deletes a dialog message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of the message to be deleted";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Send disk file to chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File ID from UploadFileToFolder method";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "File description (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsReaded";
    NewLine.SearchMethod  = "MARKMESSAGEASREADED";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Mark current and all previous messages as readed";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsReaded";
    NewLine.SearchMethod  = "MARKMESSAGEASREADED";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsReaded";
    NewLine.SearchMethod  = "MARKMESSAGEASREADED";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Id of last readed message";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsReaded";
    NewLine.SearchMethod  = "MARKMESSAGEASREADED";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsUnreaded";
    NewLine.SearchMethod  = "MARKMESSAGEASUNREADED";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Mark current and all messages after as unreaded";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsUnreaded";
    NewLine.SearchMethod  = "MARKMESSAGEASUNREADED";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID (as chatXXX) or User ID (as XXX)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsUnreaded";
    NewLine.SearchMethod  = "MARKMESSAGEASUNREADED";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of last unreaded message";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "MarkMessageAsUnreaded";
    NewLine.SearchMethod  = "MARKMESSAGEASUNREADED";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetPictureBlock";
    NewLine.SearchMethod  = "GETPICTUREBLOCK";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Picture name";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Make picture block for SendMessage method";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetPictureBlock";
    NewLine.SearchMethod  = "GETPICTUREBLOCK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of sending picture";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileBlock";
    NewLine.SearchMethod  = "GETFILEBLOCK";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Picture name";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Make file block for SendMessage method";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetFileBlock";
    NewLine.SearchMethod  = "GETFILEBLOCK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "File URL";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePersonalNotification";
    NewLine.SearchMethod  = "CREATEPERSONALNOTIFICATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Notifications management";
    NewLine.MethodDescription   = "Creates a personal notification to the user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePersonalNotification";
    NewLine.SearchMethod  = "CREATEPERSONALNOTIFICATION";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID for sending the notification";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePersonalNotification";
    NewLine.SearchMethod  = "CREATEPERSONALNOTIFICATION";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Notification text";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePersonalNotification";
    NewLine.SearchMethod  = "CREATEPERSONALNOTIFICATION";
    NewLine.Parameter     = "--tag";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Uniqueness Tag. If already exist, other notif. will be deleted (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePersonalNotification";
    NewLine.SearchMethod  = "CREATEPERSONALNOTIFICATION";
    NewLine.Parameter     = "--blocks";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Array of attachments (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreatePersonalNotification";
    NewLine.SearchMethod  = "CREATEPERSONALNOTIFICATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSystemNotification";
    NewLine.SearchMethod  = "CREATESYSTEMNOTIFICATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Notifications management";
    NewLine.MethodDescription   = "Creates a system notification to the user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSystemNotification";
    NewLine.SearchMethod  = "CREATESYSTEMNOTIFICATION";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID for sending the notification";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSystemNotification";
    NewLine.SearchMethod  = "CREATESYSTEMNOTIFICATION";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Notification text";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSystemNotification";
    NewLine.SearchMethod  = "CREATESYSTEMNOTIFICATION";
    NewLine.Parameter     = "--tag";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Uniqueness Tag. If already exist, other notif. will be deleted (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSystemNotification";
    NewLine.SearchMethod  = "CREATESYSTEMNOTIFICATION";
    NewLine.Parameter     = "--blocks";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Array of attachments (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateSystemNotification";
    NewLine.SearchMethod  = "CREATESYSTEMNOTIFICATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteNotification";
    NewLine.SearchMethod  = "DELETENOTIFICATION";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Notifications management";
    NewLine.MethodDescription   = "Delete notification by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteNotification";
    NewLine.SearchMethod  = "DELETENOTIFICATION";
    NewLine.Parameter     = "--notif";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Notification ID";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteNotification";
    NewLine.SearchMethod  = "DELETENOTIFICATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Notifications management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDepartment";
    NewLine.SearchMethod  = "CREATEDEPARTMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Departments management";
    NewLine.MethodDescription   = "Creates a new department";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDepartment";
    NewLine.SearchMethod  = "CREATEDEPARTMENT";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Department name";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDepartment";
    NewLine.SearchMethod  = "CREATEDEPARTMENT";
    NewLine.Parameter     = "--parentid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "ID of parent department (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDepartment";
    NewLine.SearchMethod  = "CREATEDEPARTMENT";
    NewLine.Parameter     = "--headid";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "ID of department manager (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDepartment";
    NewLine.SearchMethod  = "CREATEDEPARTMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDepartment";
    NewLine.SearchMethod  = "UPDATEDEPARTMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Departments management";
    NewLine.MethodDescription   = "Update an existing department";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDepartment";
    NewLine.SearchMethod  = "UPDATEDEPARTMENT";
    NewLine.Parameter     = "--depid";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Department ID";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDepartment";
    NewLine.SearchMethod  = "UPDATEDEPARTMENT";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Department name (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDepartment";
    NewLine.SearchMethod  = "UPDATEDEPARTMENT";
    NewLine.Parameter     = "--parentid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "ID of parent department (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDepartment";
    NewLine.SearchMethod  = "UPDATEDEPARTMENT";
    NewLine.Parameter     = "--headid";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "ID of department manager (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDepartment";
    NewLine.SearchMethod  = "UPDATEDEPARTMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDepartments";
    NewLine.SearchMethod  = "GETDEPARTMENTS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Departments management";
    NewLine.MethodDescription   = "Gets a list of departments by ID or filter";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDepartments";
    NewLine.SearchMethod  = "GETDEPARTMENTS";
    NewLine.Parameter     = "--depid";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Selection by department ID (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDepartments";
    NewLine.SearchMethod  = "GETDEPARTMENTS";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Filter by name (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDepartments";
    NewLine.SearchMethod  = "GETDEPARTMENTS";
    NewLine.Parameter     = "--parentid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Filter by parent ID (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDepartments";
    NewLine.SearchMethod  = "GETDEPARTMENTS";
    NewLine.Parameter     = "--headid";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Filter by manager ID (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDepartments";
    NewLine.SearchMethod  = "GETDEPARTMENTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteDepartment";
    NewLine.SearchMethod  = "DELETEDEPARTMENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Departments management";
    NewLine.MethodDescription   = "Delets department by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteDepartment";
    NewLine.SearchMethod  = "DELETEDEPARTMENT";
    NewLine.Parameter     = "--depid";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Department ID for deletion";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteDepartment";
    NewLine.SearchMethod  = "DELETEDEPARTMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Departments management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCurrentUser";
    NewLine.SearchMethod  = "GETCURRENTUSER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Get current user data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCurrentUser";
    NewLine.SearchMethod  = "GETCURRENTUSER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUser";
    NewLine.SearchMethod  = "GETUSER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Gets user information by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUser";
    NewLine.SearchMethod  = "GETUSER";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUser";
    NewLine.SearchMethod  = "GETUSER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Create new user by fields structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "New user data. See. GetUserFieldsStructure";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateUser";
    NewLine.SearchMethod  = "CREATEUSER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Updates user data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "New user data. See. GetUserFieldsStructure";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateUser";
    NewLine.SearchMethod  = "UPDATEUSER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeUserStatus";
    NewLine.SearchMethod  = "CHANGEUSERSTATUS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Activates or deactivates (fire) the selected user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeUserStatus";
    NewLine.SearchMethod  = "CHANGEUSERSTATUS";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeUserStatus";
    NewLine.SearchMethod  = "CHANGEUSERSTATUS";
    NewLine.Parameter     = "--fire";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "True > Deactivation, False > Activation (optional, def. val.. - True)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "ChangeUserStatus";
    NewLine.SearchMethod  = "CHANGEUSERSTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "FindUsers";
    NewLine.SearchMethod  = "FINDUSERS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Gets the list of users according to the specified filter";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "FindUsers";
    NewLine.SearchMethod  = "FINDUSERS";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Filter. See GetUserFilterStructure";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "FindUsers";
    NewLine.SearchMethod  = "FINDUSERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserFieldsStructure";
    NewLine.SearchMethod  = "GETUSERFIELDSSTRUCTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Gets the field structure for creating or modifying user information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserFieldsStructure";
    NewLine.SearchMethod  = "GETUSERFIELDSSTRUCTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Users management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserFilterStructure";
    NewLine.SearchMethod  = "GETUSERFILTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Users management";
    NewLine.MethodDescription   = "Returns the field structure for filtering users in the FindUsers method";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateLead";
    NewLine.SearchMethod  = "CREATELEAD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Leads management";
    NewLine.MethodDescription   = "Creates a new lead by fields structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateLead";
    NewLine.SearchMethod  = "CREATELEAD";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Lead fields structure. See GetLeadStructure";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateLead";
    NewLine.SearchMethod  = "CREATELEAD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteLead";
    NewLine.SearchMethod  = "DELETELEAD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Leads management";
    NewLine.MethodDescription   = "Deletes a lead by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteLead";
    NewLine.SearchMethod  = "DELETELEAD";
    NewLine.Parameter     = "--lead";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Lead ID";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteLead";
    NewLine.SearchMethod  = "DELETELEAD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLead";
    NewLine.SearchMethod  = "GETLEAD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Leads management";
    NewLine.MethodDescription   = "Gets a lead by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLead";
    NewLine.SearchMethod  = "GETLEAD";
    NewLine.Parameter     = "--lead";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Lead ID";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLead";
    NewLine.SearchMethod  = "GETLEAD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLeadsList";
    NewLine.SearchMethod  = "GETLEADSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Leads management";
    NewLine.MethodDescription   = "Gets a list of leads (50 per request max) with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLeadsList";
    NewLine.SearchMethod  = "GETLEADSLIST";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Lead filter structure. See GetLeadFilterStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLeadsList";
    NewLine.SearchMethod  = "GETLEADSLIST";
    NewLine.Parameter     = "--offset";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Offset from the beginning of the list to get leads > 50 recursively (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLeadsList";
    NewLine.SearchMethod  = "GETLEADSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateLead";
    NewLine.SearchMethod  = "UPDATELEAD";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Leads management";
    NewLine.MethodDescription   = "Modifies an existing lead";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateLead";
    NewLine.SearchMethod  = "UPDATELEAD";
    NewLine.Parameter     = "--lead";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Lead ID";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateLead";
    NewLine.SearchMethod  = "UPDATELEAD";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Structure of lead fields";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateLead";
    NewLine.SearchMethod  = "UPDATELEAD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLeadStructure";
    NewLine.SearchMethod  = "GETLEADSTRUCTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Leads management";
    NewLine.MethodDescription   = "Gets a structure with field descriptions for creating a lead";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLeadStructure";
    NewLine.SearchMethod  = "GETLEADSTRUCTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Leads management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetLeadFilterStructure";
    NewLine.SearchMethod  = "GETLEADFILTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Leads management";
    NewLine.MethodDescription   = "Returns the field structure for filtering leads in the GetLeadsList method";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDeal";
    NewLine.SearchMethod  = "CREATEDEAL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Deals management";
    NewLine.MethodDescription   = "Creates a new deal by field structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDeal";
    NewLine.SearchMethod  = "CREATEDEAL";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Deal fields structure. See. GetDealStructure";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateDeal";
    NewLine.SearchMethod  = "CREATEDEAL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteDeal";
    NewLine.SearchMethod  = "DELETEDEAL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Deals management";
    NewLine.MethodDescription   = "Deletes deal by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteDeal";
    NewLine.SearchMethod  = "DELETEDEAL";
    NewLine.Parameter     = "--deal";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Deal ID";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteDeal";
    NewLine.SearchMethod  = "DELETEDEAL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDeal";
    NewLine.SearchMethod  = "GETDEAL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Deals management";
    NewLine.MethodDescription   = "Gets deal by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDeal";
    NewLine.SearchMethod  = "GETDEAL";
    NewLine.Parameter     = "--deal";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Deal ID";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDeal";
    NewLine.SearchMethod  = "GETDEAL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDealsList";
    NewLine.SearchMethod  = "GETDEALSLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Deals management";
    NewLine.MethodDescription   = "Gets the list of deals (50 pcs per query max) with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDealsList";
    NewLine.SearchMethod  = "GETDEALSLIST";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Deals filter structure. See GetDealsFilterStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDealsList";
    NewLine.SearchMethod  = "GETDEALSLIST";
    NewLine.Parameter     = "--offset";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Offset from the beginning of the list to retrieve deals > 50 pcs recursively (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDealsList";
    NewLine.SearchMethod  = "GETDEALSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDeal";
    NewLine.SearchMethod  = "UPDATEDEAL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Deals management";
    NewLine.MethodDescription   = "Modifies an existing deal";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDeal";
    NewLine.SearchMethod  = "UPDATEDEAL";
    NewLine.Parameter     = "--deal";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Deal ID";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDeal";
    NewLine.SearchMethod  = "UPDATEDEAL";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Deal fields structure";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateDeal";
    NewLine.SearchMethod  = "UPDATEDEAL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDealStructure";
    NewLine.SearchMethod  = "GETDEALSTRUCTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Deals management";
    NewLine.MethodDescription   = "Gets a structure with field descriptions for creating a deal";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDealStructure";
    NewLine.SearchMethod  = "GETDEALSTRUCTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Deals management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetDealsFilterStructure";
    NewLine.SearchMethod  = "GETDEALSFILTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Deals management";
    NewLine.MethodDescription   = "Returns the field structure for filtering deals in the GetDealsList method";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarList";
    NewLine.SearchMethod  = "GETCALENDARLIST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Gets a list of calendars of the specified owner";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarList";
    NewLine.SearchMethod  = "GETCALENDARLIST";
    NewLine.Parameter     = "--owner";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Calendar owner ID";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarList";
    NewLine.SearchMethod  = "GETCALENDARLIST";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Calendar type: user, group, company_calendar, location, etc.";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarList";
    NewLine.SearchMethod  = "GETCALENDARLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateCalendar";
    NewLine.SearchMethod  = "CREATECALENDAR";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Creates a new calendar";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateCalendar";
    NewLine.SearchMethod  = "CREATECALENDAR";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Calendar fields structure. See GetCalendarStructure";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateCalendar";
    NewLine.SearchMethod  = "CREATECALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendar";
    NewLine.SearchMethod  = "UPDATECALENDAR";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Changes the calendar settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendar";
    NewLine.SearchMethod  = "UPDATECALENDAR";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendar";
    NewLine.SearchMethod  = "UPDATECALENDAR";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Deal fields structure. See. GetDealStructure";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendar";
    NewLine.SearchMethod  = "UPDATECALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendar";
    NewLine.SearchMethod  = "DELETECALENDAR";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Deletes an existing calendar";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendar";
    NewLine.SearchMethod  = "DELETECALENDAR";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar ID";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendar";
    NewLine.SearchMethod  = "DELETECALENDAR";
    NewLine.Parameter     = "--owner";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Calendar owner ID";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendar";
    NewLine.SearchMethod  = "DELETECALENDAR";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Calendar type: user, group";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendar";
    NewLine.SearchMethod  = "DELETECALENDAR";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserBusy";
    NewLine.SearchMethod  = "GETUSERBUSY";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Gets an array of user events in the specified interval";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserBusy";
    NewLine.SearchMethod  = "GETUSERBUSY";
    NewLine.Parameter     = "--users";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "IDs of users or a single user";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserBusy";
    NewLine.SearchMethod  = "GETUSERBUSY";
    NewLine.Parameter     = "--from";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Start date of the period";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserBusy";
    NewLine.SearchMethod  = "GETUSERBUSY";
    NewLine.Parameter     = "--to";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "End date of the period";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserBusy";
    NewLine.SearchMethod  = "GETUSERBUSY";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCustomCalendarSettings";
    NewLine.SearchMethod  = "GETCUSTOMCALENDARSETTINGS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Gets the current users custom calendar settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCustomCalendarSettings";
    NewLine.SearchMethod  = "GETCUSTOMCALENDARSETTINGS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetCustomCalendarSettings";
    NewLine.SearchMethod  = "SETCUSTOMCALENDARSETTINGS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Sets new custom calendar settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetCustomCalendarSettings";
    NewLine.SearchMethod  = "SETCUSTOMCALENDARSETTINGS";
    NewLine.Parameter     = "--settings";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Settings structure. See GetCalednarCustomSettingsStructure";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetCustomCalendarSettings";
    NewLine.SearchMethod  = "SETCUSTOMCALENDARSETTINGS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarSettingsStructure";
    NewLine.SearchMethod  = "GETCALENDARSETTINGSSTRUCTURE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Gets the structure of the default calendar settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarSettingsStructure";
    NewLine.SearchMethod  = "GETCALENDARSETTINGSSTRUCTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendars management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalednarCustomSettingsStructure";
    NewLine.SearchMethod  = "GETCALEDNARCUSTOMSETTINGSSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Gets an empty structure for setting custom calendar settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarStructure";
    NewLine.SearchMethod  = "GETCALENDARSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Calendars management";
    NewLine.MethodDescription   = "Returns the structure of the calendar description fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateCalendarEvent";
    NewLine.SearchMethod  = "CREATECALENDAREVENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Creates a new calendar event";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateCalendarEvent";
    NewLine.SearchMethod  = "CREATECALENDAREVENT";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Event description. See GetCalendarEventsStructure";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "CreateCalendarEvent";
    NewLine.SearchMethod  = "CREATECALENDAREVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendarEvent";
    NewLine.SearchMethod  = "UPDATECALENDAREVENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Modifies calendar event data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendarEvent";
    NewLine.SearchMethod  = "UPDATECALENDAREVENT";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Calednar event ID";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendarEvent";
    NewLine.SearchMethod  = "UPDATECALENDAREVENT";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Event description. See GetCalendarEventsStructure";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "UpdateCalendarEvent";
    NewLine.SearchMethod  = "UPDATECALENDAREVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvent";
    NewLine.SearchMethod  = "GETCALENDAREVENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Gets a calendar event by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvent";
    NewLine.SearchMethod  = "GETCALENDAREVENT";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Event ID to retrieve";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvent";
    NewLine.SearchMethod  = "GETCALENDAREVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvents";
    NewLine.SearchMethod  = "GETCALENDAREVENTS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Gets events of calendars with or without filters";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvents";
    NewLine.SearchMethod  = "GETCALENDAREVENTS";
    NewLine.Parameter     = "--owner";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Calendar owner ID";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvents";
    NewLine.SearchMethod  = "GETCALENDAREVENTS";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Calendar type: user, group, company_calendar";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvents";
    NewLine.SearchMethod  = "GETCALENDAREVENTS";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Events filter. See GetCalendarEventsFilterStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEvents";
    NewLine.SearchMethod  = "GETCALENDAREVENTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendarEvent";
    NewLine.SearchMethod  = "DELETECALENDAREVENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Deletes an event from the calendar";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendarEvent";
    NewLine.SearchMethod  = "DELETECALENDAREVENT";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "ID of the event to be deleted";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "DeleteCalendarEvent";
    NewLine.SearchMethod  = "DELETECALENDAREVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserParticipationStatus";
    NewLine.SearchMethod  = "GETUSERPARTICIPATIONSTATUS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Gets the event participation status of the current user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserParticipationStatus";
    NewLine.SearchMethod  = "GETUSERPARTICIPATIONSTATUS";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Calednar event ID";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetUserParticipationStatus";
    NewLine.SearchMethod  = "GETUSERPARTICIPATIONSTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetUserParticipationStatus";
    NewLine.SearchMethod  = "SETUSERPARTICIPATIONSTATUS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL of webhook or a Bitrix24 domain, when token used";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Sets the event participation status for the current user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetUserParticipationStatus";
    NewLine.SearchMethod  = "SETUSERPARTICIPATIONSTATUS";
    NewLine.Parameter     = "--event";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Calednar event ID";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetUserParticipationStatus";
    NewLine.SearchMethod  = "SETUSERPARTICIPATIONSTATUS";
    NewLine.Parameter     = "--status";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Participation status: Y (agreed), N (refused), Q (did not answer)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "SetUserParticipationStatus";
    NewLine.SearchMethod  = "SETUSERPARTICIPATIONSTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token, when app auth method used (optional, def. val.. - Empty value)";
    NewLine.Region      = "Calendar events management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEventsStructure";
    NewLine.SearchMethod  = "GETCALENDAREVENTSSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Returns the structure of the calendar event fields";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "bitrix24";
    NewLine.Module       = "OPI_Bitrix24";
    NewLine.Method        = "GetCalendarEventsFilterStructure";
    NewLine.SearchMethod  = "GETCALENDAREVENTSFILTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Calendar events management";
    NewLine.MethodDescription   = "Gets the filter structure for the function GetCalendarEvents";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Bitrix24 = LoadScript(""%1/oint/core/Modules/OPI_Bitrix24.os"", Context);
        |" + Chars.LF;


EndFunction 
