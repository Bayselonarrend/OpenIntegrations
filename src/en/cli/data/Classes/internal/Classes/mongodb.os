
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
    NewLine.Library  = "mongodb";
    NewLine.Module      = "OPI_MongoDB";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--addr";
    NewLine.Description    = "Host IP address with port or URL";
    NewLine.Region     = "Common methods";
    NewLine.MethodDescription   = "Forms a MongoDB connection string";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "mongodb";
    NewLine.Module      = "OPI_MongoDB";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--db";
    NewLine.Description    = "Database, if necessary (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "mongodb";
    NewLine.Module      = "OPI_MongoDB";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--usr";
    NewLine.Description    = "Username for authorization (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "mongodb";
    NewLine.Module      = "OPI_MongoDB";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--pwd";
    NewLine.Description    = "Password for authorization (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "mongodb";
    NewLine.Module      = "OPI_MongoDB";
    NewLine.Method       = "GenerateConnectionString";
    NewLine.SearchMethod = "GENERATECONNECTIONSTRING";
    NewLine.Parameter    = "--params";
    NewLine.Description    = "Additional connection parameters (optional, def. val. - Empty value)";
    NewLine.Region     = "Common methods";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_MongoDB"", Undefined);
        |
        |OPI_MongoDB = LoadScript(""%1/oint/core/Modules/OPI_MongoDB.os"", Context);
        |Context.Insert(""OPI_MongoDB"", OPI_MongoDB);
        |
        |OPI_MongoDB = LoadScript(""%1/oint/core/Modules/OPI_MongoDB.os"", Context);
        |" + Chars.LF;


EndFunction 
