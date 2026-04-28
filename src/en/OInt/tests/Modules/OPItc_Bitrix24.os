// OneScript: ./OInt/tests/Modules/OPItc_Bitrix24.os

// MIT License

// Copyright (c) 2023-2026 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and +this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// https://github.com/Bayselonarrend/OpenIntegrations

// Test suite for YAxUnit

// BSLLS:Typo-off
// BSLLS:LatinAndCyrillicSymbolInWord-off
// BSLLS:IncorrectLineBreak-off
// BSLLS:UsingServiceTag-off
// BSLLS:UnusedParameters-off
// BSLLS:DuplicateStringLiteral-off
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off
// BSLLS:MissingParameterDescription-off
// BSLLS:NumberOfOptionalParams-off
// BSLLS:MethodSize-off
// BSLLS:NestedConstructorsInStructureDeclaration-off
// BSLLS:NumberOfValuesInStructureConstructor-off
// BSLLS:UsingHardcodeSecretInformation-off
// BSLLS:SpaceAtStartComment-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable
//@skip-check bsl-legacy-check-string-literal
//@skip-check bsl-legacy-check-method-for-statements-after-return
//@skip-check missing-temporary-file-deletion
//@skip-check module-unused-method

#Use "../../tools/main"
#Use "../../tools/http"
#Use "../../api"
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("Bitrix24");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Bitrix24");

EndFunction

#Region Internal

#Region RunnableTests

#Region Bitrix24

Procedure B24_TokenManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientSecret", TestParameters);

    Bitrix24_GetAppAuthLink(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Code", TestParameters);

    Bitrix24_GetToken(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Refresh", TestParameters);

    Bitrix24_RefreshToken(TestParameters);

EndProcedure

Procedure B24_ServerTime() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_ServerTime(TestParameters);

EndProcedure

Procedure B24_PostsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);

    Bitrix24_CreatePost(TestParameters);
    Bitrix24_UpdatePost(TestParameters);
    Bitrix24_GetImportantPostViewers(TestParameters);
    Bitrix24_GetPosts(TestParameters);
    Bitrix24_AddPostComment(TestParameters);
    Bitrix24_AddPostRecipients(TestParameters);
    Bitrix24_DeletePost(TestParameters);

EndProcedure

Procedure B24_TaskManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_UserID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);

    Bitrix24_GetTaskFieldsStructure(TestParameters);
    Bitrix24_CreateTask(TestParameters);
    Bitrix24_CreateTasksDependencies(TestParameters);
    Bitrix24_DeleteTasksDependencies(TestParameters);
    Bitrix24_UpdateTask(TestParameters);
    Bitrix24_GetTask(TestParameters);
    Bitrix24_MuteTask(TestParameters);
    Bitrix24_UnmuteTask(TestParameters);
    Bitrix24_AddTaskToFavorites(TestParameters);
    Bitrix24_RemoveTaskFromFavorites(TestParameters);
    Bitrix24_DelegateTask(TestParameters);
    Bitrix24_DeferTask(TestParameters);
    Bitrix24_CompleteTask(TestParameters);
    Bitrix24_DisapproveTask(TestParameters);
    Bitrix24_ApproveTask(TestParameters);
    Bitrix24_RenewTask(TestParameters);
    Bitrix24_StartTask(TestParameters);
    Bitrix24_StartWatchingTask(TestParameters);
    Bitrix24_StopWatchingTask(TestParameters);
    Bitrix24_PauseTask(TestParameters);
    Bitrix24_GetTaskHistory(TestParameters);
    Bitrix24_GetTasksList(TestParameters);
    Bitrix24_CheckTaskAccesses(TestParameters);
    Bitrix24_AddTasksChecklistElement(TestParameters);
    Bitrix24_UpdateTasksChecklistElement(TestParameters);
    Bitrix24_GetTasksChecklist(TestParameters);
    Bitrix24_GetTasksChecklistElement(TestParameters);
    Bitrix24_CompleteTasksChecklistElement(TestParameters);
    Bitrix24_RenewTasksChecklistElement(TestParameters);
    Bitrix24_DeleteTasksChecklistElement(TestParameters);
    Bitrix24_GetDailyPlan(TestParameters);
    Bitrix24_GetTasksFilterStructure(TestParameters);

    Name          = "Topic picture.jpg";
    Image         = TestParameters["Picture"];
    DestinationID = 3;

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID);
    FileID = Result["result"]["ID"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_TaskFileID", FileID);
    TestParameters.Insert("Bitrix24_TaskFileID", FileID);

    Bitrix24_AttachFileToTopic(TestParameters);

    OPI_Bitrix24.DeleteFile(URL, FileID);

    Bitrix24_DeleteTask(TestParameters);

EndProcedure

Procedure B24_WorkingWithDrive() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);

    Bitrix24_GetStoragesList(TestParameters);
    Bitrix24_GetAppStorage(TestParameters);
    Bitrix24_RenameStorage(TestParameters);
    Bitrix24_GetStorage(TestParameters);
    Bitrix24_UploadFileToStorage(TestParameters);
    Bitrix24_GetStorageObjects(TestParameters);
    Bitrix24_GetFileInformation(TestParameters);
    Bitrix24_GetFileExternalLink(TestParameters);
    Bitrix24_RenameFile(TestParameters);
    Bitrix24_MarkFileAsDeleted(TestParameters);
    Bitrix24_RestoreFile(TestParameters);
    Bitrix24_CreateStorageFolder(TestParameters);
    Bitrix24_RenameFolder(TestParameters);
    Bitrix24_GetFolderInformation(TestParameters);
    Bitrix24_GetFolderExternalLink(TestParameters);
    Bitrix24_CreateSubfolder(TestParameters);
    Bitrix24_MoveFileToFolder(TestParameters);
    Bitrix24_MakeFolderCopy(TestParameters);
    Bitrix24_UploadFileToFolder(TestParameters);
    Bitrix24_MakeFileCopy(TestParameters);
    Bitrix24_DeleteFile(TestParameters);
    Bitrix24_GetFolderFilterStructure(TestParameters);
    Bitrix24_GetFolderItems(TestParameters);
    Bitrix24_MoveFolder(TestParameters);
    Bitrix24_MarkFolderAsDeleted(TestParameters);
    Bitrix24_RestoreFolder(TestParameters);
    Bitrix24_DeleteFolder(TestParameters);

EndProcedure

Procedure B24_CommentsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);
    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CommentsTaskID", TaskID);
    TestParameters.Insert("Bitrix24_CommentsTaskID", TaskID);

    Bitrix24_AddTaskComment(TestParameters);
    Bitrix24_UpdateTaskComment(TestParameters);
    // !DISABLED! Bitrix24_CreateResultFromComment(TestParameters);
    // !DISABLED! Bitrix24_GetResultsList(TestParameters);
    // !DISABLED! Bitrix24_DeleteResultFromComment(TestParameters);
    // !DISABLED! Bitrix24_GetTaskCommentsList(TestParameters);
    // !DISABLED! Bitrix24_GetTaskComment(TestParameters);
    // !DISABLED! Bitrix24_DeleteTaskComment(TestParameters);
    Bitrix24_GetCommentStructure(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

EndProcedure

Procedure B24_Timekeeping() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);
    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ElapsedTaskID", TaskID);
    TestParameters.Insert("Bitrix24_ElapsedTaskID", TaskID);

    Bitrix24_AddTaskTimeAccounting(TestParameters);
    Bitrix24_GetTaskTimeAccounting(TestParameters);
    Bitrix24_GetTaskTimeAccountingList(TestParameters);
    Bitrix24_UpdateTaskTimeAccounting(TestParameters);
    Bitrix24_DeleteTaskTimeAccounting(TestParameters);
    Bitrix24_StartTimekeeping(TestParameters);
    Bitrix24_PauseTimekeeping(TestParameters);
    Bitrix24_GetTimekeepingStatus(TestParameters);
    Bitrix24_StopTimekeeping(TestParameters);
    Bitrix24_GetTimekeepingSettings(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

EndProcedure

Procedure B24_Kanban() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);
    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_KanbanTaskID", TaskID);
    TestParameters.Insert("Bitrix24_KanbanTaskID", TaskID);

    Bitrix24_AddKanbanStage(TestParameters);
    Bitrix24_GetKanbanStages(TestParameters);
    Bitrix24_MoveTaskToKanbanStage(TestParameters);
    Bitrix24_UpdateKanbansStage(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

    Bitrix24_DeleteKanbanStage(TestParameters);

EndProcedure

Procedure B24_ChatManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"       , TestParameters);

    Bitrix24_GetUserStatus(TestParameters);
    Bitrix24_SetUserStatus(TestParameters);
    Bitrix24_GetUsers(TestParameters);
    Bitrix24_CreateChat(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_GetChatUsers(TestParameters);
    Bitrix24_DeleteUserFromChat(TestParameters);
    Bitrix24_AddUsersToChat(TestParameters);
    Bitrix24_ChangeChatTitle(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_ChangeChatColor(TestParameters);
    Bitrix24_ChangeChatPicture(TestParameters);
    Bitrix24_DisableChatNotifications(TestParameters);
    Bitrix24_EnableChatNotifications(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_GetChatMessagesList(TestParameters);
    Bitrix24_MarkMessageAsReaded(TestParameters);
    Bitrix24_MarkMessageAsUnreaded(TestParameters);
    Bitrix24_GetDialog(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_GetChatMembersList(TestParameters);
    Bitrix24_SendWritingNotification(TestParameters);
    Bitrix24_SendMessage(TestParameters);
    Bitrix24_EditMessage(TestParameters);
    Bitrix24_GetPictureBlock(TestParameters);
    Bitrix24_GetFileBlock(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_SetMessageReaction(TestParameters);
    Bitrix24_DeleteMessage(TestParameters);
    Bitrix24_GetChatFilesFolder(TestParameters);
    Bitrix24_SendFile(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_ReadAll(TestParameters);
    Bitrix24_ChangeChatOwner(TestParameters);
    Bitrix24_LeaveChat(TestParameters);

    Bitrix24_GetChatStructure(TestParameters);

EndProcedure

Procedure B24_NotificationsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"       , TestParameters);

    Bitrix24_CreatePersonalNotification(TestParameters);
    Bitrix24_CreateSystemNotification(TestParameters);
    Bitrix24_DeleteNotification(TestParameters);

EndProcedure

Procedure B24_TasksFieldsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token"          , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_HookTaskFieldID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_TaskFieldID"    , TestParameters);

    Bitrix24_AddCustomTaskField(TestParameters);
    Bitrix24_UpdateCustomTaskField(TestParameters);
    Bitrix24_GetCustomTaskField(TestParameters);
    Bitrix24_GetCustomTaskFieldsList(TestParameters);
    Bitrix24_DeleteCustomTaskField(TestParameters);

EndProcedure

Procedure B24_DepartmentsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_CreateDepartment(TestParameters);
    Bitrix24_GetDepartments(TestParameters);
    Bitrix24_UpdateDepartment(TestParameters);
    Bitrix24_DeleteDepartment(TestParameters);

EndProcedure

Procedure B2_UsersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_GetCurrentUser(TestParameters);
    Bitrix24_GetUserFieldsStructure(TestParameters);
    Bitrix24_CreateUser(TestParameters);
    Bitrix24_FindUsers(TestParameters);
    Bitrix24_UpdateUser(TestParameters);
    Bitrix24_GetUser(TestParameters);
    Bitrix24_ChangeUserStatus(TestParameters);
    Bitrix24_GetUserFilterStructure(TestParameters);

EndProcedure

Procedure B24_LeadsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_GetLeadsList(TestParameters);
    Bitrix24_GetLeadFilterStructure(TestParameters);
    Bitrix24_GetLeadStructure(TestParameters);
    Bitrix24_CreateLead(TestParameters);
    Bitrix24_GetLead(TestParameters);
    Bitrix24_UpdateLead(TestParameters);
    Bitrix24_DeleteLead(TestParameters);

EndProcedure

Procedure B24_DealsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_GetDealsFilterStructure(TestParameters);
    Bitrix24_GetDealStructure(TestParameters);
    Bitrix24_CreateDeal(TestParameters);
    Bitrix24_GetDeal(TestParameters);
    Bitrix24_UpdateDeal(TestParameters);
    Bitrix24_DeleteDeal(TestParameters);
    Bitrix24_GetDealsList(TestParameters);

EndProcedure

Procedure B24_CalendarsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_CreateCalendar(TestParameters);
    Bitrix24_UpdateCalendar(TestParameters);
    Bitrix24_GetCalendarList(TestParameters);
    Bitrix24_CreateCalendarEvent(TestParameters);
    Bitrix24_SetUserParticipationStatus(TestParameters);
    Bitrix24_GetUserParticipationStatus(TestParameters);
    Bitrix24_GetCalendarEvent(TestParameters);
    Bitrix24_GetCalendarEvents(TestParameters);
    Bitrix24_UpdateCalendarEvent(TestParameters);
    Bitrix24_GetUserBusy(TestParameters);
    Bitrix24_DeleteCalendarEvent(TestParameters);
    Bitrix24_DeleteCalendar(TestParameters);
    Bitrix24_GetCustomCalendarSettings(TestParameters);
    Bitrix24_SetCustomCalendarSettings(TestParameters);
    Bitrix24_GetCalendarStructure(TestParameters);
    Bitrix24_GetCalendarSettingsStructure(TestParameters);
    Bitrix24_GetCalednarCustomSettingsStructure(TestParameters);
    Bitrix24_GetCalendarEventsStructure(TestParameters);
    Bitrix24_GetCalendarEventsFilterStructure(TestParameters);

EndProcedure

#EndRegion // Bitrix24

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Bitrix24

Procedure Bitrix24_GetAppAuthLink(FunctionParameters)

    Domain   = FunctionParameters["Bitrix24_Domain"];
    ClientID = FunctionParameters["Bitrix24_ClientID"];

    Options = New Structure;
    Options.Insert("domain", Domain);
    Options.Insert("clientid", ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetAppAuthLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetAppAuthLink");

EndProcedure

Procedure Bitrix24_GetToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Code         = FunctionParameters["Bitrix24_Code"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("clientsecret", ClientSecret);
    Options.Insert("code", Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetToken");

EndProcedure

Procedure Bitrix24_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Refresh      = FunctionParameters["Bitrix24_Refresh"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("clientsecret", ClientSecret);
    Options.Insert("refresh", Refresh);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RefreshToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RefreshToken");

EndProcedure

Procedure Bitrix24_ServerTime(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ServerTime", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ServerTime", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ServerTime", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ServerTime");

EndProcedure

Procedure Bitrix24_CreatePost(FunctionParameters)

    Text   = "Text of post";
    Title  = "Post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary data

    Files = New Map;
    Files.Insert("1.png", Image1);
    Files.Insert("2.png", Image2);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);
    Options.Insert("important", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePost", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreatePost", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePost", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreatePost", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdatePost(FunctionParameters)

    Text   = "New post text";
    Title  = "New post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary data
    PostID = FunctionParameters["Bitrix24_PostID"];

    Files = New Map;
    Files.Insert("1.png", Image1);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdatePost", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdatePost", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdatePost", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdatePost");

EndProcedure

Procedure Bitrix24_DeletePost(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeletePost", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeletePost", "Hook"); // SKIP

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeletePost", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeletePost");

EndProcedure

Procedure Bitrix24_GetImportantPostViewers(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetImportantPostViewers", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetImportantPostViewers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetImportantPostViewers", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetImportantPostViewers");

EndProcedure

Procedure Bitrix24_GetPosts(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPosts", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetPosts", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPosts", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetPosts");

EndProcedure

Procedure Bitrix24_AddPostComment(FunctionParameters)

    Text   = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostComment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddPostComment", "Hook"); // SKIP

    Text  = "Another comment";
    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddPostComment");

EndProcedure

Procedure Bitrix24_AddPostRecipients(FunctionParameters)

    Visibility = "UA";
    PostID     = FunctionParameters["Bitrix24_PostID"];
    URL        = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("vision", Visibility);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostRecipients", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddPostRecipients", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("vision", Visibility);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostRecipients", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddPostRecipients");

EndProcedure

Procedure Bitrix24_GetTaskFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskFieldsStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskFieldsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskFieldsStructure");

EndProcedure

Procedure Bitrix24_CreateTask(FunctionParameters)

    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", TaskData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateTask", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", TaskData);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateTask", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTask(FunctionParameters)

    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    TaskData = New Structure;
    TaskData.Insert("TITLE"      , "Another task title");
    TaskData.Insert("DESCRIPTION", "Another task description");
    TaskData.Insert("PRIORITY"   , "1");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fields", TaskData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fields", TaskData);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTask");

EndProcedure

Procedure Bitrix24_GetTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTask");

EndProcedure

Procedure Bitrix24_ApproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ApproveTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ApproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ApproveTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ApproveTask");

EndProcedure

Procedure Bitrix24_DisapproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisapproveTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DisapproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisapproveTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DisapproveTask");

EndProcedure

Procedure Bitrix24_CompleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CompleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CompleteTask");

EndProcedure

Procedure Bitrix24_RenewTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenewTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenewTask");

EndProcedure

Procedure Bitrix24_DeferTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeferTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeferTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeferTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeferTask");

EndProcedure

Procedure Bitrix24_StartTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "StartTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "StartTask");

EndProcedure

Procedure Bitrix24_StartWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartWatchingTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "StartWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartWatchingTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "StartWatchingTask");

EndProcedure

Procedure Bitrix24_StopWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopWatchingTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "StopWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopWatchingTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "StopWatchingTask");

EndProcedure

Procedure Bitrix24_PauseTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "PauseTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "PauseTask");

EndProcedure

Procedure Bitrix24_DeleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTask");

EndProcedure

Procedure Bitrix24_DelegateTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DelegateTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DelegateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("user", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DelegateTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DelegateTask");

EndProcedure

Procedure Bitrix24_AddTaskToFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskToFavorites", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTaskToFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskToFavorites", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTaskToFavorites");

EndProcedure

Procedure Bitrix24_RemoveTaskFromFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RemoveTaskFromFavorites", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RemoveTaskFromFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RemoveTaskFromFavorites", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RemoveTaskFromFavorites");

EndProcedure

Procedure Bitrix24_GetTaskHistory(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskHistory", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskHistory", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskHistory", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskHistory");

EndProcedure

Procedure Bitrix24_GetTasksList(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();

    // Full filter structure you can find at GetTasksFilterStructure method
    Filter = New Map;
    Filter.Insert("CREATED_BY", 1); // Producer with ID 1
    Filter.Insert("!RESPONSIBLE_ID", 10); // Performers with ID not equal to 10
    Filter.Insert(">=CREATED_DATE ", CurrentDate - 60 * 60 * 24); // Creation date >= yesterday

    Fields = New Array;
    Fields.Add("UF_CRM_TASK");
    Fields.Add("CREATED_BY");

    Indent = 1;
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", Filter);
    Options.Insert("select", Fields);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTasksList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("offset", Indent);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTasksList");

EndProcedure

Procedure Bitrix24_GetStoragesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStoragesList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetStoragesList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStoragesList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetStoragesList");

EndProcedure

Procedure Bitrix24_GetAppStorage(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetAppStorage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetAppStorage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UploadFileToStorage(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary data

    DestinationID = 3;

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Filename2);
    Options.Insert("file", Image2);
    Options.Insert("storageid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToStorage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UploadFileToStorage", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("file", Image);
    Options.Insert("storageid", DestinationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToStorage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UploadFileToStorage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteFile");

EndProcedure

Procedure Bitrix24_CreateStorageFolder(FunctionParameters)

    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateStorageFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateStorageFolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateStorageFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateStorageFolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteFolder", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteFolder");

EndProcedure

Procedure Bitrix24_GetStorage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetStorage", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetStorage");

EndProcedure

Procedure Bitrix24_GetStorageObjects(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorageObjects", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetStorageObjects", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorageObjects", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetStorageObjects");

EndProcedure

Procedure Bitrix24_RenameStorage(FunctionParameters)

    Name      = "New storage name";
    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameStorage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenameStorage");

EndProcedure

Procedure Bitrix24_GetFolderInformation(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderInformation");

EndProcedure

Procedure Bitrix24_CreateSubfolder(FunctionParameters)

    FolderID  = FunctionParameters["Bitrix24_FolderID"];
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSubfolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateSubfolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSubfolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateSubfolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MakeFolderCopy(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookSubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("tagetid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFolderCopy", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MakeFolderCopy", "Hook"); // SKIP

    DestinationID = FunctionParameters["Bitrix24_SubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MakeFolderCopy");

EndProcedure

Procedure Bitrix24_GetFolderExternalLink(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderExternalLink", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderExternalLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderExternalLink");

EndProcedure

Procedure Bitrix24_GetFolderFilterStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderFilterStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderFilterStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("empty", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderFilterStructure");

EndProcedure

Procedure Bitrix24_GetFolderItems(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderItems", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderItems", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderItems", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFolderItems");

EndProcedure

Procedure Bitrix24_MarkFolderAsDeleted(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFolderAsDeleted", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkFolderAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFolderAsDeleted", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkFolderAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RestoreFolder", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RestoreFolder");

EndProcedure

Procedure Bitrix24_MoveFolder(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("tagetid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MoveFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("tagetid", DestinationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MoveFolder");

EndProcedure

Procedure Bitrix24_RenameFolder(FunctionParameters)

    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = FunctionParameters["Bitrix24_HookFolderID"];
    URL       = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID2);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenameFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];
    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenameFolder");

EndProcedure

Procedure Bitrix24_UploadFileToFolder(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary data

    DestinationID = FunctionParameters["Bitrix24_FolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Filename2);
    Options.Insert("file", Image2);
    Options.Insert("folderid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UploadFileToFolder", "Hook", URL); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_Bitrix24.DeleteFile(URL, FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("file", Image);
    Options.Insert("folderid", DestinationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UploadFileToFolder", , URL, Token);

    FileID = Result["result"]["ID"];

    OPI_Bitrix24.DeleteFile(URL, FileID, Token);

EndProcedure

Procedure Bitrix24_MakeFileCopy(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFileCopy", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MakeFileCopy", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFileCopy", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MakeFileCopy");

EndProcedure

Procedure Bitrix24_GetFileInformation(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileInformation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFileInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFileInformation");

EndProcedure

Procedure Bitrix24_GetFileExternalLink(FunctionParameters)

    OPI_Tools.Pause(20); // SKIP

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileExternalLink", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFileExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileExternalLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFileExternalLink");

EndProcedure

Procedure Bitrix24_MarkFileAsDeleted(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFileAsDeleted", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkFileAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFileAsDeleted", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkFileAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RestoreFile", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RestoreFile");

EndProcedure

Procedure Bitrix24_RenameFile(FunctionParameters)

    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = FunctionParameters["Bitrix24_HookFileID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID2);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenameFile", "Hook"); // SKIP

    FileID = FunctionParameters["Bitrix24_FileID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenameFile");

EndProcedure

Procedure Bitrix24_MoveFileToFolder(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookSubFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFileToFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MoveFileToFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_SubFolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFileToFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MoveFileToFolder");

EndProcedure

Procedure Bitrix24_AttachFileToTopic(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    FileID = FunctionParameters["Bitrix24_TaskFileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AttachFileToTopic", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AttachFileToTopic", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AttachFileToTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AttachFileToTopic");

EndProcedure

Procedure Bitrix24_CheckTaskAccesses(FunctionParameters)

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("users", ArrayOfUsers);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CheckTaskAccesses", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CheckTaskAccesses", "Hook", ArrayOfUsers.Count()); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("users", ArrayOfUsers);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CheckTaskAccesses", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CheckTaskAccesses", , ArrayOfUsers.Count());

EndProcedure

Procedure Bitrix24_MuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MuteTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MuteTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MuteTask");

EndProcedure

Procedure Bitrix24_UnmuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UnmuteTask", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UnmuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UnmuteTask", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UnmuteTask");

EndProcedure

Procedure Bitrix24_AddTaskComment(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Text = "Task impossible, let's split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskComment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTaskComment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text = "Task uninpossible, don't split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTaskComment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskComment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTaskComment");

EndProcedure

Procedure Bitrix24_CreateResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateResultFromComment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateResultFromComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateResultFromComment");

EndProcedure

Procedure Bitrix24_DeleteResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteResultFromComment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteResultFromComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteResultFromComment");

EndProcedure

Procedure Bitrix24_GetResultsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetResultsList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetResultsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetResultsList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetResultsList");

EndProcedure

Procedure Bitrix24_GetTaskCommentsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskCommentsList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskCommentsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskCommentsList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskCommentsList");

EndProcedure

Procedure Bitrix24_GetTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskComment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskComment");

EndProcedure

Procedure Bitrix24_UpdateTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Text = "The task has been changed, do not split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskComment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Text = "The task has been changed, let's split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskComment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTaskComment");

EndProcedure

Procedure Bitrix24_CreateTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTasksDependencies", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateTasksDependencies", "Hook"); // SKIP

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTasksDependencies", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateTasksDependencies");

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

EndProcedure

Procedure Bitrix24_DeleteTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP
    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksDependencies", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTasksDependencies", "Hook"); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token); // SKIP
    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksDependencies", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTasksDependencies");

EndProcedure

Procedure Bitrix24_AddKanbanStage(FunctionParameters)

    Name  = "New stage";
    Color = "0026FF";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("color", Color);
    Options.Insert("prevstage", 6);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddKanbanStage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddKanbanStage", "Hook", FunctionParameters); // SKIP

    Name  = "New stage 2";
    Color = "0026FF";

    URL         = FunctionParameters["Bitrix24_Domain"];
    Token       = FunctionParameters["Bitrix24_Token"];
    PrevStageID = Result["result"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("color", Color);
    Options.Insert("prevstage", PrevStageID);
    Options.Insert("admin", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddKanbanStage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddKanbanStage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteKanbanStage(FunctionParameters)

    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("stage", StageID);
    Options.Insert("admin", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteKanbanStage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("stage", StageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteKanbanStage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteKanbanStage");

EndProcedure

Procedure Bitrix24_GetKanbanStages(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("admin", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetKanbanStages", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetKanbanStages", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetKanbanStages", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetKanbanStages");

EndProcedure

Procedure Bitrix24_MoveTaskToKanbanStage(FunctionParameters)

    TaskID  = FunctionParameters["Bitrix24_KanbanTaskID"];
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("stage", StageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveTaskToKanbanStage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MoveTaskToKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("stage", StageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveTaskToKanbanStage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MoveTaskToKanbanStage");

    OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, 2, , , Token);

EndProcedure

Procedure Bitrix24_UpdateKanbansStage(FunctionParameters)

    Name    = "New stage name";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("stage", StageID);
    Options.Insert("color", Color);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateKanbansStage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateKanbansStage", "Hook"); // SKIP

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("stage", StageID);
    Options.Insert("color", Color);
    Options.Insert("prevstage", 6);
    Options.Insert("admin", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateKanbansStage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateKanbansStage");

EndProcedure

Procedure Bitrix24_AddTasksChecklistElement(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Text = "Checklist element";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);
    Options.Insert("complete", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTasksChecklistElement", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTasksChecklistElement", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTasksChecklistElement", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTasksChecklistElement", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Text = "New elements text";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTasksChecklistElement", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTasksChecklistElement", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTasksChecklistElement", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTasksChecklistElement");

EndProcedure

Procedure Bitrix24_DeleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksChecklistElement", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksChecklistElement", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_GetTasksChecklist(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklist", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTasksChecklist", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklist", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTasksChecklist");

EndProcedure

Procedure Bitrix24_GetTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklistElement", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklistElement", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTasksChecklistElement");

EndProcedure

Procedure Bitrix24_CompleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTasksChecklistElement", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CompleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTasksChecklistElement", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CompleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_RenewTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTasksChecklistElement", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenewTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTasksChecklistElement", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "RenewTasksChecklistElement");

EndProcedure

Procedure Bitrix24_AddTaskTimeAccounting(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Time = 3600;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("amount", Time);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTaskTimeAccounting", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text      = "Time spent on work";
    UserID    = 10;
    Time      = 7200;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("amount", Time);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("date", SetupDate);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskTimeAccounting", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddTaskTimeAccounting", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Text = "The text I forgot last time";
    Time = 4800;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("amount", Time);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Text      = "New time record";
    Time      = 4800;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("amount", Time);
    Options.Insert("text", Text);
    Options.Insert("date", SetupDate);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskTimeAccounting", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_DeleteTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskTimeAccounting", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccounting", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccountingList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccountingList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskTimeAccountingList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccountingList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTaskTimeAccountingList");

EndProcedure

Procedure Bitrix24_GetDailyPlan(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDailyPlan", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDailyPlan", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDailyPlan", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDailyPlan");

EndProcedure

Procedure Bitrix24_CreateChat(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image);

    B64Image = GetBase64StringFromBinaryData(Image);

    MembersArray = New Array;
    MembersArray.Add(10);
    MembersArray.Add(1);

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE"       , "OPEN");
    ChatStructure.Insert("TITLE"      , "New chat");
    ChatStructure.Insert("DESCRIPTION", "This is a new chat");
    ChatStructure.Insert("COLOR"      , "GREEN");
    ChatStructure.Insert("MESSAGE"    , "Welcome to new chat");
    ChatStructure.Insert("USERS"      , MembersArray);
    ChatStructure.Insert("AVATAR"     , B64Image);
    ChatStructure.Insert("OWNER_ID"   , 1);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", ChatStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateChat", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateChat", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE" , "CHAT");
    ChatStructure.Insert("TITLE", "Private chat");
    ChatStructure.Insert("USERS", MembersArray);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", ChatStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateChat", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateChat", , FunctionParameters);

EndProcedure

Procedure Bitrix24_GetChatUsers(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatUsers", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatUsers", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatUsers", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatUsers");

EndProcedure

Procedure Bitrix24_LeaveChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "LeaveChat", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "LeaveChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "LeaveChat", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "LeaveChat");

EndProcedure

Procedure Bitrix24_DeleteUserFromChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteUserFromChat", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteUserFromChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteUserFromChat", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteUserFromChat");

EndProcedure

Procedure Bitrix24_AddUsersToChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("users", UserIDs);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddUsersToChat", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddUsersToChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("users", UserID);
    Options.Insert("hide", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddUsersToChat", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "AddUsersToChat");

EndProcedure

Procedure Bitrix24_ChangeChatTitle(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Title = "New chat title";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatTitle", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatTitle", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Title = "Another title";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("title", Title);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatTitle", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatTitle");

EndProcedure

Procedure Bitrix24_ChangeChatColor(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Color = "AZURE";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("color", Color);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatColor", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatColor", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Color = "PURPLE";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("color", Color);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatColor", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatColor");

EndProcedure

Procedure Bitrix24_ChangeChatPicture(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Image = FunctionParameters["Picture2"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatPicture", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("picture", Image);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatPicture", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatPicture");

EndProcedure

Procedure Bitrix24_DisableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisableChatNotifications", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DisableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisableChatNotifications", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DisableChatNotifications");

EndProcedure

Procedure Bitrix24_EnableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EnableChatNotifications", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "EnableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EnableChatNotifications", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "EnableChatNotifications");

EndProcedure

Procedure Bitrix24_ChangeChatOwner(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatOwner", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatOwner", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatOwner", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeChatOwner");

EndProcedure

Procedure Bitrix24_GetChatMessagesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat4";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMessagesList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatMessagesList", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("first", 0);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMessagesList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatMessagesList", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MarkMessageAsReaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);
    ChatString = "chat" + ChatID;

    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsReaded", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkMessageAsReaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsReaded", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkMessageAsReaded");

EndProcedure

Procedure Bitrix24_MarkMessageAsUnreaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;
    MessageID  = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsUnreaded", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkMessageAsUnreaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsUnreaded", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "MarkMessageAsUnreaded");

EndProcedure

Procedure Bitrix24_GetDialog(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDialog", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDialog", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDialog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDialog");

EndProcedure

Procedure Bitrix24_GetChatMembersList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMembersList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatMembersList", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMembersList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatMembersList");

EndProcedure

Procedure Bitrix24_SendWritingNotification(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendWritingNotification", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SendWritingNotification", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendWritingNotification", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SendWritingNotification");

EndProcedure

Procedure Bitrix24_ReadAll(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ReadAll", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ReadAll", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ReadAll", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ReadAll");

EndProcedure

Procedure Bitrix24_SendMessage(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;
    Text       = "Message text";
    Image      = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File       = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SendMessage", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SendMessage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_EditMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Text = "New message text";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EditMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "EditMessage", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EditMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "EditMessage");

EndProcedure

Procedure Bitrix24_DeleteMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteMessage", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteMessage");

EndProcedure

Procedure Bitrix24_SetMessageReaction(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetMessageReaction", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetMessageReaction", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetMessageReaction", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetMessageReaction");

EndProcedure

Procedure Bitrix24_GetChatFilesFolder(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatFilesFolder", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatFilesFolder");

EndProcedure

Procedure Bitrix24_SendFile(FunctionParameters)

    URL         = FunctionParameters["Bitrix24_URL"];
    ChatID      = FunctionParameters["Bitrix24_HookChatID"];
    File        = FunctionParameters["Document"]; // Binary data, URL or path to file
    Description = "Very important file";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Directory = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);
    FolderID  = Directory["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", "Imortant doc.docx");
    Options.Insert("file", File);
    Options.Insert("folderid", FolderID);

    UploadedFile = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);
    FileID       = UploadedFile["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("fileid", FileID);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SendFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Directory = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);
    FolderID  = Directory["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", "Imortant doc.docx");
    Options.Insert("file", File);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    UploadedFile = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);
    FileID       = UploadedFile["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("fileid", FileID);
    Options.Insert("description", Description);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SendFile");

EndProcedure

Procedure Bitrix24_GetUsers(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    ArrayOfUsers = New Array;

    ArrayOfUsers.Add(1);
    ArrayOfUsers.Add(10);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", ArrayOfUsers);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUsers", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUsers", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    UserIDs = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", UserIDs);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUsers", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUsers");

EndProcedure

Procedure Bitrix24_GetUserStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserStatus", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserStatus", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserStatus", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserStatus");

EndProcedure

Procedure Bitrix24_SetUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Status = "dnd";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("status", Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserStatus", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Status = "away";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("status", Status);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserStatus", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetUserStatus");

EndProcedure

Procedure Bitrix24_CreatePersonalNotification(FunctionParameters)

    UserID = 1;

    URL   = FunctionParameters["Bitrix24_URL"];
    Text  = "Message text";
    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePersonalNotification", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreatePersonalNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("tag", Tag);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePersonalNotification", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreatePersonalNotification", , FunctionParameters);

EndProcedure

Procedure Bitrix24_CreateSystemNotification(FunctionParameters)

    UserID = 1;

    URL   = FunctionParameters["Bitrix24_URL"];
    Text  = "Message text";
    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSystemNotification", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateSystemNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("tag", Tag);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSystemNotification", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateSystemNotification", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteNotification(FunctionParameters)

    URL            = FunctionParameters["Bitrix24_URL"];
    NotificationID = FunctionParameters["Bitrix24_PersonalHookNotifyID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("notif", NotificationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteNotification", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteNotification", "Hook"); // SKIP

    URL            = FunctionParameters["Bitrix24_Domain"];
    Token          = FunctionParameters["Bitrix24_Token"];
    NotificationID = FunctionParameters["Bitrix24_PersonalNotifyID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("notif", NotificationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteNotification", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteNotification");

EndProcedure

Procedure Bitrix24_AddCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Type = "date";
    Name = "BIRTHDAY_FIELD";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("type", Type);
    Options.Insert("fieldname", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddCustomTaskField", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Type       = "string";
    Name       = "TEXT_FIELD";
    ExternalID = "BITRIX_TEXT_FIELD";
    Title      = "Text field";
    Signature  = New Structure("en,ru", "Some field", "Nekotoroe pole");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("type", Type);
    Options.Insert("fieldname", Name);
    Options.Insert("externalid", ExternalID);
    Options.Insert("title", Title);
    Options.Insert("label", Signature);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_UpdateCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];
    Title   = "New title";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCustomTaskField", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FieldID    = FunctionParameters["Bitrix24_TaskFieldID"];
    ExternalID = "NEW_TEXT_FIELD";
    Signature  = New Structure("en,ru", "Updated field", "Izmenennoe pole");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("externalid", ExternalID);
    Options.Insert("label", Signature);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskField", Options);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskFieldsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskFieldsList", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskFieldsList", Options);

    // END

EndProcedure

Procedure Bitrix24_DeleteCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCustomTaskField", Options);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_CreateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Name     = "Main department";
    ParentID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("parentid", ParentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDepartment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateDepartment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Name     = "Subordinate department";
    ParentID = FunctionParameters["Bitrix24_HookDepID"];
    HeadID   = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("parentid", ParentID);
    Options.Insert("headid", HeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDepartment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateDepartment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];
    ParentID     = 7;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);
    Options.Insert("parentid", ParentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDepartment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateDepartment", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    DepartmentID = FunctionParameters["Bitrix24_DepID"];
    Name         = "New department";
    ParentID     = 1;
    HeadID       = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);
    Options.Insert("title", Name);
    Options.Insert("parentid", ParentID);
    Options.Insert("headid", HeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDepartment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateDepartment");

EndProcedure

Procedure Bitrix24_DeleteDepartment(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDepartment", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteDepartment", "Hook"); // SKIP

    URL          = FunctionParameters["Bitrix24_Domain"];
    Token        = FunctionParameters["Bitrix24_Token"];
    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDepartment", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteDepartment");

EndProcedure

Procedure Bitrix24_GetDepartments(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDepartments", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDepartments", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    HeadID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headid", HeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDepartments", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDepartments");

EndProcedure

Procedure Bitrix24_GetCurrentUser(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCurrentUser", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCurrentUser", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCurrentUser", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCurrentUser");

EndProcedure

Procedure Bitrix24_GetUserFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFieldsStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFieldsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserFieldsStructure");

EndProcedure

Procedure Bitrix24_CreateUser(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_URL"];
    Email = String(New UUID) + "@example.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", UserStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateUser", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateUser", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    Email = String(New UUID) + "@example.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"          , Email);
    UserStructure.Insert("NAME"           , "Vitaly");
    UserStructure.Insert("LAST_NAME"      , "Alpaca");
    UserStructure.Insert("PERSONAL_MOBILE", "88003553535");
    UserStructure.Insert("UF_DEPARTMENT"  , 1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", UserStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateUser", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateUser", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];
    Email  = String(New UUID) + "@example.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fields", UserStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateUser", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateUser", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];
    Email  = String(New UUID) + "@example.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("NAME"         , "Oleg");
    UserStructure.Insert("LAST_NAME"    , "Lama");
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fields", UserStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateUser", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateUser");

EndProcedure

Procedure Bitrix24_ChangeUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fire", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeUserStatus", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fire", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeUserStatus", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "ChangeUserStatus");

EndProcedure

Procedure Bitrix24_GetUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUser", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUser", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUser", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUser");

EndProcedure

Procedure Bitrix24_FindUsers(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FilterStructure = New Structure;
    FilterStructure.Insert("NAME"              , "Vitaly");
    FilterStructure.Insert("LAST_NAME"         , "Alpaca");
    FilterStructure.Insert("WORK_POSITION"     , "DevOps engineer");
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Marketing department");
    FilterStructure.Insert("USER_TYPE"         , "employee");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", FilterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "FindUsers", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "FindUsers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", FilterStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "FindUsers", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "FindUsers");

EndProcedure

Procedure Bitrix24_StartTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTimekeeping", Options);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate() - Hour;
    Report = "Late";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("time", Time);
    Options.Insert("report", Report);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTimekeeping", Options);

    // END

EndProcedure

Procedure Bitrix24_StopTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopTimekeeping", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate();
    Report = "Time off";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("time", Time);
    Options.Insert("report", Report);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopTimekeeping", Options);

EndProcedure

Procedure Bitrix24_PauseTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTimekeeping", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTimekeeping", Options);

    // END

EndProcedure

Procedure Bitrix24_GetTimekeepingStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingStatus", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingStatus", Options);

EndProcedure

Procedure Bitrix24_GetTimekeepingSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingSettings", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingSettings", Options);

    // END

EndProcedure

Procedure Bitrix24_GetLeadFilterStructure(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetLeadFilterStructure");

EndProcedure

Procedure Bitrix24_GetLeadStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetLeadStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetLeadStructure");

EndProcedure

Procedure Bitrix24_CreateLead(FunctionParameters)

    EmailsArray = New Array;
    EmailsArray.Add(New Structure("VALUE,VALUE_TYPE", "yo@example.com", "HOME"));
    EmailsArray.Add(New Structure("VALUE,VALUE_TYPE", "hi@example.com", "WORK"));

    PhonesArray = New Array;
    PhonesArray.Add(New Structure("VALUE,VALUE_TYPE", "88005553535", "WORK"));

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Pushkin st., b. 10");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Russia");
    FieldsStructure.Insert("EMAIL"          , EmailsArray);
    FieldsStructure.Insert("NAME"           , "John");
    FieldsStructure.Insert("LAST_NAME"      , "Doe");
    FieldsStructure.Insert("PHONE"          , PhonesArray);
    FieldsStructure.Insert("TITLE"          , "MegaClient");

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateLead", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateLead", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("NAME"     , "Ivan");
    FieldsStructure.Insert("LAST_NAME", "Ivanov");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateLead", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateLead", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateLead(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Lermontov st., b. 20");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Belarus");
    FieldsStructure.Insert("TITLE"          , "SuperClient");

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateLead", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateLead", "Hook"); // SKIP

    FieldsStructure.Insert("NAME"     , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME", "Evgeniev");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateLead", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateLead");

EndProcedure

Procedure Bitrix24_DeleteLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteLead", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteLead", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteLead");

EndProcedure

Procedure Bitrix24_GetLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLead", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLead", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetLead");

EndProcedure

Procedure Bitrix24_GetLeadsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadsList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetLeadsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", Filter);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadsList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetLeadsList");

EndProcedure

Procedure Bitrix24_GetDealsFilterStructure(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDealsFilterStructure");

EndProcedure

Procedure Bitrix24_GetDealStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDealStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDealStructure");

EndProcedure

Procedure Bitrix24_CreateDeal(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"         , "Planned sale");
    FieldsStructure.Insert("TYPE_ID"       , "GOODS");
    FieldsStructure.Insert("STAGE_ID"      , "NEW");
    FieldsStructure.Insert("COMPANY_ID"    , 1);
    FieldsStructure.Insert("CONTACT_ID"    , 3);
    FieldsStructure.Insert("OPENED"        , "Y");
    FieldsStructure.Insert("ASSIGNED_BY_ID", 1);
    FieldsStructure.Insert("PROBABILITY"   , 30);
    FieldsStructure.Insert("CURRENCY_ID"   , "USD");
    FieldsStructure.Insert("OPPORTUNITY"   , 5000);
    FieldsStructure.Insert("CATEGORY_ID"   , 5);
    FieldsStructure.Insert("BEGINDATE"     , "2024-01-01");
    FieldsStructure.Insert("CLOSEDATE"     , "2030-01-01");

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDeal", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateDeal", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("TITLE"    , "Another deal");
    FieldsStructure.Insert("CLOSEDATE", "2031-01-01");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDeal", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateDeal", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateDeal(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"      , "Sale in RUB");
    FieldsStructure.Insert("CURRENCY_ID", "RUB");
    FieldsStructure.Insert("OPPORTUNITY", 50000);

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDeal", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateDeal", "Hook"); // SKIP

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDeal", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateDeal");

EndProcedure

Procedure Bitrix24_GetDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDeal", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDeal", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDeal");

EndProcedure

Procedure Bitrix24_DeleteDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDeal", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDeal", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteDeal");

EndProcedure

Procedure Bitrix24_GetDealsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDealsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", Filter);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetDealsList");

EndProcedure

Procedure Bitrix24_GetTasksFilterStructure(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetTasksFilterStructure");

EndProcedure

Procedure Bitrix24_GetCommentStructure(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCommentStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCommentStructure");

EndProcedure

Procedure Bitrix24_GetChatStructure(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetChatStructure");

EndProcedure

Procedure Bitrix24_GetPictureBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPictureBlock", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetPictureBlock");

EndProcedure

Procedure Bitrix24_GetFileBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileBlock", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetFileBlock");

EndProcedure

Procedure Bitrix24_GetUserFilterStructure(FunctionParameters)

    Clear  = False;
    Options = New Structure;
    Options.Insert("empty", Clear);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserFilterStructure");

EndProcedure

Procedure Bitrix24_CreateCalendar(FunctionParameters)

    UserID = 1;

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("type"       , "user");
    CalendarsStructure.Insert("ownerId"    , UserID);
    CalendarsStructure.Insert("name"       , "new calendar");
    CalendarsStructure.Insert("description", "My new calendar");
    CalendarsStructure.Insert("color"      , "#FFFFFF");
    CalendarsStructure.Insert("text_color" , "#000000");

    ExportStructure = New Structure;
    ExportStructure.Insert("ALLOW", "True");
    ExportStructure.Insert("SET"  , "all");

    CalendarsStructure.Insert("export", ExportStructure);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendar", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateCalendar", "Hook", FunctionParameters); // SKIP

    CalendarsStructure.Insert("name"       , "Another calendar");
    CalendarsStructure.Insert("description", "My other new calendar");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", CalendarsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendar", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateCalendar", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateCalendar(FunctionParameters)

    UserID = 1;

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("type"       , "user");
    CalendarsStructure.Insert("ownerId"    , UserID);
    CalendarsStructure.Insert("name"       , "New calendar name");
    CalendarsStructure.Insert("description", "This calendar has been changed");

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("fields", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendar", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("fields", CalendarsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendar", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateCalendar");

EndProcedure

Procedure Bitrix24_DeleteCalendar(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];
    OwnerID    = 1;
    Type       = "user";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendar", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendar", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteCalendar");

EndProcedure

Procedure Bitrix24_GetCalendarStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarList(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarList");

EndProcedure

Procedure Bitrix24_GetCalendarSettingsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarSettingsStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarSettingsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarSettingsStructure");

EndProcedure

Procedure Bitrix24_GetCalednarCustomSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalednarCustomSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalednarCustomSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalednarCustomSettingsStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalednarCustomSettingsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCustomCalendarSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomCalendarSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomCalendarSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCustomCalendarSettings");

EndProcedure

Procedure Bitrix24_SetCustomCalendarSettings(FunctionParameters)

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("view"              , "month");
    CalendarsStructure.Insert("showDeclined"      , "Y");
    CalendarsStructure.Insert("collapseOffHours"  , "N");
    CalendarsStructure.Insert("showCompletedTasks", "N");

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("settings", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetCustomCalendarSettings", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("settings", CalendarsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetCustomCalendarSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetCustomCalendarSettings");

EndProcedure

Procedure Bitrix24_GetUserBusy(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    User = 1;

    Week        = 604800;
    CurrentDate = OPI_Tools.GetCurrentDate();

    StartDate = CurrentDate;
    EndDate   = CurrentDate + Week;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", User);
    Options.Insert("from", StartDate);
    Options.Insert("to", EndDate);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserBusy", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserBusy", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", User);
    Options.Insert("from", StartDate);
    Options.Insert("to", EndDate);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserBusy", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserBusy");

EndProcedure

Procedure Bitrix24_CreateCalendarEvent(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    Tomorrow = OPI_Tools.GetCurrentDate() + 86400;
    Hour     = 3600;

    EventStucture = New Structure;

    EventStucture.Insert("type"         , "user");
    EventStucture.Insert("ownerId"      , 1);
    EventStucture.Insert("from"         , XMLString(Tomorrow));
    EventStucture.Insert("to"           , XMLString(Tomorrow + Hour));
    EventStucture.Insert("section"      , CalendarID);
    EventStucture.Insert("name"         , "New event");
    EventStucture.Insert("skip_time"    , "N");
    EventStucture.Insert("timezone_from", "Europe/Minsk");
    EventStucture.Insert("timezone_to"  , "Europe/Minsk");
    EventStucture.Insert("description"  , "Event description");
    EventStucture.Insert("color"        , "%23000000>");
    EventStucture.Insert("text_color"   , "%23FFFFFF");
    EventStucture.Insert("accessibility", "quest");
    EventStucture.Insert("importance"   , "normal");
    EventStucture.Insert("private_event", "Y");

    RepeatabilityStructure = New Structure;
    RepeatabilityStructure.Insert("FREQ"    , "DAILY");
    RepeatabilityStructure.Insert("COUNT"   , 3);
    RepeatabilityStructure.Insert("INTERVAL", 10);

    DaysArray = New Array;
    DaysArray.Add("SA");
    DaysArray.Add("MO");

    RepeatabilityStructure.Insert("BYDAY", DaysArray);
    RepeatabilityStructure.Insert("UNTIL", XMLString(Tomorrow + Hour * 24 * 10));

    EventStucture.Insert("rrule"     , RepeatabilityStructure);
    EventStucture.Insert("is_meeting", "Y");
    EventStucture.Insert("location"  , "Office");

    RemindersArray = New Array;

    ReminderStructure = New Structure;
    ReminderStructure.Insert("type" , "day");
    ReminderStructure.Insert("count", 1);

    RemindersArray.Add(ReminderStructure);

    EventStucture.Insert("remind"   , RemindersArray);
    EventStucture.Insert("attendees", StrSplit("1,10", ","));
    EventStucture.Insert("host"     , 1);

    MeetingStructure = New Structure;
    MeetingStructure.Insert("notify"      , "Y");
    MeetingStructure.Insert("reinvite"    , "Y");
    MeetingStructure.Insert("allow_invite", "N");
    MeetingStructure.Insert("hide_guests" , "N");

    EventStucture.Insert("meeting", MeetingStructure);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", EventStucture);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendarEvent", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    EventStucture.Insert("section", CalendarID);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", EventStucture);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendarEvent", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "CreateCalendarEvent", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    EventStucture = New Structure;

    EventStucture.Insert("ownerId"      , 1);
    EventStucture.Insert("type"         , "user");
    EventStucture.Insert("name"         , "Modified event");
    EventStucture.Insert("description"  , "New event description");
    EventStucture.Insert("importance"   , "low");
    EventStucture.Insert("private_event", "Y");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("fields", EventStucture);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendarEvent", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    EventID    = FunctionParameters["Bitrix24_CEventID"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("fields", EventStucture);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendarEvent", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "UpdateCalendarEvent", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendarEvent", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendarEvent", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "DeleteCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvent", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvent", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvents(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvents", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEvents", "Hook"); // SKIP

    URL         = FunctionParameters["Bitrix24_Domain"];
    Token       = FunctionParameters["Bitrix24_Token"];
    EventID     = FunctionParameters["Bitrix24_CEventID"];
    CalendarID1 = FunctionParameters["Bitrix24_HookCalendarID"];
    CalendarID2 = FunctionParameters["Bitrix24_CalendarID"];

    Tomorrow = OPI_Tools.GetCurrentDate() + 86400;
    NextDay  = Tomorrow + 86400;

    ArrayOfCalendars = New Array;
    ArrayOfCalendars.Add(CalendarID1);
    ArrayOfCalendars.Add(CalendarID2);

    Filter = New Structure;
    Filter.Insert("from"   , Tomorrow);
    Filter.Insert("to"     , NextDay);
    Filter.Insert("section", ArrayOfCalendars);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);
    Options.Insert("filter", Filter);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvents", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEvents");

EndProcedure

Procedure Bitrix24_SetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];
    Status  = "Y";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("status", Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserParticipationStatus", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("status", Status);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserParticipationStatus", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "SetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserParticipationStatus", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserParticipationStatus", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetCalendarEventsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEventsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEventsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarEventsFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsFilterStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEventsFilterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsFilterStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Bitrix24", "GetCalendarEventsFilterStructure", "Clear");

EndProcedure

#EndRegion // Bitrix24

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure Б24_РаботаСТокеном() Export
    B24_TokenManagement();
EndProcedure

Procedure Б24_СерверноеВремя() Export
    B24_ServerTime();
EndProcedure

Procedure Б24_РаботаСНовостями() Export
    B24_PostsManagement();
EndProcedure

Procedure Б24_РаботаСЗадачами() Export
    B24_TaskManagement();
EndProcedure

Procedure Б24_РаботаСДиском() Export
    B24_WorkingWithDrive();
EndProcedure

Procedure Б24_РаботаСКомментариями() Export
    B24_CommentsManagement();
EndProcedure

Procedure Б24_УчетРабочегоВремени() Export
    B24_Timekeeping();
EndProcedure

Procedure Б24_Канбан() Export
    B24_Kanban();
EndProcedure

Procedure Б24_РаботаСЧатами() Export
    B24_ChatManagement();
EndProcedure

Procedure Б24_РаботаСУведомлениями() Export
    B24_NotificationsManagement();
EndProcedure

Procedure Б24_РаботаСПолямиЗадач() Export
    B24_TasksFieldsManagement();
EndProcedure

Procedure Б24_УправлениеПодразделениями() Export
    B24_DepartmentsManagement();
EndProcedure

Procedure Б24_УправлениеПользователями() Export
    B2_UsersManagement();
EndProcedure

Procedure Б24_РаботаСЛидами() Export
    B24_LeadsManagement();
EndProcedure

Procedure Б24_РаботаСоСделками() Export
    B24_DealsManagement();
EndProcedure

Procedure Б24_РаботаСКалендарями() Export
    B24_CalendarsManagement();
EndProcedure

#EndRegion
