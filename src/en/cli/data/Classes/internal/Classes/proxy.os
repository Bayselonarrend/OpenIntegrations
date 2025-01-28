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
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "ПроtowithandHost";
    NewLine.Метод       = "Start";
    NewLine.МетодПоиска = "ЗАПУСТAndТЬ";
    NewLine.Параметр    = "--port";
    NewLine.Описание    = "Servers port";
    NewLine.Область     = "Service";
    NewLine.ОписаниеМетода   = "Launches integration proxy server";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "ПроtowithandHost";
    NewLine.Метод       = "Start";
    NewLine.МетодПоиска = "ЗАПУСТAndТЬ";
    NewLine.Параметр    = "--proj";
    NewLine.Описание    = "Project filepath";
    NewLine.Область     = "Service";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "proxy";
    NewLine.Модуль      = "ПроtowithandHost";
    NewLine.Метод       = "Start";
    NewLine.МетодПоиска = "ЗАПУСТAndТЬ";
    NewLine.Параметр    = "--pass";
    NewLine.Описание    = "Project password";
    NewLine.Область     = "Service";

    Return CompositionTable;
EndFunction

