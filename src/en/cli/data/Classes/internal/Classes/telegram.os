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
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "GetBotInformation";
    NewLine.МетодПоиска = "GETBOTINFORMATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data retrieval and settings";
    NewLine.ОписаниеМетода   = "Executes the     |   getMe request, returning basic bot information: name, id, ability to add the bot to groups, etc..";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "GetUpdates";
    NewLine.МетодПоиска = "GETUPDATES";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data retrieval and settings";
    NewLine.ОписаниеМетода   = "Executes a request     |   getUpdates, returning information about bot events. Used in polling mode";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "GetUpdates";
    NewLine.МетодПоиска = "GETUPDATES";
    NewLine.Параметр    = "--timeout";
    NewLine.Описание    = "Waiting time for new events (optional, def. val. - Empty value)";
    NewLine.Область     = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "GetUpdates";
    NewLine.МетодПоиска = "GETUPDATES";
    NewLine.Параметр    = "--offset";
    NewLine.Описание    = "Offset in the list of received messages (optional, def. val. - Empty value)";
    NewLine.Область     = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SetWebhook";
    NewLine.МетодПоиска = "SETWEBHOOK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data retrieval and settings";
    NewLine.ОписаниеМетода   = "Set webhook URL for bot event handling in webhook mode";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SetWebhook";
    NewLine.МетодПоиска = "SETWEBHOOK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Request handling address from Telegram (with https:)";
    NewLine.Область     = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DeleteWebhook";
    NewLine.МетодПоиска = "DELETEWEBHOOK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data retrieval and settings";
    NewLine.ОписаниеМетода   = "Deletes the bot event handler URL for webhook operation";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Data retrieval and settings";
    NewLine.ОписаниеМетода   = "Download file from Telegram servers";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DownloadFile";
    NewLine.МетодПоиска = "DOWNLOADFILE";
    NewLine.Параметр    = "--fileid";
    NewLine.Описание    = "File ID for downloading";
    NewLine.Область     = "Data retrieval and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends a text message to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--parsemode";
    NewLine.Описание    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendTextMessage";
    NewLine.МетодПоиска = "SENDTEXTMESSAGE";
    NewLine.Параметр    = "--reply";
    NewLine.Описание    = "Reply to message ID (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends an image to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Image file";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendImage";
    NewLine.МетодПоиска = "SENDIMAGE";
    NewLine.Параметр    = "--parsemode";
    NewLine.Описание    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendVideo";
    NewLine.МетодПоиска = "SENDVIDEO";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends a video to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendVideo";
    NewLine.МетодПоиска = "SENDVIDEO";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendVideo";
    NewLine.МетодПоиска = "SENDVIDEO";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendVideo";
    NewLine.МетодПоиска = "SENDVIDEO";
    NewLine.Параметр    = "--video";
    NewLine.Описание    = "Video file";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendVideo";
    NewLine.МетодПоиска = "SENDVIDEO";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendVideo";
    NewLine.МетодПоиска = "SENDVIDEO";
    NewLine.Параметр    = "--parsemode";
    NewLine.Описание    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendAudio";
    NewLine.МетодПоиска = "SENDAUDIO";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends an audio file to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendAudio";
    NewLine.МетодПоиска = "SENDAUDIO";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendAudio";
    NewLine.МетодПоиска = "SENDAUDIO";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendAudio";
    NewLine.МетодПоиска = "SENDAUDIO";
    NewLine.Параметр    = "--audio";
    NewLine.Описание    = "Audio file";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendAudio";
    NewLine.МетодПоиска = "SENDAUDIO";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendAudio";
    NewLine.МетодПоиска = "SENDAUDIO";
    NewLine.Параметр    = "--parsemode";
    NewLine.Описание    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendDocument";
    NewLine.МетодПоиска = "SENDDOCUMENT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends a document to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendDocument";
    NewLine.МетодПоиска = "SENDDOCUMENT";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendDocument";
    NewLine.МетодПоиска = "SENDDOCUMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendDocument";
    NewLine.МетодПоиска = "SENDDOCUMENT";
    NewLine.Параметр    = "--doc";
    NewLine.Описание    = "Document file";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendDocument";
    NewLine.МетодПоиска = "SENDDOCUMENT";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendDocument";
    NewLine.МетодПоиска = "SENDDOCUMENT";
    NewLine.Параметр    = "--parsemode";
    NewLine.Описание    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendDocument";
    NewLine.МетодПоиска = "SENDDOCUMENT";
    NewLine.Параметр    = "--filename";
    NewLine.Описание    = "Custom displayed file name with extension, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendGif";
    NewLine.МетодПоиска = "SENDGIF";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends a GIF to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendGif";
    NewLine.МетодПоиска = "SENDGIF";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendGif";
    NewLine.МетодПоиска = "SENDGIF";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendGif";
    NewLine.МетодПоиска = "SENDGIF";
    NewLine.Параметр    = "--gif";
    NewLine.Описание    = "GIF file";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendGif";
    NewLine.МетодПоиска = "SENDGIF";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendGif";
    NewLine.МетодПоиска = "SENDGIF";
    NewLine.Параметр    = "--parsemode";
    NewLine.Описание    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendMediaGroup";
    NewLine.МетодПоиска = "SENDMEDIAGROUP";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends a set of files to a chat or channel. Media types: audio, document, photo, video
    |
    |    The structure of the JSON media group data (parameter --media):
    |    {
    |     ""FilePath"": ""TypeOfMedia"",
    |     ""FilePath"": ""TypeOfMedia"",
    |     ...
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendMediaGroup";
    NewLine.МетодПоиска = "SENDMEDIAGROUP";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendMediaGroup";
    NewLine.МетодПоиска = "SENDMEDIAGROUP";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendMediaGroup";
    NewLine.МетодПоиска = "SENDMEDIAGROUP";
    NewLine.Параметр    = "--media";
    NewLine.Описание    = "File JSON or path to .json";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendMediaGroup";
    NewLine.МетодПоиска = "SENDMEDIAGROUP";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendMediaGroup";
    NewLine.МетодПоиска = "SENDMEDIAGROUP";
    NewLine.Параметр    = "--parsemode";
    NewLine.Описание    = "Text processing type (HTML, Markdown, MarkdownV2) (optional, def. val. - Markdown)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends location by geographic latitude and longitude to a chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--lat";
    NewLine.Описание    = "Geographic latitude";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--long";
    NewLine.Описание    = "Geographic longitude";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendLocation";
    NewLine.МетодПоиска = "SENDLOCATION";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends a contact with name and phone number";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--name";
    NewLine.Описание    = "Contact name";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--surname";
    NewLine.Описание    = "Contact last name";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--phone";
    NewLine.Описание    = "Contact phone number";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendContact";
    NewLine.МетодПоиска = "SENDCONTACT";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "Keyboard JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Sends a poll with answer options";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--question";
    NewLine.Описание    = "Poll question";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Array of answer options";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "SendPoll";
    NewLine.МетодПоиска = "SENDPOLL";
    NewLine.Параметр    = "--anonymous";
    NewLine.Описание    = "Poll anonymity (optional, def. val. - Yes)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Forwards a message between chats or within a chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Original message ID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "Chat ID of the original message";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ForwardMessage";
    NewLine.МетодПоиска = "FORWARDMESSAGE";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "FormKeyboardFromButtonArray";
    NewLine.МетодПоиска = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Параметр    = "--buttons";
    NewLine.Описание    = "Array of buttons";
    NewLine.Область     = "Data sending";
    NewLine.ОписаниеМетода   = "Generates a simple JSON keyboard from an array of buttons for a message or bottom panel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "FormKeyboardFromButtonArray";
    NewLine.МетодПоиска = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Параметр    = "--under";
    NewLine.Описание    = "Keyboard under the message or on the bottom panel (optional, def. val. - No)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "FormKeyboardFromButtonArray";
    NewLine.МетодПоиска = "FORMKEYBOARDFROMBUTTONARRAY";
    NewLine.Параметр    = "--column";
    NewLine.Описание    = "True > buttons are displayed in a column, False > in a row (optional, def. val. - Yes)";
    NewLine.Область     = "Data sending";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "Ban";
    NewLine.МетодПоиска = "BAN";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Administration";
    NewLine.ОписаниеМетода   = "Bans a user in the selected chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "Ban";
    NewLine.МетодПоиска = "BAN";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "Ban";
    NewLine.МетодПоиска = "BAN";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "Target user ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "Unban";
    NewLine.МетодПоиска = "UNBAN";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Administration";
    NewLine.ОписаниеМетода   = "Unbans a previously banned user";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "Unban";
    NewLine.МетодПоиска = "UNBAN";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "Unban";
    NewLine.МетодПоиска = "UNBAN";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "Target user ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateInvitationLink";
    NewLine.МетодПоиска = "CREATEINVITATIONLINK";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Administration";
    NewLine.ОписаниеМетода   = "Creates a link for joining a closed chat";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateInvitationLink";
    NewLine.МетодПоиска = "CREATEINVITATIONLINK";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID or ChatID*TopicID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateInvitationLink";
    NewLine.МетодПоиска = "CREATEINVITATIONLINK";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Invitation title (optional, def. val. - Empty value)";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateInvitationLink";
    NewLine.МетодПоиска = "CREATEINVITATIONLINK";
    NewLine.Параметр    = "--expire";
    NewLine.Описание    = "Link expiration date (permanent if not specified) (optional, def. val. - Empty value)";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateInvitationLink";
    NewLine.МетодПоиска = "CREATEINVITATIONLINK";
    NewLine.Параметр    = "--limit";
    NewLine.Описание    = "User limit (infinite if not specified) (optional, def. val. - Empty value)";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "PinMessage";
    NewLine.МетодПоиска = "PINMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Administration";
    NewLine.ОписаниеМетода   = "Pins a message in the chat header";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "PinMessage";
    NewLine.МетодПоиска = "PINMESSAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "PinMessage";
    NewLine.МетодПоиска = "PINMESSAGE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Target message ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "UnpinMessage";
    NewLine.МетодПоиска = "UNPINMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Administration";
    NewLine.ОписаниеМетода   = "Unpins a message in the chat header";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "UnpinMessage";
    NewLine.МетодПоиска = "UNPINMESSAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "UnpinMessage";
    NewLine.МетодПоиска = "UNPINMESSAGE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "Target message ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "GetParticipantCount";
    NewLine.МетодПоиска = "GETPARTICIPANTCOUNT";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Bot token";
    NewLine.Область     = "Administration";
    NewLine.ОписаниеМетода   = "Gets the total number of chat participants";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "GetParticipantCount";
    NewLine.МетодПоиска = "GETPARTICIPANTCOUNT";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Administration";
    NewLine.ОписаниеМетода   = "Delete message from chat or channel";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--chat";
    NewLine.Описание    = "Target chat ID";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DeleteMessage";
    NewLine.МетодПоиска = "DELETEMESSAGE";
    NewLine.Параметр    = "--message";
    NewLine.Описание    = "ID of message to delete";
    NewLine.Область     = "Administration";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "GetAvatarIconList";
    NewLine.МетодПоиска = "GETAVATARICONLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Gets the mapping of Emoji IDs for setting as forum theme icons";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateForumThread";
    NewLine.МетодПоиска = "CREATEFORUMTHREAD";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Creates a new thread in the group with theme functionality enabled";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateForumThread";
    NewLine.МетодПоиска = "CREATEFORUMTHREAD";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread creation chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateForumThread";
    NewLine.МетодПоиска = "CREATEFORUMTHREAD";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Thread title";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CreateForumThread";
    NewLine.МетодПоиска = "CREATEFORUMTHREAD";
    NewLine.Параметр    = "--icon";
    NewLine.Описание    = "See GetAvatarIconList (optional, def. val. - Empty value)";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditForumTopic";
    NewLine.МетодПоиска = "EDITFORUMTOPIC";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Creates a new thread in the group with theme functionality enabled";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditForumTopic";
    NewLine.МетодПоиска = "EDITFORUMTOPIC";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread creation chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditForumTopic";
    NewLine.МетодПоиска = "EDITFORUMTOPIC";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Thread ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditForumTopic";
    NewLine.МетодПоиска = "EDITFORUMTOPIC";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New title (optional, def. val. - Empty value)";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditForumTopic";
    NewLine.МетодПоиска = "EDITFORUMTOPIC";
    NewLine.Параметр    = "--icon";
    NewLine.Описание    = "See GetAvatarIconList (optional, def. val. - Empty value)";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CloseForumThread";
    NewLine.МетодПоиска = "CLOSEFORUMTHREAD";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Closes the thread for new messages";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CloseForumThread";
    NewLine.МетодПоиска = "CLOSEFORUMTHREAD";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "CloseForumThread";
    NewLine.МетодПоиска = "CLOSEFORUMTHREAD";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Thread ID (optional, def. val. - Empty value)";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "OpenForumThread";
    NewLine.МетодПоиска = "OPENFORUMTHREAD";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Reopens a previously closed forum thread";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "OpenForumThread";
    NewLine.МетодПоиска = "OPENFORUMTHREAD";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "OpenForumThread";
    NewLine.МетодПоиска = "OPENFORUMTHREAD";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Thread ID (optional, def. val. - Empty value)";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DeleteForumTopic";
    NewLine.МетодПоиска = "DELETEFORUMTOPIC";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Deletes a forum thread";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DeleteForumTopic";
    NewLine.МетодПоиска = "DELETEFORUMTOPIC";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "DeleteForumTopic";
    NewLine.МетодПоиска = "DELETEFORUMTOPIC";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Thread ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "HideMainForumTopic";
    NewLine.МетодПоиска = "HIDEMAINFORUMTOPIC";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Hides the main forum thread";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "HideMainForumTopic";
    NewLine.МетодПоиска = "HIDEMAINFORUMTOPIC";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ShowMainForumTopic";
    NewLine.МетодПоиска = "SHOWMAINFORUMTOPIC";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Shows a previously hidden main forum thread";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ShowMainForumTopic";
    NewLine.МетодПоиска = "SHOWMAINFORUMTOPIC";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditMainForumTopicName";
    NewLine.МетодПоиска = "EDITMAINFORUMTOPICNAME";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Edits the name of the main forum thread";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditMainForumTopicName";
    NewLine.МетодПоиска = "EDITMAINFORUMTOPICNAME";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "EditMainForumTopicName";
    NewLine.МетодПоиска = "EDITMAINFORUMTOPICNAME";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New main thread name";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ClearThreadPinnedMessagesList";
    NewLine.МетодПоиска = "CLEARTHREADPINNEDMESSAGESLIST";
    NewLine.Параметр    = "--token";
    NewLine.Описание    = "Token";
    NewLine.Область     = "Forum topic management";
    NewLine.ОписаниеМетода   = "Clears the list of pinned messages in the forum thread";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ClearThreadPinnedMessagesList";
    NewLine.МетодПоиска = "CLEARTHREADPINNEDMESSAGESLIST";
    NewLine.Параметр    = "--forum";
    NewLine.Описание    = "Thread chat ID";
    NewLine.Область     = "Forum topic management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "telegram";
    NewLine.Модуль      = "OPI_Telegram";
    NewLine.Метод       = "ClearThreadPinnedMessagesList";
    NewLine.МетодПоиска = "CLEARTHREADPINNEDMESSAGESLIST";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Thread ID. Main if not filled (optional, def. val. - Empty value)";
    NewLine.Область     = "Forum topic management";

    Return CompositionTable;
EndFunction

