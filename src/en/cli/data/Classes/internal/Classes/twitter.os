Функция ПолучитьСостав() Экспорт

    ТаблицаСостава = Новый ТаблицаЗначений();
    ТаблицаСостава.Колонки.Добавить("Библиотека");
    ТаблицаСостава.Колонки.Добавить("Модуль");
    ТаблицаСостава.Колонки.Добавить("Метод");
    ТаблицаСостава.Колонки.Добавить("МетодПоиска");
    ТаблицаСостава.Колонки.Добавить("Параметр");
    ТаблицаСостава.Колонки.Добавить("Описание");
    ТаблицаСостава.Колонки.Добавить("ОписаниеМетода");
    ТаблицаСостава.Колонки.Добавить("Область");

    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "GetAuthorizationLink";
    НоваяСтрока.МетодПоиска = "GETAUTHORIZATIONLINK";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Data and settings";
    НоваяСтрока.ОписаниеМетода   = "Forms a link for authorization via the browser
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "GetToken";
    НоваяСтрока.МетодПоиска = "GETTOKEN";
    НоваяСтрока.Параметр    = "--code";
    НоваяСтрока.Описание    = "Code obtained from authorization See GetAuthorizationLink";
    НоваяСтрока.Область     = "Data and settings";
    НоваяСтрока.ОписаниеМетода   = "Gets the token by the code obtained during authorization via the link from GetAuthorizationLink
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "GetToken";
    НоваяСтрока.МетодПоиска = "GETTOKEN";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Data and settings";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "RefreshToken";
    НоваяСтрока.МетодПоиска = "REFRESHTOKEN";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Data and settings";
    НоваяСтрока.ОписаниеМетода   = "Updates the v2 token using the refresh_token
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateTextTweet";
    НоваяСтрока.МетодПоиска = "CREATETEXTTWEET";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Tweet text";
    НоваяСтрока.Область     = "Tweets";
    НоваяСтрока.ОписаниеМетода   = "Creates a tweet without attachments
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateTextTweet";
    НоваяСтрока.МетодПоиска = "CREATETEXTTWEET";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateImageTweet";
    НоваяСтрока.МетодПоиска = "CREATEIMAGETWEET";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Tweet text";
    НоваяСтрока.Область     = "Tweets";
    НоваяСтрока.ОписаниеМетода   = "Creates a tweet with an image attachment
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateImageTweet";
    НоваяСтрока.МетодПоиска = "CREATEIMAGETWEET";
    НоваяСтрока.Параметр    = "--pictures";
    НоваяСтрока.Описание    = "Image files array";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateImageTweet";
    НоваяСтрока.МетодПоиска = "CREATEIMAGETWEET";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateGifTweet";
    НоваяСтрока.МетодПоиска = "CREATEGIFTWEET";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Tweet text";
    НоваяСтрока.Область     = "Tweets";
    НоваяСтрока.ОписаниеМетода   = "Creates a tweet with a gif attachment
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateGifTweet";
    НоваяСтрока.МетодПоиска = "CREATEGIFTWEET";
    НоваяСтрока.Параметр    = "--gifs";
    НоваяСтрока.Описание    = "Gif files array";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateGifTweet";
    НоваяСтрока.МетодПоиска = "CREATEGIFTWEET";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateVideoTweet";
    НоваяСтрока.МетодПоиска = "CREATEVIDEOTWEET";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Tweet text";
    НоваяСтрока.Область     = "Tweets";
    НоваяСтрока.ОписаниеМетода   = "Creates a tweet with a video attachment
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateVideoTweet";
    НоваяСтрока.МетодПоиска = "CREATEVIDEOTWEET";
    НоваяСтрока.Параметр    = "--videos";
    НоваяСтрока.Описание    = "Video files array";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreateVideoTweet";
    НоваяСтрока.МетодПоиска = "CREATEVIDEOTWEET";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreatePollTweet";
    НоваяСтрока.МетодПоиска = "CREATEPOLLTWEET";
    НоваяСтрока.Параметр    = "--text";
    НоваяСтрока.Описание    = "Tweet text";
    НоваяСтрока.Область     = "Tweets";
    НоваяСтрока.ОписаниеМетода   = "Creates a tweet with a poll
    |
    |    Структура JSON данных авторизации (параметр --auth):
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


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreatePollTweet";
    НоваяСтрока.МетодПоиска = "CREATEPOLLTWEET";
    НоваяСтрока.Параметр    = "--options";
    НоваяСтрока.Описание    = "Poll options array";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreatePollTweet";
    НоваяСтрока.МетодПоиска = "CREATEPOLLTWEET";
    НоваяСтрока.Параметр    = "--duration";
    НоваяСтрока.Описание    = "Poll duration";
    НоваяСтрока.Область     = "Tweets";


    НоваяСтрока = ТаблицаСостава.Добавить();
    НоваяСтрока.Библиотека  = "twitter";
    НоваяСтрока.Модуль      = "OPI_Twitter";
    НоваяСтрока.Метод       = "CreatePollTweet";
    НоваяСтрока.МетодПоиска = "CREATEPOLLTWEET";
    НоваяСтрока.Параметр    = "--auth";
    НоваяСтрока.Описание    = "Authorization JSON or path to .json (необяз. по ум. - Пустое значение)";
    НоваяСтрока.Область     = "Tweets";

    Возврат ТаблицаСостава;
КонецФункции

