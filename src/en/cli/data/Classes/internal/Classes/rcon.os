
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
    NewLine.Library   = "rcon";
    NewLine.Module       = "OPI_RCON";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--exec";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Command text";
    NewLine.Region      = "Commands execution";
    NewLine.MethodDescription   = "Executes the command on the server";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rcon";
    NewLine.Module       = "OPI_RCON";
    NewLine.Method        = "ExecuteCommand";
    NewLine.SearchMethod  = "EXECUTECOMMAND";
    NewLine.Parameter     = "--conn";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Connection or connection parameters";
    NewLine.Region      = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rcon";
    NewLine.Module       = "OPI_RCON";
    NewLine.Method        = "FormConnectionParameters";
    NewLine.SearchMethod  = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Server URL";
    NewLine.Region      = "Commands execution";
    NewLine.MethodDescription   = "Forms a collection of connection parameters";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rcon";
    NewLine.Module       = "OPI_RCON";
    NewLine.Method        = "FormConnectionParameters";
    NewLine.SearchMethod  = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter     = "--pass";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Password for connection";
    NewLine.Region      = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rcon";
    NewLine.Module       = "OPI_RCON";
    NewLine.Method        = "FormConnectionParameters";
    NewLine.SearchMethod  = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter     = "--rtout";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Response timeout (in seconds) (optional, def. val.. - 30)";
    NewLine.Region      = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "rcon";
    NewLine.Module       = "OPI_RCON";
    NewLine.Method        = "FormConnectionParameters";
    NewLine.SearchMethod  = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter     = "--wtout";
    NewLine.ParameterTrim = "-w";
    NewLine.Description     = "Request sending timeout (in seconds) (optional, def. val.. - 30)";
    NewLine.Region      = "Commands execution";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_RCON"", Undefined);
        |
        |OPI_RCON = LoadScript(""%1/oint/core/Modules/OPI_RCON.os"", Context);
        |Context.Insert(""OPI_RCON"", OPI_RCON);
        |
        |OPI_RCON = LoadScript(""%1/oint/core/Modules/OPI_RCON.os"", Context);
        |" + Chars.LF;


EndFunction 
