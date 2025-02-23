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
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--api";
    NewLine.Описание    = "API host link";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Forms the structure of basic authorization data";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--media";
    NewLine.Описание    = "Link to host API for sending files";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--id";
    NewLine.Описание    = "Unique instance number";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "FormAccessParameters";
    NewLine.МетодПоиска = "FORMACCESSPARAMETERS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Instance access key";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetInstanceSettings";
    NewLine.МетодПоиска = "GETINSTANCESETTINGS";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Gets the current instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetInstanceSettings";
    NewLine.МетодПоиска = "SETINSTANCESETTINGS";
    NewLine.Параметр    = "--settings";
    NewLine.Описание    = "Instance settings. See GetInstanceSettingsStructure";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Sets the instance settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "SetInstanceSettings";
    NewLine.МетодПоиска = "SETINSTANCESETTINGS";
    NewLine.Параметр    = "--access";
    NewLine.Описание    = "Access parameters. See FormAccessParameters";
    NewLine.Область     = "Account";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "greenapi";
    NewLine.Модуль      = "OPI_GreenAPI";
    NewLine.Метод       = "GetInstanceSettingsStructure";
    NewLine.МетодПоиска = "GETINSTANCESETTINGSSTRUCTURE";
    NewLine.Параметр    = "--empty";
    NewLine.Описание    = "True > structure with empty valuse, False > field descriptions at values (optional, def. val. - No)";
    NewLine.Область     = "Account";
    NewLine.ОписаниеМетода   = "Gets the structure template for instance settings";

    Return CompositionTable;
EndFunction

