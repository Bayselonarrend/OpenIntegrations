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
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateTokenRetrievalLink";
    NewLine.SearchMethod = "CREATETOKENRETRIEVALLINK";
    NewLine.Parameter    = "--app";
    NewLine.Description    = "app_id from application settings";
    NewLine.Region     = "Token retrieval";
    NewLine.MethodDescription   = "Getting a link for interactive token retrieval (access_token), which is necessary
    |    for further actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePost";
    NewLine.SearchMethod = "CREATEPOST";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Post text";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Creates a post with images
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePost";
    NewLine.SearchMethod = "CREATEPOST";
    NewLine.Parameter    = "--pictures";
    NewLine.Description    = "Array of images";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePost";
    NewLine.SearchMethod = "CREATEPOST";
    NewLine.Parameter    = "--ad";
    NewLine.Description    = "Sign ""This is an ad"" (optional, def. val. - False)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePost";
    NewLine.SearchMethod = "CREATEPOST";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Link (URL) under the post (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePost";
    NewLine.SearchMethod = "CREATEPOST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateCompositePost";
    NewLine.SearchMethod = "CREATECOMPOSITEPOST";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Post text";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Creates a post based on an array of object identifiers (images, videos, etc..)
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateCompositePost";
    NewLine.SearchMethod = "CREATECOMPOSITEPOST";
    NewLine.Parameter    = "--objects";
    NewLine.Description    = "Array of identifiers like photo123_123";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateCompositePost";
    NewLine.SearchMethod = "CREATECOMPOSITEPOST";
    NewLine.Parameter    = "--ad";
    NewLine.Description    = "Sign ""This is an ad"" (optional, def. val. - False)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateCompositePost";
    NewLine.SearchMethod = "CREATECOMPOSITEPOST";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "Link (URL) under the post (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateCompositePost";
    NewLine.SearchMethod = "CREATECOMPOSITEPOST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeletePost";
    NewLine.SearchMethod = "DELETEPOST";
    NewLine.Parameter    = "--post";
    NewLine.Description    = "Post ID";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Deletes a post by ID
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeletePost";
    NewLine.SearchMethod = "DELETEPOST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePoll";
    NewLine.SearchMethod = "CREATEPOLL";
    NewLine.Parameter    = "--question";
    NewLine.Description    = "Poll question";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Creates a poll with answer options
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePoll";
    NewLine.SearchMethod = "CREATEPOLL";
    NewLine.Parameter    = "--options";
    NewLine.Description    = "Array of answer options";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePoll";
    NewLine.SearchMethod = "CREATEPOLL";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Poll image (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreatePoll";
    NewLine.SearchMethod = "CREATEPOLL";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAlbum";
    NewLine.SearchMethod = "CREATEALBUM";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Album name";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Creates an album to store images
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAlbum";
    NewLine.SearchMethod = "CREATEALBUM";
    NewLine.Parameter    = "--description";
    NewLine.Description    = "Album description (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAlbum";
    NewLine.SearchMethod = "CREATEALBUM";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteAlbum";
    NewLine.SearchMethod = "DELETEALBUM";
    NewLine.Parameter    = "--album";
    NewLine.Description    = "Album ID";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Deletes a previously created album
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteAlbum";
    NewLine.SearchMethod = "DELETEALBUM";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateStory";
    NewLine.SearchMethod = "CREATESTORY";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Story background";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Creates a story from an image
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateStory";
    NewLine.SearchMethod = "CREATESTORY";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "URL for button under the story (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateStory";
    NewLine.SearchMethod = "CREATESTORY";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "SaveImageToAlbum";
    NewLine.SearchMethod = "SAVEIMAGETOALBUM";
    NewLine.Parameter    = "--album";
    NewLine.Description    = "Album ID";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Saves an image to the community album
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "SaveImageToAlbum";
    NewLine.SearchMethod = "SAVEIMAGETOALBUM";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Image file";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "SaveImageToAlbum";
    NewLine.SearchMethod = "SAVEIMAGETOALBUM";
    NewLine.Parameter    = "--description";
    NewLine.Description    = "Image description (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "SaveImageToAlbum";
    NewLine.SearchMethod = "SAVEIMAGETOALBUM";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteImage";
    NewLine.SearchMethod = "DELETEIMAGE";
    NewLine.Parameter    = "--pictureid";
    NewLine.Description    = "Image ID";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Deletes an image from the album
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteImage";
    NewLine.SearchMethod = "DELETEIMAGE";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadVideoToServer";
    NewLine.SearchMethod = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter    = "--file";
    NewLine.Description    = "Video file";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Uploads video to the group for further use
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadVideoToServer";
    NewLine.SearchMethod = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Video name";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadVideoToServer";
    NewLine.SearchMethod = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter    = "--description";
    NewLine.Description    = "Video description (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadVideoToServer";
    NewLine.SearchMethod = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter    = "--album";
    NewLine.Description    = "Album ID, if necessary (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadVideoToServer";
    NewLine.SearchMethod = "UPLOADVIDEOTOSERVER";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadPhotoToServer";
    NewLine.SearchMethod = "UPLOADPHOTOTOSERVER";
    NewLine.Parameter    = "--file";
    NewLine.Description    = "Image file";
    NewLine.Region     = "Community managment";
    NewLine.MethodDescription   = "Uploads photo to server for further use
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadPhotoToServer";
    NewLine.SearchMethod = "UPLOADPHOTOTOSERVER";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "UploadPhotoToServer";
    NewLine.SearchMethod = "UPLOADPHOTOTOSERVER";
    NewLine.Parameter    = "--type";
    NewLine.Description    = "Upload type (Post, Product, Story, Poll, Other) (optional, def. val. - Post)";
    NewLine.Region     = "Community managment";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateDiscussion";
    NewLine.SearchMethod = "CREATEDISCUSSION";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Discussion name";
    NewLine.Region     = "Discussion management";
    NewLine.MethodDescription   = "Creates a new discussion
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateDiscussion";
    NewLine.SearchMethod = "CREATEDISCUSSION";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Text of the first message";
    NewLine.Region     = "Discussion management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateDiscussion";
    NewLine.SearchMethod = "CREATEDISCUSSION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Discussion management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CloseDiscussion";
    NewLine.SearchMethod = "CLOSEDISCUSSION";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Discussion ID";
    NewLine.Region     = "Discussion management";
    NewLine.MethodDescription   = "Close or delete discussion
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CloseDiscussion";
    NewLine.SearchMethod = "CLOSEDISCUSSION";
    NewLine.Parameter    = "--remove";
    NewLine.Description    = "Delete completely (True) or close (optional, def. val. - False)";
    NewLine.Region     = "Discussion management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CloseDiscussion";
    NewLine.SearchMethod = "CLOSEDISCUSSION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Discussion management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "OpenDiscussion";
    NewLine.SearchMethod = "OPENDISCUSSION";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Discussion ID";
    NewLine.Region     = "Discussion management";
    NewLine.MethodDescription   = "Opens a previously closed discussion
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "OpenDiscussion";
    NewLine.SearchMethod = "OPENDISCUSSION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Discussion management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteInDiscussion";
    NewLine.SearchMethod = "WRITEINDISCUSSION";
    NewLine.Parameter    = "--topic";
    NewLine.Description    = "Discussion ID";
    NewLine.Region     = "Discussion management";
    NewLine.MethodDescription   = "Adds a message to the discussion on behalf of the group
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteInDiscussion";
    NewLine.SearchMethod = "WRITEINDISCUSSION";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Discussion management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteInDiscussion";
    NewLine.SearchMethod = "WRITEINDISCUSSION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Discussion management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "LikePost";
    NewLine.SearchMethod = "LIKEPOST";
    NewLine.Parameter    = "--post";
    NewLine.Description    = "Post ID";
    NewLine.Region     = "Interactive actions";
    NewLine.MethodDescription   = "Likes a post
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "LikePost";
    NewLine.SearchMethod = "LIKEPOST";
    NewLine.Parameter    = "--wall";
    NewLine.Description    = "ID of the wall where the post is located (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "LikePost";
    NewLine.SearchMethod = "LIKEPOST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "MakeRepost";
    NewLine.SearchMethod = "MAKEREPOST";
    NewLine.Parameter    = "--post";
    NewLine.Description    = "Post ID";
    NewLine.Region     = "Interactive actions";
    NewLine.MethodDescription   = "Reposts the record
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "MakeRepost";
    NewLine.SearchMethod = "MAKEREPOST";
    NewLine.Parameter    = "--from";
    NewLine.Description    = "ID of the wall where the post is located (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "MakeRepost";
    NewLine.SearchMethod = "MAKEREPOST";
    NewLine.Parameter    = "--to";
    NewLine.Description    = "ID of the target wall or group (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "MakeRepost";
    NewLine.SearchMethod = "MAKEREPOST";
    NewLine.Parameter    = "--ad";
    NewLine.Description    = "Sign of an advertising post (optional, def. val. - False)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "MakeRepost";
    NewLine.SearchMethod = "MAKEREPOST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteMessage";
    NewLine.SearchMethod = "WRITEMESSAGE";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Message text";
    NewLine.Region     = "Interactive actions";
    NewLine.MethodDescription   = "Write a message to a user in the community's dialog
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteMessage";
    NewLine.SearchMethod = "WRITEMESSAGE";
    NewLine.Parameter    = "--user";
    NewLine.Description    = "Recipient user ID";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteMessage";
    NewLine.SearchMethod = "WRITEMESSAGE";
    NewLine.Parameter    = "--ct";
    NewLine.Description    = "Community chat bot token, which can be obtained in the settings";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteMessage";
    NewLine.SearchMethod = "WRITEMESSAGE";
    NewLine.Parameter    = "--keyboard";
    NewLine.Description    = "JSON keyboard. See FormKeyboard (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteMessage";
    NewLine.SearchMethod = "WRITEMESSAGE";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteComment";
    NewLine.SearchMethod = "WRITECOMMENT";
    NewLine.Parameter    = "--post";
    NewLine.Description    = "ID of the target post";
    NewLine.Region     = "Interactive actions";
    NewLine.MethodDescription   = "Creates a comment under the selected record
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteComment";
    NewLine.SearchMethod = "WRITECOMMENT";
    NewLine.Parameter    = "--wall";
    NewLine.Description    = "ID of the wall where the post is located";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteComment";
    NewLine.SearchMethod = "WRITECOMMENT";
    NewLine.Parameter    = "--text";
    NewLine.Description    = "Comment text";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "WriteComment";
    NewLine.SearchMethod = "WRITECOMMENT";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "ShortenLink";
    NewLine.SearchMethod = "SHORTENLINK";
    NewLine.Parameter    = "--url";
    NewLine.Description    = "URL for shortening";
    NewLine.Region     = "Interactive actions";
    NewLine.MethodDescription   = "Creates a shortened URL from a regular one
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "ShortenLink";
    NewLine.SearchMethod = "SHORTENLINK";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Interactive actions";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetStatistics";
    NewLine.SearchMethod = "GETSTATISTICS";
    NewLine.Parameter    = "--datefrom";
    NewLine.Description    = "Start date of the period";
    NewLine.Region     = "Statistics";
    NewLine.MethodDescription   = "Gets the overall community statistics for a period
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetStatistics";
    NewLine.SearchMethod = "GETSTATISTICS";
    NewLine.Parameter    = "--dateto";
    NewLine.Description    = "End date of the period";
    NewLine.Region     = "Statistics";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetStatistics";
    NewLine.SearchMethod = "GETSTATISTICS";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Statistics";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetPostStatistics";
    NewLine.SearchMethod = "GETPOSTSTATISTICS";
    NewLine.Parameter    = "--posts";
    NewLine.Description    = "Array of post IDs";
    NewLine.Region     = "Statistics";
    NewLine.MethodDescription   = "Gets statistics in terms of posts
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetPostStatistics";
    NewLine.SearchMethod = "GETPOSTSTATISTICS";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Statistics";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAdvertisingCampaign";
    NewLine.SearchMethod = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Parameter    = "--cabinet";
    NewLine.Description    = "Advertising account ID";
    NewLine.Region     = "Ad account management";
    NewLine.MethodDescription   = "Creates a campaign in the selected advertising account
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAdvertisingCampaign";
    NewLine.SearchMethod = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Campaign name";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAdvertisingCampaign";
    NewLine.SearchMethod = "CREATEADVERTISINGCAMPAIGN";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAd";
    NewLine.SearchMethod = "CREATEAD";
    NewLine.Parameter    = "--campaign";
    NewLine.Description    = "Advertising campaign ID";
    NewLine.Region     = "Ad account management";
    NewLine.MethodDescription   = "Creates an advertising post based on a post
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAd";
    NewLine.SearchMethod = "CREATEAD";
    NewLine.Parameter    = "--limit";
    NewLine.Description    = "Daily limit in rubles";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAd";
    NewLine.SearchMethod = "CREATEAD";
    NewLine.Parameter    = "--category";
    NewLine.Description    = "Advertising category number";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAd";
    NewLine.SearchMethod = "CREATEAD";
    NewLine.Parameter    = "--post";
    NewLine.Description    = "ID of the post used for advertising";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAd";
    NewLine.SearchMethod = "CREATEAD";
    NewLine.Parameter    = "--cabinet";
    NewLine.Description    = "Advertising account ID";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateAd";
    NewLine.SearchMethod = "CREATEAD";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "PauseAdvertisingAd";
    NewLine.SearchMethod = "PAUSEADVERTISINGAD";
    NewLine.Parameter    = "--cabinet";
    NewLine.Description    = "Advertising account ID";
    NewLine.Region     = "Ad account management";
    NewLine.MethodDescription   = "Pauses the display of the advertising post
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "PauseAdvertisingAd";
    NewLine.SearchMethod = "PAUSEADVERTISINGAD";
    NewLine.Parameter    = "--adv";
    NewLine.Description    = "Ad ID";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "PauseAdvertisingAd";
    NewLine.SearchMethod = "PAUSEADVERTISINGAD";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Ad account management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetAdvertisingCategoryList";
    NewLine.SearchMethod = "GETADVERTISINGCATEGORYLIST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Ad account management";
    NewLine.MethodDescription   = "Gets a list of advertising category IDs for creating an advertising post
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetProductCategoryList";
    NewLine.SearchMethod = "GETPRODUCTCATEGORYLIST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";
    NewLine.MethodDescription   = "Gets a list of product category IDs to specify when creating a product
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetProductList";
    NewLine.SearchMethod = "GETPRODUCTLIST";
    NewLine.Parameter    = "--sel";
    NewLine.Description    = "Selection ID, if filtering is needed (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";
    NewLine.MethodDescription   = "Gets the community's product list
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetProductList";
    NewLine.SearchMethod = "GETPRODUCTLIST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetProductsByID";
    NewLine.SearchMethod = "GETPRODUCTSBYID";
    NewLine.Parameter    = "--items";
    NewLine.Description    = "Array of product IDs";
    NewLine.Region     = "Product management";
    NewLine.MethodDescription   = "Gets information about products by array of IDs
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetProductsByID";
    NewLine.SearchMethod = "GETPRODUCTSBYID";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProduct";
    NewLine.SearchMethod = "ADDPRODUCT";
    NewLine.Parameter    = "--product";
    NewLine.Description    = "JSON description of the product or path";
    NewLine.Region     = "Product management";
    NewLine.MethodDescription   = "Adds a new product to the community's catalog
    |
    |    The structure of the JSON product description data (parameter --product):
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
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProduct";
    NewLine.SearchMethod = "ADDPRODUCT";
    NewLine.Parameter    = "--sel";
    NewLine.Description    = "Selection ID for placing the product, if needed (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProduct";
    NewLine.SearchMethod = "ADDPRODUCT";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProduct";
    NewLine.SearchMethod = "EDITPRODUCT";
    NewLine.Parameter    = "--item";
    NewLine.Description    = "Identifier of the product being edited";
    NewLine.Region     = "Product management";
    NewLine.MethodDescription   = "Edits a previously created product
    |
    |    The structure of the JSON product description data (parameter --product):
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
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProduct";
    NewLine.SearchMethod = "EDITPRODUCT";
    NewLine.Parameter    = "--product";
    NewLine.Description    = "JSON description of the product or path";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProduct";
    NewLine.SearchMethod = "EDITPRODUCT";
    NewLine.Parameter    = "--sel";
    NewLine.Description    = "Identifier of the new selection, if needed (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProduct";
    NewLine.SearchMethod = "EDITPRODUCT";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteProduct";
    NewLine.SearchMethod = "DELETEPRODUCT";
    NewLine.Parameter    = "--item";
    NewLine.Description    = "Product ID";
    NewLine.Region     = "Product management";
    NewLine.MethodDescription   = "Deletes a previously created product
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteProduct";
    NewLine.SearchMethod = "DELETEPRODUCT";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GroupProducts";
    NewLine.SearchMethod = "GROUPPRODUCTS";
    NewLine.Parameter    = "--items";
    NewLine.Description    = "Array of product IDs";
    NewLine.Region     = "Product management";
    NewLine.MethodDescription   = "Groups products based on similar sets of properties
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GroupProducts";
    NewLine.SearchMethod = "GROUPPRODUCTS";
    NewLine.Parameter    = "--sellgroup";
    NewLine.Description    = "ID of the existing group, if needed (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GroupProducts";
    NewLine.SearchMethod = "GROUPPRODUCTS";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetSelectionList";
    NewLine.SearchMethod = "GETSELECTIONLIST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";
    NewLine.MethodDescription   = "Gets the list of product selections
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetSelectionsByID";
    NewLine.SearchMethod = "GETSELECTIONSBYID";
    NewLine.Parameter    = "--sels";
    NewLine.Description    = "Selection IDs";
    NewLine.Region     = "Product selection management";
    NewLine.MethodDescription   = "Gets the list of selections by array of IDs
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetSelectionsByID";
    NewLine.SearchMethod = "GETSELECTIONSBYID";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateProductCollection";
    NewLine.SearchMethod = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Selection name";
    NewLine.Region     = "Product selection management";
    NewLine.MethodDescription   = "Creates an empty product selection
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateProductCollection";
    NewLine.SearchMethod = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "Image file";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateProductCollection";
    NewLine.SearchMethod = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter    = "--main";
    NewLine.Description    = "Main (optional, def. val. - False)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateProductCollection";
    NewLine.SearchMethod = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter    = "--hidden";
    NewLine.Description    = "Hidden (optional, def. val. - False)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateProductCollection";
    NewLine.SearchMethod = "CREATEPRODUCTCOLLECTION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductCollection";
    NewLine.SearchMethod = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New selection name";
    NewLine.Region     = "Product selection management";
    NewLine.MethodDescription   = "Edits the properties of a product selection
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductCollection";
    NewLine.SearchMethod = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter    = "--sel";
    NewLine.Description    = "Selection ID";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductCollection";
    NewLine.SearchMethod = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter    = "--picture";
    NewLine.Description    = "New selection image (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductCollection";
    NewLine.SearchMethod = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter    = "--main";
    NewLine.Description    = "Main (optional, def. val. - False)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductCollection";
    NewLine.SearchMethod = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter    = "--hidden";
    NewLine.Description    = "Hidden (optional, def. val. - False)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductCollection";
    NewLine.SearchMethod = "EDITPRODUCTCOLLECTION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProductToSelection";
    NewLine.SearchMethod = "ADDPRODUCTTOSELECTION";
    NewLine.Parameter    = "--items";
    NewLine.Description    = "Array of products or product";
    NewLine.Region     = "Product selection management";
    NewLine.MethodDescription   = "Adds a product to the selection
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProductToSelection";
    NewLine.SearchMethod = "ADDPRODUCTTOSELECTION";
    NewLine.Parameter    = "--sel";
    NewLine.Description    = "Selection ID";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProductToSelection";
    NewLine.SearchMethod = "ADDPRODUCTTOSELECTION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "RemoveProductFromSelection";
    NewLine.SearchMethod = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Parameter    = "--item";
    NewLine.Description    = "Product ID";
    NewLine.Region     = "Product selection management";
    NewLine.MethodDescription   = "Removes a previously added product from the selection
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "RemoveProductFromSelection";
    NewLine.SearchMethod = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Parameter    = "--sel";
    NewLine.Description    = "Selection ID";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "RemoveProductFromSelection";
    NewLine.SearchMethod = "REMOVEPRODUCTFROMSELECTION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteSelection";
    NewLine.SearchMethod = "DELETESELECTION";
    NewLine.Parameter    = "--sel";
    NewLine.Description    = "Selection ID";
    NewLine.Region     = "Product selection management";
    NewLine.MethodDescription   = "Deletes the selection by ID
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteSelection";
    NewLine.SearchMethod = "DELETESELECTION";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product selection management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetPropertyList";
    NewLine.SearchMethod = "GETPROPERTYLIST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product properties management";
    NewLine.MethodDescription   = "Gets the list of properties of group products
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateProductProperty";
    NewLine.SearchMethod = "CREATEPRODUCTPROPERTY";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "Property name";
    NewLine.Region     = "Product properties management";
    NewLine.MethodDescription   = "Creates a new property for use in products
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "CreateProductProperty";
    NewLine.SearchMethod = "CREATEPRODUCTPROPERTY";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductProperty";
    NewLine.SearchMethod = "EDITPRODUCTPROPERTY";
    NewLine.Parameter    = "--title";
    NewLine.Description    = "New name";
    NewLine.Region     = "Product properties management";
    NewLine.MethodDescription   = "Edits the existing product property
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductProperty";
    NewLine.SearchMethod = "EDITPRODUCTPROPERTY";
    NewLine.Parameter    = "--prop";
    NewLine.Description    = "Property ID";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductProperty";
    NewLine.SearchMethod = "EDITPRODUCTPROPERTY";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteProductProperty";
    NewLine.SearchMethod = "DELETEPRODUCTPROPERTY";
    NewLine.Parameter    = "--prop";
    NewLine.Description    = "Property ID";
    NewLine.Region     = "Product properties management";
    NewLine.MethodDescription   = "Deletes the existing product property
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteProductProperty";
    NewLine.SearchMethod = "DELETEPRODUCTPROPERTY";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProductPropertyVariant";
    NewLine.SearchMethod = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--value";
    NewLine.Description    = "Property value";
    NewLine.Region     = "Product properties management";
    NewLine.MethodDescription   = "Adds a variant for an existing property
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProductPropertyVariant";
    NewLine.SearchMethod = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--prop";
    NewLine.Description    = "Property ID where the variant is added";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "AddProductPropertyVariant";
    NewLine.SearchMethod = "ADDPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductPropertyVariant";
    NewLine.SearchMethod = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--value";
    NewLine.Description    = "New property value";
    NewLine.Region     = "Product properties management";
    NewLine.MethodDescription   = "Edits the value of an existing product property variant
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductPropertyVariant";
    NewLine.SearchMethod = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--prop";
    NewLine.Description    = "Property ID";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductPropertyVariant";
    NewLine.SearchMethod = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--option";
    NewLine.Description    = "Variant ID";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "EditProductPropertyVariant";
    NewLine.SearchMethod = "EDITPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteProductPropertyVariant";
    NewLine.SearchMethod = "DELETEPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--option";
    NewLine.Description    = "Variant ID";
    NewLine.Region     = "Product properties management";
    NewLine.MethodDescription   = "Deletes the previously created product property variant
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "DeleteProductPropertyVariant";
    NewLine.SearchMethod = "DELETEPRODUCTPROPERTYVARIANT";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Product properties management";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "GetOrderList";
    NewLine.SearchMethod = "GETORDERLIST";
    NewLine.Parameter    = "--auth";
    NewLine.Description    = "Authorization JSON or path to .json (optional, def. val. - Empty)";
    NewLine.Region     = "Order management";
    NewLine.MethodDescription   = "Returns the community's order list
    |
    |    The structure of the JSON authentication data (parameter --auth):
    |    {
    |     ""access_token"": """",
    |     ""owner_id""    : """",   
    |     ""app_id""      : """",  
    |     ""group_id""    : """"  
    |    }
    |";


    NewLine = TableСоwithтаinа.Add();
    NewLine.Library  = "vk";
    NewLine.Module      = "OPI_VK";
    NewLine.Method       = "FormKeyboard";
    NewLine.SearchMethod = "FORMKEYBOARD";
    NewLine.Parameter    = "--buttons";
    NewLine.Description    = "Array of button titles";
    NewLine.Region     = "Others";
    NewLine.MethodDescription   = "Forms a keyboard from an array of buttons";

    Return TableСоwithтаinа;
EndFunction

