
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
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionConfiguration";
    NewLine.SearchMethod  = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter     = "--set";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "FTP settings. See GetConnectionSettings";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionConfiguration";
    NewLine.SearchMethod  = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter     = "--proxy";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Proxy settings, if required. See GetProxySettings (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionConfiguration";
    NewLine.SearchMethod  = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetWelcomeMessage";
    NewLine.SearchMethod  = "GETWELCOMEMESSAGE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Receives the FTP servers welcome message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetProtocolFeatureList";
    NewLine.SearchMethod  = "GETPROTOCOLFEATURELIST";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets a list of FTP protocol features supported by the server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "Ping";
    NewLine.SearchMethod  = "PING";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Checks the connection activity and resets the timeout until its automatic closure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ExecuteCustomCommand";
    NewLine.SearchMethod  = "EXECUTECUSTOMCOMMAND";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Executes a specific (SITE) server command and returns the response";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ExecuteCustomCommand";
    NewLine.SearchMethod  = "EXECUTECUSTOMCOMMAND";
    NewLine.Parameter     = "--cmd";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Text of the executed command";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ExecuteArbitraryCommand";
    NewLine.SearchMethod  = "EXECUTEARBITRARYCOMMAND";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Sends an arbitrary text request to the server for processing";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ExecuteArbitraryCommand";
    NewLine.SearchMethod  = "EXECUTEARBITRARYCOMMAND";
    NewLine.Parameter     = "--cmd";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Text of the executed command";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetObjectSize";
    NewLine.SearchMethod  = "GETOBJECTSIZE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Get the size of a file or directory if it exists";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetObjectSize";
    NewLine.SearchMethod  = "GETOBJECTSIZE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the object";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "UpdatePath";
    NewLine.SearchMethod  = "UPDATEPATH";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Changes the object's path to the specified one";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "UpdatePath";
    NewLine.SearchMethod  = "UPDATEPATH";
    NewLine.Parameter     = "--old";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Current path to object";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "UpdatePath";
    NewLine.SearchMethod  = "UPDATEPATH";
    NewLine.Parameter     = "--new";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "New path to object";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--host";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Host address";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Creates a structure of FTP connection settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Server port (optional, def. val. - 21)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--login";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Username for authorization, if required (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User password for authorization, if required (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--passive";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Passive connection mode (optional, def. val. - True)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--rtout";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Read timeout (optional, def. val. - 120)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--wtout";
    NewLine.ParameterTrim = "-w";
    NewLine.Description     = "Write timeout (optional, def. val. - 120)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetConnectionSettings";
    NewLine.SearchMethod  = "GETCONNECTIONSETTINGS";
    NewLine.Parameter     = "--ipresl";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Advanced passive mode address resolution (optional, def. val. - True)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--addr";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Proxy address";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Creates a structure of proxy server settings for the connection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Proxy port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Proxy type: socks5, socks4, http (optional, def. val. - socks5)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--login";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Authorization login, if required (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization password, if required (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--trust";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Allows to work with invalid certificates, including self signed";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--cert";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Gets information about the contents of a directory at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to search directory (optional, def. val. - Empty value)";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--rcv";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Get information about objects in nested directories (optional, def. val. - False)";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "CreateNewDirectory";
    NewLine.SearchMethod  = "CREATENEWDIRECTORY";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Creates a directory at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "CreateNewDirectory";
    NewLine.SearchMethod  = "CREATENEWDIRECTORY";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to new directory";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "DeleteDirectory";
    NewLine.SearchMethod  = "DELETEDIRECTORY";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Deletes an existing directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "DeleteDirectory";
    NewLine.SearchMethod  = "DELETEDIRECTORY";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to directory to delete";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ClearDirectory";
    NewLine.SearchMethod  = "CLEARDIRECTORY";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Deletes all objects in the selected directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "ClearDirectory";
    NewLine.SearchMethod  = "CLEARDIRECTORY";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to the directory to be cleaned";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "GetCurrentDirectory";
    NewLine.SearchMethod  = "GETCURRENTDIRECTORY";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Gets the current directory from which relative paths are calculated";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Uploads a file from disk or binary data to the FTP server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File on disk or file data";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to save file on server";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Delete file from server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to file on server";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "SaveFile";
    NewLine.SearchMethod  = "SAVEFILE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Saves the file from the server to the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "SaveFile";
    NewLine.SearchMethod  = "SAVEFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to file on server";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ftp";
    NewLine.Module       = "OPI_FTP";
    NewLine.Method        = "SaveFile";
    NewLine.SearchMethod  = "SAVEFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Path to save file on disk";
    NewLine.Region      = "File management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_FTP"", Undefined);
        |
        |OPI_FTP = LoadScript(""%1/oint/core/Modules/OPI_FTP.os"", Context);
        |Context.Insert(""OPI_FTP"", OPI_FTP);
        |
        |OPI_FTP = LoadScript(""%1/oint/core/Modules/OPI_FTP.os"", Context);
        |" + Chars.LF;


EndFunction 
