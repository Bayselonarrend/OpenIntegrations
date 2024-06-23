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
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SetWebhook";
    NewLine.МетодПоиска = "SETWEBHOOK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Viber Token";
    NewLine.Область     = "Settings and information";
    NewLine.ОписаниеМетода   = "IMPORTANT: Setting up Webhook is mandatory according to Viber rules. You need to have a free URL for this.,
    |    which will return 200 and a genuine SSL certificate. If there is a certificate and the database is published
    |    on the server - you can use an HTTP service. Information about new messages will also be sent there
    |    Viber periodically knocks on the Webhook address, so if it is inactive, everything will stop working";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SetWebhook";
    NewLine.МетодПоиска = "SETWEBHOOK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL for setting up Webhook";
    NewLine.Область     = "Settings and information";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "GetChannelInformation";
    NewLine.МетодПоиска = "GETCHANNELINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Settings and information";
    NewLine.ОписаниеМетода   = "Here you can get the channel's user IDs. Bot IDs need to be obtained from the Webhook arrivals
    |    The user ID from channel information is not suitable for sending messages through the bot - they are different";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "GetUserData";
    NewLine.МетодПоиска = "GETUSERDATA";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Settings and information";
    NewLine.ОписаниеМетода   = "Gets user information by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "GetUserData";
    NewLine.МетодПоиска = "GETUSERDATA";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "Viber User ID";
    NewLine.Область     = "Settings and information";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "GetOnlineUsers";
    NewLine.МетодПоиска = "GETONLINEUSERS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Viber Token";
    NewLine.Область     = "Settings and information";
    NewLine.ОписаниеМетода   = "Gets the status of a user or multiple users by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "GetOnlineUsers";
    NewLine.МетодПоиска = "GETONLINEUSERS";
    NewLine.Параметр    = "--users";
    NewLine.Описание    = "Viber User(s) ID";
    NewLine.Область     = "Settings and information";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a text message to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--ischannel";
    NewLine.Описание    = "Sending to channel or bot chat";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "See CreateKeyboardFromArrayButton (optional, def. val. - Empty)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends an image to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Image URL";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--ischannel";
    NewLine.Описание    = "Sending to channel or bot chat";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "Image annotation (optional, def. val. - Empty)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a file (document) to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File URL";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--ischannel";
    NewLine.Описание    = "Sending to channel or bot chat";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--ext";
    NewLine.Описание    = "File extension";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--size";
    NewLine.Описание    = "File size. If not filled in > determined automatically by downloading the file (optional, def. val. - Empty)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a contact with a phone number to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Contact name";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--phone";
    NewLine.Описание    = "Phone number";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--ischannel";
    NewLine.Описание    = "Sending to channel or bot chat";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends geographic coordinates to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--lat";
    NewLine.Описание    = "Geographic latitude";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--long";
    NewLine.Описание    = "Geographic longitude";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--ischannel";
    NewLine.Описание    = "Sending to channel or bot chat";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLink";
    NewLine.МетодПоиска = "SENDLINK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a URL with a preview to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLink";
    NewLine.МетодПоиска = "SENDLINK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "SentLink";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLink";
    NewLine.МетодПоиска = "SENDLINK";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID. For channel > administrator, for bot > recipient";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "SendLink";
    NewLine.МетодПоиска = "SENDLINK";
    NewLine.Параметр    = "--ischannel";
    NewLine.Описание    = "Sending to channel or bot chat";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "CreateKeyboardFromArrayButton";
    NewLine.МетодПоиска = "CREATEKEYBOARDFROMARRAYBUTTON";
    NewLine.Параметр    = "--buttons";
    NewLine.Описание    = "Array of buttons";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Returns a keyboard structure for messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "viber";
    NewLine.Модуль      = "OPI_Viber";
    NewLine.Метод       = "CreateKeyboardFromArrayButton";
    NewLine.МетодПоиска = "CREATEKEYBOARDFROMARRAYBUTTON";
    NewLine.Параметр    = "--color";
    NewLine.Описание    = "HEX color of buttons with # at the beginning (optional, def. val. - #2db9b9)";
    NewLine.Область     = "Message sending";

    Return CompositionTable;
EndFunction

