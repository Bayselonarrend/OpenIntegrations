// OneScript: ./OInt/tools/Modules/OPI_TestDataRetrieval.os

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingHardcodePath-off
// BSLLS:Typo-off
// BSLLS:DeprecatedMessage-off
// BSLLS:UsingServiceTag-off
// BSLLS:ExecuteExternalCodeInCommonModule-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:MagicNumber-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:MethodSize-off
// BSLLS:IfElseIfEndsWithElse-off
// BSLLS:CognitiveComplexity-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:CommentedCode-off
// BSLLS:CyclomaticComplexity-off
// BSLLS:LineLength-off
// BSLLS:NestedStatements-off

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-method
//@skip-check missing-temporary-file-deletion
//@skip-check method-too-many-params
//@skip-check bsl-legacy-check-for-each-statetement-collection
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-expression-type

// Uncomment if OneScript is executed
// #Use "./internal"
// #Use asserts

#Region Internal

Function ExecuteTestCLI(Val Library, Val Method, Val Options, Val Record = True) Export

    If OPI_Tools.IsWindows() Then

        If OPI_Tools.IsOneScript() Then
            Oint = """C:\Program Files (x86)\OInt\bin\oint.bat""";
        Else
            Oint = """C:\Program Files\OneScript\bin\oint.bat""";
        EndIf;

    Else

        Oint = "oint";

    EndIf;

    ResultFile = GetTempFileName();

    LaunchString = Oint + " " + Library + " " + Method;
    AddOptions   = New Structure;
    WriteOptions = New Structure;

    For Each Option In Options Do

        If Option.Value = Undefined Or String(Option.Value) = "" Then
            Continue;
        EndIf;

        CurrentValue = GetCLIFormedValue(Option.Value, , AddOptions);

        LaunchString = LaunchString + " --" + Option.Key + " " + CurrentValue;

        WriteOptions.Insert(Option.Key, CurrentValue);

    EndDo;

    For Each AddOption In AddOptions Do

        CurrentValue = GetCLIFormedValue(AddOption.Value);

        LaunchString = LaunchString + " --" + AddOption.Key + " " + CurrentValue;

        WriteOptions.Insert(AddOption.Key, CurrentValue);

    EndDo;

    // BSLLS:ExternalAppStarting-off
    RunApp(LaunchString + " --out """ + ResultFile + """ --debug", , True);
    // BSLLS:ExternalAppStarting-on

    Result = ReadCLIResponse(ResultFile);

    If Record Then
        WriteCLICall(Library, Method, WriteOptions);
    EndIf;

    OPI_Tools.RemoveFileWithTry(ResultFile, "Failed to delete the temporary file after the test!!");

    Return Result;

EndFunction

Function GetTestingSectionMapping() Export

    Sections = New Structure;
    Sections.Insert("BuildCheck"     , 1);
    Sections.Insert("Telegram"       , 5);
    Sections.Insert("VK"             , 5);
    Sections.Insert("Viber"          , 5);
    Sections.Insert("Twitter"        , 4);
    Sections.Insert("FTP"            , 5);
    Sections.Insert("SSH"            , 5);
    Sections.Insert("SFTP"           , 5);
    Sections.Insert("PostgreSQL"     , 5);
    Sections.Insert("MySQL"          , 5);
    Sections.Insert("MSSQL"          , 5);
    Sections.Insert("SQLite"         , 5);
    Sections.Insert("MongoDB"        , 5);
    Sections.Insert("RCON"           , 5);
    Sections.Insert("YandexDisk"     , 5);
    Sections.Insert("GoogleWorkspace", 2);
    Sections.Insert("GoogleCalendar" , 5);
    Sections.Insert("GoogleDrive"    , 5);
    Sections.Insert("GoogleSheets"   , 5);
    Sections.Insert("Notion"         , 5);
    Sections.Insert("Slack"          , 5);
    Sections.Insert("Airtable"       , 5);
    Sections.Insert("Dropbox"        , 5);
    Sections.Insert("Bitrix24"       , 5);
    Sections.Insert("VkTeams"        , 5);
    Sections.Insert("Neocities"      , 5);
    Sections.Insert("CDEK"           , 5);
    Sections.Insert("YandexMetrika"  , 5);
    Sections.Insert("S3"             , 5);
    Sections.Insert("TCP"            , 5);
    Sections.Insert("GreenAPI"       , 5);
    Sections.Insert("GreenMax"       , 5);
    Sections.Insert("Ollama"         , 5);
    Sections.Insert("HTTPClient"     , 5);
    Sections.Insert("OpenAI"         , 5);
    Sections.Insert("ReportPortal"   , 5);
    Sections.Insert("GRPC"           , 5);

    Return Sections;

EndFunction

Function GetTestingSectionMappingGA() Export

    StandardDependencies = "[Decode, Build]";
    GoogleDependencies   = "Testing-GoogleWorkspace";

    Sections = New Structure;
    Sections.Insert("BuildCheck"     , StandardDependencies);
    Sections.Insert("Telegram"       , StandardDependencies);
    Sections.Insert("VK"             , StandardDependencies);
    Sections.Insert("Viber"          , StandardDependencies);
    Sections.Insert("Twitter"        , StandardDependencies);
    Sections.Insert("FTP"            , StandardDependencies);
    Sections.Insert("SSH"            , StandardDependencies);
    Sections.Insert("SFTP"           , StandardDependencies);
    Sections.Insert("PostgreSQL"     , StandardDependencies);
    Sections.Insert("MySQL"          , StandardDependencies);
    Sections.Insert("MSSQL"          , StandardDependencies);
    Sections.Insert("SQLite"         , StandardDependencies);
    Sections.Insert("MongoDB"        , StandardDependencies);
    Sections.Insert("RCON"           , StandardDependencies);
    Sections.Insert("YandexDisk"     , StandardDependencies);
    Sections.Insert("GoogleWorkspace", StandardDependencies);
    Sections.Insert("GoogleCalendar" , GoogleDependencies);
    Sections.Insert("GoogleDrive"    , GoogleDependencies);
    Sections.Insert("GoogleSheets"   , GoogleDependencies);
    Sections.Insert("Notion"         , StandardDependencies);
    Sections.Insert("Slack"          , StandardDependencies);
    Sections.Insert("Airtable"       , StandardDependencies);
    Sections.Insert("Dropbox"        , StandardDependencies);
    Sections.Insert("Bitrix24"       , StandardDependencies);
    Sections.Insert("VkTeams"        , StandardDependencies);
    Sections.Insert("Neocities"      , StandardDependencies);
    Sections.Insert("CDEK"           , StandardDependencies);
    Sections.Insert("YandexMetrika"  , StandardDependencies);
    Sections.Insert("S3"             , StandardDependencies);
    Sections.Insert("TCP"            , StandardDependencies);
    Sections.Insert("GreenAPI"       , StandardDependencies);
    Sections.Insert("GreenMax"       , StandardDependencies);
    Sections.Insert("Ollama"         , StandardDependencies);
    Sections.Insert("HTTPClient"     , StandardDependencies);
    Sections.Insert("OpenAI"         , StandardDependencies);
    Sections.Insert("ReportPortal"   , StandardDependencies);
    Sections.Insert("GRPC"           , StandardDependencies);

    Return Sections;

EndFunction

Function GetTestTable() Export

    Telegram  = "Telegram";
    VKontakte = "VK";
    YDisk     = "YandexDisk";
    Calendar  = "GoogleCalendar";
    Twitter   = "Twitter";
    Viber     = "Viber";
    Drive     = "GoogleDrive";
    VSpace    = "GoogleWorkspace";
    Notion    = "Notion";
    Slack     = "Slack";
    Tables    = "GoogleSheets";
    AirT      = "Airtable";
    Dropbox   = "Dropbox";
    Bitrix    = "Bitrix24";
    VKT       = "VkTeams";
    Neocities = "Neocities";
    Cdek      = "CDEK";
    Metrika   = "YandexMetrika";
    S3_       = "S3";
    TCP       = "TCP";
    SQLite    = "SQLite";
    Postgres  = "PostgreSQL";
    MongoDB   = "MongoDB";
    GreenAPI  = "GreenAPI";
    RCON      = "RCON";
    MySQL     = "MySQL";
    Ollama    = "Ollama";
    Http      = "HTTPClient";
    OpenAI    = "OpenAI";
    MSSQL     = "MSSQL";
    FTP       = "FTP";
    RPortal   = "ReportPortal";
    SSH       = "SSH";
    SFTP      = "SFTP";
    GreenMax  = "GreenMax";
    GRPC      = "GRPC";

    TestTable = New ValueTable;
    TestTable.Columns.Add("Method");
    TestTable.Columns.Add("Synonym");
    TestTable.Columns.Add("Section");

    NewTest(TestTable
        , "CheckIBToLastBuildCompliance"
        , "Check IB to last build compliance"
        , "BuildCheck");

    NewTest(TestTable, "TelegramAPI_GetBotInfo"              , "Get bot information"             , Telegram);
    NewTest(TestTable, "TelegramAPI_GetUpdates"              , "Get updates"                     , Telegram);
    NewTest(TestTable, "TelegramAPI_SetWebhook"              , "Set Webhook"                     , Telegram);
    NewTest(TestTable, "TelegramAPI_SendTextMessage"         , "Send text message"               , Telegram);
    NewTest(TestTable, "TelegramAPI_SendImage"               , "Send image"                      , Telegram);
    NewTest(TestTable, "TelegramAPI_SendVideo"               , "Send video"                      , Telegram);
    NewTest(TestTable, "TelegramAPI_SendAudio"               , "Send audio"                      , Telegram);
    NewTest(TestTable, "TelegramAPI_SendDocument"            , "Send document"                   , Telegram);
    NewTest(TestTable, "TelegramAPI_SendGIF"                 , "Send GIF"                        , Telegram);
    NewTest(TestTable, "TelegramAPI_SendMediaGroup"          , "Send mediagroup"                 , Telegram);
    NewTest(TestTable, "TelegramAPI_SendLocation"            , "Send location"                   , Telegram);
    NewTest(TestTable, "TelegramAPI_SendContact"             , "Send contact"                    , Telegram);
    NewTest(TestTable, "TelegramAPI_SendPoll"                , "Send poll"                       , Telegram);
    NewTest(TestTable, "TelegramAPI_ForwardMessage"          , "Forward message"                 , Telegram);
    NewTest(TestTable, "TelegramAPI_BanUnban"                , "Ban/Unban"                       , Telegram);
    NewTest(TestTable, "TelegramAPI_CreateInvitationLink"    , "Create invitation link"          , Telegram);
    NewTest(TestTable, "TelegramAPI_PinUnpinMessage"         , "Pin/Unpin message"               , Telegram);
    NewTest(TestTable, "TelegramAPI_GetMemberCount"          , "Get participant count"           , Telegram);
    NewTest(TestTable, "TelegramAPI_GetForumAvatarsList"     , "Get forum avatars list"          , Telegram);
    NewTest(TestTable, "TelegramAPI_CreateDeleteForumTopic"  , "Create/Delete forum topic"       , Telegram);
    NewTest(TestTable, "TelegramAPI_ChangeMainTopicName"     , "Change main topic name"          , Telegram);
    NewTest(TestTable, "TelegramAPI_HideShowMainTopic"       , "Hide/Show main topic"            , Telegram);
    NewTest(TestTable, "VKAPI_CreateTokenLink"               , "Create token retrieval link"     , VKontakte);
    NewTest(TestTable, "VKAPI_CreateDeletePost"              , "Create/Delete post"              , VKontakte);
    NewTest(TestTable, "VKAPI_CreateCompositePost"           , "Create/Delete composite post"    , VKontakte);
    NewTest(TestTable, "VKAPI_CreatePoll"                    , "Create poll"                     , VKontakte);
    NewTest(TestTable, "VKAPI_SaveDeleteImage"               , "Add/Delete image"                , VKontakte);
    NewTest(TestTable, "VKAPI_CreateStory"                   , "Create story"                    , VKontakte);
    NewTest(TestTable, "VKAPI_DiscussionMethods"             , "Actions with discussions"        , VKontakte);
    NewTest(TestTable, "VKAPI_LikeRepostComment"             , "Like/Repost/Comment"             , VKontakte);
    NewTest(TestTable, "VKAPI_GetStatistics"                 , "Get statistics"                  , VKontakte);
    NewTest(TestTable, "VKAPI_GetPostStatistics"             , "Get post statistics"             , VKontakte);
    NewTest(TestTable, "VKAPI_CreateAdCampaign"              , "Create advertising campaign"     , VKontakte);
    NewTest(TestTable, "VKAPI_SendMessage"                   , "Send message"                    , VKontakte);
    NewTest(TestTable, "VKAPI_GetProductCategories"          , "Get product categories"          , VKontakte);
    NewTest(TestTable, "VKAPI_CreateProductSelection"        , "Create product and selection"    , VKontakte);
    NewTest(TestTable, "VKAPI_CreateProductWithProperties"   , "Create product with properties"  , VKontakte);
    NewTest(TestTable, "VKAPI_GetProductList"                , "Get product list"                , VKontakte);
    NewTest(TestTable, "VKAPI_GetSelectionList"              , "Get selection list"              , VKontakte);
    NewTest(TestTable, "VKAPI_GetPropertyList"               , "Get property list"               , VKontakte);
    NewTest(TestTable, "VKAPI_GetOrderList"                  , "Get order list"                  , VKontakte);
    NewTest(TestTable, "VKAPI_UploadVideo"                   , "Upload video"                    , VKontakte);
    NewTest(TestTable, "YDisk_Authorization"                 , "Authorization"                   , YDisk);
    NewTest(TestTable, "YDisk_GetDiskInfo"                   , "Get disk information"            , YDisk);
    NewTest(TestTable, "YDisk_CreateFolder"                  , "Create folder"                   , YDisk);
    NewTest(TestTable, "YDisk_UploadByUrlAndGetObject"       , "Upload by URL and get"           , YDisk);
    NewTest(TestTable, "YDisk_UploadDeleteFile"              , "Upload/Delete file"              , YDisk);
    NewTest(TestTable, "YDisk_CreateObjectCopy"              , "Create object copy"              , YDisk);
    NewTest(TestTable, "YDisk_GetDownloadLink"               , "Get download link"               , YDisk);
    NewTest(TestTable, "YDisk_GetFileList"                   , "Get list of files"               , YDisk);
    NewTest(TestTable, "YDisk_MoveObject"                    , "Move object"                     , YDisk);
    NewTest(TestTable, "YDisk_PublicObjectActions"           , "Actions with public objects"     , YDisk);
    NewTest(TestTable, "YDisk_GetPublishedList"              , "Get published list"              , YDisk);
    NewTest(TestTable, "GW_Auth"                             , "Authorization"                   , VSpace);
    NewTest(TestTable, "GC_Authorization"                    , "Authorization"                   , Calendar);
    NewTest(TestTable, "GC_GetCalendarList"                  , "Get list of calendars"           , Calendar);
    NewTest(TestTable, "GC_CreateDeleteCalendar"             , "Create/Delete calendar"          , Calendar);
    NewTest(TestTable, "GC_CreateDeleteEvent"                , "Create/Delete event"             , Calendar);
    NewTest(TestTable, "GD_Authorization"                    , "Authorization"                   , Drive);
    NewTest(TestTable, "GD_GetCatalogList"                   , "Get list of directories"         , Drive);
    NewTest(TestTable, "GD_UploadDeleteFile"                 , "Upload/Delete file"              , Drive);
    NewTest(TestTable, "GD_CreateDeleteComment"              , "Create/Delete Comment"           , Drive);
    NewTest(TestTable, "GD_CreateCatalog"                    , "Create/Delete catalog"           , Drive);
    NewTest(TestTable, "GT_Authorization"                    , "Authorization"                   , Tables);
    NewTest(TestTable, "GT_CreateTable"                      , "Create table"                    , Tables);
    NewTest(TestTable, "GT_FillClearCells"                   , "Fill/Clear cells"                , Tables);
    NewTest(TestTable, "TwitterAPI_AccountData"              , "Account data"                    , Twitter);
    NewTest(TestTable, "TwitterAPI_Tweets"                   , "Tweets creation"                 , Twitter);
    NewTest(TestTable, "Viber_DataRetrieval"                 , "Data retrieval"                  , Viber);
    NewTest(TestTable, "Viber_MessagesSending"               , "Messages sending"                , Viber);
    NewTest(TestTable, "NotionAPI_CreatePage"                , "Create page"                     , Notion);
    NewTest(TestTable, "NotionAPI_CreateUpdateBase"          , "Create/Edit database"            , Notion);
    NewTest(TestTable, "NotionAPI_CreateDeleteBlock"         , "Create/Delete block"             , Notion);
    NewTest(TestTable, "NotionAPI_GetUsers"                  , "Get users"                       , Notion);
    NewTest(TestTable, "SlackGetData"                        , "Get data"                        , Slack);
    NewTest(TestTable, "Slack_SendDeleteMessage"             , "Send/Delete message"             , Slack);
    NewTest(TestTable, "Slack_CreateArchiveChannel"          , "Create/Archive channel"          , Slack);
    NewTest(TestTable, "Slack_OpenCloseDialog"               , "Open/Close dialog"               , Slack);
    NewTest(TestTable, "Slack_UploadDeleteFile"              , "Upload/Delete file"              , Slack);
    NewTest(TestTable, "Slack_UploadDeleteExternalFile"      , "Upload/Delete external file"     , Slack);
    NewTest(TestTable, "AT_CreateDatabase"                   , "Create/Edit database"            , AirT);
    NewTest(TestTable, "AT_CreateTable"                      , "Create/Edit table"               , AirT);
    NewTest(TestTable, "AT_CreateField"                      , "Create/Edit field"               , AirT);
    NewTest(TestTable, "AT_CreateDeleteRecords"              , "Create/Delete records"           , AirT);
    NewTest(TestTable, "DropboxAPI_GetUpdateToken"           , "Get/Update token"                , Dropbox);
    NewTest(TestTable, "DropboxAPI_UploadFile"               , "Upload file"                     , Dropbox);
    NewTest(TestTable, "DropboxAPI_UploadFileByURL"          , "Upload file by URL"              , Dropbox);
    NewTest(TestTable, "DropboxAPI_CreateFolder"             , "Create folder"                   , Dropbox);
    NewTest(TestTable, "DropboxAPI_CreateDeleteTag"          , "Create/Delete tag"               , Dropbox);
    NewTest(TestTable, "DropboxAPI_GetAccount"               , "Get account data"                , Dropbox);
    NewTest(TestTable, "DropboxAPI_AccessManagement"         , "Access management"               , Dropbox);
    NewTest(TestTable, "DropboxAPI_GetFolderFileList"        , "Get list of folder files"        , Dropbox);
    NewTest(TestTable, "B24_TokenManagement"                 , "Token management"                , Bitrix);
    NewTest(TestTable, "B24_ServerTime"                      , "Server time"                     , Bitrix);
    NewTest(TestTable, "B24_PostsManagement"                 , "Posts management"                , Bitrix);
    NewTest(TestTable, "B24_TaskManagement"                  , "Tasks management"                , Bitrix);
    NewTest(TestTable, "B24_CommentsManagement"              , "Comments management"             , Bitrix);
    NewTest(TestTable, "B24_WorkingWithDrive"                , "Working with drive"              , Bitrix);
    NewTest(TestTable, "B24_Kanban"                          , "Kanban"                          , Bitrix);
    NewTest(TestTable, "B24_Timekeeping"                     , "Timekeeping"                     , Bitrix);
    NewTest(TestTable, "B24_ChatManagement"                  , "Chats works"                     , Bitrix);
    NewTest(TestTable, "B24_NotificationsManagement"         , "Notifications management"        , Bitrix);
    NewTest(TestTable, "B24_TasksFieldsManagement"           , "Working with custom task fields" , Bitrix);
    NewTest(TestTable, "B24_DepartmentsManagement"           , "Departments management"          , Bitrix);
    NewTest(TestTable, "B2_UsersManagement"                  , "Users management"                , Bitrix);
    NewTest(TestTable, "B24_LeadsManagement"                 , "Leads management"                , Bitrix);
    NewTest(TestTable, "B24_DealsManagement"                 , "Deals management"                , Bitrix);
    NewTest(TestTable, "B24_CalendarsManagement"             , "Calendars management"            , Bitrix);
    NewTest(TestTable, "VKT_MessagesSending"                 , "Messages sending"                , VKT);
    NewTest(TestTable, "VKT_CommonMethods"                   , "Common methods"                  , VKT);
    NewTest(TestTable, "VKT_ChatManagement"                  , "Chat management"                 , VKT);
    NewTest(TestTable, "NC_FilesManagement"                  , "Files management"                , Neocities);
    NewTest(TestTable, "NC_DataRetrieving"                   , "Data retrieving"                 , Neocities);
    NewTest(TestTable, "CdekAPI_CommonMethods"               , "Common methods"                  , Cdek);
    NewTest(TestTable, "CDEKAPI_OrdersManagement"            , "Orders management"               , Cdek);
    NewTest(TestTable, "CdekAPI_CourierInvitationsManagement", "Courier invitations management"  , Cdek);
    NewTest(TestTable, "YaMetrika_TagsManagement"            , "Tags management"                 , Metrika);
    NewTest(TestTable, "YaMetrika_CountersManagement"        , "Counters management"             , Metrika);
    NewTest(TestTable, "YaMetrika_ActionsManagement"         , "Actions management"              , Metrika);
    NewTest(TestTable, "AWS_CommonMethods"                   , "Common methods"                  , S3_);
    NewTest(TestTable, "AWS_BucketsManagement"               , "Buckets management"              , S3_);
    NewTest(TestTable, "AWS_ObjectsManagement"               , "Objects management"              , S3_);
    NewTest(TestTable, "TC_Client"                           , "TCP Client"                      , TCP);
    NewTest(TestTable, "SQLL_CommonMethods"                  , "Common methods"                  , SQLite);
    NewTest(TestTable, "SQLL_ORM"                            , "ORM"                             , SQLite);
    NewTest(TestTable, "Postgres_CommonMethods"              , "Common methods"                  , Postgres);
    NewTest(TestTable, "Postgres_ORM"                        , "ORM"                             , Postgres);
    NewTest(TestTable, "MYS_CommonMethods"                   , "Common methods"                  , MySQL);
    NewTest(TestTable, "MYS_ORM"                             , "ORM"                             , MySQL);
    NewTest(TestTable, "MSS_CommonMethods"                   , "Common methods"                  , MSSQL);
    NewTest(TestTable, "MSS_ORM"                             , "ORM"                             , MSSQL);
    NewTest(TestTable, "Mongo_CommonMethods"                 , "Common methods"                  , MongoDB);
    NewTest(TestTable, "Mong_DatabaseManagement"             , "Database management"             , MongoDB);
    NewTest(TestTable, "Mongo_CollectionManagement"          , "Collections management"          , MongoDB);
    NewTest(TestTable, "Mongo_DocumentsManagement"           , "DocumentsManagement"             , MongoDB);
    NewTest(TestTable, "Mongo_UserManagement"                , "Users management"                , MongoDB);
    NewTest(TestTable, "Mongo_RoleManagement"                , "Role management"                 , MongoDB);
    NewTest(TestTable, "GAPI_GroupManagement"                , "Group management"                , GreenAPI);
    NewTest(TestTable, "GAPI_MessageSending"                 , "Messages sending"                , GreenAPI);
    NewTest(TestTable, "GAPI_NotificationsReceiving"         , "Notifications receiving"         , GreenAPI);
    NewTest(TestTable, "GAPI_MessageQueue"                   , "Message queue"                   , GreenAPI);
    NewTest(TestTable, "GAPI_MessageLogs"                    , "Message logs"                    , GreenAPI);
    NewTest(TestTable, "GAPI_Account"                        , "Account"                         , GreenAPI);
    NewTest(TestTable, "GMax_GroupManagement"                , "Group management"                , GreenMax);
    NewTest(TestTable, "GMax_MessageSending"                 , "Messages sending"                , GreenMax);
    NewTest(TestTable, "GMax_Notifications"                  , "Notifications"                   , GreenMax);
    NewTest(TestTable, "GMax_MessageHistory"                 , "Message history"                 , GreenMax);
    NewTest(TestTable, "GMax_Queues"                         , "Queues"                          , GreenMax);
    NewTest(TestTable, "GMax_Account"                        , "Account"                         , GreenMax);
    NewTest(TestTable, "RC_CommandsExecution"                , "Commands execution"              , RCON);
    NewTest(TestTable, "OLLM_RequestsProcessing"             , "Requests processing"             , Ollama);
    NewTest(TestTable, "OLLM_ModelsManagement"               , "Models management"               , Ollama);
    NewTest(TestTable, "OLLM_WorkingWithBlob"                , "Working with Blob"               , Ollama);
    NewTest(TestTable, "HTTP_Initialization"                 , "Initialization"                  , Http);
    NewTest(TestTable, "HTTP_BodySet"                        , "Body set"                        , Http);
    NewTest(TestTable, "HTTP_Settings"                       , "Settings"                        , Http);
    NewTest(TestTable, "HTTP_HeadersSetting"                 , "Headers setting"                 , Http);
    NewTest(TestTable, "HTTP_Authorization"                  , "Authorization"                   , Http);
    NewTest(TestTable, "HTTP_RequestProcessing"              , "Request processing"              , Http);
    NewTest(TestTable, "HTTP_ResponseReceiving"              , "Response receiving"              , Http);
    NewTest(TestTable, "OAI_RequestsProcessing"              , "Requests processing"             , OpenAI);
    NewTest(TestTable, "OAI_Assistants"                      , "Assistants"                      , OpenAI);
    NewTest(TestTable, "OAI_FileManagement"                  , "Files management"                , OpenAI);
    NewTest(TestTable, "OAI_AudioProcessing"                 , "Audio processing"                , OpenAI);
    NewTest(TestTable, "OAI_ModelsManagement"                , "Models management"               , OpenAI);
    NewTest(TestTable, "FT_DirecotryManagement"              , "Directory management"            , FTP);
    NewTest(TestTable, "FT_FileOperations"                   , "Files management"                , FTP);
    NewTest(TestTable, "FT_CommonMethods"                    , "Common methods"                  , FTP);
    NewTest(TestTable, "RPortal_Authorization"               , "Authorization"                   , RPortal);
    NewTest(TestTable, "SShell_CommonMethods"                , "Common methods"                  , SSH);
    NewTest(TestTable, "SF_CommonMethods"                    , "Common methods"                  , SFTP);
    NewTest(TestTable, "SF_DirectoryManagement"              , "Directory management"            , SFTP);
    NewTest(TestTable, "SF_FileManagement"                   , "Files management"                , SFTP);
    NewTest(TestTable, "GR_CommonMethods"                    , "Common methods"                  , GRPC);
    NewTest(TestTable, "GR_Introspection"                    , "Introspection"                   , GRPC);
    NewTest(TestTable, "GR_Streaming"                        , "Streaming"                       , GRPC);

    Return TestTable;

EndFunction

Function ExpectsThat(Value) Export

    Try

        Module  = GetCommonModule("ЮТест");
        Ожидаем = TypeOf(Module) = Type("CommonModule");
        Return Module.ОжидаетЧто(Value);

    Except
        Return Ожидаем.Что(Value);
    EndTry;

EndFunction

Function FormYAXTests() Export

    Module    = GetCommonModule("ЮТТесты");
    Sections  = GetTestingSectionMapping();
    TestTable = GetTestTable();

    For Each Section In Sections Do

        CurrentSection = Section.Key;
        Filter         = New Structure("Section", CurrentSection);
        SectionTests   = TestTable.FindRows(Filter);

        Set = Module.ДобавитьТестовыйНабор(CurrentSection);

        For Each Test In SectionTests Do
            Set.ДобавитьСерверныйТест(Test.Method, Test.Synonym);
        EndDo;

    EndDo;

    Return "";

EndFunction

Function FormAssertsTests() Export

    TestTable    = GetTestTable();
    ArrayOfTests = New Array;

    For Each Test In TestTable Do
        ArrayOfTests.Add(Test.Method);
    EndDo;

    Return ArrayOfTests;

EndFunction

Function FormYAXTestsCLI() Export

    Module    = GetCommonModule("ЮТТесты");
    Sections  = GetTestingSectionMapping();
    TestTable = GetTestTable();

    For Each Section In Sections Do

        CurrentSection = Section.Key;

        If CurrentSection = "HTTP" Then
            Continue;
        EndIf;

        Filter       = New Structure("Section", CurrentSection);
        SectionTests = TestTable.FindRows(Filter);

        Set = Module.ДобавитьТестовыйНабор(CurrentSection + " (CLI)");

        For Each Test In SectionTests Do
            Set.ДобавитьСерверныйТест(Test.Method, Test.Synonym);
        EndDo;

    EndDo;

    Return "";

EndFunction

Function FormAssertsTestsCLI() Export

    ArrayOfTests = New Array;

    Sections  = GetTestingSectionMapping();
    TestTable = GetTestTable();

    For Each Section In Sections Do

        CurrentSection = Section.Key;

        If CurrentSection = "HTTP" Then
            Continue;
        EndIf;

        Filter       = New Structure("Section", CurrentSection);
        SectionTests = TestTable.FindRows(Filter);

        For Each Test In SectionTests Do
            ArrayOfTests.Add(Test.Method);
        EndDo;

    EndDo;

    Return ArrayOfTests;

EndFunction

Function GetParameter(Parameter) Export

    Path = DataFilePath();
    Return GetValueFromFile(Parameter, Path);

EndFunction

Function GetBinary(Parameter) Export

    Path  = DataFilePath();
    Value = GetValueFromFile(Parameter, Path);

    If TypeOf(Value) = Type("String") Then

        Value = GetFilePath(Value);

    EndIf;

    Return Value;

EndFunction

Function GetFilePath(Val Path) Export

    If StrFind(Path, "http") > 0 Or StrFind(Path, "www") > 0 Then

        TFN    = GetTempFileName();
        FileCopy(Path, TFN);
        Path   = TFN;
        Binary = New BinaryData(Path);

        OPI_Tools.RemoveFileWithTry(TFN, "Failed to delete the temporary file after the test!!");

    Else

        Binary = New BinaryData(Path);

    EndIf;

    Return Binary;

EndFunction

Function GetLocalhost() Export

    If OPI_Tools.IsWindows() Then
        Result = "127.0.0.1";
    Else
        Result = "host.docker.internal";
    EndIf;

    Return Result;

EndFunction

Function IsCLITest() Export

    // !OInt Data = GetEnvironmentVariable("OINT_TESTS_CLI");
    Data = Constants.IsCLITests.Get(); // !OPI

    If String(Data) = "1" Then
        Result      = True;
    Else
        Result      = False;
    EndIf;

    Return Result;

EndFunction

Procedure ParameterToCollection(Parameter, Collection) Export

    Value = GetParameter(Parameter);
    Collection.Insert(Parameter, Value);

EndProcedure

Procedure BinaryToCollection(Parameter, Collection) Export

    Value = GetBinary(Parameter);
    Collection.Insert(Parameter, Value);

EndProcedure

Procedure WriteParameter(Parameter, Value) Export

    Path = DataFilePath();
    WriteParameterToFile(Parameter, Value, Path);

EndProcedure

Procedure ProcessTestingResult(Val Result, Val Method, Val Library, Val Option = "",
    AddParam1                                                                  = Undefined, AddParam2 = Undefined, AddParam3 = Undefined) Export

    // BSLLS:UnusedLocalVariable-off
    //
    //@skip-check module-unused-local-variable
    Result_ = ?(OPI_Tools.ThisIsCollection(Result), OPI_Tools.CopyCollection(Result), Result);

    // BSLLS:UnusedLocalVariable-on

    IsVariant  = ValueIsFilled(Option);
    LogsMethod = ?(IsVariant, StrTemplate("%1 (%2)", Method, Option), Method);

    SetID     = CreateLaunchSet(Library);
    ElementID = CreateTestElement(SetID, Library, Method, Option);

    Try

        ParameterArray = New Array;
        ParameterArray.Add("Result_");
        ParameterArray.Add("Option");

        If AddParam1 <> Undefined Then
            ParameterArray.Add("AddParam1");
        EndIf;

        If AddParam2 <> Undefined Then
            ParameterArray.Add("AddParam2");
        EndIf;

        If AddParam3 <> Undefined Then
            ParameterArray.Add("AddParam3");
        EndIf;

        CheckTemplate = "CheckResult = Check_%1_%2(%3)";

        CheckCall   = StrTemplate(CheckTemplate, Library, Method, StrConcat(ParameterArray, ", "));
        CheckResult = Undefined;

        //@skip-check server-execution-safe-mode
        Execute(CheckCall);

        Text = PrintLog(Result, LogsMethod, Library);

        If Not ValueIsFilled(Option) Then

            ResultString = TypeOf(CheckResult) = Type("String");
            Overwrite    = Not ?(ResultString, CheckResult = "", CheckResult = Undefined);

            If Overwrite Then
                WriteLogFile(CheckResult, Method, Library);
            Else
                WriteLogFile(Result     , Method, Library, False);
            EndIf;

        EndIf;

        WriteTestLog(ElementID, Text, "info");
        FinishTestElement(ElementID, "passed");

    Except

        ErrInfo = DetailErrorDescription(ErrorInfo());
        Text    = PrintLog(Result, LogsMethod, Library, ErrInfo);

        WriteTestLog(ElementID, Text, "error");
        FinishTestElement(ElementID, "failed");

        Raise ErrInfo;

    EndTry;

EndProcedure

Procedure LogServiceInformation(Val Text, Val Note, Val Library) Export

    TextTemplate = "
                   |--!!!---------%1----------!!!--
                   |
                   |%2
                   |
                   |%3
                   |
                   |---------------------------------";

    Message(StrTemplate(TextTemplate, Library, Note, Text));

EndProcedure

#Region ReportPortal

Function CreateReportPortalLaunch(Val Platform = "") Export

    Token   = GetParameter("RPortal_Token");
    Project = GetParameter("RPortal_MainProject");
    URL     = GetParameter("RPortal_URL");

    FinishLaunch();

    CurrentDate = GetLaunchTime();
    SystemInfo  = New SystemInfo;

    OperatingSystem = String(SystemInfo.PlatformType);
    CurrentDateString = Format(CurrentDate, "DF=yyyy-MM-dd");
    UUID            = String(New UUID);
    OPIVersion      = OPI_Tools.OPIVersion();

    If Not ValueIsFilled(Platform) Then
        Platform = ?(OPI_Tools.IsOneScript(), "OneScript", "1C:Enterprise");
    EndIf;

    LaunchName = StrTemplate("%1 | %2 | %3 | %4", CurrentDateString, OPIVersion, Platform, OperatingSystem);

    LaunchStructure = New Structure;

    LaunchStructure.Insert("name"     , LaunchName);
    LaunchStructure.Insert("startTime", CurrentDate);
    LaunchStructure.Insert("uuid"     , UUID);

    WriteParameter("RPortal_MainLaunch", UUID);

    Result = ReportPortal().CreateLaunch(URL, Token, Project, LaunchStructure);
    UID    = Result["id"];

    CreateLaunchFile(UID);

    Message(OPI_Tools.JSONString(Result));

    Return UID;

EndFunction

Function CreateLaunchSet(Val Name) Export

    Data = GetExistingLaunch();

    If Data = Undefined Then
        Return Undefined;
    EndIf;

    ExistingSets = Data["suites"];
    Existing     = ExistingSets.Get(Name);

    If Existing <> Undefined Then
        Return Existing;
    EndIf;

    Token   = GetParameter("RPortal_Token");
    Project = GetParameter("RPortal_MainProject");
    URL     = GetParameter("RPortal_URL");

    CurrentDate = GetLaunchTime();
    LastSet     = Data["last_suite"];

    If ValueIsFilled(LastSet) Then

        FinishStructure = New Structure("endTime,launchUuid", CurrentDate, LastSet);
        ReportPortal().FinishItem(URL, Token, Project, LastSet, FinishStructure);

    EndIf;

    UUID = String(New UUID);

    ElementStructure = New Structure;
    ElementStructure.Insert("name"      , Name);
    ElementStructure.Insert("startTime" , CurrentDate);
    ElementStructure.Insert("type"      , "suite");
    ElementStructure.Insert("launchUuid", Data["id"]);
    ElementStructure.Insert("uuid"      , UUID);

    ReportPortal().CreateItem(URL, Token, Project, ElementStructure);

    ExistingSets.Insert(Name, UUID);

    Data.Insert("suites"    , ExistingSets);
    Data.Insert("last_suite", UUID);

    WriteLaunchFile(Data);

    Return UUID;

EndFunction

Function CreateTestElement(Val Set, Val Library, Val Method, Val Option) Export

    Data = GetExistingLaunch();

    If Data = Undefined Then
        Return Undefined;
    EndIf;

    UUID        = String(New UUID);
    CurrentDate = GetLaunchTime();

    If ValueIsFilled(Option) Then
        Title      = StrTemplate("%1 (%2)", Method, Option);
        Identifier = StrTemplate("%1_%2_%3", Library, Method, Option);
    Else
        Title      = Method;
        Identifier = StrTemplate("%1_%2"   , Library, Method);
    EndIf;

    Token   = GetParameter("RPortal_Token");
    Project = GetParameter("RPortal_MainProject");
    URL     = GetParameter("RPortal_URL");

    ElementStructure = New Structure;

    ElementStructure.Insert("name"      , Title);
    ElementStructure.Insert("startTime" , CurrentDate);
    ElementStructure.Insert("uuid"      , UUID);
    ElementStructure.Insert("type"      , "step");
    ElementStructure.Insert("launchUuid", Data["id"]);

    ReportPortal().CreateItem(URL, Token, Project, ElementStructure, Set);

    Data["items"].Insert(UUID, Identifier);

    WriteLaunchFile(Data);

    Return UUID;

EndFunction

Procedure FinishLaunch() Export

    Token   = GetParameter("RPortal_Token");
    Project = GetParameter("RPortal_MainProject");
    URL     = GetParameter("RPortal_URL");

    CurrentDate = GetLaunchTime();

    ExistingLaunch = GetExistingLaunch();

    If ValueIsFilled(ExistingLaunch) Then

        LastSet = ExistingLaunch["last_suite"];

        If ValueIsFilled(LastSet) Then

            FinishStructure = New Structure("endTime,launchUuid", CurrentDate, LastSet);
            ReportPortal().FinishItem(URL, Token, Project, LastSet, FinishStructure);

        EndIf;

        AllTests      = GetFullTestList();
        ExecutedTests = New ValueList;
        ExecutedTests.LoadValues(GetExecutedTestsList());

        If ExecutedTests.Count() / AllTests.Count() > 0.8 Then

            For Each Test In AllTests Do

                If ValueIsFilled(Test["variant"]) Then
                    TestFunctionName = StrTemplate("%1_%2_%3", Test["lib"], Test["name"], Test["variant"]);
                Else
                    TestFunctionName = StrTemplate("%1_%2"   , Test["lib"], Test["name"]);
                EndIf;

                If ExecutedTests.FindByValue(TestFunctionName) = Undefined Then
                    WriteMissingTest(Test["lib"], Test["name"], Test["variant"]);
                EndIf;

            EndDo;

        EndIf;

        FinishStructure = ReportPortal().GetLaunchCompletionStructure(CurrentDate);
        ReportPortal().FinishLaunch(URL, Token, Project, ExistingLaunch["id"], FinishStructure);

        ExistingLaunch["ended"] = True;
        WriteLaunchFile(ExistingLaunch);

    EndIf;

EndProcedure

Function GetExecutedTestsList() Export

    Tests          = ReadLaunchFile()["tests"];
    Return ?(Tests = Undefined, New Array, Tests);

EndFunction

Function GetFullTestList() Export

    Lang = OPI_Tools.OPILanguage();

    Tests = StrTemplate(
        "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/refs/heads/main/service/tests_%1.json", Lang);

    OPI_TypeConversion.GetCollection(Tests);

    If Tests.Count() = 1 Or Not OPI_Tools.ThisIsCollection(Tests[0], True) Then
        Return New Array;
    Else
        Return Tests;
    EndIf;

EndFunction

#EndRegion

#Region Parameterization

Function GetFTPParameterOptions() Export

    OptionArray = New Array;

    TestParametersMain = New Structure;
    ParameterToCollection("FTP_IP"        , TestParametersMain);
    ParameterToCollection("FTP_Port"      , TestParametersMain);
    ParameterToCollection("FTPS_IP"       , TestParametersMain);
    ParameterToCollection("FTPS_Port"     , TestParametersMain);
    ParameterToCollection("FTP_User"      , TestParametersMain);
    ParameterToCollection("FTP_Password"  , TestParametersMain);
    ParameterToCollection("Proxy_User"    , TestParametersMain);
    ParameterToCollection("Proxy_Password", TestParametersMain);
    ParameterToCollection("Socks5_IP"     , TestParametersMain);
    ParameterToCollection("Socks5_Port"   , TestParametersMain);
    ParameterToCollection("Proxy_IP"      , TestParametersMain);
    ParameterToCollection("Proxy_Port"    , TestParametersMain);
    ParameterToCollection("Picture"       , TestParametersMain);
    ParameterToCollection("Big"           , TestParametersMain);

    Localhost = GetLocalhost();

    Socks5IP                        = TestParametersMain["Socks5_IP"];
    TestParametersMain["Socks5_IP"] = ?(Socks5IP = "127.0.0.1", Localhost, Socks5IP);

    HttpProxyIP                    = TestParametersMain["Proxy_IP"];
    TestParametersMain["Proxy_IP"] = ?(HttpProxyIP = "127.0.0.1", Localhost, HttpProxyIP);

    // FTP
    ParametersStructure = New Structure;
    ParametersStructure.Insert("Postfix", "FTP");
    ParametersStructure.Insert("FTP_IP", Localhost);
    ParametersStructure.Insert("FTP_Port", TestParametersMain["FTP_Port"]);
    ParametersStructure.Insert("FTP_User", TestParametersMain["FTP_User"]);
    ParametersStructure.Insert("FTP_Password", TestParametersMain["FTP_Password"]);
    ParametersStructure.Insert("Proxy_User", TestParametersMain["Proxy_User"]);
    ParametersStructure.Insert("Proxy_Password", TestParametersMain["Proxy_Password"]);
    ParametersStructure.Insert("Proxy_IP", TestParametersMain["Socks5_IP"]);
    ParametersStructure.Insert("Proxy_Port", TestParametersMain["Socks5_Port"]);
    ParametersStructure.Insert("Proxy_Type", "socks5");
    ParametersStructure.Insert("Proxy", False);
    ParametersStructure.Insert("TLS", False);
    ParametersStructure.Insert("Picture", TestParametersMain["Picture"]);
    ParametersStructure.Insert("Big", TestParametersMain["Big"]);
    OptionArray.Add(ParametersStructure);

    // FTPS
    ParametersStructure = New Structure;
    ParametersStructure.Insert("Postfix", "FTPS");
    ParametersStructure.Insert("FTP_IP", Localhost);
    ParametersStructure.Insert("FTP_Port", TestParametersMain["FTPS_Port"]);
    ParametersStructure.Insert("FTP_User", TestParametersMain["FTP_User"]);
    ParametersStructure.Insert("FTP_Password", TestParametersMain["FTP_Password"]);
    ParametersStructure.Insert("Proxy_User", TestParametersMain["Proxy_User"]);
    ParametersStructure.Insert("Proxy_Password", TestParametersMain["Proxy_Password"]);
    ParametersStructure.Insert("Proxy_IP", TestParametersMain["Socks5_IP"]);
    ParametersStructure.Insert("Proxy_Port", TestParametersMain["Socks5_Port"]);
    ParametersStructure.Insert("Proxy_Type", "socks5");
    ParametersStructure.Insert("Proxy", False);
    ParametersStructure.Insert("TLS", True);
    ParametersStructure.Insert("Picture", TestParametersMain["Picture"]);
    ParametersStructure.Insert("Big", TestParametersMain["Big"]);
    OptionArray.Add(ParametersStructure);

    // FTP + Socks5
    ParametersStructure = New Structure;
    ParametersStructure.Insert("Postfix", "FTP, Socks5");
    ParametersStructure.Insert("FTP_IP", TestParametersMain["FTP_IP"]);
    ParametersStructure.Insert("FTP_Port", TestParametersMain["FTP_Port"]);
    ParametersStructure.Insert("FTP_User", TestParametersMain["FTP_User"]);
    ParametersStructure.Insert("FTP_Password", TestParametersMain["FTP_Password"]);
    ParametersStructure.Insert("Proxy_User", TestParametersMain["Proxy_User"]);
    ParametersStructure.Insert("Proxy_Password", TestParametersMain["Proxy_Password"]);
    ParametersStructure.Insert("Proxy_IP", TestParametersMain["Socks5_IP"]);
    ParametersStructure.Insert("Proxy_Port", TestParametersMain["Socks5_Port"]);
    ParametersStructure.Insert("Proxy_Type", "socks5");
    ParametersStructure.Insert("Proxy", True);
    ParametersStructure.Insert("TLS", False);
    ParametersStructure.Insert("Picture", TestParametersMain["Picture"]);
    ParametersStructure.Insert("Big", TestParametersMain["Big"]);
    OptionArray.Add(ParametersStructure);

    // FTPS + Socks5
    ParametersStructure = New Structure;
    ParametersStructure.Insert("Postfix", ?(OPI_Tools.IsWindows(), "FTPS, Socks5", ""));
    ParametersStructure.Insert("FTP_IP", TestParametersMain["FTPS_IP"]);
    ParametersStructure.Insert("FTP_Port", TestParametersMain["FTP_Port"]);
    ParametersStructure.Insert("FTP_User", TestParametersMain["FTP_User"]);
    ParametersStructure.Insert("FTP_Password", TestParametersMain["FTP_Password"]);
    ParametersStructure.Insert("Proxy_User", TestParametersMain["Proxy_User"]);
    ParametersStructure.Insert("Proxy_Password", TestParametersMain["Proxy_Password"]);
    ParametersStructure.Insert("Proxy_IP", TestParametersMain["Socks5_IP"]);
    ParametersStructure.Insert("Proxy_Port", TestParametersMain["Socks5_Port"]);
    ParametersStructure.Insert("Proxy_Type", "socks5");
    ParametersStructure.Insert("Proxy", True);
    ParametersStructure.Insert("TLS", True);
    ParametersStructure.Insert("Picture", TestParametersMain["Picture"]);
    ParametersStructure.Insert("Big", TestParametersMain["Big"]);
    OptionArray.Add(ParametersStructure);

    If False Then

        // FTP + HTTP
        ParametersStructure = New Structure;
        ParametersStructure.Insert("Postfix", "FTP, HTTP");
        ParametersStructure.Insert("FTP_IP", TestParametersMain["FTP_IP"]);
        ParametersStructure.Insert("FTP_Port", TestParametersMain["FTP_Port"]);
        ParametersStructure.Insert("FTP_User", TestParametersMain["FTP_User"]);
        ParametersStructure.Insert("FTP_Password", TestParametersMain["FTP_Password"]);
        ParametersStructure.Insert("Proxy_User", TestParametersMain["Proxy_User"]);
        ParametersStructure.Insert("Proxy_Password", TestParametersMain["Proxy_Password"]);
        ParametersStructure.Insert("Proxy_IP", TestParametersMain["Proxy_IP"]);
        ParametersStructure.Insert("Proxy_Port", TestParametersMain["Proxy_Port"]);
        ParametersStructure.Insert("Proxy_Type", "http");
        ParametersStructure.Insert("Proxy", True);
        ParametersStructure.Insert("TLS", False);
        ParametersStructure.Insert("Picture", TestParametersMain["Picture"]);
        ParametersStructure.Insert("Big", TestParametersMain["Big"]);
        OptionArray.Add(ParametersStructure);

        // FTPS + HTTP
        ParametersStructure = New Structure;
        ParametersStructure.Insert("Postfix", "");
        ParametersStructure.Insert("FTP_IP", TestParametersMain["FTPS_IP"]);
        ParametersStructure.Insert("FTP_Port", TestParametersMain["FTP_Port"]);
        ParametersStructure.Insert("FTP_User", TestParametersMain["FTP_User"]);
        ParametersStructure.Insert("FTP_Password", TestParametersMain["FTP_Password"]);
        ParametersStructure.Insert("Proxy_User", TestParametersMain["Proxy_User"]);
        ParametersStructure.Insert("Proxy_Password", TestParametersMain["Proxy_Password"]);
        ParametersStructure.Insert("Proxy_IP", TestParametersMain["Proxy_IP"]);
        ParametersStructure.Insert("Proxy_Port", TestParametersMain["Proxy_Port"]);
        ParametersStructure.Insert("Proxy_Type", "http");
        ParametersStructure.Insert("Proxy", True);
        ParametersStructure.Insert("TLS", True);
        ParametersStructure.Insert("Picture", TestParametersMain["Picture"]);
        ParametersStructure.Insert("Big", TestParametersMain["Big"]);
        OptionArray.Add(ParametersStructure);

    EndIf;

    Return OptionArray;

EndFunction

Function GetSSHParameterOptions() Export

    OptionArray = New Array;

    TestParametersMain = New Structure;
    ParameterToCollection("Picture"       , TestParametersMain);
    ParameterToCollection("Big"           , TestParametersMain);
    ParameterToCollection("SSH_Host"      , TestParametersMain);
    ParameterToCollection("SSH_Port"      , TestParametersMain);
    ParameterToCollection("SSH_User"      , TestParametersMain);
    ParameterToCollection("SSH_Password"  , TestParametersMain);
    ParameterToCollection("SSH_Key"       , TestParametersMain);
    ParameterToCollection("SSH_Pub"       , TestParametersMain);
    ParameterToCollection("Proxy_User"    , TestParametersMain);
    ParameterToCollection("Proxy_Password", TestParametersMain);
    ParameterToCollection("Socks5_IP"     , TestParametersMain);
    ParameterToCollection("Socks5_Port"   , TestParametersMain);
    ParameterToCollection("Proxy_IP"      , TestParametersMain);
    ParameterToCollection("Proxy_Port"    , TestParametersMain);
    ParameterToCollection("Access_Token"  , TestParametersMain);

    Localhost = GetLocalhost();

    Socks5IP                        = TestParametersMain["Socks5_IP"];
    TestParametersMain["Socks5_IP"] = ?(Socks5IP = "127.0.0.1", Localhost, Socks5IP);

    HttpProxyIP                    = TestParametersMain["Proxy_IP"];
    TestParametersMain["Proxy_IP"] = ?(HttpProxyIP = "127.0.0.1", Localhost, HttpProxyIP);

    NetAddress = TestParametersMain["SSH_Host"];
    TestParametersMain.Insert("SSH_Host", Localhost);

    PrivateKey = GetTempFileName();
    Token      = TestParametersMain["Access_Token"];
    OPI_HTTPRequests.NewRequest().Initialize(TestParametersMain["SSH_Key"]).AddBearerAuthorization(
        Token).ProcessRequest("GET").ReturnResponseAsBinaryData().Write(PrivateKey);

    TestParametersMain.Insert("SSH_Key", PrivateKey);

    TestParametersMain.Insert("Proxy"     , False);
    TestParametersMain.Insert("Proxy_Type", "none");

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);
    TestParameters.Insert("AuthType", "By login and password");
    TestParameters.Insert("Postfix" , "By login and password");
    OptionArray.Add(TestParameters);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);
    TestParameters.Insert("AuthType", "By key");
    TestParameters.Insert("Postfix" , "By key");
    OptionArray.Add(TestParameters);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);
    TestParameters.Insert("AuthType", "Via SSH agent");
    TestParameters.Insert("Postfix" , "Via SSH agent");
    //OptionArray.Add(TestParameters);

    For N = 0 To OptionArray.UBound() Do

        TestProxyParameters = OPI_Tools.CopyCollection(OptionArray[N]);

        Prefix = ?(TestProxyParameters["Postfix"] = "By login and password", "", StrTemplate("%1, SOCKS5",
            TestProxyParameters["Postfix"]));

        TestProxyParameters.Insert("SSH_Host"  , NetAddress);
        TestProxyParameters.Insert("Proxy"     , True);
        TestProxyParameters.Insert("Proxy_Type", "socks5");
        TestProxyParameters.Insert("Postfix"   , Prefix);

        TestProxyParameters.Insert("Proxy_IP"  , TestProxyParameters["Socks5_IP"]);
        TestProxyParameters.Insert("Proxy_Port", TestProxyParameters["Socks5_Port"]);
        OptionArray.Add(TestProxyParameters);

        TestProxyParameters = OPI_Tools.CopyCollection(OptionArray[N]);

        TestProxyParameters.Insert("SSH_Host"  , NetAddress);
        TestProxyParameters.Insert("Proxy"     , True);
        TestProxyParameters.Insert("Proxy_Type", "http");
        TestProxyParameters.Insert("Postfix"   , StrTemplate("%1, HTTP", TestProxyParameters["Postfix"]));

        OptionArray.Add(TestProxyParameters);

    EndDo;

    Return OptionArray;

EndFunction

Function GetS3ParameterOptions() Export

    GpBucket  = Left(String(New UUID), 8);
    DirBucket = Left(String(New UUID), 8);

    OptionArray = New Array;

    TestParametersMain = New Structure;
    ParameterToCollection("S3_AccessKey", TestParametersMain);
    ParameterToCollection("S3_SecretKey", TestParametersMain);
    ParameterToCollection("S3_URL"      , TestParametersMain);
    ParameterToCollection("Picture"     , TestParametersMain);
    ParameterToCollection("Audio"       , TestParametersMain);

    TestParametersMain.Insert("S3_GPB", GpBucket);
    TestParametersMain.Insert("S3_DB" , DirBucket);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);
    TestParameters.Insert("Directory", False);
    OptionArray.Add(TestParameters);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);
    TestParameters.Insert("Directory", True);
    OptionArray.Add(TestParameters);

    Return OptionArray;

EndFunction

Function GetPostgresParameterOptions() Export

    OptionArray = New Array;

    TestParametersMain = New Structure;
    ParameterToCollection("PG_IP"      , TestParametersMain);
    ParameterToCollection("PG_Password", TestParametersMain);
    ParameterToCollection("Picture"    , TestParametersMain);
    ParameterToCollection("SQL"        , TestParametersMain);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);

    TestParameters.Insert("TLS" , False);
    TestParameters.Insert("Port", 5432);

    OptionArray.Add(TestParameters);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);

    TestParameters.Insert("TLS" , True);
    TestParameters.Insert("Port", 5433);

    OptionArray.Add(TestParameters);

    Return OptionArray;

EndFunction

Function GetMySQLParameterOptions() Export

    OptionArray = New Array;

    TestParametersMain = New Structure;
    ParameterToCollection("PG_IP"      , TestParametersMain);
    ParameterToCollection("PG_Password", TestParametersMain);
    ParameterToCollection("Picture"    , TestParametersMain);
    ParameterToCollection("SQL2"       , TestParametersMain);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);

    TestParameters.Insert("TLS" , False);
    TestParameters.Insert("Port", 3306);

    OptionArray.Add(TestParameters);

    TestParameters = OPI_Tools.CopyCollection(TestParametersMain);

    TestParameters.Insert("TLS" , True);
    TestParameters.Insert("Port", 3307);

    OptionArray.Add(TestParameters);

    Return OptionArray;

EndFunction

Function GetTagArray(Index) Export

    TagsArray = New Array;

    If Index <= 3 Then
        TagsArray.Add("new");
    EndIf;

    If Index % 2 = 0 Then
        TagsArray.Add("sale");
    EndIf;

    If Index % 3 = 0 Then
        TagsArray.Add("popular");
    EndIf;

    If Index >= 12 Then
        TagsArray.Add("hit");
    EndIf;

    Return TagsArray;

EndFunction

#EndRegion

#EndRegion

#Region Private

#Region Checks

Function Check_BuildCheck_CheckIBToLastBuildCompliance(Val Result, Val Option, Val LastSum)

    //@skip-check use-non-recommended-method
    Message(StrTemplate("Current IB build: %1", Result));
    //@skip-check use-non-recommended-method
    Message(StrTemplate("Last project build: %1", LastSum));

    ExpectsThat(Result).Равно(LastSum);

    Return Undefined;

EndFunction

Function Check_Telegram_GetBotInformation(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["username"]).Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_GetUpdates(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_Telegram_SetWebhook(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["description"]).Равно("Webhook was set");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_DeleteWebhook(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["description"]).Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_SendTextMessage(Val Result, Val Option, Parameters = "", Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    If Not ValueIsFilled(Option) Then

        ParameterName = "Telegram_MessageID";
        ExpectsThat(Result["result"]["text"]).Равно(Text);

    ElsIf Option = "Channel" Then

        ParameterName = "Telegram_ChannelMessageID";
        ExpectsThat(Result["result"]["text"]).Равно(Text);

    Else
        ParameterName = "";
    EndIf;

    If ValueIsFilled(ParameterName) Then

        MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
        WriteParameter(ParameterName, MessageID);
        OPI_Tools.AddField(ParameterName, MessageID, "String", Parameters);

    EndIf;

    Return Result;

EndFunction

Function Check_Telegram_FormKeyboardFromButtonArray(Val Result, Val Option)

    TypeResult = TypeOf(Result);

    ExpectsThat(TypeResult = Type("String") Or TypeResult = Type("Map")).Равно(True);
    Return Result;

EndFunction

Function Check_Telegram_SendImage(Val Result, Val Option, Parameters = "", Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    If Option <> "Text + Emoji" And Option <> "Complex" Then
        ExpectsThat(Result["result"]["caption"]).Равно(Text);
    EndIf;

    ExpectsThat(Result["result"]["photo"]).ИмеетТип("Array");

    If Not ValueIsFilled(Option) Then

        MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
        WriteParameter("Telegram_PicMessageID", MessageID);
        OPI_Tools.AddField("Telegram_PicMessageID", MessageID, "String", Parameters);

    EndIf;

    If Option = "Keyboard collection" Then

        FileID = Result["result"]["photo"][0]["file_id"];
        WriteParameter("Telegram_FileID", FileID);
        Parameters.Insert("Telegram_FileID", FileID);

    EndIf;

    Return Result;

EndFunction

Function Check_Telegram_SendVideo(Val Result, Val Option, Parameters = "", Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["video"]["mime_type"]).Равно("video/mp4");

    If Option = "Binary" Then

        FileID = Result["result"]["video"]["file_id"];
        WriteParameter("Telegram_FileID", FileID);
        Parameters.Insert("Telegram_FileID", FileID);

    EndIf;

    Return Result;

EndFunction

Function Check_Telegram_SendAudio(Val Result, Val Option, Parameters = "", Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["audio"]["mime_type"]).Равно("audio/mpeg");

    If Option = "Binary" Then

        FileID = Result["result"]["audio"]["file_id"];
        WriteParameter("Telegram_FileID", FileID);
        Parameters.Insert("Telegram_FileID", FileID);

    EndIf;

    Return Result;

EndFunction

Function Check_Telegram_SendDocument(Val Result, Val Option, Parameters = "", Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["document"]).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_Telegram_SendGif(Val Result, Val Option, Parameters = "", Text = "")

    Result_ = "result";

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result[Result_]["caption"]).Равно(Text);
    ExpectsThat(Result[Result_]["document"]).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result[Result_]["animation"]["mime_type"]).Равно("video/mp4");

    Return Result;

EndFunction

Function Check_Telegram_SendMediaGroup(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Telegram_SendLocation(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["location"]).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_Telegram_SendContact(Val Result, Val Option, Name = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["contact"]).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["result"]["contact"]["first_name"]).Равно(Name);

    OPI_Tools.Pause(15);

    Return Result;

EndFunction

Function Check_Telegram_SendPoll(Val Result, Val Option, Question = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["poll"]).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["result"]["poll"]["question"]).Равно(Question);

    Return Result;

EndFunction

Function Check_Telegram_DownloadFile(Val Result, Val Option)

    ExpectsThat(TypeOf(Result) = Type("String") Or TypeOf(Result) = Type("BinaryData")).Равно(True);

    Return Result;

EndFunction

Function Check_Telegram_ForwardMessage(Val Result, Val Option, MessageID = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["forward_origin"]["message_id"]).Равно(Number(MessageID));

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_Ban(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["description"]).Равно("Bad Request: can't remove chat owner");

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_Telegram_Unban(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["description"]).Равно("Bad Request: can't remove chat owner");

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_Telegram_CreateInvitationLink(Val Result, Val Option, Title = "", UnixExpiration = "")

    Result_ = "result";
    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result[Result_]["member_limit"]).Равно(200);
    ExpectsThat(Result[Result_]["name"]).Равно(Title);
    ExpectsThat(Result[Result_]["expire_date"]).Равно(Number(UnixExpiration));

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_PinMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_UnpinMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_GetParticipantCount(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Number");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_GetAvatarIconList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_CreateForumTopic(Val Result, Val Option, Parameters = "", NameOrText = "", Icon = "")

    If Not ValueIsFilled(Option) Then

        TTID = "Telegram_TopicID";

        ExpectsThat(Result).ИмеетТип("Map").Заполнено();
        ExpectsThat(Result["ok"]).Равно(True);
        ExpectsThat(Result["result"]["name"]).Равно(NameOrText);
        ExpectsThat(Result["result"]["icon_custom_emoji_id"]).Равно(Icon);

        Topic = Result["result"]["message_thread_id"];

        OPI_Tools.AddField(TTID, Topic, "String", Parameters);
        WriteParameter(TTID, Parameters[TTID]);

    Else

        ExpectsThat(Result).ИмеетТип("Map").Заполнено();
        ExpectsThat(Result["ok"]).Равно(True);
        ExpectsThat(Result["result"]["text"]).Равно(NameOrText);

    EndIf;

    Return Result;

EndFunction

Function Check_Telegram_EditForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_CloseForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Telegram_OpenForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Telegram_DeleteForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Telegram_ClearTopicPinnedMessagesList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_HideMainForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_ShowMainForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_EditMainForumTopicName(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_DeleteMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Telegram_ReplaceMessageText(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["text"]).Равно(Text);

    Return Result;

EndFunction

Function Check_Telegram_ReplaceMessageKeyboard(Val Result, Val Option, Keyboard = "")

    MessageKeyboard = Result["result"]["reply_markup"];

    Keyboard_ = OPI_Tools.JsonToStructure(Keyboard);
    Keyboard_.Delete("rows");
    Keyboard_ = OPI_Tools.JSONString(Keyboard_);

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(StrLen(OPI_Tools.JSONString(MessageKeyboard))).Равно(StrLen(Keyboard_));

    Return Result;

EndFunction

Function Check_Telegram_ReplaceMessageCaption(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["photo"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_VK_CreateTokenRetrievalLink(Val Result, Val Option)

    If TypeOf(Result) = Type("BinaryData") Then
        Result        = GetStringFromBinaryData(Result);
    EndIf;

    ExpectsThat(Result).ИмеетТип("String");
    ExpectsThat(StrStartsWith(Result, "https://oauth.vk.com")).Равно(True);

    Return Result;

EndFunction

Function Check_VK_CreatePost(Val Result, Val Option, Parameters = "")

    PostID = Result["response"]["post_id"];

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(PostID).ИмеетТип("Number").Заполнено();

    If Option = "Path" Then

        OPI_Tools.AddField("VK_PostID", PostID, "String", Parameters);
        WriteParameter("VK_PostID", Parameters["VK_PostID"]);

    EndIf;

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_DeletePost(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CreateCompositePost(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["post_id"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CreatePoll(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["post_id"]).ИмеетТип("Number").Заполнено();

    Return Result;

EndFunction

Function Check_VK_CreateAlbum(Val Result, Val Option, Parameters = "", Description = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["description"]).Равно(Description);

    AlbumID = Result["response"]["id"];
    Parameters.Insert("VK_AlbumID", AlbumID);
    WriteParameter("VK_AlbumID", AlbumID);

    Return Result;

EndFunction

Function Check_VK_SaveImageToAlbum(Val Result, Val Option, Parameters = "", Description = "", AlbumID = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"][0]["text"]).Равно(Description);
    ExpectsThat(Result["response"][0]["album_id"]).Равно(AlbumID);

    ImageID = Result["response"][0]["id"];
    Parameters.Insert("VK_PictureID", ImageID);
    WriteParameter("VK_PictureID", ImageID);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_DeleteImage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_DeleteAlbum(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CreateStory(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["count"]).ИмеетТип("Number").Равно(1);
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CreateDiscussion(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

    DiscussionID = Result["response"];
    Parameters.Insert("VK_ConvID", DiscussionID);
    WriteParameter("VK_ConvID", DiscussionID);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CloseDiscussion(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_OpenDiscussion(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_WriteInDiscussion(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

    Return Result;

EndFunction

Function Check_VK_LikePost(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["likes"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_MakeRepost(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["success"]).ИмеетТип("Number").Равно(1);
    ExpectsThat(Result["response"]["wall_repost_count"]).ИмеетТип("Number").Равно(1);

    Parameters.Insert("Repost", Result["response"]["post_id"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_WriteComment(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["comment_id"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GetStatistics(Val Result, Val Option)

    TypeMap = "Map";

    ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    ExpectsThat(Result["response"][0]["visitors"]).ИмеетТип(TypeMap).Заполнено();
    ExpectsThat(Result["response"][0]["reach"]).ИмеетТип(TypeMap).Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GetPostStatistics(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array").ИмеетДлину(2);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CreateAdvertisingCampaign(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    CampaignID = Result["response"][0]["id"];
    WriteParameter("VK_AdsCampaignID", CampaignID);
    Parameters.Insert("VK_AdsCampaignID", CampaignID);

    Return Undefined;

EndFunction

Function Check_VK_CreateAd(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    AnnouncementID = Result["response"][0]["id"];
    WriteParameter("VK_AdsPostID", AnnouncementID);
    Parameters.Insert("VK_AdsPostID", AnnouncementID);

    Return Undefined;

EndFunction

Function Check_VK_PauseAdvertising(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Undefined;

EndFunction

Function Check_VK_FormKeyboard(Val Result, Val Option)

    TypeResult = TypeOf(Result);

    ExpectsThat(TypeResult = Type("String") Or TypeResult = Type("Map")).Равно(True);

    Return Result;

EndFunction

Function Check_VK_WriteMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

    Return Result;

EndFunction

Function Check_VK_GetProductCategoryList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_VK_CreateProductCollection(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["albums_count"]).ИмеетТип("Number").Заполнено();
    ExpectsThat(Result["response"]["market_album_id"]).ИмеетТип("Number").Заполнено();

    SelectionID = Result["response"]["market_album_id"];
    WriteParameter("VK_MarketAlbumID", SelectionID);
    Parameters.Insert("VK_MarketAlbumID", SelectionID);

    Return Result;

EndFunction

Function Check_VK_EditProductCollection(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GetSelectionsByID(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").Заполнено();

    Return Result;

EndFunction

Function Check_VK_AddProduct(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["market_item_id"]).ИмеетТип("Number").Заполнено();

    ProductID = Result["response"]["market_item_id"];
    WriteParameter("VK_MarketItemID", ProductID);
    Parameters.Insert("VK_MarketItemID", ProductID);

    Return Result;

EndFunction

Function Check_VK_EditProduct(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    Return Result;

EndFunction

Function Check_VK_AddProductToCollection(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_RemoveProductFromSelection(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_DeleteProduct(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_DeleteSelection(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CreateProductProperty(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["property_id"]).ИмеетТип("Number").Заполнено();

    Property = Result["response"]["property_id"];
    Property = OPI_Tools.NumberToString(Property);

    WriteParameter("VK_PropID", Property);
    Parameters.Insert("VK_PropID", Property);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_EditProductProperty(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_AddProductPropertyVariant(Val Result, Val Option, Parameters = "", Counter = 0)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["variant_id"]).ИмеетТип("Number").Заполнено();

    VariantID     = Result["response"]["variant_id"];
    ParameterName = "VK_PropVarID" + String(Counter);

    WriteParameter(ParameterName, VariantID);
    Parameters.Insert(ParameterName, VariantID);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_EditProductPropertyVariant(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_CreateProductWithProp(Val Result, Val Option, Parameters = "", Counter = 0)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["market_item_id"]).ИмеетТип("Number").Заполнено();

    ProductID = Result["response"]["market_item_id"];
    FieldName = "VK_MarketItemID" + String(Counter);

    WriteParameter(FieldName, ProductID);
    Parameters.Insert(FieldName, ProductID);

    Return Result;

EndFunction

Function Check_VK_GetProductsByID(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").ИмеетДлину(2);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GroupProducts(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["item_group_id"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_DeleteProductPropertyVariant(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_DeleteProductProperty(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GetProductList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GetSelectionList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GetPropertyList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_GetOrderList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_UploadVideoToServer(Val Result, Val Option)

    ExpectsThat(Result["video_id"]).Заполнено();
    ExpectsThat(Result["video_hash"]).Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_VK_UploadPhotoToServer(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"][0]["text"]).Равно("");

    Return Result;

EndFunction

Function Check_VK_ShortenLink(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_VK_GetAdvertisingCategoryList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["v2"]).ИмеетТип("Array").Заполнено();

    Return Result;

EndFunction

Function Check_VK_GetProductDescription(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_VK_GetAuthParameters(Val Result, Val Option)

    ExpectsThat(Result["v"]).Заполнено();
    ExpectsThat(Result["from_group"]).Заполнено();
    ExpectsThat(Result["group_id"]).Заполнено();
    ExpectsThat(Result["owner_id"]).Заполнено();
    ExpectsThat(Result["app_id"]).Заполнено();
    ExpectsThat(Result["access_token"]).Заполнено();

    Return Result;

EndFunction

Function Check_YandexDisk_GetDiskInformation(Val Result, Val Option)

    Map_ = "Map";

    ExpectsThat(Result).ИмеетТип(Map_).Заполнено();
    ExpectsThat(Result["system_folders"]).ИмеетТип(Map_);
    ExpectsThat(Result["user"]).ИмеетТип(Map_);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_CreateFolder(Val Result, Val Option, Token = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("dir");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_UploadFileByURL(Val Result, Val Option, Parameters = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["href"]).Заполнено();
    ExpectsThat(Result["method"]).Заполнено();

    WriteParameter("YandexDisk_FileByURLPath", Path);
    Parameters.Insert("YandexDisk_FileByURLPath", Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_GetObject(Val Result, Val Option, Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

    Return Result;

EndFunction

Function Check_YandexDisk_DeleteObject(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_UploadFile(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_UploadFileInParts(Val Result, Val Option, File = "")

    If Option = "Downloading" Then

        OPI_TypeConversion.GetBinaryData(File);

        ExpectsThat(Result).ИмеетТип("BinaryData").Заполнено();
        ExpectsThat(Result.Size()).Равно(File.Size());

        HashOrigianl = GetStringFromBinaryData(OPI_Cryptography.Hash(File, HashFunction.SHA256));
        HashCheck    = GetStringFromBinaryData(OPI_Cryptography.Hash(Result, HashFunction.SHA256));

        ExpectsThat(HashCheck).Равно(HashOrigianl);

    ElsIf Option = "Deletion" Then

        If Not Lower(String(Result)) = "null" Then
            ExpectsThat(ValueIsFilled(Result)).Равно(False);
        EndIf;

    Else
        ExpectsThat(Result["status"] >= 200 And Result["status"] < 300).Равно(True);
    EndIf;

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_CreateObjectCopy(Val Result, Val Option, Parameters = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

    WriteParameter("YandexDisk_CopyFilePath", Path);
    Parameters.Insert("YandexDisk_CopyFilePath", Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_GetDownloadLink(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["method"]).Равно("GET");
    ExpectsThat(Result["href"]).ИмеетТип("String").Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_DownloadFile(Val Result, Val Option)

    MinimumSize = 1000;

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() > MinimumSize).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_GetFilesList(Val Result, Val Option, Count = 0, Indent = 0)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["limit"]).Равно(Count);
    ExpectsThat(Result["offset"]).Равно(Indent);
    ExpectsThat(Result["items"]).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_MoveObject(Val Result, Val Option, Parameters = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

    WriteParameter("YandexDisk_NewFilePath", Path);
    Parameters.Insert("YandexDisk_NewFilePath", Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_GetPublishedObjectsList(Val Result, Val Option, Count = 0,
    Indent                                                                      = 0)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["limit"]).Равно(Count);
    ExpectsThat(Result["offset"]).Равно(Indent);
    ExpectsThat(Result["items"]).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_YandexDisk_PublishObject(Val Result, Val Option, Parameters = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);
    ExpectsThat(Result["public_url"]).ИмеетТип("String").Заполнено();

    URL = Result["public_url"];
    WriteParameter("YandexDisk_PublicURL", URL);
    Parameters.Insert("YandexDisk_PublicURL", URL);

    Return Result;

EndFunction

Function Check_YandexDisk_GetDownloadLinkForPublicObject(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["method"]).Равно("GET");
    ExpectsThat(Result["href"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_YandexDisk_GetPublicObject(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Заполнено();
    ExpectsThat(Result["public_url"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_YandexDisk_SavePublicObjectToDisk(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Заполнено();
    ExpectsThat(Result["public_url"]).ИмеетТип("Undefined");

    Return Result;

EndFunction

Function Check_YandexDisk_CancelObjectPublication(Val Result, Val Option, Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);
    ExpectsThat(Result["public_url"]).ИмеетТип("Undefined");

    Return Result;

EndFunction

Function Check_YandexDisk_GetConfirmationCode(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["verification_url"]).Заполнено();
    ExpectsThat(Result["device_code"]).Заполнено();

    Return Result;

EndFunction

Function Check_YandexDisk_ConvertCodeToToken(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    If Result.Get("access_token") <> Undefined Then

        Token = Result["access_token"];
        WriteParameter("YandexDisk_Token", Token);
        Parameters.Insert("YandexDisk_Token", Token);

        Token = Result["refresh_token"];
        WriteParameter("YandexDisk_RefreshToken", Token);
        Parameters.Insert("YandexDisk_RefreshToken", Token);

    EndIf;

    Return Undefined;

EndFunction

Function Check_YandexDisk_RefreshToken(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["access_token"]).Заполнено();
    ExpectsThat(Result["refresh_token"]).Заполнено();

    Token = Result["access_token"];
    WriteParameter("YandexDisk_Token", Token);
    Parameters.Insert("YandexDisk_Token", Token);

    Token = Result["refresh_token"];
    WriteParameter("YandexDisk_RefreshToken", Token);
    Parameters.Insert("YandexDisk_RefreshToken", Token);

    Return Undefined;

EndFunction

Function Check_Viber_SetWebhook(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_Viber_GetChannelInformation(Val Result, Val Option)

    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_GetUserData(Val Result, Val Option)

    ExpectsThat(Result["chat_hostname"]).Заполнено();
    ExpectsThat(Result["status_message"]).Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_GetOnlineUsers(Val Result, Val Option)

    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);
    ExpectsThat(Result["users"]).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_CreateKeyboardFromArrayButton(Val Result, Val Option)

    Return Result;

EndFunction

Function Check_Viber_SendTextMessage(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_SendImage(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_SendFile(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_SendContact(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_SendLocation(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Viber_SendLink(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleWorkspace_FormCodeRetrievalLink(Val Result, Val Option)

    If TypeOf(Result) = Type("BinaryData") Then
        Result        = GetStringFromBinaryData(Result);
    EndIf;

    ExpectsThat(Result).ИмеетТип("String");
    ExpectsThat(StrStartsWith(Result, "https://accounts.google.com/o/oauth2")).Равно(True);

    WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleWorkspace_GetTokenByCode(Val Result, Val Option)

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then

        WriteParameter("Google_Token"  , Result["access_token"]);
        WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_GoogleWorkspace_RefreshToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleWorkspace_GetServiceAccountToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_ServiceToken", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleCalendar_FormCodeRetrievalLink(Val Result, Val Option)

    If TypeOf(Result) = Type("BinaryData") Then
        Result        = GetStringFromBinaryData(Result);
    EndIf;

    ExpectsThat(Result).ИмеетТип("String");
    ExpectsThat(StrStartsWith(Result, "https://accounts.google.com/o/oauth2")).Равно(True);

    WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetTokenByCode(Val Result, Val Option)

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then

        WriteParameter("Google_Token"  , Result["access_token"]);
        WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_GoogleCalendar_RefreshToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetServiceAccountToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_ServiceToken", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetCalendarList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleCalendar_CreateCalendar(Val Result, Val Option, Parameters = "", Name = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Calendar = Result["id"];
    WriteParameter("Google_NewCalendarID", Calendar);
    OPI_Tools.AddField("Google_NewCalendarID", Calendar, "String", Parameters);

    Return Result;

EndFunction

Function Check_GoogleCalendar_EditCalendarMetadata(Val Result, Val Option, Name = "",
    Description                                                                 = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetCalendarMetadata(Val Result, Val Option, Name = "",
    Description                                                                = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleCalendar_AddCalendarToList(Val Result, Val Option, Name = "", Description = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleCalendar_EditListCalendar(Val Result, Val Option, PrimaryColor = "",
    SecondaryColor                                                                  = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["foregroundColor"]).Равно(PrimaryColor);
    ExpectsThat(Result["backgroundColor"]).Равно(SecondaryColor);

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetListCalendar(Val Result, Val Option, PrimaryColor = "",
    SecondaryColor                                                                 = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["foregroundColor"]).Равно(PrimaryColor);
    ExpectsThat(Result["backgroundColor"]).Равно(SecondaryColor);

    Return Result;

EndFunction

Function Check_GoogleCalendar_ClearMainCalendar(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleCalendar_DeleteCalendarFromList(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then

        If ValueIsFilled(Result) Then
            ExpectsThat(Result["error"]["message"])
                .Равно("Data owner of a calendar cannot remove calendar list entry for that calendar.");
        EndIf;

    EndIf;

    Return Result;

EndFunction

Function Check_GoogleCalendar_DeleteCalendar(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleCalendar_CreateEvent(Val Result, Val Option, Parameters = "", Name = "",
    Description                                                              = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Event = Result["id"];
    WriteParameter("Google_EventID", Event);
    OPI_Tools.AddField("Google_EventID", Event, "String", Parameters);

    Return Result;

EndFunction

Function Check_GoogleCalendar_EditEvent(Val Result, Val Option, Name = "", Description = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetEvent(Val Result, Val Option, Name = "", Description = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleCalendar_MoveEvent(Val Result, Val Option, Name = "", Description = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleCalendar_DeleteEvent(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetEventList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetEventDescription(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleDrive_FormCodeRetrievalLink(Val Result, Val Option)

    If TypeOf(Result) = Type("BinaryData") Then
        Result        = GetStringFromBinaryData(Result);
    EndIf;

    ExpectsThat(Result).ИмеетТип("String");
    ExpectsThat(StrStartsWith(Result, "https://accounts.google.com/o/oauth2")).Равно(True);

    WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_GetTokenByCode(Val Result, Val Option)

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then

        WriteParameter("Google_Token"  , Result["access_token"]);
        WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_GoogleDrive_RefreshToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_GetServiceAccountToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_ServiceToken", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_GetDirectoriesList(Val Result, Val Option, Parameters = "")

    Result = Result[0];

    ExpectsThat(Result["mimeType"]).Равно("application/vnd.google-apps.folder");
    ExpectsThat(Result["name"]).Заполнено();

    Identifier = Result["id"];
    WriteParameter("GD_Catalog", Identifier);
    OPI_Tools.AddField("GD_Catalog", Identifier, "String", Parameters);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_GetObjectInformation(Val Result, Val Option)

    ExpectsThat(Result["mimeType"]).Равно("application/vnd.google-apps.folder");
    ExpectsThat(Result["name"]).Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_UploadFile(Val Result, Val Option, Parameters = "", Description = "")

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result["mimeType"]).Равно(Description["MIME"]);
        ExpectsThat(Result["name"]).Равно(Description["Name"]);

        Identifier = Result["id"];

        WriteParameter("GD_File", Identifier);
        OPI_Tools.AddField("GD_File", Identifier, "String", Parameters);

    ElsIf Option = "Check" Then

        File = Parameters["Big"];

        OPI_TypeConversion.GetBinaryData(File);

        ExpectsThat(Result).ИмеетТип("BinaryData").Заполнено();
        ExpectsThat(Result.Size()).Равно(File.Size());

        HashOrigianl = GetStringFromBinaryData(OPI_Cryptography.Hash(File, HashFunction.SHA256));
        HashCheck    = GetStringFromBinaryData(OPI_Cryptography.Hash(Result, HashFunction.SHA256));

        ExpectsThat(HashCheck).Равно(HashOrigianl);

    Else

        ExpectsThat(Result["mimeType"]).Равно(Description["MIME"]);
        ExpectsThat(Result["name"]).Равно(Description["Name"]);

        Identifier = Result["id"];

        ArrayOfDeletions = Parameters["ArrayOfDeletions"];
        ArrayOfDeletions.Add(Identifier);
        Parameters.Insert("ArrayOfDeletions", ArrayOfDeletions);

    EndIf;

    Return Result;

EndFunction

Function Check_GoogleDrive_CopyObject(Val Result, Val Option, Parameters = "", NewName = "")

    Description = New Structure("Name,MIME", NewName, "image/jpeg");

    ExpectsThat(Result["mimeType"]).Равно(Description["MIME"]);
    ExpectsThat(Result["name"]).Равно(Description["Name"]);

    Identifier = Result["id"];

    ArrayOfDeletions = Parameters["ArrayOfDeletions"];
    ArrayOfDeletions.Add(Identifier);
    Parameters.Insert("ArrayOfDeletions", ArrayOfDeletions);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_DownloadFile(Val Result, Val Option, Parameters = "")

    Size = OPI_HTTPRequests.Get(Parameters["Picture"]).Size();

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= Size).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_UpdateFile(Val Result, Val Option, NewName = "")

    Description = New Structure("Name,MIME", NewName, "image/jpeg");

    ExpectsThat(Result["mimeType"]).Равно(Description["MIME"]);
    ExpectsThat(Result["name"]).Равно(Description["Name"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_GetFilesList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_GoogleDrive_DeleteObject(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleDrive_GetFileDescription(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleDrive_CreateComment(Val Result, Val Option, Parameters = "", Comment = "")

    ExpectsThat(Result["content"]).Равно(Comment);
    ExpectsThat(Result["kind"]).Равно("drive#comment");

    Identifier = Result["id"];

    WriteParameter("GD_Comment", Identifier);
    OPI_Tools.AddField("GD_Comment", Identifier, "String", Parameters);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleDrive_GetComment(Val Result, Val Option)

    ExpectsThat(Result["content"]).Равно("Comment text");
    ExpectsThat(Result["kind"]).Равно("drive#comment");

    Return Result;

EndFunction

Function Check_GoogleDrive_GetCommentList(Val Result, Val Option)

    Comments      = Result["comments"];
    CommentObject = Comments[Comments.UBound()];

    ExpectsThat(CommentObject["content"]).Равно("Comment text");
    ExpectsThat(CommentObject["kind"]).Равно("drive#comment");

    Return Result;

EndFunction

Function Check_GoogleDrive_DeleteComment(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleDrive_CreateFolder(Val Result, Val Option)

    ExpectsThat(Result["mimeType"]).Равно("application/vnd.google-apps.folder");
    ExpectsThat(Result["name"]).Заполнено();

    Return Result;

EndFunction

Function Check_GoogleSheets_FormCodeRetrievalLink(Val Result, Val Option)

    If TypeOf(Result) = Type("BinaryData") Then
        Result        = GetStringFromBinaryData(Result);
    EndIf;

    ExpectsThat(Result).ИмеетТип("String");
    ExpectsThat(StrStartsWith(Result, "https://accounts.google.com/o/oauth2")).Равно(True);

    WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleSheets_GetTokenByCode(Val Result, Val Option)

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then

        WriteParameter("Google_Token"  , Result["access_token"]);
        WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_GoogleSheets_RefreshToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleSheets_GetServiceAccountToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_ServiceToken", Result["access_token"]);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_GoogleSheets_CreateSpreadsheet(Val Result, Val Option, Parameters = "", Name = "",
    SheetArray                                                                   = "")

    ExpectsThat(Result["properties"]["title"]).Равно(Name);

    If ValueIsFilled(SheetArray) Then

        For N = 0 To SheetArray.UBound() Do

            SheetName = Result["sheets"][N]["properties"]["title"];
            ExpectsThat(SheetName).Равно(SheetArray[N]);

        EndDo;

    EndIf;

    Spreadsheet = Result["spreadsheetId"];

    If Not ValueIsFilled(Option) Then

        Sheet = Result["sheets"][0]["properties"]["sheetId"];
        Sheet = OPI_Tools.NumberToString(Sheet);

        WriteParameter("GS_Spreadsheet", Spreadsheet);
        WriteParameter("GS_Sheet"      , Sheet);

        OPI_Tools.AddField("GS_Spreadsheet", Spreadsheet, "String", Parameters);
        OPI_Tools.AddField("GS_Sheet"      , Sheet      , "String", Parameters);

    Else

        WriteParameter("GS_Spreadsheet2", Spreadsheet);
        OPI_Tools.AddField("GS_Spreadsheet2", Spreadsheet, "String", Parameters);

    EndIf;

    Return Result;

EndFunction

Function Check_GoogleSheets_GetSpreadsheet(Val Result, Val Option, Token = "")

    Name = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    ExpectsThat(Result["properties"]["title"]).Равно(Name);

    For N = 0 To SheetArray.UBound() Do

        SheetName = Result["sheets"][N]["properties"]["title"];
        ExpectsThat(SheetName).Равно(SheetArray[N]);

    EndDo;

    Return Result;

EndFunction

Function Check_GoogleSheets_CopySheet(Val Result, Val Option)

    ExpectsThat(Result["title"]).Заполнено();

    Return Result;

EndFunction

Function Check_GoogleSheets_AddSheet(Val Result, Val Option)

    NewSheet = Result["replies"][0]["addSheet"]["properties"];
    ExpectsThat(NewSheet["title"]).Заполнено();

    Return Result;

EndFunction

Function Check_GoogleSheets_DeleteSheet(Val Result, Val Option, Spreadsheet = "")

    ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

    Return Result;

EndFunction

Function Check_GoogleSheets_EditSpreadsheetTitle(Val Result, Val Option, Spreadsheet = "")

    ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

    Return Result;

EndFunction

Function Check_GoogleSheets_GetTable(Val Result, Val Option)

    Name = "Test table (changed.)";
    ExpectsThat(Result["properties"]["title"]).Равно(Name);

    Return Result;

EndFunction

Function Check_GoogleSheets_SetCellValues(Val Result, Val Option, Count = 0)

    ExpectsThat(Result["totalUpdatedCells"]).Равно(Count);

    Return Result;

EndFunction

Function Check_GoogleSheets_GetCellValues(Val Result, Val Option, BookOrAmount = 0)

    If Option = "All" Then
        ExpectsThat(Result["spreadsheetId"]).Равно(BookOrAmount);
    Else
        ExpectsThat(Result["valueRanges"].Count()).Равно(BookOrAmount);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleSheets_ClearCells(Val Result, Val Option, Count = 0)

    ExpectsThat(Result["clearedRanges"].Count()).Равно(Count);

    Return Result;

EndFunction

Function Check_Slack_GetBotInformation(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["bot_id"]).Заполнено();
    ExpectsThat(Result["user_id"]).Заполнено();

    Return Result;

EndFunction

Function Check_Slack_GetUserList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["members"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_GetWorkspaceList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["teams"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_SendMessage(Val Result, Val Option, Parameters = "", Text = "", Channel = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["channel"]).Равно(Channel);
    ExpectsThat(Result["message"]["text"]).Равно(Text);

    If Not ValueIsFilled(Option) Then

        Timestamp = Result["ts"];
        WriteParameter("Slack_MessageTS", Timestamp);
        OPI_Tools.AddField("Slack_MessageTS", Timestamp, "String", Parameters);

    EndIf;

    If Not Option = "Sheduled" Then

        ExpectsThat(Result["ts"]).Заполнено();

    EndIf;

    Return Result;

EndFunction

Function Check_Slack_GenerateImageBlock(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_Slack_EditMessage(Val Result, Val Option, Text = "", Channel = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["channel"]).Равно(Channel);
    ExpectsThat(Result["ts"]).Заполнено();
    ExpectsThat(Result["message"]["text"]).Равно(Text);

    Return Result;

EndFunction

Function Check_Slack_GetMessageReplyList(Val Result, Val Option)

    ExpectsThat(Result["messages"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_GetMessageLink(Val Result, Val Option, Channel = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["channel"]).Равно(Channel);
    ExpectsThat(Result["permalink"]).Заполнено();

    Return Result;

EndFunction

Function Check_Slack_DeleteMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_SendEphemeralMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["message_ts"]).Заполнено();

    Return Result;

EndFunction

Function Check_Slack_GetDelayedMessageList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["scheduled_messages"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_CreateChannel(Val Result, Val Option, Parameters = "", Name = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Data = Result["channel"];
    ExpectsThat(Data["name"]).Равно(Name);

    Channel = Result["channel"]["id"];
    WriteParameter("Slack_NewChannel", Channel);
    OPI_Tools.AddField("Slack_NewChannel", Channel, "String", Parameters);

    WriteParameter("Slack_NewChannelName", Name);
    OPI_Tools.AddField("Slack_NewChannelName", Name, "String", Parameters);

    Return Result;

EndFunction

Function Check_Slack_SetChannelTopic(Val Result, Val Option, Topic = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Data = Result["channel"];
    ExpectsThat(Data["topic"]["value"]).Равно(Topic);

    Return Result;

EndFunction

Function Check_Slack_SetChannelGoal(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_GetChannel(Val Result, Val Option, Name = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Data = Result["channel"];
    ExpectsThat(Data["name"]).Равно(Name);

    Return Result;

EndFunction

Function Check_Slack_InviteUsersToChannel(Val Result, Val Option, Name = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Data = Result["channel"];
    ExpectsThat(Data["name"]).Равно(Name);

    Return Result;

EndFunction

Function Check_Slack_KickUserFromChannel(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_GetChannelHistory(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["messages"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_GetChannelUserList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["members"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_LeaveChannel(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_JoinChannel(Val Result, Val Option, Name = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Data = Result["channel"];
    ExpectsThat(Data["name"]).Равно(Name);

    Return Result;

EndFunction

Function Check_Slack_RenameChannel(Val Result, Val Option, Name = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Data = Result["channel"];
    ExpectsThat(Data["name"]).Равно(Name);

    Return Result;

EndFunction

Function Check_Slack_ArchiveChannel(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_GetChannelList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["channels"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_OpenDialog(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    If Not ValueIsFilled(Option) Then

        Dialog = Result["channel"]["id"];

        ExpectsThat(Result["channel"]).ИмеетТип("Map");
        ExpectsThat(Dialog).Заполнено();

        WriteParameter("Slack_Dialog", Dialog);
        OPI_Tools.AddField("Slack_Dialog", Dialog, "String", Parameters);

    EndIf;

    Return Result;

EndFunction

Function Check_Slack_CloseDialog(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_GetFilesList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["files"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_UploadFile(Val Result, Val Option, Parameters = "", FileName = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    If ValueIsFilled(Result["files"]) Then
        UploadedFile = Result["files"][0];
    Else
        UploadedFile = Result["file"];
    EndIf;

    ExpectsThat(UploadedFile["name"]).Равно(FileName);

    If Not ValueIsFilled(Option) Then

        UploadedFile = Result["files"][0]["id"];
        WriteParameter("Slack_FileID", UploadedFile);
        OPI_Tools.AddField("Slack_FileID", UploadedFile, "String", Parameters);

    EndIf;

    Return Result;

EndFunction

Function Check_Slack_MakeFilePublic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Undefined;

EndFunction

Function Check_Slack_MakeFilePrivate(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Undefined;

EndFunction

Function Check_Slack_GetFileData(Val Result, Val Option, FileName = "")

    If ValueIsFilled(Result["files"]) Then
        UploadedFile = Result["files"][0];
    Else
        UploadedFile = Result["file"];
    EndIf;

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(UploadedFile["name"]).Равно(FileName);

    Return Result;

EndFunction

Function Check_Slack_DeleteFile(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_GetExternalFileList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["files"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Slack_AddExternalFile(Val Result, Val Option, Parameters = "", Title = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    UploadedFile = Result["file"];
    ExpectsThat(UploadedFile["title"]).Равно(Title);

    UploadedFile = Result["file"]["id"];
    WriteParameter("Slack_ExtFileID", UploadedFile);
    OPI_Tools.AddField("Slack_ExtFileID", UploadedFile, "String", Parameters);

    Return Result;

EndFunction

Function Check_Slack_GetExternalFile(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    UploadedFile = Result["file"];
    ExpectsThat(UploadedFile["title"]).Равно("NewFile");

    Return Result;

EndFunction

Function Check_Slack_SendExternalFile(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Slack_DeleteExternalFile(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_CreateDatabase(Val Result, Val Option, Parameters = "", TableName = "")

    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["tables"][0]["name"]).Равно(TableName);

    Base = Result["id"];
    WriteParameter("Airtable_Base", Base);
    OPI_Tools.AddField("Airtable_Base", Base, "String", Parameters);

    Return Result;

EndFunction

Function Check_Airtable_GetDatabaseTables(Val Result, Val Option)

    ExpectsThat(Result["tables"]).Заполнено();
    ExpectsThat(Result["tables"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Airtable_GetListOfBases(Val Result, Val Option)

    ExpectsThat(Result["bases"]).Заполнено();
    ExpectsThat(Result["bases"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Airtable_GetNumberField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_GetStringField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_GetAttachmentField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_GetCheckboxField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_GetDateField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_GetPhoneField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_GetEmailField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_GetLinkField(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Airtable_CreateTable(Val Result, Val Option, Parameters = "", Name = "", Description = "")

    ExpectsThat(Result["name"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);

    Table = Result["id"];
    WriteParameter("Airtable_Table", Table);
    OPI_Tools.AddField("Airtable_Table", Table, "String", Parameters);

    Return Result;

EndFunction

Function Check_Airtable_ModifyTable(Val Result, Val Option, Name = "", Description = "")

    ExpectsThat(Result["name"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);

    Return Result;

EndFunction

Function Check_Airtable_CreateField(Val Result, Val Option, Parameters = "", Name = "")

    ExpectsThat(Result["name"]).Равно(Name);

    Field = Result["id"];
    WriteParameter("Airtable_Field", Field);
    OPI_Tools.AddField("Airtable_Field", Field, "String", Parameters);

    Return Result;

EndFunction

Function Check_Airtable_ModifyField(Val Result, Val Option, Name = "", Description = "")

    ExpectsThat(Result["name"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);

    Return Result;

EndFunction

Function Check_Airtable_CreatePosts(Val Result, Val Option, Parameters = "", Numeric = "", StringType = "")

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result["records"]).ИмеетТип("Array");
        ExpectsThat(Result["records"]).Заполнено();

    Else

        SingleRecord = Result["id"];
        ExpectsThat(SingleRecord).Заполнено();
        ExpectsThat(Result["createdTime"]).Заполнено();
        ExpectsThat(Result["fields"]["Number"]).Равно(Numeric);
        ExpectsThat(TrimAll(Result["fields"]["String"])).Равно(StringType);

        Record = Result["id"];
        WriteParameter("Airtable_Record", Record);
        OPI_Tools.AddField("Airtable_Record", Record, "String", Parameters);

    EndIf;

    Return Result;

EndFunction

Function Check_Airtable_GetRecord(Val Result, Val Option, Record = "")

    ExpectsThat(Result["id"]).Равно(Record);

    Return Result;

EndFunction

Function Check_Airtable_CreateComment(Val Result, Val Option, Parameters = "", Text = "")

    ExpectsThat(Result["text"]).Равно(Text);

    Comment = Result["id"];
    WriteParameter("Airtable_Comment", Comment);
    OPI_Tools.AddField("Airtable_Comment", Comment, "String", Parameters);

    Return Result;

EndFunction

Function Check_Airtable_EditComment(Val Result, Val Option, Text = "")

    ExpectsThat(Result["text"]).Равно(Text);

    Return Result;

EndFunction

Function Check_Airtable_GetComments(Val Result, Val Option)

    ExpectsThat(Result["comments"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Airtable_DeleteComment(Val Result, Val Option, Comment = "")

    ExpectsThat(Result["deleted"]).Равно(True);
    ExpectsThat(Result["id"]).Равно(Comment);

    Return Result;

EndFunction

Function Check_Airtable_GetListOfRecords(Val Result, Val Option, Comment = "")

    ExpectsThat(Result["records"]).ИмеетТип("Array");
    ExpectsThat(Result["records"]).Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_DeleteRecords(Val Result, Val Option, Comment = "")

    ExpectsThat(Result["records"]).ИмеетТип("Array");
    ExpectsThat(Result["records"]).Заполнено();

    Return Result;

EndFunction

Function Check_Twitter_GetToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Undefined;

EndFunction

Function Check_Twitter_GetAuthorizationLink(Val Result, Val Option)

    If TypeOf(Result) = Type("BinaryData") Then
        Result        = GetStringFromBinaryData(Result);
    EndIf;

    ExpectsThat(Result).ИмеетТип("String");
    ExpectsThat(StrStartsWith(Result, "https://twitter.com/i/oauth2/")).Равно(True);

    WriteParameter("Twitter_URL", Result);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Twitter_RefreshToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["access_token"]).Заполнено();
    ExpectsThat(Result["refresh_token"]).Заполнено();

    Refresh = Result["refresh_token"];
    Token   = Result["access_token"];

    If ValueIsFilled(Refresh) And Not Refresh = "null" Then
        WriteParameter("Twitter_Refresh", Refresh);
    EndIf;

    If ValueIsFilled(Token) And Not Token = "null" Then
        WriteParameter("Twitter_Token", Token);
    EndIf;

    OPI_Tools.Pause(2);

    Return Undefined;

EndFunction

Function Check_Twitter_CreateTextTweet(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Data = Result["data"];

    If Data = Undefined Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    Else

        ReplyText = Result["data"]["text"];
        ReplyText = Left(ReplyText, StrLen(Text));

        ExpectsThat(ReplyText).Равно(Text);

    EndIf;

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Twitter_CreateImageTweet(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Data = Result["data"];

    If Data = Undefined Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    Else

        ReplyText = Result["data"]["text"];
        ReplyText = Left(ReplyText, StrLen(Text));

        ExpectsThat(ReplyText).Равно(Text);

    EndIf;

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Twitter_CreateVideoTweet(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Data = Result["data"];

    If Data = Undefined Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    Else

        ReplyText = Result["data"]["text"];
        ReplyText = Left(ReplyText, StrLen(Text));

        ExpectsThat(ReplyText).Равно(Text);

    EndIf;

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Twitter_CreateGifTweet(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Data = Result["data"];

    If Data = Undefined Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    Else

        ReplyText = Result["data"]["text"];
        ReplyText = Left(ReplyText, StrLen(Text));

        ExpectsThat(ReplyText).Равно(Text);

    EndIf;

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Twitter_CreatePollTweet(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Data = Result["data"];

    If Data = Undefined Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    Else

        ReplyText = Result["data"]["text"];
        ReplyText = Left(ReplyText, StrLen(Text));

        ExpectsThat(ReplyText).Равно(Text);

    EndIf;

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Twitter_CreateCustomTweet(Val Result, Val Option, Text = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Data = Result["data"];

    If Data = Undefined Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    Else

        ReplyText = Result["data"]["text"];
        ReplyText = Left(ReplyText, StrLen(Text));

        ExpectsThat(ReplyText).Равно(Text);

    EndIf;

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Twitter_UploadAttachmentsArray(Val Result, Val Option)

    If Not TypeOf(Result) = Type("Array") Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    EndIf;

    Return Result;

EndFunction

Function Check_Notion_CreatePage(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("page");

    Page = Result["id"];
    WriteParameter("Notion_Page", Page);
    OPI_Tools.AddField("Notion_Page", Page, "String", Parameters);

    Return Result;

EndFunction

Function Check_Notion_CreateDatabase(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("database");

    Base = Result["id"];
    WriteParameter("Notion_Base", Base);
    OPI_Tools.AddField("Notion_Base", Base, "String", Parameters);

    Return Result;

EndFunction

Function Check_Notion_EditDatabaseProperties(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("database");

    Return Result;

EndFunction

Function Check_Notion_GetPage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("page");

    Return Result;

EndFunction

Function Check_Notion_GetDatabase(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("database");

    Return Result;

EndFunction

Function Check_Notion_CreatePageInDatabase(Val Result, Val Option, Base = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("page");

    Parent = Result["parent"]["database_id"];
    ExpectsThat(Parent).Равно(Base);

    Return Result;

EndFunction

Function Check_Notion_EditPageProperties(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("page");

    Return Result;

EndFunction

Function Check_Notion_ReturnBlock(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("block");

    Return Result;

EndFunction

Function Check_Notion_CreateBlock(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("list");

    Block = Result["results"][0]["id"];
    WriteParameter("Notion_NewBlock", Block);
    OPI_Tools.AddField("Notion_NewBlock", Block, "String", Parameters);

    Return Result;

EndFunction

Function Check_Notion_ReturnChildBlocks(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("list");

    Return Result;

EndFunction

Function Check_Notion_DeleteBlock(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("block");

    Return Result;

EndFunction

Function Check_Notion_UserList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("list");

    Return Result;

EndFunction

Function Check_Notion_GetUserData(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно("user");

    Return Result;

EndFunction

Function Check_Dropbox_GetAuthorizationLink(Val Result, Val Option)

    If TypeOf(Result) = Type("BinaryData") Then
        Result        = GetStringFromBinaryData(Result);
    EndIf;

    ExpectsThat(Result).ИмеетТип("String");
    ExpectsThat(StrStartsWith(Result, "https://www.dropbox.com/oauth2")).Равно(True);

    Return Result;

EndFunction

Function Check_Dropbox_GetToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Token   = Result["access_token"];
    Refresh = Result["refresh_token"];

    If ValueIsFilled(Token) Then
        WriteParameter("Dropbox_Token", Token);
    EndIf;

    If ValueIsFilled(Refresh) Then
        WriteParameter("Dropbox_Refresh", Refresh);
    EndIf;

    Return Undefined;

EndFunction

Function Check_Dropbox_RefreshToken(Val Result, Val Option)

    Token = Result["access_token"];

    ExpectsThat(Token).ИмеетТип("String").Заполнено();
    WriteParameter("Dropbox_Token", Token);

    Return Undefined;

EndFunction

Function Check_Dropbox_GetObjectInformation(Val Result, Val Option, Path = "")

    ExpectsThat(Result["path_display"]).Равно(Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_GetPreview(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 1200).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_UploadFile(Val Result, Val Option, Path = "")

    ExpectsThat(Result["path_display"]).Равно(Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_UploadFileByURL(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["async_job_id"]).Заполнено();

    Work = Result["async_job_id"];
    Parameters.Insert("Dropbox_Job", Work);
    WriteParameter("Dropbox_Job", Work);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_GetUploadStatusByURL(Val Result, Val Option, Path = "")

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result[".tag"]).Равно("complete");

        OPI_Tools.Pause(2);

    EndIf;

    If Option = "Deletion" Then
        ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);
    EndIf;

    Return Result;

EndFunction

Function Check_Dropbox_DeleteObject(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_CopyObject(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_MoveObject(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_CreateFolder(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_DownloadFile(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 2000000).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_DownloadFolder(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 200000).Равно(True);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_GetListOfFolderFiles(Val Result, Val Option)

    ExpectsThat(Result["entries"]).ИмеетТип("Array");

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_GetObjectVersionList(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entries"]).ИмеетТип("Array");
    ExpectsThat(Result["entries"].Count()).Равно(1);

    Revision = Result["entries"][0]["rev"];

    Parameters.Insert("Dropbox_FileRevision", Revision);
    WriteParameter("Dropbox_FileRevision", Revision);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_RestoreObjectToVersion(Val Result, Val Option, Path = "")

    ExpectsThat(Result["path_display"]).Равно(Path);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_GetTagList(Val Result, Val Option, Parameters = "", PathsArray = "")

    ExpectsThat(Result["paths_to_tags"]).ИмеетТип("Array");
    ExpectsThat(Result["paths_to_tags"].Count()).Равно(PathsArray.Count());

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_AddTag(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_DeleteTag(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_GetAccountInformation(Val Result, Val Option)

    ExpectsThat(Result["account_id"]).Заполнено();

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_GetSpaceUsageData(Val Result, Val Option)

    ExpectsThat(Result["used"]).Заполнено();

    Return Result;

EndFunction

Function Check_Dropbox_AddUsersToFile(Val Result, Val Option, Email = "", ViewOnly = "")

    ExpectsThat(Result[0]["result"][".tag"]).Равно("success");
    ExpectsThat(Result[0]["member"]["email"]).Равно(Email);
    ExpectsThat(Result[0]["result"]["success"][".tag"]).Равно(?(ViewOnly, "viewer", "editor"));

    Return Result;

EndFunction

Function Check_Dropbox_PublishFolder(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["shared_folder_id"]).Заполнено();

    FolderID = Result["shared_folder_id"];

    Parameters.Insert("Dropbox_SharedFolder", FolderID);
    WriteParameter("Dropbox_SharedFolder", FolderID);

    OPI_Tools.Pause(2);

    Return Result;

EndFunction

Function Check_Dropbox_CancelFolderPublication(Val Result, Val Option, Parameters = "", JobID = "")

    If ValueIsFilled(Option) Then

        ExpectsThat(Result[".tag"]).Равно("complete");

        Parameters.Insert("Dropbox_NewJobID", JobID);
        WriteParameter("Dropbox_NewJobID", JobID);

        OPI_Tools.Pause(2);

    EndIf;

    Return Result;

EndFunction

Function Check_Dropbox_GetAsynchronousChangeStatus(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_Dropbox_AddUsersToFolder(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_Dropbox_CancelFilePublication(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_Bitrix24_GetAppAuthLink(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String");

    WriteParameter("Bitrix24_AuthURL", Result);

    Return Result;

EndFunction

Function Check_Bitrix24_GetToken(Val Result, Val Option)

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then

        WriteParameter("Bitrix24_Token"  , Result["access_token"]);
        WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);

    EndIf;

    Return Undefined;

EndFunction

Function Check_Bitrix24_RefreshToken(Val Result, Val Option)

    ExpectsThat(Result["access_token"]).Заполнено();
    ExpectsThat(Result["refresh_token"]).Заполнено();

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then

        WriteParameter("Bitrix24_Token"  , Result["access_token"]);
        WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);

    EndIf;

    Return Undefined;

EndFunction

Function Check_Bitrix24_ServerTime(Val Result, Val Option)

    Time = Result["result"];

    If Not TypeOf(Time) = Type("Date") Then
        Time            = XMLValue(Type("Date"), Time);
    EndIf;

    ExpectsThat(Time).ИмеетТип("Date").Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CreatePost(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookPostID";
    Else
        ParameterName = "Bitrix24_PostID";
    EndIf;

    PostID = Result["result"];

    WriteParameter(ParameterName, PostID);
    Parameters.Insert(ParameterName, PostID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdatePost(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeletePost(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetImportantPostViewers(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetPosts(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_AddPostComment(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_AddPostRecipients(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetTaskFieldsStructure(Val Result, Val Option)

    ExpectsThat(Result["result"]["fields"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CreateTask(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]["task"]).Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookTaskID";
    Else
        ParameterName = "Bitrix24_TaskID";
    EndIf;

    TaskID = Result["result"]["task"]["id"];

    WriteParameter(ParameterName, TaskID);
    Parameters.Insert(ParameterName, TaskID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_ApproveTask(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["error"]).Равно("1048582");

    Return Undefined;

EndFunction

Function Check_Bitrix24_DisapproveTask(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["error"]).Равно("1048582");

    Return Undefined;

EndFunction

Function Check_Bitrix24_CompleteTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_RenewTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeferTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_StartTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_StartWatchingTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_StopWatchingTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_PauseTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DelegateTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_AddTaskToFavorites(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_RemoveTaskFromFavorites(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetTaskHistory(Val Result, Val Option)

    ExpectsThat(Result["result"]["list"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetTasksList(Val Result, Val Option)

    ExpectsThat(Result["result"]["tasks"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetStoragesList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["total"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetAppStorage(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    StorageID = Result["result"]["ID"];
    WriteParameter("Bitrix24_StorageID", StorageID);
    Parameters.Insert("Bitrix24_StorageID", StorageID);

    Return Result;

EndFunction

Function Check_Bitrix24_UploadFileToStorage(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookFileID";
    Else
        ParameterName = "Bitrix24_FileID";
    EndIf;

    FileID = Result["result"]["ID"];

    WriteParameter(ParameterName, FileID);
    Parameters.Insert(ParameterName, FileID);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteFile(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_CreateStorageFolder(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookFolderID";
    Else
        ParameterName = "Bitrix24_FolderID";
    EndIf;

    FolderID = Result["result"]["ID"];

    WriteParameter(ParameterName, FolderID);
    Parameters.Insert(ParameterName, FolderID);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteFolder(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetStorage(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetStorageObjects(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_RenameStorage(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetFolderInformation(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CreateSubfolder(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookSubfolderID";
    Else
        ParameterName = "Bitrix24_SubfolderID";
    EndIf;

    SubfolderID = Result["result"]["ID"];

    WriteParameter(ParameterName, SubfolderID);
    Parameters.Insert(ParameterName, SubfolderID);

    Return Result;

EndFunction

Function Check_Bitrix24_MakeFolderCopy(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetFolderExternalLink(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetFolderFilterStructure(Val Result, Val Option)

    ResultType = TypeOf(Result);

    ExpectsThat(ResultType = Type("Structure") Or ResultType = Type("Map")).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetFolderItems(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_MarkFolderAsDeleted(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_RestoreFolder(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_MoveFolder(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_RenameFolder(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_UploadFileToFolder(Val Result, Val Option, URL = "", Token = "")

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_MakeFileCopy(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetFileInformation(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetFileExternalLink(Val Result, Val Option)

    Return Undefined;

EndFunction

Function Check_Bitrix24_MarkFileAsDeleted(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_RestoreFile(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_RenameFile(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_MoveFileToFolder(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_AttachFileToTopic(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["attachmentId"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CheckTaskAccesses(Val Result, Val Option, Count = "")

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Actions = Result["result"]["allowedActions"];
    ExpectsThat(Actions).ИмеетТип("Map");
    ExpectsThat(Actions.Count()).Равно(Count);

    Return Result;

EndFunction

Function Check_Bitrix24_MuteTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_UnmuteTask(Val Result, Val Option)

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_AddTaskComment(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookCommentID";
    Else
        ParameterName = "Bitrix24_CommentID";
    EndIf;

    CommentID = Result["result"];

    WriteParameter(ParameterName, CommentID);
    Parameters.Insert(ParameterName, CommentID);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteTaskComment(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_CreateResultFromComment(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["text"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteResultFromComment(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Undefined");
    ExpectsThat(Result["time"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetResultsList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["text"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetTaskCommentsList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["POST_MESSAGE"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetTaskComment(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateTaskComment(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(StrFind(Result["error_description"], "not allowed") > 0).Равно(True);

    Return Undefined;

EndFunction

Function Check_Bitrix24_CreateTasksDependencies(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteTasksDependencies(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_AddKanbanStage(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookStageID";
    Else
        ParameterName = "Bitrix24_StageID";
    EndIf;

    StageID = Result["result"];

    WriteParameter(ParameterName, StageID);
    Parameters.Insert(ParameterName, StageID);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteKanbanStage(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetKanbanStages(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Return Result;

EndFunction

Function Check_Bitrix24_MoveTaskToKanbanStage(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateKanbansStage(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_AddTasksChecklistElement(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookCheckElementID";
    Else
        ParameterName = "Bitrix24_CheckElementID";
    EndIf;

    ElementID = Result["result"];

    WriteParameter(ParameterName, ElementID);
    Parameters.Insert(ParameterName, ElementID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateTasksChecklistElement(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Undefined");
    ExpectsThat(Result["time"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteTasksChecklistElement(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetTasksChecklist(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetTasksChecklistElement(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CompleteTasksChecklistElement(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_RenewTasksChecklistElement(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_AddTaskTimeAccounting(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookTimeID";
    Else
        ParameterName = "Bitrix24_TimeID";
    EndIf;

    SpendingID = Result["result"];

    WriteParameter(ParameterName, SpendingID);
    Parameters.Insert(ParameterName, SpendingID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateTaskTimeAccounting(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Undefined");
    ExpectsThat(Result["time"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteTaskTimeAccounting(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Undefined");
    ExpectsThat(Result["time"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetTaskTimeAccounting(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetTaskTimeAccountingList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetDailyPlan(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_CreateChat(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookChatID";
    Else
        ParameterName = "Bitrix24_ChatID";
    EndIf;

    ChatID = Result["result"];

    WriteParameter(ParameterName, ChatID);
    Parameters.Insert(ParameterName, ChatID);

    Return Result;

EndFunction

Function Check_Bitrix24_GetChatUsers(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_LeaveChat(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteUserFromChat(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_AddUsersToChat(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_ChangeChatTitle(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_ChangeChatColor(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    OPI_Tools.Pause(10);

    Return Result;

EndFunction

Function Check_Bitrix24_ChangeChatPicture(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_DisableChatNotifications(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_EnableChatNotifications(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_ChangeChatOwner(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetChatMessagesList(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]["messages"]).ИмеетТип("Array");

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_ChatMessageID";
    Else
        ParameterName = "Bitrix24_UserMessageID";
    EndIf;

    MessageID = Result["result"]["messages"][0]["id"];

    WriteParameter(ParameterName, MessageID);
    Parameters.Insert(ParameterName, MessageID);

    Return Result;

EndFunction

Function Check_Bitrix24_MarkMessageAsReaded(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Return Undefined;

EndFunction

Function Check_Bitrix24_MarkMessageAsUnreaded(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetDialog(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["id"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetChatMembersList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_SendWritingNotification(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_ReadAll(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_SendMessage(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_ChatMessageID";
    Else
        ParameterName = "Bitrix24_UserMessageID";
    EndIf;

    MessageID = Result["result"];

    WriteParameter(ParameterName, MessageID);
    Parameters.Insert(ParameterName, MessageID);

    Return Result;

EndFunction

Function Check_Bitrix24_EditMessage(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteMessage(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_SetMessageReaction(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetChatFilesFolder(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_SendFile(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["MESSAGE_ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetUsers(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Return Result;

EndFunction

Function Check_Bitrix24_GetUserStatus(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_SetUserStatus(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_CreatePersonalNotification(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_PersoalHookNotifyID";
    Else
        ParameterName = "Bitrix24_PersoalNotifyID";
    EndIf;

    MessageID = Result["result"];

    WriteParameter(ParameterName, MessageID);
    Parameters.Insert(ParameterName, MessageID);

    Return Result;

EndFunction

Function Check_Bitrix24_CreateSystemNotification(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_SystemHookNotifyID";
    Else
        ParameterName = "Bitrix24_SystemNotifyID";
    EndIf;

    MessageID = Result["result"];

    WriteParameter(ParameterName, MessageID);
    Parameters.Insert(ParameterName, MessageID);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteNotification(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean");

    Return Result;

EndFunction

Function Check_Bitrix24_CreateDepartment(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookDepID";
    Else
        ParameterName = "Bitrix24_DepID";
    EndIf;

    DepartmentID = Result["result"];

    WriteParameter(ParameterName, DepartmentID);
    Parameters.Insert(ParameterName, DepartmentID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateDepartment(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteDepartment(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetDepartments(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetCurrentUser(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetUserFieldsStructure(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CreateUser(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookUserID";
    Else
        ParameterName = "Bitrix24_UserID";
    EndIf;

    UserID = Result["result"];

    WriteParameter(ParameterName, UserID);
    Parameters.Insert(ParameterName, UserID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateUser(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_ChangeUserStatus(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetUser(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_FindUsers(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetLeadFilterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetLeadStructure(Val Result, Val Option)

    ExpectsThat(Result["result"]["PHONE"]).Заполнено();
    ExpectsThat(Result["result"]["NAME"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CreateLead(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookLeadID";
    Else
        ParameterName = "Bitrix24_LeadID";
    EndIf;

    LeadID = Result["result"];

    WriteParameter(ParameterName, LeadID);
    Parameters.Insert(ParameterName, LeadID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateLead(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteLead(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetLead(Val Result, Val Option)

    ExpectsThat(Result["result"]["PHONE"]).Заполнено();
    ExpectsThat(Result["result"]["NAME"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetLeadsList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetDealsFilterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetDealStructure(Val Result, Val Option)

    ExpectsThat(Result["result"]["ID"]).Заполнено();
    ExpectsThat(Result["result"]["BEGINDATE"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_CreateDeal(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookDealID";
    Else
        ParameterName = "Bitrix24_DealID";
    EndIf;

    DealID = Result["result"];

    WriteParameter(ParameterName, DealID);
    Parameters.Insert(ParameterName, DealID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateDeal(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetDeal(Val Result, Val Option)

    ExpectsThat(Result["result"]["ID"]).Заполнено();
    ExpectsThat(Result["result"]["BEGINDATE"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteDeal(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetDealsList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetTasksFilterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetCommentStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetChatStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetPictureBlock(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetFileBlock(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetUserFilterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_CreateCalendar(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookCalendarID";
    Else
        ParameterName = "Bitrix24_CalendarID";
    EndIf;

    CalendarID = Result["result"];

    WriteParameter(ParameterName, CalendarID);
    Parameters.Insert(ParameterName, CalendarID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateCalendar(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteCalendar(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalendarStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalendarList(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalendarSettingsStructure(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalednarCustomSettingsStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_Bitrix24_GetCustomCalendarSettings(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Return Result;

EndFunction

Function Check_Bitrix24_SetCustomCalendarSettings(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetUserBusy(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Return Result;

EndFunction

Function Check_Bitrix24_CreateCalendarEvent(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookCEventID";
    Else
        ParameterName = "Bitrix24_CEventID";
    EndIf;

    EventID = Result["result"];

    WriteParameter(ParameterName, EventID);
    Parameters.Insert(ParameterName, EventID);

    Return Result;

EndFunction

Function Check_Bitrix24_UpdateCalendarEvent(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();

    If Option         = "Hook" Then
        ParameterName = "Bitrix24_HookCEventID";
    Else
        ParameterName = "Bitrix24_CEventID";
    EndIf;

    EventID = Result["result"];

    WriteParameter(ParameterName, EventID);
    Parameters.Insert(ParameterName, EventID);

    Return Result;

EndFunction

Function Check_Bitrix24_DeleteCalendarEvent(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalendarEvent(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalendarEvents(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Bitrix24_SetUserParticipationStatus(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

EndFunction

Function Check_Bitrix24_GetUserParticipationStatus(Val Result, Val Option)

    ExpectsThat(Result["result"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalendarEventsStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_Bitrix24_GetCalendarEventsFilterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_VKTeams_CheckToken(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["userId"]).Заполнено();

    Return Result;

EndFunction

Function Check_VKTeams_GetEvents(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["events"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_VKTeams_SendTextMessage(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["msgId"]).Заполнено();

    If Not ValueIsFilled(Option) Then

        MessageID = Result["msgId"];
        WriteParameter("VkTeams_MessageID", MessageID);
        Parameters.Insert("VkTeams_MessageID", MessageID);

    EndIf;

    Return Result;

EndFunction

Function Check_VKTeams_ForwardMessage(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["msgId"]).Заполнено();

    Return Result;

EndFunction

Function Check_VKTeams_SendFile(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["msgId"]).Заполнено();

    If Not ValueIsFilled(Option) Then

        FileID = Result["fileId"];
        WriteParameter("VkTeams_FileID", FileID);
        Parameters.Insert("VkTeams_FileID", FileID);

        OPI_Tools.Pause(2);

    EndIf;

    Return Result;

EndFunction

Function Check_VKTeams_ResendFile(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["msgId"]).Заполнено();

    Return Result;

EndFunction

Function Check_VKTeams_GetFileInformation(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["type"]).Заполнено();
    ExpectsThat(Result["size"]).Заполнено();

    Return Result;

EndFunction

Function Check_VKTeams_EditMessageText(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_DeleteMessage(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_SendVoice(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["msgId"]).Заполнено();

    If Not ValueIsFilled(Option) Then

        FileID = Result["fileId"];
        WriteParameter("VkTeams_VoiceID", FileID);
        Parameters.Insert("VkTeams_VoiceID", FileID);

        OPI_Tools.Pause(2);

    EndIf;

    Return Result;

EndFunction

Function Check_VKTeams_ResendVoice(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["msgId"]).Заполнено();

    Return Result;

EndFunction

Function Check_VKTeams_RemoveChatMembers(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_ChangeChatPicture(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_GetChatInfo(Val Result, Val Option)

    ExpectsThat(Result["type"]).Заполнено();
    ExpectsThat(Result["inviteLink"]).Заполнено();

    Return Result;

EndFunction

Function Check_VKTeams_GetChatAdmins(Val Result, Val Option)

    ExpectsThat(Result["admins"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_VKTeams_GetChatMembers(Val Result, Val Option)

    ExpectsThat(Result["members"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_VKTeams_GetChatBlockedUsers(Val Result, Val Option)

    ExpectsThat(Result["users"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_VKTeams_GetChatJoinRequests(Val Result, Val Option)

    ExpectsThat(Result["users"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_VKTeams_BlockChatUser(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_UnblockChatUser(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_PinMessage(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_UnpinMessage(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_ApprovePending(Val Result, Val Option)

    If Not Result["ok"] Then
        ExpectsThat(Result["description"]).Равно("User is not pending or nobody in pending list");
    EndIf;

    Return Result;

EndFunction

Function Check_VKTeams_DisapprovePending(Val Result, Val Option)

    If Not Result["ok"] Then
        ExpectsThat(Result["description"]).Равно("User is not pending or nobody in pending list");
    EndIf;

    Return Result;

EndFunction

Function Check_VKTeams_SetChatTitle(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_SetChatDescription(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_SetChatRules(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_VKTeams_AnswerButtonEvent(Val Result, Val Option)

    ExpectsThat(Result["ok"]).Равно(True);

    Return Result;

EndFunction

Function Check_Neocities_UploadFile(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно("success");

    Return Result;

EndFunction

Function Check_Neocities_UploadFiles(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно("success");

    Return Result;

EndFunction

Function Check_Neocities_DeleteSelectedFiles(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно("success");

    Return Result;

EndFunction

Function Check_Neocities_GetFilesList(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно("success");

    Return Result;

EndFunction

Function Check_Neocities_GetSiteData(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно("success");

    Return Result;

EndFunction

Function Check_Neocities_GetToken(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно("success");

    Return Result;

EndFunction

Function Check_Neocities_SynchronizeFolders(Val Result, Val Option)

    ExpectsThat(Result["errors"]).Равно(0);
    ExpectsThat(Result["items"].Count()).Равно(0);

    Return Result;

EndFunction

Function Check_CDEK_GetToken(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["access_token"]).Заполнено();
    ExpectsThat(Result["expires_in"]).Заполнено();
    ExpectsThat(Result["token_type"]).Заполнено();

    Token = Result["access_token"];
    WriteParameter("CDEK_Token", Token);
    OPI_Tools.AddField("CDEK_Token", Token, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetOrderDescription(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_CreateOrder(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    UUID = Result["entity"]["uuid"];
    WriteParameter("CDEK_OrderUUID", UUID);
    OPI_Tools.AddField("CDEK_OrderUUID", UUID, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetOrder(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["entity"]["number"]).Заполнено();

    IMNumber = Result["entity"]["number"];
    WriteParameter("CDEK_OrderIMN", IMNumber);
    OPI_Tools.AddField("CDEK_OrderIMN", IMNumber, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetOrderByNumber(Val Result, Val Option)

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["entity"]["number"]).Заполнено();

    Return Result;

EndFunction

Function Check_CDEK_UpdateOrder(Val Result, Val Option)

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_DeleteOrder(Val Result, Val Option)

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_CreateCustomerRefund(Val Result, Val Option)

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_CreateRefusal(Val Result, Val Option)

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_GetCourierInvitationsDescription(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_CreateCourierInvitation(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    UUID = Result["entity"]["uuid"];
    WriteParameter("CDEK_IntakeUUID", UUID);
    OPI_Tools.AddField("CDEK_IntakeUUID", UUID, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetCourierInvitation(Val Result, Val Option)

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_DeleteCourierInvitation(Val Result, Val Option)

    // ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    // ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    // Status = Result["requests"][0]["state"];

    // ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    Return Undefined;

EndFunction

Function Check_CDEK_CreateReceipt(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    UUID = Result["entity"]["uuid"];
    WriteParameter("CDEK_PrintUUID", UUID);
    OPI_Tools.AddField("CDEK_PrintUUID", UUID, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetReceipt(Val Result, Val Option)

    ExpectsThat(Result["entity"]["statuses"][0]["code"]).Равно("ACCEPTED");
    ExpectsThat(Result["entity"]["copy_count"]).Равно(1);

    Return Result;

EndFunction

Function Check_CDEK_CreateBarcode(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    UUID = Result["entity"]["uuid"];
    WriteParameter("CDEK_BarcodeUUID", UUID);
    OPI_Tools.AddField("CDEK_BarcodeUUID", UUID, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetBarcode(Val Result, Val Option)

    ExpectsThat(Result["entity"]["statuses"][0]["code"]).Равно("ACCEPTED");
    ExpectsThat(Result["entity"]["copy_count"]).Равно(1);

    Return Result;

EndFunction

Function Check_CDEK_GetAvailableDeliveryIntervals(Val Result, Val Option)

    ExpectsThat(Result["date_intervals"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_CDEK_GetAppointmentDescription(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_RegisterDeliveryAppointment(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    UUID = Result["entity"]["uuid"];
    WriteParameter("CDEK_ApptUUID", UUID);
    OPI_Tools.AddField("CDEK_ApptUUID", UUID, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetDeliveryAppointment(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_CreatePrealert(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    UUID = Result["entity"]["uuid"];
    WriteParameter("CDEK_PrealertUUID", UUID);
    OPI_Tools.AddField("CDEK_PrealertUUID", UUID, "String", Parameters);

    Return Result;

EndFunction

Function Check_CDEK_GetPrealert(Val Result, Val Option)

    ExpectsThat(Result["entity"]["shipment_point"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_GetPassportDataStatus(Val Result, Val Option)

    ExpectsThat(Result["orders"][0]["passport"][0]["client"]).Равно("SENDER");
    ExpectsThat(Result["orders"][0]["passport"][1]["client"]).Равно("RECEIVER");

    Return Result;

EndFunction

Function Check_CDEK_GetCashboxCheck(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_GetCashboxChecksByDate(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_GetDeliveryCashRegistry(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_GetDeliveryCashTransfers(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_GetOfficeFilterDescription(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_CDEK_GetOfficeList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_CDEK_GetRegionsList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_YandexMetrika_GetTagsList(Val Result, Val Option)

    ExpectsThat(Result["labels"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_YandexMetrika_CreateTag(Val Result, Val Option, Parameters = "", Name = "")

    ExpectsThat(Result["label"]).ИмеетТип("Map");
    ExpectsThat(Result["label"]["id"]).Заполнено();

    If ValueIsFilled(Name) Then
        ExpectsThat(Result["label"]["name"]).Равно(Name);
    EndIf;

    TagID = Result["label"]["id"];
    WriteParameter("Metrika_LabelID", TagID);
    OPI_Tools.AddField("Metrika_LabelID", TagID, "String", Parameters);

    Return Result;

EndFunction

Function Check_YandexMetrika_DeleteTag(Val Result, Val Option)

    ExpectsThat(Result["success"]).Равно(True);

    Return Result;

EndFunction

Function Check_YandexMetrika_UpdateTag(Val Result, Val Option, Name = "")

    ExpectsThat(Result["label"]).ИмеетТип("Map");
    ExpectsThat(Result["label"]["id"]).Заполнено();

    If ValueIsFilled(Name) Then
        ExpectsThat(Result["label"]["name"]).Равно(Name);
    EndIf;

    Return Result;

EndFunction

Function Check_YandexMetrika_GetTag(Val Result, Val Option)

    ExpectsThat(Result["label"]).ИмеетТип("Map");
    ExpectsThat(Result["label"]["id"]).Заполнено();

    Return Result;

EndFunction

Function Check_YandexMetrika_GetCounterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_YandexMetrika_CreateCounter(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["counter"]).ИмеетТип("Map").Заполнено();

    CounterID = Result["counter"]["id"];
    WriteParameter("Metrika_CounterID", CounterID);
    OPI_Tools.AddField("Metrika_CounterID", CounterID, "String", Parameters);

    Return Result;

EndFunction

Function Check_YandexMetrika_DeleteCounter(Val Result, Val Option)

    ExpectsThat(Result["success"]).Равно(True);

    Return Result;

EndFunction

Function Check_YandexMetrika_UpdateCounter(Val Result, Val Option)

    ExpectsThat(Result["counter"]).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_YandexMetrika_GetCounter(Val Result, Val Option)

    ExpectsThat(Result["counter"]).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_YandexMetrika_RestoreCounter(Val Result, Val Option)

    ExpectsThat(Result["success"]).Равно(True);

    Return Result;

EndFunction

Function Check_YandexMetrika_GetCountersList(Val Result, Val Option)

    ExpectsThat(Result["counters"]).ИмеетТип("Array").Заполнено();

    Return Result;

EndFunction

Function Check_YandexMetrika_GetActionsList(Val Result, Val Option)

    ExpectsThat(Result["operations"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_S3_GetBasicDataStructure(Val Result, Val Option)

    Result["SecretKey"] = "***";

    Return Result;

EndFunction

Function Check_S3_SendRequestWithoutBody(Val Result, Val Option)

    Return Undefined;

EndFunction

Function Check_S3_SendRequestWithBody(Val Result, Val Option)

    Return Undefined;

EndFunction

Function Check_S3_CreateBucket(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        Success = Result["status"] >= 200 And Result["status"] < 300;
        ExpectsThat(Success).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_S3_DeleteBucket(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_ListBuckets(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_HeadBucket(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_GetBucketEncryption(Val Result, Val Option)

    Return Undefined;

EndFunction

Function Check_S3_DeleteBucketEncryption(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_PutBucketEncryption(Val Result, Val Option)

    Success = Result["status"] = 501;
    ExpectsThat(Success).Равно(True);

    Return Undefined;

EndFunction

Function Check_S3_GetBucketTagging(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_PutBucketTagging(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_DeleteBucketTagging(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_GetBucketVersioning(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_PutBucketVersioning(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_PutObject(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_UploadFullObject(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_DeleteObject(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_HeadObject(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_CopyObject(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_PutObjectTagging(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_GetObjectTagging(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_DeleteObjectTagging(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_ListObjects(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_ListObjectVersions(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_GetObject(Val Result, Val Option, Size = "")

    If Option = "File" Or Option = "Big file" Then

        If Not TypeOf(Result) = Type("BinaryData") Then

            Result = New File(Result);
            ExpectsThat(Result).ИмеетТип("File");
            ExpectsThat(Result.Exists()).Равно(True);

        EndIf;

    Else
        ExpectsThat(Result).ИмеетТип("BinaryData");
    EndIf;

    ExpectsThat(Result.Size() >= Size).Равно(True);

    Return Result;

EndFunction

Function Check_S3_InitPartsUpload(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_FinishPartsUpload(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_UploadObjectPart(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_AbortMultipartUpload(Val Result, Val Option)

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

    Return Result;

EndFunction

Function Check_S3_GetObjectDownloadLink(Val Result, Val Option, Size = "")

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result).ИмеетТип("String");
    Else
        ExpectsThat(Result).ИмеетТип("BinaryData");
        ExpectsThat(Result.Size() >= Size).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_S3_GetObjectUploadLink(Val Result, Val Option, Size = "")

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result).ИмеетТип("String");
    ElsIf Option = "Check" Then
        ExpectsThat(Number(Result["headers"]["Content-Length"])).Равно(Size);
    EndIf;

    Return Result;

EndFunction

Function Check_ReportPortal_GetTemporaryToken(Val Result, Val Option, Parameters = "")

    Token = Result["access_token"];

    ExpectsThat(Token).Заполнено();

    WriteParameter("RPortal_TempToken", Token);
    Parameters.Insert("RPortal_TempToken", Token);

    Return Result;

EndFunction

Function Check_ReportPortal_GetPermanentToken(Val Result, Val Option, Parameters = "")

    Token = Result["api_key"];
    UID   = Result["id"];

    ExpectsThat(Token).Заполнено();

    WriteParameter("RPortal_TestApiKey", Token);
    Parameters.Insert("RPortal_TestApiKey", Token);

    WriteParameter("RPortal_TestKeyID", UID);
    Parameters.Insert("RPortal_TestKeyID", UID);

    Return Result;

EndFunction

Function Check_ReportPortal_DeletePermanentToken(Val Result, Val Option)

    Response = Result["message"];
    ExpectsThat(StrEndsWith(Response, "was successfully deleted.")).Равно(True);

    Return Result;

EndFunction

Function Check_TCP_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_TCP_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));

    ExpectsThat(Result).Равно("AddIn.OPI_TCPClient.Main");

    Return Result;

EndFunction

Function Check_TCP_ReadBinaryData(Val Result, Val Option, Message = "")

    Result = GetStringFromBinaryData(Result);

    ExpectsThat(Result).Равно(Message);

    Return Result;

EndFunction

Function Check_TCP_SendBinaryData(Val Result, Val Option, Message = "")

    Result = GetStringFromBinaryData(Result);

    ExpectsThat(Result).Равно(Message);

    Return Result;

EndFunction

Function Check_TCP_ProcessRequest(Val Result, Val Option, Message = "")

    ExpectsThat(Result).Равно(Message);

    Return Result;

EndFunction

Function Check_TCP_ReadLine(Val Result, Val Option, Message = "")

    ExpectsThat(Result).Равно(Message);

    Return Result;

EndFunction

Function Check_TCP_SendLine(Val Result, Val Option, Message = "")

    ExpectsThat(Result).Равно(Message);

    Return Result;

EndFunction

Function Check_TCP_GetTlsSettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_TCP_GetLastError(Val Result, Val Option)

    Return Result;

EndFunction

Function Check_TCP_GetProxySettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Result["password"] = "***";

    Return Result;

EndFunction

Function Check_SQLite_CreateConnection(Val Result, Val Option)

    If Option  = "Closing" Then
        ExpectsThat(Result["result"]).Равно(True);
    Else
        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_SQLite.Main");
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_CloseConnection(Val Result, Val Option)

    If Option  = "Openning" Then
        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_SQLite.Main");
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_ExecuteSQLQuery(Val Result, Val Option, Image = "")

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result["result"]).Равно(True);

        Blob                              = Result["data"][0]["data"]["blob"];
        Result["data"][0]["data"]["blob"] = "Base64";

        ExpectsThat(Base64Value(Blob).Size()).Равно(Image.Size());

    ElsIf Option = "Openning" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_SQLite.Main");

    ElsIf Option = "Extension" Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(1);

    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_IsConnector(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_SQLite_CreateTable(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_SQLite_AddRecords(Val Result, Val Option)

    If Option                      = "Field error" Or Option = "JSON Error" Then
        ExpectsThat(Result["result"]).Равно(False);
    ElsIf Option                   = "Error without transaction" Then
        ExpectsThat(Result["rows"] = 1 Or Result["rows"] = 2).Равно(True);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_GetRecords(Val Result, Val Option)

    If Option = "Error" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_UpdateRecords(Val Result, Val Option, FieldsStructure = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        Check = Result["data"][0];

        For Each Value In FieldsStructure Do
            Check[Value.Key] = Value.Value;
        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_DeleteRecords(Val Result, Val Option)

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(0);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_GetTableInformation(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_SQLite_GetRecordsFilterStrucutre(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_DeleteTable(Val Result, Val Option)

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(0);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_ClearTable(Val Result, Val Option)

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count()).Равно(0);

    ElsIf Option = "Table" Then

        ExpectsThat(Result["data"].Count()).Равно(5);

    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_ConnectExtension(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(1);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_AddTableColumn(Val Result, Val Option)

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["name"] = "new_col" Then

                ExpectsThat(Coloumn["type"]).Равно("TEXT");
                Found = True;

            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(True);

    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_DeleteTableColumn(Val Result, Val Option)

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["name"] = "new_col" Then

                Found = True;

            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(False);

    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SQLite_EnsureTable(Val Result, Val Option, ColoumnsStruct = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Not ValueIsFilled(Option) Or Option = "New" Then

        ExpectsThat(Result["commit"]["result"]).Равно(True);

    Else

        ExpectsThat(Result["data"].Count()).Равно(ColoumnsStruct.Count());

        For Each Coloumn In Result["data"] Do
            ExpectsThat(Coloumn["type"]).Равно(ColoumnsStruct[Coloumn["name"]]);
        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_GenerateConnectionString(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_PostgreSQL_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));
    ExpectsThat(Result).Равно("AddIn.OPI_PostgreSQL.Main");

    Return Result;

EndFunction

Function Check_PostgreSQL_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_PostgreSQL_IsConnector(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_PostgreSQL_ExecuteSQLQuery(Val Result, Val Option, Image = "")

    If Option = "Connection" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_PostgreSQL.Main");

    ElsIf ValueIsFilled(Option) Then

        ExpectsThat(Result["result"]).Равно(True);

    Else

        Blob = Result["data"][0]["data"]["BYTEA"];

        Result["data"][0]["data"]["BYTEA"] = "Base64";
        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Base64Value(Blob).Size()).Равно(Image.Size());

    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_CreateDatabase(Val Result, Val Option)

    If Option = "Openning" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_PostgreSQL.Main");

    ElsIf Option = "Existing" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_CreateTable(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result["result"]).Равно(True);
    Else
        ExpectsThat(Result["result"]).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_GetTableInformation(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result["data"].Count()).Равно(26);
    Else
        ExpectsThat(Result["data"].Count()).Равно(0);
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_AddRecords(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_PostgreSQL_GetRecords(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Not ValueIsFilled(Option) Then

        If ValueIsFilled(Result["data"]) Then
            Result["data"][0]["bytea_field"]["BYTEA"] = Left(Result["data"][0]["bytea_field"]["BYTEA"], 10) + "...";
        EndIf;

    Else
        ExpectsThat(Result["data"].Count()).Равно(5);
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_UpdateRecords(Val Result, Val Option, Count = "", FieldsStructure = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count()).Равно(Count);

        For N = 0 To Result["data"].UBound() Do

            For Each Value In FieldsStructure Do
                Result["data"][N][Value.Key] = Value.Value;
            EndDo;

        EndDo;
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_DeleteRecords(Val Result, Val Option, Count = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(Count);
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_DeleteTable(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_PostgreSQL_DeleteDatabase(Val Result, Val Option)

    If Option = "Openning" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_PostgreSQL.Main");

    ElsIf Option = "Error" Or Option = "Connection error" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_ClearTable(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(0);
    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_DisableAllDatabaseConnections(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_PostgreSQL_GetRecordsFilterStrucutre(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_GetTLSSettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_PostgreSQL_AddTableColumn(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["column_name"] = "new_field" Then
                ExpectsThat(Lower(Coloumn["data_type"])).Равно("text");
                Found                 = True;
            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(True);

    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_DeleteTableColumn(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["column_name"] = "new_field" Then
                Found                 = True;
            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(False);

    EndIf;

    Return Result;

EndFunction

Function Check_PostgreSQL_EnsureTable(Val Result, Val Option, ColoumnsStruct = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count()).Равно(ColoumnsStruct.Count());

        For Each Coloumn In Result["data"] Do
            ExpectsThat(Lower(Coloumn["data_type"])).Равно(Lower(ColoumnsStruct[Coloumn["column_name"]]));
        EndDo;

    Else
        ExpectsThat(Result["commit"]["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_GenerateConnectionString(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_MySQL_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));
    ExpectsThat(Result).Равно("AddIn.OPI_MySQL.Main");

    Return Result;

EndFunction

Function Check_MySQL_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MySQL_IsConnector(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_MySQL_ExecuteSQLQuery(Val Result, Val Option, Image = "")

    If Option = "Connection" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MySQL.Main");

    ElsIf ValueIsFilled(Option) Then

        ExpectsThat(Result["result"]).Равно(True);

    Else

        Blob = Result["data"][0]["data"]["BYTES"];

        Result["data"][0]["data"]["BYTES"] = "Base64";
        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Base64Value(Blob).Size()).Равно(Image.Size());

    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_CreateDatabase(Val Result, Val Option)

    If Option = "Openning" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MySQL.Main");

    ElsIf Option = "Existing" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_CreateTable(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result["result"]).Равно(True);
    Else
        ExpectsThat(Result["result"]).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_AddRecords(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MySQL_GetRecords(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Not ValueIsFilled(Option) Then

        If ValueIsFilled(Result["data"]) Then

            Result["data"][0]["mediumblob_field"]["BYTES"] =
                Left(Result["data"][0]["mediumblob_field"]["BYTES"], 10) + "...";

        EndIf;

    Else
        ExpectsThat(Result["data"].Count()).Равно(5);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_UpdateRecords(Val Result, Val Option, Count = "", FieldsStructure = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count()).Равно(Count);

        For N = 0 To Result["data"].UBound() Do

            For Each Value In FieldsStructure Do
                Result["data"][N][Value.Key] = Value.Value;
            EndDo;

        EndDo;
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_DeleteRecords(Val Result, Val Option, Count = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(Count);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_DeleteTable(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MySQL_DeleteDatabase(Val Result, Val Option)

    If Option = "Openning" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MySQL.Main");

    ElsIf Option = "Error" Or Option = "Connection error" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_ClearTable(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(0);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_GetRecordsFilterStrucutre(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_GetTLSSettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_MySQL_GetTableInformation(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result["data"].Count()).Равно(20);
    Else
        ExpectsThat(Result["data"].Count()).Равно(0);
    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_AddTableColumn(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["COLUMN_NAME"] = "new_field" Then

                CurrentType = GetStringFromBinaryData(Base64Value(Coloumn["DATA_TYPE"]["BYTES"]));
                ExpectsThat(Lower(CurrentType)).Равно("mediumtext");
                Found       = True;
            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(True);

    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_DeleteTableColumn(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["COLUMN_NAME"] = "new_field" Then
                Found                 = True;
            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(False);

    EndIf;

    Return Result;

EndFunction

Function Check_MySQL_EnsureTable(Val Result, Val Option, ColoumnsStruct = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count()).Равно(ColoumnsStruct.Count());

        For Each Coloumn In Result["data"] Do
            CurrentType = GetStringFromBinaryData(Base64Value(Coloumn["DATA_TYPE"]["BYTES"]));
            ExpectsThat(Lower(CurrentType)).Равно(Lower(ColoumnsStruct[Coloumn["COLUMN_NAME"]]));
        EndDo;

    Else
        ExpectsThat(Result["commit"]["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_FormAccessParameters(Val Result, Val Option)

    Result.Insert("apiTokenInstance", "***");
    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetInstanceSettings(Val Result, Val Option, Parameters = "")

    Try
        JSON = OPI_Tools.JSONString(Result);
        JSON = StrReplace(JSON, Parameters["GreenAPI_AccountID"], "1234567890@c.us");

        Result = OPI_Tools.JsonToStructure(JSON, True);
    Except
        Message("JSON Error");
    EndTry;

    ExpectsThat(Result["proxyInstance"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenAPI_GetAccountInformation(Val Result, Val Option)

    Try
        Result["deviceId"] = "***";
        Result["phone"]    = "***";
    Except
        Message("Failed to replace the secrets!!");
    EndTry;

    ExpectsThat(Result["deviceId"]).Заполнено();
    ExpectsThat(Result["phone"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenAPI_GetInstanceSettingsStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_SetInstanceSettings(Val Result, Val Option)

    ExpectsThat(Result["saveSettings"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetInstanceStatus(Val Result, Val Option)

    ExpectsThat(Result["stateInstance"]).Равно("authorized");

    Return Result;

EndFunction

Function Check_GreenAPI_RebootInstance(Val Result, Val Option)

    ExpectsThat(Result["isReboot"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetQR(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 0).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_LogoutInstance(Val Result, Val Option)

    ExpectsThat(Result["isLogout"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetAuthorizationCode(Val Result, Val Option)

    Return Result;

EndFunction

Function Check_GreenAPI_SetProfilePicture(Val Result, Val Option)

    ExpectsThat(Result["setProfilePicture"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_CreateGroup(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["created"]).Равно(True);
    ExpectsThat(Result["chatId"]).Заполнено();

    GroupID = Result["chatId"];
    WriteParameter("GreenAPI_GroupID", GroupID);
    OPI_Tools.AddField("GreenAPI_GroupID", GroupID, "String", Parameters);

    Return Result;

EndFunction

Function Check_GreenAPI_LeaveGroup(Val Result, Val Option)

    ExpectsThat(Result["removeAdmin"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetGroupInformation(Val Result, Val Option)

    Try
        Result["owner"]                 = "***";
        Result["participants"][0]["id"] = "***";
    Except
        Message("Failed to replace the secrets!!");
    EndTry;

    ExpectsThat(Result["groupId"]).Заполнено();
    ExpectsThat(Result["owner"]).Заполнено();
    ExpectsThat(Result["creation"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenAPI_UpdateGroupName(Val Result, Val Option)

    ExpectsThat(Result["updateGroupName"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_AddGroupMember(Val Result, Val Option)

    Try
        Result["addParticipant"] = True;
    Except
        Message("Failed to replace the secrets!!");
    EndTry;

    ExpectsThat(Result["addParticipant"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_ExcludeGroupMember(Val Result, Val Option)

    Try
        Result["removeParticipant"] = True;
    Except
        Message("Failed to replace the secrets!!");
    EndTry;

    ExpectsThat(Result["removeParticipant"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_SetAdminRights(Val Result, Val Option)

    Try
        Result["setGroupAdmin"] = True;
    Except
        Message("Failed to replace the secrets!!");
    EndTry;

    ExpectsThat(Result["setGroupAdmin"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_RevokeAdminRights(Val Result, Val Option)

    Try
        Result["removeAdmin"] = True;
    Except
        Message("Failed to replace the secrets!!");
    EndTry;

    ExpectsThat(Result["removeAdmin"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_SetGroupPicture(Val Result, Val Option)

    ExpectsThat(Result["setGroupPicture"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_SendTextMessage(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();

    If Not ValueIsFilled(Option) Then

        MessageID = Result["idMessage"];
        WriteParameter("GreenAPI_MessageID", MessageID);
        OPI_Tools.AddField("GreenAPI_MessageID", MessageID, "String", Parameters);

    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_DeleteMessage(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_EditMessageText(Val Result, Val Option)

    ExpectsThat(Result["idMessage"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenAPI_SendFile(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();
    ExpectsThat(Result["urlFile"]).Заполнено();

    If Not ValueIsFilled(Option) Then
        MessageID = Result["idMessage"];
        WriteParameter("GreenAPI_FileMessageID", MessageID);
        OPI_Tools.AddField("GreenAPI_FileMessageID", MessageID, "String", Parameters);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_SendFileByURL(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();

    If Not ValueIsFilled(Option) Then
        MessageID = Result["idMessage"];
        WriteParameter("GreenAPI_FileMessageID", MessageID);
        OPI_Tools.AddField("GreenAPI_FileMessageID", MessageID, "String", Parameters);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_SendPoll(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();

    If Not ValueIsFilled(Option) Then
        MessageID = Result["idMessage"];
        WriteParameter("GreenAPI_PollMessageID", MessageID);
        OPI_Tools.AddField("GreenAPI_PollMessageID", MessageID, "String", Parameters);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_GetLocationDescription(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_SendLocation(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();

    If Not ValueIsFilled(Option) Then
        MessageID = Result["idMessage"];
        WriteParameter("GreenAPI_LocMessageID", MessageID);
        OPI_Tools.AddField("GreenAPI_LocMessageID", MessageID, "String", Parameters);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_GetContactDescription(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_SendContact(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();

    If Not ValueIsFilled(Option) Then
        MessageID = Result["idMessage"];
        WriteParameter("GreenAPI_ContactMessageID", MessageID);
        OPI_Tools.AddField("GreenAPI_ContactMessageID", MessageID, "String", Parameters);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenAPI_ForwardMessages(Val Result, Val Option)

    ExpectsThat(Result["messages"]).ИмеетТип("Array").Заполнено();

    Return Result;

EndFunction

Function Check_GreenAPI_GetNotification(Val Result, Val Option, Parameters = "")

    Try
        JSON = OPI_Tools.JSONString(Result);
        JSON = StrReplace(JSON, Parameters["GreenAPI_AccountID"], "1234567890@c.us");

        Result = OPI_Tools.JsonToStructure(JSON, True);
    Except
        Message("JSON Error");
    EndTry;

    Result = OPI_Tools.JsonToStructure(JSON, True);

    ExpectsThat(Result["receiptId"]).Заполнено();

    NotificationID = Result["receiptId"];
    WriteParameter("GreenAPI_ReceiptID", NotificationID);
    OPI_Tools.AddField("GreenAPI_ReceiptID", NotificationID, "String", Parameters);

    Return Result;

EndFunction

Function Check_GreenAPI_DeleteNotificationFromQueue(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_DownloadMessageFile(Val Result, Val Option)

    ExpectsThat(Result["downloadUrl"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenAPI_SetReadMark(Val Result, Val Option)

    ExpectsThat(Result["setRead"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetMessageQueue(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_ClearMessageQueue(Val Result, Val Option)

    ExpectsThat(Result["isCleared"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetChatHistory(Val Result, Val Option, Parameters = "")

    Try
        JSON = OPI_Tools.JSONString(Result);
        JSON = StrReplace(JSON, Parameters["GreenAPI_AccountID"], "1234567890@c.us");

        Result = OPI_Tools.JsonToStructure(JSON, True);
    Except
        Message("JSON Error");
    EndTry;

    ExpectsThat(Result).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_GreenAPI_GetMessage(Val Result, Val Option, Parameters = "")

    Try
        JSON = OPI_Tools.JSONString(Result);
        JSON = StrReplace(JSON, Parameters["GreenAPI_AccountID"], "1234567890@c.us");

        Result = OPI_Tools.JsonToStructure(JSON, True);
    Except
        Message("JSON Error");
    EndTry;

    ExpectsThat(Result["idMessage"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenAPI_GetIncomingMessageLog(Val Result, Val Option, Parameters = "")

    Try
        JSON = OPI_Tools.JSONString(Result);
        JSON = StrReplace(JSON, Parameters["GreenAPI_AccountID"], "1234567890@c.us");

        Result = OPI_Tools.JsonToStructure(JSON, True);
    Except
        Message("JSON Error");
    EndTry;

    ExpectsThat(OPI_Tools.ThisIsCollection(Result)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_GetOutgoingMessageLog(Val Result, Val Option, Parameters = "")

    Try
        JSON = OPI_Tools.JSONString(Result);
        JSON = StrReplace(JSON, Parameters["GreenAPI_AccountID"], "1234567890@c.us");

        Result = OPI_Tools.JsonToStructure(JSON, True);
    Except
        Message("JSON Error");
    EndTry;

    ExpectsThat(Result).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_GreenAPI_ArchiveChat(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenAPI_UnarchiveChat(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_RCON_FormConnectionParameters(Val Result, Val Option)

    Result["url"]      = "127.0.0.1:25565";
    Result["password"] = "***";

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_RCON_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));
    ExpectsThat(Result).Равно("AddIn.OPI_RCON.Main");

    Return Result;

EndFunction

Function Check_RCON_ExecuteCommand(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_RCON_IsConnector(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_Ollama_GetResponse(Val Result, Val Option)

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["response"]).Заполнено();
    ExpectsThat(Result["done"]).Равно(True);

    Return Result;

EndFunction

Function Check_Ollama_GetContextResponse(Val Result, Val Option, Message1 = "", Message2 = "",
    Message3                                                              = "")

    If Option = "Comparison" Then

        ExpectsThat(Message1 = Message2).Равно(True);
        ExpectsThat(Message1 = Message3).Равно(False);

    Else
        ExpectsThat(Result["model"]).Заполнено();
        ExpectsThat(Result["message"]).Заполнено();
        ExpectsThat(Result["done"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_Ollama_LoadModelToMemory(Val Result, Val Option)

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["done"]).Равно(True);
    ExpectsThat(Result["done_reason"]).Равно("load");

    Return Result;

EndFunction

Function Check_Ollama_UnloadModelFromMemory(Val Result, Val Option)

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["done"]).Равно(True);
    ExpectsThat(Result["done_reason"]).Равно("unload");

    Return Result;

EndFunction

Function Check_Ollama_GetRequestParameterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_Ollama_GetContextParameterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_Ollama_GetContextMessageStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_Ollama_GetModelSettingsStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_Ollama_CreateModel(Val Result, Val Option)

    If Option = "Request" Then

        ExpectsThat(Result["model"]).Заполнено();
        ExpectsThat(Result["response"]).Заполнено();
        ExpectsThat(Result["done"]).Равно(True);

    Else
        ExpectsThat(Result["status"]).Равно("success");
    EndIf;

    Return Result;

EndFunction

Function Check_Ollama_DeleteModel(Val Result, Val Option)

    If Option = "List" Then
        ExpectsThat(Result["models"].Count()).Равно(0);
    ElsIf Not ValueIsFilled(Option) Then
        ExpectsThat(Result["status_code"] < 300).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_Ollama_GetModelList(Val Result, Val Option)

    ExpectsThat(Result["models"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Ollama_ListRunningModels(Val Result, Val Option)

    ExpectsThat(Result["models"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_Ollama_GetModelInformation(Val Result, Val Option)

    ExpectsThat(Result["parameters"]).Заполнено();
    ExpectsThat(Result["model_info"]).Заполнено();

    Return Result;

EndFunction

Function Check_Ollama_CopyModel(Val Result, Val Option)

    ExpectsThat(Result["status_code"] < 300).Равно(True);

    Return Result;

EndFunction

Function Check_Ollama_GetVersion(Val Result, Val Option)

    ExpectsThat(Result["version"]).Заполнено();

    Return Result;

EndFunction

Function Check_Ollama_GetEmbeddings(Val Result, Val Option)

    ExpectsThat(Result["embeddings"]).Заполнено();

    Return Result;

EndFunction

Function Check_Ollama_GetEmbeddingsParameterStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_Ollama_PushModel(Val Result, Val Option)

    ExpectsThat(Result["status"]).Равно("success");

    Return Result;

EndFunction

Function Check_Ollama_PullModel(Val Result, Val Option)

    ExpectsThat(Result["status"]).Равно("success");

    Return Result;

EndFunction

Function Check_Ollama_PushBlob(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["status_code"] < 300).Равно(True);

    WriteParameter("Ollama_Blob", Result["digest"]);
    Parameters.Insert("Ollama_Blob", Result["digest"]);

    Return Result;

EndFunction

Function Check_Ollama_CheckBlob(Val Result, Val Option, Parameters = "")

    If Option                              = "Error" Then
        ExpectsThat(Result["status_code"] >= 400).Равно(True);
    Else
        ExpectsThat(Result["status_code"] < 300).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_Initialize(Val Result, Val Option, Parameters = "")

    If Not ValueIsFilled(Option) Then

        Try
            Result["origin"] = "***";
        Except
            Try
                Raise Result.GetLog(True);
            Except
                Raise GetStringFromBinaryData(Result);
            EndTry;
        EndTry;

        ExpectsThat(Result["args"]).ИмеетТип("Map");
        ExpectsThat(Result["args"].Count()).Равно(0);

    ElsIf Option = "Check 1" Then

        Try

            HTTPRequest    = Result.ReturnRequest();
            HTTPConnection = Result.ReturnConnection();
            HTTPResponse   = Result.ReturnResponse();

            MainURL = StrReplace(Parameters["HTTP_URL"], "https://", "");
            MainURL = StrReplace(MainURL               , "http://" , "");

            If StrFind(MainURL, ":") > 0 Then
                MainURL = StrSplit(MainURL, ":")[0];
            EndIf;

            ExpectsThat(HTTPRequest).ИмеетТип("HTTPRequest");
            ExpectsThat(HTTPConnection).ИмеетТип("HTTPConnection");

            ExpectsThat(HTTPRequest.ResourceAddress).Равно("/get");
            ExpectsThat(HTTPConnection.Host).Равно(MainURL);

            ExpectsThat(HTTPResponse).Равно(Undefined);

        Except
            Raise ErrorDescription() + Chars.LF + Chars.LF + Result.GetLog(True);
        EndTry;

    Else

        Try
            ExpectsThat(Result).ИмеетТип("HTTPRequest");
            ExpectsThat(Result.ResourceAddress).Равно("/post");
        Except
            Raise ErrorDescription() + Chars.LF + Chars.LF + Result.GetLog(True);
        EndTry;

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_SetURL(Val Result, Val Option, Parameters = "")

    If Not ValueIsFilled(Option) Then

        Try
            Result["origin"] = "***";
        Except
            Try
                Raise Result.GetLog(True);
            Except
                Raise GetStringFromBinaryData(Result);
            EndTry;
        EndTry;

        ExpectsThat(Result["args"]).ИмеетТип("Map");
        ExpectsThat(Result["args"].Count()).Равно(0);

    Else

        Try

            HTTPRequest    = Result.ReturnRequest();
            HTTPConnection = Result.ReturnConnection();
            HTTPResponse   = Result.ReturnResponse();
            MainURL        = StrReplace(Parameters["HTTP_URL"], "https://", "");
            MainURL        = StrReplace(MainURL               , "http://" , "");

            If StrFind(MainURL, ":") > 0 Then
                MainURL = StrSplit(MainURL, ":")[0];
            EndIf;

            ExpectsThat(HTTPRequest).ИмеетТип("HTTPRequest");
            ExpectsThat(HTTPConnection).ИмеетТип("HTTPConnection");

            ExpectsThat(HTTPRequest.ResourceAddress).Равно("/get");
            ExpectsThat(HTTPConnection.Host).Равно(MainURL);

            ExpectsThat(HTTPResponse).Равно(Undefined);

        Except
            Raise ErrorDescription() + Chars.LF + Chars.LF + Result.GetLog(True);
        EndTry;

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_SetURLParams(Val Result, Val Option, Parameters = "")

    Address = "/get?param1=text&param2=10";

    ResponseMap = New Map;
    ResponseMap.Insert("Option 1", "/page?param1=search%3Ftext&param2=John" + "%20Doe&param3=value%26another&param4=%D0%BA%D0%B8%D1%80%D0%B8%D0%BB%D0%BB%"
        + "D0%B8%D1%86%D0%B0&param5=%3Cscript%3Ealert%28%27XSS%27%29%3C%2Fscript%3E");

    ResponseMap.Insert("Option 2" , "/page?existing=value&param1=search%3Ftext&param2=John%20Doe");
    ResponseMap.Insert("Variant 3", "/page?param1=search%3Ftext&param2=John%20Doe");
    ResponseMap.Insert("Variant 4", "/path%20with%20spaces?param1=search%3Ftext&param2=John%20Doe");
    ResponseMap.Insert("Variant 5", "/page?param1=search%3Ftext&param2=John%20Doe#section");
    ResponseMap.Insert("Variant 6", "/%D0%BF%D1%83%D1%82%D1%8C?param1=search%3Ftext&param2=John%20Doe");
    ResponseMap.Insert("Variant 7", "/page?param1=value1&param2=value%20two&param3=value%3Cthree%3E");

    If Not ValueIsFilled(Option) Then

        Try
            Result["origin"] = "***";
        Except
            Try
                Raise Result.GetLog(True);
            Except
                Raise GetStringFromBinaryData(Result);
            EndTry;
        EndTry;

        FullURL = Parameters["HTTP_URL"] + Address;

        ExpectsThat(Result["args"]).ИмеетТип("Map");
        ExpectsThat(Result["args"].Count()).Равно(2);
        ExpectsThat(Result["url"]).Равно(FullURL);

    ElsIf Option = "Check" Then

        Try

            ExpectsThat(Result).ИмеетТип("HTTPRequest");
            ExpectsThat(Result.ResourceAddress).Равно(Address);

        Except
            Raise ErrorDescription() + Chars.LF + Chars.LF + Result.GetLog(True);
        EndTry;

    Else
        ExpectsThat(Result).Равно(ResponseMap[Option]);
    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_SetResponseFile(Val Result, Val Option, TFN = "")

    BodyFile = New File(TFN);

    If Not ValueIsFilled(Option) Then

        BodyFileReturn = New File(Result);

        ExpectsThat(TFN).Равно(Result);
        ExpectsThat(BodyFile.Size()).Равно(BodyFileReturn.Size());
        ExpectsThat(BodyFile.Size() > 0).Равно(True);

    Else

        ExpectsThat(BodyFile.Size()).Равно(Result.Size());

        CheckResultAsString = GetStringFromBinaryData(Result);

        ExpectsThat(OPI_Tools.JsonToStructure(CheckResultAsString)).ИмеетТип("Map");

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_SetDataType(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result["headers"]["Content-Type"]).Равно("text/markdown");

    Return Result;

EndFunction

Function Check_HTTPClient_GetLog(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String");

    Return Result;

EndFunction

Function Check_HTTPClient_SetBinaryBody(Val Result, Val Option, Image = "")

    Try
        Result["origin"] = "***";
        Result["data"]   = "...";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result["headers"]["Content-Type"]).Равно("application/octet-stream");

    OPI_TypeConversion.GetBinaryData(Image);

    Size = Image.Size();
    OPI_TypeConversion.GetLine(Size);
    ExpectsThat(Result["headers"]["Content-Length"]).Равно(Size);

    Return Result;

EndFunction

Function Check_HTTPClient_SetStringBody(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    Text     = "Hello world!!";
    Encoding = "Windows-1251";

    ExpectsThat(Result["headers"]["Content-Type"]).Равно("text/plain; charset=" + Encoding);

    TextBD = GetBinaryDataFromString(Text, Encoding);
    Size   = TextBD.Size();
    OPI_TypeConversion.GetLine(Size);

    ExpectsThat(Result["headers"]["Content-Length"]).Равно(Size);

    TextB64 = "data:application/octet-stream;base64," + Base64String(TextBD);

    ExpectsThat(Result["data"] = TextB64 Or Result["data"] = Text).Равно(True);

    Return Result;

EndFunction

Function Check_HTTPClient_SetJsonBody(Val Result, Val Option, JSONOriginal = "")

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result["headers"]["Content-Type"]).Равно("application/json; charset=utf-8");

    JSONResult = Result["json"];

    ExpectsThat(JSONResult["Field1"]).Равно(JSONOriginal["Field1"]);
    ExpectsThat(JSONResult["Field2"]).Равно(JSONOriginal["Field2"]);
    ExpectsThat(JSONResult["Field3"][0]).Равно(JSONOriginal["Field3"][0]);
    ExpectsThat(JSONResult["Field3"][1]).Равно(JSONOriginal["Field3"][1]);
    ExpectsThat(JSONResult["Field3"][2]).Равно(JSONOriginal["Field3"][2]);

    Return Result;

EndFunction

Function Check_HTTPClient_SetFormBody(Val Result, Val Option, Data = "")

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result["headers"]["Content-Type"]).Равно("application/x-www-form-urlencoded; charset=utf-8");

    ExpectsThat(Result["form"]["Field1"]).Равно(Data["Field1"]);
    ExpectsThat(Result["form"]["Field2"]).Равно(Data["Field2"]);

    Return Result;

EndFunction

Function Check_HTTPClient_StartMultipartBody(Val Result, Val Option, Image = "")

    Try
        Result["origin"]         = "***";
        ResponseFile             = Result["files"]["file1"];
        Result["files"]["file1"] = "...";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(StrStartsWith(Result["headers"]["Content-Type"], "multipart/")).Равно(True);

    OPI_TypeConversion.GetBinaryData(Image);
    TextB64 = "data:image/png;base64," + Base64String(Image);
    TextB64 = StrReplace(TextB64, Chars.CR + Chars.LF, "");

    ExpectsThat(Result["form"]["Field1"]).Равно("Text");
    ExpectsThat(Result["form"]["Field2"]).Равно("10");
    ExpectsThat(ResponseFile).Равно(TextB64);

    Return Result;

EndFunction

Function Check_HTTPClient_AddMultipartFormDataFile(Val Result, Val Option, Image = "")

    Try
        Result["origin"]         = "***";
        ResponseFile             = Result["files"]["file1"];
        Result["files"]["file1"] = "...";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(StrStartsWith(Result["headers"]["Content-Type"], "multipart/")).Равно(True);

    OPI_TypeConversion.GetBinaryData(Image);
    TextB64 = "data:image/png;base64," + Base64String(Image);
    TextB64 = StrReplace(TextB64, Chars.CR + Chars.LF, "");

    ExpectsThat(Result["form"]["Field1"]).Равно("Text");
    ExpectsThat(Result["form"]["Field2"]).Равно("10");
    ExpectsThat(ResponseFile).Равно(TextB64);

    Return Result;

EndFunction

Function Check_HTTPClient_AddMultipartFormDataField(Val Result, Val Option, Image = "")

    Try
        Result["origin"]         = "***";
        ResponseFile             = Result["files"]["file1"];
        Result["files"]["file1"] = "...";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(StrStartsWith(Result["headers"]["Content-Type"], "multipart/")).Равно(True);

    OPI_TypeConversion.GetBinaryData(Image);
    TextB64 = "data:image/png;base64," + Base64String(Image);
    TextB64 = StrReplace(TextB64, Chars.CR + Chars.LF, "");

    ExpectsThat(Result["form"]["Field1"]).Равно("Text");
    ExpectsThat(Result["form"]["Field2"]).Равно("10");
    ExpectsThat(ResponseFile).Равно(TextB64);

    Return Result;

EndFunction

Function Check_HTTPClient_AddDataAsRelated(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(StrStartsWith(Result["headers"]["Content-Type"], "multipart/")).Равно(True);

    Return Result;

EndFunction

Function Check_HTTPClient_UseEncoding(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    Encoding = "Windows-1251";
    ExpectsThat(Result["headers"]["Content-Type"]).Равно("text/plain; charset=" + Encoding);

    Return Result;

EndFunction

Function Check_HTTPClient_UseGzipCompression(Val Result, Val Option)

    If Option       = "Enabled" Then
        Compression = "gzip";
    Else
        Compression = Undefined;
    EndIf;

    ExpectsThat(Result.Headers["Accept-Encoding"]).Равно(Compression);

    Return Result;

EndFunction

Function Check_HTTPClient_MaxAttempts(Val Result, Val Option)

    ExpectsThat(Result["MaxAttempts"]).Равно(10);

    Return Result;

EndFunction

Function Check_HTTPClient_MaxRedirects(Val Result, Val Option)

    ExpectsThat(Result["MaxRedirects"]).Равно(15);

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnSettings(Val Result, Val Option)

    If Option = "Single" Then

        ExpectsThat(Result).Равно("UTF-8");

    ElsIf Option = "Nonexistent" Then

        ExpectsThat(ValueIsFilled(Result)).Равно(False);

    Else

        ExpectsThat(Result).ИмеетТип("Structure");

        If Option = "Array" Then

            ExpectsThat(Result.Count()).Равно(2);
            ExpectsThat(ValueIsFilled(Result["MaxAttempts"])).Равно(True);
            ExpectsThat(ValueIsFilled(Result["MaxRedirects"])).Равно(True);

        EndIf;

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_UseBodyFiledsAtOAuth(Val Result, Val Option, LogAsString = "")

    If Option = "Enabled" Then
        ExpectsThat(StrFind(Result, "adding body fields to the signature string") <> 0).Равно(True);
    Else

        Try
            Result["origin"]         = "***";
            Result["files"]["file1"] = "...";
        Except
            Try
                Raise Result.GetLog(True);
            Except
                Raise GetStringFromBinaryData(Result);
            EndTry;
        EndTry;

        ExpectsThat(StrFind(LogAsString, "adding body fields to the signature string")).Равно(0);

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_SetHeaders(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    If Option = "Rewrite" Then
        ExpectsThat(Result["headers"]["X-Header1"]).Равно("Value1");
        ExpectsThat(Result["headers"]["X-Header2"]).Равно("Value2");
        ExpectsThat(Result["headers"]["Authorization"]).Равно("Bearer 1111");
    Else
        ExpectsThat(Result["headers"]["X-Header1"]).Равно("Value1");
        ExpectsThat(Result["headers"]["X-Header2"]).Равно("Value2");
    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_AddHeader(Val Result, Val Option)

    If Option = "Replace" Then

        ExpectsThat(Result["headers"]["X-Header1"]).Равно("Value1");
        ExpectsThat(Result["headers"]["X-Header2"]).Равно("Value2");
        ExpectsThat(Result["headers"]["X-Header3"]).Равно(Undefined);
        ExpectsThat(Result["headers"]["X-Header4"]).Равно(Undefined);
        ExpectsThat(Result["headers"]["Authorization"]).Равно("Bearer 1111");

    ElsIf Option = "Addition" Then

        ExpectsThat(Result["headers"]["X-Header1"]).Равно("Value1");
        ExpectsThat(Result["headers"]["X-Header2"]).Равно("Value2");
        ExpectsThat(Result["headers"]["X-Header3"]).Равно("BadValue");
        ExpectsThat(Result["headers"]["X-Header4"]).Равно("BadValue");
        ExpectsThat(Result["headers"]["Authorization"]).Равно("Bearer 1111");

    Else

        Try
            Result["origin"] = "***";
        Except
            Try
                Raise Result.GetLog(True);
            Except
                Raise GetStringFromBinaryData(Result);
            EndTry;
        EndTry;

        ExpectsThat(Result["headers"]["X-Header1"]).Равно("Value1");
        ExpectsThat(Result["headers"]["X-Header2"]).Равно("Value2");

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_AddBasicAuthorization(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    Data  = GetBinaryDataFromString("user:password");
    Basic = "Basic " + Base64String(Data);
    ExpectsThat(Result["headers"]["Authorization"]).Равно(Basic);

    Return Result;

EndFunction

Function Check_HTTPClient_AddBearerAuthorization(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result["headers"]["Authorization"]).Равно("Bearer " + "123123");

    Return Result;

EndFunction

Function Check_HTTPClient_AddAWS4Authorization(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(StrStartsWith(Result["headers"]["Authorization"], "AWS4")).Равно(True);
    ExpectsThat(Result["headers"]["X-Amz-Content-Sha256"] = Undefined).Равно(False);

    Return Result;

EndFunction

Function Check_HTTPClient_AddOAuthV1Authorization(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(StrStartsWith(Result["headers"]["Authorization"], "OAuth")).Равно(True);

    Return Result;

EndFunction

Function Check_HTTPClient_SetOAuthV1Algorithm(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(StrStartsWith(Result["headers"]["Authorization"], "OAuth")).Равно(True);

    Return Result;

EndFunction

Function Check_HTTPClient_ProcessRequest(Val Result, Val Option)

    Try
        Result["origin"] = "***";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result["args"]).ИмеетТип("Map");
    ExpectsThat(Result["args"].Count()).Равно(0);

    Return Result;

EndFunction

Function Check_HTTPClient_ExecuteRequest(Val Result, Val Option)

    If Option = "No execution" Then

        ExpectsThat(Result).Равно(Undefined);

    ElsIf Option = "Execution" Then

        ExpectsThat(Result = Undefined).Равно(False);

    Else

        Try
            Result["origin"] = "***";
        Except
            Try
                Raise Result.GetLog(True);
            Except
                Raise GetStringFromBinaryData(Result);
            EndTry;
        EndTry;

        ExpectsThat(Result["args"]).ИмеетТип("Map");
        ExpectsThat(Result["args"].Count()).Равно(0);

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnRequest(Val Result, Val Option)

    If Option = "Forced" Then

        ExpectsThat(Result).Равно(Undefined);

    Else

        ExpectsThat(Result).ИмеетТип("HTTPRequest");

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnConnection(Val Result, Val Option)

    If Option = "Forced" Then

        ExpectsThat(Result).Равно(Undefined);

    Else

        ExpectsThat(Result).ИмеетТип("HTTPConnection");

    EndIf;

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnResponse(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("HTTPResponse");

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnResponseAsJSONObject(Val Result, Val Option)

    Try
        Result["origin"] = "***";
        Result["data"]   = "...";
    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result).ИмеетТип("Map");

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnResponseAsBinaryData(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnResponseAsString(Val Result, Val Option)

    Try

        ResultJSON = OPI_Tools.JSONToStructure(Result);

        ResultJSON["origin"] = "***";
        ResultJSON["data"]   = "...";

        Result = OPI_Tools.JSONString(ResultJSON);

    Except
        Try
            Raise Result.GetLog(True);
        Except
            Raise GetStringFromBinaryData(Result);
        EndTry;
    EndTry;

    ExpectsThat(Result).ИмеетТип("String");

    Return Result;

EndFunction

Function Check_HTTPClient_ReturnResponseFilename(Val Result, Val Option, TFN = "")

    BodyFile       = New File(TFN);
    BodyFileReturn = New File(Result);

    ExpectsThat(TFN).Равно(Result);
    ExpectsThat(BodyFile.Size()).Равно(BodyFileReturn.Size());
    ExpectsThat(BodyFile.Size() > 0).Равно(True);

    Return Result;

EndFunction

Function Check_HTTPClient_SetProxy(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("HTTPConnection");
    ExpectsThat(Result.Proxy.User("https")).Равно("user");
    ExpectsThat(Result.Proxy.Password("https")).Равно("password");

    Return Result;

EndFunction

Function Check_HTTPClient_SetTimeout(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("HTTPConnection");
    ExpectsThat(Result.Timeout).Равно(60);

    Return Result;

EndFunction

Function Check_HTTPClient_UseURLEncoding(Val Result, Val Option)

    CorrectVariant1 = "/page?param1=search?text&param2=John Doe&param3"
        + "=value&another&param4=кириллица&param5=<script>alert('XSS')</script>";

    ExpectsThat(Result["No encoding"]).Равно(CorrectVariant1);

    CorrectVariant2 = "/page?param1=search%3Ftext&param2=John%20Doe&pa" + "ram3=value%26another&param4=%D0%BA%D0%B8%D1%80%D0%B8%D0%BB%D0%"
        + "BB%D0%B8%D1%86%D0%B0&param5=%3Cscript%3Ealert%28%27XSS%27%29%3C%2Fscript%3E";

    ExpectsThat(Result["With encoding"]).Равно(CorrectVariant2);

    Return Result;

EndFunction

Function Check_HTTPClient_SplitArraysInURL(Val Result, Val Option)

    Separation    = Result["Separation"];
    NoSeparation  = Result["No separation"];
    SeparationPhp = Result["PHP"];

    CorrectVariant1 = "/page?arrayfield=val1&arrayfield=val2&arrayfield=val3";
    ExpectsThat(Separation).Равно(CorrectVariant1);

    CorrectVariant2 = "/page?arrayfield=[val1,val2,val3]";
    ExpectsThat(NoSeparation).Равно(CorrectVariant2);

    CorrectVariant3 = "/page?arrayfield[]=val1&arrayfield[]=val2&arrayfield[]=val3";
    ExpectsThat(SeparationPhp).Равно(CorrectVariant3);

    Result = StrTemplate("No separation: %1;
                          |Separation: %2
                          |Separation (php): %3", NoSeparation, Separation, SeparationPhp);

    Return Result;

EndFunction

Function Check_HTTPClient_SendDataInParts(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    Return Result;

EndFunction

Function Check_HTTPClient_SendPart(Val Result, Val Option)

    ExpectsThat(Result["data"]).Равно("data for");
    ExpectsThat(Result["headers"]["Content-Length"]).Равно("8");
    ExpectsThat(Result["headers"]["Content-Range"]).Равно("bytes 5-12/21");

    Return Result;

EndFunction

Function Check_OpenAI_GetResponse(Val Result, Val Option)

    ExpectsThat(Result["id"]).Заполнено();

    If Not Option = "Image upload" Then
        ExpectsThat(Result["object"]).Равно("chat.completion");
        ExpectsThat(Result["choices"]).ИмеетТип("Array").Заполнено();
    EndIf;

    Return Result;

EndFunction

Function Check_OpenAI_GetEmbeddings(Val Result, Val Option)

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("list");
    ExpectsThat(Result["data"]).ИмеетТип("Array").Заполнено();

    Return Result;

EndFunction

Function Check_OpenAI_CreateAssistant(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("assistant");
    ExpectsThat(Result["name"]).Равно("Math tutor");

    AssistantID = Result["id"];
    WriteParameter("OpenAI_Assistant", AssistantID);
    OPI_Tools.AddField("OpenAI_Assistant", AssistantID, "String", Parameters);

    Return Result;

EndFunction

Function Check_OpenAI_DeleteAssistant(Val Result, Val Option, AssistantID = "")

    ExpectsThat(Result["id"]).Равно(AssistantID);
    ExpectsThat(Result["object"]).Равно("assistant.deleted");
    ExpectsThat(Result["deleted"]).Равно(True);

    Return Result;

EndFunction

Function Check_OpenAI_RetrieveAssistant(Val Result, Val Option)

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("assistant");
    ExpectsThat(Result["name"]).Равно("Math tutor");

    Return Result;

EndFunction

Function Check_OpenAI_GetAssistantsList(Val Result, Val Option)

    ExpectsThat(Result["data"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_OpenAI_UploadFile(Val Result, Val Option, Parameters = "", FileName = "", Size = "")

    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("file");
    ExpectsThat(Result["filename"]).Равно(FileName);
    ExpectsThat(Result["bytes"]).Равно(Size);
    ExpectsThat(Result["purpose"]).Равно("assistants");

    FileID = Result["id"];
    WriteParameter("OpenAI_File", FileID);
    OPI_Tools.AddField("OpenAI_File", FileID, "String", Parameters);

    Return Result;

EndFunction

Function Check_OpenAI_DeleteFile(Val Result, Val Option, FileID = "")

    ExpectsThat(Result["id"]).Равно(FileID);
    ExpectsThat(Result["object"]).Равно("file");
    ExpectsThat(Result["deleted"]).Равно(True);

    Return Result;

EndFunction

Function Check_OpenAI_GetFileInformation(Val Result, Val Option)

    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("file");

    Return Result;

EndFunction

Function Check_OpenAI_GetFilesList(Val Result, Val Option)

    ExpectsThat(Result["data"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_OpenAI_DownloadFile(Val Result, Val Option, Parameters = "")

    File = Parameters["Picture"];
    OPI_TypeConversion.GetBinaryData(File);

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= File.Size() + 2).Равно(True);

    Return Result;

EndFunction

Function Check_OpenAI_GetMessageStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_OpenAI_GetImageMessageStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_OpenAI_GenerateSpeech(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 137516).Равно(True);

    //@skip-check missing-temporary-file-deletion
    TFN = GetTempFileName("wav");
    Result.Write(TFN);

    WriteParameter("OpenAI_Speech", TFN);
    OPI_Tools.AddField("OpenAI_Speech", TFN, "String", Parameters);

    Return Result;

EndFunction

Function Check_OpenAI_CreateTranscription(Val Result, Val Option)

    Text = Lower(Result["text"]);
    ExpectsThat(StrFind(Text, "attack") > 0).Равно(True);
    ExpectsThat(StrFind(Text, "fire") > 0).Равно(True);
    ExpectsThat(StrFind(Text, "orion") > 0).Равно(True);

    Return Result;

EndFunction

Function Check_OpenAI_GetImages(Val Result, Val Option)

    ExpectsThat(Result["data"]).Заполнено();
    ExpectsThat(Result["created"]).Заполнено();

    Return Result;

EndFunction

Function Check_OpenAI_GetModelList(Val Result, Val Option)

    ExpectsThat(Result["object"]).Равно("list");
    ExpectsThat(Result["data"]).ИмеетТип("Array").Заполнено();

    Return Result;

EndFunction

Function Check_OpenAI_GetAssistantMessage(Val Result, Val Option, Check = "")

    ExpectsThat(Result).Равно(Check);

    Return Result;

EndFunction

Function Check_OpenAI_GetUserMessage(Val Result, Val Option, Check = "")

    ExpectsThat(Result).Равно(Check);

    Return Result;

EndFunction

Function Check_OpenAI_GetSystemMessage(Val Result, Val Option, Check = "")

    ExpectsThat(Result).Равно(Check);

    Return Result;

EndFunction

Function Check_MSSQL_GenerateConnectionString(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_MSSQL_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));
    ExpectsThat(Result).Равно("AddIn.OPI_MSSQL.Main");

    Return Result;

EndFunction

Function Check_MSSQL_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MSSQL_IsConnector(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_MSSQL_ExecuteSQLQuery(Val Result, Val Option, Image = "")

    If Option = "Connection" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MSSQL.Main");

    ElsIf ValueIsFilled(Option) Then

        ExpectsThat(Result["result"]).Равно(True);

    Else

        Blob = Result["data"][0]["Data"]["BYTES"];

        Result["data"][0]["Data"]["BYTES"] = "Base64";
        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Base64Value(Blob).Size()).Равно(Image.Size());

    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_GetTLSSettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_MSSQL_CreateDatabase(Val Result, Val Option)

    If Option = "Openning" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MSSQL.Main");

    ElsIf Option = "Existing" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_CreateTable(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result["result"]).Равно(True);
    Else
        ExpectsThat(Result["result"]).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_AddRecords(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MSSQL_GetRecords(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Not ValueIsFilled(Option) Then

        If ValueIsFilled(Result["data"]) Then

            Result["data"][0]["varbinary_field"]["BYTES"] =
                Left(Result["data"][0]["varbinary_field"]["BYTES"], 10) + "...";

        EndIf;

    Else
        ExpectsThat(Result["data"].Count()).Равно(5);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_UpdateRecords(Val Result, Val Option, Count = "", FieldsStructure = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count()).Равно(Count);

        For N = 0 To Result["data"].UBound() Do

            For Each Value In FieldsStructure Do
                Result["data"][N][Value.Key] = Value.Value;
            EndDo;

        EndDo;
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_DeleteRecords(Val Result, Val Option, Count = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(Count);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_DeleteTable(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MSSQL_DeleteDatabase(Val Result, Val Option)

    If Option = "Openning" Then

        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MSSQL.Main");

    ElsIf Option = "Error" Or Option = "Connection error" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_ClearTable(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(0);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_GetTableInformation(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result["data"].Count()).Равно(16);
    Else
        ExpectsThat(Result["data"].Count()).Равно(0);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_AddTableColumn(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["column_name"] = "new_field" Then

                ExpectsThat(Lower(Coloumn["data_type"])).Равно("bigint");
                Found = True;
            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(True);

    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_DeleteTableColumn(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        Found = False;

        For Each Coloumn In Result["data"] Do

            If Coloumn["column_name"] = "new_field" Then
                Found                 = True;
            EndIf;

        EndDo;

        ExpectsThat(Found).Равно(False);

    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_EnsureTable(Val Result, Val Option, ColoumnsStruct = "")

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count()).Равно(ColoumnsStruct.Count());

        For Each Coloumn In Result["data"] Do
            ExpectsThat(Lower(Coloumn["data_type"])).Равно(Lower(ColoumnsStruct[Coloumn["column_name"]]));
        EndDo;

    Else
        ExpectsThat(Result["commit"]["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MSSQL_GetRecordsFilterStrucutre(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_FTP_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));
    ExpectsThat(Result).Равно("AddIn.OPI_FTP.Main");

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_GetWelcomeMessage(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]).Заполнено();

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_GetProtocolFeatureList(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]).Заполнено();

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_Ping(Val Result, Val Option)

    If IsCLITest() Then
        ExpectsThat(Lower(Result)).Равно("true");
    Else
        ExpectsThat(Result).Равно(True);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_ExecuteCustomCommand(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["status"]).Заполнено();
    ExpectsThat(Result["data"]).Заполнено();

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_ExecuteArbitraryCommand(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["status"]).Заполнено();
    ExpectsThat(Result["data"]).Заполнено();

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_GetCurrentDirectory(Val Result, Val Option, Parameters = "")

    Path = Result["path"];

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Path).Заполнено();

    WriteParameter("FTP_RootPath", Path);
    OPI_Tools.AddField("FTP_RootPath", Path, "String", Parameters);

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_ChangeCurrentDirectory(Val Result, Val Option, Path = "")

    ExpectsThat(Result["result"]).Равно(True);

    If StrFind(Option, "Check") And Not IsCLITest() Then
        ExpectsThat(StrEndsWith(Result["path"], Path)).Равно(True);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_GetConnectionConfiguration(Val Result, Val Option, Parameters = "")

    If StrFind(Option, "Check") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).Заполнено();
        ExpectsThat(Result["close_connection"]["result"]).Равно(True);

    Else

        UseProxy = Parameters["Proxy"];
        FTPS     = Parameters["TLS"];

        If TypeOf(Result) = Type("Structure") Then

            ExpectsThat(Result.Property("set")).Равно(True);
            Result["set"]["password"] = "***";

            If FTPS Then
                ExpectsThat(Result.Property("tls")).Равно(True);
            EndIf;

            If UseProxy Then
                ExpectsThat(Result.Property("proxy")).Равно(True);
                Result["proxy"]["password"] = "***";
            EndIf;

        Else

            ExpectsThat(Result["set"] <> Undefined).Равно(True);
            Result["set"]["password"] = "***";

            If FTPS Then
                ExpectsThat(Result["tls"] <> Undefined).Равно(True);
            EndIf;

            If UseProxy Then
                ExpectsThat(Result["proxy"] <> Undefined).Равно(True);
                Result["proxy"]["password"] = "***";
            EndIf;

        EndIf;

    EndIf;

    Return Result;

EndFunction

Function Check_FTP_CloseConnection(Val Result, Val Option)

    If StrFind(Option, "Openning") > 0 Then
        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_FTP.Main");
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_IsConnector(Val Result, Val Option)

    If StrFind(Option, "Openning") > 0 Then
        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_FTP.Main");
    Else
        ExpectsThat(Result).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_GetConnectionSettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Result["password"] = "***";

    Return Result;

EndFunction

Function Check_FTP_GetProxySettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Result["password"] = "***";

    Return Result;

EndFunction

Function Check_FTP_GetTLSSettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_FTP_CreateNewDirectory(Val Result, Val Option, Primary = False)

    If StrFind(Option, "Deletion") > 0 Then
        Return Result;
    EndIf;

    If Primary Or StrFind(Option, "Nested") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);

    ElsIf StrFind(Option, "Check 1") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(1);
        ExpectsThat(Result["data"][0]["name"]).Равно("another_one");

    ElsIf StrFind(Option, "Check 2") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(1);
        ExpectsThat(Result["data"][0]["objects"]).ИмеетТип("Array").ИмеетДлину(1);

    Else

        ExpectsThat(Result["result"]).Равно(False);

    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_ListObjects(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If StrFind(Option, "File") > 0 Then
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(0);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_UploadFile(Val Result, Val Option, Size = "")

    ExpectsThat(Result["bytes"]).Равно(Size);

    If Not StrFind(Option, "Size 1") >  0 Or StrFind(Option, "Size 2") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);

    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_DeleteFile(Val Result, Val Option)

    If StrFind(Option, "Nonexistent") > 0 Then

        ExpectsThat(Result["result"]).Равно(False);

    ElsIf StrFind(Option, "Check") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(1);

    Else

        ExpectsThat(Result["result"]).Равно(True);

    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_DeleteDirectory(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_ClearDirectory(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If StrFind(Option, "Check") > 0 Then
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(0);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_GetObjectSize(Val Result, Val Option)

    If StrFind(Option, "Nonexistent") > 0 Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_UpdatePath(Val Result, Val Option)

    If StrFind(Option, "List, back") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(1);
        ExpectsThat(Result["data"][0]["path"]).Равно("new_dir");
        ExpectsThat(Result["data"][0]["objects"][0]["path"]).Равно("new_dir/pic_from_disk.png");

    ElsIf StrFind(Option, "List") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(1);
        ExpectsThat(Result["data"][0]["path"]).Равно("brand_new_dir");
        ExpectsThat(Result["data"][0]["objects"][0]["path"]).Равно("brand_new_dir/pic_copy.png");

    ElsIf StrFind(Option, "Check, old") > 0 Then

        ExpectsThat(Result["result"]).Равно(False);

    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_SaveFile(Val Result, Val Option, ResultSize = "", CheckSize = "")

    If StrFind(Option, "File size") > 0 Then
        ExpectsThat(Result).Равно(ResultSize);
        ExpectsThat(Result).Равно(CheckSize);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_FTP_GetFileData(Val Result, Val Option, CheckSize = "")

    If StrFind(Option, "File size") > 0 Then
        ExpectsThat(Result).Равно(CheckSize);
    ElsIf StrFind(Option, "Size") > 0 Then
        ExpectsThat(Result["result"]).Равно(True);
    Else
        ExpectsThat(Result).ИмеетТип("BinaryData");
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_SSH_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));
    ExpectsThat(Result).Равно("AddIn.OPI_SSH.Main");

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_SSH_ExecuteCommand(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["stderr"]).Равно("");
    ExpectsThat(Result["exit_code"]).Равно("0");

    Return Result;

EndFunction

Function Check_SSH_GetConnectionConfiguration(Val Result, Val Option)

    If StrFind(Option, "Check") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["stderr"]).Равно("");
        ExpectsThat(Result["stdout"]).Заполнено();
        ExpectsThat(Result["exit_code"]).Равно("0");
        ExpectsThat(Result["close_connection"]["result"]).Равно(True);

    Else

        ExpectsThat(Result["set"]).Заполнено();

        If OPI_Tools.CollectionFieldExists(Result["set"], "password") Then
            Result["set"]["password"] = "***";
        EndIf;

        If OPI_Tools.CollectionFieldExists(Result["set"], "key_path") Then
            Result["set"]["key_path"] = "./ssh_key";
            Result["set"]["pub_path"] = "./ssh_key.pub";
        EndIf;

        If OPI_Tools.CollectionFieldExists(Result, "proxy") Then

            ExpectsThat(Result["proxy"]).Заполнено();
            Result["proxy"]["password"] = "***";

        EndIf;

    EndIf;

    Return Result;

EndFunction

Function Check_SSH_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_SSH_IsConnector(Val Result, Val Option)

    If StrFind(Option, "Error") Then
        ExpectsThat(Result).Равно(False);
    Else
        ExpectsThat(Result).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SSH_GetSettingsLoginPassword(Val Result, Val Option)

    ExpectsThat(Result["auth_type"]).Равно("password");
    ExpectsThat(Result["host"]).Заполнено();
    ExpectsThat(Result["port"]).Заполнено();
    ExpectsThat(Result["username"]).Заполнено();
    ExpectsThat(Result["password"]).Заполнено();

    Result["password"] = "***";

    Return Result;

EndFunction

Function Check_SSH_GetSettingsPrivateKey(Val Result, Val Option)

    ExpectsThat(Result["auth_type"]).Равно("private_key");
    ExpectsThat(Result["host"]).Заполнено();
    ExpectsThat(Result["port"]).Заполнено();
    ExpectsThat(Result["username"]).Заполнено();
    ExpectsThat(Result["key_path"]).Заполнено();
    ExpectsThat(Result["pub_path"]).Заполнено();

    Result["key_path"] = "./ssh_key";
    Result["pub_path"] = "./ssh_key.pub";

    Return Result;

EndFunction

Function Check_SSH_GetSettingsViaAgent(Val Result, Val Option)

    ExpectsThat(Result["auth_type"]).Равно("agent");
    ExpectsThat(Result["host"]).Заполнено();
    ExpectsThat(Result["port"]).Заполнено();
    ExpectsThat(Result["username"]).Заполнено();

    Return Result;

EndFunction

Function Check_SSH_GetProxySettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Result["password"] = "***";

    Return Result;

EndFunction

Function Check_SFTP_CreateConnection(Val Result, Val Option)

    Result = String(TypeOf(Result));
    ExpectsThat(Result).Равно("AddIn.OPI_SSH.Main");

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_CreateNewDirectory(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_SFTP_DeleteDirectory(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_SFTP_GetCurrentDirectory(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["path"]).Заполнено();

    Return Result;

EndFunction

Function Check_SFTP_ListObjects(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]).ИмеетТип("Array").Заполнено();
    ExpectsThat(Result["data"][0]["uid"]).Заполнено();
    ExpectsThat(Result["data"][0]["is_directory"]).Равно(True);

    If StrFind(Option, "No recursion") = 0 Then

        ExpectsThat(Result["data"][0]["objects"].Count()).Равно(3);
        ExpectsThat(Result["data"][0]["objects"][1]["objects"].Count()).Равно(1);
        ExpectsThat(Result["data"][0]["objects"][2]["objects"].Count()).Равно(2);

        ExpectsThat(Result["data"][0]["objects"][0]["objects"]).Равно(Undefined);

    Else

        ExpectsThat(Result["data"][0]["objects"]).Равно(Undefined);

    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_ChangeCurrentDirectory(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If StrFind(Option, "Check") > 0 Then
        ExpectsThat(Result["path"]).Равно("/config/test_folder");
    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_UploadFile(Val Result, Val Option, Size = "")

    If StrFind(Option, "File size") > 0 Then

        ExpectsThat(Result).Равно(Size);

    Else

        ExpectsThat(Result["bytes"]).Равно(Size);
        ExpectsThat(Result["result"]).Равно(True);

    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_DeleteFile(Val Result, Val Option)

    If StrFind(Option, "Nonexistent") > 0 Then

        ExpectsThat(Result["result"]).Равно(False);

    ElsIf StrFind(Option, "Check") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]).ИмеетТип("Array").ИмеетДлину(1);

    Else

        ExpectsThat(Result["result"]).Равно(True);

    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_IsConnector(Val Result, Val Option)

    If StrFind(Option, "Error") Then
        ExpectsThat(Result).Равно(False);
    Else
        ExpectsThat(Result).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_GetSettingsLoginPassword(Val Result, Val Option)

    ExpectsThat(Result["auth_type"]).Равно("password");
    ExpectsThat(Result["host"]).Заполнено();
    ExpectsThat(Result["port"]).Заполнено();
    ExpectsThat(Result["username"]).Заполнено();
    ExpectsThat(Result["password"]).Заполнено();

    Result["password"] = "***";

    Return Result;

EndFunction

Function Check_SFTP_GetSettingsPrivateKey(Val Result, Val Option)

    ExpectsThat(Result["auth_type"]).Равно("private_key");
    ExpectsThat(Result["host"]).Заполнено();
    ExpectsThat(Result["port"]).Заполнено();
    ExpectsThat(Result["username"]).Заполнено();
    ExpectsThat(Result["key_path"]).Заполнено();
    ExpectsThat(Result["pub_path"]).Заполнено();

    Result["key_path"] = "./ssh_key";
    Result["pub_path"] = "./ssh_key.pub";

    Return Result;

EndFunction

Function Check_SFTP_GetSettingsViaAgent(Val Result, Val Option)

    ExpectsThat(Result["auth_type"]).Равно("agent");
    ExpectsThat(Result["host"]).Заполнено();
    ExpectsThat(Result["port"]).Заполнено();
    ExpectsThat(Result["username"]).Заполнено();

    Return Result;

EndFunction

Function Check_SFTP_GetProxySettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Result["password"] = "***";

    Return Result;

EndFunction

Function Check_SFTP_GetConnectionConfiguration(Val Result, Val Option)

    If StrFind(Option, "Check") > 0 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["stderr"]).Равно("");
        ExpectsThat(Result["stdout"]).Заполнено();
        ExpectsThat(Result["exit_code"]).Равно("0");
        ExpectsThat(Result["close_connection"]["result"]).Равно(True);

    Else

        ExpectsThat(Result["set"]).Заполнено();

        If OPI_Tools.CollectionFieldExists(Result["set"], "password") Then
            Result["set"]["password"] = "***";
        EndIf;

        If OPI_Tools.CollectionFieldExists(Result["set"], "key_path") Then
            Result["set"]["key_path"] = "./ssh_key";
            Result["set"]["pub_path"] = "./ssh_key.pub";
        EndIf;

        If OPI_Tools.CollectionFieldExists(Result, "proxy") Then

            ExpectsThat(Result["proxy"]).Заполнено();
            Result["proxy"]["password"] = "***";

        EndIf;

    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_SFTP_SaveFile(Val Result, Val Option, CheckSize = "")

    If StrFind(Option, "File size") > 0 Then
        ExpectsThat(Result).Равно(CheckSize);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_GetFileData(Val Result, Val Option, CheckSize = "")

    If StrFind(Option, "File size") > 0 Then
        ExpectsThat(Result).Равно(CheckSize);
    ElsIf StrFind(Option, "Size") > 0 Then
        ExpectsThat(Result["result"]).Равно(True);
    Else
        ExpectsThat(Result).ИмеетТип("BinaryData");
    EndIf;

    If StrFind(Option, "HTTP") Then
        OPI_Tools.Pause(2);
    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_UpdatePath(Val Result, Val Option)

    If StrFind(Option, "Check, Old") Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_SFTP_GetFileInformation(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]).Заполнено();
    ExpectsThat(Result["data"]["size"]).Заполнено();
    ExpectsThat(Result["data"]["modified"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenMax_FormAccessParameters(Val Result, Val Option)

    Result.Insert("apiTokenInstance", "***");
    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetAuthorizationCode(Val Result, Val Option)

    ExpectsThat(Result["data"]["reason"]).Равно("already_registered");
    Return Undefined;

EndFunction

Function Check_GreenMax_LogoutInstance(Val Result, Val Option)

    ExpectsThat(Result["isLogout"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_SendAuthorizationCode(Val Result, Val Option)

    Return Undefined;

EndFunction

Function Check_GreenMax_GetInstanceStatus(Val Result, Val Option)

    ExpectsThat(Result["stateInstance"]).Равно("authorized");

    Return Result;

EndFunction

Function Check_GreenMax_RebootInstance(Val Result, Val Option)

    ExpectsThat(Result["isReboot"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetInstanceSettingsStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_GreenMax_GetInstanceSettings(Val Result, Val Option, Parameters = "")

    Try
        JSON = OPI_Tools.JSONString(Result);
        JSON = StrReplace(JSON, Parameters["GreenMax_AccountID"], "1234567890@c.us");

        Result = OPI_Tools.JsonToStructure(JSON, True);
    Except
        Message("JSON Error");
    EndTry;

    ExpectsThat(Result["delaySendMessagesMilliseconds"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenMax_SetInstanceSettings(Val Result, Val Option)

    ExpectsThat(Result["saveSettings"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_SetProfilePicture(Val Result, Val Option)

    ExpectsThat(Result["setProfilePicture"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetAccountInformation(Val Result, Val Option)

    ExpectsThat(Result["chatId"]).Заполнено();
    ExpectsThat(Result["phone"]).Заполнено();

    Result["chatId"] = "***";
    Result["phone"]  = "***";

    Return Result;

EndFunction

Function Check_GreenMax_CheckAccount(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["chatId"]).Заполнено();
    ExpectsThat(Result["exist"]).Равно(True);

    ContactID = Result["chatId"];
    WriteParameter("GreenMax_MyID", ContactID);
    Parameters.Insert("GreenMax_MyID", ContactID);

    Result["chatId"] = "***";

    Return Result;

EndFunction

Function Check_GreenMax_GetContactList(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Array");
    ExpectsThat(Result[0]["chatId"]).Заполнено();

    ContactID = Result[0]["chatId"];
    WriteParameter("GreenMax_ContactID", ContactID);
    Parameters.Insert("GreenMax_ContactID", ContactID);

    Result[0]["chatId"]      = "***";
    Result[0]["phoneNumber"] = "***";

    Return Result;

EndFunction

Function Check_GreenMax_GetContactInformation(Val Result, Val Option)

    ExpectsThat(Result["chatId"]).Заполнено();
    ExpectsThat(Result["name"]).Заполнено();
    ExpectsThat(Result["avatar"]).Заполнено();

    Result["chatId"]      = "***";
    Result["phoneNumber"] = "***";

    Return Result;

EndFunction

Function Check_GreenMax_GetChatList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");
    ExpectsThat(Result[0]["chatId"]).Заполнено();

    For Each Chat In Result Do
        Chat["phoneNumber"] = "***";
        Chat["chatId"]      = "***";
    EndDo;

    Return Result;

EndFunction

Function Check_GreenMax_GetChatAvatar(Val Result, Val Option)

    ExpectsThat(Result["urlAvatar"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenMax_CreateGroup(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["chatId"]).Заполнено();
    ExpectsThat(Result["created"]).Равно(True);

    GroupID = Result["chatId"];
    WriteParameter("GreenMax_GroupID", GroupID);
    Parameters.Insert("GreenMax_GroupID", GroupID);

    Return Result;

EndFunction

Function Check_GreenMax_RemoveGroupMember(Val Result, Val Option)

    ExpectsThat(Result["removeParticipant"] <> Undefined).Равно(True);

    Return Undefined;

EndFunction

Function Check_GreenMax_AddGroupMember(Val Result, Val Option)

    ExpectsThat(Result["addParticipant"] <> Undefined).Равно(True);

    Return Undefined;

EndFunction

Function Check_GreenMax_LeaveGroup(Val Result, Val Option)

    ExpectsThat(Result["leaveGroup"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_UpdateGroupName(Val Result, Val Option)

    ExpectsThat(Result["updateGroupName"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetGroupInformation(Val Result, Val Option)

    ExpectsThat(Result["creation"]).Заполнено();
    ExpectsThat(Result["subject"]).Равно("New group");

    Result["chatId"] = "***";

    For Each Member In Result["participants"] Do
        Member["chatId"] = "***";
    EndDo;

    Return Result;

EndFunction

Function Check_GreenMax_ChangeGroupSettings(Val Result, Val Option)

    ExpectsThat(Result["updateGroupSettings"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetGroupSettingsStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    If Option = "Clear" Then

        For Each Element In Result Do

            If OPI_Tools.IsPrimitiveType(Element.Value) Then
                ExpectsThat(ValueIsFilled(Element.Value)).Равно(False);
            EndIf;

        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_GreenMax_SetAdminRights(Val Result, Val Option)

    ExpectsThat(Result["setGroupAdmin"] <> Undefined).Равно(True);

    Return Undefined;

EndFunction

Function Check_GreenMax_RevokeAdminRights(Val Result, Val Option)

    ExpectsThat(Result["removeAdmin"] <> Undefined ).Равно(True);

    Return Undefined;

EndFunction

Function Check_GreenMax_SetGroupPicture(Val Result, Val Option)

    ExpectsThat(Result["setGroupPicture"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_SendTextMessage(Val Result, Val Option, Val Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();

    MessageID = Result["idMessage"];
    WriteParameter("GreenMax_MessageID", MessageID);
    Parameters.Insert("GreenMax_MessageID", MessageID);

    Return Result;

EndFunction

Function Check_GreenMax_SendFile(Val Result, Val Option, Val Parameters = "")

    ExpectsThat(Result["idMessage"]).Заполнено();

    If Not ValueIsFilled(Option) Then
        MessageID = Result["idMessage"];
        WriteParameter("GreenMax_FileMessageID", MessageID);
        Parameters.Insert("GreenMax_FileMessageID", MessageID);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenMax_SendFileByURL(Val Result, Val Option)

    ExpectsThat(Result["idMessage"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenMax_GetNotification(Val Result, Val Option, Val Parameters = "")

    ExpectsThat(Result["receiptId"]).Заполнено();
    ExpectsThat(Result["body"]).Заполнено();

    If Not ValueIsFilled(Option) Then
        MessageID = Result["receiptId"];
        WriteParameter("GreenMax_ReceiptID", MessageID);
        Parameters.Insert("GreenMax_ReceiptID", MessageID);
    EndIf;

    Return Result;

EndFunction

Function Check_GreenMax_DeleteNotification(Val Result, Val Option, Val Parameters = "")

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_MarkMessagesAsRead(Val Result, Val Option)

    ExpectsThat(Result["setRead"]).ИмеетТип("Boolean");

    Return Result;

EndFunction

Function Check_GreenMax_GetChatMessageHistory(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Array").ИмеетДлину(3);

    MessageID = Result[0]["idMessage"];
    WriteParameter("GreenMax_MainMessageID", MessageID);
    Parameters.Insert("GreenMax_MainMessageID", MessageID);

    Return Result;

EndFunction

Function Check_GreenMax_GetChatMessage(Val Result, Val Option, MessageID = "")

    ExpectsThat(Result["idMessage"]).Равно(MessageID);
    ExpectsThat(Result["chatId"]).Заполнено();

    Return Result;

EndFunction

Function Check_GreenMax_GetIncomingMessageLog(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetOutgoingMessageLog(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetOutgoingMessageCount(Val Result, Val Option)

    ExpectsThat(Result["count"]).ИмеетТип("Number");

    Return Result;

EndFunction

Function Check_GreenMax_GetOutgoingMessageQueue(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result)).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_ClearOutgoingMessageQueue(Val Result, Val Option)

    ExpectsThat(Result["isCleared"]).Равно(True);

    Return Result;

EndFunction

Function Check_GreenMax_GetIncomingNotificationCount(Val Result, Val Option)

    ExpectsThat(Result["count"]).ИмеетТип("Number");

    Return Result;

EndFunction

Function Check_GreenMax_ClearIncomingNotificationQueue(Val Result, Val Option)

    ExpectsThat(Result["isCleared"]).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_GenerateConnectionString(Val Result, Val Option, Parameters = "")

    Address  = "127.0.0.1:1234";
    Login    = Parameters["MongoDB_User"];
    Password = Parameters["MongoDB_Password"];
    Base     = Parameters["MongoDB_DB"];

    StringTemplate = "mongodb://%1:" + "%2@%3/%4?authSource=admin";
    CheckString  = StrTemplate(StringTemplate, Login, Password, Address, Base);
    ReturnString = StrTemplate(StringTemplate, Login, "***", Address, Base);
    ExpectsThat(CheckString).Равно(Result);

    Return ReturnString;

EndFunction

Function Check_MongoDB_CreateConnection(Val Result, Val Option)

    If Option  = "Closing" Then
        ExpectsThat(Result["result"]).Равно(True);
    Else
        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MongoDB.Main");
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_IsConnector(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_ExecuteCommand(Val Result, Val Option)

    If Option  = "Connection" Then
        Result = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_MongoDB.Main");
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_GetDatabase(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]["ok"]).Равно(1);
    ExpectsThat(Result["data"]["db"]).Равно("test_db");

    Return Result;

EndFunction

Function Check_MongoDB_GetListOfBases(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]["databases"]).ИмеетТип("Array").Заполнено();

    Return Result;

EndFunction

Function Check_MongoDB_CreateCollection(Val Result, Val Option)

    If Option = "Existing" Then
        ExpectsThat(Result["result"]).Равно(False);
        ExpectsThat(StrFind(Result["error"], "already exists") > 0).Равно(True);
    Else
        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]["ok"]).Равно(1);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_DeleteCollection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]["ok"]).Равно(1);
    ExpectsThat(Result["data"]["ns"]).Равно("test_database.test_collection");

    Return Result;

EndFunction

Function Check_MongoDB_GetCollectionList(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]["ok"]).Равно(1);

    Return Result;

EndFunction

Function Check_MongoDB_InsertDocuments(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]["ok"]).Равно(1);
    Return Result;

EndFunction

Function Check_MongoDB_GetDocuments(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"].Count() > 0).Равно(True);
        ExpectsThat(Result["data"][0]["stringField"]).Равно("Text");

    ElsIf Option = 1 Then
        // Category and price range filter
        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Document In Result["data"] Do
            ExpectsThat(Document["category"]).Равно("electronics");
            ExpectsThat(Document["price"] >= 100).Равно(True);
            ExpectsThat(Document["price"] <= 400).Равно(True);
        EndDo;

        If Result["data"].Count() > 1 Then
            ExpectsThat(Result["data"][0]["price"] <= Result["data"][1]["price"]).Равно(True);
        EndIf;

    ElsIf Option = 2 Then
        ExpectsThat(Result["result"]).Равно(True);

        For Each Document In Result["data"] Do
            ExpectsThat(Document["inStock"]).Равно(True);
            ExpectsThat(Document["rating"] >= 4).Равно(True);
        EndDo;

        If Result["data"].Count() > 1 Then
            ExpectsThat(Result["data"][0]["rating"] >= Result["data"][1]["rating"]).Равно(True);
        EndIf;

    ElsIf Option = 3 Then
        ExpectsThat(Result["result"]).Равно(True);

        For Each Document In Result["data"] Do

            Found         = False;
            For Each Tag In Document["tags"] Do
                If StrFind(Tag, "sale") > 0 Then
                    Found = True;
                    Break;
                EndIf;
            EndDo;

            ExpectsThat(Found).Равно(True);

        EndDo;

    ElsIf Option = 4 Then

        ExpectsThat(Result["result"]).Равно(True);

        For Each Document In Result["data"] Do
            ExpectsThat(Document["details"]["supplier"]).Равно("Supplier A");
            ExpectsThat(Document["details"]["weightKg"] < 3).Равно(True);
        EndDo;

    ElsIf Option = 5 Then

        ExpectsThat(Result["result"]).Равно(True);

        For Each Document In Result["data"] Do
            ExpectsThat(Document["productName"] = Undefined).Равно(False);
            ExpectsThat(Document["price"]       = Undefined).Равно(False);
            ExpectsThat(Document["rating"]      = Undefined).Равно(False);
            ExpectsThat(Document["category"]).Равно(Undefined);
            ExpectsThat(Document["inStock"]).Равно(Undefined);
            ExpectsThat(Document["details"]).Равно(Undefined);
        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_GetCursor(Val Result, Val Option)

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]["cursor"]["firstBatch"].Count()).Равно(1);
        ExpectsThat(Result["data"]["cursor"]["id"] > 0).Равно(True);

    ElsIf Option = 1 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]["cursor"]["firstBatch"].Count() <= 3).Равно(True);

        For Each Document In Result["data"]["cursor"]["firstBatch"] Do
            ExpectsThat(Document["inStock"]).Равно(True);
        EndDo;

    ElsIf Option = 2 Then

        ExpectsThat(Result["result"]).Равно(True);
        ExpectsThat(Result["data"]["cursor"]["firstBatch"].Count() <= 2).Равно(True);

        For Each Document In Result["data"]["cursor"]["firstBatch"] Do
            ExpectsThat(Document["category"]).Равно("clothing");
        EndDo;

    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_GetDocumentBatch(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    Return Result;

EndFunction

Function Check_MongoDB_UpdateDocuments(Val Result, Val Option)

    Option = String(Option);

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);
        ExpectsThat(Result["data"][0]["doubleField"]).Равно(999);

    ElsIf Option = "Check 1" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Doc In Result["data"] Do

            ExpectsThat(Doc["price"]).Равно(777);
            ExpectsThat(Doc["inStock"]).Равно(False);
            ExpectsThat(Doc["rating"]).Равно(5);

        EndDo;

    ElsIf Option = "Check 2" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);
        ExpectsThat(Result["data"][0]["quantity"] > 10).Равно(True);

    ElsIf Option = "Check 3" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Doc In Result["data"] Do

            Found = False;

            For Each Tag In Doc["tags"] Do
                If Tag    = "updated" Then
                    Found = True;
                    Break;
                EndIf;
            EndDo;

            ExpectsThat(Found).Равно(True);

        EndDo;

    ElsIf Option = "Check 4" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Doc In Result["data"] Do

            ExpectsThat(Doc["details"]["supplier"]).Равно("Supplier A+");
            ExpectsThat(Doc["details"]["weightKg"]).Равно(2.5);

        EndDo;

    ElsIf Option = "Check 5" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);
        ExpectsThat(Result["data"][0]["productName"]).Равно("New product");
        ExpectsThat(Result["data"][0]["price"]).Равно(1999);

    ElsIf Option = "Check 6" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Doc In Result["data"] Do
            ExpectsThat(Doc["rating"]).Равно(Undefined);
        EndDo;

    ElsIf Option = "Check 7" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Doc In Result["data"] Do

            ExpectsThat(Doc["inStock"]).Равно(False);

            Found = False;

            For Each Tag In Doc["tags"] Do
                If Tag    = "discount" Then
                    Found = True;
                    Break;
                EndIf;
            EndDo;

            ExpectsThat(Found).Равно(True);

        EndDo;

    ElsIf Option = "Check 8_1" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Doc In Result["data"] Do

            ExpectsThat(Doc["price"]).Равно(888);
            ExpectsThat(Doc["discounted"]).Равно(True);

        EndDo;

    ElsIf Option = "Check 8_2" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);

        For Each Doc In Result["data"] Do

            Found = False;

            For Each Tag In Doc["tags"] Do
                If Tag    = "mass_update" Then
                    Found = True;
                    Break;
                EndIf;
            EndDo;

            ExpectsThat(Found).Равно(True);

        EndDo;

    ElsIf Option = "Check 8_3" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);
        ExpectsThat(Result["data"][0]["productName"]).Равно("Special item from array");
        ExpectsThat(Result["data"][0]["price"]).Равно(1111);

    ElsIf Option = "Check 8_4" Then

        ExpectsThat(Result["data"].Count() > 0).Равно(True);
        For Each Doc In Result["data"] Do
            ExpectsThat(Doc["needsImprovement"]).Равно(True);
        EndDo;

    ElsIf Option = "Obtaining" Then

        ExpectsThat(Result["data"].Count()).Равно(0);

    ElsIf Option = "Getting new" Then

        For Each Element In Result["data"] Do
            ExpectsThat(Element["doubleField"]).Равно(999);
        EndDo;

    ElsIf Option = "5" Then

        ExpectsThat(Result["data"]["upserted"].Count() > 0 Or Result["data"]["nModified"] > 0).Равно(True);

    Else
        ExpectsThat(Result["data"]["nModified"] > 0).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_GetDocumentUpdateStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_DeleteDocuments(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option    = "Check" Then
        ExpectsThat(Result["data"].Count()).Равно(1);
    ElsIf Option = "Precheck" Then
        ExpectsThat(Result["data"].Count()).Равно(2);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_CreateUser(Val Result, Val Option)

    If Option = "Existing" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_UpdateUser(Val Result, Val Option)

    If Option = "Nonexistent" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_DeleteUser(Val Result, Val Option)

    If Option = "Again" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_GetUsers(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Not ValueIsFilled(Option) Then
        ExpectsThat(Result["data"].Count()).Равно(2);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_GetDatabaseUsers(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]["users"].Count()).Равно(1);

    Return Result;

EndFunction

Function Check_MongoDB_DeleteDatabase(Val Result, Val Option)

    If Option = "Non-existent" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_CreateRole(Val Result, Val Option)

    If Option = "Existing" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_UpdateRole(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_DeleteRole(Val Result, Val Option)

    If Option = "Again" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_MongoDB_GrantRoles(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_RevokeRoles(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_GetRoles(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"]["roles"].Count()).Равно(1);

    Return Result;

EndFunction

Function Check_MongoDB_GetRolePrivilegeStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_MongoDB_GetDocumentDeletionStructure(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GRPC_CreateConnection(Val Result, Val Option)

    If Option    = "Closing" Then
        ExpectsThat(Result["result"]).Равно(True);
    ElsIf Option = "Error" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        Result   = String(TypeOf(Result));
        ExpectsThat(Result).Равно("AddIn.OPI_GRPC.Main");
    EndIf;

    Return Result;

EndFunction

Function Check_GRPC_CloseConnection(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_GRPC_IsConnector(Val Result, Val Option)

    ExpectsThat(Result).Равно(True);

    Return Result;

EndFunction

Function Check_GRPC_GetConnectionParameters(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GRPC_GetTlsSettings(Val Result, Val Option)

    ExpectsThat(OPI_Tools.ThisIsCollection(Result, True)).Равно(True);

    Return Result;

EndFunction

Function Check_GRPC_GetServiceList(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"].Count()).Равно(1);
    Return Result;

EndFunction

Function Check_GRPC_GetMethodList(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"].Count() > 3).Равно(True);
    Return Result;

EndFunction

Function Check_GRPC_GetMethod(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    Return Result;

EndFunction

Function Check_GRPC_ExecuteMethod(Val Result, Val Option, Data = Undefined)

    ExpectsThat(Result["result"]).Равно(True);

    If Data = "Meta" Then

        ResultAsString = OPI_Tools.JSONString(Result);
        ExpectsThat(StrFind(ResultAsString, "somekey") > 0).Равно(True);

    ElsIf Data = "Meta 2" Then

        ResultAsString                                 = OPI_Tools.JSONString(Result);
        ExpectsThat(StrFind(ResultAsString, "somekey") = 0).Равно(True);
        ExpectsThat(StrFind(ResultAsString, "anotherkey") > 0).Равно(True);

    Else

        FieldList = StrSplit("f_bytes,f_bytess", ",");
        ExpectsThat(OPI_Tools.CompareTwoCollections(Result["message"], Data, FieldList)).Равно(True);

    EndIf;

    Return Result;

EndFunction

Function Check_GRPC_SetMetadata(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    If Option = "Check" Then

        ResultAsString = OPI_Tools.JSONString(Result);
        ExpectsThat(StrFind(ResultAsString, "somekey") > 0).Равно(True);

    EndIf;

    Return Result;

EndFunction

Function Check_GRPC_InitializeServerStream(Val Result, Val Option)

    If Option = "Array" Then
        ExpectsThat(Result.Count() > 0).Равно(True);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_GRPC_InitializeClientStream(Val Result, Val Option, SendCount = Undefined)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(SendCount).Равно(10);

    Return Result;

EndFunction

Function Check_GRPC_InitializeBidirectionalStream(Val Result, Val Option, ResultArray = Undefined)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(ResultArray.Count()).Равно(10);

    For N = 0 To ResultArray.Count() - 1 Do
        ExpectsThat(ResultArray[N]["f_int32"]).Равно(N + 1);
    EndDo;

    Return Result;

EndFunction

Function Check_GRPC_SendMessage(Val Result, Val Option, Closing = Undefined)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Closing["result"]).Равно(True);

    Return Result;

EndFunction

Function Check_GRPC_GetMessage(Val Result, Val Option, Closing = Undefined, Data = Undefined)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Closing["result"]).Равно(True);

    FieldList = StrSplit("f_bytes,f_bytess,f_float", ",");
    ExpectsThat(Left(String(Result["message"]["f_float"])        , 4)).Равно(Left(String(Data["f_float"]), 4));
    ExpectsThat(OPI_Tools.CompareTwoCollections(Result["message"], Data                                  , FieldList)).Равно(True);

    Return Result;

EndFunction

Function Check_GRPC_CloseStream(Val Result, Val Option)

    If Option = "Sending" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_GRPC_ProcessServerStream(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"].Count()).Равно(3);

    Return Result;

EndFunction

Function Check_GRPC_ProcessClientStream(Val Result, Val Option)

    If Option = "Error" Then
        ExpectsThat(Result["result"]).Равно(False);
    Else
        ExpectsThat(Result["result"]).Равно(True);
    EndIf;

    Return Result;

EndFunction

Function Check_GRPC_ProcessBidirectionalStream(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["data"].Count()).Равно(10);

    Return Result;

EndFunction

Function Check_GRPC_CompleteSend(Val Result, Val Option)

    ExpectsThat(Result["result"]).Равно(True);

    Return Result;

EndFunction

#EndRegion

#Region ReportPortal

Procedure WriteMissingTest(Val Library, Val Method, Val Option)

    Data = GetExistingLaunch();

    If Data = Undefined Then
        Return;
    EndIf;

    SetID     = CreateLaunchSet(Library);
    ElementID = CreateTestElement(SetID, Library, Method, Option);

    Token   = GetParameter("RPortal_Token");
    Project = GetParameter("RPortal_MainProject");
    URL     = GetParameter("RPortal_URL");

    CurrentDate = GetLaunchTime();

    ElementStructure = New Structure;

    ElementStructure.Insert("endTime"   , CurrentDate);
    ElementStructure.Insert("launchUuid", Data["id"]);
    ElementStructure.Insert("status"    , "skipped");

    ReportPortal().FinishItem(URL, Token, Project, ElementID, ElementStructure);

EndProcedure

Procedure WriteTestLog(Val Test, Val Text, Val Level)

    Data = GetExistingLaunch();

    If Data = Undefined Then
        Return;
    EndIf;

    CurrentDate = GetLaunchTime();

    Token   = GetParameter("RPortal_Token");
    Project = GetParameter("RPortal_MainProject");
    URL     = GetParameter("RPortal_URL");

    LogStructure = New Structure;
    LogStructure.Insert("launchUuid", Data["id"]);
    LogStructure.Insert("itemUuid"  , Test);
    LogStructure.Insert("time"      , CurrentDate);
    LogStructure.Insert("message"   , Text);
    LogStructure.Insert("level"     , Level);

    ReportPortal().WriteLog(URL, Token, Project, LogStructure);

EndProcedure

Procedure FinishTestElement(Val UUID, Val Status)

    Data = GetExistingLaunch();

    If Data = Undefined Then
        Return;
    EndIf;

    Token   = GetParameter("RPortal_Token");
    Project = GetParameter("RPortal_MainProject");
    URL     = GetParameter("RPortal_URL");

    CurrentDate = GetLaunchTime();

    ElementStructure = New Structure;

    ElementStructure.Insert("endTime"   , CurrentDate);
    ElementStructure.Insert("launchUuid", Data["id"]);
    ElementStructure.Insert("status"    , Status);

    ReportPortal().FinishItem(URL, Token, Project, UUID, ElementStructure);

    FoundTest = Data["items"].Get(UUID);

    If ValueIsFilled(FoundTest) Then
        Data["tests"].Add(FoundTest);
    EndIf;

    WriteLaunchFile(Data);

EndProcedure

Procedure WriteLaunchFile(Val Data)

    LaunchFile = GetParameter("RPortal_MainLaunch");
    OPI_Tools.WriteJSONFile(LaunchFile, Data);

EndProcedure

Procedure CreateLaunchFile(Val UUID)

    TFN = GetTempFileName();

    DataStructure = New Structure;
    DataStructure.Insert("id"    , UUID);
    DataStructure.Insert("ended" , False);
    DataStructure.Insert("suites", New Map);
    DataStructure.Insert("tests" , New Array);
    DataStructure.Insert("items" , New Map);

    OPI_Tools.WriteJSONFile(TFN, DataStructure);
    WriteParameter("RPortal_MainLaunch", TFN);

EndProcedure

Function GetExistingLaunch()

    Data      = ReadLaunchFile();
    UID       = Data["id"];
    Completed = Data["ended"];

    If Not ValueIsFilled(UID) Or Completed Then
        Return Undefined;
    Else
        Return Data;
    EndIf;

EndFunction

Function GetLaunchTime()

    Shift       = ?(OPI_Tools.IsWindows(), 3600 * 3, 0);
    CurrentDate = OPI_Tools.GetCurrentDate() - Shift;

    Return CurrentDate;

EndFunction

Function ReadLaunchFile()

    LaunchFile = GetParameter("RPortal_MainLaunch");

    LaunchObject = New File(LaunchFile);

    If Not ValueIsFilled(LaunchFile) Or Not LaunchObject.Exists() Then
        Return New Map;
    EndIf;

    Data = OPI_Tools.ReadJSONFile(LaunchFile, True);
    Return Data;

EndFunction

Function ReportPortal()

    Try

        // BSLLS:CommonModuleAssign-off

        //@skip-check property-not-writable
        //@skip-check bsl-legacy-check-static-feature-access
        OPI_ReportPortal = Undefined;

        // BSLLS:CommonModuleAssign-on

        // !OInt CurrentDirectory = StrReplace(CurrentScript().Path, "\", "/");
        // !OInt PathArray = StrSplit(CurrentDirectory, "/");
        // !OInt PathArray.Delete(PathArray.UBound());
        // !OInt PathArray.Delete(PathArray.UBound());
        // !OInt PathArray.Add("core");
        // !OInt PathArray.Add("Modules");
        // !OInt PathArray.Add("OPI_ReportPortal.os");
        // !OInt AttachScript(StrConcat(PathArray, "/"), "ReportPortal");
        // !OInt OPI_ReportPortal = New("ReportPortal");

        Return OPI_ReportPortal;

    Except

        Return OPI_ReportPortal;

    EndTry;

EndFunction

#EndRegion

#Region Miscellaneous

Function GetValueFromFile(Parameter, Path)

    Values = OPI_Tools.ReadJSONFile(Path);
    Return ?(Values.Property(Parameter), Values[Parameter], "");

EndFunction

Function DataFilePath()

    Path          = "";
    PossiblePaths = New Array;
    PossiblePaths.Add("./data.json");
    PossiblePaths.Add("C:\GDrive\My Drive\data.json");
    PossiblePaths.Add("G:\My Drive\data.json");

    For Each PossiblePath In PossiblePaths Do

        RepositoryFile = New File(PossiblePath);

        If RepositoryFile.Exists() Then
            Path = PossiblePath;
            Break;
        EndIf;

    EndDo;

    Return Path;

EndFunction

Function GetCommonModule(Val Name)
    SetSafeMode(True);
    Module = Eval(Name);
    Return Module;
EndFunction

Function GetCLIFormedValue(Val Value, Val Embedded = False, AddOptions = "")

    CurrentType       = TypeOf(Value);
    CurrentTypeString = String(CurrentType);
    Cover             = False;

    If CurrentType = Type("Number") Then

        If Not Embedded Then
            Value = OPI_Tools.NumberToString(Value);
        EndIf;

    ElsIf CurrentType = Type("String") Or CurrentType = Type("UUID") Then

        Value = OPI_Tools.NumberToString(Value);

        If Embedded Then
            Value = StrReplace(Value, Chars.LF, " ");
        Else
            Value = StrReplace(Value, Chars.LF, "\n");
            Cover = True;
        EndIf;

        If OPI_Tools.IsWindows() Then
            Value = StrReplace(Value, "%", "%%");
        EndIf;

    ElsIf CurrentType = Type("Date") Then

        If Not Embedded Then
            Value = XMLString(Value);
            Cover = True;
        EndIf;

    ElsIf CurrentType = Type("Structure") Or CurrentType = Type("Map") Or CurrentType = Type("Array") Then

        If CurrentType = Type("Structure") Or CurrentType = Type("Map") Then

            Value_ = New (CurrentTypeString);

            For Each KeyValue In Value Do
                Value_.Insert(KeyValue.Key, GetCLIFormedValue(KeyValue.Value, True, AddOptions));
            EndDo;

            Value = Value_;

        EndIf;

        If CurrentType = Type("Map") Then

            Value_ = New Map;

            For Each KeyValue In Value Do
                Value_.Insert(GetCLIFormedValue(KeyValue.Key, True, AddOptions), KeyValue.Value);
            EndDo;

            Value = Value_;

        EndIf;

        JSONWriter = New JSONWriter;

        If CurrentType = Type("Array") Or Embedded Then

            If CurrentType   = Type("Array") Then
                For N        = 0 To Value.UBound() Do
                    Value[N] = GetCLIFormedValue(Value[N], True, AddOptions);
                EndDo;
            EndIf;

            If Not Embedded Then
                WriterSettings = New JSONWriterSettings(JSONLineBreak.None, , False);
                JSONWriter.SetString(WriterSettings);
                WriteJSON(JSONWriter, Value);

                Value = JSONWriter.Close();
                Cover = True;
            EndIf;

        Else

            // BSLLS:MissingTemporaryFileDeletion-off

            //@skip-check missing-temporary-file-deletion
            TFN = GetTempFileName("json");

            // BSLLS:MissingTemporaryFileDeletion-on

            OPI_Tools.WriteJSONFile(TFN, Value);

            Value = TFN;
            Cover = True;

        EndIf;

    ElsIf CurrentType = Type("Boolean") Then

        If Not Embedded Then
            Value = ?(Value, "true", "false");
            Cover = False;
        EndIf;

    ElsIf CurrentType = Type("BinaryData") Then

        // BSLLS:MissingTemporaryFileDeletion-off

        //@skip-check missing-temporary-file-deletion
        TFN = GetTempFileName();
        Value.Write(TFN);
        Value = TFN;
        Cover = Not Embedded;

        // BSLLS:MissingTemporaryFileDeletion-on

    ElsIf StrStartsWith(CurrentTypeString, "AddIn") Then

        Value = ProcessAddInParamCLI(Value, CurrentTypeString, AddOptions);
        Cover = Not Embedded;

    ElsIf CurrentType = Type("Undefined") And Embedded Then

        Value = Undefined;

    Else

        Raise "Invalid type " + CurrentTypeString;

    EndIf;

    If Not OPI_Tools.IsWindows() And Not Embedded Then
        Value = StrReplace(Value, """", """'""");
    EndIf;

    If Cover Then
        Value = """" + Value + """";
    EndIf;

    Return Value;

EndFunction

Function ProcessAddInParamCLI(Val Value, Val ValeType, AddOptions)

    AddInName = Upper(StrSplit(ValeType, ".")[1]);

    If AddInName = "OPI_POSTGRESQL" Or AddInName = "OPI_MYSQL" Or AddInName = "OPI_MSSQL" Then

        If AddInName = "OPI_MSSQL" Then

            TLS = New Structure("use_tls, accept_invalid_certs, ca_cert_path", True, True, "");
            AddOptions.Insert("tls", TLS);

        Else

            TLS = Value.GetTLSSettings();

            If ValueIsFilled(TLS) Then
                OPI_TypeConversion.GetCollection(TLS);
                AddOptions.Insert("tls", TLS);
            EndIf;

        EndIf;

        Value = Value["ConnectionString"];

    ElsIf AddInName = "OPI_MONGODB" Then

        Value = Value["ConnectionString"];

    ElsIf AddInName = "OPI_SQLITE" Then

        Value = Value["Database"];

    ElsIf AddInName = "OPI_TCPCLIENT" Then

        Value = Value["Address"];

    ElsIf AddInName = "OPI_RCON" Or AddInName = "OPI_GRPC" Then

        Value = Value.GetSettings();

        Message(Value);

        OPI_TypeConversion.GetKeyValueCollection(Value);
        TFN = GetTempFileName();
        OPI_Tools.WriteJSONFile(TFN, Value);

        Value = TFN;

    ElsIf AddInName = "OPI_FTP" Then

        Value = Value.GetConfiguration();
        OPI_TypeConversion.GetKeyValueCollection(Value);

        Data          = Value["data"];
        Configuration = New Structure;

        Configuration.Insert("set", Data["ftp_settings"]);

        If ValueIsFilled(Data["tls_settings"]) Then
            Configuration.Insert("tls", Data["tls_settings"]);
        EndIf;

        If ValueIsFilled(Data["proxy_settings"]) Then
            Configuration.Insert("proxy", Data["proxy_settings"]);
        EndIf;

        TFN = GetTempFileName();
        OPI_Tools.WriteJSONFile(TFN, Configuration);

        Value = TFN;

    ElsIf AddInName = "OPI_SSH" Then

        Value = Value.GetConfiguration();
        OPI_TypeConversion.GetKeyValueCollection(Value);

        Value = Value["conf"];

        TFN = GetTempFileName();
        OPI_Tools.WriteJSONFile(TFN, Value);

        Value = TFN;

    Else
        Raise "Invalid type " + ValeType;
    EndIf;

    Return Value;

EndFunction

Function FormOption(Val Name, Val Value, Embedded = False)

    SecretsArray = GetSecretKeyArray();

    ExceptionsList = New ValueList;
    ExceptionsList.Add("passive");
    ExceptionsList.Add("keyboard");

    ReplaceStructure = New Map;
    ReplaceStructure.Insert("host.docker.internal", "127.0.0.1");

    Cover = False;

    If TypeOf(Value) = Type("String") Then

        For Each SecretKey In SecretsArray Do

            If StrFind(Lower(Name), SecretKey) <> 0 And ExceptionsList.FindByValue(Lower(Name)) = Undefined Then

                Value = "***";
                Cover = True;

            EndIf;

        EndDo;

        For Each ReplaceValue In ReplaceStructure Do
            Value = StrReplace(Value, ReplaceValue.Key, ReplaceValue.Value);
        EndDo;

        ValueAsString = Value;

        If Not Embedded And StrStartsWith(ValueAsString, """") And StrEndsWith(ValueAsString, """") Then

            ValueAsString = Left(ValueAsString, StrLen(ValueAsString) - 1);
            ValueAsString = Right(ValueAsString, StrLen(ValueAsString) - 1);

            Cover = True;

        EndIf;

        Value = ValueAsString;
        OPI_TypeConversion.GetCollection(Value, False);

    Else
        ValueAsString = "-----------!!!!№№№---------------";
    EndIf;

    If TypeOf(Value) = Type("Array") Then

        If Not Value.Count() = 0 Then

            If String(Value[0]) = ValueAsString Then
                Value           = ValueAsString;
            Else

                For N        = 0 To Value.UBound() Do
                    Value[N] = FormOption("", Value[N], True);
                EndDo;

            EndIf;

        EndIf;

    ElsIf OPI_Tools.ThisIsCollection(Value, True) Then

        Value_ = New (TypeOf(Value));

        For Each KeyValue In Value Do
            Value_.Insert(KeyValue.Key, FormOption(KeyValue.Key, KeyValue.Value, True));
        EndDo;

        Value = Value_;

    Else

        OPI_TypeConversion.GetLine(Value);

    EndIf;

    If Embedded Then
        Return Value;
    Else

        If Not TypeOf(Value) = Type("String") Then
            Try
                Value        = OPI_Tools.JSONString(Value, , False, False);
            Except
                Value        = String(Value);
            EndTry;
        EndIf;

        Value = ?(Cover, StrTemplate("""%1""", Value), Value);
        Return "--" + Name + " " + Value;

    EndIf;

EndFunction

Function ReadCLIResponse(Val ResultFile)

    Try

        // BSLLS:ExternalAppStarting-off
        JSONReader = New JSONReader;
        JSONReader.OpenFile(ResultFile);
        Result = ReadJSON(JSONReader, True);
        JSONReader.Close();
        // BSLLS:ExternalAppStarting-on

    Except

        Message(DetailErrorDescription(ErrorInfo()));

        Try
            Result = New BinaryData(ResultFile);

            If Result.Size() < 10000 Then
                Result = GetStringFromBinaryData(Result);
            EndIf;

        Except
            Result = Null;
        EndTry;

    EndTry;

    Return Result;

EndFunction

Function PrintLog(Val Result, Val Method, Val Library, Val ErrorDescription = Undefined)

    Header = String(OPI_Tools.GetCurrentDate()) + " | " + Method;

    Data = TestResultAsText(Result);

    Text = Header + Chars.LF + Chars.LF;

    If ValueIsFilled(ErrorDescription) Then
        Text = Text + ErrorDescription + Chars.LF + Chars.LF + "---------------------------------" + Chars.LF
            + Chars.LF;
    EndIf;

    Text = Text + Data + Chars.LF + Chars.LF + "---------------------------------" + Chars.LF;

    Message(Text);

    Return Text;

EndFunction

Function TestResultAsText(Val Result)

    Try
        Data = OPI_Tools.JSONString(Result);
    Except
        Data = String(Result);
    EndTry;

    Data = TrimAll(Data);

    Return Data;

EndFunction

Function ReplaceSecretsRecursively(Value, Val Indicators, Val Hide = False)

    If TypeOf(Value) = Type("Array") Then

        Value_ = New Array;

        For Each Element In Value Do
            Value_.Add(ReplaceSecretsRecursively(Element, Indicators, Hide));
        EndDo;

    ElsIf OPI_Tools.ThisIsCollection(Value, True) Then

        Value_ = New(TypeOf(Value));

        For Each Element In Value Do

            CurrentKey   = Element.Key;
            CurrentValue = Element.Value;

            If OPI_Tools.ThisIsCollection(CurrentValue) Then
                CurrentValue = ReplaceSecretsRecursively(CurrentValue, Indicators);
            Else

                For Each Indication In Indicators Do

                    CurrentKeyN = Lower(CurrentKey);
                    AttributeN  = Lower(Indication);

                    If StrFind(CurrentKeyN, AttributeN) > 0 Then
                        CurrentValue = ReplaceSecretsRecursively(CurrentValue, Indicators, True);
                        Break;
                    EndIf;

                EndDo;

            EndIf;

            Value_.Insert(CurrentKey, CurrentValue);

        EndDo;

    Else

        If Hide Then
            Value_ = "***";
        Else
            Value_ = Value;
        EndIf;

        If TypeOf(Value_) = Type("String") Then
            If StrLen(Value_) > 100 Then
                Value_    = Left(Value_, 100) + "...";
            EndIf;
        EndIf;

    EndIf;

    Return Value_;

EndFunction

Function GetSecretKeyArray()

    SecretsArray = New Array;
    SecretsArray.Add("token");
    SecretsArray.Add("key");
    SecretsArray.Add("secret");
    SecretsArray.Add("pass");
    SecretsArray.Add("password");
    SecretsArray.Add("client");
    SecretsArray.Add("api");
    SecretsArray.Add("refresh");
    SecretsArray.Add("phone");
    SecretsArray.Add("idInstance");
    SecretsArray.Add("wid");
    SecretsArray.Add("sender");
    SecretsArray.Add("chat");
    SecretsArray.Add("invite");
    SecretsArray.Add("origin");

    Return SecretsArray;

EndFunction

Procedure NewTest(ValueTable, Val Method, Val Synonym, Val Section)

    NewTest         = ValueTable.Add();
    NewTest.Method  = Method;
    NewTest.Synonym = Synonym;
    NewTest.Section = Section;

EndProcedure

Procedure WriteParameterToFile(Val Parameter, Val Value, Val Path)

    Values = OPI_Tools.ReadJSONFile(Path);
    Values.Insert(Parameter, Value);

    // BSLLS:ExternalAppStarting-off
    Record = New JSONWriter;
    JSONWriterSettings = New JSONWriterSettings(JSONLineBreak.Auto, Chars.Tab);
    Record.OpenFile(Path, , , JSONWriterSettings);
    WriteJSON(Record, Values);
    Record.Close();
    // BSLLS:ExternalAppStarting-on

EndProcedure

Procedure WriteCLICall(Val Library, Val Method, Val Options)

    If Not OPI_Tools.IsOneScript() Then
        Return;
    EndIf;

    CatalogExample = "./docs/en/cli/" + Library;
    FileExample    = New File(CatalogExample);

    If Not FileExample.Exists() Then
        CreateDirectory(CatalogExample);
    EndIf;

    MethodCatalog = CatalogExample + "/" + Method;
    MethodFile    = New File(MethodCatalog);

    If Not MethodFile.Exists() Then
        CreateDirectory(MethodCatalog);
    EndIf;

    OptionsArray = New Array;
    FindJSON     = False;

    For Each Option In Options Do

        CurrentOption = Option.Value;

        ProcessSpecialOptionsSecrets(Library, Option.Key, CurrentOption);

        CurrentOption = FormOption(Option.Key, CurrentOption);

        If Not FindJSON Then
            FindJSON = StrFind(CurrentOption, "{") > 0 And StrFind(CurrentOption, "}") > 0;
        EndIf;

        OptionsArray.Add(CurrentOption);

    EndDo;

    Start = "oint ";

    If FindJSON Then

        Information = "JSON data can also be passed as a path to a .json file";

        StartBat  = ":: " + Information + Chars.LF + Chars.LF + Start;
        StartBash = "# " + Information + Chars.LF + Chars.LF + Start;

    Else

        StartBat  = Start;
        StartBash = Start;

    EndIf;

    BatSeparator  = " ^" + Chars.LF + " ";
    BashSeparator = " \" + Chars.LF + " ";

    BatString  = StartBat + Library + " " + Method + BatSeparator + StrConcat(OptionsArray, BatSeparator);
    BashString = StartBash + Library + " " + Method + BashSeparator + StrConcat(OptionsArray, BashSeparator);

    GetBinaryDataFromString(BatString).Write(MethodCatalog + "/bat.txt");
    GetBinaryDataFromString(BashString).Write(MethodCatalog + "/bash.txt");

EndProcedure

Procedure WriteLogFile(Val Data, Val Method, Val Library, Val Overwrite = True)

    If Not OPI_Tools.IsOneScript() Then
        Return;
    EndIf;

    Try

        LogPath        = "./docs/en/results";
        LibraryLogPath = LogPath + "/" + Library;
        FilePath       = LibraryLogPath + "/" + Method + ".log";

        If Not Overwrite Then

            LogObject = New File(FilePath);

            If LogObject.Exists() Then
                Return;
            EndIf;

        EndIf;

        LogDirectory = New File(LogPath);

        If Not LogDirectory.Exists() Then
            CreateDirectory(LogPath);
        EndIf;

        LibraryLogCatalog = New File(LibraryLogPath);

        If Not LibraryLogCatalog.Exists() Then
            CreateDirectory(LibraryLogPath);
        EndIf;

        If OPI_Tools.ThisIsCollection(Data) Then

            SecretsArray = GetSecretKeyArray();
            Data         = ReplaceSecretsRecursively(Data, SecretsArray);

        EndIf;

        DataText = TestResultAsText(Data);

        LogDocument = New TextDocument;
        LogDocument.SetText(DataText);
        LogDocument.Write(FilePath);

    Except
        Message("Failed to write log file!: " + ErrorDescription());
    EndTry;

EndProcedure

Procedure ProcessSpecialOptionsSecrets(Val Library, Val Option, Value)

    Value_ = Value;

    If Library = "bitrix24" Then

        ProcessSecretsBitrix24(Option, Value);

    ElsIf Library = "postgres" Then

        ProcessSecretsPostgreSQL(Option, Value);

    ElsIf Library = "mysql" Then

        ProcessSecretsMySQL(Option, Value);

    ElsIf Library = "mssql" Then

        ProcessSecretsMSSQL(Option, Value);

    ElsIf Library = "ollama" Then

        ProcessSecretsMySQLOllama(Option, Value);

    ElsIf Library = "vk" Then

        ProcessSecretsVK(Option, Value);

    Else
        Return;
    EndIf;

    If Not Value_ = Value Then
        Value     = StrTemplate("""%1""", Value);
    EndIf;

EndProcedure

Procedure ProcessSecretsBitrix24(Val Option, Value)

    If Option = "url" Then

        Value = ?(StrFind(Value, "rest") > 0, "https://b24-ar17wx.bitrix24.by/rest/1/***", Value);

    EndIf;

EndProcedure

Procedure ProcessSecretsPostgreSQL(Val Option, Value)

    If Option = "dbc" Then

        Value = "postgresql://bayselonarrend:***@127.0.0.1:5432/";

    ElsIf Option = "addr" Then

        Value = "127.0.0.1";

    Else
        Return;
    EndIf;

EndProcedure

Procedure ProcessSecretsMySQL(Val Option, Value)

    If Option = "dbc" Then

        Value = "mysql://bayselonarrend:***@127.0.0.1:3306/";

    ElsIf Option = "addr" Then

        Value = "127.0.0.1";

    Else
        Return;
    EndIf;

EndProcedure

Procedure ProcessSecretsMSSQL(Val Option, Value)

    If Option = "dbc" Then

        Value = "Server=127.0.0.1;Database=***;User Id=SA;Password=***;";

    ElsIf Option = "addr" Then

        Value = "127.0.0.1";

    Else
        Return;
    EndIf;

EndProcedure

Procedure ProcessSecretsMySQLOllama(Val Option, Value)

    If Option = "headers" Then

        Value = OPI_Tools.JSONString(New Structure("Authorization", "***"));

    Else
        Return;
    EndIf;

EndProcedure

Procedure ProcessSecretsVK(Val Option, Value)

    If Option = "ct" Then

        Value = "***";

    EndIf;

EndProcedure

#EndRegion

#EndRegion
