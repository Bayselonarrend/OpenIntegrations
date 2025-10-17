
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
