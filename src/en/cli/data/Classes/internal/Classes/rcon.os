
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
    NewLine.Library  = "rcon";
    NewLine.Module      = "OPI_RCON";
    NewLine.Method       = "ExecuteCommand";
    NewLine.SearchMethod = "EXECUTECOMMAND";
    NewLine.Parameter    = "--exec";
    NewLine.Description    = "Command text";
    NewLine.Region     = "Commands execution";
    NewLine.MethodDescription   = "Executes the command on the server";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "rcon";
    NewLine.Module      = "OPI_RCON";
    NewLine.Method       = "ExecuteCommand";
    NewLine.SearchMethod = "EXECUTECOMMAND";
    NewLine.Parameter    = "--conn";
    NewLine.Description    = "Connection or connection parameters";
    NewLine.Region     = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "rcon";
    NewLine.Module      = "OPI_RCON";
    NewLine.Method       = "FormConnectionParameters";
    NewLine.SearchMethod = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Server URL";
    NewLine.Region     = "Commands execution";
    NewLine.MethodDescription   = "Forms a collection of connection parameters";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "rcon";
    NewLine.Module      = "OPI_RCON";
    NewLine.Method       = "FormConnectionParameters";
    NewLine.SearchMethod = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter    = "--pass";
    NewLine.Description    = "Password for connection";
    NewLine.Region     = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "rcon";
    NewLine.Module      = "OPI_RCON";
    NewLine.Method       = "FormConnectionParameters";
    NewLine.SearchMethod = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter    = "--rtout";
    NewLine.Description    = "Response timeout (in seconds) (optional, def. val. - 30)";
    NewLine.Region     = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "rcon";
    NewLine.Module      = "OPI_RCON";
    NewLine.Method       = "FormConnectionParameters";
    NewLine.SearchMethod = "FORMCONNECTIONPARAMETERS";
    NewLine.Parameter    = "--wtout";
    NewLine.Description    = "Request sending timeout (in seconds) (optional, def. val. - 30)";
    NewLine.Region     = "Commands execution";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        | Context = New Structure;
        | Context.Insert(""OPI_RCON"", Undefined);
        | Context.Insert(""OPI_AddIns"", Undefined);
        | Context.Insert(""OPI_TypeConversion"", Undefined);
        | Context.Insert(""OPI_HTTPRequests"", Undefined);
        | Context.Insert(""OPI_HTTPClient"", Undefined);
        | Context.Insert(""OPI_Cryptography"", Undefined);
        | Context.Insert(""OPI_Tools"", Undefined);
        | 
        | OPI_RCON = LoadScript(""%1/oint/core/Modules/OPI_RCON.os"", Context);
        | Context.Insert(""OPI_RCON"", OPI_RCON);
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
