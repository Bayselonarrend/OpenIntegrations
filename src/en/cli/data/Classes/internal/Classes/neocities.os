
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
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "GetSiteData";
    NewLine.SearchMethod  = "GETSITEDATA";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Data retrieving";
    NewLine.MethodDescription   = "Gets information about a site by its name or token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "GetSiteData";
    NewLine.SearchMethod  = "GETSITEDATA";
    NewLine.Parameter     = "--sitename";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Site name (login) for information. Current, if not filled in (optional, def. val. - Empty value)";
    NewLine.Region      = "Data retrieving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--login";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Users login";
    NewLine.Region      = "Data retrieving";
    NewLine.MethodDescription   = "Receives authorization token by login and password";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--password";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Users password";
    NewLine.Region      = "Data retrieving";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Upload single file to Neocities";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "File path on Neocities";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "URL, path or file data";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "UploadFiles";
    NewLine.SearchMethod  = "UPLOADFILES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Uploads multiple files to Neocities";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "UploadFiles";
    NewLine.SearchMethod  = "UPLOADFILES";
    NewLine.Parameter     = "--files";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Files: Key > destination path on NC, Value > file";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "UploadFiles";
    NewLine.SearchMethod  = "UPLOADFILES";
    NewLine.Parameter     = "--singly";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "True > sends files in separate requests (optional, def. val. - False)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "DeleteSelectedFiles";
    NewLine.SearchMethod  = "DELETESELECTEDFILES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Deletes a file or multiple files from Neocities";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "DeleteSelectedFiles";
    NewLine.SearchMethod  = "DELETESELECTEDFILES";
    NewLine.Parameter     = "--paths";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path or multiple paths of the files to be deleted";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Gets a list of files with or without directory selection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Selection of files by catalog. All if not filled in (optional, def. val. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "SynchronizeFolders";
    NewLine.SearchMethod  = "SYNCHRONIZEFOLDERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Creates a copy of the local directory at the selected path on the Neocities server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "SynchronizeFolders";
    NewLine.SearchMethod  = "SYNCHRONIZEFOLDERS";
    NewLine.Parameter     = "--local";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Local source catalog";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "neocities";
    NewLine.Module       = "OPI_Neocities";
    NewLine.Method        = "SynchronizeFolders";
    NewLine.SearchMethod  = "SYNCHRONIZEFOLDERS";
    NewLine.Parameter     = "--remote";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Remote receiver catalog. Root by default (optional, def. val. - Empty value)";
    NewLine.Region      = "File management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Neocities = LoadScript(""%1/oint/core/Modules/OPI_Neocities.os"", Context);
        |" + Chars.LF;


EndFunction 
