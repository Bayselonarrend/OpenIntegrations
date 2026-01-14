

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
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "ExecuteRequest";
    NewLine.SearchMethod  = "EXECUTEREQUEST";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Connection settings or object (for gRPC)";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Executes a request with the specified parameters";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "ExecuteRequest";
    NewLine.SearchMethod  = "EXECUTEREQUEST";
    NewLine.Parameter     = "--req";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Request data. See GetRequestSettings";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "ExecuteRequest";
    NewLine.SearchMethod  = "EXECUTEREQUEST";
    NewLine.Parameter     = "--session";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Session settings. See GetSessionSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetHTTPConnectionSettings";
    NewLine.SearchMethod  = "GETHTTPCONNECTIONSETTINGS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Connection address with protocol and port";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets the settings structure for HTTP connection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetHTTPConnectionSettings";
    NewLine.SearchMethod  = "GETHTTPCONNECTIONSETTINGS";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization: string for JWT, structure for basic (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetHTTPConnectionSettings";
    NewLine.SearchMethod  = "GETHTTPCONNECTIONSETTINGS";
    NewLine.Parameter     = "--headers";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Additional request headers (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetRequestSettings";
    NewLine.SearchMethod  = "GETREQUESTSETTINGS";
    NewLine.Parameter     = "--query";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Request text";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms the request description structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetRequestSettings";
    NewLine.SearchMethod  = "GETREQUESTSETTINGS";
    NewLine.Parameter     = "--db";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Database (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetRequestSettings";
    NewLine.SearchMethod  = "GETREQUESTSETTINGS";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Unique request ID, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetRequestSettings";
    NewLine.SearchMethod  = "GETREQUESTSETTINGS";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "String, file, or binary data of the request (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetRequestSettings";
    NewLine.SearchMethod  = "GETREQUESTSETTINGS";
    NewLine.Parameter     = "--format";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Response format: JSON, CSV, TSV, etc.. (optional, def. val.. - JSON)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetRequestSettings";
    NewLine.SearchMethod  = "GETREQUESTSETTINGS";
    NewLine.Parameter     = "--ext";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "External tables data. See GetExternalTableStructure (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetRequestSettings";
    NewLine.SearchMethod  = "GETREQUESTSETTINGS";
    NewLine.Parameter     = "--settings";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Additional query parameters of the request (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetExternalTableStructure";
    NewLine.SearchMethod  = "GETEXTERNALTABLESTRUCTURE";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Table name";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets the description structure of the external table of the request";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetExternalTableStructure";
    NewLine.SearchMethod  = "GETEXTERNALTABLESTRUCTURE";
    NewLine.Parameter     = "--cols";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Table column structure: Key > name, Value > data type";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetExternalTableStructure";
    NewLine.SearchMethod  = "GETEXTERNALTABLESTRUCTURE";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "String, file, or binary data of the table (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetExternalTableStructure";
    NewLine.SearchMethod  = "GETEXTERNALTABLESTRUCTURE";
    NewLine.Parameter     = "--format";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Data format: CVS, TVS, JSON, etc.. (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetSessionSettings";
    NewLine.SearchMethod  = "GETSESSIONSETTINGS";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Session ID. A new unique identifier if not specified (a new session will be created) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms the session settings structure for executing the request";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetSessionSettings";
    NewLine.SearchMethod  = "GETSESSIONSETTINGS";
    NewLine.Parameter     = "--check";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Check for session existence. True when ID is specified and false when not, unless otherwise specified (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetSessionSettings";
    NewLine.SearchMethod  = "GETSESSIONSETTINGS";
    NewLine.Parameter     = "--timeout";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Session lifetime in seconds (optional, def. val.. - 60)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetGRPCConnectionSettings";
    NewLine.SearchMethod  = "GETGRPCCONNECTIONSETTINGS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Connection address with protocol and port";
    NewLine.Region      = "Grpc";
    NewLine.MethodDescription   = "Gets the settings structure for gRPC connection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetGRPCConnectionSettings";
    NewLine.SearchMethod  = "GETGRPCCONNECTIONSETTINGS";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization: string for JWT, structure for basic (optional, def. val.. - Empty value)";
    NewLine.Region      = "Grpc";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetGRPCConnectionSettings";
    NewLine.SearchMethod  = "GETGRPCCONNECTIONSETTINGS";
    NewLine.Parameter     = "--meta";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "gRPC metadata structure, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Grpc";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetGRPCConnectionSettings";
    NewLine.SearchMethod  = "GETGRPCCONNECTIONSETTINGS";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "TLS settings. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Grpc";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--trust";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Allows to work with invalid certificates, including self signed";
    NewLine.Region      = "Grpc";
    NewLine.MethodDescription   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "clickhouse";
    NewLine.Module       = "OPI_ClickHouse";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--cert";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val.. - Empty value)";
    NewLine.Region      = "Grpc";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_GRPC"", Undefined);
        |
        |OPI_GRPC = LoadScript(""%1/oint/core/Modules/OPI_GRPC.os"", Context);
        |Context.Insert(""OPI_GRPC"", OPI_GRPC);
        |
        |OPI_ClickHouse = LoadScript(""%1/oint/core/Modules/OPI_ClickHouse.os"", Context);
        |" + Chars.LF;


EndFunction 
