
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
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client ID";
    NewLine.Region      = "Public";
    NewLine.MethodDescription   = "Returns URL for browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--calendar";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Calendar methods permission (optional, def. val.. - True)";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--drive";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Drive methods permission (optional, def. val.. - True)";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "FormCodeRetrievalLink";
    NewLine.SearchMethod  = "FORMCODERETRIEVALLINK";
    NewLine.Parameter     = "--sheets";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Sheets methods permission (optional, def. val.. - True)";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "GetTokenByCode";
    NewLine.SearchMethod  = "GETTOKENBYCODE";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client ID";
    NewLine.Region      = "Public";
    NewLine.MethodDescription   = "Gets token by code from browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "GetTokenByCode";
    NewLine.SearchMethod  = "GETTOKENBYCODE";
    NewLine.Parameter     = "--secret";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Client secret";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "GetTokenByCode";
    NewLine.SearchMethod  = "GETTOKENBYCODE";
    NewLine.Parameter     = "--code";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Code from browser";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client ID";
    NewLine.Region      = "Public";
    NewLine.MethodDescription   = "Updates token by Refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--secret";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Client secret";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--refresh";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Refresh token";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "GetServiceAccountToken";
    NewLine.SearchMethod  = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "JSON authorization data as a file, collection or binary data";
    NewLine.Region      = "Public";
    NewLine.MethodDescription   = "Gets authorization token by service account data";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "GetServiceAccountToken";
    NewLine.SearchMethod  = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter     = "--scope";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Scope or array of scopes";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "google";
    NewLine.Module       = "OPI_GoogleWorkspace";
    NewLine.Method        = "GetServiceAccountToken";
    NewLine.SearchMethod  = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter     = "--exp";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Token lifetime in seconds (optional, def. val.. - 3600)";
    NewLine.Region      = "Public";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_GoogleWorkspace = LoadScript(""%1/oint/core/Modules/OPI_GoogleWorkspace.os"", Context);
        |" + Chars.LF;


EndFunction 
