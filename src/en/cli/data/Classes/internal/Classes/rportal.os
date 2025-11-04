
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
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetTemporaryToken";
    NewLine.SearchMethod  = "GETTEMPORARYTOKEN";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Gets a temporary token based on login and password";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetTemporaryToken";
    NewLine.SearchMethod  = "GETTEMPORARYTOKEN";
    NewLine.Parameter     = "--login";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Users login";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetTemporaryToken";
    NewLine.SearchMethod  = "GETTEMPORARYTOKEN";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Users password";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetPermanentToken";
    NewLine.SearchMethod  = "GETPERMANENTTOKEN";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Creates a permanent ReportPortal user token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetPermanentToken";
    NewLine.SearchMethod  = "GETPERMANENTTOKEN";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetPermanentToken";
    NewLine.SearchMethod  = "GETPERMANENTTOKEN";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetPermanentToken";
    NewLine.SearchMethod  = "GETPERMANENTTOKEN";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Token name";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "DeletePermanentToken";
    NewLine.SearchMethod  = "DELETEPERMANENTTOKEN";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Deletes a previously created user token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "DeletePermanentToken";
    NewLine.SearchMethod  = "DELETEPERMANENTTOKEN";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "DeletePermanentToken";
    NewLine.SearchMethod  = "DELETEPERMANENTTOKEN";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "DeletePermanentToken";
    NewLine.SearchMethod  = "DELETEPERMANENTTOKEN";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Token ID";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateLaunch";
    NewLine.SearchMethod  = "CREATELAUNCH";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Starts a new test execution session";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateLaunch";
    NewLine.SearchMethod  = "CREATELAUNCH";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateLaunch";
    NewLine.SearchMethod  = "CREATELAUNCH";
    NewLine.Parameter     = "--proj";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Project ID";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateLaunch";
    NewLine.SearchMethod  = "CREATELAUNCH";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Launch parameters. See GetLaunchStructure";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateItem";
    NewLine.SearchMethod  = "CREATEITEM";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Creates a new test item";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateItem";
    NewLine.SearchMethod  = "CREATEITEM";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateItem";
    NewLine.SearchMethod  = "CREATEITEM";
    NewLine.Parameter     = "--proj";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Project ID";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateItem";
    NewLine.SearchMethod  = "CREATEITEM";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Item parameters. See GetItemStructure";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "CreateItem";
    NewLine.SearchMethod  = "CREATEITEM";
    NewLine.Parameter     = "--parent";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "ID of the parent item, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishLaunch";
    NewLine.SearchMethod  = "FINISHLAUNCH";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Ends a previously started test execution session";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishLaunch";
    NewLine.SearchMethod  = "FINISHLAUNCH";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishLaunch";
    NewLine.SearchMethod  = "FINISHLAUNCH";
    NewLine.Parameter     = "--proj";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Project ID";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishLaunch";
    NewLine.SearchMethod  = "FINISHLAUNCH";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Launch ID";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishLaunch";
    NewLine.SearchMethod  = "FINISHLAUNCH";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Completion parameters. See GetLaunchCompletionStructure";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishItem";
    NewLine.SearchMethod  = "FINISHITEM";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Ends a previously created test item";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishItem";
    NewLine.SearchMethod  = "FINISHITEM";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishItem";
    NewLine.SearchMethod  = "FINISHITEM";
    NewLine.Parameter     = "--proj";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Project ID";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishItem";
    NewLine.SearchMethod  = "FINISHITEM";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Element ID";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "FinishItem";
    NewLine.SearchMethod  = "FINISHITEM";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Completion parameters. See GetItemCompletionStructure";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLaunchStructure";
    NewLine.SearchMethod  = "GETLAUNCHSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Gets the launch parameters structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLaunchStructure";
    NewLine.SearchMethod  = "GETLAUNCHSTRUCTURE";
    NewLine.Parameter     = "--map";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "True > returns the filter fields as a map (optional, def. val. - False)";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetItemStructure";
    NewLine.SearchMethod  = "GETITEMSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Gets the test item parameter structure";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetItemStructure";
    NewLine.SearchMethod  = "GETITEMSTRUCTURE";
    NewLine.Parameter     = "--map";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "True > returns the filter fields as a map (optional, def. val. - False)";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetItemCompletionStructure";
    NewLine.SearchMethod  = "GETITEMCOMPLETIONSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Gets the parameter structure for completing the test item execution";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetItemCompletionStructure";
    NewLine.SearchMethod  = "GETITEMCOMPLETIONSTRUCTURE";
    NewLine.Parameter     = "--map";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "True > returns the filter fields as a map (optional, def. val. - False)";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLaunchCompletionStructure";
    NewLine.SearchMethod  = "GETLAUNCHCOMPLETIONSTRUCTURE";
    NewLine.Parameter     = "--end";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Launch end date and time";
    NewLine.Region      = "Results management";
    NewLine.MethodDescription   = "Gets the parameter structure for completing a test session";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLaunchCompletionStructure";
    NewLine.SearchMethod  = "GETLAUNCHCOMPLETIONSTRUCTURE";
    NewLine.Parameter     = "--status";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Completion status: passed, failed, stopped, skipped, interrupted, cancelled (optional, def. val. - Empty value)";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLaunchCompletionStructure";
    NewLine.SearchMethod  = "GETLAUNCHCOMPLETIONSTRUCTURE";
    NewLine.Parameter     = "--descr";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Launch description. Overwrites the one specified during creation (optional, def. val. - Empty value)";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLaunchCompletionStructure";
    NewLine.SearchMethod  = "GETLAUNCHCOMPLETIONSTRUCTURE";
    NewLine.Parameter     = "--attr";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Launch attributes. Overwrites the one specified during creation (optional, def. val. - Empty value)";
    NewLine.Region      = "Results management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "WriteLog";
    NewLine.SearchMethod  = "WRITELOG";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "ReportPortal server URL";
    NewLine.Region      = "Log recording";
    NewLine.MethodDescription   = "Adds execution information for the test item";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "WriteLog";
    NewLine.SearchMethod  = "WRITELOG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Access token";
    NewLine.Region      = "Log recording";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "WriteLog";
    NewLine.SearchMethod  = "WRITELOG";
    NewLine.Parameter     = "--proj";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Project ID";
    NewLine.Region      = "Log recording";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "WriteLog";
    NewLine.SearchMethod  = "WRITELOG";
    NewLine.Parameter     = "--params";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Execution information. See GetLogStructure";
    NewLine.Region      = "Log recording";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLogStructure";
    NewLine.SearchMethod  = "GETLOGSTRUCTURE";
    NewLine.Parameter     = "--launch";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Launch ID to which the test item belongs";
    NewLine.Region      = "Log recording";
    NewLine.MethodDescription   = "Gets the parameter structure for log entry";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLogStructure";
    NewLine.SearchMethod  = "GETLOGSTRUCTURE";
    NewLine.Parameter     = "--id";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Test item ID";
    NewLine.Region      = "Log recording";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLogStructure";
    NewLine.SearchMethod  = "GETLOGSTRUCTURE";
    NewLine.Parameter     = "--time";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Log entry date and time";
    NewLine.Region      = "Log recording";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLogStructure";
    NewLine.SearchMethod  = "GETLOGSTRUCTURE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Log text information (optional, def. val. - Empty value)";
    NewLine.Region      = "Log recording";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rportal";
    NewLine.Module       = "OPI_ReportPortal";
    NewLine.Method        = "GetLogStructure";
    NewLine.SearchMethod  = "GETLOGSTRUCTURE";
    NewLine.Parameter     = "--level";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Information level: error, warn, info, debug, trace, fatal, unknown (optional, def. val. - info)";
    NewLine.Region      = "Log recording";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_ReportPortal = LoadScript(""%1/oint/core/Modules/OPI_ReportPortal.os"", Context);
        |" + Chars.LF;


EndFunction 
