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
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "";
    NewLine.Параметр    = "--json";
    NewLine.Описание    = "JSON data";
    NewLine.Область     = "";
    NewLine.ОписаниеМетода   = "Displays the values that can be obtained from the passed JSON and returns
    |    Specific Value When Specifying Field Name";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "";
    NewLine.Параметр    = "--nesting";
    NewLine.Описание    = ")";
    NewLine.Область     = "";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = ")";
    NewLine.Область     = "";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "";
    NewLine.Параметр    = "--enc";
    NewLine.Описание    = ")";
    NewLine.Область     = "";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "";
    NewLine.Метод       = "ConvertBase64ToBinary";
    NewLine.МетодПоиска = "";
    NewLine.Параметр    = "--in";
    NewLine.Описание    = "Base64 File";
    NewLine.Область     = "";
    NewLine.ОписаниеМетода   = "Convert file with Base64 string to binary file";

    Return CompositionTable;
EndFunction

