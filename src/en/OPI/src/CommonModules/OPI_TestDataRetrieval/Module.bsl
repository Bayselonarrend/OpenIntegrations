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

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-method

// Uncomment if OneScript is executed
// #Use "./internal"
// #Use asserts

#Region Internal

Function GetTestingSectionMapping() Export

    Sections = New Structure;
    Sections.Insert("Telegram"       , 5);
    Sections.Insert("VK"             , 5);
    Sections.Insert("Viber"          , 5);
    Sections.Insert("Twitter"        , 4);
    Sections.Insert("FTP"            , 5);
    Sections.Insert("PostgreSQL"     , 5);
    Sections.Insert("MySQL"          , 5);
    Sections.Insert("MSSQL"          , 5);
    Sections.Insert("SQLite"         , 5);
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
    Sections.Insert("Ozon"           , 5);
    Sections.Insert("Neocities"      , 5);
    Sections.Insert("CDEK"           , 5);
    Sections.Insert("YandexMetrika"  , 5);
    Sections.Insert("S3"             , 5);
    Sections.Insert("TCP"            , 5);
    Sections.Insert("GreenAPI"       , 5);
    Sections.Insert("Ollama"         , 5);
    Sections.Insert("HTTPClient"     , 5);
    Sections.Insert("OpenAI"         , 5);

    Return Sections;

EndFunction

Function GetTestingSectionMappingGA() Export

    StandardDependencies = "[Decode, Build]";
    GoogleDependencies   = "Testing-GoogleWorkspace";

    Sections = New Structure;
    Sections.Insert("Telegram"       , StandardDependencies);
    Sections.Insert("VK"             , StandardDependencies);
    Sections.Insert("Viber"          , StandardDependencies);
    Sections.Insert("Twitter"        , StandardDependencies);
    Sections.Insert("FTP"            , StandardDependencies);
    Sections.Insert("PostgreSQL"     , StandardDependencies);
    Sections.Insert("MySQL"          , StandardDependencies);
    Sections.Insert("MSSQL"          , StandardDependencies);
    Sections.Insert("SQLite"         , StandardDependencies);
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
    Sections.Insert("Ozon"           , StandardDependencies);
    Sections.Insert("Neocities"      , StandardDependencies);
    Sections.Insert("CDEK"           , StandardDependencies);
    Sections.Insert("YandexMetrika"  , StandardDependencies);
    Sections.Insert("S3"             , StandardDependencies);
    Sections.Insert("TCP"            , StandardDependencies);
    Sections.Insert("GreenAPI"       , StandardDependencies);
    Sections.Insert("Ollama"         , StandardDependencies);
    Sections.Insert("HTTPClient"     , StandardDependencies);
    Sections.Insert("OpenAI"         , StandardDependencies);

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
    Ozon      = "Ozon";
    Neocities = "Neocities";
    Cdek      = "CDEK";
    Metrika   = "YandexMetrika";
    S3_       = "S3";
    TCP       = "TCP";
    SQLite    = "SQLite";
    Postgres  = "PostgreSQL";
    GreenAPI  = "GreenAPI";
    RCON      = "RCON";
    MySQL     = "MySQL";
    Ollama    = "Ollama";
    Http      = "HTTPClient";
    OpenAI    = "OpenAI";
    MSSQL     = "MSSQL";
    FTP       = "FTP";

    TestTable = New ValueTable;
    TestTable.Columns.Add("Method");
    TestTable.Columns.Add("Synonym");
    TestTable.Columns.Add("Section");

    NewTest(TestTable, "TelegramAPI_GetBotInfo"               , "Get bot information"             , Telegram);
    NewTest(TestTable, "TelegramAPI_GetUpdates"               , "Get updates"                     , Telegram);
    NewTest(TestTable, "TelegramAPI_SetWebhook"               , "Set Webhook"                     , Telegram);
    NewTest(TestTable, "TelegramAPI_SendTextMessage"          , "Send text message"               , Telegram);
    NewTest(TestTable, "TelegramAPI_SendImage"                , "Send image"                      , Telegram);
    NewTest(TestTable, "TelegramAPI_SendVideo"                , "Send video"                      , Telegram);
    NewTest(TestTable, "TelegramAPI_SendAudio"                , "Send audio"                      , Telegram);
    NewTest(TestTable, "TelegramAPI_SendDocument"             , "Send document"                   , Telegram);
    NewTest(TestTable, "TelegramAPI_SendGIF"                  , "Send GIF"                        , Telegram);
    NewTest(TestTable, "TelegramAPI_SendMediaGroup"           , "Send mediagroup"                 , Telegram);
    NewTest(TestTable, "TelegramAPI_SendLocation"             , "Send location"                   , Telegram);
    NewTest(TestTable, "TelegramAPI_SendContact"              , "Send contact"                    , Telegram);
    NewTest(TestTable, "TelegramAPI_SendPoll"                 , "Send poll"                       , Telegram);
    NewTest(TestTable, "TelegramAPI_ForwardMessage"           , "Forward message"                 , Telegram);
    NewTest(TestTable, "TelegramAPI_BanUnban"                 , "Ban/Unban"                       , Telegram);
    NewTest(TestTable, "TelegramAPI_CreateInvitationLink"     , "Create invitation link"          , Telegram);
    NewTest(TestTable, "TelegramAPI_PinUnpinMessage"          , "Pin/Unpin message"               , Telegram);
    NewTest(TestTable, "TelegramAPI_GetMemberCount"           , "Get participant count"           , Telegram);
    NewTest(TestTable, "TelegramAPI_GetForumAvatarsList"      , "Get forum avatars list"          , Telegram);
    NewTest(TestTable, "TelegramAPI_CreateDeleteForumTopic"   , "Create/Delete forum topic"       , Telegram);
    NewTest(TestTable, "TelegramAPI_ChangeMainTopicName"      , "Change main topic name"          , Telegram);
    NewTest(TestTable, "TelegramAPI_HideShowMainTopic"        , "Hide/Show main topic"            , Telegram);
    NewTest(TestTable, "VKAPI_CreateTokenLink"                , "Create token retrieval link"     , VKontakte);
    NewTest(TestTable, "VKAPI_CreateDeletePost"               , "Create/Delete post"              , VKontakte);
    NewTest(TestTable, "VKAPI_CreateCompositePost"            , "Create/Delete composite post"    , VKontakte);
    NewTest(TestTable, "VKAPI_CreatePoll"                     , "Create poll"                     , VKontakte);
    NewTest(TestTable, "VKAPI_SaveDeleteImage"                , "Add/Delete image"                , VKontakte);
    NewTest(TestTable, "VKAPI_CreateStory"                    , "Create story"                    , VKontakte);
    NewTest(TestTable, "VKAPI_DiscussionMethods"              , "Actions with discussions"        , VKontakte);
    NewTest(TestTable, "VKAPI_LikeRepostComment"              , "Like/Repost/Comment"             , VKontakte);
    NewTest(TestTable, "VKAPI_GetStatistics"                  , "Get statistics"                  , VKontakte);
    NewTest(TestTable, "VKAPI_GetPostStatistics"              , "Get post statistics"             , VKontakte);
    NewTest(TestTable, "VKAPI_CreateAdCampaign"               , "Create advertising campaign"     , VKontakte);
    NewTest(TestTable, "VKAPI_SendMessage"                    , "Send message"                    , VKontakte);
    NewTest(TestTable, "VKAPI_GetProductCategories"           , "Get product categories"          , VKontakte);
    NewTest(TestTable, "VKAPI_CreateProductSelection"         , "Create product and selection"    , VKontakte);
    NewTest(TestTable, "VKAPI_CreateProductWithProperties"    , "Create product with properties"  , VKontakte);
    NewTest(TestTable, "VKAPI_GetProductList"                 , "Get product list"                , VKontakte);
    NewTest(TestTable, "VKAPI_GetSelectionList"               , "Get selection list"              , VKontakte);
    NewTest(TestTable, "VKAPI_GetPropertyList"                , "Get property list"               , VKontakte);
    NewTest(TestTable, "VKAPI_GetOrderList"                   , "Get order list"                  , VKontakte);
    NewTest(TestTable, "VKAPI_UploadVideo"                    , "Upload video"                    , VKontakte);
    NewTest(TestTable, "YDisk_GetDiskInfo"                    , "Get disk information"            , YDisk);
    NewTest(TestTable, "YDisk_CreateFolder"                   , "Create folder"                   , YDisk);
    NewTest(TestTable, "YDisk_UploadByUrlAndGetObject"        , "Upload by URL and get"           , YDisk);
    NewTest(TestTable, "YDisk_UploadDeleteFile"               , "Upload/Delete file"              , YDisk);
    NewTest(TestTable, "YDisk_CreateObjectCopy"               , "Create object copy"              , YDisk);
    NewTest(TestTable, "YDisk_GetDownloadLink"                , "Get download link"               , YDisk);
    NewTest(TestTable, "YDisk_GetFileList"                    , "Get list of files"               , YDisk);
    NewTest(TestTable, "YDisk_MoveObject"                     , "Move object"                     , YDisk);
    NewTest(TestTable, "YDisk_PublicObjectActions"            , "Actions with public objects"     , YDisk);
    NewTest(TestTable, "YDisk_GetPublishedList"               , "Get published list"              , YDisk);
    NewTest(TestTable, "GW_Auth"                              , "Authorization"                   , VSpace);
    NewTest(TestTable, "GW_Auth"                              , "Authorization"                   , Calendar);
    NewTest(TestTable, "GC_GetCalendarList"                   , "Get list of calendars"           , Calendar);
    NewTest(TestTable, "GC_CreateDeleteCalendar"              , "Create/Delete calendar"          , Calendar);
    NewTest(TestTable, "GC_CreateDeleteEvent"                 , "Create/Delete event"             , Calendar);
    NewTest(TestTable, "GW_Auth"                              , "Authorization"                   , Drive);
    NewTest(TestTable, "GD_GetCatalogList"                    , "Get list of directories"         , Drive);
    NewTest(TestTable, "GD_UploadDeleteFile"                  , "Upload/Delete file"              , Drive);
    NewTest(TestTable, "GD_CreateDeleteComment"               , "Create/Delete Comment"           , Drive);
    NewTest(TestTable, "GD_CreateCatalog"                     , "Create/Delete catalog"           , Drive);
    NewTest(TestTable, "GW_Auth"                              , "Authorization"                   , Tables);
    NewTest(TestTable, "GT_CreateTable"                       , "Create table"                    , Tables);
    NewTest(TestTable, "GT_FillClearCells"                    , "Fill/Clear cells"                , Tables);
    NewTest(TestTable, "TwitterAPI_AccountData"               , "Account data"                    , Twitter);
    NewTest(TestTable, "TwitterAPI_Tweets"                    , "Tweets creation"                 , Twitter);
    NewTest(TestTable, "Viber_DataRetrieval"                  , "Data retrieval"                  , Viber);
    NewTest(TestTable, "Viber_MessagesSending"                , "Messages sending"                , Viber);
    NewTest(TestTable, "NotionAPI_CreatePage"                 , "Create page"                     , Notion);
    NewTest(TestTable, "NotionAPI_CreateUpdateBase"           , "Create/Edit database"            , Notion);
    NewTest(TestTable, "NotionAPI_CreateDeleteBlock"          , "Create/Delete block"             , Notion);
    NewTest(TestTable, "NotionAPI_GetUsers"                   , "Get users"                       , Notion);
    NewTest(TestTable, "SlackGetData"                         , "Get data"                        , Slack);
    NewTest(TestTable, "Slack_SendDeleteMessage"              , "Send/Delete message"             , Slack);
    NewTest(TestTable, "Slack_CreateArchiveChannel"           , "Create/Archive channel"          , Slack);
    NewTest(TestTable, "Slack_OpenCloseDialog"                , "Open/Close dialog"               , Slack);
    NewTest(TestTable, "Slack_UploadDeleteFile"               , "Upload/Delete file"              , Slack);
    NewTest(TestTable, "Slack_UploadDeleteExternalFile"       , "Upload/Delete external file"     , Slack);
    NewTest(TestTable, "AT_CreateDatabase"                    , "Create/Edit database"            , AirT);
    NewTest(TestTable, "AT_CreateTable"                       , "Create/Edit table"               , AirT);
    NewTest(TestTable, "AT_CreateField"                       , "Create/Edit field"               , AirT);
    NewTest(TestTable, "AT_CreateDeleteRecords"               , "Create/Delete records"           , AirT);
    NewTest(TestTable, "DropboxAPI_GetUpdateToken"            , "Get/Update token"                , Dropbox);
    NewTest(TestTable, "DropboxAPI_UploadFile"                , "Upload file"                     , Dropbox);
    NewTest(TestTable, "DropboxAPI_UploadFileByURL"           , "Upload file by URL"              , Dropbox);
    NewTest(TestTable, "DropboxAPI_CreateFolder"              , "Create folder"                   , Dropbox);
    NewTest(TestTable, "DropboxAPI_CreateDeleteTag"           , "Create/Delete tag"               , Dropbox);
    NewTest(TestTable, "DropboxAPI_GetAccount"                , "Get account data"                , Dropbox);
    NewTest(TestTable, "DropboxAPI_AccessManagement"          , "Access management"               , Dropbox);
    NewTest(TestTable, "DropboxAPI_GetFolderFileList"         , "Get list of folder files"        , Dropbox);
    NewTest(TestTable, "B24_TokenManagement"                  , "Token management"                , Bitrix);
    NewTest(TestTable, "B24_ServerTime"                       , "Server time"                     , Bitrix);
    NewTest(TestTable, "B24_PostsManagement"                  , "Posts management"                , Bitrix);
    NewTest(TestTable, "B24_TaskManagement"                   , "Tasks management"                , Bitrix);
    NewTest(TestTable, "B24_CommentsManagement"               , "Comments management"             , Bitrix);
    NewTest(TestTable, "B24_WorkingWithDrive"                 , "Working with drive"              , Bitrix);
    NewTest(TestTable, "B24_Kanban"                           , "Kanban"                          , Bitrix);
    NewTest(TestTable, "B24_Timekeeping"                      , "Timekeeping"                     , Bitrix);
    NewTest(TestTable, "B24_ChatManagement"                   , "Chats works"                     , Bitrix);
    NewTest(TestTable, "B24_NotificationsManagement"          , "Notifications management"        , Bitrix);
    NewTest(TestTable, "B24_TasksFieldsManagement"            , "Working with custom task fields" , Bitrix);
    NewTest(TestTable, "B24_DepartmentsManagement"            , "Departments management"          , Bitrix);
    NewTest(TestTable, "B2_UsersManagement"                   , "Users management"                , Bitrix);
    NewTest(TestTable, "B24_LeadsManagement"                  , "Leads management"                , Bitrix);
    NewTest(TestTable, "B24_DealsManagement"                  , "Deals management"                , Bitrix);
    NewTest(TestTable, "B24_CalendarsManagement"              , "Calendars management"            , Bitrix);
    NewTest(TestTable, "VKT_MessagesSending"                  , "Messages sending"                , VKT);
    NewTest(TestTable, "VKT_CommonMethods"                    , "Common methods"                  , VKT);
    NewTest(TestTable, "VKT_ChatManagement"                   , "Chat management"                 , VKT);
    NewTest(TestTable, "OzonAPI_AttributesAndFeatures"        , "Attributes and features"         , Ozon);
    NewTest(TestTable, "OzonAPI_UploadingAndUpdatingProducts" , "Uploading and updating products" , Ozon);
    NewTest(TestTable, "OzonAPI_Barcodes"                     , "Barcodes"                        , Ozon);
    NewTest(TestTable, "OzonAPI_PricesAndStocks"              , "Prices and stocks"               , Ozon);
    NewTest(TestTable, "OzonAPI_PromotionsManagement"         , "Promotions management"           , Ozon);
    NewTest(TestTable, "OzonAPI_WarehousesManagement"         , "Warehouses management"           , Ozon);
    NewTest(TestTable, "OzonAPI_FBOScheme"                    , "FBO scheme"                      , Ozon);
    NewTest(TestTable, "NC_FilesManagement"                   , "Files management"                , Neocities);
    NewTest(TestTable, "NC_DataRetrieving"                    , "Data retrieving"                 , Neocities);
    NewTest(TestTable, "CdekAPI_CommonMethods"                , "Common methods"                  , Cdek);
    NewTest(TestTable, "CDEKAPI_OrdersManagement"             , "Orders management"               , Cdek);
    NewTest(TestTable, "CdekAPI_CourierInvitationsManagement" , "Courier invitations management"  , Cdek);
    NewTest(TestTable, "YaMetrika_TagsManagement"             , "Tags management"                 , Metrika);
    NewTest(TestTable, "YaMetrika_CountersManagement"         , "Counters management"             , Metrika);
    NewTest(TestTable, "YaMetrika_ActionsManagement"          , "Actions management"              , Metrika);
    NewTest(TestTable, "AWS_CommonMethods"                    , "Common methods"                  , S3_);
    NewTest(TestTable, "AWS_BucketsManagement"                , "Buckets management"              , S3_);
    NewTest(TestTable, "AWS_ObjectsManagement"                , "Objects management"              , S3_);
    NewTest(TestTable, "TC_Client"                            , "TCP Client"                      , TCP);
    NewTest(TestTable, "SQLL_CommonMethods"                   , "Common methods"                  , SQLite);
    NewTest(TestTable, "SQLL_ORM"                             , "ORM"                             , SQLite);
    NewTest(TestTable, "Postgres_CommonMethods"               , "Common methods"                  , Postgres);
    NewTest(TestTable, "Postgres_ORM"                         , "ORM"                             , Postgres);
    NewTest(TestTable, "MYS_CommonMethods"                    , "Common methods"                  , MySQL);
    NewTest(TestTable, "MYS_ORM"                              , "ORM"                             , MySQL);
    NewTest(TestTable, "MSS_CommonMethods"                    , "Common methods"                  , MSSQL);
    NewTest(TestTable, "MSS_ORM"                              , "ORM"                             , MSSQL);
    NewTest(TestTable, "GAPI_GroupManagement"                 , "Group management"                , GreenAPI);
    NewTest(TestTable, "GAPI_MessageSending"                  , "Messages sending"                , GreenAPI);
    NewTest(TestTable, "GAPI_NotificationsReceiving"          , "Notifications receiving"         , GreenAPI);
    NewTest(TestTable, "GAPI_MessageQueue"                    , "Message queue"                   , GreenAPI);
    NewTest(TestTable, "GAPI_MessageLogs"                     , "Message logs"                    , GreenAPI);
    NewTest(TestTable, "GAPI_Account"                         , "Account"                         , GreenAPI);
    NewTest(TestTable, "RC_CommandsExecution"                 , "Commands execution"              , RCON);
    NewTest(TestTable, "OLLM_RequestsProcessing"              , "Requests processing"             , Ollama);
    NewTest(TestTable, "OLLM_ModelsManagement"                , "Models management"               , Ollama);
    NewTest(TestTable, "OLLM_WorkingWithBlob"                 , "Working with Blob"               , Ollama);
    NewTest(TestTable, "HTTP_Initialization"                  , "Initialization"                  , Http);
    NewTest(TestTable, "HTTP_BodySet"                         , "Body set"                        , Http);
    NewTest(TestTable, "HTTP_Settings"                        , "Settings"                        , Http);
    NewTest(TestTable, "HTTP_HeadersSetting"                  , "Headers setting"                 , Http);
    NewTest(TestTable, "HTTP_Authorization"                   , "Authorization"                   , Http);
    NewTest(TestTable, "HTTP_RequestProcessing"               , "Request processing"              , Http);
    NewTest(TestTable, "HTTP_ResponseReceiving"               , "Response receiving"              , Http);
    NewTest(TestTable, "OAI_RequestsProcessing"               , "Requests processing"             , OpenAI);
    NewTest(TestTable, "OAI_Assistants"                       , "Assistants"                      , OpenAI);
    NewTest(TestTable, "OAI_FileManagement"                   , "Files management"                , OpenAI);
    NewTest(TestTable, "OAI_AudioProcessing"                  , "Audio processing"                , OpenAI);
    NewTest(TestTable, "OAI_ModelsManagement"                 , "Models management"               , OpenAI);
    NewTest(TestTable, "FT_DirecotryManagement"               , "Directory management"            , FTP);
    NewTest(TestTable, "FT_FileOperations"                    , "Files management"                , FTP);
    NewTest(TestTable, "FT_CommonMethods"                     , "Common methods"                  , FTP);

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
            ArrayOfTests.Add("CLI_" + Test.Method);
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

        DeleteFiles(TFN);

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
    ParametersStructure.Insert("Postfix", " (FTP)");
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
    ParametersStructure.Insert("Postfix", " (FTPS)");
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
    ParametersStructure.Insert("Postfix", " (FTP, Socks5)");
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
    ParametersStructure.Insert("Postfix", " (FTPS, Socks5)");
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

    If OPI_Tools.IsWindows() Then

        // FTP + HTTP
        ParametersStructure = New Structure;
        ParametersStructure.Insert("Postfix", " (FTP, HTTP)");
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

Procedure WriteLog(Val Result, Val Method, Val Library = "") Export // DEPRECATED

    Header = String(OPI_Tools.GetCurrentDate()) + " | " + Method;

    Try
        Data = OPI_Tools.JSONString(Result);
    Except
        Data = "Not JSON: " + String(Result);
    EndTry;

    Data = " " + Data;

    Message(Header);
    Message(Chars.LF);
    Message(Data);
    Message(Chars.LF);
    Message("---------------------------------");
    Message(Chars.LF);

    If ValueIsFilled(Library) Then

        Try
            Library = New OpenSSLSecureConnection; // Check to work in 1C
        Except
            WriteLogFile(Data, Method, Library);
        EndTry;

    EndIf;

EndProcedure

Procedure WriteLogCLI(Val Result, Val Method, Val Library = "") Export

    Template = "%1 (CLI, %2)";
    WriteLog(Result, StrTemplate(Template, Method, Library));

EndProcedure

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

    For Each Option In Options Do

        If Option.Value = Undefined Then
            Continue;
        EndIf;

        CurrentValue = GetCLIFormedValue(Option.Value);

        LaunchString = LaunchString
            + " --"
            + Option.Key
            + " "
            + CurrentValue;

    EndDo;

    // BSLLS:ExternalAppStarting-off
    RunApp(LaunchString + " --out """ + ResultFile + """ --debug" , , True);
    // BSLLS:ExternalAppStarting-on

    Result = ReadCLIResponse(ResultFile);

    If Record Then
        WriteCLICall(Library, Method, Options);
    EndIf;

    Try
        DeleteFiles(ResultFile);
    Except
        Message("Failed to delete the temporary file after the test!");
    EndTry;

    Return Result;

EndFunction

Procedure ProcessTestingResult(Val Result
    , Val Method
    , Val Library
    , Val Option = ""
    , AddParam1  = Undefined
    , AddParam2  = Undefined
    , AddParam3  = Undefined) Export

    LogsMethod = ?(ValueIsFilled(Option), StrTemplate("%1 (%2)", Method, Option), Method);

    Try

        ParameterArray = New Array;
        ParameterArray.Add("Result");
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

        PrintLog(Result, LogsMethod, Library);

        If Not ValueIsFilled(Option) And ValueIsFilled(CheckResult) Then
            WriteLogFile(CheckResult, Method, Library);
        EndIf

    Except
        ErrInfo = ErrorDescription();
        PrintLog(Result, Method, Library);
        Raise ErrInfo;
    EndTry;

EndProcedure

#Region Checks

Function Check_Telegram_GetBotInformation(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["username"]).Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_GetUpdates(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map") .Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_SetWebhook(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["description"]).Равно("Webhook was set");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_DeleteWebhook(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["description"]).Заполнено();

    OPI_Tools.Pause(5);

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

    ExpectsThat(Result).ИмеетТип("String").Заполнено();
    Return Result;

EndFunction

Function Check_Telegram_SendPicture(Val Result, Val Option, Parameters = "", Text = "")

    ExpectsThat(Result).ИмеетТип("Map") .Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
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

    ExpectsThat(Result).ИмеетТип("BinaryData");

    Return Result;

EndFunction

Function Check_Telegram_ForwardMessage(Val Result, Val Option, MessageID = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["forward_origin"]["message_id"]).Равно(Number(MessageID));

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_Ban(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["description"]).Равно("Bad Request: can't remove chat owner");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_Unban(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["description"]).Равно("Bad Request: can't remove chat owner");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_CreateInviteLink(Val Result, Val Option, Title = "", UnixExpiration = "")

    Result_ = "result";
    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result[Result_]["member_limit"]).Равно(200);
    ExpectsThat(Result[Result_]["name"]).Равно(Title);
    ExpectsThat(Result[Result_]["expire_date"]).Равно(Number(UnixExpiration));

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_PinMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_UnpinMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_GetParticipantCount(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Number");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_GetAvatarIconList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_CreateForumTopic(Val Result, Val Option, Parameters = "", NameOrText = "", Icon = "")

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result).ИмеетТип("Map").Заполнено();
        ExpectsThat(Result["ok"]).Равно(True);
        ExpectsThat(Result["result"]["name"]).Равно(NameOrText);
        ExpectsThat(Result["result"]["icon_custom_emoji_id"]).Равно(Icon);

        Topic = Result["result"]["message_thread_id"];

        OPI_Tools.AddField("Telegram_TopicID", Topic, "String", Parameters);
        OPI_TestDataRetrieval.WriteParameter("Telegram_TopicID", Parameters["Telegram_TopicID"]);

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

    OPI_Tools.Pause(5);

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

Function Check_Telegram_ClearPinnedMessagesList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_HideMainForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_ShowMainForumTopic(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_ChangeMainTopicName(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Telegram_DeleteMessage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

    OPI_Tools.Pause(5);

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

    ExpectsThat(Result).ИмеетТип("Map") .Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["photo"]).ИмеетТип("Array");

    Return Result;

EndFunction

Function Check_VK_CreateTokenRetrievalLink(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String");

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

    OPI_Tools.Pause(5);

EndFunction

Function Check_VK_DeletePost(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_CreateCompositePost(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["post_id"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(5);

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

Function Check_VK_SavePictureToAlbum(Val Result, Val Option, Parameters = "", Description = "", AlbumID = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"][0]["text"]).Равно(Description);
    ExpectsThat(Result["response"][0]["album_id"]).Равно(AlbumID);


    If Option = "Path" Then

        ImageID = Result["response"][0]["id"];
        Parameters.Insert("VK_PictureID", ImageID);
        WriteParameter("VK_PictureID", ImageID);

    EndIf;

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_DeleteImage(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_DeleteAlbum(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_CreateStory(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["count"]).ИмеетТип("Number").Равно(1);
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_CreateDiscussion(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

    DiscussionID = Result["response"];
    Parameters.Insert("VK_ConvID", DiscussionID);
    WriteParameter("VK_ConvID", DiscussionID);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_CloseDiscussion(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_OpenDiscussion(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_PostToDiscussion(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

    Return Result;

EndFunction

Function Check_VK_LikePost(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["likes"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_MakeRepost(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["success"]).ИмеетТип("Number").Равно(1);
    ExpectsThat(Result["response"]["wall_repost_count"]).ИмеетТип("Number").Равно(1);

    Parameters.Insert("Repost", Result["response"]["post_id"]);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_WriteComment(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["comment_id"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_GetStatistics(Val Result, Val Option)

    TypeMap = "Map";

    ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    ExpectsThat(Result["response"][0]["visitors"]).ИмеетТип(TypeMap).Заполнено();
    ExpectsThat(Result["response"][0]["reach"]).ИмеетТип(TypeMap).Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_GetPostStatistics(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array").ИмеетДлину(2);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_CreateAdCampaign(Val Result, Val Option, Parameters = "")

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

    ExpectsThat(Result).ИмеетТип("String").Заполнено();

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

    OPI_Tools.Pause(5);

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

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_RemoveProductFromCollection(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_DeleteProduct(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_DeleteCollection(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_CreateProductProperty(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["property_id"]).ИмеетТип("Number").Заполнено();

    Property = Result["response"]["property_id"];
    Property = OPI_Tools.NumberToString(Property);

    OPI_TestDataRetrieval.WriteParameter("VK_PropID", Property);
    Parameters.Insert("VK_PropID", Property);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_EditProductProperty(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_AddProductPropertyVariant(Val Result, Val Option, Parameters = "", Counter = 0)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["variant_id"]).ИмеетТип("Number").Заполнено();

    VariantID     = Result["response"]["variant_id"];
    ParameterName = "VK_PropVarID" + String(Counter);

    OPI_TestDataRetrieval.WriteParameter(ParameterName, VariantID);
    Parameters.Insert(ParameterName, VariantID);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_EditProductPropertyVariant(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_CreateProductWithProp(Val Result, Val Option, Parameters = "", Counter = 0)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["market_item_id"]).ИмеетТип("Number").Заполнено();

    ProductID = Result["response"]["market_item_id"];
    FieldName = "VK_MarketItemID" + String(Counter);

    OPI_TestDataRetrieval.WriteParameter(FieldName, ProductID);
    Parameters.Insert(FieldName, ProductID);

    Return Result;

EndFunction

Function Check_VK_GetProductsByID(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").ИмеетДлину(2);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_GroupProducts(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["item_group_id"]).ИмеетТип("Number").Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_DeleteProductPropertyVariant(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_DeleteProductProperty(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_GetProductList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_GetSelectionList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_GetPropertyList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_GetOrderList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_VK_UploadVideoToServer(Val Result, Val Option)

    ExpectsThat(Result["video_id"]).Заполнено();
    ExpectsThat(Result["video_hash"]).Заполнено();

    OPI_Tools.Pause(5);

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

Function Check_YandexDisk_GetDiskInfo(Val Result, Val Option)

    Map_ = "Map";

    ExpectsThat(Result).ИмеетТип(Map_).Заполнено();
    ExpectsThat(Result["system_folders"]).ИмеетТип(Map_);
    ExpectsThat(Result["user"]).ИмеетТип(Map_);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_CreateFolder(Val Result, Val Option, Token = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("dir");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_UploadFileByURL(Val Result, Val Option, Parameters = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["href"]).Заполнено();
    ExpectsThat(Result["method"]).Заполнено();

    WriteParameter("YandexDisk_FileByURLPath", Path);
    Parameters.Insert("YandexDisk_FileByURLPath", Path);

    OPI_Tools.Pause(5);

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

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_UploadFile(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_CreateObjectCopy(Val Result, Val Option, Parameters = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

    WriteParameter("YandexDisk_CopyFilePath", Path);
    Parameters.Insert("YandexDisk_CopyFilePath", Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_GetDownloadLink(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["method"]).Равно("GET");
    ExpectsThat(Result["href"]).ИмеетТип("String").Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_DownloadFile(Val Result, Val Option)

    MinimumSize = 500000;

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() > MinimumSize).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_GetFilesList(Val Result, Val Option, Count = 0, Indent = 0)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["limit"]).Равно(Count);
    ExpectsThat(Result["offset"]).Равно(Indent);
    ExpectsThat(Result["items"]).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_MoveObject(Val Result, Val Option, Parameters = "", Path = "")

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

    WriteParameter("YandexDisk_NewFilePath", Path);
    Parameters.Insert("YandexDisk_NewFilePath", Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_YandexDisk_GetPublishedObjectsList(Val Result, Val Option, Count = 0, Indent = 0)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["limit"]).Равно(Count);
    ExpectsThat(Result["offset"]).Равно(Indent);
    ExpectsThat(Result["items"]).ИмеетТип("Array");

    OPI_Tools.Pause(5);

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

Function Check_Viber_SetWebhook(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    Return Result;

EndFunction

Function Check_Viber_GetChannelInformation(Val Result, Val Option)

    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_GetUserData(Val Result, Val Option)

    ExpectsThat(Result["chat_hostname"]).Заполнено();
    ExpectsThat(Result["status_message"]).Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_GetOnlineUsers(Val Result, Val Option)

    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);
    ExpectsThat(Result["users"]).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_CreateKeyboardFromArrayButton(Val Result, Val Option)

    Return Result;

EndFunction

Function Check_Viber_SendTextMessage(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_SendImage(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_SendFile(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_SendContact(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_SendLocation(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Viber_SendLink(Val Result, Val Option)

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleWorkspace_FormCodeRetrievalLink(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("String");
    WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleWorkspace_GetTokenByCode(Val Result, Val Option)

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then

        WriteParameter("Google_Token"  , Result["access_token"]);
        WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleWorkspace_RefreshToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleWorkspace_GetServiceAccountToken(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();
    WriteParameter("Google_ServiceToken", Result["access_token"]);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetCalendarList(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Array");

    OPI_Tools.Pause(5);

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

Function Check_GoogleCalendar_EditCalendarMetadata(Val Result, Val Option, Name = "", Description = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetCalendarMetadata(Val Result, Val Option, Name = "", Description = "")

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

Function Check_GoogleCalendar_EditListCalendar(Val Result, Val Option, PrimaryColor = "", SecondaryColor = "")

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["foregroundColor"]).Равно(PrimaryColor);
    ExpectsThat(Result["backgroundColor"]).Равно(SecondaryColor);

    Return Result;

EndFunction

Function Check_GoogleCalendar_GetListCalendar(Val Result, Val Option, PrimaryColor = "", SecondaryColor = "")

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
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleCalendar_DeleteCalendar(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    Return Result;

EndFunction

Function Check_GoogleCalendar_CreateEvent(Val Result, Val Option, Parameters = "", Name = "", Description = "")

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

Function Check_GoogleDrive_GetDirectoriesList(Val Result, Val Option, Parameters = "")

    Result = Result[0];

    ExpectsThat(Result["mimeType"]).Равно("application/vnd.google-apps.folder");
    ExpectsThat(Result["name"]).Заполнено();

    Identifier = Result["id"];
    WriteParameter("GD_Catalog", Identifier);
    OPI_Tools.AddField("GD_Catalog", Identifier, "String", Parameters);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleDrive_GetObjectInformation(Val Result, Val Option)

    ExpectsThat(Result["mimeType"]).Равно("application/vnd.google-apps.folder");
    ExpectsThat(Result["name"]).Заполнено();

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleDrive_UploadFile(Val Result, Val Option, Parameters = "", Description = "")

    ExpectsThat(Result["mimeType"]).Равно(Description["MIME"]);
    ExpectsThat(Result["name"]).Равно(Description["Name"]);

    Identifier = Result["id"];

    If Not ValueIsFilled(Option) Then

        WriteParameter("GD_File", Identifier);
        OPI_Tools.AddField("GD_File", Identifier, "String", Parameters);

    Else

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

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleDrive_DownloadFile(Val Result, Val Option, Parameters = "")

    Size = OPI_HTTPRequests.Get(Parameters["Picture"]).Size();

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= Size).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_GoogleDrive_UpdateFile(Val Result, Val Option, NewName = "")

    Description = New Structure("Name,MIME", NewName, "image/jpeg");

    ExpectsThat(Result["mimeType"]).Равно(Description["MIME"]);
    ExpectsThat(Result["name"]).Равно(Description["Name"]);

    OPI_Tools.Pause(5);

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

    OPI_Tools.Pause(5);

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

Function Check_GoogleSheets_CreateSpreadsheet(Val Result, Val Option, Parameters = "", Name = "", SheetArray = "")

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

        OPI_TestDataRetrieval.WriteParameter("GS_Spreadsheet2", Spreadsheet);
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

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_GetStringField(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_GetAttachmentField(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_GetCheckboxField(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_GetDateField(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_GetPhoneField(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_GetEmailField(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

    Return Result;

EndFunction

Function Check_Airtable_GetLinkField(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

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
    OPI_TestDataRetrieval.WriteParameter("Airtable_Comment", Comment);
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

    ExpectsThat(Result).ИмеетТип("String").Заполнено();

    WriteParameter("Twitter_URL", Result);

    OPI_Tools.Pause(5);

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

    OPI_Tools.Pause(5);

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

    OPI_Tools.Pause(5);

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

    ExpectsThat(Result).ИмеетТип("String").Заполнено();

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

Function Check_Dropbox_UpdateToken(Val Result, Val Option)

    Token = Result["access_token"];

    ExpectsThat(Token).ИмеетТип("String").Заполнено();
    WriteParameter("Dropbox_Token", Token);

    Return Undefined;

EndFunction

Function Check_Dropbox_GetObjectInformation(Val Result, Val Option, Path = "")

    ExpectsThat(Result["path_display"]).Равно(Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_GetPreview(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 1200).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_UploadFile(Val Result, Val Option, Path = "")

    ExpectsThat(Result["path_display"]).Равно(Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_UploadFileByURL(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["async_job_id"]).Заполнено();

    Work = Result["async_job_id"];
    Parameters.Insert("Dropbox_Job", Work);
    WriteParameter("Dropbox_Job", Work);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_GetUploadStatusByURL(Val Result, Val Option, Path)

    If Not ValueIsFilled(Option) Then

        ExpectsThat(Result[".tag"]).Равно("complete");

        OPI_Tools.Pause(5);

    EndIf;

    If Option = "Deletion" Then
        ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);
    EndIf;

    Return Result;

EndFunction

Function Check_Dropbox_DeleteObject(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_CopyObject(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_MoveObject(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_CreateFolder(Val Result, Val Option, Path = "")

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_DownloadFile(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 2000000).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_DownloadFolder(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("BinaryData");
    ExpectsThat(Result.Size() >= 200000).Равно(True);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_GetFolderFileList(Val Result, Val Option)

    ExpectsThat(Result["entries"]).ИмеетТип("Array");

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_GetObjectVersionList(Val Result, Val Option, Parameters = "")

    ExpectsThat(Result["entries"]).ИмеетТип("Array");
    ExpectsThat(Result["entries"].Count()).Равно(1);

    Revision = Result["entries"][0]["rev"];

    Parameters.Insert("Dropbox_FileRevision", Revision);
    WriteParameter("Dropbox_FileRevision", Revision);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_RestoreObjectToVersion(Val Result, Val Option, Path = "")

    ExpectsThat(Result["path_display"]).Равно(Path);

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_GetTagList(Val Result, Val Option, Parameters = "", PathsArray = "")

    Token = Parameters["Dropbox_Token"];

    ExpectsThat(Result["paths_to_tags"]).ИмеетТип("Array");
    ExpectsThat(Result["paths_to_tags"].Count()).Равно(PathsArray.Count());

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_AddTag(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_DeleteTag(Val Result, Val Option)

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_GetAccountInformation(Val Result, Val Option)

    ExpectsThat(Result["account_id"]).Заполнено();

    OPI_Tools.Pause(5);

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

    OPI_Tools.Pause(5);

    Return Result;

EndFunction

Function Check_Dropbox_CancelFolderPublication(Val Result, Val Option, Parameters = "", JobID = "")

    If ValueIsFilled(Option) Then

        ExpectsThat(Result[".tag"]).Равно("complete");

        Parameters.Insert("Dropbox_NewJobID", JobID);
        WriteParameter("Dropbox_NewJobID", JobID);

        OPI_Tools.Pause(5);

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
       Time             = XMLValue(Type("Date"), Time);
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

    ExpectsThat(Result["result"]["task"]).Заполнено();

    Return Result;

EndFunction

Function Check_Bitrix24_DisapproveTask(Val Result, Val Option)

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();

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

    ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);

    Return Result;

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


Procedure Check_Empty(Val Result) Export

    If Not Lower(String(Result)) = "null" Then
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

EndProcedure

Procedure Check_String(Val Result, Val ComparisonObject = "") Export

    ExpectsThat(Result).ИмеетТип("String");

    If ValueIsFilled(ComparisonObject) Then
        ExpectsThat(Result).Равно(ComparisonObject);
    EndIf;

EndProcedure

Procedure Check_BinaryData(Val Result, Val Size = Undefined) Export

    MinimumSize = 500000;

    ExpectsThat(Result).ИмеетТип("BinaryData");

    If Not Size                    = Undefined Then
        ExpectsThat(Result.Size() >= Size).Равно(True);
    Else
        ExpectsThat(Result.Size() > MinimumSize).Равно(True);
    EndIf;

EndProcedure

Procedure Check_Array(Val Result, Val Count = Undefined) Export

    ExpectsThat(Result).ИмеетТип("Array");

    If Not Count = Undefined Then
       ExpectsThat(Result).ИмеетДлину(Count);
    EndIf;

EndProcedure

Procedure Check_Map(Val Result, Val Filling = True) Export

    ExpectsThat(Result).ИмеетТип("Map");

    If Filling Then
        ExpectsThat(Result).Заполнено();
    Else
        ExpectsThat(ValueIsFilled(Result)).Равно(False);
    EndIf;

EndProcedure

Procedure Check_Structure(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Structure").Заполнено();

EndProcedure

Procedure Check_Filled(Val Result) Export

    ExpectsThat(ValueIsFilled(Result)).Равно(True);

EndProcedure

Procedure Check_True(Val Result) Export

    ExpectsThat(Result).Равно(True);

EndProcedure

Procedure Check_False(Val Result) Export

    ExpectsThat(Result).Равно(False);

EndProcedure

Procedure Check_BitrixTime(Val Result) Export

    Time = Result["result"];

    If Not TypeOf(Time) = Type("Date") Then
       Time             = XMLValue(Type("Date"), Time);
    EndIf;

    ExpectsThat(Time).ИмеетТип("Date").Заполнено();

EndProcedure

Procedure Check_BitrixAuth(Val Result) Export

    ExpectsThat(Result["access_token"]).Заполнено();
    ExpectsThat(Result["refresh_token"]).Заполнено();

EndProcedure

Procedure Check_BitrixNumber(Val Result) Export
   ExpectsThat(Result["result"]).ИмеетТип("Number").Заполнено();
EndProcedure

Procedure Check_BitrixTrue(Val Result) Export
   ExpectsThat(Result["result"]).ИмеетТип("Boolean").Равно(True);
EndProcedure

Procedure Check_BitrixBool(Val Result) Export
   ExpectsThat(Result["result"]).ИмеетТип("Boolean");
EndProcedure

Procedure Check_BitrixString(Val Result, Val Value = "") Export

    ExpectsThat(Result["result"]).ИмеетТип("String").Заполнено();

    If ValueIsFilled(Value) Then
        ExpectsThat(Result["result"]).Равно(Value);
    EndIf;

EndProcedure

Procedure Check_BitrixArray(Val Result) Export
    ExpectsThat(Result["result"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixMap(Val Result) Export
    ExpectsThat(Result["result"]).ИмеетТип("Map");
EndProcedure

Procedure Check_BitrixList(Val Result) Export
    ExpectsThat(Result["result"]["list"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixObjectsArray(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["ID"]).Заполнено();

EndProcedure

Procedure Check_BitrixFields(Val Result) Export

    ExpectsThat(Result["result"]["fields"]).Заполнено();

EndProcedure

Procedure Check_BitrixTask(Val Result) Export

    ExpectsThat(Result["result"]["task"]).Заполнено();

EndProcedure

Procedure Check_BitrixTasksList(Val Result) Export
    ExpectsThat(Result["result"]["tasks"]).ИмеетТип("Array");
EndProcedure

Procedure Check_BitrixStorage(Val Result) Export
    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["total"]).Заполнено();
EndProcedure

Procedure Check_BitrixObject(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["ID"]).Заполнено();

EndProcedure

Procedure Check_BitrixLead(Val Result) Export

    ExpectsThat(Result["result"]["PHONE"]).Заполнено();
    ExpectsThat(Result["result"]["NAME"]).Заполнено();

EndProcedure

Procedure Check_BitrixDeal(Val Result) Export

    ExpectsThat(Result["result"]["ID"]).Заполнено();
    ExpectsThat(Result["result"]["BEGINDATE"]).Заполнено();

EndProcedure

Procedure Check_BitrixAttachment(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["attachmentId"]).Заполнено();

EndProcedure

Procedure Check_BitrixAvailableActions(Val Result, Val Count) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");

    Actions = Result["result"]["allowedActions"];
    ExpectsThat(Actions).ИмеетТип("Map");
    ExpectsThat(Actions.Count()).Равно(Count);

EndProcedure

Procedure Check_BitrixComment(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["POST_MESSAGE"]).Заполнено();

EndProcedure

Procedure Check_BitrixResult(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["text"]).Заполнено();

EndProcedure

Procedure Check_BitrixUndefined(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Undefined");
    ExpectsThat(Result["time"]).Заполнено();

EndProcedure

Procedure Check_BitrixCommentsList(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["POST_MESSAGE"]).Заполнено();

EndProcedure

Procedure Check_BitrixResultsList(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["text"]).Заполнено();

EndProcedure

Procedure Check_BitrixMessages(Val Result) Export

    ExpectsThat(Result["result"]["messages"]).ИмеетТип("Array");

EndProcedure

Procedure Check_BitrixDialog(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["dialogId"]).Заполнено();

EndProcedure

Procedure Check_BitrixMessage(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["id"]).Заполнено();

EndProcedure

Procedure Check_BitrixFileMessage(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["MESSAGE_ID"]).Заполнено();

EndProcedure

Procedure Check_BitrixTimekeeping(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["STATUS"]).Заполнено();

EndProcedure

Procedure Check_BitrixTimekeepingSettings(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Map");
    ExpectsThat(Result["result"]["UF_TIMEMAN"]).ИмеетТип("Boolean");

EndProcedure

Procedure Check_VKTUser(Val Result) Export

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["userId"]).Заполнено();

EndProcedure

Procedure Check_VKTEvents(Val Result) Export

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["events"]).ИмеетТип("Array");

EndProcedure

Procedure Check_VKTMessage(Val Result) Export

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["msgId"]).Заполнено();

EndProcedure

Procedure Check_VKTTrue(Val Result) Export

    ExpectsThat(Result["ok"]).Равно(True);

EndProcedure

Procedure Check_VKTFile(Val Result) Export

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["type"]).Заполнено();
    ExpectsThat(Result["size"]).Заполнено();

EndProcedure

Procedure Check_VKTList(Val Result, Val FieldName) Export

    ExpectsThat(Result[FieldName]).ИмеетТип("Array");

EndProcedure

Procedure Check_VKTChat(Val Result) Export

    ExpectsThat(Result["type"]).Заполнено();
    ExpectsThat(Result["inviteLink"]).Заполнено();

EndProcedure

Procedure Check_VKTPending(Val Result) Export

    If Not Result["ok"] Then
        ExpectsThat(Result["description"]).Равно("User is not pending or nobody in pending list");
    EndIf;

EndProcedure

Procedure Check_OzonCategoryList(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["category_name"]).Заполнено();

EndProcedure

Procedure Check_OzonAttributesList(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["name"]).Заполнено();
    ExpectsThat(Result["result"][0]["id"]).Заполнено();

EndProcedure

Procedure Check_OzonListOfAttributesValues(Val Result) Export

    ExpectsThat(Result["result"]).ИмеетТип("Array");
    ExpectsThat(Result["result"][0]["value"]).Заполнено();
    ExpectsThat(Result["result"][0]["id"]).Заполнено();

EndProcedure

Procedure Check_OzonUploadTask(Val Result, Val Embedded = True) Export

    If Embedded Then
        TaskID = Result["result"]["task_id"];
    Else
        TaskID = Result["task_id"];
    EndIf;

    ExpectsThat(TaskID).Заполнено();

EndProcedure

Procedure Check_OzonNewProducts(Val Result) Export

    Status             = Result["result"]["items"][0]["status"];
    ExpectsThat(Result["result"]["items"]).ИмеетТип("Array");
    ExpectsThat(Status = "imported" Or Status = "skipped").Равно(True);

EndProcedure

Procedure Check_OzonObjectsArray(Val Result) Export

    ExpectsThat(Result["result"]["items"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonObjects(Val Result) Export

    ExpectsThat(Result["items"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonUpdatedArray(Val Result) Export

    ExpectsThat(Result["result"][0]["updated"]).Равно(True);

EndProcedure

Procedure Check_OzonRatingArray(Val Result) Export

    ExpectsThat(Result["products"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonProduct(Val Result) Export

    ExpectsThat(Result["result"]["id"]).Заполнено();
    ExpectsThat(Result["result"]["name"]).Заполнено();

EndProcedure

Procedure Check_OzonProducts(Val Result) Export

    ExpectsThat(Result["items"]).ИмеетТип("Array");
    ExpectsThat(Result["items"][0]["name"]).Заполнено();
    ExpectsThat(Result["items"][0]["id"]).Заполнено();

EndProcedure

Procedure Check_OzonLimits(Val Result) Export

    ExpectsThat(Result["daily_create"]).Заполнено();
    ExpectsThat(Result["daily_update"]).Заполнено();

EndProcedure

Procedure Check_OzonPictures(Val Result) Export

    ExpectsThat(Result["result"]["pictures"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_OzonNoErrors(Val Result) Export

    ExpectsThat(Result["errors"].Count()).Равно(0);

EndProcedure

Procedure Check_OzonTrue(Val Result) Export

    ExpectsThat(Result["result"]).Равно(True);

EndProcedure

Procedure Check_OzonArray(Val Result, Val Field = "result") Export

    ExpectsThat(Result[Field]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonProductsDeleting(Val Result) Export

    ExpectsThat(Result["status"][0]["is_deleted"]).Равно(True);

EndProcedure

Procedure Check_OzonNewCodes(Val Result) Export

    ExpectsThat(Result["result"]["status"]).Равно("imported");

EndProcedure

Procedure Check_OzonSubscribers(Val Result) Export

    ExpectsThat(Result["result"][0]["count"]).ИмеетТип("Number");

EndProcedure

Procedure Check_OzonSKU(Val Result) Export

    ExpectsThat(Result["items"]).ИмеетТип("Array");
    ExpectsThat(Result["items"][0]["availability"]).Заполнено();

EndProcedure

Procedure Check_OzonDraft(Val Result) Export

     ExpectsThat(Result["operation_id"]).ИмеетТип("String").Заполнено();

EndProcedure

Procedure Check_OzonSearch(Val Result) Export

    ExpectsThat(Result["search"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonClusters(Val Result) Export

    ExpectsThat(Result["clusters"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OzonReadyDraft(Val Result) Export

    ExpectsThat(Result["status"]).Равно("CALCULATION_STATUS_SUCCESS");

EndProcedure

Procedure Check_OzonTimeslots(Val Result) Export

    ExpectsThat(Result["drop_off_warehouse_timeslots"]).ИмеетТип("Array");

EndProcedure

Procedure Check_NCSuccess(Val Result) Export

    ExpectsThat(Result["result"]).Равно("success");

EndProcedure

Procedure Check_NCFolderFiles(Val Result, Val Count) Export

    ExpectsThat(Result["result"]).Равно("success");
    ExpectsThat(Result["files"].Count()).Равно(Count);

EndProcedure

Procedure Check_NCSync(Val Result) Export

    ExpectsThat(Result["errors"]).Равно(0);
    ExpectsThat(Result["items"].Count()).Равно(0);

EndProcedure

Procedure Check_CdekToken(Val Result) Export

    ExpectsThat(Result["access_token"]).Заполнено();
    ExpectsThat(Result["expires_in"]).Заполнено();
    ExpectsThat(Result["token_type"]).Заполнено();

EndProcedure

Procedure Check_CdekOrder(Val Result) Export

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

EndProcedure

Procedure Check_CdekPrealert(Val Result) Export

    ExpectsThat(Result["entity"]["shipment_point"]).Заполнено();
    ExpectsThat(Result["requests"]).ИмеетТип("Array").Заполнено();

    Status = Result["requests"][0]["state"];

    ExpectsThat(Status = "ACCEPTED" Or Status = "SUCCESSFUL").Равно(True);

EndProcedure

Procedure Check_CdekReceipt(Val Result) Export

    ExpectsThat(Result["entity"]["statuses"][0]["code"]).Равно("ACCEPTED");
    ExpectsThat(Result["entity"]["copy_count"]).Равно(1);

EndProcedure

Procedure Check_CdekOrderNumber(Val Result) Export

    ExpectsThat(Result["entity"]["uuid"]).Заполнено();
    ExpectsThat(Result["entity"]["number"]).Заполнено();

EndProcedure

Procedure Check_CdekkDeliveryIntervals(Val Result) Export
    ExpectsThat(Result["date_intervals"]).ИмеетТип("Array");
EndProcedure

Procedure Check_CdekPassport(Val Result) Export

    ExpectsThat(Result["orders"][0]["passport"][0]["client"]).Равно("SENDER");
    ExpectsThat(Result["orders"][0]["passport"][1]["client"]).Равно("RECEIVER");

EndProcedure

Procedure Check_CdekCheck(Val Result) Export

    ExpectsThat(Result["check_info"]).ИмеетТип("Array");

EndProcedure

Procedure Check_YaMarketMarkets(Val Result) Export

    ExpectsThat(Result["campaigns"]).ИмеетТип("Array");
    ExpectsThat(Result["pager"]).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_YaMarketCampaign(Val Result) Export

    ExpectsThat(Result["campaign"]).ИмеетТип("Map");
    ExpectsThat(Result["campaign"]["id"]).Заполнено();

EndProcedure

Procedure Check_YaMarketBusiness(Val Result) Export

    ExpectsThat(Result["result"]["settings"]).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_YaMarketOk(Val Result) Export

    ExpectsThat(Result["status"]).Равно("OK");
    ExpectsThat(Result["results"]).Равно(Undefined);

EndProcedure

Procedure Check_MetrikaTags(Val Result) Export

    ExpectsThat(Result["labels"]).ИмеетТип("Array");

EndProcedure

Procedure Check_MetrikaTag(Val Result, Val Name = "") Export

    ExpectsThat(Result["label"]).ИмеетТип("Map");
    ExpectsThat(Result["label"]["id"]).Заполнено();

    If ValueIsFilled(Name) Then
        ExpectsThat(Result["label"]["name"]).Равно(Name);
    EndIf;

EndProcedure

Procedure Check_MetrikaSuccess(Val Result) Export

    ExpectsThat(Result["success"]).Равно(True);

EndProcedure

Procedure Check_MetrikaCounter(Val Result) Export

    ExpectsThat(Result["counter"]).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_MetrikaCounters(Val Result) Export

    ExpectsThat(Result["counters"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_MetrikaActions(Val Result) Export

    ExpectsThat(Result["operations"]).ИмеетТип("Array");

EndProcedure

Procedure Check_S3Success(Val Result) Export

    Success = Result["status"] >= 200 And Result["status"] < 300;
    ExpectsThat(Success).Равно(True);

EndProcedure

Procedure Check_S3NotFound(Val Result) Export

    NotFound = Result["status"] = 404;
    ExpectsThat(NotFound).Равно(True);

EndProcedure

Procedure Check_S3NotImplemented(Val Result) Export

    Success = Result["status"] = 501;
    ExpectsThat(Success).Равно(True);

EndProcedure

Procedure Check_AddIn(Val Result, Val TypeName) Export

    ExpectsThat(String(TypeOf(Result))).Равно(TypeName);

EndProcedure

Procedure Check_Equality(Val Value1, Val Value2) Export

    ExpectsThat(Value1).Равно(Value2);

EndProcedure

Procedure Check_Inequality(Val Value1, Val Value2) Export

    ExpectsThat(Value1 = Value2).Равно(False);

EndProcedure

Procedure Check_SQLiteSuccess(Val Result) Export

    ExpectsThat(Result["result"]).Равно(True);

EndProcedure

Procedure Check_SQLiteError(Val Result) Export

    ExpectsThat(Result["result"]).Равно(False);

EndProcedure

Procedure Check_SQLiteRows(Val Result, Val Count) Export

    ExpectsThat(Result["rows"]).Равно(Count);

EndProcedure

Procedure Check_SQLiteFieldsValues(Val Result, Val ValueStructure) Export

    For Each Value In ValueStructure Do
        Result[Value.Key] = Value.Value;
    EndDo;

EndProcedure

Procedure Check_SQLiteNoRows(Val Result) Export

    ExpectsThat(Result["data"].Count()).Равно(0);

EndProcedure

Procedure Check_ResultTrue(Val Result) Export

    ExpectsThat(Result["result"]).Равно(True);

EndProcedure

Procedure Check_ResultFalse(Val Result) Export

    ExpectsThat(Result["result"]).Равно(False);

EndProcedure

Procedure Check_GreenInstance(Val Result) Export

    ExpectsThat(Result["proxyInstance"]).Заполнено();

EndProcedure

Procedure Check_GreenSettingsSaving(Val Result) Export

    ExpectsThat(Result["saveSettings"]).Равно(True);

EndProcedure

Procedure Check_GreenAuth(Val Result) Export

    ExpectsThat(Result["stateInstance"]).Равно("authorized");

EndProcedure

Procedure Check_GreenReboot(Val Result) Export

    ExpectsThat(Result["isReboot"]).Равно(True);

EndProcedure

Procedure Check_GreenUnlogin(Val Result) Export

    ExpectsThat(Result["isLogout"]).Равно(True);

EndProcedure

Procedure Check_GreenAva(Val Result) Export

    ExpectsThat(Result["setProfilePicture"]).Равно(True);

EndProcedure

Procedure Check_GreenGroupPicture(Val Result) Export

    ExpectsThat(Result["setGroupPicture"]).Равно(True);

EndProcedure

Procedure Check_GreenCode(Val Result) Export

    ExpectsThat(Result["status"]).Равно(True);
    ExpectsThat(Result["code"]).Заполнено();

EndProcedure

Procedure Check_GreenProfile(Val Result) Export

    ExpectsThat(Result["deviceId"]).Заполнено();
    ExpectsThat(Result["phone"]).Заполнено();

EndProcedure

Procedure Check_GreenNewGroup(Val Result) Export

    ExpectsThat(Result["created"]).Равно(True);
    ExpectsThat(Result["chatId"]).Заполнено();

EndProcedure

Procedure Check_GreenLeaveGroup(Val Result) Export

    ExpectsThat(Result["removeAdmin"]).Равно(True);

EndProcedure

Procedure Check_GreenGroup(Val Result) Export

    ExpectsThat(Result["groupId"]).Заполнено();
    ExpectsThat(Result["owner"]).Заполнено();
    ExpectsThat(Result["creation"]).Заполнено();

EndProcedure

Procedure Check_GreenGroupName(Val Result) Export

    ExpectsThat(Result["updateGroupName"]).Равно(True);

EndProcedure

Procedure Check_GreenAddMember(Val Result) Export

    ExpectsThat(Result["addParticipant"]).Равно(True);

EndProcedure

Procedure Check_GreenExcludeMember(Val Result) Export

    ExpectsThat(Result["removeParticipant"]).Равно(True);

EndProcedure

Procedure Check_GreenAdminSet(Val Result) Export

    ExpectsThat(Result["setGroupAdmin"]).Равно(True);

EndProcedure

Procedure Check_GreenAdminRemove(Val Result) Export

    ExpectsThat(Result["removeAdmin"]).Равно(True);

EndProcedure

Procedure Check_GreenMessage(Val Result) Export

    ExpectsThat(Result["idMessage"]).Заполнено();

EndProcedure

Procedure Check_GreenMessages(Val Result) Export

    ExpectsThat(Result["messages"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_GreenFile(Val Result) Export

    ExpectsThat(Result["idMessage"]).Заполнено();
    ExpectsThat(Result["urlFile"]).Заполнено();

EndProcedure

Procedure Check_GreenNotification(Val Result) Export

    ExpectsThat(Result["receiptId"]).Заполнено();

EndProcedure

Procedure Check_GreenInputFile(Val Result) Export

    ExpectsThat(Result["downloadUrl"]).Заполнено();

EndProcedure

Procedure Check_GreenReading(Val Result) Export

    ExpectsThat(Result["setRead"]).Равно(True);

EndProcedure

Procedure Check_GreenQueueClearing(Val Result) Export

    ExpectsThat(Result["isCleared"]).Равно(True);

EndProcedure

Procedure Check_OllamaResponse(Val Result, Val Completed = True) Export

   ExpectsThat(Result["model"]).Заполнено();
   ExpectsThat(Result["response"]).Заполнено();
   ExpectsThat(Result["done"]).Равно(Completed);

EndProcedure

Procedure Check_OllamaEmbeddings(Val Result) Export

    ExpectsThat(Result["embeddings"]).Заполнено();

EndProcedure

Procedure Check_OllamaLoadUnload(Val Result, Val Unload) Export

   ExpectsThat(Result["model"]).Заполнено();
   ExpectsThat(Result["done"]).Равно(True);

   If Unload Then
       ExpectsThat(Result["done_reason"]).Равно("unload");
   Else
       ExpectsThat(Result["done_reason"]).Равно("load");
   EndIf;

EndProcedure

Procedure Check_OllamaMessage(Val Result, Val Completed = True) Export

   ExpectsThat(Result["model"]).Заполнено();
   ExpectsThat(Result["message"]).Заполнено();
   ExpectsThat(Result["done"]).Равно(Completed);

EndProcedure

Procedure Check_OllamaSuccess(Val Result) Export

   ExpectsThat(Result["status"]).Равно("success");

EndProcedure

Procedure Check_OllamaModels(Val Result) Export

    ExpectsThat(Result["models"]).ИмеетТип("Array");

EndProcedure

Procedure Check_OllamaModelInfo(Val Result) Export

   ExpectsThat(Result["parameters"]).Заполнено();
   ExpectsThat(Result["model_info"]).Заполнено();

EndProcedure

Procedure Check_OllamaVersion(Val Result) Export

   ExpectsThat(Result["version"]).Заполнено();

EndProcedure

Procedure Check_OllamaCode(Val Result) Export

    ExpectsThat(Result["status_code"] < 300).Равно(True);

EndProcedure

Procedure Check_OllamaError(Val Result) Export

    ExpectsThat(Result["status_code"] >= 400).Равно(True);

EndProcedure

Procedure Check_OpenAIResponse(Val Result) Export

    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("chat.completion");
    ExpectsThat(Result["choices"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_OpenAIEmbeddings(Val Result) Export

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("list");
    ExpectsThat(Result["data"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_OpenAIAssistant(Val Result, Val Name = "") Export

    ExpectsThat(Result["model"]).Заполнено();
    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("assistant");

    If ValueIsFilled(Name) Then
        ExpectsThat(Result["name"]).Равно(Name);
    EndIf;

EndProcedure

Procedure Check_OpenAIAssistantDeletion(Val Result, Val AssistantID) Export

    ExpectsThat(Result["id"]).Равно(AssistantID);
    ExpectsThat(Result["object"]).Равно("assistant.deleted");
    ExpectsThat(Result["deleted"]).Равно(True);

EndProcedure

Procedure Check_OpenAIList(Val Result) Export

    ExpectsThat(Result["object"]).Равно("list");
    ExpectsThat(Result["data"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_OpenAIFile(Val Result
    , Val FileName    = Undefined
    , Val Size        = Undefined
    , Val Destination = Undefined) Export

    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["object"]).Равно("file");

    If FileName <> Undefined Then
        ExpectsThat(Result["filename"]).Равно(FileName);
    EndIf;

    If Size <> Undefined Then
        ExpectsThat(Result["bytes"]).Равно(Size);
    EndIf;

    If Destination <> Undefined Then
        ExpectsThat(Result["purpose"]).Равно(Destination);
    EndIf;

EndProcedure

Procedure Check_OpenAIFileDeletion(Val Result, Val FileID) Export

    ExpectsThat(Result["id"]).Равно(FileID);
    ExpectsThat(Result["object"]).Равно("file");
    ExpectsThat(Result["deleted"]).Равно(True);

EndProcedure

Procedure Check_OpenAIImage(Val Result) Export

    ExpectsThat(Result["data"]).Заполнено();
    ExpectsThat(Result["created"]).Заполнено();

EndProcedure

#EndRegion

#EndRegion

#Region Private

Function GetValueFromFile(Parameter, Path)

    Values = OPI_Tools.ReadJSONFile(Path);
    Return ?(Values.Property(Parameter), Values[Parameter], "");

EndFunction

Function DataFilePath()

    Path          = "";
    PossiblePaths = New Array;
    PossiblePaths.Add("./data.json");
    PossiblePaths.Add("C:\GDrive\Мой Диск\data.json");
    PossiblePaths.Add("G:\Мой Диск\data.json");

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

// BSLLS:CognitiveComplexity-off

Function GetCLIFormedValue(Val Value, Val Embedded = False)

    CurrentType = TypeOf(Value);
    Cover       = False;

    If CurrentType = Type("Number") Then

        Value = OPI_Tools.NumberToString(Value);

    ElsIf CurrentType = Type("String") Then

        Value = OPI_Tools.NumberToString(Value);

        If Not Embedded Then
            Cover = True;
        EndIf;

    ElsIf CurrentType = Type("Date") Then

        Value = XMLString(Value);
        Cover = True;

    ElsIf CurrentType  = Type("Structure")
        Or CurrentType = Type("Map")
        Or CurrentType = Type("Array") Then

        JSONWriter = New JSONWriter();

        If OPI_Tools.IsOneScript() Or CurrentType = Type("Array") Then

            WriterSettings = New JSONWriterSettings(JSONLineBreak.None, , False);
            JSONWriter.SetString(WriterSettings);
            WriteJSON(JSONWriter, Value);

            Value = JSONWriter.Close();
            Cover = True;

        Else

            // BSLLS:MissingTemporaryFileDeletion-off

            //@skip-check missing-temporary-file-deletion
            TFN = GetTempFileName("json");
            // BSLLS:MissingTemporaryFileDeletion-on

            Stream = New FileStream(TFN, FileOpenMode.Create);

            JSONWriter.OpenStream(Stream);
            WriteJSON(JSONWriter, Value);
            JSONWriter.Close();
            Stream.Close();

            Value = TFN;
            Cover = True;

        EndIf;

    ElsIf CurrentType = Type("Boolean") Then

        Value = ?(Value, "true", "false");

    ElsIf CurrentType = Type("BinaryData") Then

        // BSLLS:MissingTemporaryFileDeletion-off

        //@skip-check missing-temporary-file-deletion
        TFN = GetTempFileName();
        Value.Write(TFN);
        Value = TFN;
        Cover = True;

        // BSLLS:MissingTemporaryFileDeletion-on

    Else

        Raise "Invalid type " + String(CurrentType);

    EndIf;

    If Not OPI_Tools.IsWindows() Then
        Value = StrReplace(Value, """" , """'""");
    EndIf;

    If Cover Then
        Value = """" + Value + """";
    EndIf;

    Return Value;

EndFunction

// BSLLS:CognitiveComplexity-on

Function FormOption(Val Value, Val Name, Val Embedded = False)

    SecretsArray = New Array();
    SecretsArray.Add("token");
    SecretsArray.Add("key");
    SecretsArray.Add("secret");
    SecretsArray.Add("pass");
    SecretsArray.Add("client");
    SecretsArray.Add("api");
    SecretsArray.Add("refresh");

    ReplaceStructure = New Map;
    ReplaceStructure.Insert("host.docker.internal", "127.0.0.1");

    If TypeOf(Value) = Type("Structure") Or TypeOf(Value) = Type("Map") Then

        Value = FormOptionCollection(Value);

    ElsIf TypeOf(Value) = Type("Array") Then

        Value = FormOptionArray(Value, Name);

    Else

        For Each SecretKey In SecretsArray Do

            If StrFind(Lower(Name), SecretKey) <> 0 Then
                Value = "***";
            EndIf;

        EndDo;

        For Each ReplaceValue In ReplaceStructure Do
            Value = StrReplace(Value, ReplaceValue.Key, ReplaceValue.Value);
        EndDo;

    EndIf;

    If Not Embedded Then
        Value = "--" + Name + " " + GetCLIFormedValue(Value);
    EndIf;

    Return Value;

EndFunction

Function FormOptionCollection(Val Value)

    Value_ = ?(TypeOf(Value) = Type("Structure"), New Structure, New Map);

    For Each Element In Value Do

        Value_.Insert(Element.Key, FormOption(Element.Value, Element.Key, True));

    EndDo;

    Return Value_;

EndFunction

Function FormOptionArray(Val Value, Val Name)

    Value_ = New Array;

    For Each Element In Value Do
        Value_.Add(FormOption(Element, Name, True));
    EndDo;

    Return Value_;

EndFunction

Function ReadCLIResponse(Val ResultFile)

    Try

        // BSLLS:ExternalAppStarting-off
        JSONReader = New JSONReader();
        JSONReader.OpenFile(ResultFile);
        Result = ReadJSON(JSONReader, True);
        JSONReader.Close();
        // BSLLS:ExternalAppStarting-on

    Except

        Message(DetailErrorDescription(ErrorInfo()));

        Try
            Result = New BinaryData(ResultFile);
        Except
            Result = null;
        EndTry;

     EndTry;

     Return Result;

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

        If TypeOf(Option.Value)     = Type("Structure")
            Or TypeOf(Option.Value) = Type("Map") Then

                FindJSON = True;

        EndIf;

        CurrentOption = Option.Value;

        If CurrentOption <> Undefined Then

            ProcessSpecialOptionsSecrets(Library, Option.Key, CurrentOption);
            CurrentOption = FormOption(CurrentOption, Option.Key);
            OptionsArray.Add(CurrentOption);

        EndIf;

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

Procedure PrintLog(Val Result, Val Method, Val Library)

    Header = String(OPI_Tools.GetCurrentDate()) + " | " + Method;

    Try
        Data = OPI_Tools.JSONString(Result);
    Except
        Data = "Not JSON: " + String(Result);
    EndTry;

    Data = " " + Data;

    Message(Header);
    Message(Chars.LF);
    Message(Data);
    Message(Chars.LF);
    Message("---------------------------------");
    Message(Chars.LF);

EndProcedure

Procedure WriteLogFile(Val Data, Val Method, Val Library)

    Try

        LogPath        = "./docs/en/results";
        LibraryLogPath = LogPath + "/" + Library;

        LogDirectory = New File(LogPath);

        If Not LogDirectory.Exists() Then
            CreateDirectory(LogPath);
        EndIf;

        LibraryLogCatalog = New File(LibraryLogPath);

        If Not LibraryLogCatalog.Exists() Then
            CreateDirectory(LibraryLogPath);
        EndIf;

        FilePath = LibraryLogPath + "/" + Method + ".log";

        LogDocument = New TextDocument;
        LogDocument.SetText(Data);
        LogDocument.Write(FilePath);

    Except
        Message("Failed to write log file!: " + ErrorDescription());
    EndTry;

EndProcedure

Procedure ProcessSpecialOptionsSecrets(Val Library, Val Option, Value)

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

    Else
        Return;
    EndIf;

EndProcedure

Procedure ProcessSecretsBitrix24(Val Option, Value)

    If Option = "url" Then

        Value = ?(StrFind(Value, "rest") > 0
            , "https://b24-ar17wx.bitrix24.by/rest/1/***"
            , Value);

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

        Value = New Structure("Authorization", "***");

    Else
        Return;
    EndIf;

EndProcedure

#EndRegion
