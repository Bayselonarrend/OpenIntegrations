
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
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "GetConfirmationCode";
    NewLine.SearchMethod = "GETCONFIRMATIONCODE";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client id";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Gets the confirmation code and the address of the page where it needs to be entered";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "ConvertCodeToToken";
    NewLine.SearchMethod = "CONVERTCODETOTOKEN";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client id";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Converts the code to a token after entering the code when executing GetConfirmationCode";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "ConvertCodeToToken";
    NewLine.SearchMethod = "CONVERTCODETOTOKEN";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "ConvertCodeToToken";
    NewLine.SearchMethod = "CONVERTCODETOTOKEN";
    NewLine.Parameter    = "--device";
    NewLine.Description    = "device_code from GetConfirmationCode()";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Client id";
    NewLine.Region     = "Public";
    NewLine.MethodDescription   = "Updates token by Refresh token";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--secret";
    NewLine.Description    = "Client secret";
    NewLine.Region     = "Public";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "yandex";
    NewLine.Module      = "OPI_YandexID";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--refresh";
    NewLine.Description    = "Refresh token";
    NewLine.Region     = "Public";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        | Context = New Structure;
        | Context.Insert(""OPI_YandexID"", Undefined);
        | Context.Insert(""OPI_HTTPRequests"", Undefined);
        | Context.Insert(""OPI_TypeConversion"", Undefined);
        | Context.Insert(""OPI_Tools"", Undefined);
        | Context.Insert(""OPI_HTTPClient"", Undefined);
        | Context.Insert(""OPI_Cryptography"", Undefined);
        | Context.Insert(""OPI_AddIns"", Undefined);
        | 
        | OPI_YandexID = LoadScript(""%1/oint/core/Modules/OPI_YandexID.os"", Context);
        | Context.Insert(""OPI_YandexID"", OPI_YandexID);
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
