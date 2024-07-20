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
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetAuthorizationLink";
    NewLine.МетодПоиска = "GETAUTHORIZATIONLINK";
    NewLine.Параметр    = "--appkey";
    NewLine.Описание    = "Application key";
    NewLine.Область     = "Account and authorization";
    NewLine.ОписаниеМетода   = "Generates an authorization link for browser transition";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--appkey";
    NewLine.Описание    = "Application key";
    NewLine.Область     = "Account and authorization";
    NewLine.ОписаниеМетода   = "Gets token based on the code from the GetAuthorizationLink page";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--appsecret";
    NewLine.Описание    = "Application secret";
    NewLine.Область     = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--code";
    NewLine.Описание    = "Code from the authorization page";
    NewLine.Область     = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--appkey";
    NewLine.Описание    = "Application key";
    NewLine.Область     = "Account and authorization";
    NewLine.ОписаниеМетода   = "Gets a new token based on the refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--appsecret";
    NewLine.Описание    = "Application secret";
    NewLine.Область     = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--refresh";
    NewLine.Описание    = "Refresh token";
    NewLine.Область     = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetAccountInformation";
    NewLine.МетодПоиска = "GETACCOUNTINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Account and authorization";
    NewLine.ОписаниеМетода   = "Gets account information";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetAccountInformation";
    NewLine.МетодПоиска = "GETACCOUNTINFORMATION";
    NewLine.Параметр    = "--account";
    NewLine.Описание    = "Account ID. Current token account if not filled (optional, def. val. - Empty value)";
    NewLine.Область     = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetSpaceUsageData";
    NewLine.МетодПоиска = "GETSPACEUSAGEDATA";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Account and authorization";
    NewLine.ОписаниеМетода   = "Gets information on the amount of used disk space";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetObjectInformation";
    NewLine.МетодПоиска = "GETOBJECTINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets information about a file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetObjectInformation";
    NewLine.МетодПоиска = "GETOBJECTINFORMATION";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetObjectInformation";
    NewLine.МетодПоиска = "GETOBJECTINFORMATION";
    NewLine.Параметр    = "--detail";
    NewLine.Описание    = "Add information fields for mediafiles (optional, def. val. - False)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetListOfFolderFiles";
    NewLine.МетодПоиска = "GETLISTOFFOLDERFILES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets the list of the first files in the directory or continues getting the next ones when the cursor is specified";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetListOfFolderFiles";
    NewLine.МетодПоиска = "GETLISTOFFOLDERFILES";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the directory. Optional if the cursor is specified (optional, def. val. - Empty value)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetListOfFolderFiles";
    NewLine.МетодПоиска = "GETLISTOFFOLDERFILES";
    NewLine.Параметр    = "--detail";
    NewLine.Описание    = "Add information fields for mediafiles (optional, def. val. - False)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetListOfFolderFiles";
    NewLine.МетодПоиска = "GETLISTOFFOLDERFILES";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Cursor from the previous request to get the next set of files (optional, def. val. - Empty value)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetPreview";
    NewLine.МетодПоиска = "GETPREVIEW";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets PDF or HTML preview of the object (for documents only)";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetPreview";
    NewLine.МетодПоиска = "GETPREVIEW";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Uploads a file to the cloud drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "Data file for upload";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Save path on Dropbox";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--overwrite";
    NewLine.Описание    = "Overwrite file in case of path conflicts (optional, def. val. - False)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "UploadFileByURL";
    NewLine.МетодПоиска = "UPLOADFILEBYURL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Uploads a file to the cloud drive by fetching it from the specified URL";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "UploadFileByURL";
    NewLine.МетодПоиска = "UPLOADFILEBYURL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL source of the file";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "UploadFileByURL";
    NewLine.МетодПоиска = "UPLOADFILEBYURL";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Save path on Dropbox";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetUploadStatusByURL";
    NewLine.МетодПоиска = "GETUPLOADSTATUSBYURL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets the upload status of the file by URL";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetUploadStatusByURL";
    NewLine.МетодПоиска = "GETUPLOADSTATUSBYURL";
    NewLine.Параметр    = "--job";
    NewLine.Описание    = "ID of async jsob from UploadFileByURL response";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Deletes an object from the cloud drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object to delete";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--permanently";
    NewLine.Описание    = "Delete object without the possibility of recovery (optional, def. val. - False)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Copies a file or directory to the selected path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--form";
    NewLine.Описание    = "Path to the original object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "Target path for the new object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "MoveObject";
    NewLine.МетодПоиска = "MOVEOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Moves an object to the selected path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "MoveObject";
    NewLine.МетодПоиска = "MOVEOBJECT";
    NewLine.Параметр    = "--form";
    NewLine.Описание    = "Path to the original object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "MoveObject";
    NewLine.МетодПоиска = "MOVEOBJECT";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "Target path for the new object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CreateFolder";
    NewLine.МетодПоиска = "CREATEFOLDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Creates an empty directory at the selected path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CreateFolder";
    NewLine.МетодПоиска = "CREATEFOLDER";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Target path for creating the directory";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Downloads a file by the specified path or ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path or ID of the file";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DownloadFolder";
    NewLine.МетодПоиска = "DOWNLOADFOLDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Downloads a zip archive with the contents of the specified directory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DownloadFolder";
    NewLine.МетодПоиска = "DOWNLOADFOLDER";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path or ID of the directory";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetObjectVersionList";
    NewLine.МетодПоиска = "GETOBJECTVERSIONLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets the list of versions (revisions) of the object";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetObjectVersionList";
    NewLine.МетодПоиска = "GETOBJECTVERSIONLIST";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetObjectVersionList";
    NewLine.МетодПоиска = "GETOBJECTVERSIONLIST";
    NewLine.Параметр    = "--amount";
    NewLine.Описание    = "Number of the latest versions of the object to display (optional, def. val. - 10)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "RestoreObjectToVersion";
    NewLine.МетодПоиска = "RESTOREOBJECTTOVERSION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Restores object state to required version (revision)";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "RestoreObjectToVersion";
    NewLine.МетодПоиска = "RESTOREOBJECTTOVERSION";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "RestoreObjectToVersion";
    NewLine.МетодПоиска = "RESTOREOBJECTTOVERSION";
    NewLine.Параметр    = "--rev";
    NewLine.Описание    = "ID of the version (revision) for restoration";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetTagList";
    NewLine.МетодПоиска = "GETTAGLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Gets the list of tags of the selected files";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetTagList";
    NewLine.МетодПоиска = "GETTAGLIST";
    NewLine.Параметр    = "--paths";
    NewLine.Описание    = "Path or set of paths to the files";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddTag";
    NewLine.МетодПоиска = "ADDTAG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Add new tag to file or folder";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddTag";
    NewLine.МетодПоиска = "ADDTAG";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object for which the tag needs to be created";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddTag";
    NewLine.МетодПоиска = "ADDTAG";
    NewLine.Параметр    = "--tag";
    NewLine.Описание    = "Tag text";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DeleteTag";
    NewLine.МетодПоиска = "DELETETAG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Tags managment";
    NewLine.ОписаниеМетода   = "Deletes the text tag of a file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DeleteTag";
    NewLine.МетодПоиска = "DELETETAG";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object whose tag needs to be deleted";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "DeleteTag";
    NewLine.МетодПоиска = "DELETETAG";
    NewLine.Параметр    = "--tag";
    NewLine.Описание    = "Tag text";
    NewLine.Область     = "Tags managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "PublishFolder";
    NewLine.МетодПоиска = "PUBLISHFOLDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Shared access settings";
    NewLine.ОписаниеМетода   = "Sets the directory to public access mode";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "PublishFolder";
    NewLine.МетодПоиска = "PUBLISHFOLDER";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the target directory";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CancelFolderPublication";
    NewLine.МетодПоиска = "CANCELFOLDERPUBLICATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Shared access settings";
    NewLine.ОписаниеМетода   = "Cancels the public access mode for the directory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CancelFolderPublication";
    NewLine.МетодПоиска = "CANCELFOLDERPUBLICATION";
    NewLine.Параметр    = "--folder";
    NewLine.Описание    = "ID of the public catalog (shared folder ID)";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFile";
    NewLine.МетодПоиска = "ADDUSERSTOFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Shared access settings";
    NewLine.ОписаниеМетода   = "Defines access to the file for an external user";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFile";
    NewLine.МетодПоиска = "ADDUSERSTOFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "ID of the file to be accessed";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFile";
    NewLine.МетодПоиска = "ADDUSERSTOFILE";
    NewLine.Параметр    = "--emails";
    NewLine.Описание    = "List of email addresses of users being added";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFile";
    NewLine.МетодПоиска = "ADDUSERSTOFILE";
    NewLine.Параметр    = "--readonly";
    NewLine.Описание    = "Prohibits file editing for the external user (optional, def. val. - True)";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFolder";
    NewLine.МетодПоиска = "ADDUSERSTOFOLDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Shared access settings";
    NewLine.ОписаниеМетода   = "Grants external users access to the directory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFolder";
    NewLine.МетодПоиска = "ADDUSERSTOFOLDER";
    NewLine.Параметр    = "--folder";
    NewLine.Описание    = "ID of the public catalog (shared folder ID)";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFolder";
    NewLine.МетодПоиска = "ADDUSERSTOFOLDER";
    NewLine.Параметр    = "--emails";
    NewLine.Описание    = "List of email addresses of users being added";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "AddUsersToFolder";
    NewLine.МетодПоиска = "ADDUSERSTOFOLDER";
    NewLine.Параметр    = "--readonly";
    NewLine.Описание    = "Prohibits file editing for the external user (optional, def. val. - True)";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetAsynchronousChangeStatus";
    NewLine.МетодПоиска = "GETASYNCHRONOUSCHANGESTATUS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Shared access settings";
    NewLine.ОписаниеМетода   = "Get async job status for access changes";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "GetAsynchronousChangeStatus";
    NewLine.МетодПоиска = "GETASYNCHRONOUSCHANGESTATUS";
    NewLine.Параметр    = "--job";
    NewLine.Описание    = "AsynchronousJobID";
    NewLine.Область     = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CancelFilePublication";
    NewLine.МетодПоиска = "CANCELFILEPUBLICATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Shared access settings";
    NewLine.ОписаниеМетода   = "Prohibits access to the file for external users";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "dropbox";
    NewLine.Модуль      = "OPI_Dropbox";
    NewLine.Метод       = "CancelFilePublication";
    NewLine.МетодПоиска = "CANCELFILEPUBLICATION";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "ID of the file to be accessed";
    NewLine.Область     = "Shared access settings";

    Return CompositionTable;
EndFunction

