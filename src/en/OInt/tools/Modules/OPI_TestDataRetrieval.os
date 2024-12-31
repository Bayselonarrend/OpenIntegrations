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
// BSLLS:MagicNumber-off

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
    Sections.Insert("SQLite"         , 5);
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
    Sections.Insert("SQLite"         , StandardDependencies);
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

Function FormYAXTestsCLI() Export

    Module    = GetCommonModule("ЮТТесты");
    Sections  = GetTestingSectionMapping();
    TestTable = GetTestTable();

    For Each Section In Sections Do

        CurrentSection = Section.Key;
        Filter         = New Structure("Section", CurrentSection);
        SectionTests   = TestTable.FindRows(Filter);

        Set = Module.ДобавитьТестовыйНабор("CLI_" + CurrentSection);

        For Each Test In SectionTests Do
            Set.ДобавитьСерверныйТест("CLI_" + Test.Method, Test.Synonym);
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

Function FormAssertsTestsCLI() Export

    TestTable    = GetTestTable();
    ArrayOfTests = New Array;

    For Each Test In TestTable Do
        ArrayOfTests.Add("CLI_" + Test.Method);
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

    WriteLog(Result, Method + " (CLI)");

EndProcedure

Function ExecuteTestCLI(Val Library, Val Method, Val Options) Export

    If OPI_Tools.IsWindows() Then

        Oint = """C:/Program Files/OneScript/bin/oint.bat""";

    Else

        Oint = "sudo oint";

    EndIf;

    ResultFile   = GetTempFileName();
    LaunchString = Oint + " " + Library + " " + Method;

    For Each Option In Options Do

        CurrentValue = GetCLIFormedValue(Option.Value);

        LaunchString = LaunchString
            + " --"
            + Option.Key
            + " "
            + CurrentValue;

    EndDo;

    RunApp(LaunchString + " --out """ + ResultFile + """", , True);

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

    WriteCLICall(Library, Method, Options);

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

    ReplyText = Result["data"]["text"];
    ReplyText = Left(ReplyText, StrLen(Text));

    ExpectsThat(Result).ИмеетТип("Map").Заполнено();
    ExpectsThat(ReplyText).Равно(Text);

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

Procedure Check_BitrixString(Val Result) Export
   ExpectsThat(Result["result"]).ИмеетТип("String").Заполнено();
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
    ExpectsThat(Result["result"][0]["description"]).Заполнено();
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

    ExpectsThat(Result["result"]["items"]).ИмеетТип("Array");
    ExpectsThat(Result["result"]["items"][0]["name"]).Заполнено();
    ExpectsThat(Result["result"]["items"][0]["id"]).Заполнено();

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

Procedure Check_SQLiteSuccess(Val Result) Export
    ExpectsThat(Result["result"]).Равно(True);
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

    If CurrentType = Type("Number") Then

        Value = OPI_Tools.NumberToString(Value);

    ElsIf CurrentType = Type("String") Then

        Value = OPI_Tools.NumberToString(Value);

        If Not Embedded Then
            Value = """" + Value + """";
        EndIf;

    ElsIf CurrentType = Type("Date") Then

        Value = """" + XMLString(Value) + """";

    ElsIf CurrentType  = Type("Structure")
        Or CurrentType = Type("Map")
        Or CurrentType = Type("Array") Then

        JSONWriter = New JSONWriter();

        If OPI_Tools.IsOneScript() Or CurrentType = Type("Array") Then

            WriterSettings = New JSONWriterSettings(JSONLineBreak.None, , False);
            JSONWriter.SetString(WriterSettings);
            WriteJSON(JSONWriter, Value);
            Value          = """" + JSONWriter.Close() + """";

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

        EndIf;

    ElsIf CurrentType = Type("Boolean") Then

        Value = ?(Value, "true", "false");

    ElsIf CurrentType = Type("BinaryData") Then

        // BSLLS:MissingTemporaryFileDeletion-off

        //@skip-check missing-temporary-file-deletion
        TFN = GetTempFileName();
        Value.Write(TFN);
        Value = """" + TFN + """";

        // BSLLS:MissingTemporaryFileDeletion-on

    Else

        Raise "Invalid type " + String(CurrentType);

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

    CatalogExample = "./docs/en/cli/NEW_CLI/" + Library;
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

        CurrentOption = FormOption(Option.Value, Option.Key);
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

#EndRegion
