
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
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "CreateTag";
    NewLine.SearchMethod  = "CREATETAG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Creates a tag with the specified name";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "CreateTag";
    NewLine.SearchMethod  = "CREATETAG";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Tag title";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "UpdateTag";
    NewLine.SearchMethod  = "UPDATETAG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Changes the tag name by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "UpdateTag";
    NewLine.SearchMethod  = "UPDATETAG";
    NewLine.Parameter     = "--label";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Tag ID to change";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "UpdateTag";
    NewLine.SearchMethod  = "UPDATETAG";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New name";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetTag";
    NewLine.SearchMethod  = "GETTAG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Gets the tag by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetTag";
    NewLine.SearchMethod  = "GETTAG";
    NewLine.Parameter     = "--label";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Tag ID";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "DeleteTag";
    NewLine.SearchMethod  = "DELETETAG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Deletes a tag by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "DeleteTag";
    NewLine.SearchMethod  = "DELETETAG";
    NewLine.Parameter     = "--label";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "ID of the tag to be deleted";
    NewLine.Region      = "Tags management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetTagsList";
    NewLine.SearchMethod  = "GETTAGSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Tags management";
    NewLine.MethodDescription   = "Gets a list of the users tags";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "CreateCounter";
    NewLine.SearchMethod  = "CREATECOUNTER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Creates a counter by field description";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "CreateCounter";
    NewLine.SearchMethod  = "CREATECOUNTER";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Counter structure. See GetCounterStructure";
    NewLine.Region      = "Counters management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "UpdateCounter";
    NewLine.SearchMethod  = "UPDATECOUNTER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Changes counter field values by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "UpdateCounter";
    NewLine.SearchMethod  = "UPDATECOUNTER";
    NewLine.Parameter     = "--counter";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Counter ID to change";
    NewLine.Region      = "Counters management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "UpdateCounter";
    NewLine.SearchMethod  = "UPDATECOUNTER";
    NewLine.Parameter     = "--fields";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Structure of fields to be changed. See GetCounterStructure";
    NewLine.Region      = "Counters management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetCounter";
    NewLine.SearchMethod  = "GETCOUNTER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Gets information about the counter by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetCounter";
    NewLine.SearchMethod  = "GETCOUNTER";
    NewLine.Parameter     = "--counter";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Counter ID";
    NewLine.Region      = "Counters management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "DeleteCounter";
    NewLine.SearchMethod  = "DELETECOUNTER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Deletes a counter by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "DeleteCounter";
    NewLine.SearchMethod  = "DELETECOUNTER";
    NewLine.Parameter     = "--counter";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Counter ID for deletion";
    NewLine.Region      = "Counters management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "RestoreCounter";
    NewLine.SearchMethod  = "RESTORECOUNTER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Restores a previously deleted counter by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "RestoreCounter";
    NewLine.SearchMethod  = "RESTORECOUNTER";
    NewLine.Parameter     = "--counter";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Counter ID for restoring";
    NewLine.Region      = "Counters management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetCountersList";
    NewLine.SearchMethod  = "GETCOUNTERSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Gets a list of available counters with or without filtering";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetCountersList";
    NewLine.SearchMethod  = "GETCOUNTERSLIST";
    NewLine.Parameter     = "--filter";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "List filter. See GetCounterFilterStructure (optional, def. val. - Empty value)";
    NewLine.Region      = "Counters management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetCounterStructure";
    NewLine.SearchMethod  = "GETCOUNTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Gets the structure of standard fields for counter creation";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetCounterFilterStructure";
    NewLine.SearchMethod  = "GETCOUNTERFILTERSTRUCTURE";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - False)";
    NewLine.Region      = "Counters management";
    NewLine.MethodDescription   = "Gets the structure of filter fields to get the list of counters";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetActionsList";
    NewLine.SearchMethod  = "GETACTIONSLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Actions management";
    NewLine.MethodDescription   = "Gets the list of actions of the selected counter";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "metrika";
    NewLine.Module       = "OPI_YandexMetrika";
    NewLine.Method        = "GetActionsList";
    NewLine.SearchMethod  = "GETACTIONSLIST";
    NewLine.Parameter     = "--counter";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Counter ID";
    NewLine.Region      = "Actions management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;
        |Context.Insert(""OPI_YandexID"", Undefined);
        |
        |OPI_YandexID = LoadScript(""%1/oint/core/Modules/OPI_YandexID.os"", Context);
        |Context.Insert(""OPI_YandexID"", OPI_YandexID);
        |
        |OPI_YandexMetrika = LoadScript(""%1/oint/core/Modules/OPI_YandexMetrika.os"", Context);
        |" + Chars.LF;


EndFunction 
