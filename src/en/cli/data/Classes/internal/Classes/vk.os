
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
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateTokenRetrievalLink";
    NewLine.SearchMethod  = "CREATETOKENRETRIEVALLINK";
    NewLine.Parameter     = "--app";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "app_id from application settings";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Getting a link for interactive token retrieval (access_token), which is necessary
    |    for further actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetAuthParameters";
    NewLine.SearchMethod  = "GETAUTHPARAMETERS";
    NewLine.Parameter     = "--group";
    NewLine.ParameterTrim = "-g";
    NewLine.Description     = "Group ID";
    NewLine.Region      = "Authorization";
    NewLine.MethodDescription   = "Gets the structure of authorization parameters";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetAuthParameters";
    NewLine.SearchMethod  = "GETAUTHPARAMETERS";
    NewLine.Parameter     = "--app";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "App ID";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetAuthParameters";
    NewLine.SearchMethod  = "GETAUTHPARAMETERS";
    NewLine.Parameter     = "--token";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Auth token";
    NewLine.Region      = "Authorization";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Post text";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Creates a post with images
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--pictures";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Array of images";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--ad";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Sign ""This is an ad"" (optional, def. val.. - False)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Link (URL) under the post (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePost";
    NewLine.SearchMethod  = "CREATEPOST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateCompositePost";
    NewLine.SearchMethod  = "CREATECOMPOSITEPOST";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Post text";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Creates a post based on an array of object identifiers (images, videos, etc..)
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateCompositePost";
    NewLine.SearchMethod  = "CREATECOMPOSITEPOST";
    NewLine.Parameter     = "--objects";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Array of identifiers like photo123_123";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateCompositePost";
    NewLine.SearchMethod  = "CREATECOMPOSITEPOST";
    NewLine.Parameter     = "--ad";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Sign ""This is an ad"" (optional, def. val.. - False)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateCompositePost";
    NewLine.SearchMethod  = "CREATECOMPOSITEPOST";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Link (URL) under the post (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateCompositePost";
    NewLine.SearchMethod  = "CREATECOMPOSITEPOST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeletePost";
    NewLine.SearchMethod  = "DELETEPOST";
    NewLine.Parameter     = "--post";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Post ID";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Deletes a post by ID
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeletePost";
    NewLine.SearchMethod  = "DELETEPOST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePoll";
    NewLine.SearchMethod  = "CREATEPOLL";
    NewLine.Parameter     = "--question";
    NewLine.ParameterTrim = "-q";
    NewLine.Description     = "Poll question";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Creates a poll with answer options
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePoll";
    NewLine.SearchMethod  = "CREATEPOLL";
    NewLine.Parameter     = "--options";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Array of answer options";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePoll";
    NewLine.SearchMethod  = "CREATEPOLL";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Poll image. Required if there is no text (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePoll";
    NewLine.SearchMethod  = "CREATEPOLL";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Post text. Required if there is no picture (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreatePoll";
    NewLine.SearchMethod  = "CREATEPOLL";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAlbum";
    NewLine.SearchMethod  = "CREATEALBUM";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Album name";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Creates an album to store images
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAlbum";
    NewLine.SearchMethod  = "CREATEALBUM";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Album description (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAlbum";
    NewLine.SearchMethod  = "CREATEALBUM";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteAlbum";
    NewLine.SearchMethod  = "DELETEALBUM";
    NewLine.Parameter     = "--album";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Album ID";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Deletes a previously created album
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteAlbum";
    NewLine.SearchMethod  = "DELETEALBUM";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateStory";
    NewLine.SearchMethod  = "CREATESTORY";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Story background";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Creates a story from an image
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateStory";
    NewLine.SearchMethod  = "CREATESTORY";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL for button under the story (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateStory";
    NewLine.SearchMethod  = "CREATESTORY";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "SaveImageToAlbum";
    NewLine.SearchMethod  = "SAVEIMAGETOALBUM";
    NewLine.Parameter     = "--album";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Album ID";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Saves an image to the community album
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "SaveImageToAlbum";
    NewLine.SearchMethod  = "SAVEIMAGETOALBUM";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Image file";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "SaveImageToAlbum";
    NewLine.SearchMethod  = "SAVEIMAGETOALBUM";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Image description (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "SaveImageToAlbum";
    NewLine.SearchMethod  = "SAVEIMAGETOALBUM";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteImage";
    NewLine.SearchMethod  = "DELETEIMAGE";
    NewLine.Parameter     = "--pictureid";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Image ID";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Deletes an image from the album
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteImage";
    NewLine.SearchMethod  = "DELETEIMAGE";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadVideoToServer";
    NewLine.SearchMethod  = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Video file";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Uploads video to the group for further use
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadVideoToServer";
    NewLine.SearchMethod  = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Video name";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadVideoToServer";
    NewLine.SearchMethod  = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter     = "--description";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Video description (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadVideoToServer";
    NewLine.SearchMethod  = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter     = "--album";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Album ID, if necessary (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadVideoToServer";
    NewLine.SearchMethod  = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadPhotoToServer";
    NewLine.SearchMethod  = "UPLOADPHOTOTOSERVER";
    NewLine.Parameter     = "--file";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "Image file";
    NewLine.Region      = "Community management";
    NewLine.MethodDescription   = "Uploads photo to server for further use
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadPhotoToServer";
    NewLine.SearchMethod  = "UPLOADPHOTOTOSERVER";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "UploadPhotoToServer";
    NewLine.SearchMethod  = "UPLOADPHOTOTOSERVER";
    NewLine.Parameter     = "--type";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Upload type (Post, Product, Story, Poll, Other) (optional, def. val.. - Post)";
    NewLine.Region      = "Community management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateDiscussion";
    NewLine.SearchMethod  = "CREATEDISCUSSION";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Discussion name";
    NewLine.Region      = "Discussion management";
    NewLine.MethodDescription   = "Creates a new discussion
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateDiscussion";
    NewLine.SearchMethod  = "CREATEDISCUSSION";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Text of the first message";
    NewLine.Region      = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateDiscussion";
    NewLine.SearchMethod  = "CREATEDISCUSSION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CloseDiscussion";
    NewLine.SearchMethod  = "CLOSEDISCUSSION";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Discussion ID";
    NewLine.Region      = "Discussion management";
    NewLine.MethodDescription   = "Close or delete discussion
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CloseDiscussion";
    NewLine.SearchMethod  = "CLOSEDISCUSSION";
    NewLine.Parameter     = "--remove";
    NewLine.ParameterTrim = "-r";
    NewLine.Description     = "Delete completely (True) or close (optional, def. val.. - False)";
    NewLine.Region      = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CloseDiscussion";
    NewLine.SearchMethod  = "CLOSEDISCUSSION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "OpenDiscussion";
    NewLine.SearchMethod  = "OPENDISCUSSION";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Discussion ID";
    NewLine.Region      = "Discussion management";
    NewLine.MethodDescription   = "Opens a previously closed discussion
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "OpenDiscussion";
    NewLine.SearchMethod  = "OPENDISCUSSION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteInDiscussion";
    NewLine.SearchMethod  = "WRITEINDISCUSSION";
    NewLine.Parameter     = "--topic";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Discussion ID";
    NewLine.Region      = "Discussion management";
    NewLine.MethodDescription   = "Adds a message to the discussion on behalf of the group
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteInDiscussion";
    NewLine.SearchMethod  = "WRITEINDISCUSSION";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteInDiscussion";
    NewLine.SearchMethod  = "WRITEINDISCUSSION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "LikePost";
    NewLine.SearchMethod  = "LIKEPOST";
    NewLine.Parameter     = "--post";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Post ID";
    NewLine.Region      = "Interactive actions";
    NewLine.MethodDescription   = "Likes a post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "LikePost";
    NewLine.SearchMethod  = "LIKEPOST";
    NewLine.Parameter     = "--wall";
    NewLine.ParameterTrim = "-w";
    NewLine.Description     = "ID of the wall where the post is located (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "LikePost";
    NewLine.SearchMethod  = "LIKEPOST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "MakeRepost";
    NewLine.SearchMethod  = "MAKEREPOST";
    NewLine.Parameter     = "--post";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Post ID";
    NewLine.Region      = "Interactive actions";
    NewLine.MethodDescription   = "Reposts the record
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "MakeRepost";
    NewLine.SearchMethod  = "MAKEREPOST";
    NewLine.Parameter     = "--from";
    NewLine.ParameterTrim = "-f";
    NewLine.Description     = "ID of the wall where the post is located (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "MakeRepost";
    NewLine.SearchMethod  = "MAKEREPOST";
    NewLine.Parameter     = "--to";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "ID of the target wall or group (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "MakeRepost";
    NewLine.SearchMethod  = "MAKEREPOST";
    NewLine.Parameter     = "--ad";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Sign of an advertising post (optional, def. val.. - False)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "MakeRepost";
    NewLine.SearchMethod  = "MAKEREPOST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteMessage";
    NewLine.SearchMethod  = "WRITEMESSAGE";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Message text";
    NewLine.Region      = "Interactive actions";
    NewLine.MethodDescription   = "Write a message to a user in the community's dialog
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteMessage";
    NewLine.SearchMethod  = "WRITEMESSAGE";
    NewLine.Parameter     = "--user";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "Recipient user ID";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteMessage";
    NewLine.SearchMethod  = "WRITEMESSAGE";
    NewLine.Parameter     = "--ct";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Community chat bot token, which can be obtained in the settings";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteMessage";
    NewLine.SearchMethod  = "WRITEMESSAGE";
    NewLine.Parameter     = "--keyboard";
    NewLine.ParameterTrim = "-k";
    NewLine.Description     = "Keyboard JSON. See FormKeyboard (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteMessage";
    NewLine.SearchMethod  = "WRITEMESSAGE";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteComment";
    NewLine.SearchMethod  = "WRITECOMMENT";
    NewLine.Parameter     = "--post";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "ID of the target post";
    NewLine.Region      = "Interactive actions";
    NewLine.MethodDescription   = "Creates a comment under the selected record
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteComment";
    NewLine.SearchMethod  = "WRITECOMMENT";
    NewLine.Parameter     = "--wall";
    NewLine.ParameterTrim = "-w";
    NewLine.Description     = "ID of the wall where the post is located";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteComment";
    NewLine.SearchMethod  = "WRITECOMMENT";
    NewLine.Parameter     = "--text";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Comment text";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "WriteComment";
    NewLine.SearchMethod  = "WRITECOMMENT";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "ShortenLink";
    NewLine.SearchMethod  = "SHORTENLINK";
    NewLine.Parameter     = "--url";
    NewLine.ParameterTrim = "-u";
    NewLine.Description     = "URL for shortening";
    NewLine.Region      = "Interactive actions";
    NewLine.MethodDescription   = "Creates a shortened URL from a regular one
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "ShortenLink";
    NewLine.SearchMethod  = "SHORTENLINK";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetStatistics";
    NewLine.SearchMethod  = "GETSTATISTICS";
    NewLine.Parameter     = "--datefrom";
    NewLine.ParameterTrim = "-d";
    NewLine.Description     = "Start date of the period";
    NewLine.Region      = "Statistics";
    NewLine.MethodDescription   = "Gets the overall community statistics for a period
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetStatistics";
    NewLine.SearchMethod  = "GETSTATISTICS";
    NewLine.Parameter     = "--dateto";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "End date of the period";
    NewLine.Region      = "Statistics";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetStatistics";
    NewLine.SearchMethod  = "GETSTATISTICS";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Statistics";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetPostStatistics";
    NewLine.SearchMethod  = "GETPOSTSTATISTICS";
    NewLine.Parameter     = "--posts";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Array of post IDs";
    NewLine.Region      = "Statistics";
    NewLine.MethodDescription   = "Gets statistics in terms of posts
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetPostStatistics";
    NewLine.SearchMethod  = "GETPOSTSTATISTICS";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Statistics";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAdvertisingCampaign";
    NewLine.SearchMethod  = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Parameter     = "--cabinet";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Advertising account ID";
    NewLine.Region      = "Ad account management";
    NewLine.MethodDescription   = "Creates a campaign in the selected advertising account
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAdvertisingCampaign";
    NewLine.SearchMethod  = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Campaign name";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAdvertisingCampaign";
    NewLine.SearchMethod  = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAd";
    NewLine.SearchMethod  = "CREATEAD";
    NewLine.Parameter     = "--campaign";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Advertising campaign ID";
    NewLine.Region      = "Ad account management";
    NewLine.MethodDescription   = "Creates an advertising post based on a post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAd";
    NewLine.SearchMethod  = "CREATEAD";
    NewLine.Parameter     = "--limit";
    NewLine.ParameterTrim = "-l";
    NewLine.Description     = "Daily limit in rubles";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAd";
    NewLine.SearchMethod  = "CREATEAD";
    NewLine.Parameter     = "--category";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Advertising category number";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAd";
    NewLine.SearchMethod  = "CREATEAD";
    NewLine.Parameter     = "--post";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "ID of the post used for advertising";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAd";
    NewLine.SearchMethod  = "CREATEAD";
    NewLine.Parameter     = "--cabinet";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Advertising account ID";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateAd";
    NewLine.SearchMethod  = "CREATEAD";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "PauseAdvertising";
    NewLine.SearchMethod  = "PAUSEADVERTISING";
    NewLine.Parameter     = "--cabinet";
    NewLine.ParameterTrim = "-c";
    NewLine.Description     = "Advertising account ID";
    NewLine.Region      = "Ad account management";
    NewLine.MethodDescription   = "Pauses the display of the advertising post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "PauseAdvertising";
    NewLine.SearchMethod  = "PAUSEADVERTISING";
    NewLine.Parameter     = "--adv";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Ad ID";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "PauseAdvertising";
    NewLine.SearchMethod  = "PAUSEADVERTISING";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetAdvertisingCategoryList";
    NewLine.SearchMethod  = "GETADVERTISINGCATEGORYLIST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Ad account management";
    NewLine.MethodDescription   = "Gets a list of advertising category IDs for creating an advertising post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetProductCategoryList";
    NewLine.SearchMethod  = "GETPRODUCTCATEGORYLIST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Gets a list of product category IDs to specify when creating a product
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetProductList";
    NewLine.SearchMethod  = "GETPRODUCTLIST";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection ID, if filtering is needed (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Gets the community's product list
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetProductList";
    NewLine.SearchMethod  = "GETPRODUCTLIST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetProductsByID";
    NewLine.SearchMethod  = "GETPRODUCTSBYID";
    NewLine.Parameter     = "--items";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Array of product IDs";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Gets information about products by array of IDs
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetProductsByID";
    NewLine.SearchMethod  = "GETPRODUCTSBYID";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProduct";
    NewLine.SearchMethod  = "ADDPRODUCT";
    NewLine.Parameter     = "--product";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Product description. See GetProductDescription";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Adds a new product to the community's catalog
    |    Data structure for option --product:
    |    {
    |     ""Name""                : ""New product"",
    |     ""Description""           : ""Product description"",
    |     ""Category""          : ""20173"",
    |     ""Price""               : 1,
    |     ""OldPrice""         : """",
    |     ""MainPhoto""       : """",
    |     ""URL""                : """",
    |     ""AdditionalPhotos"" : [],
    |     ""PropertyValues""    : [],
    |     ""MainInGroup""     : ""False"",
    |     ""Width""             : """",
    |     ""Height""             : """",
    |     ""Depth""            : """",
    |     ""Weight""                : """",
    |     ""SKU""                : """",
    |     ""AvailableBalance""   : ""1""
    |    }
    |
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProduct";
    NewLine.SearchMethod  = "ADDPRODUCT";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection ID for placing the product, if needed (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProduct";
    NewLine.SearchMethod  = "ADDPRODUCT";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProduct";
    NewLine.SearchMethod  = "EDITPRODUCT";
    NewLine.Parameter     = "--item";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Identifier of the product being edited";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Edits a previously created product
    |    Data structure for option --product:
    |    {
    |     ""Name""                : ""New product"",
    |     ""Description""           : ""Product description"",
    |     ""Category""          : ""20173"",
    |     ""Price""               : 1,
    |     ""OldPrice""         : """",
    |     ""MainPhoto""       : """",
    |     ""URL""                : """",
    |     ""AdditionalPhotos"" : [],
    |     ""PropertyValues""    : [],
    |     ""MainInGroup""     : ""False"",
    |     ""Width""             : """",
    |     ""Height""             : """",
    |     ""Depth""            : """",
    |     ""Weight""                : """",
    |     ""SKU""                : """",
    |     ""AvailableBalance""   : ""1""
    |    }
    |
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProduct";
    NewLine.SearchMethod  = "EDITPRODUCT";
    NewLine.Parameter     = "--product";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Product description. See GetProductDescription";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProduct";
    NewLine.SearchMethod  = "EDITPRODUCT";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Identifier of the new selection, if needed (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProduct";
    NewLine.SearchMethod  = "EDITPRODUCT";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteProduct";
    NewLine.SearchMethod  = "DELETEPRODUCT";
    NewLine.Parameter     = "--item";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Product ID";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Deletes a previously created product
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteProduct";
    NewLine.SearchMethod  = "DELETEPRODUCT";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GroupProducts";
    NewLine.SearchMethod  = "GROUPPRODUCTS";
    NewLine.Parameter     = "--items";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Array of product IDs";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Groups products based on similar sets of properties
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GroupProducts";
    NewLine.SearchMethod  = "GROUPPRODUCTS";
    NewLine.Parameter     = "--sellgroup";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "ID of the existing group, if needed (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GroupProducts";
    NewLine.SearchMethod  = "GROUPPRODUCTS";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetProductDescription";
    NewLine.SearchMethod  = "GETPRODUCTDESCRIPTION";
    NewLine.Parameter     = "--empty";
    NewLine.ParameterTrim = "-e";
    NewLine.Description     = "True > structure with empty valuse, False > field descriptions at values (optional, def. val.. - False)";
    NewLine.Region      = "Product management";
    NewLine.MethodDescription   = "Gets the description template for creating a product";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetSelectionList";
    NewLine.SearchMethod  = "GETSELECTIONLIST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";
    NewLine.MethodDescription   = "Gets the list of product selections
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetSelectionsByID";
    NewLine.SearchMethod  = "GETSELECTIONSBYID";
    NewLine.Parameter     = "--sels";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection IDs";
    NewLine.Region      = "Product selection management";
    NewLine.MethodDescription   = "Gets the list of selections by array of IDs
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetSelectionsByID";
    NewLine.SearchMethod  = "GETSELECTIONSBYID";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateProductCollection";
    NewLine.SearchMethod  = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Selection name";
    NewLine.Region      = "Product selection management";
    NewLine.MethodDescription   = "Creates an empty product selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateProductCollection";
    NewLine.SearchMethod  = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Image file";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateProductCollection";
    NewLine.SearchMethod  = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter     = "--main";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Main (optional, def. val.. - False)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateProductCollection";
    NewLine.SearchMethod  = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter     = "--hidden";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Hidden (optional, def. val.. - False)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateProductCollection";
    NewLine.SearchMethod  = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductCollection";
    NewLine.SearchMethod  = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New selection name";
    NewLine.Region      = "Product selection management";
    NewLine.MethodDescription   = "Edits the properties of a product selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductCollection";
    NewLine.SearchMethod  = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection ID";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductCollection";
    NewLine.SearchMethod  = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter     = "--picture";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "New selection image (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductCollection";
    NewLine.SearchMethod  = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter     = "--main";
    NewLine.ParameterTrim = "-m";
    NewLine.Description     = "Main (optional, def. val.. - False)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductCollection";
    NewLine.SearchMethod  = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter     = "--hidden";
    NewLine.ParameterTrim = "-h";
    NewLine.Description     = "Hidden (optional, def. val.. - False)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductCollection";
    NewLine.SearchMethod  = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProductToCollection";
    NewLine.SearchMethod  = "ADDPRODUCTTOCOLLECTION";
    NewLine.Parameter     = "--items";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Array of products or product";
    NewLine.Region      = "Product selection management";
    NewLine.MethodDescription   = "Adds a product to the selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProductToCollection";
    NewLine.SearchMethod  = "ADDPRODUCTTOCOLLECTION";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection ID";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProductToCollection";
    NewLine.SearchMethod  = "ADDPRODUCTTOCOLLECTION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "RemoveProductFromSelection";
    NewLine.SearchMethod  = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Parameter     = "--item";
    NewLine.ParameterTrim = "-i";
    NewLine.Description     = "Product ID";
    NewLine.Region      = "Product selection management";
    NewLine.MethodDescription   = "Removes a previously added product from the selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "RemoveProductFromSelection";
    NewLine.SearchMethod  = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection ID";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "RemoveProductFromSelection";
    NewLine.SearchMethod  = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteSelection";
    NewLine.SearchMethod  = "DELETESELECTION";
    NewLine.Parameter     = "--sel";
    NewLine.ParameterTrim = "-s";
    NewLine.Description     = "Selection ID";
    NewLine.Region      = "Product selection management";
    NewLine.MethodDescription   = "Deletes the selection by ID
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteSelection";
    NewLine.SearchMethod  = "DELETESELECTION";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetPropertyList";
    NewLine.SearchMethod  = "GETPROPERTYLIST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product properties management";
    NewLine.MethodDescription   = "Gets the list of properties of group products
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateProductProperty";
    NewLine.SearchMethod  = "CREATEPRODUCTPROPERTY";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "Property name";
    NewLine.Region      = "Product properties management";
    NewLine.MethodDescription   = "Creates a new property for use in products
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "CreateProductProperty";
    NewLine.SearchMethod  = "CREATEPRODUCTPROPERTY";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductProperty";
    NewLine.SearchMethod  = "EDITPRODUCTPROPERTY";
    NewLine.Parameter     = "--title";
    NewLine.ParameterTrim = "-t";
    NewLine.Description     = "New name";
    NewLine.Region      = "Product properties management";
    NewLine.MethodDescription   = "Edits the existing product property
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductProperty";
    NewLine.SearchMethod  = "EDITPRODUCTPROPERTY";
    NewLine.Parameter     = "--prop";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Property ID";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductProperty";
    NewLine.SearchMethod  = "EDITPRODUCTPROPERTY";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteProductProperty";
    NewLine.SearchMethod  = "DELETEPRODUCTPROPERTY";
    NewLine.Parameter     = "--prop";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Property ID";
    NewLine.Region      = "Product properties management";
    NewLine.MethodDescription   = "Deletes the existing product property
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteProductProperty";
    NewLine.SearchMethod  = "DELETEPRODUCTPROPERTY";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProductPropertyVariant";
    NewLine.SearchMethod  = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--value";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "Property value";
    NewLine.Region      = "Product properties management";
    NewLine.MethodDescription   = "Adds a variant for an existing property
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProductPropertyVariant";
    NewLine.SearchMethod  = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--prop";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Property ID where the variant is added";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "AddProductPropertyVariant";
    NewLine.SearchMethod  = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductPropertyVariant";
    NewLine.SearchMethod  = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--value";
    NewLine.ParameterTrim = "-v";
    NewLine.Description     = "New property value";
    NewLine.Region      = "Product properties management";
    NewLine.MethodDescription   = "Edits the value of an existing product property variant
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductPropertyVariant";
    NewLine.SearchMethod  = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--prop";
    NewLine.ParameterTrim = "-p";
    NewLine.Description     = "Property ID";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductPropertyVariant";
    NewLine.SearchMethod  = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--option";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Variant ID";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "EditProductPropertyVariant";
    NewLine.SearchMethod  = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteProductPropertyVariant";
    NewLine.SearchMethod  = "DELETEPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--option";
    NewLine.ParameterTrim = "-o";
    NewLine.Description     = "Variant ID";
    NewLine.Region      = "Product properties management";
    NewLine.MethodDescription   = "Deletes the previously created product property variant
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "DeleteProductPropertyVariant";
    NewLine.SearchMethod  = "DELETEPRODUCTPROPERTYVARIANT";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "GetOrderList";
    NewLine.SearchMethod  = "GETORDERLIST";
    NewLine.Parameter     = "--auth";
    NewLine.ParameterTrim = "-a";
    NewLine.Description     = "Authorization parameters. See GetAuthParameters (optional, def. val.. - Empty value)";
    NewLine.Region      = "Order management";
    NewLine.MethodDescription   = "Returns the community's order list
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Library   = "vk";
    NewLine.Module       = "OPI_VK";
    NewLine.Method        = "FormKeyboard";
    NewLine.SearchMethod  = "FORMKEYBOARD";
    NewLine.Parameter     = "--buttons";
    NewLine.ParameterTrim = "-b";
    NewLine.Description     = "Array of button titles";
    NewLine.Region      = "Others";
    NewLine.MethodDescription   = "Forms a keyboard from an array of buttons";

    Return CompositionTable;
EndFunction


Function GetConnectionString() Export


    Return "
        |Context = New Structure;

        |

        |
        |OPI_VK = LoadScript(""%1/oint/core/Modules/OPI_VK.os"", Context);
        |" + Chars.LF;


EndFunction 
