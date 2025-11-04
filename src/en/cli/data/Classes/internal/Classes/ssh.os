
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
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetConnectionConfiguration";
    NewLine.SearchMethod  = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter     = "--set";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "SSH settings";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms a complete structure of connection settings that can be used instead of the actual connection when calling other functions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetConnectionConfiguration";
    NewLine.SearchMethod  = "GETCONNECTIONCONFIGURATION";
    NewLine.Parameter     = "--proxy";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Proxy settings, if required. See GetProxySettings (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection configuration";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Executes the specified command";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--comm";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Command text";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--host";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "SSH host";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "password)
    |    Gets connection settings with login and password authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "SSH port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "SSH username";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsLoginPassword";
    NewLine.SearchMethod  = "GETSETTINGSLOGINPASSWORD";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "SSH user password (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--host";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "SSH host";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets connection settings with private key authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "SSH port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "SSH username";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--key";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Path to private key file";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--pub";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Path to public key file (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsPrivateKey";
    NewLine.SearchMethod  = "GETSETTINGSPRIVATEKEY";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Private key password (passphrase) (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsViaAgent";
    NewLine.SearchMethod  = "GETSETTINGSVIAAGENT";
    NewLine.Parameter     = "--host";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "SSH host";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets connection settings with SSH Agent authentication";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsViaAgent";
    NewLine.SearchMethod  = "GETSETTINGSVIAAGENT";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "SSH port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetSettingsViaAgent";
    NewLine.SearchMethod  = "GETSETTINGSVIAAGENT";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "SSH username";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--addr";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Proxy address";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Creates a structure of proxy server settings for the connection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--port";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Proxy port";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Proxy type: socks5, socks4, http (optional, def. val. - socks5)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--login";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Authorization login, if required (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "ssh";
    NewLine.Module       = "OPI_SSH";
    NewLine.Method        = "GetProxySettings";
    NewLine.SearchMethod  = "GETPROXYSETTINGS";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization password, if required (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";

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
        |OPI_SSH = LoadScript(""%1/oint/core/Modules/OPI_SSH.os"", Context);
        |" + Chars.LF;


EndFunction 
