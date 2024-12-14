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
    NewLine.Метод       = "ConnectAndReceiveData";
    NewLine.МетодПоиска = "CONNECTANDRECEIVEDATA";
    NewLine.Параметр    = "--address";
    NewLine.Описание    = "Address and port";
    NewLine.Область     = "Tcp client";
    NewLine.ОписаниеМетода   = "Establishes a connection and reads data until completion or by limits";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ConnectAndReceiveData";
    NewLine.МетодПоиска = "CONNECTANDRECEIVEDATA";
    NewLine.Параметр    = "--size";
    NewLine.Описание    = "Maximum data size. 0 > no limit (optional, def. val. - Empty value)";
    NewLine.Область     = "Tcp client";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ConnectAndReceiveData";
    NewLine.МетодПоиска = "CONNECTANDRECEIVEDATA";
    NewLine.Параметр    = "--timeout";
    NewLine.Описание    = "Data reading timeout (optional, def. val. - 5000)";
    NewLine.Область     = "Tcp client";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ConnectAndReceiveData";
    NewLine.МетодПоиска = "CONNECTANDRECEIVEDATA";
    NewLine.Параметр    = "--string";
    NewLine.Описание    = "True > returns string, False > binary data (optional, def. val. - Yes)";
    NewLine.Область     = "Tcp client";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "tcp";
    NewLine.Модуль      = "OPI_TCP";
    NewLine.Метод       = "ConnectAndReceiveData";
    NewLine.МетодПоиска = "CONNECTANDRECEIVEDATA";
    NewLine.Параметр    = "--enc";
    NewLine.Описание    = "Encoding of received data (optional, def. val. - UTF-8)";
    NewLine.Область     = "Tcp client";

    Return CompositionTable;
EndFunction

