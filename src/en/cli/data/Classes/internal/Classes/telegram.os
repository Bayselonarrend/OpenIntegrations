Function GetComposition() Export

    TableСоwithтаinа = New ValueTable();
    TableСоwithтаinа.Columns.Add("Library");
    TableСоwithтаinа.Columns.Add("Module");
    TableСоwithтаinа.Columns.Add("Method");
    TableСоwithтаinа.Columns.Add("SearchMethod");
    TableСоwithтаinа.Columns.Add("Parameter");
    TableСоwithтаinа.Columns.Add("Description");
    TableСоwithтаinа.Columns.Add("MethodDescription");
    TableСоwithтаinа.Columns.Add("Region");

    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "GetBotInformation";
    NewLine.SearchMethod = "GETBOTINFORMATION";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data retrieval and settings";
    NewLine.MethodDescription   = "Executes the     |   getMe request, returning basic bot information: name, id, ability to add the bot to groups, etc..";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "GetUpdates";
    NewLine.SearchMethod = "GETUPDATES";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data retrieval and settings";
    NewLine.MethodDescription   = "Executes a request     |   getUpdates, returning information about bot events. Used in polling mode";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "GetUpdates";
    NewLine.SearchMethod = "GETUPDATES";
    NewLine.Parameter    = "--timeout";
    NewLine.Description    = "Waiting time for new events (optional, def. val. - Empty)";
    NewLine.Region     = "Data retrieval and settings";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "GetUpdates";
    NewLine.SearchMethod = "GETUPDATES";
    NewLine.Parameter    = "--offset";
    NewLine.Description    = "Offset in the list of received messages (optional, def. val. - Empty)";
    NewLine.Region     = "Data retrieval and settings";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SetWebhook";
    NewLine.SearchMethod = "SETWEBHOOK";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data retrieval and settings";
    NewLine.MethodDescription   = "Set webhook URL for bot event handling in webhook mode";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SetWebhook";
    NewLine.SearchMethod = "SETWEBHOOK";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Request handling address from Telegram (with https:)";
    NewLine.Region     = "Data retrieval and settings";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "DeleteWebhook";
    NewLine.SearchMethod = "DELETEWEBHOOK";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data retrieval and settings";
    NewLine.MethodDescription   = "Deletes the bot event handler URL for webhook operation";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Data retrieval and settings";
    NewLine.MethodDescription   = "Download file from Telegram servers";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "DownloadFile";
    NewLine.SearchMethod = "DOWNLOADFILE";
    NewLine.Parameter    = "--fileid";
    NewLine.Description    = "File ID for downloading";
    NewLine.Region     = "Data retrieval and settings";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends a text message to a chat or channel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendTextMessage";
    NewLine.SearchMethod = "SENDTEXTMESSAGE";
    NewLine.Parameter    = "--parsemode";
    NewLine.Description    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendImage";
    NewLine.SearchMethod = "SENDIMAGE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends an image to a chat or channel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendImage";
    NewLine.SearchMethod = "SENDIMAGE";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendImage";
    NewLine.SearchMethod = "SENDIMAGE";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendImage";
    NewLine.SearchMethod = "SENDIMAGE";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Image file";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendImage";
    NewLine.SearchMethod = "SENDIMAGE";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendImage";
    NewLine.SearchMethod = "SENDIMAGE";
    NewLine.Parameter    = "--parsemode";
    NewLine.Description    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendVideo";
    NewLine.SearchMethod = "SENDVIDEO";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends a video to a chat or channel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendVideo";
    NewLine.SearchMethod = "SENDVIDEO";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendVideo";
    NewLine.SearchMethod = "SENDVIDEO";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendVideo";
    NewLine.SearchMethod = "SENDVIDEO";
    NewLine.Parameter    = "--video";
    NewLine.Description    = "Video file";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendVideo";
    NewLine.SearchMethod = "SENDVIDEO";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendVideo";
    NewLine.SearchMethod = "SENDVIDEO";
    NewLine.Parameter    = "--parsemode";
    NewLine.Description    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendAudio";
    NewLine.SearchMethod = "SENDAUDIO";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends an audio file to a chat or channel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendAudio";
    NewLine.SearchMethod = "SENDAUDIO";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendAudio";
    NewLine.SearchMethod = "SENDAUDIO";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendAudio";
    NewLine.SearchMethod = "SENDAUDIO";
    NewLine.Parameter    = "--audio";
    NewLine.Description    = "Audio file";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendAudio";
    NewLine.SearchMethod = "SENDAUDIO";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendAudio";
    NewLine.SearchMethod = "SENDAUDIO";
    NewLine.Parameter    = "--parsemode";
    NewLine.Description    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendDocument";
    NewLine.SearchMethod = "SENDDOCUMENT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends a document to a chat or channel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendDocument";
    NewLine.SearchMethod = "SENDDOCUMENT";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendDocument";
    NewLine.SearchMethod = "SENDDOCUMENT";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendDocument";
    NewLine.SearchMethod = "SENDDOCUMENT";
    NewLine.Parameter    = "--doc";
    NewLine.Description    = "Document file";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendDocument";
    NewLine.SearchMethod = "SENDDOCUMENT";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendDocument";
    NewLine.SearchMethod = "SENDDOCUMENT";
    NewLine.Parameter    = "--parsemode";
    NewLine.Description    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendGif";
    NewLine.SearchMethod = "SENDGIF";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends a GIF to a chat or channel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendGif";
    NewLine.SearchMethod = "SENDGIF";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendGif";
    NewLine.SearchMethod = "SENDGIF";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendGif";
    NewLine.SearchMethod = "SENDGIF";
    NewLine.Parameter    = "--gif";
    NewLine.Description    = "GIF file";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendGif";
    NewLine.SearchMethod = "SENDGIF";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendGif";
    NewLine.SearchMethod = "SENDGIF";
    NewLine.Parameter    = "--parsemode";
    NewLine.Description    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendMediaGroup";
    NewLine.SearchMethod = "SENDMEDIAGROUP";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends a set of files to a chat or channel. Media types: audio, document, photo, video
    |
    |    The structure of the JSON media group data (parameter --media):
    |    {
    |     ""FilePath"": ""TypeOfMedia"",
    |     ""FilePath"": ""TypeOfMedia"",
    |     ...
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendMediaGroup";
    NewLine.SearchMethod = "SENDMEDIAGROUP";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendMediaGroup";
    NewLine.SearchMethod = "SENDMEDIAGROUP";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendMediaGroup";
    NewLine.SearchMethod = "SENDMEDIAGROUP";
    NewLine.Parameter    = "--media";
    NewLine.Description    = "File JSON or path to .json";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendMediaGroup";
    NewLine.SearchMethod = "SENDMEDIAGROUP";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendMediaGroup";
    NewLine.SearchMethod = "SENDMEDIAGROUP";
    NewLine.Parameter    = "--parsemode";
    NewLine.Description    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendLocation";
    NewLine.SearchMethod = "SENDLOCATION";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends location by geographic latitude and longitude to a chat or channel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendLocation";
    NewLine.SearchMethod = "SENDLOCATION";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendLocation";
    NewLine.SearchMethod = "SENDLOCATION";
    NewLine.Parameter    = "--lat";
    NewLine.Description    = "Geographic latitude";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendLocation";
    NewLine.SearchMethod = "SENDLOCATION";
    NewLine.Parameter    = "--long";
    NewLine.Description    = "Geographic longitude";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendLocation";
    NewLine.SearchMethod = "SENDLOCATION";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendContact";
    NewLine.SearchMethod = "SENDCONTACT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends a contact with name and phone number";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendContact";
    NewLine.SearchMethod = "SENDCONTACT";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendContact";
    NewLine.SearchMethod = "SENDCONTACT";
    NewLine.Parameter    = "--name";
    NewLine.Description    = "Contact name";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendContact";
    NewLine.SearchMethod = "SENDCONTACT";
    NewLine.Parameter    = "--surname";
    NewLine.Description    = "Contact last name";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendContact";
    NewLine.SearchMethod = "SENDCONTACT";
    NewLine.Parameter    = "--phone";
    NewLine.Description    = "Contact phone number";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendContact";
    NewLine.SearchMethod = "SENDCONTACT";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "Keyboard JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendPoll";
    NewLine.SearchMethod = "SENDPOLL";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Sends a poll with answer options";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendPoll";
    NewLine.SearchMethod = "SENDPOLL";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendPoll";
    NewLine.SearchMethod = "SENDPOLL";
    NewLine.Parameter    = "--question";
    NewLine.Description    = "Poll question";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendPoll";
    NewLine.SearchMethod = "SENDPOLL";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "Array of answer options";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "SendPoll";
    NewLine.SearchMethod = "SENDPOLL";
    NewLine.Parameter    = "--anonymous";
    NewLine.Description    = "Poll anonymity (optional, def. val. - True)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ForwardMessage";
    NewLine.SearchMethod = "FORWARDMESSAGE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Forwards a message between chats or within a chat";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ForwardMessage";
    NewLine.SearchMethod = "FORWARDMESSAGE";
    NewLine.Parameter    = "--message";
    NewLine.Description    = "Original message ID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ForwardMessage";
    NewLine.SearchMethod = "FORWARDMESSAGE";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "Chat ID of the original message";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ForwardMessage";
    NewLine.SearchMethod = "FORWARDMESSAGE";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "FormKeyboardFromButtonArray";
    NewLine.SearchMethod = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Parameter    = "--buttons";
    NewLine.Description    = "Array of buttons";
    NewLine.Region     = "Data sending";
    NewLine.MethodDescription   = "Generates a simple JSON keyboard from an array of buttons for a message or bottom panel";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "FormKeyboardFromButtonArray";
    NewLine.SearchMethod = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Parameter    = "--under";
    NewLine.Description    = "Keyboard under the message or on the bottom panel (optional, def. val. - False)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "FormKeyboardFromButtonArray";
    NewLine.SearchMethod = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Parameter    = "--column";
    NewLine.Description    = "True > buttons are displayed in a column, False > in a row (optional, def. val. - True)";
    NewLine.Region     = "Data sending";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "Ban";
    NewLine.SearchMethod = "BAN";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Administration";
    NewLine.MethodDescription   = "Bans a user in the selected chat";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "Ban";
    NewLine.SearchMethod = "BAN";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "Ban";
    NewLine.SearchMethod = "BAN";
    NewLine.Parameter    = "--user";
    NewLine.Description    = "Target user ID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "Unban";
    NewLine.SearchMethod = "UNBAN";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Administration";
    NewLine.MethodDescription   = "Unbans a previously banned user";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "Unban";
    NewLine.SearchMethod = "UNBAN";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "Unban";
    NewLine.SearchMethod = "UNBAN";
    NewLine.Parameter    = "--user";
    NewLine.Description    = "Target user ID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateInvitationLink";
    NewLine.SearchMethod = "CREATEINVITATIONLINK";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Administration";
    NewLine.MethodDescription   = "Creates a link for joining a closed chat";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateInvitationLink";
    NewLine.SearchMethod = "CREATEINVITATIONLINK";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID or ChatID*TopicID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateInvitationLink";
    NewLine.SearchMethod = "CREATEINVITATIONLINK";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Invitation title (optional, def. val. - Empty)";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateInvitationLink";
    NewLine.SearchMethod = "CREATEINVITATIONLINK";
    NewLine.Parameter    = "--expire";
    NewLine.Description    = "Link expiration date (permanent if not specified) (optional, def. val. - Empty)";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateInvitationLink";
    NewLine.SearchMethod = "CREATEINVITATIONLINK";
    NewLine.Parameter    = "--limit";
    NewLine.Description    = "User limit (infinite if not specified) (optional, def. val. - Empty)";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "PinMessage";
    NewLine.SearchMethod = "PINMESSAGE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Administration";
    NewLine.MethodDescription   = "Pins a message in the chat header";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "PinMessage";
    NewLine.SearchMethod = "PINMESSAGE";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "PinMessage";
    NewLine.SearchMethod = "PINMESSAGE";
    NewLine.Parameter    = "--message";
    NewLine.Description    = "Target message ID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "UnpinMessage";
    NewLine.SearchMethod = "UNPINMESSAGE";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Administration";
    NewLine.MethodDescription   = "Unpins a message in the chat header";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "UnpinMessage";
    NewLine.SearchMethod = "UNPINMESSAGE";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "UnpinMessage";
    NewLine.SearchMethod = "UNPINMESSAGE";
    NewLine.Parameter    = "--message";
    NewLine.Description    = "Target message ID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "GetParticipantCount";
    NewLine.SearchMethod = "GETPARTICIPANTCOUNT";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Bot token";
    NewLine.Region     = "Administration";
    NewLine.MethodDescription   = "Gets the total number of chat participants";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "GetParticipantCount";
    NewLine.SearchMethod = "GETPARTICIPANTCOUNT";
    NewLine.Parameter    = "--chat";
    NewLine.Description    = "Target chat ID";
    NewLine.Region     = "Administration";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "GetAvatarIconList";
    NewLine.SearchMethod = "GETAVATARICONLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Gets the mapping of Emoji IDs for setting as forum theme icons";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateForumThread";
    NewLine.SearchMethod = "CREATEFORUMTHREAD";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Creates a new thread in the group with theme functionality enabled";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateForumThread";
    NewLine.SearchMethod = "CREATEFORUMTHREAD";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread creation chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateForumThread";
    NewLine.SearchMethod = "CREATEFORUMTHREAD";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Thread title";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CreateForumThread";
    NewLine.SearchMethod = "CREATEFORUMTHREAD";
    NewLine.Parameter    = "--icon";
    NewLine.Description    = "See GetAvatarIconList (optional, def. val. - Empty)";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditForumTopic";
    NewLine.SearchMethod = "EDITFORUMTOPIC";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Creates a new thread in the group with theme functionality enabled";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditForumTopic";
    NewLine.SearchMethod = "EDITFORUMTOPIC";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread creation chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditForumTopic";
    NewLine.SearchMethod = "EDITFORUMTOPIC";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Thread ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditForumTopic";
    NewLine.SearchMethod = "EDITFORUMTOPIC";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New title (optional, def. val. - Empty)";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditForumTopic";
    NewLine.SearchMethod = "EDITFORUMTOPIC";
    NewLine.Parameter    = "--icon";
    NewLine.Description    = "See GetAvatarIconList (optional, def. val. - Empty)";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CloseForumThread";
    NewLine.SearchMethod = "CLOSEFORUMTHREAD";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Closes the thread for new messages";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CloseForumThread";
    NewLine.SearchMethod = "CLOSEFORUMTHREAD";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "CloseForumThread";
    NewLine.SearchMethod = "CLOSEFORUMTHREAD";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Thread ID (optional, def. val. - Empty)";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "OpenForumThread";
    NewLine.SearchMethod = "OPENFORUMTHREAD";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Reopens a previously closed forum thread";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "OpenForumThread";
    NewLine.SearchMethod = "OPENFORUMTHREAD";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "OpenForumThread";
    NewLine.SearchMethod = "OPENFORUMTHREAD";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Thread ID (optional, def. val. - Empty)";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "DeleteForumTopic";
    NewLine.SearchMethod = "DELETEFORUMTOPIC";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Deletes a forum thread";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "DeleteForumTopic";
    NewLine.SearchMethod = "DELETEFORUMTOPIC";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "DeleteForumTopic";
    NewLine.SearchMethod = "DELETEFORUMTOPIC";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Thread ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "HideMainForumTopic";
    NewLine.SearchMethod = "HIDEMAINFORUMTOPIC";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Hides the main forum thread";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "HideMainForumTopic";
    NewLine.SearchMethod = "HIDEMAINFORUMTOPIC";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ShowMainForumTopic";
    NewLine.SearchMethod = "SHOWMAINFORUMTOPIC";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Shows a previously hidden main forum thread";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ShowMainForumTopic";
    NewLine.SearchMethod = "SHOWMAINFORUMTOPIC";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditMainForumTopicName";
    NewLine.SearchMethod = "EDITMAINFORUMTOPICNAME";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Edits the name of the main forum thread";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditMainForumTopicName";
    NewLine.SearchMethod = "EDITMAINFORUMTOPICNAME";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "EditMainForumTopicName";
    NewLine.SearchMethod = "EDITMAINFORUMTOPICNAME";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New main thread name";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ClearThreadPinnedMessagesList";
    NewLine.SearchMethod = "CLEARTHREADPINNEDMESSAGESLIST";
    NewLine.Parameter    = "--token";
    NewLine.Description    = "Token";
    NewLine.Region     = "Forum topic management";
    NewLine.MethodDescription   = "Clears the list of pinned messages in the forum thread";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ClearThreadPinnedMessagesList";
    NewLine.SearchMethod = "CLEARTHREADPINNEDMESSAGESLIST";
    NewLine.Parameter    = "--forum";
    NewLine.Description    = "Thread chat ID";
    NewLine.Region     = "Forum topic management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "telegram";
    NewLine.Module      = "OPI_Telegram";
    NewLine.Method       = "ClearThreadPinnedMessagesList";
    NewLine.SearchMethod = "CLEARTHREADPINNEDMESSAGESLIST";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Thread ID. Main if not filled (optional, def. val. - Empty)";
    NewLine.Region     = "Forum topic management";

    Return TableСоwithтаinа;
EndFunction

