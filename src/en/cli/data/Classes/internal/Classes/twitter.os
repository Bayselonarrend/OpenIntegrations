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
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "GetAuthorizationLink";
    NewLine.МетодПоиска = "GETAUTHORIZATIONLINK";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Data and settings";
    NewLine.ОписаниеМетода   = "Forms a link for authorization via the browser
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--code";
    NewLine.Описание    = "Code obtained from authorization See GetAuthorizationLink";
    NewLine.Область     = "Data and settings";
    NewLine.ОписаниеМетода   = "|
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "GetToken";
    NewLine.МетодПоиска = "GETTOKEN";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Data and settings";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "RefreshToken";
    NewLine.МетодПоиска = "REFRESHTOKEN";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Data and settings";
    NewLine.ОписаниеМетода   = "Updates the v2 token using the refresh_token
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateTextTweet";
    NewLine.МетодПоиска = "CREATETEXTTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet without attachments
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateTextTweet";
    NewLine.МетодПоиска = "CREATETEXTTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateImageTweet";
    NewLine.МетодПоиска = "CREATEIMAGETWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with an image attachment
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateImageTweet";
    NewLine.МетодПоиска = "CREATEIMAGETWEET";
    NewLine.Параметр    = "--pictures";
    NewLine.Описание    = "Image files array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateImageTweet";
    NewLine.МетодПоиска = "CREATEIMAGETWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateGifTweet";
    NewLine.МетодПоиска = "CREATEGIFTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with a gif attachment
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateGifTweet";
    NewLine.МетодПоиска = "CREATEGIFTWEET";
    NewLine.Параметр    = "--gifs";
    NewLine.Описание    = "Gif files array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateGifTweet";
    NewLine.МетодПоиска = "CREATEGIFTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateVideoTweet";
    NewLine.МетодПоиска = "CREATEVIDEOTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with a video attachment
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateVideoTweet";
    NewLine.МетодПоиска = "CREATEVIDEOTWEET";
    NewLine.Параметр    = "--videos";
    NewLine.Описание    = "Video files array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreateVideoTweet";
    NewLine.МетодПоиска = "CREATEVIDEOTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Tweet text";
    NewLine.Область     = "Tweets";
    NewLine.ОписаниеМетода   = "Creates a tweet with a poll
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""redirect_uri""            : """",  
    |     ""client_id""               : """",  
    |     ""client_secret""           : """",  
    |     ""access_token""            : """",  
    |     ""refresh_token""           : """",  
    |     ""oauth_token""             : """",  
    |     ""oauth_token_secret""      : """",  
    |     ""oauth_consumer_key""      : """", 
    |     ""oauth_consumer_secret""   : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Poll options array";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--duration";
    NewLine.Описание    = "Poll duration";
    NewLine.Область     = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "twitter";
    NewLine.Модуль      = "OPI_Twitter";
    NewLine.Метод       = "CreatePollTweet";
    NewLine.МетодПоиска = "CREATEPOLLTWEET";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Область     = "Tweets";

    Return CompositionTable;
EndFunction

