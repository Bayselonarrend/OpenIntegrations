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
    NewLine.Модуль      = "Утorты";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "РАЗЛОЖAndТЬJSON";
    NewLine.Параметр    = "--json";
    NewLine.Описание    = "JSON data";
    NewLine.Область     = "Служебный программный andнтерфейwith";
    NewLine.ОписаниеМетода   = "Displays the values that can be obtained from the passed JSON and returns
    |    Specific Value When Specifying Field Name";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "Утorты";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "РАЗЛОЖAndТЬJSON";
    NewLine.Параметр    = "--nesting";
    NewLine.Описание    = "Parsing depth limit. Full depth by default (optional, def. val. - Empty)";
    NewLine.Область     = "Служебный программный andнтерфейwith";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "Утorты";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "РАЗЛОЖAndТЬJSON";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Field name to retrieve. Displays the entire list if not specified (optional, def. val. - Empty)";
    NewLine.Область     = "Служебный программный andнтерфейwith";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "Утorты";
    NewLine.Метод       = "ParseJSON";
    NewLine.МетодПоиска = "РАЗЛОЖAndТЬJSON";
    NewLine.Параметр    = "--enc";
    NewLine.Описание    = "Encoding of JSON Data (optional, def. val. - UTF-8)";
    NewLine.Область     = "Служебный программный andнтерфейwith";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tools";
    NewLine.Модуль      = "Утorты";
    NewLine.Метод       = "ConvertBase64ToBinary";
    NewLine.МетодПоиска = "ПРЕОБРАЗОInАТЬBASE64InДInОAndЧNЫЕ";
    NewLine.Параметр    = "--in";
    NewLine.Описание    = "Base64 File";
    NewLine.Область     = "Служебный программный andнтерфейwith";
    NewLine.ОписаниеМетода   = "Convert file with Base64 string to binary file";

    Return CompositionTable;
EndFunction

