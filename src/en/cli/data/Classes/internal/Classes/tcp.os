
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
    NewLine.Library  = "tcp";
    NewLine.Module      = "OPI_TCP";
    NewLine.Method       = "ProcessRequest";
    NewLine.SearchMethod = "PROCESSREQUEST";
    NewLine.Parameter    = "--address";
    NewLine.Description    = "Address and port";
    NewLine.Region     = "Client methods";
    NewLine.MethodDescription   = "Sends a single request to a specified address and receives a response using the default settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tcp";
    NewLine.Module      = "OPI_TCP";
    NewLine.Method       = "ProcessRequest";
    NewLine.SearchMethod = "PROCESSREQUEST";
    NewLine.Parameter    = "--data";
    NewLine.Description    = "Data or text to be sent (optional, def. val. - Empty value)";
    NewLine.Region     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tcp";
    NewLine.Module      = "OPI_TCP";
    NewLine.Method       = "ProcessRequest";
    NewLine.SearchMethod = "PROCESSREQUEST";
    NewLine.Parameter    = "--string";
    NewLine.Description    = "An attribute of receiving the response as a string (optional, def. val. - True)";
    NewLine.Region     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tcp";
    NewLine.Module      = "OPI_TCP";
    NewLine.Method       = "ProcessRequest";
    NewLine.SearchMethod = "PROCESSREQUEST";
    NewLine.Parameter    = "--tls";
    NewLine.Description    = "TLS settings, if necessary. See GetTlsSettings (optional, def. val. - Empty value)";
    NewLine.Region     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tcp";
    NewLine.Module      = "OPI_TCP";
    NewLine.Method       = "GetTlsSettings";
    NewLine.SearchMethod = "GETTLSSETTINGS";
    NewLine.Parameter    = "--trust";
    NewLine.Description    = "Allows to work with invalid certificates, including self signed";
    NewLine.Region     = "Client methods";
    NewLine.MethodDescription   = "Forms settings for using TLS";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tcp";
    NewLine.Module      = "OPI_TCP";
    NewLine.Method       = "GetTlsSettings";
    NewLine.SearchMethod = "GETTLSSETTINGS";
    NewLine.Parameter    = "--cert";
    NewLine.Description    = "Path to the root PEM file of the certificate if it is not in the system repository (optional, def. val. - Empty value)";
    NewLine.Region     = "Client methods";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        | Context = New Structure;
        | Context.Insert(""OPI_TCP"", Undefined);
        | Context.Insert(""OPI_AddIns"", Undefined);
        | Context.Insert(""OPI_TypeConversion"", Undefined);
        | Context.Insert(""OPI_HTTPRequests"", Undefined);
        | Context.Insert(""OPI_HTTPClient"", Undefined);
        | Context.Insert(""OPI_Cryptography"", Undefined);
        | Context.Insert(""OPI_Tools"", Undefined);
        | 
        | OPI_TCP = LoadScript(""%1/oint/core/Modules/OPI_TCP.os"", Context);
        | Context.Insert(""OPI_TCP"", OPI_TCP);
        | OPI_AddIns = LoadScript(""%1/oint/tools/Modules/OPI_AddIns.os"", Context);
        | Context.Insert(""OPI_AddIns"", OPI_AddIns);
        | OPI_TypeConversion = LoadScript(""%1/oint/tools/Modules/OPI_TypeConversion.os"", Context);
        | Context.Insert(""OPI_TypeConversion"", OPI_TypeConversion);
        | OPI_HTTPRequests = LoadScript(""%1/oint/tools/Modules/OPI_HTTPRequests.os"", Context);
        | Context.Insert(""OPI_HTTPRequests"", OPI_HTTPRequests);
        | OPI_HTTPClient = LoadScript(""%1/oint/tools/Modules/internal/Classes/OPI_HTTPClient.os"", Context);
        | Context.Insert(""OPI_HTTPClient"", OPI_HTTPClient);
        | OPI_Cryptography = LoadScript(""%1/oint/tools/Modules/internal/Modules/OPI_Cryptography.os"", Context);
        | Context.Insert(""OPI_Cryptography"", OPI_Cryptography);
        | OPI_Tools = LoadScript(""%1/oint/tools/Modules/internal/Modules/OPI_Tools.os"", Context);
        | Context.Insert(""OPI_Tools"", OPI_Tools);
        |" + Chars.LF;


EndFunction 
