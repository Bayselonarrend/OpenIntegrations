
Var CompositionTable;

Function GetComposition() Export

    If CompositionTable <> Undefined Then
        Return CompositionTable;
    EndIf;

    CompositionTable = New ValueTable();
    CompositionTable.Columns.Add("Library");
    CompositionTable.Columns.Add("Module");
    CompositionTable.Columns.Add("Method");
    CompositionTable.Columns.Add("SearchMethod");
    CompositionTable.Columns.Add("Parameter");
    CompositionTable.Columns.Add("ParameterTrim");
    CompositionTable.Columns.Add("Description");
    CompositionTable.Columns.Add("MethodDescription");
    CompositionTable.Columns.Add("Region");

    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetBotInformation";
    NewLine.SearchMethod  = "GETBOTINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Management and settings";
    NewLine.MethodDescription   = "Gets basic information about the bot";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetWorkspaceList";
    NewLine.SearchMethod  = "GETWORKSPACELIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Management and settings";
    NewLine.MethodDescription   = "Gets a list of workspaces where the bot is connected";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetWorkspaceList";
    NewLine.SearchMethod  = "GETWORKSPACELIST";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Pointer from the previous request, if the result rows > 100 (optional, def. val.. - Empty value)";
    NewLine.Region      = "Management and settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetUserList";
    NewLine.SearchMethod  = "GETUSERLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Management and settings";
    NewLine.MethodDescription   = "Gets a list of users in the workspace";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetUserList";
    NewLine.SearchMethod  = "GETUSERLIST";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Pointer from the previous request, if the result rows > 100 (optional, def. val.. - Empty value)";
    NewLine.Region      = "Management and settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Sends a message at a selected hour";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--date";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Sending date for delayed message (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendMessage";
    NewLine.SearchMethod  = "SENDMESSAGE";
    NewLine.Parameter     = "--blocks";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "JSON array of block descriptions (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendEphemeralMessage";
    NewLine.SearchMethod  = "SENDEPHEMERALMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Sends a message that arrives in the channel but is visible
    |    only to a specific user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendEphemeralMessage";
    NewLine.SearchMethod  = "SENDEPHEMERALMESSAGE";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendEphemeralMessage";
    NewLine.SearchMethod  = "SENDEPHEMERALMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendEphemeralMessage";
    NewLine.SearchMethod  = "SENDEPHEMERALMESSAGE";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendEphemeralMessage";
    NewLine.SearchMethod  = "SENDEPHEMERALMESSAGE";
    NewLine.Parameter     = "--blocks";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "JSON array of block descriptions (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Edits the content of an existing message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--stamp";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Message timestamp";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New message text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "EditMessage";
    NewLine.SearchMethod  = "EDITMESSAGE";
    NewLine.Parameter     = "--blocks";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "JSON array of block descriptions (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Deletes a channel message by timestamp";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--stamp";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Timestamp or message ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--issheduled";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Indicator of deleting a delayed message (optional, def. val.. - False)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetDelayedMessageList";
    NewLine.SearchMethod  = "GETDELAYEDMESSAGELIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Gets a list of delayed channel messages";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetDelayedMessageList";
    NewLine.SearchMethod  = "GETDELAYEDMESSAGELIST";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetDelayedMessageList";
    NewLine.SearchMethod  = "GETDELAYEDMESSAGELIST";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Pointer from the previous request, if the result rows > 100 (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetMessageLink";
    NewLine.SearchMethod  = "GETMESSAGELINK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Gets a permanent URL to the channel message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetMessageLink";
    NewLine.SearchMethod  = "GETMESSAGELINK";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetMessageLink";
    NewLine.SearchMethod  = "GETMESSAGELINK";
    NewLine.Parameter     = "--stamp";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Timestamp or message ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetMessageReplyList";
    NewLine.SearchMethod  = "GETMESSAGEREPLYLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message management";
    NewLine.MethodDescription   = "Gets an array of messages that are replies to the specified";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetMessageReplyList";
    NewLine.SearchMethod  = "GETMESSAGEREPLYLIST";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetMessageReplyList";
    NewLine.SearchMethod  = "GETMESSAGEREPLYLIST";
    NewLine.Parameter     = "--stamp";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Timestamp or message ID";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetMessageReplyList";
    NewLine.SearchMethod  = "GETMESSAGEREPLYLIST";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Pointer from the previous request, if the result rows > 100 (optional, def. val.. - Empty value)";
    NewLine.Region      = "Message management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelList";
    NewLine.SearchMethod  = "GETCHANNELLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Gets a list of available channels";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelList";
    NewLine.SearchMethod  = "GETCHANNELLIST";
    NewLine.Parameter     = "--notarchived";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Indicator of excluding archived channels (optional, def. val.. - False)";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelList";
    NewLine.SearchMethod  = "GETCHANNELLIST";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Pointer from the previous request, if the result rows > 100 (optional, def. val.. - Empty value)";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelUserList";
    NewLine.SearchMethod  = "GETCHANNELUSERLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Gets a list of users in the specified channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelUserList";
    NewLine.SearchMethod  = "GETCHANNELUSERLIST";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelUserList";
    NewLine.SearchMethod  = "GETCHANNELUSERLIST";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Pointer from the previous request, if the result rows > 100 (optional, def. val.. - Empty value)";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "CreateChannel";
    NewLine.SearchMethod  = "CREATECHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Creates a new channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "CreateChannel";
    NewLine.SearchMethod  = "CREATECHANNEL";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Channel name";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "CreateChannel";
    NewLine.SearchMethod  = "CREATECHANNEL";
    NewLine.Parameter     = "--private";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Create channel as private (optional, def. val.. - False)";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "ArchiveChannel";
    NewLine.SearchMethod  = "ARCHIVECHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Archives an active channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "ArchiveChannel";
    NewLine.SearchMethod  = "ARCHIVECHANNEL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannel";
    NewLine.SearchMethod  = "GETCHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Gets information about the channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannel";
    NewLine.SearchMethod  = "GETCHANNEL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelHistory";
    NewLine.SearchMethod  = "GETCHANNELHISTORY";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Gets information about channel events";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetChannelHistory";
    NewLine.SearchMethod  = "GETCHANNELHISTORY";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "InviteUsersToChannel";
    NewLine.SearchMethod  = "INVITEUSERSTOCHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Adds specified users to the channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "InviteUsersToChannel";
    NewLine.SearchMethod  = "INVITEUSERSTOCHANNEL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "InviteUsersToChannel";
    NewLine.SearchMethod  = "INVITEUSERSTOCHANNEL";
    NewLine.Parameter     = "--users";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID Array";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "KickUserFromChannel";
    NewLine.SearchMethod  = "KICKUSERFROMCHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Removes specified user from channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "KickUserFromChannel";
    NewLine.SearchMethod  = "KICKUSERFROMCHANNEL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "KickUserFromChannel";
    NewLine.SearchMethod  = "KICKUSERFROMCHANNEL";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "JoinChannel";
    NewLine.SearchMethod  = "JOINCHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Adds the current bot to the channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "JoinChannel";
    NewLine.SearchMethod  = "JOINCHANNEL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "LeaveChannel";
    NewLine.SearchMethod  = "LEAVECHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Removes the current bot from the channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "LeaveChannel";
    NewLine.SearchMethod  = "LEAVECHANNEL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SetChannelTopic";
    NewLine.SearchMethod  = "SETCHANNELTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Sets the channel topic";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SetChannelTopic";
    NewLine.SearchMethod  = "SETCHANNELTOPIC";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SetChannelTopic";
    NewLine.SearchMethod  = "SETCHANNELTOPIC";
    NewLine.Parameter     = "--theme";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Channel topic";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SetChannelGoal";
    NewLine.SearchMethod  = "SETCHANNELGOAL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Sets the channel purpose (description)";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SetChannelGoal";
    NewLine.SearchMethod  = "SETCHANNELGOAL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SetChannelGoal";
    NewLine.SearchMethod  = "SETCHANNELGOAL";
    NewLine.Parameter     = "--purpose";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Channel purpose";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "RenameChannel";
    NewLine.SearchMethod  = "RENAMECHANNEL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Channel management";
    NewLine.MethodDescription   = "Changes the name of the channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "RenameChannel";
    NewLine.SearchMethod  = "RENAMECHANNEL";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "RenameChannel";
    NewLine.SearchMethod  = "RENAMECHANNEL";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New channel name";
    NewLine.Region      = "Channel management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "OpenDialog";
    NewLine.SearchMethod  = "OPENDIALOG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Dialog management";
    NewLine.MethodDescription   = "Opens a new dialog with one or more users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "OpenDialog";
    NewLine.SearchMethod  = "OPENDIALOG";
    NewLine.Parameter     = "--users";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID Array";
    NewLine.Region      = "Dialog management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "CloseDialog";
    NewLine.SearchMethod  = "CLOSEDIALOG";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Dialog management";
    NewLine.MethodDescription   = "Closes an existing dialog";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "CloseDialog";
    NewLine.SearchMethod  = "CLOSEDIALOG";
    NewLine.Parameter     = "--conv";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Dialog ID";
    NewLine.Region      = "Dialog management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Gets a list of files of the bot or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel for selection (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetFilesList";
    NewLine.SearchMethod  = "GETFILESLIST";
    NewLine.Parameter     = "--page";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Page number (optional, def. val.. - 1)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Uploads a file to Slack servers";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File for upload";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--filename";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "File name with extension";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "File name in Slack";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "UploadFile";
    NewLine.SearchMethod  = "UPLOADFILE";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel ID (optional, def. val.. - Empty value)";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetFileData";
    NewLine.SearchMethod  = "GETFILEDATA";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Gets information about the file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetFileData";
    NewLine.SearchMethod  = "GETFILEDATA";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Deletes a file on Slack";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteFile";
    NewLine.SearchMethod  = "DELETEFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "MakeFilePublic";
    NewLine.SearchMethod  = "MAKEFILEPUBLIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "User token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Creates a public URL for the file. Requires user token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "MakeFilePublic";
    NewLine.SearchMethod  = "MAKEFILEPUBLIC";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "MakeFilePrivate";
    NewLine.SearchMethod  = "MAKEFILEPRIVATE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "User token";
    NewLine.Region      = "File management";
    NewLine.MethodDescription   = "Removes the public URL from the file. Requires user token";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "MakeFilePrivate";
    NewLine.SearchMethod  = "MAKEFILEPRIVATE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "File management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetExternalFileList";
    NewLine.SearchMethod  = "GETEXTERNALFILELIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "External files management";
    NewLine.MethodDescription   = "Gets a list of external files of a user or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetExternalFileList";
    NewLine.SearchMethod  = "GETEXTERNALFILELIST";
    NewLine.Parameter     = "--channel";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Channel for selection (optional, def. val.. - Empty value)";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetExternalFileList";
    NewLine.SearchMethod  = "GETEXTERNALFILELIST";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Pointer from the previous request, if the result rows > 100 (optional, def. val.. - Empty value)";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetExternalFile";
    NewLine.SearchMethod  = "GETEXTERNALFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "External files management";
    NewLine.MethodDescription   = "Gets information about the external file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GetExternalFile";
    NewLine.SearchMethod  = "GETEXTERNALFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "AddExternalFile";
    NewLine.SearchMethod  = "ADDEXTERNALFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "External files management";
    NewLine.MethodDescription   = "Adds a new external file";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "AddExternalFile";
    NewLine.SearchMethod  = "ADDEXTERNALFILE";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL to external file";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "AddExternalFile";
    NewLine.SearchMethod  = "ADDEXTERNALFILE";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "File title for Slack";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendExternalFile";
    NewLine.SearchMethod  = "SENDEXTERNALFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "External files management";
    NewLine.MethodDescription   = "Sends an external file to a list of channels";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendExternalFile";
    NewLine.SearchMethod  = "SENDEXTERNALFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "SendExternalFile";
    NewLine.SearchMethod  = "SENDEXTERNALFILE";
    NewLine.Parameter     = "--channels";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Array of channels for sending";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteExternalFile";
    NewLine.SearchMethod  = "DELETEEXTERNALFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "External files management";
    NewLine.MethodDescription   = "Deletes an external file from Slack";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "DeleteExternalFile";
    NewLine.SearchMethod  = "DELETEEXTERNALFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File identifier";
    NewLine.Region      = "External files management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GenerateImageBlock";
    NewLine.SearchMethod  = "GENERATEIMAGEBLOCK";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Image URL";
    NewLine.Region      = "Block formation";
    NewLine.MethodDescription   = "Generates a block with an image to add to the message block array";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "slack";
    NewLine.Module       = "OPI_Slack";
    NewLine.Method        = "GenerateImageBlock";
    NewLine.SearchMethod  = "GENERATEIMAGEBLOCK";
    NewLine.Parameter     = "--alt";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Alternate text of the image (optional, def. val.. - Empty value)";
    NewLine.Region      = "Block formation";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Slack = LoadScript(""%1/oint/core/Modules/OPI_Slack.os"", Context);
        |" + Chars.LF;


EndFunction 
