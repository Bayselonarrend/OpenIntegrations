
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
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetAuthorizationLink";
    NewLine.SearchMethod  = "GETAUTHORIZATIONLINK";
    NewLine.Parameter     = "--appkey";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Application key";
    NewLine.Region      = "Account and authorization";
    NewLine.MethodDescription   = "Generates an authorization link for browser transition";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--appkey";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Application key";
    NewLine.Region      = "Account and authorization";
    NewLine.MethodDescription   = "Gets token based on the code from the GetAuthorizationLink page";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--appsecret";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Application secret";
    NewLine.Region      = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--code";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Code from the authorization page";
    NewLine.Region      = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--appkey";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Application key";
    NewLine.Region      = "Account and authorization";
    NewLine.MethodDescription   = "Gets a new token based on the refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--appsecret";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Application secret";
    NewLine.Region      = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--refresh";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Refresh token";
    NewLine.Region      = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetAccountInformation";
    NewLine.SearchMethod  = "GETACCOUNTINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Account and authorization";
    NewLine.MethodDescription   = "Gets account information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetAccountInformation";
    NewLine.SearchMethod  = "GETACCOUNTINFORMATION";
    NewLine.Parameter     = "--account";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Account ID. Current token account if not filled (optional, def. val. - Empty value)";
    NewLine.Region      = "Account and authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetSpaceUsageData";
    NewLine.SearchMethod  = "GETSPACEUSAGEDATA";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Account and authorization";
    NewLine.MethodDescription   = "Gets information on the amount of used disk space";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetObjectInformation";
    NewLine.SearchMethod  = "GETOBJECTINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Gets information about a file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetObjectInformation";
    NewLine.SearchMethod  = "GETOBJECTINFORMATION";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetObjectInformation";
    NewLine.SearchMethod  = "GETOBJECTINFORMATION";
    NewLine.Parameter     = "--detail";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Add information fields for mediafiles (optional, def. val. - False)";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetListOfFolderFiles";
    NewLine.SearchMethod  = "GETLISTOFFOLDERFILES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Gets the list of the first files in the directory or continues getting the next ones when the cursor is specified";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetListOfFolderFiles";
    NewLine.SearchMethod  = "GETLISTOFFOLDERFILES";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the directory. Optional if the cursor is specified (optional, def. val. - Empty value)";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetListOfFolderFiles";
    NewLine.SearchMethod  = "GETLISTOFFOLDERFILES";
    NewLine.Parameter     = "--detail";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Add information fields for mediafiles (optional, def. val. - False)";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetListOfFolderFiles";
    NewLine.SearchMethod  = "GETLISTOFFOLDERFILES";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Cursor from the previous request to get the next set of files (optional, def. val. - Empty value)";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetPreview";
    NewLine.SearchMethod  = "GETPREVIEW";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Gets PDF or HTML preview of the object (for documents only)";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetPreview";
    NewLine.SearchMethod  = "GETPREVIEW";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Uploads a file to the cloud drive";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Data file for upload";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Save path on Dropbox";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--overwrite";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Overwrite file in case of path conflicts (optional, def. val. - False)";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "UploadFileByURL";
    NewLine.SearchMethod  = "UPLOADFILEBYURL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Uploads a file to the cloud drive by fetching it from the specified URL";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "UploadFileByURL";
    NewLine.SearchMethod  = "UPLOADFILEBYURL";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL source of the file";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "UploadFileByURL";
    NewLine.SearchMethod  = "UPLOADFILEBYURL";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Save path on Dropbox";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetUploadStatusByURL";
    NewLine.SearchMethod  = "GETUPLOADSTATUSBYURL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Gets the upload status of the file by URL";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetUploadStatusByURL";
    NewLine.SearchMethod  = "GETUPLOADSTATUSBYURL";
    NewLine.Parameter     = "--job";
    NewLine.ParameterTrim = "-j";
    NewLine.Description     = "ID of async jsob from UploadFileByURL response";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Deletes an object from the cloud drive";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object to delete";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DeleteObject";
    NewLine.SearchMethod  = "DELETEOBJECT";
    NewLine.Parameter     = "--permanently";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Delete object without the possibility of recovery (optional, def. val. - False)";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Copies a file or directory to the selected path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--from";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Path to the original object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CopyObject";
    NewLine.SearchMethod  = "COPYOBJECT";
    NewLine.Parameter     = "--to";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Target path for the new object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "MoveObject";
    NewLine.SearchMethod  = "MOVEOBJECT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Moves an object to the selected path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "MoveObject";
    NewLine.SearchMethod  = "MOVEOBJECT";
    NewLine.Parameter     = "--from";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Path to the original object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "MoveObject";
    NewLine.SearchMethod  = "MOVEOBJECT";
    NewLine.Parameter     = "--to";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Target path for the new object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CreateFolder";
    NewLine.SearchMethod  = "CREATEFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Creates an empty directory at the selected path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CreateFolder";
    NewLine.SearchMethod  = "CREATEFOLDER";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Target path for creating the directory";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Downloads a file by the specified path or ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path or ID of the file";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DownloadFolder";
    NewLine.SearchMethod  = "DOWNLOADFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Downloads a zip archive with the contents of the specified directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DownloadFolder";
    NewLine.SearchMethod  = "DOWNLOADFOLDER";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path or ID of the directory";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetObjectVersionList";
    NewLine.SearchMethod  = "GETOBJECTVERSIONLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Gets the list of versions (revisions) of the object";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetObjectVersionList";
    NewLine.SearchMethod  = "GETOBJECTVERSIONLIST";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetObjectVersionList";
    NewLine.SearchMethod  = "GETOBJECTVERSIONLIST";
    NewLine.Parameter     = "--amount";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Number of the latest versions of the object to display (optional, def. val. - 10)";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "RestoreObjectToVersion";
    NewLine.SearchMethod  = "RESTOREOBJECTTOVERSION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "File and directory management";
    NewLine.MethodDescription   = "Restores object state to required version (revision)";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "RestoreObjectToVersion";
    NewLine.SearchMethod  = "RESTOREOBJECTTOVERSION";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "RestoreObjectToVersion";
    NewLine.SearchMethod  = "RESTOREOBJECTTOVERSION";
    NewLine.Parameter     = "--rev";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "ID of the version (revision) for restoration";
    NewLine.Region      = "File and directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetTagList";
    NewLine.SearchMethod  = "GETTAGLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Gets the list of tags of the selected files";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetTagList";
    NewLine.SearchMethod  = "GETTAGLIST";
    NewLine.Parameter     = "--paths";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path or set of paths to the files";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddTag";
    NewLine.SearchMethod  = "ADDTAG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Add new tag to file or folder";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddTag";
    NewLine.SearchMethod  = "ADDTAG";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object for which the tag needs to be created";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddTag";
    NewLine.SearchMethod  = "ADDTAG";
    NewLine.Parameter     = "--tag";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Tag text";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DeleteTag";
    NewLine.SearchMethod  = "DELETETAG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Deletes the text tag of a file or directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DeleteTag";
    NewLine.SearchMethod  = "DELETETAG";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object whose tag needs to be deleted";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "DeleteTag";
    NewLine.SearchMethod  = "DELETETAG";
    NewLine.Parameter     = "--tag";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Tag text";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "PublishFolder";
    NewLine.SearchMethod  = "PUBLISHFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Shared access settings";
    NewLine.MethodDescription   = "Sets the directory to public access mode";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "PublishFolder";
    NewLine.SearchMethod  = "PUBLISHFOLDER";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the target directory";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CancelFolderPublication";
    NewLine.SearchMethod  = "CANCELFOLDERPUBLICATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Shared access settings";
    NewLine.MethodDescription   = "Cancels the public access mode for the directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CancelFolderPublication";
    NewLine.SearchMethod  = "CANCELFOLDERPUBLICATION";
    NewLine.Parameter     = "--folder";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of the public catalog (shared folder ID)";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFile";
    NewLine.SearchMethod  = "ADDUSERSTOFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Shared access settings";
    NewLine.MethodDescription   = "Defines access to the file for third-party users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFile";
    NewLine.SearchMethod  = "ADDUSERSTOFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of the file to be accessed";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFile";
    NewLine.SearchMethod  = "ADDUSERSTOFILE";
    NewLine.Parameter     = "--emails";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "List of email addresses of users being added";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFile";
    NewLine.SearchMethod  = "ADDUSERSTOFILE";
    NewLine.Parameter     = "--readonly";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Prohibits file editing for the external user (optional, def. val. - True)";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFolder";
    NewLine.SearchMethod  = "ADDUSERSTOFOLDER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Shared access settings";
    NewLine.MethodDescription   = "Grants external users access to the directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFolder";
    NewLine.SearchMethod  = "ADDUSERSTOFOLDER";
    NewLine.Parameter     = "--folder";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of the public catalog (shared folder ID)";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFolder";
    NewLine.SearchMethod  = "ADDUSERSTOFOLDER";
    NewLine.Parameter     = "--emails";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "List of email addresses of users being added";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "AddUsersToFolder";
    NewLine.SearchMethod  = "ADDUSERSTOFOLDER";
    NewLine.Parameter     = "--readonly";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Prohibits file editing for the external user (optional, def. val. - True)";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetAsynchronousChangeStatus";
    NewLine.SearchMethod  = "GETASYNCHRONOUSCHANGESTATUS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Shared access settings";
    NewLine.MethodDescription   = "Get async job status for access changes";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "GetAsynchronousChangeStatus";
    NewLine.SearchMethod  = "GETASYNCHRONOUSCHANGESTATUS";
    NewLine.Parameter     = "--job";
    NewLine.ParameterTrim = "-j";
    NewLine.Description     = "AsynchronousJobID";
    NewLine.Region      = "Shared access settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CancelFilePublication";
    NewLine.SearchMethod  = "CANCELFILEPUBLICATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Shared access settings";
    NewLine.MethodDescription   = "Prohibits access to the file for external users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "dropbox";
    NewLine.Module       = "OPI_Dropbox";
    NewLine.Method        = "CancelFilePublication";
    NewLine.SearchMethod  = "CANCELFILEPUBLICATION";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of the file to be accessed";
    NewLine.Region      = "Shared access settings";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Dropbox = LoadScript(""%1/oint/core/Modules/OPI_Dropbox.os"", Context);
        |" + Chars.LF;


EndFunction 
