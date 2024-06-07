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
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "GetConfirmationCode";
    NewLine.SearchMethod = "GETCONFIRMATIONCODE";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client id";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Gets the confirmation code and the address of the page where it needs to be entered";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "ConvertCodeToToken";
    NewLine.SearchMethod = "CONVERTCODETOTOKEN";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client id";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Converts the code to a token after entering the code when executing GetConfirmationCode";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "ConvertCodeToToken";
    NewLine.SearchMethod = "CONVERTCODETOTOKEN";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "ConvertCodeToToken";
    NewLine.SearchMethod = "CONVERTCODETOTOKEN";
    NewLine.Parameter    = "--device";
    NewLine.Description    = "device_code from GetConfirmationCode()";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client id";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Updates token by Refresh token";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--refresh";
    NewLine.Description    = "Refresh token";
    NewLine.Region     = "Public";

    Return TableСоwithтаinа;
EndFunction

