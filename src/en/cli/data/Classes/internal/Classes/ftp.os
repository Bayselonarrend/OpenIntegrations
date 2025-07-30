
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
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionConfiguration";
    NewLine.SearchMethod = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter    = "--set";
    NewLine.Description    = "FTP settings. See GetConnectionSettings";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionConfiguration";
    NewLine.SearchMethod = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter    = "--proxy";
    NewLine.Description    = "Proxy settings, if required. See GetProxySettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionConfiguration";
    NewLine.SearchMethod = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetWelcomeMessage";
    NewLine.SearchMethod = "GETWELCOMEMESSAGE";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Existing connection or connection configuration";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Receives the FTP servers welcome message";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--host";
    NewLine.Description    = "Host addres";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Creates a structure of FTP connection settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--port";
    NewLine.Description    = "Server port (optional, def. val. - 21)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--login";
    NewLine.Description    = "Username for authorization, if required (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--pass";
    NewLine.Description    = "User password for authorization, if required (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--passive";
    NewLine.Description    = "Passive connection mode (optional, def. val. - True)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--rtout";
    NewLine.Description    = "Read timeout (optional, def. val. - 120)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--wtout";
    NewLine.Description    = "Write timeout (optional, def. val. - 120)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetConnectionSettings";
    NewLine.SearchMethod = "GETCONNECTIONSETTINGS";
    NewLine.Parameter    = "--ipresl";
    NewLine.Description    = "Advanced passive mode address resolution (optional, def. val. - True)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "GETPROXYSETTINGS";
    NewLine.Parameter    = "--addr";
    NewLine.Description    = "Proxy address";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Creates a structure of proxy server settings for the connection";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "GETPROXYSETTINGS";
    NewLine.Parameter    = "--port";
    NewLine.Description    = "Proxy port";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "GETPROXYSETTINGS";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Proxy type: socks5, socks4, http (optional, def. val. - socks5)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "GETPROXYSETTINGS";
    NewLine.Parameter    = "--login";
    NewLine.Description    = "Authorization login, if required (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "GETPROXYSETTINGS";
    NewLine.Parameter    = "--pass";
    NewLine.Description    = "Authorization password, if required (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetTlsSettings";
    NewLine.SearchMethod = "GETTLSSETTINGS";
    NewLine.Parameter    = "--trust";
    NewLine.Description    = "Allows to work with invalid certificates, including self signed";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "GetTlsSettings";
    NewLine.SearchMethod = "GETTLSSETTINGS";
    NewLine.Parameter    = "--cert";
    NewLine.Description    = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "ListObjects";
    NewLine.SearchMethod = "LISTOBJECTS";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Existing connection or connection configuration";
    NewLine.Region     = "Directory management";
    NewLine.MethodDescription   = "Gets information about the contents of a directory at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "ListObjects";
    NewLine.SearchMethod = "LISTOBJECTS";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to search directory (optional, def. val. - Empty value)";
    NewLine.Region     = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "ListObjects";
    NewLine.SearchMethod = "LISTOBJECTS";
    NewLine.Parameter    = "--rcv";
    NewLine.Description    = "Get information about elements in nested directories (optional, def. val. - False)";
    NewLine.Region     = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "CreateDirectory";
    NewLine.SearchMethod = "CREATEDIRECTORY";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Existing connection or connection configuration";
    NewLine.Region     = "Directory management";
    NewLine.MethodDescription   = "Creates a directory at the specified path";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "CreateDirectory";
    NewLine.SearchMethod = "CREATEDIRECTORY";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to new directory";
    NewLine.Region     = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "DeleteDirectory";
    NewLine.SearchMethod = "DELETEDIRECTORY";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Existing connection or connection configuration";
    NewLine.Region     = "Directory management";
    NewLine.MethodDescription   = "Deletes an existing directory";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "DeleteDirectory";
    NewLine.SearchMethod = "DELETEDIRECTORY";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to directory to delete";
    NewLine.Region     = "Directory management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Existing connection or connection configuration";
    NewLine.Region     = "File management";
    NewLine.MethodDescription   = "Uploads a file from disk or binary data to the FTP server";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--file";
    NewLine.Description    = "File on disk or file data";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "UploadFile";
    NewLine.SearchMethod = "UPLOADFILE";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to save file on server";
    NewLine.Region     = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "DeleteFile";
    NewLine.SearchMethod = "DELETEFILE";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Existing connection or connection configuration";
    NewLine.Region     = "File management";
    NewLine.MethodDescription   = "Delete file from server";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ftp";
    NewLine.Module      = "OPI_FTP";
    NewLine.Method       = "DeleteFile";
    NewLine.SearchMethod = "DELETEFILE";
    NewLine.Parameter    = "--path";
    NewLine.Description    = "Path to save file on server";
    NewLine.Region     = "File management";

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
