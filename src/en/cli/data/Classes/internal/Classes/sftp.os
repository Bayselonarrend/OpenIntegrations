
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
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetConnectionConfiguration";
    NewLine.SearchMethod  = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter     = "--set";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "SSH settings";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetConnectionConfiguration";
    NewLine.SearchMethod  = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter     = "--proxy";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Proxy settings, if required. See GetProxySettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "UpdatePath";
    NewLine.SearchMethod  = "UPDATEPATH";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Changes the object's path to the specified one";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "UpdatePath";
    NewLine.SearchMethod  = "UPDATEPATH";
    NewLine.Parameter     = "--old";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Current path to object";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "UpdatePath";
    NewLine.SearchMethod  = "UPDATEPATH";
    NewLine.Parameter     = "--new";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "New path to object";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "UpdatePath";
    NewLine.SearchMethod  = "UPDATEPATH";
    NewLine.Parameter     = "--rw";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Overwrite if an object already exists at the target path (optional, def. val.. - False)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--host";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "SSH host";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "password)
    |    Gets connection settings with login and password authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "SSH port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "SSH username";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "SSH user password (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--host";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "SSH host";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets connection settings with private key authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "SSH port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "SSH username";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--key";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Path to private key file";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--pub";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Path to public key file (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Private key password (passphrase) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsViaAgent";
    NewLine.SearchMethod  = "GETSETTINGSVIAAGENT";
    NewLine.Parameter     = "--host";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "SSH host";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets connection settings with SSH Agent authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsViaAgent";
    NewLine.SearchMethod  = "GETSETTINGSVIAAGENT";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "SSH port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetSettingsViaAgent";
    NewLine.SearchMethod  = "GETSETTINGSVIAAGENT";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "SSH username";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--addr";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Proxy address";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Creates a structure of proxy server settings for the connection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Proxy port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Proxy type: socks5, socks4, http (optional, def. val.. - socks5)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--login";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Authorization login, if required (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization password, if required (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Gets information about the contents of a directory at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to search directory (optional, def. val.. - Empty value)";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "ListObjects";
    NewLine.SearchMethod  = "LISTOBJECTS";
    NewLine.Parameter     = "--rcv";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Get information about objects in nested directories (optional, def. val.. - False)";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "CreateNewDirectory";
    NewLine.SearchMethod  = "CREATENEWDIRECTORY";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Creates a directory at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "CreateNewDirectory";
    NewLine.SearchMethod  = "CREATENEWDIRECTORY";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to new directory";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "CreateNewDirectory";
    NewLine.SearchMethod  = "CREATENEWDIRECTORY";
    NewLine.Parameter     = "--mode";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Access mode to the directory in POSIX numeric format (as in chmod) (optional, def. val.. - 700)";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "DeleteDirectory";
    NewLine.SearchMethod  = "DELETEDIRECTORY";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Deletes an existing directory";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "DeleteDirectory";
    NewLine.SearchMethod  = "DELETEDIRECTORY";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to directory to delete";
    NewLine.Region      = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetCurrentDirectory";
    NewLine.SearchMethod  = "GETCURRENTDIRECTORY";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Directory management";
    NewLine.MethodDescription   = "Gets the current directory from which relative paths are calculated";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Uploads a file from disk or binary data to the server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File on disk or file data";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to save file on server";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Delete file from server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to file on server";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "SaveFile";
    NewLine.SearchMethod  = "SAVEFILE";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Saves the file from the server to the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "SaveFile";
    NewLine.SearchMethod  = "SAVEFILE";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to file on server";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "SaveFile";
    NewLine.SearchMethod  = "SAVEFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Path to save file on disk";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Get file information by the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "sftp";
    NewLine.Module       = "OPI_SFTP";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--path";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Path to file on server";
    NewLine.Region      = "File management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_SSH"", Undefined);
        |
        |OPI_SSH = LoadScript(""%1/oint/core/Modules/OPI_SSH.os"", Context);
        |Context.Insert(""OPI_SSH"", OPI_SSH);
        |
        |OPI_SFTP = LoadScript(""%1/oint/core/Modules/OPI_SFTP.os"", Context);
        |" + Chars.LF;


EndFunction 
