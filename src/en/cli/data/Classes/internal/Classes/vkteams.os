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
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "CheckToken";
    NewLine.МетодПоиска = "CHECKTOKEN";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Checks if the bot token is functional";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetEvents";
    NewLine.МетодПоиска = "GETEVENTS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Receives bot events in Polling mode";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetEvents";
    NewLine.МетодПоиска = "GETEVENTS";
    NewLine.Параметр    = "--last";
    NewLine.Описание    = "ID of the last event processed before this event";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetEvents";
    NewLine.МетодПоиска = "GETEVENTS";
    NewLine.Параметр    = "--timeout";
    NewLine.Описание    = "Connection hold time for Long Polling (optional, def. val. - Empty value)";
    NewLine.Область     = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a text message to a chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for message sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--reply";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Buttons to the message if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--parsemod";
    NewLine.Описание    = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Область     = "Message sending";

    Return CompositionTable;
EndFunction

