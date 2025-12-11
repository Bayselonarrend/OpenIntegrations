
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "GetAuthorizationLink";
    NewLine.SearchMethod  = "GETAUTHORIZATIONLINK";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Data and settings";
    NewLine.MethodDescription   = "Forms a link for authorization via the browser
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--code";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Code obtained from authorization See GetAuthorizationLink";
    NewLine.Region      = "Data and settings";
    NewLine.MethodDescription   = "Gets the token by the code received when authorizing using the link from GetAuthorizationLink
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "GetToken";
    NewLine.SearchMethod  = "GETTOKEN";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Data and settings";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "RefreshToken";
    NewLine.SearchMethod  = "REFRESHTOKEN";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Data and settings";
    NewLine.MethodDescription   = "Updates the v2 token using the refresh_token
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateCustomTweet";
    NewLine.SearchMethod  = "CREATECUSTOMTWEET";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Tweet text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with custom content
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateCustomTweet";
    NewLine.SearchMethod  = "CREATECUSTOMTWEET";
    NewLine.Parameter     = "--media";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Array of binary data or file paths (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateCustomTweet";
    NewLine.SearchMethod  = "CREATECUSTOMTWEET";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Array of poll options, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateCustomTweet";
    NewLine.SearchMethod  = "CREATECUSTOMTWEET";
    NewLine.Parameter     = "--dur";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Poll duration if necessary (poll without duration is not created) (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateCustomTweet";
    NewLine.SearchMethod  = "CREATECUSTOMTWEET";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateTextTweet";
    NewLine.SearchMethod  = "CREATETEXTTWEET";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Tweet text";
    NewLine.Region      = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet without attachments
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateTextTweet";
    NewLine.SearchMethod  = "CREATETEXTTWEET";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateImageTweet";
    NewLine.SearchMethod  = "CREATEIMAGETWEET";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Tweet text";
    NewLine.Region      = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with an image attachment
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateImageTweet";
    NewLine.SearchMethod  = "CREATEIMAGETWEET";
    NewLine.Parameter     = "--pictures";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Image files array";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateImageTweet";
    NewLine.SearchMethod  = "CREATEIMAGETWEET";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateGifTweet";
    NewLine.SearchMethod  = "CREATEGIFTWEET";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Tweet text";
    NewLine.Region      = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with a gif attachment
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateGifTweet";
    NewLine.SearchMethod  = "CREATEGIFTWEET";
    NewLine.Parameter     = "--gifs";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Gif files array";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateGifTweet";
    NewLine.SearchMethod  = "CREATEGIFTWEET";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateVideoTweet";
    NewLine.SearchMethod  = "CREATEVIDEOTWEET";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Tweet text";
    NewLine.Region      = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with a video attachment
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateVideoTweet";
    NewLine.SearchMethod  = "CREATEVIDEOTWEET";
    NewLine.Parameter     = "--videos";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Video files array";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreateVideoTweet";
    NewLine.SearchMethod  = "CREATEVIDEOTWEET";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreatePollTweet";
    NewLine.SearchMethod  = "CREATEPOLLTWEET";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Tweet text";
    NewLine.Region      = "Tweets";
    NewLine.MethodDescription   = "Creates a tweet with a poll
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreatePollTweet";
    NewLine.SearchMethod  = "CREATEPOLLTWEET";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Poll options array";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreatePollTweet";
    NewLine.SearchMethod  = "CREATEPOLLTWEET";
    NewLine.Parameter     = "--duration";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Poll duration";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "CreatePollTweet";
    NewLine.SearchMethod  = "CREATEPOLLTWEET";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "UploadAttachmentsArray";
    NewLine.SearchMethod  = "UPLOADATTACHMENTSARRAY";
    NewLine.Parameter     = "--files";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Array of files to be uploaded";
    NewLine.Region      = "Tweets";
    NewLine.MethodDescription   = "Uploads files to the server and returns their IDs
    |    Data structure for option --auth:
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
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "UploadAttachmentsArray";
    NewLine.SearchMethod  = "UPLOADATTACHMENTSARRAY";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Attachment type: tweet_video, tweet_image, tweet_gif";
    NewLine.Region      = "Tweets";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "twitter";
    NewLine.Module       = "OPI_Twitter";
    NewLine.Method        = "UploadAttachmentsArray";
    NewLine.SearchMethod  = "UPLOADATTACHMENTSARRAY";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization data. See GetStandardParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Tweets";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_Twitter = LoadScript(""%1/oint/core/Modules/OPI_Twitter.os"", Context);
        |" + Chars.LF;


EndFunction 
