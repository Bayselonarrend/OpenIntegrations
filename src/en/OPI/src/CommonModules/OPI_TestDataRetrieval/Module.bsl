// OneScript: ./OInt/tools/Modules/OPI_TestDataRetrieval.os

// MIT License

// Copyright (c) 2023 Anton Tsitavets

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

//@skip-check use-non-recommended-method
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content

// Uncomment if OneScript is executed
// #Use "./internal"
// #Use asserts

#Region Internal

Function GetTestingSectionMapping() Export

    StandardDependencies = "[Decode, Build]";
    GoogleDependencies   = "Testing-GoogleWorkspace";

    Sections = New Structure;
    Sections.Insert("Telegram"       , StandardDependencies);
    Sections.Insert("VK"             , StandardDependencies);
    Sections.Insert("Viber"          , StandardDependencies);
    Sections.Insert("Twitter"        , StandardDependencies);
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

    TestTable = New ValueTable;
    TestTable.Columns.Add("Method");
    TestTable.Columns.Add("Synonym");
    TestTable.Columns.Add("Section");

    NewTest(TestTable, "TelegramAPI_GetBotInfo"             , "Get bot information"       , Telegram);
    NewTest(TestTable, "TelegramAPI_GetUpdates"             , "Get updates"               , Telegram);
    NewTest(TestTable, "TelegramAPI_SetWebhook"             , "Set Webhook"               , Telegram);
    NewTest(TestTable, "TelegramAPI_SendTextMessage"        , "Send text message"         , Telegram);
    NewTest(TestTable, "TelegramAPI_SendImage"              , "Send image"                , Telegram);
    NewTest(TestTable, "TelegramAPI_SendVideo"              , "Send video"                , Telegram);
    NewTest(TestTable, "TelegramAPI_SendAudio"              , "Send audio"                , Telegram);
    NewTest(TestTable, "TelegramAPI_SendDocument"           , "Send document"             , Telegram);
    NewTest(TestTable, "TelegramAPI_SendGIF"                , "Send GIF"                  , Telegram);
    NewTest(TestTable, "TelegramAPI_SendMediaGroup"         , "Send mediagroup"           , Telegram);
    NewTest(TestTable, "TelegramAPI_SendLocation"           , "Send location"             , Telegram);
    NewTest(TestTable, "TelegramAPI_SendContact"            , "Send contact"              , Telegram);
    NewTest(TestTable, "TelegramAPI_SendPoll"               , "Send poll"                 , Telegram);
    NewTest(TestTable, "TelegramAPI_ForwardMessage"         , "Forward message"           , Telegram);
    NewTest(TestTable, "TelegramAPI_BanUnban"               , "Ban/Unban"                 , Telegram);
    NewTest(TestTable, "TelegramAPI_CreateInvitationLink"   , "Create invitation link"    , Telegram);
    NewTest(TestTable, "TelegramAPI_PinUnpinMessage"        , "Pin/Unpin message"         , Telegram);
    NewTest(TestTable, "TelegramAPI_GetMemberCount"         , "Get participant count"     , Telegram);
    NewTest(TestTable, "TelegramAPI_GetForumAvatarsList"    , "Get forum avatars list"    , Telegram);
    NewTest(TestTable, "TelegramAPI_CreateDeleteForumTopic" , "Create/Delete forum topic" , Telegram);
    NewTest(TestTable, "TelegramAPI_ChangeMainTopicName"    , "Change main topic name"    , Telegram);
    NewTest(TestTable, "TelegramAPI_HideShowMainTopic"      , "Hide/Show main topic"      , Telegram);

    NewTest(TestTable, "VKAPI_CreateTokenLink"             , "Create token retrieval link"    , VKontakte);
    NewTest(TestTable, "VKAPI_CreateDeletePost"            , "Create/Delete post"             , VKontakte);
    NewTest(TestTable, "VKAPI_CreateCompositePost"         , "Create/Delete composite post"   , VKontakte);
    NewTest(TestTable, "VKAPI_CreatePoll"                  , "Create poll"                    , VKontakte);
    NewTest(TestTable, "VKAPI_SaveDeleteImage"             , "Add/Delete image"               , VKontakte);
    NewTest(TestTable, "VKAPI_CreateStory"                 , "Create story"                   , VKontakte);
    NewTest(TestTable, "VKAPI_DiscussionMethods"           , "Actions with discussions"       , VKontakte);
    NewTest(TestTable, "VKAPI_LikeRepostComment"           , "Like/Repost/Comment"            , VKontakte);
    NewTest(TestTable, "VKAPI_GetStatistics"               , "Get statistics"                 , VKontakte);
    NewTest(TestTable, "VKAPI_GetPostStatistics"           , "Get post statistics"            , VKontakte);
    NewTest(TestTable, "VKAPI_CreateAdCampaign"            , "Create advertising campaign"    , VKontakte);
    NewTest(TestTable, "VKAPI_SendMessage"                 , "Send message"                   , VKontakte);
    NewTest(TestTable, "VKAPI_GetProductCategories"        , "Get product categories"         , VKontakte);
    NewTest(TestTable, "VKAPI_CreateProductSelection"      , "Create product and selection"   , VKontakte);
    NewTest(TestTable, "VKAPI_CreateProductWithProperties" , "Create product with properties" , VKontakte);
    NewTest(TestTable, "VKAPI_GetProductList"              , "Get product list"               , VKontakte);
    NewTest(TestTable, "VKAPI_GetSelectionList"            , "Get selection list"             , VKontakte);
    NewTest(TestTable, "VKAPI_GetPropertyList"             , "Get property list"              , VKontakte);
    NewTest(TestTable, "VKAPI_GetOrderList"                , "Get order list"                 , VKontakte);
    NewTest(TestTable, "VKAPI_UploadVideo"                 , "Upload video"                   , VKontakte);

    NewTest(TestTable, "YDisk_GetDiskInfo"            , "Get disk information"       , YDisk);
    NewTest(TestTable, "YDisk_CreateFolder"           , "Create folder"              , YDisk);
    NewTest(TestTable, "YDisk_UploadByUrlAndGetObject", "Upload by URL and get"      , YDisk);
    NewTest(TestTable, "YDisk_UploadDeleteFile"       , "Upload/Delete file"         , YDisk);
    NewTest(TestTable, "YDisk_CreateObjectCopy"       , "Create object copy"         , YDisk);
    NewTest(TestTable, "YDisk_GetDownloadLink"        , "Get download link"          , YDisk);
    NewTest(TestTable, "YDisk_GetFileList"            , "Get list of files"          , YDisk);
    NewTest(TestTable, "YDisk_MoveObject"             , "Move object"                , YDisk);
    NewTest(TestTable, "YDisk_PublicObjectActions"    , "Actions with public objects", YDisk);
    NewTest(TestTable, "YDisk_GetPublishedList"       , "Get published list"         , YDisk);

    NewTest(TestTable, "GV_GetAuthorizationLink" , "Get authorization link" , VSpace);
    NewTest(TestTable, "GV_GetToken"             , "Get token"              , VSpace);
    NewTest(TestTable, "GV_UpdateToken"          , "Refresh token"          , VSpace);

    NewTest(TestTable, "GC_GetCalendarList"      , "Get list of calendars"  , Calendar);
    NewTest(TestTable, "GC_CreateDeleteCalendar" , "Create/Delete calendar" , Calendar);
    NewTest(TestTable, "GC_CreateDeleteEvent"    , "Create/Delete event"    , Calendar);
    NewTest(TestTable, "GC_GetEventList"         , "Get list of events"     , Calendar);

    NewTest(TestTable, "GD_GetCatalogList"      , "Get list of directories" , Drive);
    NewTest(TestTable, "GD_UploadDeleteFile"    , "Upload/Delete file"      , Drive);
    NewTest(TestTable, "GD_CreateDeleteComment" , "Create/Delete Comment"   , Drive);
    NewTest(TestTable, "GD_CreateCatalog"       , "Create/Delete catalog"   , Drive);

    NewTest(TestTable, "GT_CreateTable"    , "Create table"     , Tables);
    NewTest(TestTable, "GT_GetTable"       , "Get table"        , Tables);
    NewTest(TestTable, "GT_FillClearCells" , "Fill/Clear cells" , Tables);

    NewTest(TestTable, "Twitter_GetAuthorizationLink" , "Get authorization link" , Twitter);
    NewTest(TestTable, "Twitter_UpdateToken"          , "Refresh token"          , Twitter);
    NewTest(TestTable, "Twitter_CreateTextTweet"      , "Text tweet"             , Twitter);
    NewTest(TestTable, "Twitter_CreateTweetWithImage" , "Tweet with image"       , Twitter);
    NewTest(TestTable, "Twitter_CreateTweetWithVideo" , "Tweet with video"       , Twitter);
    NewTest(TestTable, "Twitter_CreateTweetWithGif"   , "Tweet with gif"         , Twitter);
    NewTest(TestTable, "Twitter_CreateTweetWithPoll"  , "Tweet with poll"        , Twitter);

    NewTest(TestTable, "Viber_GetChannelInfo"  , "Get channel info"  , Viber);
    NewTest(TestTable, "Viber_GetUserData"     , "Get user data"     , Viber);
    NewTest(TestTable, "Viber_GetOnlineUsers"  , "Get online users"  , Viber);
    NewTest(TestTable, "Viber_SendTextMessage" , "Send text message" , Viber);
    NewTest(TestTable, "Viber_SendImage"       , "Send image"        , Viber);
    NewTest(TestTable, "Viber_SendFile"        , "SendFile"          , Viber);
    NewTest(TestTable, "Viber_SendContact"     , "Send contact"      , Viber);
    NewTest(TestTable, "Viber_SendLocation"    , "Send location"     , Viber);
    NewTest(TestTable, "Viber_SendLink"        , "Send link"         , Viber);

    NewTest(TestTable, "Notion_CreatePage"           , "Create page"             , Notion);
    NewTest(TestTable, "Notion_CreateEditDatabase"   , "Create/Edit database"    , Notion);
    NewTest(TestTable, "Notion_GetPageInfo"          , "Get page info"           , Notion);
    NewTest(TestTable, "Notion_GetDatabaseInfo"      , "Get database info"       , Notion);
    NewTest(TestTable, "Notion_CreatePageInDatabase" , "Create page in database" , Notion);
    NewTest(TestTable, "Notion_EditPageProperties"   , "Edit page properties"    , Notion);
    NewTest(TestTable, "Notion_CreateDeleteBlock"    , "Create/Delete block"     , Notion);
    NewTest(TestTable, "Notion_GetUsers"             , "Get users"               , Notion);
    NewTest(TestTable, "Notion_GetUserData"          , "Get user data"           , Notion);

    NewTest(TestTable, "Slack_GetBotInfo"               , "Get bot information"         , Slack);
    NewTest(TestTable, "Slack_GetUserList"              , "Get user list"               , Slack);
    NewTest(TestTable, "Slack_GetRegionList"            , "Get region list"             , Slack);
    NewTest(TestTable, "Slack_SendDeleteMessage"        , "Send/Delete message"         , Slack);
    NewTest(TestTable, "Slack_SendDeleteEphemeral"      , "Send/Delete ephemeral"       , Slack);
    NewTest(TestTable, "Slack_GetScheduledMessages"     , "Get scheduled messages"      , Slack);
    NewTest(TestTable, "Slack_CreateArchiveChannel"     , "Create/Archive channel"      , Slack);
    NewTest(TestTable, "Slack_GetChannelList"           , "Get channel list"            , Slack);
    NewTest(TestTable, "Slack_OpenCloseDialog"          , "Open/Close dialog"           , Slack);
    NewTest(TestTable, "Slack_GetFileList"              , "Get list of files"           , Slack);
    NewTest(TestTable, "Slack_UploadDeleteFile"         , "Upload/Delete file"          , Slack);
    NewTest(TestTable, "Slack_GetExternalFileList"      , "Get external file list"      , Slack);
    NewTest(TestTable, "Slack_UploadDeleteExternalFile" , "Upload/Delete external file" , Slack);

    NewTest(TestTable, "AT_CreateDatabase"      , "Create/Edit database"  , AirT);
    NewTest(TestTable, "AT_CreateTable"         , "Create/Edit table"     , AirT);
    NewTest(TestTable, "AT_CreateField"         , "Create/Edit field"     , AirT);
    NewTest(TestTable, "AT_CreateDeleteRecords" , "Create/Delete records" , AirT);

    NewTest(TestTable, "DropboxAPI_GetUpdateToken"    , "Get/Update token"         , Dropbox);
    NewTest(TestTable, "DropboxAPI_UploadFile"        , "Upload file"              , Dropbox);
    NewTest(TestTable, "DropboxAPI_UploadFileByURL"   , "Upload file by URL"       , Dropbox);
    NewTest(TestTable, "DropboxAPI_CreateFolder"      , "Create folder"            , Dropbox);
    NewTest(TestTable, "DropboxAPI_CreateDeleteTag"   , "Create/Delete tag"        , Dropbox);
    NewTest(TestTable, "DropboxAPI_GetAccount"        , "Get account data"         , Dropbox);
    NewTest(TestTable, "DropboxAPI_AccessManagement"  , "Access management"        , Dropbox);
    NewTest(TestTable, "DropboxAPI_GetFolderFileList" , "Get list of folder files" , Dropbox);

    NewTest(TestTable, "B24_TokenManagment"         , "Token management"                , Bitrix);
    NewTest(TestTable, "B24_ServerTime"             , "Server time"                     , Bitrix);
    NewTest(TestTable, "B24_PostsManagment"         , "Posts managment"                 , Bitrix);
    NewTest(TestTable, "B24_TaskManagment"          , "Tasks managment"                 , Bitrix);
    NewTest(TestTable, "B24_CommentsManagment"      , "Comments managment"              , Bitrix);
    NewTest(TestTable, "B24_WorkingWithDrive"       , "Working with drive"              , Bitrix);
    NewTest(TestTable, "B24_Kanban"                 , "Kanban"                          , Bitrix);
    NewTest(TestTable, "B24_Timekeeping"            , "Timekeeping"                     , Bitrix);
    NewTest(TestTable, "B24_ChatManagment"          , "Chats works"                     , Bitrix);
    NewTest(TestTable, "B24_NotificationsManagment" , "Notifications managment"         , Bitrix);
    NewTest(TestTable, "B24_TasksFieldsManagment"   , "Working with custom task fields" , Bitrix);
    NewTest(TestTable, "B24_DepartmentsManagment"   , "Departments managment"           , Bitrix);
    NewTest(TestTable, "B2_UsersManagment"          , "Users managment"                 , Bitrix);

    NewTest(TestTable, "VKT_MessagesSending" , "Messages sending" , VKT);
    NewTest(TestTable, "VKT_CommonMethods"   , "Common methods"   , VKT);

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

Function GetParameter(Parameter) Export

    Path = DataFilePath();
    Return GetValueFromFile(Parameter, Path);

EndFunction

Function GetBinary(Parameter) Export

    Path           = DataFilePath();
    LocalParameter = Parameter + "Local";
    MainValue      = GetValueFromFile(Parameter , Path);
    LocalValue     = GetValueFromFile(LocalParameter, Path);

    LocalFile = New File(LocalValue);

    If LocalFile.Exists() Then
        Value = New BinaryData(LocalValue);
    Else
        Value = MainValue;
    EndIf;

    If TypeOf(Value) = Type("String") Then
        Value        = GetFilePath(Value, LocalParameter);
    EndIf;

    Return Value;

EndFunction

Function GetFilePath(Val Path, LocalParameter, Val SaveLocally = True) Export

    If StrFind(Path, "http") > 0
        Or StrFind(Path, "www") > 0 Then

        TFN    = GetTempFileName();
        FileCopy(Path, TFN);
        Path   = TFN;
        Binary = New BinaryData(Path);

        If SaveLocally Then
            WriteParameter(LocalParameter, TFN);
        Else
            DeleteFiles(TFN);
        EndIf;

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
        WriteLogFile(Data, Method, Library);
    EndIf;

EndProcedure

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
    PossiblePaths.Add("D:\GD\Мой Диск\data.json");

    For Each PossiblePath In PossiblePaths Do

        RepositoryFile = New File(PossiblePath);

        If RepositoryFile.Exists() Then
            Path = PossiblePath;
        EndIf;

    EndDo;

    Return Path;

EndFunction

Function GetCommonModule(Val Name)
    SetSafeMode(True);
    Module = Eval(Name);
    SetSafeMode(False);
    Return Module;
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

Procedure WriteLogFile(Val Data, Val Method, Val Library)

    Try

        LogPath        = "./docs/ru/results";
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
        LogFile  = New File(FilePath);

        If Not LogFile.Exists() Then
            LogDocument = New TextDocument;
            LogDocument.SetText(Data);
            LogDocument.Write(FilePath);
        EndIf;

    Except
        Message("Failed to write log file!: " + ErrorDescription());
    EndTry;

EndProcedure

#EndRegion
