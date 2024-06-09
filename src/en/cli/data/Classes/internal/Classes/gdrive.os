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
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetObjectInformation";
    NewLine.МетодПоиска = "GETOBJECTINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets information about a folder or file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetObjectInformation";
    NewLine.МетодПоиска = "GETOBJECTINFORMATION";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Identifier of the file or folder";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetDirectoriesList";
    NewLine.МетодПоиска = "GETDIRECTORIESLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets the list of drive directories";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetDirectoriesList";
    NewLine.МетодПоиска = "GETDIRECTORIESLIST";
    NewLine.Параметр    = "--querry";
    NewLine.Описание    = "Filter by name (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetDirectoriesList";
    NewLine.МетодПоиска = "GETDIRECTORIESLIST";
    NewLine.Параметр    = "--depth";
    NewLine.Описание    = "Adds a list of files to the directory fields (optional, def. val. - False)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets the list of files";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--querry";
    NewLine.Описание    = "Filter by name (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--catalog";
    NewLine.Описание    = "Filter by parent directory ID (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Uploads a file to the drive
    |
    |    The structure of the JSON object data (parameter --props):
    |    {
    |     ""MIME""        : ""image/jpeg"",
    |     ""Name""         : ""New file.jpg"",
    |     ""Description""    : ""This is a new file"",
    |     ""Parent""    : ""root""
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File to be uploaded";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--props";
    NewLine.Описание    = "JSON description or path to .json";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CreateFolder";
    NewLine.МетодПоиска = "CREATEFOLDER";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Creates an empty directory on the drive";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CreateFolder";
    NewLine.МетодПоиска = "CREATEFOLDER";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Folder name";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CreateFolder";
    NewLine.МетодПоиска = "CREATEFOLDER";
    NewLine.Параметр    = "--catalog";
    NewLine.Описание    = "Parent (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Gets file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--out";
    NewLine.Описание    = "File save path (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Copies file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Object identifier";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New object name (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CopyObject";
    NewLine.МетодПоиска = "COPYOBJECT";
    NewLine.Параметр    = "--catalog";
    NewLine.Описание    = "New parent directory (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "UpdateFile";
    NewLine.МетодПоиска = "UPDATEFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Updates file binary data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "UpdateFile";
    NewLine.МетодПоиска = "UPDATEFILE";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Identifier of the object to update";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "UpdateFile";
    NewLine.МетодПоиска = "UPDATEFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File source for update";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "UpdateFile";
    NewLine.МетодПоиска = "UPDATEFILE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New file name (if necessary) (optional, def. val. - Empty)";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "File and directory management";
    NewLine.ОписаниеМетода   = "Deletes file or directory by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DeleteObject";
    NewLine.МетодПоиска = "DELETEOBJECT";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Identifier of the object to delete";
    NewLine.Область     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Creates a comment for a file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Identifier of the object that needs a comment";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "CreateComment";
    NewLine.МетодПоиска = "CREATECOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetComment";
    NewLine.МетодПоиска = "GETCOMMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Gets comment by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetComment";
    NewLine.МетодПоиска = "GETCOMMENT";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Identifier of the file or directory where the comment is located";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetComment";
    NewLine.МетодПоиска = "GETCOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "Comment identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetCommentList";
    NewLine.МетодПоиска = "GETCOMMENTLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Gets the list of all comments of the object";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "GetCommentList";
    NewLine.МетодПоиска = "GETCOMMENTLIST";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Object identifier";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Comment management";
    NewLine.ОписаниеМетода   = "Deletes comment by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--object";
    NewLine.Описание    = "Identifier of the file or directory where the comment is located";
    NewLine.Область     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "gdrive";
    NewLine.Модуль      = "OPI_GoogleDrive";
    NewLine.Метод       = "DeleteComment";
    NewLine.МетодПоиска = "DELETECOMMENT";
    NewLine.Параметр    = "--comment";
    NewLine.Описание    = "Comment identifier";
    NewLine.Область     = "Comment management";

    Return CompositionTable;
EndFunction

