
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
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "CheckToken";
    NewLine.SearchMethod  = "CHECKTOKEN";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Checks if the bot token is functional";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetEvents";
    NewLine.SearchMethod  = "GETEVENTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Receives bot events in Polling mode";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetEvents";
    NewLine.SearchMethod  = "GETEVENTS";
    NewLine.Parameter     = "--last";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "ID of the last event processed before this event";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetEvents";
    NewLine.SearchMethod  = "GETEVENTS";
    NewLine.Parameter     = "--timeout";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Connection hold time for Long Polling (optional, def. val. - Empty value)";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Common methods";
    NewLine.MethodDescription   = "Gets information about a file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetFileInformation";
    NewLine.SearchMethod  = "GETFILEINFORMATION";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File ID";
    NewLine.Region      = "Common methods";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a text message to a chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for message sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--reply";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Buttons to the message if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--parsemod";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends the file to the chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File for sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "File caption (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--filename";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Displayed file name (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--parsemod";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendFile";
    NewLine.SearchMethod  = "SENDFILE";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Content type for sending (optional, def. val. - image/jpeg)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendVoice";
    NewLine.SearchMethod  = "SENDVOICE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends an audio file as a voice message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendVoice";
    NewLine.SearchMethod  = "SENDVOICE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendVoice";
    NewLine.SearchMethod  = "SENDVOICE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File for sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendVoice";
    NewLine.SearchMethod  = "SENDVOICE";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Audio type: aac, ogg or m4a (optional, def. val. - m4a)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendVoice";
    NewLine.SearchMethod  = "SENDVOICE";
    NewLine.Parameter     = "--reply";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Replying message id if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SendVoice";
    NewLine.SearchMethod  = "SENDVOICE";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Buttons to the message if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Changes the text of an existing message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for message sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--messageid";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Message ID for editing";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New message text";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "EditMessageText";
    NewLine.SearchMethod  = "EDITMESSAGETEXT";
    NewLine.Parameter     = "--parsemod";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Deletes a message by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for message sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--messageid";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Message ID for editing";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendFile";
    NewLine.SearchMethod  = "RESENDFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a previously uploaded file by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendFile";
    NewLine.SearchMethod  = "RESENDFILE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendFile";
    NewLine.SearchMethod  = "RESENDFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File ID to send";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendFile";
    NewLine.SearchMethod  = "RESENDFILE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "File caption (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendFile";
    NewLine.SearchMethod  = "RESENDFILE";
    NewLine.Parameter     = "--parsemod";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Markup type for message text: MarkdownV2 or HTML (optional, def. val. - MarkdownV2)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendVoice";
    NewLine.SearchMethod  = "RESENDVOICE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Sends a previously uploaded voice message by ID";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendVoice";
    NewLine.SearchMethod  = "RESENDVOICE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ResendVoice";
    NewLine.SearchMethod  = "RESENDVOICE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File ID of voice message";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Forwards an existing message to the current dialog box";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--messageid";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Original message ID";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--fromid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Source chat ID";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID for message sending";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Additional message text (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "PinMessage";
    NewLine.SearchMethod  = "PINMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Pins the selected message in the chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "PinMessage";
    NewLine.SearchMethod  = "PINMESSAGE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "PinMessage";
    NewLine.SearchMethod  = "PINMESSAGE";
    NewLine.Parameter     = "--messageid";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of the message to be pinned";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "UnpinMessage";
    NewLine.SearchMethod  = "UNPINMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Unpins a previously pinned chat message";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "UnpinMessage";
    NewLine.SearchMethod  = "UNPINMESSAGE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "UnpinMessage";
    NewLine.SearchMethod  = "UNPINMESSAGE";
    NewLine.Parameter     = "--messageid";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of the message to be unpinned";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "AnswerButtonEvent";
    NewLine.SearchMethod  = "ANSWERBUTTONEVENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Returns a response to the user when a keyboard button is pressed";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "AnswerButtonEvent";
    NewLine.SearchMethod  = "ANSWERBUTTONEVENT";
    NewLine.Parameter     = "--queryid";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Identifier of the callback query received by the bot";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "AnswerButtonEvent";
    NewLine.SearchMethod  = "ANSWERBUTTONEVENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Answer text (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "AnswerButtonEvent";
    NewLine.SearchMethod  = "ANSWERBUTTONEVENT";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL to be opened by the client application (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "AnswerButtonEvent";
    NewLine.SearchMethod  = "ANSWERBUTTONEVENT";
    NewLine.Parameter     = "--showalert";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Display the answer as an alert) (optional, def. val. - False)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "MakeActionButton";
    NewLine.SearchMethod  = "MAKEACTIONBUTTON";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Button text";
    NewLine.Region      = "Message sending";
    NewLine.MethodDescription   = "Forms an action button for the message keyboard";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "MakeActionButton";
    NewLine.SearchMethod  = "MAKEACTIONBUTTON";
    NewLine.Parameter     = "--data";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "The value returned in the event. Only if the URL is not filled (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "MakeActionButton";
    NewLine.SearchMethod  = "MAKEACTIONBUTTON";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL to create the page open button. Only if the Value is not filled in (optional, def. val. - Empty value)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "MakeActionButton";
    NewLine.SearchMethod  = "MAKEACTIONBUTTON";
    NewLine.Parameter     = "--style";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Button style: primary, attention or base (optional, def. val. - base)";
    NewLine.Region      = "Message sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "RemoveChatMembers";
    NewLine.SearchMethod  = "REMOVECHATMEMBERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Removes users from the chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "RemoveChatMembers";
    NewLine.SearchMethod  = "REMOVECHATMEMBERS";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "RemoveChatMembers";
    NewLine.SearchMethod  = "REMOVECHATMEMBERS";
    NewLine.Parameter     = "--members";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "The member or members of the chat room to remove";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ChangeChatPicture";
    NewLine.SearchMethod  = "CHANGECHATPICTURE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Changes the chat avatar picture";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ChangeChatPicture";
    NewLine.SearchMethod  = "CHANGECHATPICTURE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ChangeChatPicture";
    NewLine.SearchMethod  = "CHANGECHATPICTURE";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Image file";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatInfo";
    NewLine.SearchMethod  = "GETCHATINFO";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Gets basic information about the chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatInfo";
    NewLine.SearchMethod  = "GETCHATINFO";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatAdmins";
    NewLine.SearchMethod  = "GETCHATADMINS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Gets the list of chat administrators";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatAdmins";
    NewLine.SearchMethod  = "GETCHATADMINS";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatMembers";
    NewLine.SearchMethod  = "GETCHATMEMBERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Gets the list of chat members";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatMembers";
    NewLine.SearchMethod  = "GETCHATMEMBERS";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatMembers";
    NewLine.SearchMethod  = "GETCHATMEMBERS";
    NewLine.Parameter     = "--cursor";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Next page marker from the previous request (optional, def. val. - Empty value)";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatBlockedUsers";
    NewLine.SearchMethod  = "GETCHATBLOCKEDUSERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Gets the list of blocked chat users";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatBlockedUsers";
    NewLine.SearchMethod  = "GETCHATBLOCKEDUSERS";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatJoinRequests";
    NewLine.SearchMethod  = "GETCHATJOINREQUESTS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Gets a list of requests to join the chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "GetChatJoinRequests";
    NewLine.SearchMethod  = "GETCHATJOINREQUESTS";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "BlockChatUser";
    NewLine.SearchMethod  = "BLOCKCHATUSER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Blocks the selected user in chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "BlockChatUser";
    NewLine.SearchMethod  = "BLOCKCHATUSER";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "BlockChatUser";
    NewLine.SearchMethod  = "BLOCKCHATUSER";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID to be blocked";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "BlockChatUser";
    NewLine.SearchMethod  = "BLOCKCHATUSER";
    NewLine.Parameter     = "--dellast";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Delete last messages before blocking (optional, def. val. - False)";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "UnblockChatUser";
    NewLine.SearchMethod  = "UNBLOCKCHATUSER";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Unblocks a previously blocked user in the chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "UnblockChatUser";
    NewLine.SearchMethod  = "UNBLOCKCHATUSER";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "UnblockChatUser";
    NewLine.SearchMethod  = "UNBLOCKCHATUSER";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ApprovePending";
    NewLine.SearchMethod  = "APPROVEPENDING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Confirms the user's request to join a private chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ApprovePending";
    NewLine.SearchMethod  = "APPROVEPENDING";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "ApprovePending";
    NewLine.SearchMethod  = "APPROVEPENDING";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID. For all active requests if not filled in (optional, def. val. - Empty value)";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "DisapprovePending";
    NewLine.SearchMethod  = "DISAPPROVEPENDING";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Rejects the user's request to join a private chat room";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "DisapprovePending";
    NewLine.SearchMethod  = "DISAPPROVEPENDING";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "DisapprovePending";
    NewLine.SearchMethod  = "DISAPPROVEPENDING";
    NewLine.Parameter     = "--userid";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "User ID. For all active requests if not filled in (optional, def. val. - Empty value)";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatTitle";
    NewLine.SearchMethod  = "SETCHATTITLE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Sets new chat title";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatTitle";
    NewLine.SearchMethod  = "SETCHATTITLE";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatTitle";
    NewLine.SearchMethod  = "SETCHATTITLE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Title text";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatDescription";
    NewLine.SearchMethod  = "SETCHATDESCRIPTION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Sets new chat description";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatDescription";
    NewLine.SearchMethod  = "SETCHATDESCRIPTION";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatDescription";
    NewLine.SearchMethod  = "SETCHATDESCRIPTION";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Description text";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatRules";
    NewLine.SearchMethod  = "SETCHATRULES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Chat management";
    NewLine.MethodDescription   = "Sets new chat rules";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatRules";
    NewLine.SearchMethod  = "SETCHATRULES";
    NewLine.Parameter     = "--chatid";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Chat ID";
    NewLine.Region      = "Chat management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vkteams";
    NewLine.Module       = "OPI_VKTeams";
    NewLine.Method        = "SetChatRules";
    NewLine.SearchMethod  = "SETCHATRULES";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Rules Text";
    NewLine.Region      = "Chat management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_VKTeams = LoadScript(""%1/oint/core/Modules/OPI_VKTeams.os"", Context);
        |" + Chars.LF;


EndFunction 
