
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
    NewLine.Library   = "tcp";
    NewLine.Module       = "OPI_TCP";
    NewLine.Method        = "ProcessRequest";
    NewLine.SearchMethod  = "PROCESSREQUEST";
    NewLine.Parameter     = "--address";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Address and port";
    NewLine.Region      = "Client methods";
    NewLine.MethodDescription   = "Sends a single request to a specified address and receives a response using the default settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "tcp";
    NewLine.Module       = "OPI_TCP";
    NewLine.Method        = "ProcessRequest";
    NewLine.SearchMethod  = "PROCESSREQUEST";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Data or text to be sent (optional, def. val. - Empty value)";
    NewLine.Region      = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "tcp";
    NewLine.Module       = "OPI_TCP";
    NewLine.Method        = "ProcessRequest";
    NewLine.SearchMethod  = "PROCESSREQUEST";
    NewLine.Parameter     = "--string";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "An attribute of receiving the response as a string (optional, def. val. - True)";
    NewLine.Region      = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "tcp";
    NewLine.Module       = "OPI_TCP";
    NewLine.Method        = "ProcessRequest";
    NewLine.SearchMethod  = "PROCESSREQUEST";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region      = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "tcp";
    NewLine.Module       = "OPI_TCP";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--trust";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Allows to work with invalid certificates, including self signed";
    NewLine.Region      = "Client methods";
    NewLine.MethodDescription   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "tcp";
    NewLine.Module       = "OPI_TCP";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--cert";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val. - Empty value)";
    NewLine.Region      = "Client methods";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_TCP = LoadScript(""%1/oint/core/Modules/OPI_TCP.os"", Context);
        |" + Chars.LF;


EndFunction 
