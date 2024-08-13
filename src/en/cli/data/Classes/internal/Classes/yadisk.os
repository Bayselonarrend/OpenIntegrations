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
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetDiskInformation";
    NewLine.МетодПоиска = "GETDISKINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Gets information about the current disk";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CreateFolder";
    NewLine.МетодПоиска = "CREATEFOLDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Creates a directory on the disk";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CreateFolder";
    NewLine.МетодПоиска = "CREATEFOLDER";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the created folder";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Gets information about a disk object at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetObject";
    NewLine.МетодПоиска = "GETOBJECT";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to folder or file";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Deletes an object at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the folder or file to be deleted";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--can";
    NewLine.Описание    = "To cart (optional, def. val. - Yes)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CreateObjectCopy";
    NewLine.МетодПоиска = "CREATEOBJECTCOPY";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Creates a copy of the object at the specified path and path to the original";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CreateObjectCopy";
    NewLine.МетодПоиска = "CREATEOBJECTCOPY";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "Path to the original file or directory";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CreateObjectCopy";
    NewLine.МетодПоиска = "CREATEOBJECTCOPY";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "Destination path for the copy";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CreateObjectCopy";
    NewLine.МетодПоиска = "CREATEOBJECTCOPY";
    NewLine.Параметр    = "--rewrite";
    NewLine.Описание    = "Overwrite if a file with the same name already exists (optional, def. val. - No)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetDownloadLink";
    NewLine.МетодПоиска = "GETDOWNLOADLINK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Gets a download link for the file";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetDownloadLink";
    NewLine.МетодПоиска = "GETDOWNLOADLINK";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the file for downloading";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Downloads a file at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the file for downloading";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--out";
    NewLine.Описание    = "File save path (optional, def. val. - Empty value)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Gets a list of files with or without filtering by type
    |    List of available types: audio, backup, book, compressed, data, development,
    |    diskimage, document, encoded, executable, flash, font,
    |    mage, settings, spreadsheet, text, unknown, video, web";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--amount";
    NewLine.Описание    = "Number of returned objects (optional, def. val. - Empty value)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Offset for getting objects not from the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--type";
    NewLine.Описание    = "Filter by file type (optional, def. val. - Empty value)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--datesort";
    NewLine.Описание    = "True > sort by date, False > alphabetically (optional, def. val. - No)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "MoveObject";
    NewLine.МетодПоиска = "MOVEOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Moves the object to the specified path and path to the original";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "MoveObject";
    NewLine.МетодПоиска = "MOVEOBJECT";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "Path to the original file or folder";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "MoveObject";
    NewLine.МетодПоиска = "MOVEOBJECT";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "Destination path for moving";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "MoveObject";
    NewLine.МетодПоиска = "MOVEOBJECT";
    NewLine.Параметр    = "--rewrite";
    NewLine.Описание    = "Overwrite if a file with the same name already exists (optional, def. val. - No)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Uploads a file to disk at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path for saving the file to disk";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File for upload";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--rewrite";
    NewLine.Описание    = "Overwrite if a file with the same name already exists (optional, def. val. - No)";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "UploadFileByURL";
    NewLine.МетодПоиска = "UPLOADFILEBYURL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and folder management";
    NewLine.ОписаниеМетода   = "Downloads a file to disk from the specified URL";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "UploadFileByURL";
    NewLine.МетодПоиска = "UPLOADFILEBYURL";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to place the downloaded file";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "UploadFileByURL";
    NewLine.МетодПоиска = "UPLOADFILEBYURL";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "File URL";
    NewLine.Область     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "PublishObject";
    NewLine.МетодПоиска = "PUBLISHOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Manage public access";
    NewLine.ОписаниеМетода   = "Publishes the disk object for public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "PublishObject";
    NewLine.МетодПоиска = "PUBLISHOBJECT";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the object to be published";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CancelObjectPublication";
    NewLine.МетодПоиска = "CANCELOBJECTPUBLICATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Manage public access";
    NewLine.ОписаниеМетода   = "Unpublishes a previously published object";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "CancelObjectPublication";
    NewLine.МетодПоиска = "CANCELOBJECTPUBLICATION";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path to the previously published object";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetPublishedObjectsList";
    NewLine.МетодПоиска = "GETPUBLISHEDOBJECTSLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Manage public access";
    NewLine.ОписаниеМетода   = "Gets a list of published objects";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetPublishedObjectsList";
    NewLine.МетодПоиска = "GETPUBLISHEDOBJECTSLIST";
    NewLine.Параметр    = "--amount";
    NewLine.Описание    = "Number of returned objects (optional, def. val. - Empty value)";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetPublishedObjectsList";
    NewLine.МетодПоиска = "GETPUBLISHEDOBJECTSLIST";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Offset for getting objects not from the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetPublicObject";
    NewLine.МетодПоиска = "GETPUBLICOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Manage public access";
    NewLine.ОписаниеМетода   = "Gets information about the published object by its URL";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetPublicObject";
    NewLine.МетодПоиска = "GETPUBLICOBJECT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Object address";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetPublicObject";
    NewLine.МетодПоиска = "GETPUBLICOBJECT";
    NewLine.Параметр    = "--amount";
    NewLine.Описание    = "Number of returned nested objects (for catalog) (optional, def. val. - Empty value)";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetPublicObject";
    NewLine.МетодПоиска = "GETPUBLICOBJECT";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Offset for getting nested objects not from the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetDownloadLinkForPublicObject";
    NewLine.МетодПоиска = "GETDOWNLOADLINKFORPUBLICOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Manage public access";
    NewLine.ОписаниеМетода   = "Gets a direct link to download the public object";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetDownloadLinkForPublicObject";
    NewLine.МетодПоиска = "GETDOWNLOADLINKFORPUBLICOBJECT";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Object address";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "GetDownloadLinkForPublicObject";
    NewLine.МетодПоиска = "GETDOWNLOADLINKFORPUBLICOBJECT";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Path inside the object (optional, def. val. - Empty value)";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "SavePublicObjectToDisk";
    NewLine.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Manage public access";
    NewLine.ОписаниеМетода   = "Saves the public object to your disk";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "SavePublicObjectToDisk";
    NewLine.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Object address";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "SavePublicObjectToDisk";
    NewLine.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "Path within public catalog (folders only) (optional, def. val. - Empty value)";
    NewLine.Область     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "yadisk";
    NewLine.Модуль      = "OPI_YandexDisk";
    NewLine.Метод       = "SavePublicObjectToDisk";
    NewLine.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "File save path (optional, def. val. - Empty value)";
    NewLine.Область     = "Manage public access";

    Return CompositionTable;
EndFunction

