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
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetBotInformation";
    NewLine.МетодПоиска = "GETBOTINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Management and settings";
    NewLine.ОписаниеМетода   = "Gets basic information about the bot";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetWorkspaceList";
    NewLine.МетодПоиска = "GETWORKSPACELIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Management and settings";
    NewLine.ОписаниеМетода   = "Gets a list of workspaces where the bot is connected";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetWorkspaceList";
    NewLine.МетодПоиска = "GETWORKSPACELIST";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Pointer from the previous request, if the result rows > 100 (optional, def. val. - Empty value)";
    NewLine.Область     = "Management and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetUserList";
    NewLine.МетодПоиска = "GETUSERLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Management and settings";
    NewLine.ОписаниеМетода   = "Gets a list of users in the workspace";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetUserList";
    NewLine.МетодПоиска = "GETUSERLIST";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Pointer from the previous request, if the result rows > 100 (optional, def. val. - Empty value)";
    NewLine.Область     = "Management and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message management";
    NewLine.ОписаниеМетода   = "Sends a message at a selected hour";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--date";
    NewLine.Описание    = "Sending date for delayed message (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendMessage";
    NewLine.МетодПоиска = "SENDMESSAGE";
    NewLine.Параметр    = "--blocks";
    NewLine.Описание    = "JSON array of block descriptions (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendEphemeralMessage";
    NewLine.МетодПоиска = "SENDEPHEMERALMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message management";
    NewLine.ОписаниеМетода   = "Sends a message that arrives in the channel but is visible 
    |    only to a specific user";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendEphemeralMessage";
    NewLine.МетодПоиска = "SENDEPHEMERALMESSAGE";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendEphemeralMessage";
    NewLine.МетодПоиска = "SENDEPHEMERALMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendEphemeralMessage";
    NewLine.МетодПоиска = "SENDEPHEMERALMESSAGE";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendEphemeralMessage";
    NewLine.МетодПоиска = "SENDEPHEMERALMESSAGE";
    NewLine.Параметр    = "--blocks";
    NewLine.Описание    = "JSON array of block descriptions (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message management";
    NewLine.ОписаниеМетода   = "Edits the content of an existing message";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--stamp";
    NewLine.Описание    = "Message timestamp";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "New message text (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "EditMessage";
    NewLine.МетодПоиска = "EDITMESSAGE";
    NewLine.Параметр    = "--blocks";
    NewLine.Описание    = "JSON array of block descriptions (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message management";
    NewLine.ОписаниеМетода   = "Deletes a channel message by timestamp";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--stamp";
    NewLine.Описание    = "Timestamp or message ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--issheduled";
    NewLine.Описание    = "Indicator of deleting a delayed message (optional, def. val. - No)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetDelayedMessageList";
    NewLine.МетодПоиска = "GETDELAYEDMESSAGELIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message management";
    NewLine.ОписаниеМетода   = "Gets a list of delayed channel messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetDelayedMessageList";
    NewLine.МетодПоиска = "GETDELAYEDMESSAGELIST";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetDelayedMessageList";
    NewLine.МетодПоиска = "GETDELAYEDMESSAGELIST";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Pointer from the previous request, if the result rows > 100 (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetMessageLink";
    NewLine.МетодПоиска = "GETMESSAGELINK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message management";
    NewLine.ОписаниеМетода   = "Gets a permanent URL to the channel message";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetMessageLink";
    NewLine.МетодПоиска = "GETMESSAGELINK";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetMessageLink";
    NewLine.МетодПоиска = "GETMESSAGELINK";
    NewLine.Параметр    = "--stamp";
    NewLine.Описание    = "Timestamp or message ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetMessageReplyList";
    NewLine.МетодПоиска = "GETMESSAGEREPLYLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Message management";
    NewLine.ОписаниеМетода   = "Gets an array of messages that are replies to the specified";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetMessageReplyList";
    NewLine.МетодПоиска = "GETMESSAGEREPLYLIST";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetMessageReplyList";
    NewLine.МетодПоиска = "GETMESSAGEREPLYLIST";
    NewLine.Параметр    = "--stamp";
    NewLine.Описание    = "Timestamp or message ID";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetMessageReplyList";
    NewLine.МетодПоиска = "GETMESSAGEREPLYLIST";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Pointer from the previous request, if the result rows > 100 (optional, def. val. - Empty value)";
    NewLine.Область     = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelList";
    NewLine.МетодПоиска = "GETCHANNELLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Gets a list of available channels";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelList";
    NewLine.МетодПоиска = "GETCHANNELLIST";
    NewLine.Параметр    = "--notarchived";
    NewLine.Описание    = "Indicator of excluding archived channels (optional, def. val. - No)";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelList";
    NewLine.МетодПоиска = "GETCHANNELLIST";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Pointer from the previous request, if the result rows > 100 (optional, def. val. - Empty value)";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelUserList";
    NewLine.МетодПоиска = "GETCHANNELUSERLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Gets a list of users in the specified channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelUserList";
    NewLine.МетодПоиска = "GETCHANNELUSERLIST";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelUserList";
    NewLine.МетодПоиска = "GETCHANNELUSERLIST";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Pointer from the previous request, if the result rows > 100 (optional, def. val. - Empty value)";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "CreateChannel";
    NewLine.МетодПоиска = "CREATECHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Creates a new channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "CreateChannel";
    NewLine.МетодПоиска = "CREATECHANNEL";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Channel name";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "CreateChannel";
    NewLine.МетодПоиска = "CREATECHANNEL";
    NewLine.Параметр    = "--private";
    NewLine.Описание    = "Create channel as private (optional, def. val. - No)";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "ArchiveChannel";
    NewLine.МетодПоиска = "ARCHIVECHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Archives an active channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "ArchiveChannel";
    NewLine.МетодПоиска = "ARCHIVECHANNEL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannel";
    NewLine.МетодПоиска = "GETCHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Gets information about the channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannel";
    NewLine.МетодПоиска = "GETCHANNEL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelHistory";
    NewLine.МетодПоиска = "GETCHANNELHISTORY";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Gets information about channel events";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetChannelHistory";
    NewLine.МетодПоиска = "GETCHANNELHISTORY";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "InviteUsersToChannel";
    NewLine.МетодПоиска = "INVITEUSERSTOCHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Adds specified users to the channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "InviteUsersToChannel";
    NewLine.МетодПоиска = "INVITEUSERSTOCHANNEL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "InviteUsersToChannel";
    NewLine.МетодПоиска = "INVITEUSERSTOCHANNEL";
    NewLine.Параметр    = "--users";
    NewLine.Описание    = "User ID Array";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "KickUserFromChannel";
    NewLine.МетодПоиска = "KICKUSERFROMCHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Removes specified user from channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "KickUserFromChannel";
    NewLine.МетодПоиска = "KICKUSERFROMCHANNEL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "KickUserFromChannel";
    NewLine.МетодПоиска = "KICKUSERFROMCHANNEL";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "User ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "JoinChannel";
    NewLine.МетодПоиска = "JOINCHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Adds the current bot to the channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "JoinChannel";
    NewLine.МетодПоиска = "JOINCHANNEL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "LeaveChannel";
    NewLine.МетодПоиска = "LEAVECHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Removes the current bot from the channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "LeaveChannel";
    NewLine.МетодПоиска = "LEAVECHANNEL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SetChannelTopic";
    NewLine.МетодПоиска = "SETCHANNELTOPIC";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Sets the channel topic";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SetChannelTopic";
    NewLine.МетодПоиска = "SETCHANNELTOPIC";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SetChannelTopic";
    NewLine.МетодПоиска = "SETCHANNELTOPIC";
    NewLine.Параметр    = "--theme";
    NewLine.Описание    = "Channel topic";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SetChannelGoal";
    NewLine.МетодПоиска = "SETCHANNELGOAL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Sets the channel purpose (description)";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SetChannelGoal";
    NewLine.МетодПоиска = "SETCHANNELGOAL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SetChannelGoal";
    NewLine.МетодПоиска = "SETCHANNELGOAL";
    NewLine.Параметр    = "--purpose";
    NewLine.Описание    = "Channel purpose";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "RenameChannel";
    NewLine.МетодПоиска = "RENAMECHANNEL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Channel management";
    NewLine.ОписаниеМетода   = "Changes the name of the channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "RenameChannel";
    NewLine.МетодПоиска = "RENAMECHANNEL";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "RenameChannel";
    NewLine.МетодПоиска = "RENAMECHANNEL";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New channel name";
    NewLine.Область     = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "OpenDialog";
    NewLine.МетодПоиска = "OPENDIALOG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Dialog management";
    NewLine.ОписаниеМетода   = "Opens a new dialog with one or more users";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "OpenDialog";
    NewLine.МетодПоиска = "OPENDIALOG";
    NewLine.Параметр    = "--users";
    NewLine.Описание    = "User ID Array";
    NewLine.Область     = "Dialog management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "CloseDialog";
    NewLine.МетодПоиска = "CLOSEDIALOG";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Dialog management";
    NewLine.ОписаниеМетода   = "Closes an existing dialog";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "CloseDialog";
    NewLine.МетодПоиска = "CLOSEDIALOG";
    NewLine.Параметр    = "--conv";
    NewLine.Описание    = "Dialog ID";
    NewLine.Область     = "Dialog management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Gets a list of files of the bot or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel for selection (optional, def. val. - Empty value)";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetFilesList";
    NewLine.МетодПоиска = "GETFILESLIST";
    NewLine.Параметр    = "--page";
    NewLine.Описание    = "Page number (optional, def. val. - 1)";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Uploads a file to Slack servers";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "File for upload";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--filename";
    NewLine.Описание    = "File name with extension";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "File name in Slack";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "UploadFile";
    NewLine.МетодПоиска = "UPLOADFILE";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel ID (optional, def. val. - Empty value)";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetFileData";
    NewLine.МетодПоиска = "GETFILEDATA";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Gets information about the file";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetFileData";
    NewLine.МетодПоиска = "GETFILEDATA";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Deletes a file on Slack";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteFile";
    NewLine.МетодПоиска = "DELETEFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "MakeFilePublic";
    NewLine.МетодПоиска = "MAKEFILEPUBLIC";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "User token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Creates a public URL for the file. Requires user token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "MakeFilePublic";
    NewLine.МетодПоиска = "MAKEFILEPUBLIC";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "MakeFilePrivate";
    NewLine.МетодПоиска = "MAKEFILEPRIVATE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "User token";
    NewLine.Область     = "File managment";
    NewLine.ОписаниеМетода   = "Removes the public URL from the file. Requires user token";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "MakeFilePrivate";
    NewLine.МетодПоиска = "MAKEFILEPRIVATE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "File managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetExternalFileList";
    NewLine.МетодПоиска = "GETEXTERNALFILELIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "External files management";
    NewLine.ОписаниеМетода   = "Gets a list of external files of a user or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetExternalFileList";
    NewLine.МетодПоиска = "GETEXTERNALFILELIST";
    NewLine.Параметр    = "--channel";
    NewLine.Описание    = "Channel for selection (optional, def. val. - Empty value)";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetExternalFileList";
    NewLine.МетодПоиска = "GETEXTERNALFILELIST";
    NewLine.Параметр    = "--cursor";
    NewLine.Описание    = "Pointer from the previous request, if the result rows > 100 (optional, def. val. - Empty value)";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetExternalFile";
    NewLine.МетодПоиска = "GETEXTERNALFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "External files management";
    NewLine.ОписаниеМетода   = "Gets information about the external file";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GetExternalFile";
    NewLine.МетодПоиска = "GETEXTERNALFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "AddExternalFile";
    NewLine.МетодПоиска = "ADDEXTERNALFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "External files management";
    NewLine.ОписаниеМетода   = "Adds a new external file";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "AddExternalFile";
    NewLine.МетодПоиска = "ADDEXTERNALFILE";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL to external file";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "AddExternalFile";
    NewLine.МетодПоиска = "ADDEXTERNALFILE";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "File title for Slack";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendExternalFile";
    NewLine.МетодПоиска = "SENDEXTERNALFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "External files management";
    NewLine.ОписаниеМетода   = "Sends an external file to a list of channels";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendExternalFile";
    NewLine.МетодПоиска = "SENDEXTERNALFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "SendExternalFile";
    NewLine.МетодПоиска = "SENDEXTERNALFILE";
    NewLine.Параметр    = "--channels";
    NewLine.Описание    = "Array of channels for sending";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteExternalFile";
    NewLine.МетодПоиска = "DELETEEXTERNALFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "External files management";
    NewLine.ОписаниеМетода   = "Deletes an external file from Slack";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "DeleteExternalFile";
    NewLine.МетодПоиска = "DELETEEXTERNALFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File identifier";
    NewLine.Область     = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GenerateImageBlock";
    NewLine.МетодПоиска = "GENERATEIMAGEBLOCK";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Image URL";
    NewLine.Область     = "Block formation";
    NewLine.ОписаниеМетода   = "Generates a block with an image to add to the message block array";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "slack";
    NewLine.Модуль      = "OPI_Slack";
    NewLine.Метод       = "GenerateImageBlock";
    NewLine.МетодПоиска = "GENERATEIMAGEBLOCK";
    NewLine.Параметр    = "--alt";
    NewLine.Описание    = "Alternate text of the image (optional, def. val. - Empty value)";
    NewLine.Область     = "Block formation";

    Return CompositionTable;
EndFunction

