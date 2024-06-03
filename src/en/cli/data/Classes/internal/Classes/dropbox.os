Функция ПолучитьСостав() Экспорт

    ТаблицаСостава = Новый ТаблицаЗначений();
    ТаблицаСостава.Колонки.Добавить("Библиотека");
    ТаблицаСостава.Колонки.Добавить("Модуль");
    ТаблицаСостава.Колонки.Добавить("Метод");
    ТаблицаСостава.Колонки.Добавить("МетодПоиска");
    ТаблицаСостава.Колонки.Добавить("Параметр");
    ТаблицаСостава.Колонки.Добавить("Описание");
    ТаблицаСостава.Колонки.Добавить("ОписаниеМетода");
    ТаблицаСостава.Колонки.Добавить("Область");

    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetAuthorizationLink";
    НоваяСтрока.МетодПоиска = "GETAUTHORIZATIONLINK";
    НоваяСтрока.Параметр    = "--appkey";
    НоваяСтрока.Описание    = "Application key";
    НоваяСтрока.Область     = "Account and authorization";
    НоваяСтрока.ОписаниеМетода   = "Generates an authorization link for browser transition";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetToken";
    НоваяСтрока.МетодПоиска = "GETTOKEN";
    НоваяСтрока.Параметр    = "--appkey";
    НоваяСтрока.Описание    = "Application key";
    НоваяСтрока.Область     = "Account and authorization";
    НоваяСтрока.ОписаниеМетода   = "Gets token based on the code from the GetAuthorizationLink page";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetToken";
    НоваяСтрока.МетодПоиска = "GETTOKEN";
    НоваяСтрока.Параметр    = "--appsecret";
    НоваяСтрока.Описание    = "Application secret";
    НоваяСтрока.Область     = "Account and authorization";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetToken";
    НоваяСтрока.МетодПоиска = "GETTOKEN";
    НоваяСтрока.Параметр    = "--code";
    НоваяСтрока.Описание    = "Code from the authorization page";
    НоваяСтрока.Область     = "Account and authorization";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "RefreshToken";
    НоваяСтрока.МетодПоиска = "REFRESHTOKEN";
    НоваяСтрока.Параметр    = "--appkey";
    НоваяСтрока.Описание    = "Application key";
    НоваяСтрока.Область     = "Account and authorization";
    НоваяСтрока.ОписаниеМетода   = "Gets a new token based on the refresh token";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "RefreshToken";
    НоваяСтрока.МетодПоиска = "REFRESHTOKEN";
    НоваяСтрока.Параметр    = "--appsecret";
    НоваяСтрока.Описание    = "Application secret";
    НоваяСтрока.Область     = "Account and authorization";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "RefreshToken";
    НоваяСтрока.МетодПоиска = "REFRESHTOKEN";
    НоваяСтрока.Параметр    = "--refresh";
    НоваяСтрока.Описание    = "Refresh token";
    НоваяСтрока.Область     = "Account and authorization";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetAccountInformation";
    НоваяСтрока.МетодПоиска = "GETACCOUNTINFORMATION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Account and authorization";
    НоваяСтрока.ОписаниеМетода   = "Gets account information";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetAccountInformation";
    НоваяСтрока.МетодПоиска = "GETACCOUNTINFORMATION";
    НоваяСтрока.Параметр    = "--account";
    НоваяСтрока.Описание    = "Account ID. Current token account if not filled (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Account and authorization";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetSpaceUsageData";
    НоваяСтрока.МетодПоиска = "GETSPACEUSAGEDATA";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Account and authorization";
    НоваяСтрока.ОписаниеМетода   = "Gets information on the amount of used disk space";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetObjectInformation";
    НоваяСтрока.МетодПоиска = "GETOBJECTINFORMATION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets information about a file or directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetObjectInformation";
    НоваяСтрока.МетодПоиска = "GETOBJECTINFORMATION";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetObjectInformation";
    НоваяСтрока.МетодПоиска = "GETOBJECTINFORMATION";
    НоваяСтрока.Параметр    = "--detail";
    НоваяСтрока.Описание    = "Adds additional information fields for media files (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetListOfFolderFiles";
    НоваяСтрока.МетодПоиска = "GETLISTOFFOLDERFILES";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets the list of the first files in the directory or continues getting the next ones when the cursor is specified";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetListOfFolderFiles";
    НоваяСтрока.МетодПоиска = "GETLISTOFFOLDERFILES";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the directory. Optional if the cursor is specified (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetListOfFolderFiles";
    НоваяСтрока.МетодПоиска = "GETLISTOFFOLDERFILES";
    НоваяСтрока.Параметр    = "--detail";
    НоваяСтрока.Описание    = "Adds additional information fields for media files (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetListOfFolderFiles";
    НоваяСтрока.МетодПоиска = "GETLISTOFFOLDERFILES";
    НоваяСтрока.Параметр    = "--cursor";
    НоваяСтрока.Описание    = "Cursor from the previous request to get the next set of files (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetPreview";
    НоваяСтрока.МетодПоиска = "GETPREVIEW";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets PDF or HTML preview of the object (for documents only)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetPreview";
    НоваяСтрока.МетодПоиска = "GETPREVIEW";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Uploads a file to the cloud drive";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--file";
    НоваяСтрока.Описание    = "Data file for upload";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Save path on Dropbox";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--overwrite";
    НоваяСтрока.Описание    = "Overwrite file in case of path conflicts (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "UploadFileByURL";
    НоваяСтрока.МетодПоиска = "UPLOADFILEBYURL";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Uploads a file to the cloud drive by fetching it from the specified URL";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "UploadFileByURL";
    НоваяСтрока.МетодПоиска = "UPLOADFILEBYURL";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "URL source of the file";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "UploadFileByURL";
    НоваяСтрока.МетодПоиска = "UPLOADFILEBYURL";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Save path on Dropbox";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetUploadStatusByURL";
    НоваяСтрока.МетодПоиска = "GETUPLOADSTATUSBYURL";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets the upload status of the file by URL";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetUploadStatusByURL";
    НоваяСтрока.МетодПоиска = "GETUPLOADSTATUSBYURL";
    НоваяСтрока.Параметр    = "--job";
    НоваяСтрока.Описание    = "ID of the asynchronous job from the UploadFileByURL response";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Deletes an object from the cloud drive";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object to delete";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--permanently";
    НоваяСтрока.Описание    = "Delete object without the possibility of recovery (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CopyObject";
    НоваяСтрока.МетодПоиска = "COPYOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Copies a file or directory to the selected path";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CopyObject";
    НоваяСтрока.МетодПоиска = "COPYOBJECT";
    НоваяСтрока.Параметр    = "--form";
    НоваяСтрока.Описание    = "Path to the original object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CopyObject";
    НоваяСтрока.МетодПоиска = "COPYOBJECT";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "Target path for the new object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "MoveObject";
    НоваяСтрока.МетодПоиска = "MOVEOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Moves an object to the selected path";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "MoveObject";
    НоваяСтрока.МетодПоиска = "MOVEOBJECT";
    НоваяСтрока.Параметр    = "--form";
    НоваяСтрока.Описание    = "Path to the original object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "MoveObject";
    НоваяСтрока.МетодПоиска = "MOVEOBJECT";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "Target path for the new object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CreateFolder";
    НоваяСтрока.МетодПоиска = "CREATEFOLDER";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Creates an empty directory at the selected path";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CreateFolder";
    НоваяСтрока.МетодПоиска = "CREATEFOLDER";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Target path for creating the directory";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Downloads a file by the specified path or ID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path or ID of the file";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DownloadFolder";
    НоваяСтрока.МетодПоиска = "DOWNLOADFOLDER";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Downloads a zip archive with the contents of the specified directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DownloadFolder";
    НоваяСтрока.МетодПоиска = "DOWNLOADFOLDER";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path or ID of the directory";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetObjectVersionList";
    НоваяСтрока.МетодПоиска = "GETOBJECTVERSIONLIST";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets the list of versions (revisions) of the object";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetObjectVersionList";
    НоваяСтрока.МетодПоиска = "GETOBJECTVERSIONLIST";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetObjectVersionList";
    НоваяСтрока.МетодПоиска = "GETOBJECTVERSIONLIST";
    НоваяСтрока.Параметр    = "--amount";
    НоваяСтрока.Описание    = "Number of the latest versions of the object to display (необяз. по ум. - 10)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "RestoreObjectToVersion";
    НоваяСтрока.МетодПоиска = "RESTOREOBJECTTOVERSION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Restores object state to required version (revision)";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "RestoreObjectToVersion";
    НоваяСтрока.МетодПоиска = "RESTOREOBJECTTOVERSION";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "RestoreObjectToVersion";
    НоваяСтрока.МетодПоиска = "RESTOREOBJECTTOVERSION";
    НоваяСтрока.Параметр    = "--rev";
    НоваяСтрока.Описание    = "ID of the version (revision) for restoration";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetTagList";
    НоваяСтрока.МетодПоиска = "GETTAGLIST";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Tag work";
    НоваяСтрока.ОписаниеМетода   = "Gets the list of tags of the selected files";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetTagList";
    НоваяСтрока.МетодПоиска = "GETTAGLIST";
    НоваяСтрока.Параметр    = "--paths";
    НоваяСтрока.Описание    = "Path or set of paths to the files";
    НоваяСтрока.Область     = "Tag work";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddTag";
    НоваяСтрока.МетодПоиска = "ADDTAG";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Tag work";
    НоваяСтрока.ОписаниеМетода   = "Adds a new text tag to a file or directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddTag";
    НоваяСтрока.МетодПоиска = "ADDTAG";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object for which the tag needs to be created";
    НоваяСтрока.Область     = "Tag work";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddTag";
    НоваяСтрока.МетодПоиска = "ADDTAG";
    НоваяСтрока.Параметр    = "--tag";
    НоваяСтрока.Описание    = "Tag text";
    НоваяСтрока.Область     = "Tag work";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DeleteTag";
    НоваяСтрока.МетодПоиска = "DELETETAG";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Tag work";
    НоваяСтрока.ОписаниеМетода   = "Deletes the text tag of a file or directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DeleteTag";
    НоваяСтрока.МетодПоиска = "DELETETAG";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object whose tag needs to be deleted";
    НоваяСтрока.Область     = "Tag work";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "DeleteTag";
    НоваяСтрока.МетодПоиска = "DELETETAG";
    НоваяСтрока.Параметр    = "--tag";
    НоваяСтрока.Описание    = "Tag text";
    НоваяСтрока.Область     = "Tag work";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "PublishFolder";
    НоваяСтрока.МетодПоиска = "PUBLISHFOLDER";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Shared access settings";
    НоваяСтрока.ОписаниеМетода   = "Sets the directory to public access mode";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "PublishFolder";
    НоваяСтрока.МетодПоиска = "PUBLISHFOLDER";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the target directory";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CancelFolderPublication";
    НоваяСтрока.МетодПоиска = "CANCELFOLDERPUBLICATION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Shared access settings";
    НоваяСтрока.ОписаниеМетода   = "Cancels the public access mode for the directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CancelFolderPublication";
    НоваяСтрока.МетодПоиска = "CANCELFOLDERPUBLICATION";
    НоваяСтрока.Параметр    = "--folder";
    НоваяСтрока.Описание    = "ID of the public catalog (shared folder ID)";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFile";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Shared access settings";
    НоваяСтрока.ОписаниеМетода   = "Defines access to the file for an external user";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFile";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFILE";
    НоваяСтрока.Параметр    = "--fileid";
    НоваяСтрока.Описание    = "ID of the file to be accessed";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFile";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFILE";
    НоваяСтрока.Параметр    = "--emails";
    НоваяСтрока.Описание    = "List of email addresses of users being added";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFile";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFILE";
    НоваяСтрока.Параметр    = "--readonly";
    НоваяСтрока.Описание    = "Prohibits file editing for the external user (необяз. по ум. - Да)";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFolder";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFOLDER";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Shared access settings";
    НоваяСтрока.ОписаниеМетода   = "Grants external users access to the directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFolder";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFOLDER";
    НоваяСтрока.Параметр    = "--folder";
    НоваяСтрока.Описание    = "ID of the public catalog (shared folder ID)";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFolder";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFOLDER";
    НоваяСтрока.Параметр    = "--emails";
    НоваяСтрока.Описание    = "List of email addresses of users being added";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "AddUsersToFolder";
    НоваяСтрока.МетодПоиска = "ADDUSERSTOFOLDER";
    НоваяСтрока.Параметр    = "--readonly";
    НоваяСтрока.Описание    = "Prohibits file editing for the external user (необяз. по ум. - Да)";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetAsynchronousChangeStatus";
    НоваяСтрока.МетодПоиска = "GETASYNCHRONOUSCHANGESTATUS";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Shared access settings";
    НоваяСтрока.ОписаниеМетода   = "Gets the status of the asynchronous access change job";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "GetAsynchronousChangeStatus";
    НоваяСтрока.МетодПоиска = "GETASYNCHRONOUSCHANGESTATUS";
    НоваяСтрока.Параметр    = "--job";
    НоваяСтрока.Описание    = "AsynchronousJobID";
    НоваяСтрока.Область     = "Shared access settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CancelFilePublication";
    НоваяСтрока.МетодПоиска = "CANCELFILEPUBLICATION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Shared access settings";
    НоваяСтрока.ОписаниеМетода   = "Prohibits access to the file for external users";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "dropbox";
    НоваяСтрока.Модуль      = "OPI_Dropbox";
    НоваяСтрока.Метод       = "CancelFilePublication";
    НоваяСтрока.МетодПоиска = "CANCELFILEPUBLICATION";
    НоваяСтрока.Параметр    = "--fileid";
    НоваяСтрока.Описание    = "ID of the file to be accessed";
    НоваяСтрока.Область     = "Shared access settings";

    Возврат ТаблицаСостава;
КонецФункции

