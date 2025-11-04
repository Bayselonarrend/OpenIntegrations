
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
    NewLine.Library   = "yandex";
    NewLine.Module       = "OPI_YandexID";
    NewLine.Method        = "GetConfirmationCode";
    NewLine.SearchMethod  = "GETCONFIRMATIONCODE";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client id";
    NewLine.Region      = "Public";
    NewLine.MethodDescription   = "Gets the confirmation code and the address of the page where it needs to be entered";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yandex";
    NewLine.Module       = "OPI_YandexID";
    NewLine.Method        = "ConvertCodeToToken";
    NewLine.SearchMethod  = "CONVERTCODETOTOKEN";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client id";
    NewLine.Region      = "Public";
    NewLine.MethodDescription   = "Converts the code to a token after entering the code when executing GetConfirmationCode";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yandex";
    NewLine.Module       = "OPI_YandexID";
    NewLine.Method        = "ConvertCodeToToken";
    NewLine.SearchMethod  = "CONVERTCODETOTOKEN";
    NewLine.Parameter     = "--secret";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Client secret";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yandex";
    NewLine.Module       = "OPI_YandexID";
    NewLine.Method        = "ConvertCodeToToken";
    NewLine.SearchMethod  = "CONVERTCODETOTOKEN";
    NewLine.Parameter     = "--device";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "device_code from GetConfirmationCode()";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yandex";
    NewLine.Module       = "OPI_YandexID";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Client id";
    NewLine.Region      = "Public";
    NewLine.MethodDescription   = "Updates token by Refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yandex";
    NewLine.Module       = "OPI_YandexID";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--secret";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Client secret";
    NewLine.Region      = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "yandex";
    NewLine.Module       = "OPI_YandexID";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--refresh";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Refresh token";
    NewLine.Region      = "Public";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_YandexID = LoadScript(""%1/oint/core/Modules/OPI_YandexID.os"", Context);
        |" + Chars.LF;


EndFunction 
