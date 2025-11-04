
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
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "GetBotInformation";
    NewLine.SearchMethod  = "GETBOTINFORMATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data retrieval and settings";
    NewLine.MethodDescription   = "Executes the request, returning basic bot information: name, id, ability to add the bot to groups, etc..";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "GetUpdates";
    NewLine.SearchMethod  = "GETUPDATES";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data retrieval and settings";
    NewLine.MethodDescription   = "Executes a request, returning information about bot events. Used in polling mode";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "GetUpdates";
    NewLine.SearchMethod  = "GETUPDATES";
    NewLine.Parameter     = "--timeout";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Waiting time for new events (optional, def. val. - Empty value)";
    NewLine.Region      = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "GetUpdates";
    NewLine.SearchMethod  = "GETUPDATES";
    NewLine.Parameter     = "--offset";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Offset in the list of received messages (optional, def. val. - Empty value)";
    NewLine.Region      = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SetWebhook";
    NewLine.SearchMethod  = "SETWEBHOOK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data retrieval and settings";
    NewLine.MethodDescription   = "Set webhook URL for bot event handling in webhook mode";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SetWebhook";
    NewLine.SearchMethod  = "SETWEBHOOK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Request handling address from Telegram (with https:)";
    NewLine.Region      = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DeleteWebhook";
    NewLine.SearchMethod  = "DELETEWEBHOOK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data retrieval and settings";
    NewLine.MethodDescription   = "Deletes the bot event handler URL for webhook operation";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Data retrieval and settings";
    NewLine.MethodDescription   = "Download file from Telegram servers";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DownloadFile";
    NewLine.SearchMethod  = "DOWNLOADFILE";
    NewLine.Parameter     = "--fileid";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "File ID for downloading";
    NewLine.Region      = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends a text message to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendTextMessage";
    NewLine.SearchMethod  = "SENDTEXTMESSAGE";
    NewLine.Parameter     = "--reply";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Reply to message ID (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends an image to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Image file";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendImage";
    NewLine.SearchMethod  = "SENDIMAGE";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendVideo";
    NewLine.SearchMethod  = "SENDVIDEO";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends a video to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendVideo";
    NewLine.SearchMethod  = "SENDVIDEO";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendVideo";
    NewLine.SearchMethod  = "SENDVIDEO";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendVideo";
    NewLine.SearchMethod  = "SENDVIDEO";
    NewLine.Parameter     = "--video";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Video file";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendVideo";
    NewLine.SearchMethod  = "SENDVIDEO";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendVideo";
    NewLine.SearchMethod  = "SENDVIDEO";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendAudio";
    NewLine.SearchMethod  = "SENDAUDIO";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends an audio file to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendAudio";
    NewLine.SearchMethod  = "SENDAUDIO";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendAudio";
    NewLine.SearchMethod  = "SENDAUDIO";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendAudio";
    NewLine.SearchMethod  = "SENDAUDIO";
    NewLine.Parameter     = "--audio";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Audio file";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendAudio";
    NewLine.SearchMethod  = "SENDAUDIO";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendAudio";
    NewLine.SearchMethod  = "SENDAUDIO";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendDocument";
    NewLine.SearchMethod  = "SENDDOCUMENT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends a document to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendDocument";
    NewLine.SearchMethod  = "SENDDOCUMENT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendDocument";
    NewLine.SearchMethod  = "SENDDOCUMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendDocument";
    NewLine.SearchMethod  = "SENDDOCUMENT";
    NewLine.Parameter     = "--doc";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Document file";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendDocument";
    NewLine.SearchMethod  = "SENDDOCUMENT";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendDocument";
    NewLine.SearchMethod  = "SENDDOCUMENT";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendDocument";
    NewLine.SearchMethod  = "SENDDOCUMENT";
    NewLine.Parameter     = "--filename";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Custom displayed file name with extension, if necessary (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendGif";
    NewLine.SearchMethod  = "SENDGIF";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends a GIF to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendGif";
    NewLine.SearchMethod  = "SENDGIF";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendGif";
    NewLine.SearchMethod  = "SENDGIF";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendGif";
    NewLine.SearchMethod  = "SENDGIF";
    NewLine.Parameter     = "--gif";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "GIF file";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendGif";
    NewLine.SearchMethod  = "SENDGIF";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendGif";
    NewLine.SearchMethod  = "SENDGIF";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendMediaGroup";
    NewLine.SearchMethod  = "SENDMEDIAGROUP";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends a set of files to a chat or channel. Media types: audio, document, photo, video
    |    Data structure for option --media:
    |    {
    |     ""FilePath"": ""TypeOfMedia"",
    |     ""FilePath"": ""TypeOfMedia"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendMediaGroup";
    NewLine.SearchMethod  = "SENDMEDIAGROUP";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendMediaGroup";
    NewLine.SearchMethod  = "SENDMEDIAGROUP";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendMediaGroup";
    NewLine.SearchMethod  = "SENDMEDIAGROUP";
    NewLine.Parameter     = "--media";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "File collection: Key > File, Value > Media Type";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendMediaGroup";
    NewLine.SearchMethod  = "SENDMEDIAGROUP";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendMediaGroup";
    NewLine.SearchMethod  = "SENDMEDIAGROUP";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends location by geographic latitude and longitude to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--lat";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Geographic latitude";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--long";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Geographic longitude";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendLocation";
    NewLine.SearchMethod  = "SENDLOCATION";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends a contact with name and phone number";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--name";
    NewLine.ParameterTrim = "-n";
    NewLine.Description     = "Contact name";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--surname";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Contact last name";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--phone";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Contact phone number";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendContact";
    NewLine.SearchMethod  = "SENDCONTACT";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Sends a poll with answer options";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--question";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Poll question";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Array of answer options";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "SendPoll";
    NewLine.SearchMethod  = "SENDPOLL";
    NewLine.Parameter     = "--anonymous";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Survey anonymity flag (optional, def. val. - True)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Forwards a message between chats or within a chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Original message ID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--from";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Chat ID of the original message";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ForwardMessage";
    NewLine.SearchMethod  = "FORWARDMESSAGE";
    NewLine.Parameter     = "--to";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Delete message from chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DeleteMessage";
    NewLine.SearchMethod  = "DELETEMESSAGE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of message to delete";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageKeyboard";
    NewLine.SearchMethod  = "REPLACEMESSAGEKEYBOARD";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Replaces the message keyboard with a new one";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageKeyboard";
    NewLine.SearchMethod  = "REPLACEMESSAGEKEYBOARD";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageKeyboard";
    NewLine.SearchMethod  = "REPLACEMESSAGEKEYBOARD";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of message to delete";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageKeyboard";
    NewLine.SearchMethod  = "REPLACEMESSAGEKEYBOARD";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard. See FormKeyboardFromButtonArray";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageText";
    NewLine.SearchMethod  = "REPLACEMESSAGETEXT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Replaces the message text with a new one";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageText";
    NewLine.SearchMethod  = "REPLACEMESSAGETEXT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageText";
    NewLine.SearchMethod  = "REPLACEMESSAGETEXT";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of message to delete";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageText";
    NewLine.SearchMethod  = "REPLACEMESSAGETEXT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New message text";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageText";
    NewLine.SearchMethod  = "REPLACEMESSAGETEXT";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageCaption";
    NewLine.SearchMethod  = "REPLACEMESSAGECAPTION";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Replaces text in a message with media attachments";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageCaption";
    NewLine.SearchMethod  = "REPLACEMESSAGECAPTION";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageCaption";
    NewLine.SearchMethod  = "REPLACEMESSAGECAPTION";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "ID of message to delete";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageCaption";
    NewLine.SearchMethod  = "REPLACEMESSAGECAPTION";
    NewLine.Parameter     = "--caption";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New message description";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ReplaceMessageCaption";
    NewLine.SearchMethod  = "REPLACEMESSAGECAPTION";
    NewLine.Parameter     = "--parsemode";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Empty value)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "FormKeyboardFromButtonArray";
    NewLine.SearchMethod  = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Parameter     = "--buttons";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Array of buttons";
    NewLine.Region      = "Data sending";
    NewLine.MethodDescription   = "Generates a simple JSON keyboard from an array of buttons for a message or bottom panel";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "FormKeyboardFromButtonArray";
    NewLine.SearchMethod  = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Parameter     = "--under";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Keyboard under the message or on the bottom panel (optional, def. val. - False)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "FormKeyboardFromButtonArray";
    NewLine.SearchMethod  = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Parameter     = "--column";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "True > buttons are displayed in a column, False > in a row (optional, def. val. - True)";
    NewLine.Region      = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "Ban";
    NewLine.SearchMethod  = "BAN";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Administration";
    NewLine.MethodDescription   = "Bans a user in the selected chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "Ban";
    NewLine.SearchMethod  = "BAN";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "Ban";
    NewLine.SearchMethod  = "BAN";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Target user ID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "Unban";
    NewLine.SearchMethod  = "UNBAN";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Administration";
    NewLine.MethodDescription   = "Unbans a previously banned user";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "Unban";
    NewLine.SearchMethod  = "UNBAN";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "Unban";
    NewLine.SearchMethod  = "UNBAN";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Target user ID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateInvitationLink";
    NewLine.SearchMethod  = "CREATEINVITATIONLINK";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Administration";
    NewLine.MethodDescription   = "Creates a link for joining a closed chat";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateInvitationLink";
    NewLine.SearchMethod  = "CREATEINVITATIONLINK";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID or ChatID*TopicID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateInvitationLink";
    NewLine.SearchMethod  = "CREATEINVITATIONLINK";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Invitation title (optional, def. val. - Empty value)";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateInvitationLink";
    NewLine.SearchMethod  = "CREATEINVITATIONLINK";
    NewLine.Parameter     = "--expire";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "Link expiration date (permanent if not specified) (optional, def. val. - Empty value)";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateInvitationLink";
    NewLine.SearchMethod  = "CREATEINVITATIONLINK";
    NewLine.Parameter     = "--limit";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "User limit (infinite if not specified) (optional, def. val. - Empty value)";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "PinMessage";
    NewLine.SearchMethod  = "PINMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Administration";
    NewLine.MethodDescription   = "Pins a message in the chat header";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "PinMessage";
    NewLine.SearchMethod  = "PINMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "PinMessage";
    NewLine.SearchMethod  = "PINMESSAGE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Target message ID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "UnpinMessage";
    NewLine.SearchMethod  = "UNPINMESSAGE";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Administration";
    NewLine.MethodDescription   = "Unpins a message in the chat header";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "UnpinMessage";
    NewLine.SearchMethod  = "UNPINMESSAGE";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "UnpinMessage";
    NewLine.SearchMethod  = "UNPINMESSAGE";
    NewLine.Parameter     = "--message";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Target message ID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "GetParticipantCount";
    NewLine.SearchMethod  = "GETPARTICIPANTCOUNT";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Bot token";
    NewLine.Region      = "Administration";
    NewLine.MethodDescription   = "Gets the total number of chat participants";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "GetParticipantCount";
    NewLine.SearchMethod  = "GETPARTICIPANTCOUNT";
    NewLine.Parameter     = "--chat";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Target chat ID";
    NewLine.Region      = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "GetAvatarIconList";
    NewLine.SearchMethod  = "GETAVATARICONLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Gets the mapping of Emoji IDs for setting as forum theme icons";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateForumTopic";
    NewLine.SearchMethod  = "CREATEFORUMTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Creates a new topic in the group with theme functionality enabled";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateForumTopic";
    NewLine.SearchMethod  = "CREATEFORUMTOPIC";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic creation chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateForumTopic";
    NewLine.SearchMethod  = "CREATEFORUMTOPIC";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Topic title";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CreateForumTopic";
    NewLine.SearchMethod  = "CREATEFORUMTOPIC";
    NewLine.Parameter     = "--icon";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "See GetAvatarIconList (optional, def. val. - Empty value)";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditForumTopic";
    NewLine.SearchMethod  = "EDITFORUMTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Creates a new topic in the group with theme functionality enabled";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditForumTopic";
    NewLine.SearchMethod  = "EDITFORUMTOPIC";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic creation chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditForumTopic";
    NewLine.SearchMethod  = "EDITFORUMTOPIC";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Topic ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditForumTopic";
    NewLine.SearchMethod  = "EDITFORUMTOPIC";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New title (optional, def. val. - Empty value)";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditForumTopic";
    NewLine.SearchMethod  = "EDITFORUMTOPIC";
    NewLine.Parameter     = "--icon";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "See GetAvatarIconList (optional, def. val. - Empty value)";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CloseForumTopic";
    NewLine.SearchMethod  = "CLOSEFORUMTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Closes the topic for new messages";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CloseForumTopic";
    NewLine.SearchMethod  = "CLOSEFORUMTOPIC";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "CloseForumTopic";
    NewLine.SearchMethod  = "CLOSEFORUMTOPIC";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Topic ID (optional, def. val. - Empty value)";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "OpenForumTopic";
    NewLine.SearchMethod  = "OPENFORUMTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Reopens a previously closed forum topic";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "OpenForumTopic";
    NewLine.SearchMethod  = "OPENFORUMTOPIC";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "OpenForumTopic";
    NewLine.SearchMethod  = "OPENFORUMTOPIC";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Topic ID (optional, def. val. - Empty value)";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DeleteForumTopic";
    NewLine.SearchMethod  = "DELETEFORUMTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Deletes a forum topic";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DeleteForumTopic";
    NewLine.SearchMethod  = "DELETEFORUMTOPIC";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "DeleteForumTopic";
    NewLine.SearchMethod  = "DELETEFORUMTOPIC";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Topic ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "HideMainForumTopic";
    NewLine.SearchMethod  = "HIDEMAINFORUMTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Hides the main forum topic";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "HideMainForumTopic";
    NewLine.SearchMethod  = "HIDEMAINFORUMTOPIC";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ShowMainForumTopic";
    NewLine.SearchMethod  = "SHOWMAINFORUMTOPIC";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Shows a previously hidden main forum topic";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ShowMainForumTopic";
    NewLine.SearchMethod  = "SHOWMAINFORUMTOPIC";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditMainForumTopicName";
    NewLine.SearchMethod  = "EDITMAINFORUMTOPICNAME";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Edits the name of the main forum topic";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditMainForumTopicName";
    NewLine.SearchMethod  = "EDITMAINFORUMTOPICNAME";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "EditMainForumTopicName";
    NewLine.SearchMethod  = "EDITMAINFORUMTOPICNAME";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "New main topic name";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ClearTopicPinnedMessagesList";
    NewLine.SearchMethod  = "CLEARTOPICPINNEDMESSAGESLIST";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Token";
    NewLine.Region      = "Forum topic management";
    NewLine.MethodDescription   = "Clears the list of pinned messages in the forum topic";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ClearTopicPinnedMessagesList";
    NewLine.SearchMethod  = "CLEARTOPICPINNEDMESSAGESLIST";
    NewLine.Parameter     = "--forum";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Topic chat ID";
    NewLine.Region      = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "telegram";
    NewLine.Module       = "OPI_Telegram";
    NewLine.Method        = "ClearTopicPinnedMessagesList";
    NewLine.SearchMethod  = "CLEARTOPICPINNEDMESSAGESLIST";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Topic ID. Main if not filled (optional, def. val. - Empty value)";
    NewLine.Region      = "Forum topic management";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Telegram = LoadScript(""%1/oint/core/Modules/OPI_Telegram.os"", Context);
        |" + Chars.LF;


EndFunction 
