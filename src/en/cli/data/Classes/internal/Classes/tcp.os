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
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--address";
    NewLine.Описание    = "Address and port";
    NewLine.Область     = "Client methods";
    NewLine.ОписаниеМетода   = "Sends a single request to a specified address and receives a response using the default settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Data or text to be sent (optional, def. val. - Empty value)";
    NewLine.Область     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ProcessRequest";
    NewLine.МетодПоиска = "PROCESSREQUEST";
    NewLine.Параметр    = "--string";
    NewLine.Описание    = "An attribute of receiving the response as a string (optional, def. val. - Yes)";
    NewLine.Область     = "Client methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "SendResponse";
    NewLine.МетодПоиска = "SENDRESPONSE";
    NewLine.Параметр    = "--server";
    NewLine.Описание    = "TCP server object";
    NewLine.Область     = "Server methods";
    NewLine.ОписаниеМетода   = "Sends a message (response) to the selected connection";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "SendResponse";
    NewLine.МетодПоиска = "SENDRESPONSE";
    NewLine.Параметр    = "--address";
    NewLine.Описание    = "The address of the active connection. See AwaitConnections";
    NewLine.Область     = "Server methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "SendResponse";
    NewLine.МетодПоиска = "SENDRESPONSE";
    NewLine.Параметр    = "--data";
    NewLine.Описание    = "Response data";
    NewLine.Область     = "Server methods";

    Return CompositionTable;
EndFunction

