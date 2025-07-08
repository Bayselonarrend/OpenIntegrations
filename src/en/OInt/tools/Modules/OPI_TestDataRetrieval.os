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

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
#Use "./internal"
#Use asserts

#Region Internal

Function GetTestingSectionMapping() Export

    Sections = New Structure;
    Sections.Insert("Telegram"       , 5);
    Sections.Insert("VK"             , 5);
    Sections.Insert("Viber"          , 5);
    Sections.Insert("Twitter"        , 4);
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

        Set = Module.ДобавитьТестовыйНабор("CLI_" + CurrentSection);

        For Each Test In SectionTests Do
            Set.ДобавитьСерверныйТест("CLI_" + Test.Method, Test.Synonym);
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
        CopyFile(Path, TFN);
        Path   = TFN;
        Binary = New BinaryData(Path);

        DeleteFiles(TFN);

    Else

        Binary = New BinaryData(Path);

    EndIf;

    Return Binary;

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

Procedure WriteLog(Val Result, Val Method, Val Library = "") Export

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

Procedure WriteLogFile(Val Data, Val Method, Val Library, Val Forced = False) Export

    Try

        LogPath        = "./docs/en/results";
        LibraryLogPath = LogPath + "/" + Library;

        LogDirectory = New File(LogPath);

        If Not LogDirectory.Exist() Then
            CreateDirectory(LogPath);
        EndIf;

        LibraryLogCatalog = New File(LibraryLogPath);

        If Not LibraryLogCatalog.Exist() Then
            CreateDirectory(LibraryLogPath);
        EndIf;

        FilePath = LibraryLogPath + "/" + Method + ".log";
        LogFile  = New File(FilePath);

        If Not LogFile.Exist() Or Forced Then
            LogDocument = New TextDocument;
            LogDocument.SetText(Data);
            LogDocument.Write(FilePath);
        EndIf;

    Except
        Message("Failed to write log file!: " + ErrorDescription());
    EndTry;

EndProcedure

Procedure WriteLogCLI(Val Result, Val Method, Val Library = "") Export

    Template = "%1 (CLI, %2)";
    WriteLog(Result, StrTemplate(Template, Method, Library));

EndProcedure

Function ExecuteTestCLI(Val Library, Val Method, Val Options, Val Record = True) Export

    If OPI_Tools.IsWindows() Then

        If OPI_Tools.IsOneScript() Then
            Oint = "oint";
        Else
            Oint = """C:\Program Files (x86)\OInt\bin\oint.bat""";
        EndIf;

    Else

        Oint = "oint";

    EndIf;

    ResultFile = GetTempFileName();

    LaunchString = Oint + " " + Library + " " + Method;

    For Each Option In Options Do

        CurrentValue = GetCLIFormedValue(Option.Value);

        LaunchString = LaunchString
            + " --"
            + Option.Key
            + " "
            + CurrentValue;

    EndDo;

    RunApp(LaunchString + " --out """ + ResultFile + """ --debug" , , True);

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

#Region Checks

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

Procedure Check_TelegramTrue(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).Равно(True);

EndProcedure

Procedure Check_TelegramBotInformation(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["username"]).Заполнено();

EndProcedure

Procedure Check_TelegramArray(Result) Export

    ExpectsThat(Result).ИмеетТип("Map") .Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Array");

EndProcedure

Procedure Check_TelegramWebhookSetup(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["description"]).Равно("Webhook was set");

EndProcedure

Procedure Check_TelegramWebhookDeletion(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).Равно(True);
    ExpectsThat(Result["description"]).Заполнено();

EndProcedure

Procedure Check_TelegramMessage(Val Result, Val Text) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["text"]).Равно(Text);

EndProcedure

Procedure Check_TelegramImage(Val Result, Val Text) Export

    ExpectsThat(Result).ИмеетТип("Map") .Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["photo"]).ИмеетТип("Array");

EndProcedure

Procedure Check_TelegramVideo(Val Result, Val Text) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["video"]["mime_type"]).Равно("video/mp4");

EndProcedure

Procedure Check_TelegramAudio(Val Result, Val Text) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["audio"]["mime_type"]).Равно("audio/mpeg");

EndProcedure

Procedure Check_TelegramDocument(Val Result, Val Text) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["caption"]).Равно(Text);
    ExpectsThat(Result["result"]["document"]).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_TelegramGif(Val Result, Val Text) Export

    Result_ = "result";

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result[Result_]["caption"]).Равно(Text);
    ExpectsThat(Result[Result_]["document"]).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result[Result_]["animation"]["mime_type"]).Равно("video/mp4");

EndProcedure

Procedure Check_TelegramMediaGroup(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Array");

EndProcedure

Procedure Check_TelegramLocation(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["location"]).ИмеетТип("Map").Заполнено();

EndProcedure

Procedure Check_TelegramContact(Val Result, Val Name) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["contact"]).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["result"]["contact"]["first_name"]).Равно(Name);

EndProcedure

Procedure Check_TelegramPoll(Val Result, Val Question) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["poll"]).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["result"]["poll"]["question"]).Равно(Question);

EndProcedure

Procedure Check_TelegramForward(Val Result, Val MessageID) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["forward_origin"]["message_id"]).Равно(Number(MessageID));

EndProcedure

Procedure Check_TelegramBan(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["description"]).Равно("Bad Request: can't remove chat owner");

EndProcedure

Procedure Check_TelegramInvitation(Val Result, Val Title, Val UnixExpiration) Export

    Result_ = "result";
    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result[Result_]["member_limit"]).Равно(200);
    ExpectsThat(Result[Result_]["name"]).Равно(Title);
    ExpectsThat(Result[Result_]["expire_date"]).Равно(Number(UnixExpiration));

EndProcedure

Procedure Check_TelegramNumber(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]).ИмеетТип("Number");

EndProcedure

Procedure Check_TelegramOk(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

EndProcedure

Procedure Check_TelegramCreateTopic(Val Result, Val Name, Icon) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(Result["result"]["name"]).Равно(Name);
    ExpectsThat(Result["result"]["icon_custom_emoji_id"]).Равно(Icon);

EndProcedure

Procedure Check_TelegramMessageKeyboard(Val Result, Val Keyboard) Export

    MessageKeyboard = Result["result"]["reply_markup"];

    Keyboard_ = OPI_Tools.JsonToStructure(Keyboard);
    Keyboard_.Delete("rows");
    Keyboard_ = OPI_Tools.JSONString(Keyboard_);

    ExpectsThat(Result["ok"]).Равно(True);
    ExpectsThat(StrLen(OPI_Tools.JSONString(MessageKeyboard))).Равно(StrLen(Keyboard_));

EndProcedure

Procedure Check_VKPost(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["post_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKTrue(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Равно(1);

EndProcedure

Procedure Check_VKElement(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_VKAlbum(Val Result, Val Description) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["description"]).Равно(Description);

EndProcedure

Procedure Check_VKAlbumPicture(Val Result, Val ImageDescription, Val AlbumID = "") Export

    Response = "response";

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result[Response][0]["text"]).Равно(ImageDescription);

    If ValueIsFilled(AlbumID) Then
        ExpectsThat(Result[Response][0]["album_id"]).Равно(AlbumID);
    Else
        ExpectsThat(Result[Response][0]["album_id"]).Заполнено();
    EndIf;

EndProcedure

Procedure Check_VKStory(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["count"]).ИмеетТип("Number").Равно(1);
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_VKDiscussion(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKLike(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["likes"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKRepost(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["success"]).ИмеетТип("Number").Равно(1);
    ExpectsThat(Result["response"]["wall_repost_count"]).ИмеетТип("Number").Равно(1);

EndProcedure

Procedure Check_VKComment(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["response"]["comment_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKStatistic(Val Result) Export

    TypeMap = "Map";

    ExpectsThat(Result).ИмеетТип(TypeMap).Заполнено();
    ExpectsThat(Result["response"][0]["visitors"]).ИмеетТип(TypeMap).Заполнено();
    ExpectsThat(Result["response"][0]["reach"]).ИмеетТип(TypeMap).Заполнено();

EndProcedure

Procedure Check_VKPostsStatistic(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Array").ИмеетДлину(2);

EndProcedure

Procedure Check_VKNumber(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKCollection(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["albums_count"]).ИмеетТип("Number").Заполнено();
    ExpectsThat(Result["response"]["market_album_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKProduct(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["market_item_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKProp(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["property_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKPropVariant(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["variant_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKProductData(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["items"]).ИмеетТип("Array").ИмеетДлину(2);

EndProcedure

Procedure Check_VKProductsGroup(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["item_group_id"]).ИмеетТип("Number").Заполнено();

EndProcedure

Procedure Check_VKVideo(Val Result) Export

    ExpectsThat(Result["video_id"]).Заполнено();
    ExpectsThat(Result["video_hash"]).Заполнено();

EndProcedure

Procedure Check_VKCategories(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["response"]["v2"]).ИмеетТип("Array").Заполнено();

EndProcedure

Procedure Check_YaDiskDrive(Val Result) Export

    Map_ = "Map";

    ExpectsThat(Result).ИмеетТип(Map_).Заполнено();
    ExpectsThat(Result["system_folders"]).ИмеетТип(Map_);
    ExpectsThat(Result["user"]).ИмеетТип(Map_);

EndProcedure

Procedure Check_YaDiskFolder(Val Result, Val Path) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("dir");
    ExpectsThat(Result["path"]).Равно("disk:" + Path);

EndProcedure

Procedure Check_YaDiskPath(Val Result, Val Path = "", Val Public = Undefined) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["type"]).Равно("file");

    If ValueIsFilled(Path) Then
        ExpectsThat(Result["path"]).Равно("disk:" + Path);
    Else
        ExpectsThat(Result["path"]).Заполнено();
    EndIf;

    If Not Public = Undefined Then

        If Public Then
             ExpectsThat(Result["public_url"]).ИмеетТип("String").Заполнено();
        Else
            ExpectsThat(Result["public_url"]).ИмеетТип("Undefined");
        EndIf;

    EndIf;

EndProcedure

Procedure Check_YaDiskLink(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["method"]).Равно("GET");
    ExpectsThat(Result["href"]).ИмеетТип("String").Заполнено();

EndProcedure

Procedure Check_YaDiskProc(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["href"]).Заполнено();
    ExpectsThat(Result["method"]).Заполнено();

EndProcedure

Procedure Check_YaDiskFilesList(Val Result, Val Count, Val Indent) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["limit"]).Равно(Count);
    ExpectsThat(Result["offset"]).Равно(Indent);
    ExpectsThat(Result["items"]).ИмеетТип("Array");

EndProcedure

Procedure Check_GKObject(Val Result, Val Name, Val Description) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

EndProcedure

Procedure Check_TwitterText(Val Result, Val Text) Export

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


EndProcedure

Procedure Check_TwitterArray(Val Result) Export

    If Not TypeOf(Result) = Type("Array") Then

        Status = Result["status"];
        ExpectsThat(Status).Равно(429);

    EndIf;

EndProcedure

Procedure Check_ViberOk(Val Result) Export

    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

EndProcedure

Procedure Check_ViberUser(Val Result) Export

    ExpectsThat(Result["chat_hostname"]).Заполнено();
    ExpectsThat(Result["status_message"]).Заполнено();

EndProcedure

Procedure Check_ViberOnline(Val Result) Export

    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);
    ExpectsThat(Result["users"]).ИмеетТип("Array");

EndProcedure

Procedure Check_ViberMessage(Val Result) Export

    ExpectsThat(Result["message_token"]).Заполнено();
    ExpectsThat(Result["status_message"]).Равно("ok");
    ExpectsThat(Result["status"]).Равно(0);

EndProcedure

Procedure Check_GoogleToken(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["access_token"]).Заполнено();

EndProcedure

Procedure Check_GoogleCalendar(Val Result, Val Name) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["summary"]).Равно(Name);
    ExpectsThat(Result["id"]).ИмеетТип("String").Заполнено();

EndProcedure

Procedure Check_GoogleCalendarColors(Val Result, Val PrimaryColor, Val SecondaryColor) Export

    ExpectsThat(Result).ИмеетТип("Map");
    ExpectsThat(Result["foregroundColor"]).Равно(PrimaryColor);
    ExpectsThat(Result["backgroundColor"]).Равно(SecondaryColor);

EndProcedure

Procedure Check_GoogleCatalogs(Val Result) Export

    ExpectsThat(Result["mimeType"]).Равно("application/vnd.google-apps.folder");
    ExpectsThat(Result["name"]).Заполнено();

EndProcedure

Procedure Check_GoogleCatalog(Val Result) Export

    ExpectsThat(Result["mimeType"]).Равно("application/vnd.google-apps.folder");
    ExpectsThat(Result["name"]).Заполнено();

EndProcedure

Procedure Check_GoogleObject(Val Result, Val Description) Export

    ExpectsThat(Result["mimeType"]).Равно(Description["MIME"]);
    ExpectsThat(Result["name"]).Равно(Description["Name"]);

EndProcedure

Procedure Check_GoogleComment(Val Result, Val Comment) Export

    ExpectsThat(Result["content"]).Равно(Comment);
    ExpectsThat(Result["kind"]).Равно("drive#comment");

EndProcedure

Procedure Check_GoogleSpreadsheet(Val Result, Val Name, Val SheetArray = "") Export

    ExpectsThat(Result["properties"]["title"]).Равно(Name);

    If ValueIsFilled(SheetArray) Then

        For N = 0 To SheetArray.UBound() Do

            SheetName = Result["sheets"][N]["properties"]["title"];
            ExpectsThat(SheetName).Равно(SheetArray[N]);

        EndDo;

    EndIf;

EndProcedure

Procedure Check_GoogleSheet(Val Result, Val Spreadsheet = "") Export

    ExpectsThat(Result["title"]).Заполнено();

    If ValueIsFilled(Spreadsheet) Then

        ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

    EndIf;

EndProcedure

Procedure Check_GoogleSpreadsheetElement(Val Result, Val Spreadsheet) Export

    ExpectsThat(Result["spreadsheetId"]).Равно(Spreadsheet);

EndProcedure

Procedure Check_GoogleSheetTitle(Val Result, Val Name) Export

    ExpectsThat(Result["properties"]["title"]).Равно(Name);

EndProcedure

Procedure Check_GoogleCellUpdating(Val Result, Val Count) Export

    ExpectsThat(Result["totalUpdatedCells"]).Равно(Count);

EndProcedure

Procedure Check_GoogleCellValues(Val Result, Val Count) Export

    ExpectsThat(Result["valueRanges"].Count()).Равно(Count);

EndProcedure

Procedure Check_GoogleCellCleanning(Val Result, Val Count) Export

    ExpectsThat(Result["clearedRanges"].Count()).Равно(Count);

EndProcedure

Procedure Check_TwitterToken(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["access_token"]).Заполнено();
    ExpectsThat(Result["refresh_token"]).Заполнено();

EndProcedure

Procedure Check_NotionObject(Val Result, Val View = "page") Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["object"]).Равно(View);

EndProcedure

Procedure Check_NotionBasePage(Val Result, Val Base) Export

    Check_NotionObject(Result);

    Parent = Result["parent"]["database_id"];
    ExpectsThat(Parent).Равно(Base);

EndProcedure

Procedure Check_SlackOk(Val Result) Export

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(Result["ok"]).Равно(True);

EndProcedure

Procedure Check_SlackBot(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["bot_id"]).Заполнено();
    ExpectsThat(Result["user_id"]).Заполнено();

EndProcedure

Procedure Check_SlackUsers(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["members"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackWorkspaces(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["teams"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackMessage(Val Result, Val Text, Val Channel) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["channel"]).Равно(Channel);
    ExpectsThat(Result["ts"]).Заполнено();
    ExpectsThat(Result["message"]["text"]).Равно(Text);

EndProcedure

Procedure Check_SlackMessages(Val Result) Export

    ExpectsThat(Result["messages"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackMessageLink(Val Result, Val Channel) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["channel"]).Равно(Channel);
    ExpectsThat(Result["permalink"]).Заполнено();

EndProcedure

Procedure Check_SlackSheduledMessage(Val Result, Val Channel) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["channel"]).Равно(Channel);
    ExpectsThat(Result["scheduled_message_id"]).Заполнено();

EndProcedure

Procedure Check_SlackEphemeral(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["message_ts"]).Заполнено();

EndProcedure

Procedure Check_SlackSheduled(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["scheduled_messages"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackChannel(Val Result, Val Name = "") Export

    Data = Result["channel"];

    Check_SlackOk(Result);

    If ValueIsFilled(Name) Then
        ExpectsThat(Data["name"]).Равно(Name);
    EndIf;

EndProcedure

Procedure Check_SlackChannelTopic(Val Result, Val Topic) Export

    Data = Result["channel"];

    Check_SlackOk(Result);
    ExpectsThat(Data["topic"]["value"]).Равно(Topic);

EndProcedure

Procedure Check_SlackChannelHistory(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["messages"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackChannelUsers(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["members"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackChannelsList(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["channels"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackDialog(Val Result) Export

    Dialog = Result["channel"]["id"];
    Check_SlackOk(Result);
    ExpectsThat(Result["channel"]).ИмеетТип("Map");
    ExpectsThat(Dialog).Заполнено();

EndProcedure

Procedure Check_SlackFilesList(Val Result) Export

    Check_SlackOk(Result);
    ExpectsThat(Result["files"]).ИмеетТип("Array");

EndProcedure

Procedure Check_SlackFile(Val Result, Val FileName) Export

    If ValueIsFilled(Result["files"]) Then
        UploadedFile = Result["files"][0];
    Else
        UploadedFile = Result["file"];
    EndIf;

    Check_SlackOk(Result);
    ExpectsThat(UploadedFile["name"]).Равно(FileName);

EndProcedure

Procedure Check_SlackExternalFile(Val Result, Val Title) Export

    UploadedFile = Result["file"];

    Check_SlackOk(Result);
    ExpectsThat(UploadedFile["title"]).Равно(Title);

EndProcedure

Procedure Check_ATBaseWithTable(Val Result, Val TableName) Export

    ExpectsThat(Result["id"]).Заполнено();
    ExpectsThat(Result["tables"][0]["name"]).Равно(TableName);

EndProcedure

Procedure Check_ATTablesList(Val Result) Export

    ExpectsThat(Result["tables"]).Заполнено();
    ExpectsThat(Result["tables"]).ИмеетТип("Array");

EndProcedure

Procedure Check_ATBasesList(Val Result) Export

    ExpectsThat(Result["bases"]).Заполнено();
    ExpectsThat(Result["bases"]).ИмеетТип("Array");

EndProcedure

Procedure Check_ATTable(Val Result, Val Name, Val Description) Export

    ExpectsThat(Result["name"]).Равно(Name);
    ExpectsThat(Result["description"]).Равно(Description);

EndProcedure

Procedure Check_ATField(Val Result, Val Name) Export

    ExpectsThat(Result["name"]).Равно(Name);

EndProcedure

Procedure Check_ATRecords(Val Result) Export

    ExpectsThat(Result["records"]).ИмеетТип("Array");
    ExpectsThat(Result["records"]).Заполнено();

EndProcedure

Procedure Check_ATRecordNumberAndString(Val Result, Val Numeric, Val StringType) Export

    SingleRecord = Result["id"];
    ExpectsThat(SingleRecord).Заполнено();
    ExpectsThat(Result["createdTime"]).Заполнено();
    ExpectsThat(Result["fields"]["Number"]).Равно(Numeric);
    ExpectsThat(TrimAll(Result["fields"]["String"])).Равно(StringType);

EndProcedure

Procedure Check_ATRecord(Val Result, Val Record) Export

    ExpectsThat(Result["id"]).Равно(Record);

EndProcedure

Procedure Check_ATText(Val Result, Val Text) Export

    ExpectsThat(Result["text"]).Равно(Text);

EndProcedure

Procedure Check_ATComments(Val Result) Export

    ExpectsThat(Result["comments"]).ИмеетТип("Array");

EndProcedure

Procedure Check_ATCommentDeleting(Val Result, Val Comment) Export

    ExpectsThat(Result["deleted"]).Равно(True);
    ExpectsThat(Result["id"]).Равно(Comment);

EndProcedure

Procedure Check_DropboxFile(Val Result, Val Path) Export

    ExpectsThat(Result["path_display"]).Равно(Path);

EndProcedure

Procedure Check_DropboxMetadata(Val Result, Val Path) Export

    ExpectsThat(Result["metadata"]["path_display"]).Равно(Path);

EndProcedure

Procedure Check_DropboxArray(Val Result, Val Count = Undefined) Export

    ExpectsThat(Result["entries"]).ИмеетТип("Array");

    If Not Count = Undefined Then
        ExpectsThat(Result["entries"].Count()).Равно(Count);
    EndIf;

EndProcedure

Procedure Check_DropboxWork(Val Result) Export
    ExpectsThat(Result["async_job_id"]).Заполнено();
EndProcedure

Procedure Check_DropboxStatus(Val Result) Export
    ExpectsThat(Result[".tag"]).Равно("complete");
EndProcedure

Procedure Check_DropboxTags(Val Result, Val Count) Export

    ExpectsThat(Result["paths_to_tags"]).ИмеетТип("Array");
    ExpectsThat(Result["paths_to_tags"].Count()).Равно(Count);

EndProcedure

Procedure Check_DropboxAccount(Val Result) Export
    ExpectsThat(Result["account_id"]).Заполнено();
EndProcedure

Procedure Check_DropboxSpace(Val Result) Export
    ExpectsThat(Result["used"]).Заполнено();
EndProcedure

Procedure Check_DropboxMember(Val Result, Val Email, Val ViewOnly) Export
    ExpectsThat(Result[0]["result"][".tag"]).Равно("success");
    ExpectsThat(Result[0]["member"]["email"]).Равно(Email);
    ExpectsThat(
        Result[0]["result"]["success"][".tag"]).Равно(?(ViewOnly, "viewer", "editor"));
EndProcedure

Procedure Check_DropboxPublicFolder(Val Result) Export
    ExpectsThat(Result["shared_folder_id"]).Заполнено();
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

    ExpectsThat(Result["result"]["items"]).ИмеетТип("Array");
    ExpectsThat(Result["result"]["items"][0]["status"]).Равно("imported");

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

Procedure Check_CdekReceipt(Val Result) Export

    URL = Result["entity"]["url"];

    ExpectsThat(URL).Заполнено();
    ExpectsThat(StrEndsWith(URL, ".pdf")).Равно(True);

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

        If RepositoryFile.Exist() Then
            Path = PossiblePath;
            Break;
        EndIf;

    EndDo;

    Return Path;

EndFunction

Function GetCommonModule(Val Name)

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

        If Not ValueIsFilled(Value) Then
            Value = "''";
        EndIf;

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

    ReplaceStructure = New Structure;

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

        For Each ReplacedKey In ReplaceStructure Do

            If Lower(Name) = ReplacedKey.Key Then
                Value      = ReplacedKey.Value;
            EndIf;

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

        JSONReader = New JSONReader();
        JSONReader.OpenFile(ResultFile);
        Result     = ReadJSON(JSONReader, True);
        JSONReader.Close();

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

    Record             = New JSONWriter;
    JSONWriterSettings = New JSONWriterSettings(JSONLineBreak.Auto, Chars.Tab);
    Record.OpenFile(Path, , , JSONWriterSettings);
    WriteJSON(Record, Values);
    Record.Close();

EndProcedure

Procedure WriteCLICall(Val Library, Val Method, Val Options)

    If Not OPI_Tools.IsOneScript() Then
        Return;
    EndIf;

    CatalogExample = "./docs/en/cli/" + Library;
    FileExample    = New File(CatalogExample);

    If Not FileExample.Exist() Then
        CreateDirectory(CatalogExample);
    EndIf;

    MethodCatalog = CatalogExample + "/" + Method;
    MethodFile    = New File(MethodCatalog);

    If Not MethodFile.Exist() Then
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
        ProcessSpecialOptionsSecrets(Library, Option.Key, CurrentOption);
        CurrentOption = FormOption(CurrentOption, Option.Key);

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

    ПолучитьДвоичныеДанныеИзСтроки(BatString).Write(MethodCatalog + "/bat.txt");
    ПолучитьДвоичныеДанныеИзСтроки(BashString).Write(MethodCatalog + "/bash.txt");

EndProcedure

Procedure ProcessSpecialOptionsSecrets(Val Library, Val Option, Value)

    If Library = "bitrix24" Then

        ProcessSecretsBitrix24(Option, Value);

    ElsIf Library = "postgres" Then

        ProcessSecretsPostgreSQL(Option, Value);

    ElsIf Library = "mysql" Then

        ProcessSecretsMySQL(Option, Value);

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

Procedure ProcessSecretsMySQLOllama(Val Option, Value)

    If Option = "headers" Then

        Value = New Structure("Authorization", "***");

    Else
        Return;
    EndIf;

EndProcedure

#EndRegion

#Region Alternate

Function ПолучитьСоответствиеРазделовТестирования() Export
	Return GetTestingSectionMapping();
EndFunction

Function ПолучитьСоответствиеРазделовТестированияGA() Export
	Return GetTestingSectionMappingGA();
EndFunction

Function ПолучитьТаблицуТестов() Export
	Return GetTestTable();
EndFunction

Function ОжидаетЧто(Значение) Export
	Return ExpectsThat(Значение);
EndFunction

Function СформироватьТестыЯкс() Export
	Return FormYAXTests();
EndFunction

Function СформироватьТестыАссертс() Export
	Return FormAssertsTests();
EndFunction

Function СформироватьТестыЯксCLI() Export
	Return FormYAXTestsCLI();
EndFunction

Function СформироватьТестыАссертсCLI() Export
	Return FormAssertsTestsCLI();
EndFunction

Function ПолучитьПараметр(Параметр) Export
	Return GetParameter(Параметр);
EndFunction

Function ПолучитьДвоичные(Параметр) Export
	Return GetBinary(Параметр);
EndFunction

Function ПолучитьФайлПути(Val Путь) Export
	Return GetFilePath(Путь);
EndFunction

Procedure ПараметрВКоллекцию(Параметр, Коллекция) Export
	ParameterToCollection(Параметр, Коллекция);
EndProcedure

Procedure ДвоичныеВКоллекцию(Параметр, Коллекция) Export
	BinaryToCollection(Параметр, Коллекция);
EndProcedure

Procedure ЗаписатьПараметр(Параметр, Значение) Export
	WriteParameter(Параметр, Значение);
EndProcedure

Procedure ЗаписатьЛог(Val Результат, Val Метод, Val Библиотека = "") Export
	WriteLog(Результат, Метод, Библиотека);
EndProcedure

Procedure ЗаписатьФайлЛога(Val Данные, Val Метод, Val Библиотека, Val Принудительно = False) Export
	WriteLogFile(Данные, Метод, Библиотека, Принудительно);
EndProcedure

Procedure ЗаписатьЛогCLI(Val Результат, Val Метод, Val Библиотека = "") Export
	WriteLogCLI(Результат, Метод, Библиотека);
EndProcedure

Function ВыполнитьТестCLI(Val Библиотека, Val Метод, Val Опции, Val Записывать = True) Export
	Return ExecuteTestCLI(Библиотека, Метод, Опции, Записывать);
EndFunction

Procedure Проверка_Пусто(Val Результат) Export
	Check_Empty(Результат);
EndProcedure

Procedure Проверка_Строка(Val Результат, Val ОбъектСравнения = "") Export
	Check_String(Результат, ОбъектСравнения);
EndProcedure

Procedure Проверка_ДвоичныеДанные(Val Результат, Val Размер = Undefined) Export
	Check_BinaryData(Результат, Размер);
EndProcedure

Procedure Проверка_Массив(Val Результат, Val Количество = Undefined) Export
	Check_Array(Результат, Количество);
EndProcedure

Procedure Проверка_Соответствие(Val Результат, Val Заполненность = True) Export
	Check_Map(Результат, Заполненность);
EndProcedure

Procedure Проверка_Структура(Val Результат) Export
	Check_Structure(Результат);
EndProcedure

Procedure Проверка_Заполнено(Val Результат) Export
	Check_Filled(Результат);
EndProcedure

Procedure Проверка_Истина(Val Результат) Export
	Check_True(Результат);
EndProcedure

Procedure Проверка_ТелеграмИстина(Val Результат) Export
	Check_TelegramTrue(Результат);
EndProcedure

Procedure Проверка_ТелеграмИнформацияБота(Val Результат) Export
	Check_TelegramBotInformation(Результат);
EndProcedure

Procedure Проверка_ТелеграмМассив(Результат) Export
	Check_TelegramArray(Результат);
EndProcedure

Procedure Проверка_ТелеграмУстановкаВебхук(Val Результат) Export
	Check_TelegramWebhookSetup(Результат);
EndProcedure

Procedure Проверка_ТелеграмУдалениеВебхук(Val Результат) Export
	Check_TelegramWebhookDeletion(Результат);
EndProcedure

Procedure Проверка_ТелеграмСообщение(Val Результат, Val Текст) Export
	Check_TelegramMessage(Результат, Текст);
EndProcedure

Procedure Проверка_ТелеграмКартинка(Val Результат, Val Текст) Export
	Check_TelegramImage(Результат, Текст);
EndProcedure

Procedure Проверка_ТелеграмВидео(Val Результат, Val Текст) Export
	Check_TelegramVideo(Результат, Текст);
EndProcedure

Procedure Проверка_ТелеграмАудио(Val Результат, Val Текст) Export
	Check_TelegramAudio(Результат, Текст);
EndProcedure

Procedure Проверка_ТелеграмДокумент(Val Результат, Val Текст) Export
	Check_TelegramDocument(Результат, Текст);
EndProcedure

Procedure Проверка_ТелеграмГифка(Val Результат, Val Текст) Export
	Check_TelegramGif(Результат, Текст);
EndProcedure

Procedure Проверка_ТелеграмМедиагруппа(Val Результат) Export
	Check_TelegramMediaGroup(Результат);
EndProcedure

Procedure Проверка_ТелеграмМестоположение(Val Результат) Export
	Check_TelegramLocation(Результат);
EndProcedure

Procedure Проверка_ТелеграмКонтакт(Val Результат, Val Имя) Export
	Check_TelegramContact(Результат, Имя);
EndProcedure

Procedure Проверка_ТелеграмОпрос(Val Результат, Val Вопрос) Export
	Check_TelegramPoll(Результат, Вопрос);
EndProcedure

Procedure Проверка_ТелеграмПереслать(Val Результат, Val IDСообщения) Export
	Check_TelegramForward(Результат, IDСообщения);
EndProcedure

Procedure Проверка_ТелеграмБан(Val Результат) Export
	Check_TelegramBan(Результат);
EndProcedure

Procedure Проверка_ТелеграмПриглашение(Val Результат, Val Заголовок, Val UnixИстечение) Export
	Check_TelegramInvitation(Результат, Заголовок, UnixИстечение);
EndProcedure

Procedure Проверка_ТелеграмЧисло(Val Результат) Export
	Check_TelegramNumber(Результат);
EndProcedure

Procedure Проверка_ТелеграмОк(Val Результат) Export
	Check_TelegramOk(Результат);
EndProcedure

Procedure Проверка_ТелеграмСозданиеТемы(Val Результат, Val Имя, Иконка) Export
	Check_TelegramCreateTopic(Результат, Имя, Иконка);
EndProcedure

Procedure Проверка_ТелеграмКлавиатураСообщения(Val Результат, Val Клавиатура) Export
	Check_TelegramMessageKeyboard(Результат, Клавиатура);
EndProcedure

Procedure Проверка_ВКПост(Val Результат) Export
	Check_VKPost(Результат);
EndProcedure

Procedure Проверка_ВКИстина(Val Результат) Export
	Check_VKTrue(Результат);
EndProcedure

Procedure Проверка_ВКЭлементы(Val Результат) Export
	Check_VKElement(Результат);
EndProcedure

Procedure Проверка_ВКАльбом(Val Результат, Val Описание) Export
	Check_VKAlbum(Результат, Описание);
EndProcedure

Procedure Проверка_ВККартинкаАльбома(Val Результат, Val ОписаниеКартинки, Val ИДАльбома = "") Export
	Check_VKAlbumPicture(Результат, ОписаниеКартинки, ИДАльбома);
EndProcedure

Procedure Проверка_ВКИстория(Val Результат) Export
	Check_VKStory(Результат);
EndProcedure

Procedure Проверка_ВКОбсуждение(Val Результат) Export
	Check_VKDiscussion(Результат);
EndProcedure

Procedure Проверка_ВКЛайк(Val Результат) Export
	Check_VKLike(Результат);
EndProcedure

Procedure Проверка_ВКРепост(Val Результат) Export
	Check_VKRepost(Результат);
EndProcedure

Procedure Проверка_ВККомментарий(Val Результат) Export
	Check_VKComment(Результат);
EndProcedure

Procedure Проверка_ВКСтатистика(Val Результат) Export
	Check_VKStatistic(Результат);
EndProcedure

Procedure Проверка_ВКСтатистикаПостов(Val Результат) Export
	Check_VKPostsStatistic(Результат);
EndProcedure

Procedure Проверка_ВКЧисло(Val Результат) Export
	Check_VKNumber(Результат);
EndProcedure

Procedure Проверка_ВКПодборка(Val Результат) Export
	Check_VKCollection(Результат);
EndProcedure

Procedure Проверка_ВКТовар(Val Результат) Export
	Check_VKProduct(Результат);
EndProcedure

Procedure Проверка_ВКСвойство(Val Результат) Export
	Check_VKProp(Результат);
EndProcedure

Procedure Проверка_ВКВариантСвойства(Val Результат) Export
	Check_VKPropVariant(Результат);
EndProcedure

Procedure Проверка_ВКИНформацияОТоварах(Val Результат) Export
	Check_VKProductData(Результат);
EndProcedure

Procedure Проверка_ВКГруппаТоваров(Val Результат) Export
	Check_VKProductsGroup(Результат);
EndProcedure

Procedure Проверка_ВКВидео(Val Результат) Export
	Check_VKVideo(Результат);
EndProcedure

Procedure Проверка_ВККатегории(Val Результат) Export
	Check_VKCategories(Результат);
EndProcedure

Procedure Проверка_ЯДискДиск(Val Результат) Export
	Check_YaDiskDrive(Результат);
EndProcedure

Procedure Проверка_ЯДискКаталог(Val Результат, Val Путь) Export
	Check_YaDiskFolder(Результат, Путь);
EndProcedure

Procedure Проверка_ЯДискПуть(Val Результат, Val Путь = "", Val Публичный = Undefined) Export
	Check_YaDiskPath(Результат, Путь, Публичный);
EndProcedure

Procedure Проверка_ЯДискСсылка(Val Результат) Export
	Check_YaDiskLink(Результат);
EndProcedure

Procedure Проверка_ЯДискПроцедура(Val Результат) Export
	Check_YaDiskProc(Результат);
EndProcedure

Procedure Проверка_ЯДискСписокФайлов(Val Результат, Val Количество, Val Отступ) Export
	Check_YaDiskFilesList(Результат, Количество, Отступ);
EndProcedure

Procedure Проверка_ГКОбъект(Val Результат, Val Наименование, Val Описание) Export
	Check_GKObject(Результат, Наименование, Описание);
EndProcedure

Procedure Проверка_ТвиттерТекст(Val Результат, Val Текст) Export
	Check_TwitterText(Результат, Текст);
EndProcedure

Procedure Проверка_ТвиттерМассив(Val Результат) Export
	Check_TwitterArray(Результат);
EndProcedure

Procedure Проверка_ВайберОк(Val Результат) Export
	Check_ViberOk(Результат);
EndProcedure

Procedure Проверка_ВайберПользователь(Val Результат) Export
	Check_ViberUser(Результат);
EndProcedure

Procedure Проверка_ВайберОнлайн(Val Результат) Export
	Check_ViberOnline(Результат);
EndProcedure

Procedure Проверка_ВайберСообщение(Val Результат) Export
	Check_ViberMessage(Результат);
EndProcedure

Procedure Проверка_ГуглТокен(Val Результат) Export
	Check_GoogleToken(Результат);
EndProcedure

Procedure Проверка_ГуглКалендарь(Val Результат, Val Наименование) Export
	Check_GoogleCalendar(Результат, Наименование);
EndProcedure

Procedure Проверка_ГуглЦветКалендаря(Val Результат, Val ОсновнойЦвет, Val ДополнительныйЦвет) Export
	Check_GoogleCalendarColors(Результат, ОсновнойЦвет, ДополнительныйЦвет);
EndProcedure

Procedure Проверка_ГуглКаталоги(Val Результат) Export
	Check_GoogleCatalogs(Результат);
EndProcedure

Procedure Проверка_ГуглКаталог(Val Результат) Export
	Check_GoogleCatalog(Результат);
EndProcedure

Procedure Проверка_ГуглОбъект(Val Результат, Val Описание) Export
	Check_GoogleObject(Результат, Описание);
EndProcedure

Procedure Проверка_ГуглКомментарий(Val Результат, Val Комментарий) Export
	Check_GoogleComment(Результат, Комментарий);
EndProcedure

Procedure Проверка_ГуглКнига(Val Результат, Val Наименование, Val МассивЛистов = "") Export
	Check_GoogleSpreadsheet(Результат, Наименование, МассивЛистов);
EndProcedure

Procedure Проверка_ГуглЛист(Val Результат, Val Книга = "") Export
	Check_GoogleSheet(Результат, Книга);
EndProcedure

Procedure Проверка_ГуглЭлементКниги(Val Результат, Val Книга) Export
	Check_GoogleSpreadsheetElement(Результат, Книга);
EndProcedure

Procedure Проверка_ГуглИмяТаблицы(Val Результат, Val Наименование) Export
	Check_GoogleSheetTitle(Результат, Наименование);
EndProcedure

Procedure Проверка_ГуглОбновлениеЯчеек(Val Результат, Val Количество) Export
	Check_GoogleCellUpdating(Результат, Количество);
EndProcedure

Procedure Проверка_ГуглЗначенияЯчеек(Val Результат, Val Количество) Export
	Check_GoogleCellValues(Результат, Количество);
EndProcedure

Procedure Проверка_ГуглОчисткаЯчеек(Val Результат, Val Количество) Export
	Check_GoogleCellCleanning(Результат, Количество);
EndProcedure

Procedure Проверка_ТвиттерТокен(Val Результат) Export
	Check_TwitterToken(Результат);
EndProcedure

Procedure Проверка_НоушнОбъект(Val Результат, Val Вид = "page") Export
	Check_NotionObject(Результат, Вид);
EndProcedure

Procedure Проверка_НоушнСтраницаБазы(Val Результат, Val База) Export
	Check_NotionBasePage(Результат, База);
EndProcedure

Procedure Проверка_СлакОк(Val Результат) Export
	Check_SlackOk(Результат);
EndProcedure

Procedure Проверка_СлакБот(Val Результат) Export
	Check_SlackBot(Результат);
EndProcedure

Procedure Проверка_СлакПользователи(Val Результат) Export
	Check_SlackUsers(Результат);
EndProcedure

Procedure Проверка_СлакОбласти(Val Результат) Export
	Check_SlackWorkspaces(Результат);
EndProcedure

Procedure Проверка_СлакСообщение(Val Результат, Val Текст, Val Канал) Export
	Check_SlackMessage(Результат, Текст, Канал);
EndProcedure

Procedure Проверка_СлакСообщения(Val Результат) Export
	Check_SlackMessages(Результат);
EndProcedure

Procedure Проверка_СлакСсылкаСообщения(Val Результат, Val Канал) Export
	Check_SlackMessageLink(Результат, Канал);
EndProcedure

Procedure Проверка_СлакОтложенноеСообщение(Val Результат, Val Канал) Export
	Check_SlackSheduledMessage(Результат, Канал);
EndProcedure

Procedure Проверка_СлакЭфемерное(Val Результат) Export
	Check_SlackEphemeral(Результат);
EndProcedure

Procedure Проверка_СлакОтложенные(Val Результат) Export
	Check_SlackSheduled(Результат);
EndProcedure

Procedure Проверка_СлакКанал(Val Результат, Val Имя = "") Export
	Check_SlackChannel(Результат, Имя);
EndProcedure

Procedure Проверка_СлакТемаКанала(Val Результат, Val Тема) Export
	Check_SlackChannelTopic(Результат, Тема);
EndProcedure

Procedure Проверка_СлакИсторияКанала(Val Результат) Export
	Check_SlackChannelHistory(Результат);
EndProcedure

Procedure Проверка_СлакПользователиКанала(Val Результат) Export
	Check_SlackChannelUsers(Результат);
EndProcedure

Procedure Проверка_СлакСписокКаналов(Val Результат) Export
	Check_SlackChannelsList(Результат);
EndProcedure

Procedure Проверка_СлакДиалог(Val Результат) Export
	Check_SlackDialog(Результат);
EndProcedure

Procedure Проверка_СлакСписокФайлов(Val Результат) Export
	Check_SlackFilesList(Результат);
EndProcedure

Procedure Проверка_СлакФайл(Val Результат, Val ИмяФайла) Export
	Check_SlackFile(Результат, ИмяФайла);
EndProcedure

Procedure Проверка_СлакВнешнийФайл(Val Результат, Val Заголовок) Export
	Check_SlackExternalFile(Результат, Заголовок);
EndProcedure

Procedure Проверка_АТБазаСТаблицей(Val Результат, Val ИмяТаблицы) Export
	Check_ATBaseWithTable(Результат, ИмяТаблицы);
EndProcedure

Procedure Проверка_АТСписокТаблиц(Val Результат) Export
	Check_ATTablesList(Результат);
EndProcedure

Procedure Проверка_АТСписокБаз(Val Результат) Export
	Check_ATBasesList(Результат);
EndProcedure

Procedure Проверка_АТТаблица(Val Результат, Val Наименование, Val Описание) Export
	Check_ATTable(Результат, Наименование, Описание);
EndProcedure

Procedure Проверка_АТПоле(Val Результат, Val Имя) Export
	Check_ATField(Результат, Имя);
EndProcedure

Procedure Проверка_АТЗаписи(Val Результат) Export
	Check_ATRecords(Результат);
EndProcedure

Procedure Проверка_АТЗаписьНомерСтрока(Val Результат, Val Числовой, Val Строчный) Export
	Check_ATRecordNumberAndString(Результат, Числовой, Строчный);
EndProcedure

Procedure Проверка_АТЗапись(Val Результат, Val Запись) Export
	Check_ATRecord(Результат, Запись);
EndProcedure

Procedure Проверка_АТТекст(Val Результат, Val Текст) Export
	Check_ATText(Результат, Текст);
EndProcedure

Procedure Проверка_АТКомментарии(Val Результат) Export
	Check_ATComments(Результат);
EndProcedure

Procedure Проверка_АТУдалениеКомментария(Val Результат, Val Комментарий) Export
	Check_ATCommentDeleting(Результат, Комментарий);
EndProcedure

Procedure Проверка_ДропБоксФайл(Val Результат, Val Путь) Export
	Check_DropboxFile(Результат, Путь);
EndProcedure

Procedure Проверка_ДропБоксМетаданные(Val Результат, Val Путь) Export
	Check_DropboxMetadata(Результат, Путь);
EndProcedure

Procedure Проверка_ДропБоксМассив(Val Результат, Val Количество = Undefined) Export
	Check_DropboxArray(Результат, Количество);
EndProcedure

Procedure Проверка_ДропБоксРабота(Val Результат) Export
	Check_DropboxWork(Результат);
EndProcedure

Procedure Проверка_ДропБоксСтатус(Val Результат) Export
	Check_DropboxStatus(Результат);
EndProcedure

Procedure Проверка_ДропБоксТеги(Val Результат, Val Количество) Export
	Check_DropboxTags(Результат, Количество);
EndProcedure

Procedure Проверка_ДропбоксАккаунт(Val Результат) Export
	Check_DropboxAccount(Результат);
EndProcedure

Procedure Проверка_ДропбоксПространство(Val Результат) Export
	Check_DropboxSpace(Результат);
EndProcedure

Procedure Проверка_ДропбоксУчастник(Val Результат, Val Почта, Val ТолькоПросмотр) Export
	Check_DropboxMember(Результат, Почта, ТолькоПросмотр);
EndProcedure

Procedure Проверка_ДропбоксПубличнаяПапка(Val Результат) Export
	Check_DropboxPublicFolder(Результат);
EndProcedure

Procedure Проверка_БитриксВремя(Val Результат) Export
	Check_BitrixTime(Результат);
EndProcedure

Procedure Проверка_БитриксАвторизация(Val Результат) Export
	Check_BitrixAuth(Результат);
EndProcedure

Procedure Проверка_БитриксЧисло(Val Результат) Export
	Check_BitrixNumber(Результат);
EndProcedure

Procedure Проверка_БитриксИстина(Val Результат) Export
	Check_BitrixTrue(Результат);
EndProcedure

Procedure Проверка_БитриксБулево(Val Результат) Export
	Check_BitrixBool(Результат);
EndProcedure

Procedure Проверка_БитриксСтрока(Val Результат, Val Значение = "") Export
	Check_BitrixString(Результат, Значение);
EndProcedure

Procedure Проверка_БитриксМассив(Val Результат) Export
	Check_BitrixArray(Результат);
EndProcedure

Procedure Проверка_БитриксСоответствие(Val Результат) Export
	Check_BitrixMap(Результат);
EndProcedure

Procedure Проверка_БитриксСписок(Val Результат) Export
	Check_BitrixList(Результат);
EndProcedure

Procedure Проверка_БитриксМассивОбъектов(Val Результат) Export
	Check_BitrixObjectsArray(Результат);
EndProcedure

Procedure Проверка_БитриксПоля(Val Результат) Export
	Check_BitrixFields(Результат);
EndProcedure

Procedure Проверка_БитриксЗадача(Val Результат) Export
	Check_BitrixTask(Результат);
EndProcedure

Procedure Проверка_БитриксСписокЗадач(Val Результат) Export
	Check_BitrixTasksList(Результат);
EndProcedure

Procedure Проверка_БитриксХранилища(Val Результат) Export
	Check_BitrixStorage(Результат);
EndProcedure

Procedure Проверка_БитриксОбъект(Val Результат) Export
	Check_BitrixObject(Результат);
EndProcedure

Procedure Проверка_БитриксЛид(Val Результат) Export
	Check_BitrixLead(Результат);
EndProcedure

Procedure Проверка_БитриксСделка(Val Результат) Export
	Check_BitrixDeal(Результат);
EndProcedure

Procedure Проверка_БитриксВложение(Val Результат) Export
	Check_BitrixAttachment(Результат);
EndProcedure

Procedure Проверка_БитриксДоступныеДействия(Val Результат, Val Количество) Export
	Check_BitrixAvailableActions(Результат, Количество);
EndProcedure

Procedure Проверка_БитриксКомментарий(Val Результат) Export
	Check_BitrixComment(Результат);
EndProcedure

Procedure Проверка_БитриксРезультат(Val Результат) Export
	Check_BitrixResult(Результат);
EndProcedure

Procedure Проверка_БитриксНеопределено(Val Результат) Export
	Check_BitrixUndefined(Результат);
EndProcedure

Procedure Проверка_БитриксСписокКомментариев(Val Результат) Export
	Check_BitrixCommentsList(Результат);
EndProcedure

Procedure Проверка_БитриксСписокРезультатов(Val Результат) Export
	Check_BitrixResultsList(Результат);
EndProcedure

Procedure Проверка_БитриксСообщения(Val Результат) Export
	Check_BitrixMessages(Результат);
EndProcedure

Procedure Проверка_БитриксДиалог(Val Результат) Export
	Check_BitrixDialog(Результат);
EndProcedure

Procedure Проверка_БитриксСообщение(Val Результат) Export
	Check_BitrixMessage(Результат);
EndProcedure

Procedure Проверка_БитриксФайлСообщение(Val Результат) Export
	Check_BitrixFileMessage(Результат);
EndProcedure

Procedure Проверка_БитриксУчетВремени(Val Результат) Export
	Check_BitrixTimekeeping(Результат);
EndProcedure

Procedure Проверка_БитриксНастройкиУчетаВремени(Val Результат) Export
	Check_BitrixTimekeepingSettings(Результат);
EndProcedure

Procedure Проверка_ВКТПользователь(Val Результат) Export
	Check_VKTUser(Результат);
EndProcedure

Procedure Проверка_ВКТСобытия(Val Результат) Export
	Check_VKTEvents(Результат);
EndProcedure

Procedure Проверка_ВКТСообщение(Val Результат) Export
	Check_VKTMessage(Результат);
EndProcedure

Procedure Проверка_ВКТИстина(Val Результат) Export
	Check_VKTTrue(Результат);
EndProcedure

Procedure Проверка_ВКТФайл(Val Результат) Export
	Check_VKTFile(Результат);
EndProcedure

Procedure Проверка_ВКТСписок(Val Результат, Val ИмяПоля) Export
	Check_VKTList(Результат, ИмяПоля);
EndProcedure

Procedure Проверка_ВКТЧат(Val Результат) Export
	Check_VKTChat(Результат);
EndProcedure

Procedure Проверка_ВКТЗаявки(Val Результат) Export
	Check_VKTPending(Результат);
EndProcedure

Procedure Проверка_ОзонСписокКатегорий(Val Результат) Export
	Check_OzonCategoryList(Результат);
EndProcedure

Procedure Проверка_ОзонСписокХарактеристик(Val Результат) Export
	Check_OzonAttributesList(Результат);
EndProcedure

Procedure Проверка_ОзонСписокЗначенийХарактеристики(Val Результат) Export
	Check_OzonListOfAttributesValues(Результат);
EndProcedure

Procedure Проверка_ОзонЗаданиеЗагрузки(Val Результат, Val Вложенный = True) Export
	Check_OzonUploadTask(Результат, Вложенный);
EndProcedure

Procedure Проверка_ОзонНовыеТовары(Val Результат) Export
	Check_OzonNewProducts(Результат);
EndProcedure

Procedure Проверка_ОзонМассивОбъектов(Val Результат) Export
	Check_OzonObjectsArray(Результат);
EndProcedure

Procedure Проверка_ОзонОбъекты(Val Результат) Export
	Check_OzonObjects(Результат);
EndProcedure

Procedure Проверка_ОзонМассивОбновлено(Val Результат) Export
	Check_OzonUpdatedArray(Результат);
EndProcedure

Procedure Проверка_ОзонМассивРейтингов(Val Результат) Export
	Check_OzonRatingArray(Результат);
EndProcedure

Procedure Проверка_ОзонТовар(Val Результат) Export
	Check_OzonProduct(Результат);
EndProcedure

Procedure Проверка_ОзонТовары(Val Результат) Export
	Check_OzonProducts(Результат);
EndProcedure

Procedure Проверка_ОзонЛимиты(Val Результат) Export
	Check_OzonLimits(Результат);
EndProcedure

Procedure Проверка_ОзонКартинки(Val Результат) Export
	Check_OzonPictures(Результат);
EndProcedure

Procedure Проверка_ОзонБезОшибок(Val Результат) Export
	Check_OzonNoErrors(Результат);
EndProcedure

Procedure Проверка_ОзонИстина(Val Результат) Export
	Check_OzonTrue(Результат);
EndProcedure

Procedure Проверка_ОзонМассив(Val Результат, Val Поле = "result") Export
	Check_OzonArray(Результат, Поле);
EndProcedure

Procedure Проверка_ОзонУдалениеТовара(Val Результат) Export
	Check_OzonProductsDeleting(Результат);
EndProcedure

Procedure Проверка_ОзонДобавлениеКодов(Val Результат) Export
	Check_OzonNewCodes(Результат);
EndProcedure

Procedure Проверка_ОзонПодписчики(Val Результат) Export
	Check_OzonSubscribers(Результат);
EndProcedure

Procedure Проверка_ОзонSKU(Val Результат) Export
	Check_OzonSKU(Результат);
EndProcedure

Procedure Проверка_ОзонЧерновик(Val Результат) Export
	Check_OzonDraft(Результат);
EndProcedure

Procedure Проверка_ОзонПоиск(Val Результат) Export
	Check_OzonSearch(Результат);
EndProcedure

Procedure Проверка_ОзонКластеры(Val Результат) Export
	Check_OzonClusters(Результат);
EndProcedure

Procedure Проверка_ОзонГотовыйЧерновик(Val Результат) Export
	Check_OzonReadyDraft(Результат);
EndProcedure

Procedure Проверка_ОзонТаймслоты(Val Результат) Export
	Check_OzonTimeslots(Результат);
EndProcedure

Procedure Проверка_НСУспех(Val Результат) Export
	Check_NCSuccess(Результат);
EndProcedure

Procedure Проверка_НСФайлыКаталога(Val Результат, Val Количество) Export
	Check_NCFolderFiles(Результат, Количество);
EndProcedure

Procedure Проверка_НССинхронизация(Val Результат) Export
	Check_NCSync(Результат);
EndProcedure

Procedure Проверка_СдэкТокен(Val Результат) Export
	Check_CdekToken(Результат);
EndProcedure

Procedure Проверка_СдэкЗаказ(Val Результат) Export
	Check_CdekOrder(Результат);
EndProcedure

Procedure Проверка_СдэкКвитанция(Val Результат) Export
	Check_CdekReceipt(Результат);
EndProcedure

Procedure Проверка_СдэкДанныеЗаказа(Val Результат) Export
	Check_CdekOrderNumber(Результат);
EndProcedure

Procedure Проверка_СдэкИнтервалыДоставки(Val Результат) Export
	Check_CdekkDeliveryIntervals(Результат);
EndProcedure

Procedure Проверка_СдэкПаспорт(Val Результат) Export
	Check_CdekPassport(Результат);
EndProcedure

Procedure Проверка_СдэкЧек(Val Результат) Export
	Check_CdekCheck(Результат);
EndProcedure

Procedure Проверка_ЯМаркетМагазины(Val Результат) Export
	Check_YaMarketMarkets(Результат);
EndProcedure

Procedure Проверка_ЯМаркетМагазин(Val Результат) Export
	Check_YaMarketCampaign(Результат);
EndProcedure

Procedure Проверка_ЯМаркетКабинет(Val Результат) Export
	Check_YaMarketBusiness(Результат);
EndProcedure

Procedure Проверка_ЯМаркетОк(Val Результат) Export
	Check_YaMarketOk(Результат);
EndProcedure

Procedure Проверка_МетрикаМетки(Val Результат) Export
	Check_MetrikaTags(Результат);
EndProcedure

Procedure Проверка_МетрикаМетка(Val Результат, Val Наименование = "") Export
	Check_MetrikaTag(Результат, Наименование);
EndProcedure

Procedure Проверка_МетрикаУспех(Val Результат) Export
	Check_MetrikaSuccess(Результат);
EndProcedure

Procedure Проверка_МетрикаСчетчик(Val Результат) Export
	Check_MetrikaCounter(Результат);
EndProcedure

Procedure Проверка_МетрикаСчетчики(Val Результат) Export
	Check_MetrikaCounters(Результат);
EndProcedure

Procedure Проверка_МетрикаОперации(Val Результат) Export
	Check_MetrikaActions(Результат);
EndProcedure

Procedure Проверка_S3Успех(Val Результат) Export
	Check_S3Success(Результат);
EndProcedure

Procedure Проверка_S3НеНайдено(Val Результат) Export
	Check_S3NotFound(Результат);
EndProcedure

Procedure Проверка_S3НеПоддерживается(Val Результат) Export
	Check_S3NotImplemented(Результат);
EndProcedure

Procedure Проверка_Компонента(Val Результат, Val ИмяТипа) Export
	Check_AddIn(Результат, ИмяТипа);
EndProcedure

Procedure Проверка_Равенство(Val Значение1, Val Значение2) Export
	Check_Equality(Значение1, Значение2);
EndProcedure

Procedure Проверка_Неравенство(Val Значение1, Val Значение2) Export
	Check_Inequality(Значение1, Значение2);
EndProcedure

Procedure Проверка_SQLiteУспех(Val Результат) Export
	Check_SQLiteSuccess(Результат);
EndProcedure

Procedure Проверка_SQLiteОшибка(Val Результат) Export
	Check_SQLiteError(Результат);
EndProcedure

Procedure Проверка_SQLiteСтроки(Val Результат, Val Количество) Export
	Check_SQLiteRows(Результат, Количество);
EndProcedure

Procedure Проверка_SQLiteЗначенияПолей(Val Результат, Val СтруктураЗначений) Export
	Check_SQLiteFieldsValues(Результат, СтруктураЗначений);
EndProcedure

Procedure Проверка_SQLiteНетЗаписей(Val Результат) Export
	Check_SQLiteNoRows(Результат);
EndProcedure

Procedure Проверка_РезультатИстина(Val Результат) Export
	Check_ResultTrue(Результат);
EndProcedure

Procedure Проверка_РезультатЛожь(Val Результат) Export
	Check_ResultFalse(Результат);
EndProcedure

Procedure Проверка_ГринИнстанс(Val Результат) Export
	Check_GreenInstance(Результат);
EndProcedure

Procedure Проверка_ГринСохранениеНастроек(Val Результат) Export
	Check_GreenSettingsSaving(Результат);
EndProcedure

Procedure Проверка_ГринАвторизован(Val Результат) Export
	Check_GreenAuth(Результат);
EndProcedure

Procedure Проверка_ГринПерезапуск(Val Результат) Export
	Check_GreenReboot(Результат);
EndProcedure

Procedure Проверка_ГринРазлогин(Val Результат) Export
	Check_GreenUnlogin(Результат);
EndProcedure

Procedure Проверка_ГринАватар(Val Результат) Export
	Check_GreenAva(Результат);
EndProcedure

Procedure Проверка_ГринКартинкаГруппы(Val Результат) Export
	Check_GreenGroupPicture(Результат);
EndProcedure

Procedure Проверка_ГринКод(Val Результат) Export
	Check_GreenCode(Результат);
EndProcedure

Procedure Проверка_ГринПрофиль(Val Результат) Export
	Check_GreenProfile(Результат);
EndProcedure

Procedure Проверка_ГринНоваяГруппа(Val Результат) Export
	Check_GreenNewGroup(Результат);
EndProcedure

Procedure Проверка_ГринВыходГруппы(Val Результат) Export
	Check_GreenLeaveGroup(Результат);
EndProcedure

Procedure Проверка_ГринГруппа(Val Результат) Export
	Check_GreenGroup(Результат);
EndProcedure

Procedure Проверка_ГринИмяГруппы(Val Результат) Export
	Check_GreenGroupName(Результат);
EndProcedure

Procedure Проверка_ГринДобавлениеПользователя(Val Результат) Export
	Check_GreenAddMember(Результат);
EndProcedure

Procedure Проверка_ГринИсключениеПользователя(Val Результат) Export
	Check_GreenExcludeMember(Результат);
EndProcedure

Procedure Проверка_ГринНазначениеАдминистратора(Val Результат) Export
	Check_GreenAdminSet(Результат);
EndProcedure

Procedure Проверка_ГринОтзывАдминистратора(Val Результат) Export
	Check_GreenAdminRemove(Результат);
EndProcedure

Procedure Проверка_ГринСообщение(Val Результат) Export
	Check_GreenMessage(Результат);
EndProcedure

Procedure Проверка_ГринСообщения(Val Результат) Export
	Check_GreenMessages(Результат);
EndProcedure

Procedure Проверка_ГринФайл(Val Результат) Export
	Check_GreenFile(Результат);
EndProcedure

Procedure Проверка_ГринУведомление(Val Результат) Export
	Check_GreenNotification(Результат);
EndProcedure

Procedure Проверка_ГринВходнойФайл(Val Результат) Export
	Check_GreenInputFile(Результат);
EndProcedure

Procedure Проверка_ГринПрочтение(Val Результат) Export
	Check_GreenReading(Результат);
EndProcedure

Procedure Проверка_ГринОчисткаОчереди(Val Результат) Export
	Check_GreenQueueClearing(Результат);
EndProcedure

Procedure Проверка_OllamaОтвет(Val Результат, Val Завершен = True) Export
	Check_OllamaResponse(Результат, Завершен);
EndProcedure

Procedure Проверка_OllamaПривязки(Val Результат) Export
	Check_OllamaEmbeddings(Результат);
EndProcedure

Procedure Проверка_OllamaЗагрузкаВыгрузка(Val Результат, Val Выгрузка) Export
	Check_OllamaLoadUnload(Результат, Выгрузка);
EndProcedure

Procedure Проверка_OllamaСообщение(Val Результат, Val Завершен = True) Export
	Check_OllamaMessage(Результат, Завершен);
EndProcedure

Procedure Проверка_OllamaУспех(Val Результат) Export
	Check_OllamaSuccess(Результат);
EndProcedure

Procedure Проверка_OllamaМодели(Val Результат) Export
	Check_OllamaModels(Результат);
EndProcedure

Procedure Проверка_OllamaИнформацияМодели(Val Результат) Export
	Check_OllamaModelInfo(Результат);
EndProcedure

Procedure Проверка_OllamaВерсия(Val Результат) Export
	Check_OllamaVersion(Результат);
EndProcedure

Procedure Проверка_OllamaКод(Val Результат) Export
	Check_OllamaCode(Результат);
EndProcedure

Procedure Проверка_OllamaОшибка(Val Результат) Export
	Check_OllamaError(Результат);
EndProcedure

Procedure Проверка_OpenAIОтвет(Val Результат) Export
	Check_OpenAIResponse(Результат);
EndProcedure

Procedure Проверка_OpenAIПредставления(Val Результат) Export
	Check_OpenAIEmbeddings(Результат);
EndProcedure

Procedure Проверка_OpenAIАссистент(Val Результат, Val Имя = "") Export
	Check_OpenAIAssistant(Результат, Имя);
EndProcedure

Procedure Проверка_OpenAIУдалениеАссистента(Val Результат, Val IDАссистента) Export
	Check_OpenAIAssistantDeletion(Результат, IDАссистента);
EndProcedure

Procedure Проверка_OpenAIСписок(Val Результат) Export
	Check_OpenAIList(Результат);
EndProcedure

Procedure Проверка_OpenAIФайл(Val Результат, Val ИмяФайла = Undefined, Val Размер = Undefined, Val Назначение = Undefined) Export
	Check_OpenAIFile(Результат, ИмяФайла, Размер, Назначение);
EndProcedure

Procedure Проверка_OpenAIУдалениеФайла(Val Результат, Val IDФайла) Export
	Check_OpenAIFileDeletion(Результат, IDФайла);
EndProcedure

Procedure Проверка_OpenAIКартинка(Val Результат) Export
	Check_OpenAIImage(Результат);
EndProcedure

#EndRegion