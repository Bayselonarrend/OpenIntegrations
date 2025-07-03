
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
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client ID";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Returns URL for browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--calendar";
    NewLine.Description    = "Calendar methods permission (optional, def. val. - True)";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--drive";
    NewLine.Description    = "Drive methods permission (optional, def. val. - True)";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--sheets";
    NewLine.Description    = "Sheets methods permission (optional, def. val. - True)";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetTokenByCode";
    NewLine.SearchMethod = "GETTOKENBYCODE";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client ID";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Gets token by code from browser authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetTokenByCode";
    NewLine.SearchMethod = "GETTOKENBYCODE";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetTokenByCode";
    NewLine.SearchMethod = "GETTOKENBYCODE";
    NewLine.Parameter    = "--code";
    NewLine.Description    = "Code from browser";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client ID";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Updates token by Refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--refresh";
    NewLine.Description    = "Refresh token";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetServiceAccountToken";
    NewLine.SearchMethod = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "JSON authorization data as a file, collection or binary data";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Gets authorization token by service account data";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetServiceAccountToken";
    NewLine.SearchMethod = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter    = "--scope";
    NewLine.Description    = "Scope or array of scopes";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetServiceAccountToken";
    NewLine.SearchMethod = "GETSERVICEACCOUNTTOKEN";
    NewLine.Parameter    = "--exp";
    NewLine.Description    = "Token lifetime in seconds (optional, def. val. - 3600)";
    NewLine.Region     = "Public";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        | Context = New Structure;
        | Context.Insert(""OPI_GoogleWorkspace"", Undefined);
        | Context.Insert(""OPI_HTTPRequests"", Undefined);
        | Context.Insert(""OPI_TypeConversion"", Undefined);
        | Context.Insert(""OPI_Tools"", Undefined);
        | Context.Insert(""OPI_HTTPClient"", Undefined);
        | Context.Insert(""OPI_Cryptography"", Undefined);
        | Context.Insert(""OPI_AddIns"", Undefined);
        | 
        | OPI_GoogleWorkspace = LoadScript(""%1/oint/core/Modules/OPI_GoogleWorkspace.os"", Context);
        | Context.Insert(""OPI_GoogleWorkspace"", OPI_GoogleWorkspace);
        | OPI_HTTPRequests = LoadScript(""%1/oint/tools/Modules/OPI_HTTPRequests.os"", Context);
        | Context.Insert(""OPI_HTTPRequests"", OPI_HTTPRequests);
        | OPI_TypeConversion = LoadScript(""%1/oint/tools/Modules/OPI_TypeConversion.os"", Context);
        | Context.Insert(""OPI_TypeConversion"", OPI_TypeConversion);
        | OPI_Tools = LoadScript(""%1/oint/tools/Modules/internal/Modules/OPI_Tools.os"", Context);
        | Context.Insert(""OPI_Tools"", OPI_Tools);
        | OPI_HTTPClient = LoadScript(""%1/oint/tools/Modules/internal/Classes/OPI_HTTPClient.os"", Context);
        | Context.Insert(""OPI_HTTPClient"", OPI_HTTPClient);
        | OPI_Cryptography = LoadScript(""%1/oint/tools/Modules/internal/Modules/OPI_Cryptography.os"", Context);
        | Context.Insert(""OPI_Cryptography"", OPI_Cryptography);
        | OPI_AddIns = LoadScript(""%1/oint/tools/Modules/OPI_AddIns.os"", Context);
        | Context.Insert(""OPI_AddIns"", OPI_AddIns);
        |" + Chars.LF;


EndFunction 
