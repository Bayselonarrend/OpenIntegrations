
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
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetObjectInformation";
    NewLine.SearchMethod = "GETOBJECTINFORMATION";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Gets information about a folder or file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetObjectInformation";
    NewLine.SearchMethod = "GETOBJECTINFORMATION";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Identifier of the file or folder";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetDirectoriesList";
    NewLine.SearchMethod = "GETDIRECTORIESLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Gets the list of drive directories";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetDirectoriesList";
    NewLine.SearchMethod = "GETDIRECTORIESLIST";
    NewLine.Parameter    = "--querry";
    NewLine.Description    = "Filter by name (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetDirectoriesList";
    NewLine.SearchMethod = "GETDIRECTORIESLIST";
    NewLine.Parameter    = "--depth";
    NewLine.Description    = "Adds a list of files to the directory fields (optional, def. val. - False)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Gets the list of files";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--querry";
    NewLine.Description    = "Filter by name (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetFilesList";
    NewLine.SearchMethod = "GETFILESLIST";
    NewLine.Parameter    = "--catalog";
    NewLine.Description    = "Filter by parent directory ID (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Uploads a file to the drive
    |    Data structure for option --props:
    |    {
    |     ""MIME""        : ""image/jpeg"",
    |     ""Name""         : ""New file.jpg"",
    |     ""Description""    : ""This is a new file"",
    |     ""Parent""    : ""root""
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--file";
    NewLine.Description    = "File to be uploaded";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--props";
    NewLine.Description    = "See GetFileDescription";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CreateFolder";
    NewLine.SearchMethod = "CREATEFOLDER";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Creates an empty directory on the drive";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CreateFolder";
    NewLine.SearchMethod = "CREATEFOLDER";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Folder name";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CreateFolder";
    NewLine.SearchMethod = "CREATEFOLDER";
    NewLine.Parameter    = "--catalog";
    NewLine.Description    = "Parent (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Gets file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "File identifier";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--out";
    NewLine.Description    = "File save path (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CopyObject";
    NewLine.SearchMethod = "COPYOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Copies file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CopyObject";
    NewLine.SearchMethod = "COPYOBJECT";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Object identifier";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CopyObject";
    NewLine.SearchMethod = "COPYOBJECT";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New object name (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CopyObject";
    NewLine.SearchMethod = "COPYOBJECT";
    NewLine.Parameter    = "--catalog";
    NewLine.Description    = "New parent directory (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "UpdateFile";
    NewLine.SearchMethod = "UPDATEFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Updates file binary data";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "UpdateFile";
    NewLine.SearchMethod = "UPDATEFILE";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Identifier of the object to update";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "UpdateFile";
    NewLine.SearchMethod = "UPDATEFILE";
    NewLine.Parameter    = "--file";
    NewLine.Description    = "File source for update";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "UpdateFile";
    NewLine.SearchMethod = "UPDATEFILE";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New file name (if necessary) (optional, def. val. - Empty value)";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DeleteObject";
    NewLine.SearchMethod = "DELETEOBJECT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Deletes file or directory by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DeleteObject";
    NewLine.SearchMethod = "DELETEOBJECT";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Identifier of the object to delete";
    NewLine.Region     = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetFileDescription";
    NewLine.SearchMethod = "GETFILEDESCRIPTION";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "File and directory management";
    NewLine.MethodDescription   = "Gets a blank description template for uploading a file";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CreateComment";
    NewLine.SearchMethod = "CREATECOMMENT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Comment management";
    NewLine.MethodDescription   = "Creates a comment for a file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CreateComment";
    NewLine.SearchMethod = "CREATECOMMENT";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Identifier of the object that needs a comment";
    NewLine.Region     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "CreateComment";
    NewLine.SearchMethod = "CREATECOMMENT";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Comment text";
    NewLine.Region     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetComment";
    NewLine.SearchMethod = "GETCOMMENT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Comment management";
    NewLine.MethodDescription   = "Gets comment by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetComment";
    NewLine.SearchMethod = "GETCOMMENT";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Identifier of the file or directory where the comment is located";
    NewLine.Region     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetComment";
    NewLine.SearchMethod = "GETCOMMENT";
    NewLine.Parameter    = "--comment";
    NewLine.Description    = "Comment identifier";
    NewLine.Region     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetCommentList";
    NewLine.SearchMethod = "GETCOMMENTLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Comment management";
    NewLine.MethodDescription   = "Gets the list of all comments of the object";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "GetCommentList";
    NewLine.SearchMethod = "GETCOMMENTLIST";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Object identifier";
    NewLine.Region     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DeleteComment";
    NewLine.SearchMethod = "DELETECOMMENT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Comment management";
    NewLine.MethodDescription   = "Deletes comment by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DeleteComment";
    NewLine.SearchMethod = "DELETECOMMENT";
    NewLine.Parameter    = "--object";
    NewLine.Description    = "Identifier of the file or directory where the comment is located";
    NewLine.Region     = "Comment management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "gdrive";
    NewLine.Module      = "OPI_GoogleDrive";
    NewLine.Method       = "DeleteComment";
    NewLine.SearchMethod = "DELETECOMMENT";
    NewLine.Parameter    = "--comment";
    NewLine.Description    = "Comment identifier";
    NewLine.Region     = "Comment management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_GoogleWorkspace"", Undefined);
        |
        |OPI_GoogleWorkspace = LoadScript(""%1/oint/core/Modules/OPI_GoogleWorkspace.os"", Context);
        |Context.Insert(""OPI_GoogleWorkspace"", OPI_GoogleWorkspace);
        |
        |OPI_GoogleDrive = LoadScript(""%1/oint/core/Modules/OPI_GoogleDrive.os"", Context);
        |" + Chars.LF;


EndFunction 
