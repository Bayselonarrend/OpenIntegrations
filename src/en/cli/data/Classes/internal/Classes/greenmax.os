
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
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--api";
    NewLine.Description    = "API host link";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Forms the structure of basic authorization data";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--media";
    NewLine.Description    = "Link to host API for sending files";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--id";
    NewLine.Description    = "Unique instance number";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "FormAccessParameters";
    NewLine.SearchMethod = "FORMACCESSPARAMETERS";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Instance access key";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetAccountInformation";
    NewLine.SearchMethod = "GETACCOUNTINFORMATION";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets account information";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetInstanceSettings";
    NewLine.SearchMethod = "GETINSTANCESETTINGS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets the current instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetInstanceSettings";
    NewLine.SearchMethod = "SETINSTANCESETTINGS";
    NewLine.Parameter    = "--settings";
    NewLine.Description    = "Instance settings. See GetInstanceSettingsStructure";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Sets the instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetInstanceSettings";
    NewLine.SearchMethod = "SETINSTANCESETTINGS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetAuthorizationCode";
    NewLine.SearchMethod = "GETAUTHORIZATIONCODE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Sends an SMS to the specified number to obtain a confirmation code";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetAuthorizationCode";
    NewLine.SearchMethod = "GETAUTHORIZATIONCODE";
    NewLine.Parameter    = "--phone";
    NewLine.Description    = "Phone number without +";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendAuthorizationCode";
    NewLine.SearchMethod = "SENDAUTHORIZATIONCODE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Authorizes the instance using the access code from SMS";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SendAuthorizationCode";
    NewLine.SearchMethod = "SENDAUTHORIZATIONCODE";
    NewLine.Parameter    = "--code";
    NewLine.Description    = "Authorization code";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetInstanceStatus";
    NewLine.SearchMethod = "GETINSTANCESTATUS";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets instance status";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetProfilePicture";
    NewLine.SearchMethod = "SETPROFILEPICTURE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Sets a new profile picture";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "SetProfilePicture";
    NewLine.SearchMethod = "SETPROFILEPICTURE";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Profile picture";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "LogoutInstance";
    NewLine.SearchMethod = "LOGOUTINSTANCE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Unlogging the instance";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "RebootInstance";
    NewLine.SearchMethod = "REBOOTINSTANCE";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Restarts the instance";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CheckAccount";
    NewLine.SearchMethod = "CHECKACCOUNT";
    NewLine.Parameter    = "--access";
    NewLine.Description    = "Access parameters. See FormAccessParameters";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Checks the existence of a Max account by phone number";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CheckAccount";
    NewLine.SearchMethod = "CHECKACCOUNT";
    NewLine.Parameter    = "--phone";
    NewLine.Description    = "Phone number for verification without +";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "CheckAccount";
    NewLine.SearchMethod = "CHECKACCOUNT";
    NewLine.Parameter    = "--force";
    NewLine.Description    = "Ignore cache on repeated verification request (optional, def. val. - False)";
    NewLine.Region     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "greenmax";
    NewLine.Module      = "OPI_GreenMax";
    NewLine.Method       = "GetInstanceSettingsStructure";
    NewLine.SearchMethod = "GETINSTANCESETTINGSSTRUCTURE";
    NewLine.Parameter    = "--empty";
    NewLine.Description    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region     = "Account";
    NewLine.MethodDescription   = "Gets the structure template for instance settings";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_GreenMax = LoadScript(""%1/oint/core/Modules/OPI_GreenMax.os"", Context);
        |" + Chars.LF;


EndFunction 
