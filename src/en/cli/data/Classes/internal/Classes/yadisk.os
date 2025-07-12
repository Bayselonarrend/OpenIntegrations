﻿
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
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetDiskInformation";
    NewLine.SearchMethod = "GETDISKINFORMATION";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Gets information about the current disk";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CreateFolder";
    NewLine.SearchMethod = "CREATEFOLDER";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Creates a directory on the disk";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CreateFolder";
    NewLine.SearchMethod = "CREATEFOLDER";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to the created folder";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetObject";
    NewLine.SearchMethod = "GETOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Gets information about a disk object at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetObject";
    NewLine.SearchMethod = "GETOBJECT";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to folder or file";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "DeleteObject";
    NewLine.SearchMethod = "DELETEOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Deletes an object at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "DeleteObject";
    NewLine.SearchMethod = "DELETEOBJECT";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to the folder or file to be deleted";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "DeleteObject";
    NewLine.SearchMethod = "DELETEOBJECT";
    NewLine.Parameter    = "--can";
    NewLine.Description    = "To cart (optional, def. val. - True)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CreateObjectCopy";
    NewLine.SearchMethod = "CREATEOBJECTCOPY";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Creates a copy of the object at the specified path and path to the original";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CreateObjectCopy";
    NewLine.SearchMethod = "CREATEOBJECTCOPY";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "Path to the original file or directory";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CreateObjectCopy";
    NewLine.SearchMethod = "CREATEOBJECTCOPY";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "Destination path for the copy";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CreateObjectCopy";
    NewLine.SearchMethod = "CREATEOBJECTCOPY";
    NewLine.Parameter    = "--rewrite";
    NewLine.Description    = "Overwrite if a file with the same name already exists (optional, def. val. - False)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetDownloadLink";
    NewLine.SearchMethod = "GETDOWNLOADLINK";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Gets a download link for the file";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetDownloadLink";
    NewLine.SearchMethod = "GETDOWNLOADLINK";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to the file for downloading";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Downloads a file at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to the file for downloading";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--out";
    NewLine.Description    = "File save path (optional, def. val. - Empty value)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Gets a list of files with or without filtering by type
    |    List of available types: audio, backup, book, compressed, data, development,
    |    diskimage, document, encoded, executable, flash, font,
    |    mage, settings, spreadsheet, text, unknown, video, web";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--amount";
    NewLine.Description    = "Number of returned objects (optional, def. val. - Empty value)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--offset";
    NewLine.Description    = "Offset for getting objects not from the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Filter by file type (optional, def. val. - Empty value)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--datesort";
    NewLine.Description    = "True > sort by date, False > alphabetically (optional, def. val. - False)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "MoveObject";
    NewLine.SearchMethod = "MOVEOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Moves the object to the specified path and path to the original";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "MoveObject";
    NewLine.SearchMethod = "MOVEOBJECT";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "Path to the original file or folder";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "MoveObject";
    NewLine.SearchMethod = "MOVEOBJECT";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "Destination path for moving";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "MoveObject";
    NewLine.SearchMethod = "MOVEOBJECT";
    NewLine.Parameter    = "--rewrite";
    NewLine.Description    = "Overwrite if a file with the same name already exists (optional, def. val. - False)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Uploads a file to disk at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path for saving the file to disk";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--file";
    NewLine.Description    = "File for upload";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--rewrite";
    NewLine.Description    = "Overwrite if a file with the same name already exists (optional, def. val. - False)";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "UploadFileByURL";
    NewLine.SearchMethod = "UPLOADFILEBYURL";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and folder management";
    NewLine.MethodDescription   = "Downloads a file to disk from the specified URL";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "UploadFileByURL";
    NewLine.SearchMethod = "UPLOADFILEBYURL";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to place the downloaded file";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "UploadFileByURL";
    NewLine.SearchMethod = "UPLOADFILEBYURL";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "File URL";
    NewLine.Region     = "File and folder management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "PublishObject";
    NewLine.SearchMethod = "PUBLISHOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Manage public access";
    NewLine.MethodDescription   = "Publishes the disk object for public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "PublishObject";
    NewLine.SearchMethod = "PUBLISHOBJECT";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to the object to be published";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CancelObjectPublication";
    NewLine.SearchMethod = "CANCELOBJECTPUBLICATION";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Manage public access";
    NewLine.MethodDescription   = "Unpublishes a previously published object";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "CancelObjectPublication";
    NewLine.SearchMethod = "CANCELOBJECTPUBLICATION";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to the previously published object";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetPublishedObjectsList";
    NewLine.SearchMethod = "GETPUBLISHEDOBJECTSLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Manage public access";
    NewLine.MethodDescription   = "Gets a list of published objects";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetPublishedObjectsList";
    NewLine.SearchMethod = "GETPUBLISHEDOBJECTSLIST";
    NewLine.Parameter    = "--amount";
    NewLine.Description    = "Number of returned objects (optional, def. val. - Empty value)";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetPublishedObjectsList";
    NewLine.SearchMethod = "GETPUBLISHEDOBJECTSLIST";
    NewLine.Parameter    = "--offset";
    NewLine.Description    = "Offset for getting objects not from the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetPublicObject";
    NewLine.SearchMethod = "GETPUBLICOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Manage public access";
    NewLine.MethodDescription   = "Gets information about the published object by its URL";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetPublicObject";
    NewLine.SearchMethod = "GETPUBLICOBJECT";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Object address";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetPublicObject";
    NewLine.SearchMethod = "GETPUBLICOBJECT";
    NewLine.Parameter    = "--amount";
    NewLine.Description    = "Number of returned nested objects (for catalog) (optional, def. val. - Empty value)";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetPublicObject";
    NewLine.SearchMethod = "GETPUBLICOBJECT";
    NewLine.Parameter    = "--offset";
    NewLine.Description    = "Offset for getting nested objects not from the beginning of the list (optional, def. val. - Empty value)";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetDownloadLinkForPublicObject";
    NewLine.SearchMethod = "GETDOWNLOADLINKFORPUBLICOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Manage public access";
    NewLine.MethodDescription   = "Gets a direct link to download the public object";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetDownloadLinkForPublicObject";
    NewLine.SearchMethod = "GETDOWNLOADLINKFORPUBLICOBJECT";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Object address";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "GetDownloadLinkForPublicObject";
    NewLine.SearchMethod = "GETDOWNLOADLINKFORPUBLICOBJECT";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path inside the object (optional, def. val. - Empty value)";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "SavePublicObjectToDisk";
    NewLine.SearchMethod = "SAVEPUBLICOBJECTTODISK";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Manage public access";
    NewLine.MethodDescription   = "Saves the public object to your disk";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "SavePublicObjectToDisk";
    NewLine.SearchMethod = "SAVEPUBLICOBJECTTODISK";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Object address";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "SavePublicObjectToDisk";
    NewLine.SearchMethod = "SAVEPUBLICOBJECTTODISK";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "Path within public catalog (folders only) (optional, def. val. - Empty value)";
    NewLine.Region     = "Manage public access";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yadisk";
    NewLine.Module      = "OPI_YandexDisk";
    NewLine.Method       = "SavePublicObjectToDisk";
    NewLine.SearchMethod = "SAVEPUBLICOBJECTTODISK";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "File save path (optional, def. val. - Empty value)";
    NewLine.Region     = "Manage public access";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_YandexID"", Undefined);
        |
        |OPI_YandexID = LoadScript(""%1/oint/core/Modules/OPI_YandexID.os"", Context);
        |Context.Insert(""OPI_YandexID"", OPI_YandexID);
        |
        |OPI_YandexDisk = LoadScript(""%1/oint/core/Modules/OPI_YandexDisk.os"", Context);
        |" + Chars.LF;


EndFunction 
