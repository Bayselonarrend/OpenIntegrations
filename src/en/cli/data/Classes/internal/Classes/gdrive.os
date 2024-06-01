﻿Функция ПолучитьСостав() Экспорт

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
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetObjectInformation";
    НоваяСтрока.МетодПоиска = "GETOBJECTINFORMATION";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets information about a folder or file by ID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetObjectInformation";
    НоваяСтрока.МетодПоиска = "GETOBJECTINFORMATION";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Identifier of the file or folder";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetDirectoriesList";
    НоваяСтрока.МетодПоиска = "GETDIRECTORIESLIST";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets the list of drive directories";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetDirectoriesList";
    НоваяСтрока.МетодПоиска = "GETDIRECTORIESLIST";
    НоваяСтрока.Параметр    = "--querry";
    НоваяСтрока.Описание    = "Filter by name (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetDirectoriesList";
    НоваяСтрока.МетодПоиска = "GETDIRECTORIESLIST";
    НоваяСтрока.Параметр    = "--depth";
    НоваяСтрока.Описание    = "Adds a list of files to the directory fields (необяз. по ум. - False)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets the list of files";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--querry";
    НоваяСтрока.Описание    = "Filter by name (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetFilesList";
    НоваяСтрока.МетодПоиска = "GETFILESLIST";
    НоваяСтрока.Параметр    = "--catalog";
    НоваяСтрока.Описание    = "Filter by parent directory ID (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Uploads a file to the drive";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--file";
    НоваяСтрока.Описание    = "File to be uploaded";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "UploadFile";
    НоваяСтрока.МетодПоиска = "UPLOADFILE";
    НоваяСтрока.Параметр    = "--See GetFileDescription";
    НоваяСтрока.Описание    = "props";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CreateFolder";
    НоваяСтрока.МетодПоиска = "CREATEFOLDER";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Creates an empty directory on the drive";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CreateFolder";
    НоваяСтрока.МетодПоиска = "CREATEFOLDER";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "Folder name";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CreateFolder";
    НоваяСтрока.МетодПоиска = "CREATEFOLDER";
    НоваяСтрока.Параметр    = "--catalog";
    НоваяСтрока.Описание    = "Parent (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Gets file by ID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "File identifier";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DownloadFile";
    НоваяСтрока.МетодПоиска = "DOWNLOADFILE";
    НоваяСтрока.Параметр    = "--out";
    НоваяСтрока.Описание    = "File save path (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CopyObject";
    НоваяСтрока.МетодПоиска = "COPYOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Copies file or directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CopyObject";
    НоваяСтрока.МетодПоиска = "COPYOBJECT";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Object identifier";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CopyObject";
    НоваяСтрока.МетодПоиска = "COPYOBJECT";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "New object name (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CopyObject";
    НоваяСтрока.МетодПоиска = "COPYOBJECT";
    НоваяСтрока.Параметр    = "--catalog";
    НоваяСтрока.Описание    = "New parent directory (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "UpdateFile";
    НоваяСтрока.МетодПоиска = "UPDATEFILE";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Updates file binary data";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "UpdateFile";
    НоваяСтрока.МетодПоиска = "UPDATEFILE";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Identifier of the object to update";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "UpdateFile";
    НоваяСтрока.МетодПоиска = "UPDATEFILE";
    НоваяСтрока.Параметр    = "--file";
    НоваяСтрока.Описание    = "File source for update";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "UpdateFile";
    НоваяСтрока.МетодПоиска = "UPDATEFILE";
    НоваяСтрока.Параметр    = "--title";
    НоваяСтрока.Описание    = "New file name (if necessary) (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "File and directory management";
    НоваяСтрока.ОписаниеМетода   = "Deletes file or directory by ID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DeleteObject";
    НоваяСтрока.МетодПоиска = "DELETEOBJECT";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Identifier of the object to delete";
    НоваяСтрока.Область     = "File and directory management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CreateComment";
    НоваяСтрока.МетодПоиска = "CREATECOMMENT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Comment management";
    НоваяСтрока.ОписаниеМетода   = "Creates a comment for a file or directory";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CreateComment";
    НоваяСтрока.МетодПоиска = "CREATECOMMENT";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Identifier of the object that needs a comment";
    НоваяСтрока.Область     = "Comment management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "CreateComment";
    НоваяСтрока.МетодПоиска = "CREATECOMMENT";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Comment text";
    НоваяСтрока.Область     = "Comment management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetComment";
    НоваяСтрока.МетодПоиска = "GETCOMMENT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Comment management";
    НоваяСтрока.ОписаниеМетода   = "Gets comment by ID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetComment";
    НоваяСтрока.МетодПоиска = "GETCOMMENT";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Identifier of the file or directory where the comment is located";
    НоваяСтрока.Область     = "Comment management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetComment";
    НоваяСтрока.МетодПоиска = "GETCOMMENT";
    НоваяСтрока.Параметр    = "--comment";
    НоваяСтрока.Описание    = "Comment identifier";
    НоваяСтрока.Область     = "Comment management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetCommentList";
    НоваяСтрока.МетодПоиска = "GETCOMMENTLIST";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Comment management";
    НоваяСтрока.ОписаниеМетода   = "Gets the list of all comments of the object";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "GetCommentList";
    НоваяСтрока.МетодПоиска = "GETCOMMENTLIST";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Object identifier";
    НоваяСтрока.Область     = "Comment management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DeleteComment";
    НоваяСтрока.МетодПоиска = "DELETECOMMENT";
    НоваяСтрока.Параметр    = "--token";
    НоваяСтрока.Описание    = "Token";
    НоваяСтрока.Область     = "Comment management";
    НоваяСтрока.ОписаниеМетода   = "Deletes comment by ID";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DeleteComment";
    НоваяСтрока.МетодПоиска = "DELETECOMMENT";
    НоваяСтрока.Параметр    = "--object";
    НоваяСтрока.Описание    = "Identifier of the file or directory where the comment is located";
    НоваяСтрока.Область     = "Comment management";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "gdrive";
    НоваяСтрока.Модуль      = "OPI_GoogleDrive";
    НоваяСтрока.Метод       = "DeleteComment";
    НоваяСтрока.МетодПоиска = "DELETECOMMENT";
    НоваяСтрока.Параметр    = "--comment";
    НоваяСтрока.Описание    = "Comment identifier";
    НоваяСтрока.Область     = "Comment management";

    Возврат ТаблицаСостава;
КонецФункции

