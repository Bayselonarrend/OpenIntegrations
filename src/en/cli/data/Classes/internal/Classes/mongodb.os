Function ПолучитьСостав() Export

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Библиотека");
    CompositionTable.Columns.Add("Модуль");
    CompositionTable.Columns.Add("Метод");
    CompositionTable.Columns.Add("МетодПоиска");
    CompositionTable.Columns.Add("Параметр");
    CompositionTable.Columns.Add("Описание");
    CompositionTable.Columns.Add("ОписаниеМетода");
    CompositionTable.Columns.Add("Область");

    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "mongodb";
    NewLine.Модуль      = "OPI_MongoDB";
    NewLine.Метод       = "GetListOfBases";
    NewLine.МетодПоиска = "GETLISTOFBASES";
    NewLine.Параметр    = "--connect";
    NewLine.Описание    = "Connection string to MongoDB server";
    NewLine.Область     = "Database management";
    NewLine.ОписаниеМетода   = "Gets a list of bases";

    Return CompositionTable;
EndFunction

