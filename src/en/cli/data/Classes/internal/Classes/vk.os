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
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateTokenRetrievalLink";
    NewLine.МетодПоиска = "CREATETOKENRETRIEVALLINK";
    NewLine.Параметр    = "--app";
    NewLine.Описание    = "app_id from application settings";
    NewLine.Область     = "Token retrieval";
    NewLine.ОписаниеМетода   = "Getting a link for interactive token retrieval (access_token), which is necessary
    |    for further actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Post text";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Creates a post with images
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--pictures";
    NewLine.Описание    = "Array of images";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--ad";
    NewLine.Описание    = "Sign ""This is an ad"" (optional, def. val. - No)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Link (URL) under the post (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePost";
    NewLine.МетодПоиска = "CREATEPOST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateCompositePost";
    NewLine.МетодПоиска = "CREATECOMPOSITEPOST";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Post text";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Creates a post based on an array of object identifiers (images, videos, etc..)
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateCompositePost";
    NewLine.МетодПоиска = "CREATECOMPOSITEPOST";
    NewLine.Параметр    = "--objects";
    NewLine.Описание    = "Array of identifiers like photo123_123";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateCompositePost";
    NewLine.МетодПоиска = "CREATECOMPOSITEPOST";
    NewLine.Параметр    = "--ad";
    NewLine.Описание    = "Sign ""This is an ad"" (optional, def. val. - No)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateCompositePost";
    NewLine.МетодПоиска = "CREATECOMPOSITEPOST";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "Link (URL) under the post (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateCompositePost";
    NewLine.МетодПоиска = "CREATECOMPOSITEPOST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--post";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Deletes a post by ID
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeletePost";
    NewLine.МетодПоиска = "DELETEPOST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePoll";
    NewLine.МетодПоиска = "CREATEPOLL";
    NewLine.Параметр    = "--question";
    NewLine.Описание    = "Poll question";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Creates a poll with answer options
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePoll";
    NewLine.МетодПоиска = "CREATEPOLL";
    NewLine.Параметр    = "--options";
    NewLine.Описание    = "Array of answer options";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePoll";
    NewLine.МетодПоиска = "CREATEPOLL";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Poll image (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreatePoll";
    NewLine.МетодПоиска = "CREATEPOLL";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAlbum";
    NewLine.МетодПоиска = "CREATEALBUM";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Album name";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Creates an album to store images
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAlbum";
    NewLine.МетодПоиска = "CREATEALBUM";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "Album description (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAlbum";
    NewLine.МетодПоиска = "CREATEALBUM";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteAlbum";
    NewLine.МетодПоиска = "DELETEALBUM";
    NewLine.Параметр    = "--album";
    NewLine.Описание    = "Album ID";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Deletes a previously created album
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteAlbum";
    NewLine.МетодПоиска = "DELETEALBUM";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateStory";
    NewLine.МетодПоиска = "CREATESTORY";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Story background";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Creates a story from an image
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateStory";
    NewLine.МетодПоиска = "CREATESTORY";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL for button under the story (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateStory";
    NewLine.МетодПоиска = "CREATESTORY";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "SaveImageToAlbum";
    NewLine.МетодПоиска = "SAVEIMAGETOALBUM";
    NewLine.Параметр    = "--album";
    NewLine.Описание    = "Album ID";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Saves an image to the community album
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "SaveImageToAlbum";
    NewLine.МетодПоиска = "SAVEIMAGETOALBUM";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Image file";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "SaveImageToAlbum";
    NewLine.МетодПоиска = "SAVEIMAGETOALBUM";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "Image description (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "SaveImageToAlbum";
    NewLine.МетодПоиска = "SAVEIMAGETOALBUM";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteImage";
    NewLine.МетодПоиска = "DELETEIMAGE";
    NewLine.Параметр    = "--pictureid";
    NewLine.Описание    = "Image ID";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Deletes an image from the album
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteImage";
    NewLine.МетодПоиска = "DELETEIMAGE";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadVideoToServer";
    NewLine.МетодПоиска = "UPLOADVIDEOTOSERVER";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "Video file";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Uploads video to the group for further use
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadVideoToServer";
    NewLine.МетодПоиска = "UPLOADVIDEOTOSERVER";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Video name";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadVideoToServer";
    NewLine.МетодПоиска = "UPLOADVIDEOTOSERVER";
    NewLine.Параметр    = "--description";
    NewLine.Описание    = "Video description (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadVideoToServer";
    NewLine.МетодПоиска = "UPLOADVIDEOTOSERVER";
    NewLine.Параметр    = "--album";
    NewLine.Описание    = "Album ID, if necessary (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadVideoToServer";
    NewLine.МетодПоиска = "UPLOADVIDEOTOSERVER";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadPhotoToServer";
    NewLine.МетодПоиска = "UPLOADPHOTOTOSERVER";
    NewLine.Параметр    = "--file";
    NewLine.Описание    = "Image file";
    NewLine.Область     = "Community managment";
    NewLine.ОписаниеМетода   = "Uploads photo to server for further use
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadPhotoToServer";
    NewLine.МетодПоиска = "UPLOADPHOTOTOSERVER";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "UploadPhotoToServer";
    NewLine.МетодПоиска = "UPLOADPHOTOTOSERVER";
    NewLine.Параметр    = "--type";
    NewLine.Описание    = "Upload type (Post, Product, Story, Poll, Other) (optional, def. val. - Post)";
    NewLine.Область     = "Community managment";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateDiscussion";
    NewLine.МетодПоиска = "CREATEDISCUSSION";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Discussion name";
    NewLine.Область     = "Discussion management";
    NewLine.ОписаниеМетода   = "Creates a new discussion
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateDiscussion";
    NewLine.МетодПоиска = "CREATEDISCUSSION";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Text of the first message";
    NewLine.Область     = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateDiscussion";
    NewLine.МетодПоиска = "CREATEDISCUSSION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CloseDiscussion";
    NewLine.МетодПоиска = "CLOSEDISCUSSION";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Discussion ID";
    NewLine.Область     = "Discussion management";
    NewLine.ОписаниеМетода   = "Close or delete discussion
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CloseDiscussion";
    NewLine.МетодПоиска = "CLOSEDISCUSSION";
    NewLine.Параметр    = "--remove";
    NewLine.Описание    = "Delete completely (True) or close (optional, def. val. - No)";
    NewLine.Область     = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CloseDiscussion";
    NewLine.МетодПоиска = "CLOSEDISCUSSION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "OpenDiscussion";
    NewLine.МетодПоиска = "OPENDISCUSSION";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Discussion ID";
    NewLine.Область     = "Discussion management";
    NewLine.ОписаниеМетода   = "Opens a previously closed discussion
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "OpenDiscussion";
    NewLine.МетодПоиска = "OPENDISCUSSION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteInDiscussion";
    NewLine.МетодПоиска = "WRITEINDISCUSSION";
    NewLine.Параметр    = "--topic";
    NewLine.Описание    = "Discussion ID";
    NewLine.Область     = "Discussion management";
    NewLine.ОписаниеМетода   = "Adds a message to the discussion on behalf of the group
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteInDiscussion";
    NewLine.МетодПоиска = "WRITEINDISCUSSION";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteInDiscussion";
    NewLine.МетодПоиска = "WRITEINDISCUSSION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Discussion management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "LikePost";
    NewLine.МетодПоиска = "LIKEPOST";
    NewLine.Параметр    = "--post";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "Interactive actions";
    NewLine.ОписаниеМетода   = "Likes a post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "LikePost";
    NewLine.МетодПоиска = "LIKEPOST";
    NewLine.Параметр    = "--wall";
    NewLine.Описание    = "ID of the wall where the post is located (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "LikePost";
    NewLine.МетодПоиска = "LIKEPOST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "MakeRepost";
    NewLine.МетодПоиска = "MAKEREPOST";
    NewLine.Параметр    = "--post";
    NewLine.Описание    = "Post ID";
    NewLine.Область     = "Interactive actions";
    NewLine.ОписаниеМетода   = "Reposts the record
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "MakeRepost";
    NewLine.МетодПоиска = "MAKEREPOST";
    NewLine.Параметр    = "--from";
    NewLine.Описание    = "ID of the wall where the post is located (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "MakeRepost";
    NewLine.МетодПоиска = "MAKEREPOST";
    NewLine.Параметр    = "--to";
    NewLine.Описание    = "ID of the target wall or group (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "MakeRepost";
    NewLine.МетодПоиска = "MAKEREPOST";
    NewLine.Параметр    = "--ad";
    NewLine.Описание    = "Sign of an advertising post (optional, def. val. - No)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "MakeRepost";
    NewLine.МетодПоиска = "MAKEREPOST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteMessage";
    NewLine.МетодПоиска = "WRITEMESSAGE";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Message text";
    NewLine.Область     = "Interactive actions";
    NewLine.ОписаниеМетода   = "Write a message to a user in the community's dialog
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteMessage";
    NewLine.МетодПоиска = "WRITEMESSAGE";
    NewLine.Параметр    = "--user";
    NewLine.Описание    = "Recipient user ID";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteMessage";
    NewLine.МетодПоиска = "WRITEMESSAGE";
    NewLine.Параметр    = "--ct";
    NewLine.Описание    = "Community chat bot token, which can be obtained in the settings";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteMessage";
    NewLine.МетодПоиска = "WRITEMESSAGE";
    NewLine.Параметр    = "--keyboard";
    NewLine.Описание    = "JSON keyboard. See FormKeyboard (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteMessage";
    NewLine.МетодПоиска = "WRITEMESSAGE";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteComment";
    NewLine.МетодПоиска = "WRITECOMMENT";
    NewLine.Параметр    = "--post";
    NewLine.Описание    = "ID of the target post";
    NewLine.Область     = "Interactive actions";
    NewLine.ОписаниеМетода   = "Creates a comment under the selected record
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteComment";
    NewLine.МетодПоиска = "WRITECOMMENT";
    NewLine.Параметр    = "--wall";
    NewLine.Описание    = "ID of the wall where the post is located";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteComment";
    NewLine.МетодПоиска = "WRITECOMMENT";
    NewLine.Параметр    = "--text";
    NewLine.Описание    = "Comment text";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "WriteComment";
    NewLine.МетодПоиска = "WRITECOMMENT";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "ShortenLink";
    NewLine.МетодПоиска = "SHORTENLINK";
    NewLine.Параметр    = "--url";
    NewLine.Описание    = "URL for shortening";
    NewLine.Область     = "Interactive actions";
    NewLine.ОписаниеМетода   = "Creates a shortened URL from a regular one
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "ShortenLink";
    NewLine.МетодПоиска = "SHORTENLINK";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Interactive actions";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetStatistics";
    NewLine.МетодПоиска = "GETSTATISTICS";
    NewLine.Параметр    = "--datefrom";
    NewLine.Описание    = "Start date of the period";
    NewLine.Область     = "Statistics";
    NewLine.ОписаниеМетода   = "Gets the overall community statistics for a period
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetStatistics";
    NewLine.МетодПоиска = "GETSTATISTICS";
    NewLine.Параметр    = "--dateto";
    NewLine.Описание    = "End date of the period";
    NewLine.Область     = "Statistics";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetStatistics";
    NewLine.МетодПоиска = "GETSTATISTICS";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Statistics";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetPostStatistics";
    NewLine.МетодПоиска = "GETPOSTSTATISTICS";
    NewLine.Параметр    = "--posts";
    NewLine.Описание    = "Array of post IDs";
    NewLine.Область     = "Statistics";
    NewLine.ОписаниеМетода   = "Gets statistics in terms of posts
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetPostStatistics";
    NewLine.МетодПоиска = "GETPOSTSTATISTICS";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Statistics";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAdvertisingCampaign";
    NewLine.МетодПоиска = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Параметр    = "--cabinet";
    NewLine.Описание    = "Advertising account ID";
    NewLine.Область     = "Ad account management";
    NewLine.ОписаниеМетода   = "Creates a campaign in the selected advertising account
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAdvertisingCampaign";
    NewLine.МетодПоиска = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Campaign name";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAdvertisingCampaign";
    NewLine.МетодПоиска = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAd";
    NewLine.МетодПоиска = "CREATEAD";
    NewLine.Параметр    = "--campaign";
    NewLine.Описание    = "Advertising campaign ID";
    NewLine.Область     = "Ad account management";
    NewLine.ОписаниеМетода   = "Creates an advertising post based on a post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAd";
    NewLine.МетодПоиска = "CREATEAD";
    NewLine.Параметр    = "--limit";
    NewLine.Описание    = "Daily limit in rubles";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAd";
    NewLine.МетодПоиска = "CREATEAD";
    NewLine.Параметр    = "--category";
    NewLine.Описание    = "Advertising category number";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAd";
    NewLine.МетодПоиска = "CREATEAD";
    NewLine.Параметр    = "--post";
    NewLine.Описание    = "ID of the post used for advertising";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAd";
    NewLine.МетодПоиска = "CREATEAD";
    NewLine.Параметр    = "--cabinet";
    NewLine.Описание    = "Advertising account ID";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateAd";
    NewLine.МетодПоиска = "CREATEAD";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "PauseAdvertising";
    NewLine.МетодПоиска = "PAUSEADVERTISING";
    NewLine.Параметр    = "--cabinet";
    NewLine.Описание    = "Advertising account ID";
    NewLine.Область     = "Ad account management";
    NewLine.ОписаниеМетода   = "Pauses the display of the advertising post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "PauseAdvertising";
    NewLine.МетодПоиска = "PAUSEADVERTISING";
    NewLine.Параметр    = "--adv";
    NewLine.Описание    = "Ad ID";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "PauseAdvertising";
    NewLine.МетодПоиска = "PAUSEADVERTISING";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Ad account management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetAdvertisingCategoryList";
    NewLine.МетодПоиска = "GETADVERTISINGCATEGORYLIST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Ad account management";
    NewLine.ОписаниеМетода   = "Gets a list of advertising category IDs for creating an advertising post
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetProductCategoryList";
    NewLine.МетодПоиска = "GETPRODUCTCATEGORYLIST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Gets a list of product category IDs to specify when creating a product
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetProductList";
    NewLine.МетодПоиска = "GETPRODUCTLIST";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Selection ID, if filtering is needed (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Gets the community's product list
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetProductList";
    NewLine.МетодПоиска = "GETPRODUCTLIST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetProductsByID";
    NewLine.МетодПоиска = "GETPRODUCTSBYID";
    NewLine.Параметр    = "--items";
    NewLine.Описание    = "Array of product IDs";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Gets information about products by array of IDs
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetProductsByID";
    NewLine.МетодПоиска = "GETPRODUCTSBYID";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProduct";
    NewLine.МетодПоиска = "ADDPRODUCT";
    NewLine.Параметр    = "--product";
    NewLine.Описание    = "JSON description of the product or path";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Adds a new product to the community's catalog
    |    Data structure for option --product:
    |    {
    |     ""Name"": ""New product"",
    |     ""Description"": ""Product description"",
    |     ""Category"": ""20173"",
    |     ""Price"": 1,
    |     ""OldPrice"": """",
    |     ""MainPhoto"": """",
    |     ""URL"": """",
    |     ""AdditionalPhotos"": [],
    |     ""PropertyValues"": [],
    |     ""MainInGroup"": ""False"",
    |     ""Width"": """",
    |     ""Height"": """",
    |     ""Depth"": """",
    |     ""Weight"": """",
    |     ""SKU"": """",
    |     ""AvailableBalance"": ""1""
    |    }
    |
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProduct";
    NewLine.МетодПоиска = "ADDPRODUCT";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Selection ID for placing the product, if needed (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProduct";
    NewLine.МетодПоиска = "ADDPRODUCT";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProduct";
    NewLine.МетодПоиска = "EDITPRODUCT";
    NewLine.Параметр    = "--item";
    NewLine.Описание    = "Identifier of the product being edited";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Edits a previously created product
    |    Data structure for option --product:
    |    {
    |     ""Name"": ""New product"",
    |     ""Description"": ""Product description"",
    |     ""Category"": ""20173"",
    |     ""Price"": 1,
    |     ""OldPrice"": """",
    |     ""MainPhoto"": """",
    |     ""URL"": """",
    |     ""AdditionalPhotos"": [],
    |     ""PropertyValues"": [],
    |     ""MainInGroup"": ""False"",
    |     ""Width"": """",
    |     ""Height"": """",
    |     ""Depth"": """",
    |     ""Weight"": """",
    |     ""SKU"": """",
    |     ""AvailableBalance"": ""1""
    |    }
    |
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProduct";
    NewLine.МетодПоиска = "EDITPRODUCT";
    NewLine.Параметр    = "--product";
    NewLine.Описание    = "JSON description of the product or path";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProduct";
    NewLine.МетодПоиска = "EDITPRODUCT";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Identifier of the new selection, if needed (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProduct";
    NewLine.МетодПоиска = "EDITPRODUCT";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteProduct";
    NewLine.МетодПоиска = "DELETEPRODUCT";
    NewLine.Параметр    = "--item";
    NewLine.Описание    = "Product ID";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Deletes a previously created product
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteProduct";
    NewLine.МетодПоиска = "DELETEPRODUCT";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GroupProducts";
    NewLine.МетодПоиска = "GROUPPRODUCTS";
    NewLine.Параметр    = "--items";
    NewLine.Описание    = "Array of product IDs";
    NewLine.Область     = "Product management";
    NewLine.ОписаниеМетода   = "Groups products based on similar sets of properties
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GroupProducts";
    NewLine.МетодПоиска = "GROUPPRODUCTS";
    NewLine.Параметр    = "--sellgroup";
    NewLine.Описание    = "ID of the existing group, if needed (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GroupProducts";
    NewLine.МетодПоиска = "GROUPPRODUCTS";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetSelectionList";
    NewLine.МетодПоиска = "GETSELECTIONLIST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";
    NewLine.ОписаниеМетода   = "Gets the list of product selections
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetSelectionsByID";
    NewLine.МетодПоиска = "GETSELECTIONSBYID";
    NewLine.Параметр    = "--sels";
    NewLine.Описание    = "Selection IDs";
    NewLine.Область     = "Product selection management";
    NewLine.ОписаниеМетода   = "Gets the list of selections by array of IDs
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetSelectionsByID";
    NewLine.МетодПоиска = "GETSELECTIONSBYID";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateProductCollection";
    NewLine.МетодПоиска = "CREATEPRODUCTCOLLECTION";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Selection name";
    NewLine.Область     = "Product selection management";
    NewLine.ОписаниеМетода   = "Creates an empty product selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateProductCollection";
    NewLine.МетодПоиска = "CREATEPRODUCTCOLLECTION";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "Image file";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateProductCollection";
    NewLine.МетодПоиска = "CREATEPRODUCTCOLLECTION";
    NewLine.Параметр    = "--main";
    NewLine.Описание    = "Main (optional, def. val. - No)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateProductCollection";
    NewLine.МетодПоиска = "CREATEPRODUCTCOLLECTION";
    NewLine.Параметр    = "--hidden";
    NewLine.Описание    = "Hidden (optional, def. val. - No)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateProductCollection";
    NewLine.МетодПоиска = "CREATEPRODUCTCOLLECTION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductCollection";
    NewLine.МетодПоиска = "EDITPRODUCTCOLLECTION";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New selection name";
    NewLine.Область     = "Product selection management";
    NewLine.ОписаниеМетода   = "Edits the properties of a product selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductCollection";
    NewLine.МетодПоиска = "EDITPRODUCTCOLLECTION";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Selection ID";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductCollection";
    NewLine.МетодПоиска = "EDITPRODUCTCOLLECTION";
    NewLine.Параметр    = "--picture";
    NewLine.Описание    = "New selection image (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductCollection";
    NewLine.МетодПоиска = "EDITPRODUCTCOLLECTION";
    NewLine.Параметр    = "--main";
    NewLine.Описание    = "Main (optional, def. val. - No)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductCollection";
    NewLine.МетодПоиска = "EDITPRODUCTCOLLECTION";
    NewLine.Параметр    = "--hidden";
    NewLine.Описание    = "Hidden (optional, def. val. - No)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductCollection";
    NewLine.МетодПоиска = "EDITPRODUCTCOLLECTION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProductToCollection";
    NewLine.МетодПоиска = "ADDPRODUCTTOCOLLECTION";
    NewLine.Параметр    = "--items";
    NewLine.Описание    = "Array of products or product";
    NewLine.Область     = "Product selection management";
    NewLine.ОписаниеМетода   = "Adds a product to the selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProductToCollection";
    NewLine.МетодПоиска = "ADDPRODUCTTOCOLLECTION";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Selection ID";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProductToCollection";
    NewLine.МетодПоиска = "ADDPRODUCTTOCOLLECTION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "RemoveProductFromSelection";
    NewLine.МетодПоиска = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Параметр    = "--item";
    NewLine.Описание    = "Product ID";
    NewLine.Область     = "Product selection management";
    NewLine.ОписаниеМетода   = "Removes a previously added product from the selection
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "RemoveProductFromSelection";
    NewLine.МетодПоиска = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Selection ID";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "RemoveProductFromSelection";
    NewLine.МетодПоиска = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteSelection";
    NewLine.МетодПоиска = "DELETESELECTION";
    NewLine.Параметр    = "--sel";
    NewLine.Описание    = "Selection ID";
    NewLine.Область     = "Product selection management";
    NewLine.ОписаниеМетода   = "Deletes the selection by ID
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteSelection";
    NewLine.МетодПоиска = "DELETESELECTION";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product selection management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetPropertyList";
    NewLine.МетодПоиска = "GETPROPERTYLIST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product properties management";
    NewLine.ОписаниеМетода   = "Gets the list of properties of group products
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateProductProperty";
    NewLine.МетодПоиска = "CREATEPRODUCTPROPERTY";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "Property name";
    NewLine.Область     = "Product properties management";
    NewLine.ОписаниеМетода   = "Creates a new property for use in products
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "CreateProductProperty";
    NewLine.МетодПоиска = "CREATEPRODUCTPROPERTY";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductProperty";
    NewLine.МетодПоиска = "EDITPRODUCTPROPERTY";
    NewLine.Параметр    = "--title";
    NewLine.Описание    = "New name";
    NewLine.Область     = "Product properties management";
    NewLine.ОписаниеМетода   = "Edits the existing product property
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductProperty";
    NewLine.МетодПоиска = "EDITPRODUCTPROPERTY";
    NewLine.Параметр    = "--prop";
    NewLine.Описание    = "Property ID";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductProperty";
    NewLine.МетодПоиска = "EDITPRODUCTPROPERTY";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteProductProperty";
    NewLine.МетодПоиска = "DELETEPRODUCTPROPERTY";
    NewLine.Параметр    = "--prop";
    NewLine.Описание    = "Property ID";
    NewLine.Область     = "Product properties management";
    NewLine.ОписаниеМетода   = "Deletes the existing product property
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteProductProperty";
    NewLine.МетодПоиска = "DELETEPRODUCTPROPERTY";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProductPropertyVariant";
    NewLine.МетодПоиска = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--value";
    NewLine.Описание    = "Property value";
    NewLine.Область     = "Product properties management";
    NewLine.ОписаниеМетода   = "Adds a variant for an existing property
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProductPropertyVariant";
    NewLine.МетодПоиска = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--prop";
    NewLine.Описание    = "Property ID where the variant is added";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "AddProductPropertyVariant";
    NewLine.МетодПоиска = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductPropertyVariant";
    NewLine.МетодПоиска = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--value";
    NewLine.Описание    = "New property value";
    NewLine.Область     = "Product properties management";
    NewLine.ОписаниеМетода   = "Edits the value of an existing product property variant
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductPropertyVariant";
    NewLine.МетодПоиска = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--prop";
    NewLine.Описание    = "Property ID";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductPropertyVariant";
    NewLine.МетодПоиска = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--option";
    NewLine.Описание    = "Variant ID";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "EditProductPropertyVariant";
    NewLine.МетодПоиска = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteProductPropertyVariant";
    NewLine.МетодПоиска = "DELETEPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--option";
    NewLine.Описание    = "Variant ID";
    NewLine.Область     = "Product properties management";
    NewLine.ОписаниеМетода   = "Deletes the previously created product property variant
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "DeleteProductPropertyVariant";
    NewLine.МетодПоиска = "DELETEPRODUCTPROPERTYVARIANT";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Product properties management";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "GetOrderList";
    NewLine.МетодПоиска = "GETORDERLIST";
    NewLine.Параметр    = "--auth";
    NewLine.Описание    = "Authorization JSON or path to .json (optional, def. val. - Empty value)";
    NewLine.Область     = "Order management";
    NewLine.ОписаниеМетода   = "Returns the community's order list
    |    Data structure for option --auth:
    |    {
    |     ""access_token"": """",
    |     ""owner_id"": """",   
    |     ""app_id"": """",  
    |     ""group_id"": """"  
    |    }
    |";


    NewLine = CompositionTable.Add();
    NewLine.Библиотека  = "vk";
    NewLine.Модуль      = "OPI_VK";
    NewLine.Метод       = "FormKeyboard";
    NewLine.МетодПоиска = "FORMKEYBOARD";
    NewLine.Параметр    = "--buttons";
    NewLine.Описание    = "Array of button titles";
    NewLine.Область     = "Others";
    NewLine.ОписаниеМетода   = "Forms a keyboard from an array of buttons";

    Return CompositionTable;
EndFunction

