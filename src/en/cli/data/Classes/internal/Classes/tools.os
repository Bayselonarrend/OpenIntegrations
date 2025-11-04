
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
    NewLine.Library  = "tools";
    NewLine.Module      = "Utils";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "PARSEJSON";
    NewLine.Parameter    = "--json";
    NewLine.Description    = "JSON data";
    NewLine.Region     = "Service";
    NewLine.MethodDescription   = "Displays the values that can be obtained from the passed JSON and returns
    |    Specific Value When Specifying Field Name";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Utils";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "PARSEJSON";
    NewLine.Parameter    = "--nesting";
    NewLine.Description    = "Parsing depth limit. Full depth by default (optional, def. val. - Empty value)";
    NewLine.Region     = "Service";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Utils";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "PARSEJSON";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Field name to retrieve. Displays the entire list if not specified (optional, def. val. - Empty value)";
    NewLine.Region     = "Service";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Utils";
    NewLine.Method       = "ParseJSON";
    NewLine.SearchMethod = "PARSEJSON";
    NewLine.Parameter    = "--enc";
    NewLine.Description    = "Encoding of JSON Data (optional, def. val. - UTF-8)";
    NewLine.Region     = "Service";


    NewLine = CompositionTable.Add();
    NewLine.Library  = "tools";
    NewLine.Module      = "Utils";
    NewLine.Method       = "ConvertBase64ToBinary";
    NewLine.SearchMethod = "ПРЕОБРАЗОInATЬBASE64InДInОAndЧNЫЕ";
    NewLine.Parameter    = "--in";
    NewLine.Description    = "Base64 File";
    NewLine.Region     = "Service";
    NewLine.MethodDescription   = "Convert file with Base64 string to binary file";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |Utils = LoadScript(""C:/ProgramData/Jenkins/.jenkins/workspace/OpiBuild/OpiMain/src/en/cli/tools/Modules/Utils.os"", Context);
        |" + Chars.LF;


EndFunction 
