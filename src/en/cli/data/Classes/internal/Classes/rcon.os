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
    NewLine.Библиотека  = "rcon";
    NewLine.Модуль      = "OPI_RCON";
    NewLine.Метод       = "ExecuteCommand";
    NewLine.МетодПоиска = "EXECUTECOMMAND";
    NewLine.Параметр    = "--exec";
    NewLine.Описание    = "Command text";
    NewLine.Область     = "Commands execution";
    NewLine.ОписаниеМетода   = "Executes the command on the server";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "rcon";
    NewLine.Модуль      = "OPI_RCON";
    NewLine.Метод       = "ExecuteCommand";
    NewLine.МетодПоиска = "EXECUTECOMMAND";
    NewLine.Параметр    = "--conn";
    NewLine.Описание    = "Connection or connection parameters";
    NewLine.Область     = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "rcon";
    NewLine.Модуль      = "OPI_RCON";
    NewLine.Метод       = "FormConnectionParameters";
    NewLine.МетодПоиска = "FORMCONNECTIONPARAMETERS";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Server URL";
    NewLine.Область     = "Commands execution";
    NewLine.ОписаниеМетода   = "Forms a collection of connection parameters";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "rcon";
    NewLine.Модуль      = "OPI_RCON";
    NewLine.Метод       = "FormConnectionParameters";
    NewLine.МетодПоиска = "FORMCONNECTIONPARAMETERS";
    NewLine.Параметр    = "--pass";
    NewLine.Описание    = "Password for connection";
    NewLine.Область     = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "rcon";
    NewLine.Модуль      = "OPI_RCON";
    NewLine.Метод       = "FormConnectionParameters";
    NewLine.МетодПоиска = "FORMCONNECTIONPARAMETERS";
    NewLine.Параметр    = "--rtout";
    NewLine.Описание    = "Response timeout (in seconds) (optional, def. val. - 30)";
    NewLine.Область     = "Commands execution";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "rcon";
    NewLine.Модуль      = "OPI_RCON";
    NewLine.Метод       = "FormConnectionParameters";
    NewLine.МетодПоиска = "FORMCONNECTIONPARAMETERS";
    NewLine.Параметр    = "--wtout";
    NewLine.Описание    = "Request sending timeout (in seconds) (optional, def. val. - 30)";
    NewLine.Область     = "Commands execution";

    Return CompositionTable;
EndFunction

