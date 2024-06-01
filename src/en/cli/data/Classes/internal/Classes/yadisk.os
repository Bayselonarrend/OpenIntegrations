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
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetDiskInformation";
    НоваяСтрока.МетодПоиска = "GETDISKINFORMATION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Gets information about the current disk";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CreateFolder";
    НоваяСтрока.МетодПоиска = "CREATEFOLDER";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Creates a directory on the disk";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CreateFolder";
    НоваяСтрока.МетодПоиска = "CREATEFOLDER";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the created folder";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetObject";
    НоваяСтрока.МетодПоиска = "GETOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Gets information about a disk object at the specified path";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetObject";
    НоваяСтрока.МетодПоиска = "GETOBJECT";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to folder or file";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Deletes an object at the specified path";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the folder or file to be deleted";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--can";
    НоваяСтрока.Описание    = "To cart (необяз. по ум. - Да)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CreateObjectCopy";
    НоваяСтрока.МетодПоиска = "CREATEOBJECTCOPY";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Creates a copy of the object at the specified path and path to the original";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CreateObjectCopy";
    НоваяСтрока.МетодПоиска = "CREATEOBJECTCOPY";
    НоваяСтрока.Параметр    = "--from";
    НоваяСтрока.Описание    = "Path to the original file or directory";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CreateObjectCopy";
    НоваяСтрока.МетодПоиска = "CREATEOBJECTCOPY";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "Destination path for the copy";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CreateObjectCopy";
    НоваяСтрока.МетодПоиска = "CREATEOBJECTCOPY";
    НоваяСтрока.Параметр    = "--rewrite";
    НоваяСтрока.Описание    = "Overwrite if a file with the same name already exists (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetDownloadLink";
    НоваяСтрока.МетодПоиска = "GETDOWNLOADLINK";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Gets a download link for the file";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetDownloadLink";
    НоваяСтрока.МетодПоиска = "GETDOWNLOADLINK";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the file for downloading";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Downloads a file at the specified path";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the file for downloading";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--out";
    НоваяСтрока.Описание    = "File save path (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Gets a list of files with or without filtering by type
    |    List of available types: audio, backup, book, compressed, data, development, 
    |    diskimage, document, encoded, executable, flash, font, 
    |    mage, settings, spreadsheet, text, unknown, video, web";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--amount";
    НоваяСтрока.Описание    = "Number of returned objects (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Offset for getting objects not from the beginning of the list (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--type";
    НоваяСтрока.Описание    = "Filter by file type (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--datesort";
    НоваяСтрока.Описание    = "True > sort by date, False > alphabetically (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "MoveObject";
    НоваяСтрока.МетодПоиска = "MOVEOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Moves the object to the specified path and path to the original";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "MoveObject";
    НоваяСтрока.МетодПоиска = "MOVEOBJECT";
    НоваяСтрока.Параметр    = "--from";
    НоваяСтрока.Описание    = "Path to the original file or folder";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "MoveObject";
    НоваяСтрока.МетодПоиска = "MOVEOBJECT";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "Destination path for moving";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "MoveObject";
    НоваяСтрока.МетодПоиска = "MOVEOBJECT";
    НоваяСтрока.Параметр    = "--rewrite";
    НоваяСтрока.Описание    = "Overwrite if a file with the same name already exists (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Uploads a file to disk at the specified path";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path for saving the file to disk";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--file";
    НоваяСтрока.Описание    = "File for upload";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--rewrite";
    НоваяСтрока.Описание    = "Overwrite if a file with the same name already exists (необяз. по ум. - Нет)";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "UploadFileByURL";
    НоваяСтрока.МетодПоиска = "UPLOADFILEBYURL";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and folder management";
    НоваяСтрока.ОписаниеМетода   = "Downloads a file to disk from the specified URL";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "UploadFileByURL";
    НоваяСтрока.МетодПоиска = "UPLOADFILEBYURL";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to place the downloaded file";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "UploadFileByURL";
    НоваяСтрока.МетодПоиска = "UPLOADFILEBYURL";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "File URL";
    НоваяСтрока.Область     = "File and folder management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "PublishObject";
    НоваяСтрока.МетодПоиска = "PUBLISHOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Manage public access";
    НоваяСтрока.ОписаниеМетода   = "Publishes the disk object for public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "PublishObject";
    НоваяСтрока.МетодПоиска = "PUBLISHOBJECT";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the object to be published";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CancelObjectPublication";
    НоваяСтрока.МетодПоиска = "CANCELOBJECTPUBLICATION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Manage public access";
    НоваяСтрока.ОписаниеМетода   = "Unpublishes a previously published object";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "CancelObjectPublication";
    НоваяСтрока.МетодПоиска = "CANCELOBJECTPUBLICATION";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path to the previously published object";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetPublishedObjectsList";
    НоваяСтрока.МетодПоиска = "GETPUBLISHEDOBJECTSLIST";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Manage public access";
    НоваяСтрока.ОписаниеМетода   = "Gets a list of published objects";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetPublishedObjectsList";
    НоваяСтрока.МетодПоиска = "GETPUBLISHEDOBJECTSLIST";
    НоваяСтрока.Параметр    = "--amount";
    НоваяСтрока.Описание    = "Number of returned objects (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetPublishedObjectsList";
    НоваяСтрока.МетодПоиска = "GETPUBLISHEDOBJECTSLIST";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Offset for getting objects not from the beginning of the list (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetPublicObject";
    НоваяСтрока.МетодПоиска = "GETPUBLICOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Manage public access";
    НоваяСтрока.ОписаниеМетода   = "Gets information about the published object by its URL";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetPublicObject";
    НоваяСтрока.МетодПоиска = "GETPUBLICOBJECT";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "Object address";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetPublicObject";
    НоваяСтрока.МетодПоиска = "GETPUBLICOBJECT";
    НоваяСтрока.Параметр    = "--amount";
    НоваяСтрока.Описание    = "Number of returned nested objects (for catalog) (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetPublicObject";
    НоваяСтрока.МетодПоиска = "GETPUBLICOBJECT";
    НоваяСтрока.Параметр    = "--offset";
    НоваяСтрока.Описание    = "Offset for getting nested objects not from the beginning of the list (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetDownloadLinkForPublicObject";
    НоваяСтрока.МетодПоиска = "GETDOWNLOADLINKFORPUBLICOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Manage public access";
    НоваяСтрока.ОписаниеМетода   = "Gets a direct link to download the public object";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetDownloadLinkForPublicObject";
    НоваяСтрока.МетодПоиска = "GETDOWNLOADLINKFORPUBLICOBJECT";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "Object address";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "GetDownloadLinkForPublicObject";
    НоваяСтрока.МетодПоиска = "GETDOWNLOADLINKFORPUBLICOBJECT";
    НоваяСтрока.Параметр    = "--path";
    НоваяСтрока.Описание    = "Path inside the object (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "SavePublicObjectToDisk";
    НоваяСтрока.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Manage public access";
    НоваяСтрока.ОписаниеМетода   = "Saves the public object to your disk";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "SavePublicObjectToDisk";
    НоваяСтрока.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    НоваяСтрока.Параметр    = "--url";
    НоваяСтрока.Описание    = "Object address";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "SavePublicObjectToDisk";
    НоваяСтрока.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    НоваяСтрока.Параметр    = "--from";
    НоваяСтрока.Описание    = "Path within public catalog (folders only) (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Manage public access";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "yadisk";
    НоваяСтрока.Модуль      = "OPI_YandexDisk";
    НоваяСтрока.Метод       = "SavePublicObjectToDisk";
    НоваяСтрока.МетодПоиска = "SAVEPUBLICOBJECTTODISK";
    НоваяСтрока.Параметр    = "--to";
    НоваяСтрока.Описание    = "File save path (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Manage public access";

    Возврат ТаблицаСостава;
КонецФункции

