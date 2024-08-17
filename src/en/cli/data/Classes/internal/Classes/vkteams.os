﻿Function ПолучитьСостав() Export

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
    NewLine.Метод       = "GetFileInformation";
    NewLine.МетодПоиска = "GETFILEINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Common methods";
    NewLine.ОписаниеМетода   = "Gets information about a file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetFileInformation";
    NewLine.МетодПоиска = "GETFILEINFORMATION";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File ID";
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


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends the file to the chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File for sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "File caption (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--filename";
    NewLine.Описание    = "Displayed file name (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendFile";
    NewLine.МетодПоиска = "SENDFILE";
    NewLine.Параметр    = "--parsemod";
    NewLine.Описание    = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendVoice";
    NewLine.МетодПоиска = "SENDVOICE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends an audio file as a voice message";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendVoice";
    NewLine.МетодПоиска = "SENDVOICE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendVoice";
    NewLine.МетодПоиска = "SENDVOICE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File for sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendVoice";
    NewLine.МетодПоиска = "SENDVOICE";
    NewLine.Параметр    = "--type";
    NewLine.Описание    = "Audio type: aac, ogg or m4a (optional, def. val. - m4a)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendVoice";
    NewLine.МетодПоиска = "SENDVOICE";
    NewLine.Параметр    = "--reply";
    NewLine.Описание    = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "SendVoice";
    NewLine.МетодПоиска = "SENDVOICE";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Buttons to the message if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "EditMessageText";
    NewLine.МетодПоиска = "EDITMESSAGETEXT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Changes the text of an existing message";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "EditMessageText";
    NewLine.МетодПоиска = "EDITMESSAGETEXT";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for message sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "EditMessageText";
    NewLine.МетодПоиска = "EDITMESSAGETEXT";
    NewLine.Параметр    = "--messageid";
    NewLine.Описание    = "Message ID for editing";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "EditMessageText";
    NewLine.МетодПоиска = "EDITMESSAGETEXT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "New message text";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "EditMessageText";
    NewLine.МетодПоиска = "EDITMESSAGETEXT";
    NewLine.Параметр    = "--parsemod";
    NewLine.Описание    = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Deletes a message by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for message sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--messageid";
    NewLine.Описание    = "Message ID for editing";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendFile";
    NewLine.МетодПоиска = "RESENDFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a previously uploaded file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendFile";
    NewLine.МетодПоиска = "RESENDFILE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendFile";
    NewLine.МетодПоиска = "RESENDFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File ID to send";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendFile";
    NewLine.МетодПоиска = "RESENDFILE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "File caption (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendFile";
    NewLine.МетодПоиска = "RESENDFILE";
    NewLine.Параметр    = "--filename";
    NewLine.Описание    = "Displayed file name (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendFile";
    NewLine.МетодПоиска = "RESENDFILE";
    NewLine.Параметр    = "--parsemod";
    NewLine.Описание    = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendVoice";
    NewLine.МетодПоиска = "RESENDVOICE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Sends a previously uploaded voice message by ID";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendVoice";
    NewLine.МетодПоиска = "RESENDVOICE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ResendVoice";
    NewLine.МетодПоиска = "RESENDVOICE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File ID of voice message";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message sending";
    NewLine.ОписаниеМетода   = "Forwards an existing message to the current dialog box";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Original message ID";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--fromid";
    NewLine.Описание    = "Source chat ID";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID for message sending";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Additional message text (optional, def. val. - Empty value)";
    NewLine.Область     = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "RemoveChatMembers";
    NewLine.МетодПоиска = "REMOVECHATMEMBERS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Chat management";
    NewLine.ОписаниеМетода   = "Removes users from the chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "RemoveChatMembers";
    NewLine.МетодПоиска = "REMOVECHATMEMBERS";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "RemoveChatMembers";
    NewLine.МетодПоиска = "REMOVECHATMEMBERS";
    NewLine.Параметр    = "--members";
    NewLine.Описание    = "The member or members of the chat room to remove";
    NewLine.Область     = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ChangeChatPicture";
    NewLine.МетодПоиска = "CHANGECHATPICTURE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Chat management";
    NewLine.ОписаниеМетода   = "Changes the chat avatar picture";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ChangeChatPicture";
    NewLine.МетодПоиска = "CHANGECHATPICTURE";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "ChangeChatPicture";
    NewLine.МетодПоиска = "CHANGECHATPICTURE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "Image file";
    NewLine.Область     = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetChatInfo";
    NewLine.МетодПоиска = "GETCHATINFO";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Chat management";
    NewLine.ОписаниеМетода   = "Gets basic information about the chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetChatInfo";
    NewLine.МетодПоиска = "GETCHATINFO";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetChatAdmins";
    NewLine.МетодПоиска = "GETCHATADMINS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Chat management";
    NewLine.ОписаниеМетода   = "Gets the list of chat administrators";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetChatAdmins";
    NewLine.МетодПоиска = "GETCHATADMINS";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetChatMembers";
    NewLine.МетодПоиска = "GETCHATMEMBERS";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Chat management";
    NewLine.ОписаниеМетода   = "Gets the list of chat members";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetChatMembers";
    NewLine.МетодПоиска = "GETCHATMEMBERS";
    NewLine.Параметр    = "--chatid";
    NewLine.Описание    = "Chat ID";
    NewLine.Область     = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vkteams";
    NewLine.Модуль      = "OPI_VKTeams";
    NewLine.Метод       = "GetChatMembers";
    NewLine.МетодПоиска = "GETCHATMEMBERS";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Next page marker from the previous request (optional, def. val. - Empty value)";
    NewLine.Область     = "Chat management";

    Return CompositionTable;
EndFunction

