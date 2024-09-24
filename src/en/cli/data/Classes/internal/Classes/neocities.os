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
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "GetSiteData";
    NewLine.МетодПоиска = "GETSITEDATA";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "Data retrieving";
    NewLine.ОписаниеМетода   = "Gets information about a site by its name or token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "GetSiteData";
    NewLine.МетодПоиска = "GETSITEDATA";
    NewLine.Параметр    = "--sitename";
    NewLine.Описание    = "Site name (login) for information. Current, if not filled in (optional, def. val. - Empty value)";
    NewLine.Область     = "Data retrieving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--login";
    NewLine.Описание    = "Users login";
    NewLine.Область     = "Data retrieving";
    NewLine.ОписаниеМетода   = "Receives authorization token by login and password";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--password";
    NewLine.Описание    = "Users password";
    NewLine.Область     = "Data retrieving";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Upload single file to Neocities";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "File path on Neocities";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "URL, path or file data";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "UploadFiles";
    NewLine.МетодПоиска = "UPLOADFILES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Uploads multiple files to Neocities";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "UploadFiles";
    NewLine.МетодПоиска = "UPLOADFILES";
    NewLine.Параметр    = "--files";
    NewLine.Описание    = "Files: Key > destination path on NC, Value > file";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "UploadFiles";
    NewLine.МетодПоиска = "UPLOADFILES";
    NewLine.Параметр    = "--singly";
    NewLine.Описание    = "True > sends files in separate requests (optional, def. val. - No)";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "DeleteSelectedFiles";
    NewLine.МетодПоиска = "DELETESELECTEDFILES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Deletes a file or multiple files from Neocities";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "DeleteSelectedFiles";
    NewLine.МетодПоиска = "DELETESELECTEDFILES";
    NewLine.Параметр    = "--paths";
    NewLine.Описание    = "Path or multiple paths of the files to be deleted";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Gets a list of files with or without directory selection";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--path";
    NewLine.Описание    = "Selection of files by catalog. All if not filled in (optional, def. val. - Empty value)";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "SynchronizeFolders";
    NewLine.МетодПоиска = "SYNCHRONIZEFOLDERS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Auth token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Creates a copy of the local directory at the selected path on the Neocities server";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "SynchronizeFolders";
    NewLine.МетодПоиска = "SYNCHRONIZEFOLDERS";
    NewLine.Параметр    = "--local";
    NewLine.Описание    = "Local source catalog";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "neocities";
    NewLine.Модуль      = "OPI_Neocities";
    NewLine.Метод       = "SynchronizeFolders";
    NewLine.МетодПоиска = "SYNCHRONIZEFOLDERS";
    NewLine.Параметр    = "--remote";
    NewLine.Описание    = "Remote receiver catalog. Root by default (optional, def. val. - Empty value)";
    NewLine.Область     = "File managment";

    Return CompositionTable;
EndFunction

