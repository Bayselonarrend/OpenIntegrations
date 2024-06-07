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
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "GetAuthorizationLink";
    NewLine.SearchMethod = "GETAUTHORIZATIONLINK";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data and settings";
    NewLine.MethodDescription   = "Forms a link for authorization via the browser
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "GetToken";
    NewLine.SearchMethod = "GETTOKEN";
    NewLine.Parameter    = "--code";
    NewLine.Description    = "Code obtained from authorization See GetAuthorizationLink";
    NewLine.Region     = "Data and settings";
    NewLine.MethodDescription   = "Gets the token by the code obtained during authorization via the link from GetAuthorizationLink
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "GetToken";
    NewLine.SearchMethod = "GETTOKEN";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data and settings";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "RefreshToken";
    NewLine.SearchMethod = "REFRESHTOKEN";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Data and settings";
    NewLine.MethodDescription   = "Updates the v2 token using the refresh_token
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateTextTweet";
    NewLine.SearchMethod = "CREATETEXTTWEET";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Tweet text";
    NewLine.Region     = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet without attachments
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateTextTweet";
    NewLine.SearchMethod = "CREATETEXTTWEET";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateImageTweet";
    NewLine.SearchMethod = "CREATEIMAGETWEET";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Tweet text";
    NewLine.Region     = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with an image attachment
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateImageTweet";
    NewLine.SearchMethod = "CREATEIMAGETWEET";
    NewLine.Parameter    = "--pictures";
    NewLine.Description    = "Image files array";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateImageTweet";
    NewLine.SearchMethod = "CREATEIMAGETWEET";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateGifTweet";
    NewLine.SearchMethod = "CREATEGIFTWEET";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Tweet text";
    NewLine.Region     = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with a gif attachment
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateGifTweet";
    NewLine.SearchMethod = "CREATEGIFTWEET";
    NewLine.Parameter    = "--gifs";
    NewLine.Description    = "Gif files array";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateGifTweet";
    NewLine.SearchMethod = "CREATEGIFTWEET";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateVideoTweet";
    NewLine.SearchMethod = "CREATEVIDEOTWEET";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Tweet text";
    NewLine.Region     = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with a video attachment
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateVideoTweet";
    NewLine.SearchMethod = "CREATEVIDEOTWEET";
    NewLine.Parameter    = "--videos";
    NewLine.Description    = "Video files array";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreateVideoTweet";
    NewLine.SearchMethod = "CREATEVIDEOTWEET";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreatePollTweet";
    NewLine.SearchMethod = "CREATEPOLLTWEET";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Tweet text";
    NewLine.Region     = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with a poll
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


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreatePollTweet";
    NewLine.SearchMethod = "CREATEPOLLTWEET";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "Poll options array";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreatePollTweet";
    NewLine.SearchMethod = "CREATEPOLLTWEET";
    NewLine.Parameter    = "--duration";
    NewLine.Description    = "Poll duration";
    NewLine.Region     = "Tweets";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "twitter";
    NewLine.Module      = "OPI_Twitter";
    NewLine.Method       = "CreatePollTweet";
    NewLine.SearchMethod = "CREATEPOLLTWEET";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Tweets";

    Return TableСоwithтаinа;
EndFunction

