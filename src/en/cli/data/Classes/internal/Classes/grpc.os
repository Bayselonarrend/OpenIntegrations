
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
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ExecuteMethod";
    NewLine.SearchMethod  = "EXECUTEMETHOD";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection parameters";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Performs a unary request to the selected service";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ExecuteMethod";
    NewLine.SearchMethod  = "EXECUTEMETHOD";
    NewLine.Parameter     = "--service";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Service name";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ExecuteMethod";
    NewLine.SearchMethod  = "EXECUTEMETHOD";
    NewLine.Parameter     = "--method";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Method name";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ExecuteMethod";
    NewLine.SearchMethod  = "EXECUTEMETHOD";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Request data (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ExecuteMethod";
    NewLine.SearchMethod  = "EXECUTEMETHOD";
    NewLine.Parameter     = "--tout";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Timeout (in ms) (optional, def. val.. - 10000)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ExecuteMethod";
    NewLine.SearchMethod  = "EXECUTEMETHOD";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetConnectionParameters";
    NewLine.SearchMethod  = "GETCONNECTIONPARAMETERS";
    NewLine.Parameter     = "--addr";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Connection address (with protocol)";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms a structure of parameters for creating a connection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetConnectionParameters";
    NewLine.SearchMethod  = "GETCONNECTIONPARAMETERS";
    NewLine.Parameter     = "--proto";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Schema or schema structure: Key > file name (for import), Value > schema as a string or file path (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetConnectionParameters";
    NewLine.SearchMethod  = "GETCONNECTIONPARAMETERS";
    NewLine.Parameter     = "--meta";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Metadata structure, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--trust";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Allows to work with invalid certificates, including self signed";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetTlsSettings";
    NewLine.SearchMethod  = "GETTLSSETTINGS";
    NewLine.Parameter     = "--cert";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val.. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetServiceList";
    NewLine.SearchMethod  = "GETSERVICELIST";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection parameters";
    NewLine.Region      = "Introspection";
    NewLine.MethodDescription   = "Gets a list of available services";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetServiceList";
    NewLine.SearchMethod  = "GETSERVICELIST";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Introspection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetMethodList";
    NewLine.SearchMethod  = "GETMETHODLIST";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection parameters";
    NewLine.Region      = "Introspection";
    NewLine.MethodDescription   = "Gets a list of available methods for the specified service";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetMethodList";
    NewLine.SearchMethod  = "GETMETHODLIST";
    NewLine.Parameter     = "--service";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Service name";
    NewLine.Region      = "Introspection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetMethodList";
    NewLine.SearchMethod  = "GETMETHODLIST";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Introspection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetMethod";
    NewLine.SearchMethod  = "GETMETHOD";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection parameters";
    NewLine.Region      = "Introspection";
    NewLine.MethodDescription   = "Get method information";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetMethod";
    NewLine.SearchMethod  = "GETMETHOD";
    NewLine.Parameter     = "--service";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Service name";
    NewLine.Region      = "Introspection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetMethod";
    NewLine.SearchMethod  = "GETMETHOD";
    NewLine.Parameter     = "--method";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Method name";
    NewLine.Region      = "Introspection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "GetMethod";
    NewLine.SearchMethod  = "GETMETHOD";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Introspection";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessServerStream";
    NewLine.SearchMethod  = "PROCESSSERVERSTREAM";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection parameters";
    NewLine.Region      = "Streaming";
    NewLine.MethodDescription   = "Initializes the server stream and returns an array of received messages";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessServerStream";
    NewLine.SearchMethod  = "PROCESSSERVERSTREAM";
    NewLine.Parameter     = "--service";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Service name";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessServerStream";
    NewLine.SearchMethod  = "PROCESSSERVERSTREAM";
    NewLine.Parameter     = "--method";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Method name";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessServerStream";
    NewLine.SearchMethod  = "PROCESSSERVERSTREAM";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "First request data";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessServerStream";
    NewLine.SearchMethod  = "PROCESSSERVERSTREAM";
    NewLine.Parameter     = "--tout";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Timeout for individual operation (in ms)) (optional, def. val.. - 10000)";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessServerStream";
    NewLine.SearchMethod  = "PROCESSSERVERSTREAM";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessServerStream";
    NewLine.SearchMethod  = "PROCESSSERVERSTREAM";
    NewLine.Parameter     = "--count";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Maximum messages to retrieve. Unlimited by default (optional, def. val.. - Empty value)";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessClientStream";
    NewLine.SearchMethod  = "PROCESSCLIENTSTREAM";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection parameters";
    NewLine.Region      = "Streaming";
    NewLine.MethodDescription   = "Initializes client thread, passes message array, and receives final response";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessClientStream";
    NewLine.SearchMethod  = "PROCESSCLIENTSTREAM";
    NewLine.Parameter     = "--service";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Service name";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessClientStream";
    NewLine.SearchMethod  = "PROCESSCLIENTSTREAM";
    NewLine.Parameter     = "--method";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Method name";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessClientStream";
    NewLine.SearchMethod  = "PROCESSCLIENTSTREAM";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Request data array or single request";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessClientStream";
    NewLine.SearchMethod  = "PROCESSCLIENTSTREAM";
    NewLine.Parameter     = "--tout";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Timeout for individual operation (in ms)) (optional, def. val.. - 10000)";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessClientStream";
    NewLine.SearchMethod  = "PROCESSCLIENTSTREAM";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessBidirectionalStream";
    NewLine.SearchMethod  = "PROCESSBIDIRECTIONALSTREAM";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Existing connection or connection parameters";
    NewLine.Region      = "Streaming";
    NewLine.MethodDescription   = "Initializes a bidirectional stream, then passes and sends messages in the specified order";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessBidirectionalStream";
    NewLine.SearchMethod  = "PROCESSBIDIRECTIONALSTREAM";
    NewLine.Parameter     = "--service";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Service name";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessBidirectionalStream";
    NewLine.SearchMethod  = "PROCESSBIDIRECTIONALSTREAM";
    NewLine.Parameter     = "--method";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Method name";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessBidirectionalStream";
    NewLine.SearchMethod  = "PROCESSBIDIRECTIONALSTREAM";
    NewLine.Parameter     = "--exch";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Array of request data and Undefined where retrieval is needed";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessBidirectionalStream";
    NewLine.SearchMethod  = "PROCESSBIDIRECTIONALSTREAM";
    NewLine.Parameter     = "--tout";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Timeout for individual operation (in ms)) (optional, def. val.. - 10000)";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessBidirectionalStream";
    NewLine.SearchMethod  = "PROCESSBIDIRECTIONALSTREAM";
    NewLine.Parameter     = "--tls";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "TLS settings, if necessary. See GetTlsSettings (optional, def. val.. - Empty value)";
    NewLine.Region      = "Streaming";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "grpc";
    NewLine.Module       = "OPI_GRPC";
    NewLine.Method        = "ProcessBidirectionalStream";
    NewLine.SearchMethod  = "PROCESSBIDIRECTIONALSTREAM";
    NewLine.Parameter     = "--cnt";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Continue receiving after processing the exchange order (optional, def. val.. - True)";
    NewLine.Region      = "Streaming";

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
        |OPI_GRPC = LoadScript(""%1/oint/core/Modules/OPI_GRPC.os"", Context);
        |" + Chars.LF;


EndFunction 
