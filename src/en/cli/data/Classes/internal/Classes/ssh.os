
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
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetConnectionConfiguration";
    NewLine.SearchMethod = "ПОЛУЧAndТЬKОNФAndГУРАЦAndЮСОЕДAndNOTNAndЯ";
    NewLine.Parameter    = "--set";
    NewLine.Description    = "SSH settings";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetConnectionConfiguration";
    NewLine.SearchMethod = "ПОЛУЧAndТЬKОNФAndГУРАЦAndЮСОЕДAndNOTNAndЯ";
    NewLine.Parameter    = "--proxy";
    NewLine.Description    = "Proxy settings, if required. See GetProxySettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ExecuteCommand";
    NewLine.SearchMethod = "InЫПОЛNAndТЬKОМАNДУ";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Existing connection or connection configuration";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Executes the specified command";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "ExecuteCommand";
    NewLine.SearchMethod = "InЫПОЛNAndТЬKОМАNДУ";
    NewLine.Parameter    = "--comm";
    NewLine.Description    = "Command text";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsLoginPassword";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndЛОГAndNПАРОЛЬ";
    NewLine.Parameter    = "--host";
    NewLine.Description    = "SSH host";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "парoль)
    |    Gets connection settings with login and password authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsLoginPassword";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndЛОГAndNПАРОЛЬ";
    NewLine.Parameter    = "--port";
    NewLine.Description    = "SSH port";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsLoginPassword";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndЛОГAndNПАРОЛЬ";
    NewLine.Parameter    = "--user";
    NewLine.Description    = "SSH username";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsLoginPassword";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndЛОГAndNПАРОЛЬ";
    NewLine.Parameter    = "--pass";
    NewLine.Description    = "SSH user password (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsPrivateKey";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРAndInATNЫЙKЛЮЧ";
    NewLine.Parameter    = "--host";
    NewLine.Description    = "SSH host";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Gets connection settings with private key authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsPrivateKey";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРAndInATNЫЙKЛЮЧ";
    NewLine.Parameter    = "--port";
    NewLine.Description    = "SSH port";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsPrivateKey";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРAndInATNЫЙKЛЮЧ";
    NewLine.Parameter    = "--user";
    NewLine.Description    = "SSH username";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsPrivateKey";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРAndInATNЫЙKЛЮЧ";
    NewLine.Parameter    = "--key";
    NewLine.Description    = "Path to private key file";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsPrivateKey";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРAndInATNЫЙKЛЮЧ";
    NewLine.Parameter    = "--pub";
    NewLine.Description    = "Path to public key file (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsPrivateKey";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРAndInATNЫЙKЛЮЧ";
    NewLine.Parameter    = "--pass";
    NewLine.Description    = "Private key password (passphrase) (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsViaAgent";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndЧЕРЕЗАГЕNТА";
    NewLine.Parameter    = "--host";
    NewLine.Description    = "SSH host";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Gets connection settings with SSH Agent authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsViaAgent";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndЧЕРЕЗАГЕNТА";
    NewLine.Parameter    = "--port";
    NewLine.Description    = "SSH port";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetSettingsViaAgent";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndЧЕРЕЗАГЕNТА";
    NewLine.Parameter    = "--user";
    NewLine.Description    = "SSH username";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРОKСAnd";
    NewLine.Parameter    = "--addr";
    NewLine.Description    = "Proxy address";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Creates a structure of proxy server settings for the connection";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРОKСAnd";
    NewLine.Parameter    = "--port";
    NewLine.Description    = "Proxy port";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРОKСAnd";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Proxy type: socks5, socks4, http (optional, def. val. - socks5)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРОKСAnd";
    NewLine.Parameter    = "--login";
    NewLine.Description    = "Authorization login, if required (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "ssh";
    NewLine.Module      = "OPI_SQLite";
    NewLine.Method       = "GetProxySettings";
    NewLine.SearchMethod = "ПОЛУЧAndТЬNАСТРОЙKAndПРОKСAnd";
    NewLine.Parameter    = "--pass";
    NewLine.Description    = "Authorization password, if required (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_SQLite = LoadScript(""%1/oint/core/Modules/OPI_SQLite.os"", Context);
        |" + Chars.LF;


EndFunction 
