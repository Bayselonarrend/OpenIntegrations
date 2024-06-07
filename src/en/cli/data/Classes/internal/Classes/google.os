Function GetComposition() Export

    TableСоwithтаinа = New ValueTable();
    TableСоwithтаinа.Columns.Add("Library");
    TableСоwithтаinа.Columns.Add("Module");
    TableСоwithтаinа.Columns.Add("Method");
    TableСоwithтаinа.Columns.Add("SearchMethod");
    TableСоwithтаinа.Columns.Add("Parameter");
    TableСоwithтаinа.Columns.Add("Description");
    TableСоwithтаinа.Columns.Add("MethodDescription");
    TableСоwithтаinа.Columns.Add("Region");

    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client ID";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Returns URL for browser authorization";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--calendar";
    NewLine.Description    = "Calendar methods permission (optional, def. val. - Да)";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--drive";
    NewLine.Description    = "Drive methods permission (optional, def. val. - Да)";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "FormCodeRetrievalLink";
    NewLine.SearchMethod = "FORMCODERETRIEVALLINK";
    NewLine.Parameter    = "--sheets";
    NewLine.Description    = "Sheets methods permission (optional, def. val. - Да)";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetTokenByCode";
    NewLine.SearchMethod = "GETTOKENBYCODE";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client ID";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Gets token by code from browser authorization";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetTokenByCode";
    NewLine.SearchMethod = "GETTOKENBYCODE";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "GetTokenByCode";
    NewLine.SearchMethod = "GETTOKENBYCODE";
    NewLine.Parameter    = "--code";
    NewLine.Description    = "Code from browser";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client ID";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Updates token by Refresh token";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "google";
    NewLine.Module      = "OPI_GoogleWorkspace";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--refresh";
    NewLine.Description    = "Refresh token";
    NewLine.Region     = "Public";

    Return TableСоwithтаinа;
EndFunction

