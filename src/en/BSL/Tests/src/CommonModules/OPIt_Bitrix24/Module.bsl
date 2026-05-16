// OneScript: ./OInt/tests/Modules/OPIt_Bitrix24.os

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

// #Use oint
// #Use asserts
// #Use "internal"

#If Not WebClient Then // !OPI

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("Bitrix24");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Bitrix24");

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

    Result = OPI_Bitrix24.GetAppAuthLink(Domain, ClientID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetAppAuthLink");

EndProcedure

Procedure Bitrix24_GetToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Code         = FunctionParameters["Bitrix24_Code"];

    Result = OPI_Bitrix24.GetToken(ClientID, ClientSecret, Code);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetToken");

EndProcedure

Procedure Bitrix24_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Refresh      = FunctionParameters["Bitrix24_Refresh"];

    Result = OPI_Bitrix24.RefreshToken(ClientID, ClientSecret, Refresh);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RefreshToken");

EndProcedure

Procedure Bitrix24_ServerTime(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ServerTime(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ServerTime", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ServerTime(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ServerTime");

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

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreatePost", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreatePost", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdatePost(FunctionParameters)

    Text   = "New post text";
    Title  = "New post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary data
    PostID = FunctionParameters["Bitrix24_PostID"];

    Files = New Map;
    Files.Insert("1.png", Image1);

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdatePost", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdatePost");

EndProcedure

Procedure Bitrix24_DeletePost(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeletePost", "Hook"); // SKIP

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeletePost");

EndProcedure

Procedure Bitrix24_GetImportantPostViewers(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetImportantPostViewers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetImportantPostViewers");

EndProcedure

Procedure Bitrix24_GetPosts(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetPosts", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetPosts");

EndProcedure

Procedure Bitrix24_AddPostComment(FunctionParameters)

    Text   = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddPostComment", "Hook"); // SKIP

    Text  = "Another comment";
    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddPostComment");

EndProcedure

Procedure Bitrix24_AddPostRecipients(FunctionParameters)

    Visibility = "UA";
    PostID     = FunctionParameters["Bitrix24_PostID"];
    URL        = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddPostRecipients", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddPostRecipients");

EndProcedure

Procedure Bitrix24_GetTaskFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskFieldsStructure");

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

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateTask", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateTask", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTask(FunctionParameters)

    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    TaskData = New Structure;
    TaskData.Insert("TITLE"      , "Another task title");
    TaskData.Insert("DESCRIPTION", "Another task description");
    TaskData.Insert("PRIORITY"   , "1");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTask");

EndProcedure

Procedure Bitrix24_GetTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTask");

EndProcedure

Procedure Bitrix24_ApproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ApproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ApproveTask");

EndProcedure

Procedure Bitrix24_DisapproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DisapproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DisapproveTask");

EndProcedure

Procedure Bitrix24_CompleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CompleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CompleteTask");

EndProcedure

Procedure Bitrix24_RenewTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenewTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenewTask");

EndProcedure

Procedure Bitrix24_DeferTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeferTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeferTask");

EndProcedure

Procedure Bitrix24_StartTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "StartTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "StartTask");

EndProcedure

Procedure Bitrix24_StartWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "StartWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "StartWatchingTask");

EndProcedure

Procedure Bitrix24_StopWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "StopWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "StopWatchingTask");

EndProcedure

Procedure Bitrix24_PauseTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "PauseTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "PauseTask");

EndProcedure

Procedure Bitrix24_DeleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTask");

EndProcedure

Procedure Bitrix24_DelegateTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DelegateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DelegateTask");

EndProcedure

Procedure Bitrix24_AddTaskToFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTaskToFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTaskToFavorites");

EndProcedure

Procedure Bitrix24_RemoveTaskFromFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RemoveTaskFromFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RemoveTaskFromFavorites");

EndProcedure

Procedure Bitrix24_GetTaskHistory(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskHistory", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskHistory");

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

    Result = OPI_Bitrix24.GetTasksList(URL, Filter, , , Fields);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTasksList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksList(URL, , Indent, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTasksList");

EndProcedure

Procedure Bitrix24_GetStoragesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Result = OPI_Bitrix24.GetStoragesList(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetStoragesList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStoragesList(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetStoragesList");

EndProcedure

Procedure Bitrix24_GetAppStorage(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetAppStorage(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetAppStorage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UploadFileToStorage(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary data

    DestinationID = 3;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Filename2, Image2, DestinationID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UploadFileToStorage", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UploadFileToStorage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteFile");

EndProcedure

Procedure Bitrix24_CreateStorageFolder(FunctionParameters)

    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Filename2);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateStorageFolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Name, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateStorageFolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteFolder", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteFolder");

EndProcedure

Procedure Bitrix24_GetStorage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorage(URL, StorageID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetStorage", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorage(URL, StorageID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetStorage");

EndProcedure

Procedure Bitrix24_GetStorageObjects(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetStorageObjects", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetStorageObjects");

EndProcedure

Procedure Bitrix24_RenameStorage(FunctionParameters)

    Name      = "New storage name";
    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];

    Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenameStorage");

EndProcedure

Procedure Bitrix24_GetFolderInformation(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderInformation");

EndProcedure

Procedure Bitrix24_CreateSubfolder(FunctionParameters)

    FolderID  = FunctionParameters["Bitrix24_FolderID"];
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Filename2);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateSubfolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Name, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateSubfolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MakeFolderCopy(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookSubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MakeFolderCopy(URL, FolderID, DestinationID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MakeFolderCopy", "Hook"); // SKIP

    DestinationID = FunctionParameters["Bitrix24_SubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MakeFolderCopy");

EndProcedure

Procedure Bitrix24_GetFolderExternalLink(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderExternalLink");

EndProcedure

Procedure Bitrix24_GetFolderFilterStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderFilterStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL, True, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderFilterStructure");

EndProcedure

Procedure Bitrix24_GetFolderItems(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderItems", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFolderItems");

EndProcedure

Procedure Bitrix24_MarkFolderAsDeleted(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkFolderAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkFolderAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RestoreFolder", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RestoreFolder");

EndProcedure

Procedure Bitrix24_MoveFolder(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MoveFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MoveFolder");

EndProcedure

Procedure Bitrix24_RenameFolder(FunctionParameters)

    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = FunctionParameters["Bitrix24_HookFolderID"];
    URL       = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID2, Filename2);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenameFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];
    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID, Name, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenameFolder");

EndProcedure

Procedure Bitrix24_UploadFileToFolder(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary data

    DestinationID = FunctionParameters["Bitrix24_FolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Filename2, Image2, DestinationID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UploadFileToFolder", "Hook", URL); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_Bitrix24.DeleteFile(URL, FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Name, Image, DestinationID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UploadFileToFolder", , URL, Token);

    FileID = Result["result"]["ID"];

    OPI_Bitrix24.DeleteFile(URL, FileID, Token);

EndProcedure

Procedure Bitrix24_MakeFileCopy(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MakeFileCopy", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MakeFileCopy");

EndProcedure

Procedure Bitrix24_GetFileInformation(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFileInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFileInformation");

EndProcedure

Procedure Bitrix24_GetFileExternalLink(FunctionParameters)

    OPI_Tools.Pause(20); // SKIP

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFileExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFileExternalLink");

EndProcedure

Procedure Bitrix24_MarkFileAsDeleted(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkFileAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkFileAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RestoreFile", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RestoreFile");

EndProcedure

Procedure Bitrix24_RenameFile(FunctionParameters)

    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = FunctionParameters["Bitrix24_HookFileID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID2, Filename2);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenameFile", "Hook"); // SKIP

    FileID = FunctionParameters["Bitrix24_FileID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID, Name, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenameFile");

EndProcedure

Procedure Bitrix24_MoveFileToFolder(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookSubFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MoveFileToFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_SubFolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MoveFileToFolder");

EndProcedure

Procedure Bitrix24_AttachFileToTopic(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    FileID = FunctionParameters["Bitrix24_TaskFileID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AttachFileToTopic", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AttachFileToTopic");

EndProcedure

Procedure Bitrix24_CheckTaskAccesses(FunctionParameters)

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CheckTaskAccesses", "Hook", ArrayOfUsers.Count()); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CheckTaskAccesses", , ArrayOfUsers.Count());

EndProcedure

Procedure Bitrix24_MuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MuteTask");

EndProcedure

Procedure Bitrix24_UnmuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UnmuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UnmuteTask");

EndProcedure

Procedure Bitrix24_AddTaskComment(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Text = "Task impossible, let's split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTaskComment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text = "Task uninpossible, don't split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTaskComment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTaskComment");

EndProcedure

Procedure Bitrix24_CreateResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateResultFromComment");

EndProcedure

Procedure Bitrix24_DeleteResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteResultFromComment");

EndProcedure

Procedure Bitrix24_GetResultsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetResultsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetResultsList");

EndProcedure

Procedure Bitrix24_GetTaskCommentsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskCommentsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskCommentsList");

EndProcedure

Procedure Bitrix24_GetTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskComment");

EndProcedure

Procedure Bitrix24_UpdateTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Text = "The task has been changed, do not split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Text = "The task has been changed, let's split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTaskComment");

EndProcedure

Procedure Bitrix24_CreateTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateTasksDependencies", "Hook"); // SKIP

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateTasksDependencies");

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

EndProcedure

Procedure Bitrix24_DeleteTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP
    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTasksDependencies", "Hook"); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token); // SKIP
    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTasksDependencies");

EndProcedure

Procedure Bitrix24_AddKanbanStage(FunctionParameters)

    Name  = "New stage";
    Color = "0026FF";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, 6);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddKanbanStage", "Hook", FunctionParameters); // SKIP

    Name  = "New stage 2";
    Color = "0026FF";

    URL         = FunctionParameters["Bitrix24_Domain"];
    Token       = FunctionParameters["Bitrix24_Token"];
    PrevStageID = Result["result"];

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, PrevStageID, , True, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddKanbanStage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteKanbanStage(FunctionParameters)

    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteKanbanStage");

EndProcedure

Procedure Bitrix24_GetKanbanStages(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetKanbanStages", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetKanbanStages");

EndProcedure

Procedure Bitrix24_MoveTaskToKanbanStage(FunctionParameters)

    TaskID  = FunctionParameters["Bitrix24_KanbanTaskID"];
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MoveTaskToKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID, , , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MoveTaskToKanbanStage");

    OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, 2, , , Token);

EndProcedure

Procedure Bitrix24_UpdateKanbansStage(FunctionParameters)

    Name    = "New stage name";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateKanbansStage", "Hook"); // SKIP

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color, 6, True, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateKanbansStage");

EndProcedure

Procedure Bitrix24_AddTasksChecklistElement(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Text = "Checklist element";

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTasksChecklistElement", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTasksChecklistElement", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Text = "New elements text";

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTasksChecklistElement", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTasksChecklistElement");

EndProcedure

Procedure Bitrix24_DeleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_GetTasksChecklist(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTasksChecklist", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTasksChecklist");

EndProcedure

Procedure Bitrix24_GetTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTasksChecklistElement");

EndProcedure

Procedure Bitrix24_CompleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CompleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CompleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_RenewTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenewTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "RenewTasksChecklistElement");

EndProcedure

Procedure Bitrix24_AddTaskTimeAccounting(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Time = 3600;

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL, TaskID, Time);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTaskTimeAccounting", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text      = "Time spent on work";
    UserID    = 10;
    Time      = 7200;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL
        , TaskID
        , Time
        , UserID
        , Text
        , SetupDate
        , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddTaskTimeAccounting", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Text = "The text I forgot last time";
    Time = 4800;

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL, TaskID, RecordID, Time, Text);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Text      = "New time record";
    Time      = 4800;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL, TaskID, RecordID, Time, Text, SetupDate, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_DeleteTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccountingList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskTimeAccountingList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTaskTimeAccountingList");

EndProcedure

Procedure Bitrix24_GetDailyPlan(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDailyPlan(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDailyPlan", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDailyPlan(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDailyPlan");

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

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateChat", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE" , "CHAT");
    ChatStructure.Insert("TITLE", "Private chat");
    ChatStructure.Insert("USERS", MembersArray);

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateChat", , FunctionParameters);

EndProcedure

Procedure Bitrix24_GetChatUsers(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatUsers", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatUsers");

EndProcedure

Procedure Bitrix24_LeaveChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "LeaveChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "LeaveChat");

EndProcedure

Procedure Bitrix24_DeleteUserFromChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteUserFromChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteUserFromChat");

EndProcedure

Procedure Bitrix24_AddUsersToChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserIDs);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddUsersToChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];
    UserID = 10;

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserID, True, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "AddUsersToChat");

EndProcedure

Procedure Bitrix24_ChangeChatTitle(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Title = "New chat title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatTitle", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Title = "Another title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatTitle");

EndProcedure

Procedure Bitrix24_ChangeChatColor(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Color = "AZURE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatColor", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Color = "PURPLE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatColor");

EndProcedure

Procedure Bitrix24_ChangeChatPicture(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Image = FunctionParameters["Picture2"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatPicture", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatPicture");

EndProcedure

Procedure Bitrix24_DisableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DisableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DisableChatNotifications");

EndProcedure

Procedure Bitrix24_EnableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "EnableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "EnableChatNotifications");

EndProcedure

Procedure Bitrix24_ChangeChatOwner(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatOwner", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeChatOwner");

EndProcedure

Procedure Bitrix24_GetChatMessagesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat4";

    Result = OPI_Bitrix24.GetChatMessagesList(URL, ChatID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatMessagesList", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMessagesList(URL, UserID, , 0, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatMessagesList", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MarkMessageAsReaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);
    ChatString = "chat" + ChatID;

    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, ChatString, MessageID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkMessageAsReaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, UserID, MessageID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkMessageAsReaded");

EndProcedure

Procedure Bitrix24_MarkMessageAsUnreaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;
    MessageID  = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, ChatString, MessageID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkMessageAsUnreaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, UserID, MessageID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "MarkMessageAsUnreaded");

EndProcedure

Procedure Bitrix24_GetDialog(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Result = OPI_Bitrix24.GetDialog(URL, ChatString);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDialog", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetDialog(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDialog");

EndProcedure

Procedure Bitrix24_GetChatMembersList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Result = OPI_Bitrix24.GetChatMembersList(URL, ChatString);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatMembersList", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMembersList(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatMembersList");

EndProcedure

Procedure Bitrix24_SendWritingNotification(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Result = OPI_Bitrix24.SendWritingNotification(URL, ChatString);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SendWritingNotification", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendWritingNotification(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SendWritingNotification");

EndProcedure

Procedure Bitrix24_ReadAll(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ReadAll(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ReadAll", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ReadAll(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ReadAll");

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

    Result = OPI_Bitrix24.SendMessage(URL, ChatString, Text, Attachments);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SendMessage", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendMessage(URL, UserID, Text, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SendMessage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_EditMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Text = "New message text";

    Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "EditMessage", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text, Attachments, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "EditMessage");

EndProcedure

Procedure Bitrix24_DeleteMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteMessage", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteMessage");

EndProcedure

Procedure Bitrix24_SetMessageReaction(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetMessageReaction", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetMessageReaction");

EndProcedure

Procedure Bitrix24_GetChatFilesFolder(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatFilesFolder", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatFilesFolder");

EndProcedure

Procedure Bitrix24_SendFile(FunctionParameters)

    URL         = FunctionParameters["Bitrix24_URL"];
    ChatID      = FunctionParameters["Bitrix24_HookChatID"];
    File        = FunctionParameters["Document"]; // Binary data, URL or path to file
    Description = "Very important file";

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID);
    FileID       = UploadedFile["result"]["ID"];

    Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SendFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID, Token);
    FileID       = UploadedFile["result"]["ID"];

    Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SendFile");

EndProcedure

Procedure Bitrix24_GetUsers(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    ArrayOfUsers = New Array;

    ArrayOfUsers.Add(1);
    ArrayOfUsers.Add(10);

    Result = OPI_Bitrix24.GetUsers(URL, ArrayOfUsers);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUsers", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    UserIDs = 10;

    Result = OPI_Bitrix24.GetUsers(URL, UserIDs, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUsers");

EndProcedure

Procedure Bitrix24_GetUserStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserStatus(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserStatus", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserStatus(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserStatus");

EndProcedure

Procedure Bitrix24_SetUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Status = "dnd";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Status = "away";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetUserStatus");

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

    Result = OPI_Bitrix24.CreatePersonalNotification(URL, UserID, Text, , Attachments);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreatePersonalNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Result = OPI_Bitrix24.CreatePersonalNotification(URL, UserID, Text, Tag, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreatePersonalNotification", , FunctionParameters);

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

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, , Attachments);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateSystemNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, Tag, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateSystemNotification", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteNotification(FunctionParameters)

    URL            = FunctionParameters["Bitrix24_URL"];
    NotificationID = FunctionParameters["Bitrix24_PersonalHookNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteNotification", "Hook"); // SKIP

    URL            = FunctionParameters["Bitrix24_Domain"];
    Token          = FunctionParameters["Bitrix24_Token"];
    NotificationID = FunctionParameters["Bitrix24_PersonalNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteNotification");

EndProcedure

Procedure Bitrix24_AddCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Type = "date";
    Name = "BIRTHDAY_FIELD";

    Result = OPI_Bitrix24.AddCustomTaskField(URL, Type, Name);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Type       = "string";
    Name       = "TEXT_FIELD";
    ExternalID = "BITRIX_TEXT_FIELD";
    Title      = "Text field";
    Signature  = New Structure("en,ru", "Some field", "Nekotoroe pole");

    Result = OPI_Bitrix24.AddCustomTaskField(URL, Type, Name, ExternalID, Title, Signature, Token);

    // END

EndProcedure

Procedure Bitrix24_UpdateCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];
    Title   = "New title";

    Result = OPI_Bitrix24.UpdateCustomTaskField(URL, FieldID, , Title);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FieldID    = FunctionParameters["Bitrix24_TaskFieldID"];
    ExternalID = "NEW_TEXT_FIELD";
    Signature  = New Structure("en,ru", "Updated field", "Izmenennoe pole");

    Result = OPI_Bitrix24.UpdateCustomTaskField(URL, FieldID, ExternalID, , Signature, Token);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID, Token);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskFieldsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCustomTaskFieldsList(URL);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCustomTaskFieldsList(URL, Token);

    // END

EndProcedure

Procedure Bitrix24_DeleteCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Result = OPI_Bitrix24.DeleteCustomTaskField(URL, FieldID);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Result = OPI_Bitrix24.DeleteCustomTaskField(URL, FieldID, Token);

    // END

EndProcedure

Procedure Bitrix24_CreateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Name     = "Main department";
    ParentID = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateDepartment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Name     = "Subordinate department";
    ParentID = FunctionParameters["Bitrix24_HookDepID"];
    HeadID   = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID, HeadID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateDepartment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];
    ParentID     = 7;

    Result = OPI_Bitrix24.UpdateDepartment(URL, DepartmentID, , ParentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateDepartment", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    DepartmentID = FunctionParameters["Bitrix24_DepID"];
    Name         = "New department";
    ParentID     = 1;
    HeadID       = 10;

    Result = OPI_Bitrix24.UpdateDepartment(URL
        , DepartmentID
        , Name
        , ParentID
        , HeadID
        , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateDepartment");

EndProcedure

Procedure Bitrix24_DeleteDepartment(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteDepartment", "Hook"); // SKIP

    URL          = FunctionParameters["Bitrix24_Domain"];
    Token        = FunctionParameters["Bitrix24_Token"];
    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteDepartment");

EndProcedure

Procedure Bitrix24_GetDepartments(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.GetDepartments(URL, DepartmentID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDepartments", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    HeadID = 1;

    Result = OPI_Bitrix24.GetDepartments(URL, , , , HeadID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDepartments");

EndProcedure

Procedure Bitrix24_GetCurrentUser(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCurrentUser(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCurrentUser", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCurrentUser(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCurrentUser");

EndProcedure

Procedure Bitrix24_GetUserFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserFieldsStructure");

EndProcedure

Procedure Bitrix24_CreateUser(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_URL"];
    Email = String(New UUID) + "@example.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateUser", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    Email = String(New UUID) + "@example.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"          , Email);
    UserStructure.Insert("NAME"           , "Vitaly");
    UserStructure.Insert("LAST_NAME"      , "Alpaca");
    UserStructure.Insert("PERSONAL_MOBILE", "88003553535");
    UserStructure.Insert("UF_DEPARTMENT"  , 1);

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateUser", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];
    Email  = String(New UUID) + "@example.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 1);

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateUser", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];
    Email  = String(New UUID) + "@example.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("NAME"         , "Oleg");
    UserStructure.Insert("LAST_NAME"    , "Lama");
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateUser");

EndProcedure

Procedure Bitrix24_ChangeUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "ChangeUserStatus");

EndProcedure

Procedure Bitrix24_GetUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUser", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUser");

EndProcedure

Procedure Bitrix24_FindUsers(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FilterStructure = New Structure;
    FilterStructure.Insert("NAME"              , "Vitaly");
    FilterStructure.Insert("LAST_NAME"         , "Alpaca");
    FilterStructure.Insert("WORK_POSITION"     , "DevOps engineer");
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Marketing department");
    FilterStructure.Insert("USER_TYPE"         , "employee");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "FindUsers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "FindUsers");

EndProcedure

Procedure Bitrix24_StartTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.StartTimekeeping(URL);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate() - Hour;
    Report = "Late";

    Result = OPI_Bitrix24.StartTimekeeping(URL, UserID, Time, Report, Token);

    // END

EndProcedure

Procedure Bitrix24_StopTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.StopTimekeeping(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate();
    Report = "Time off";

    Result = OPI_Bitrix24.StopTimekeeping(URL, UserID, Time, Report, Token);

EndProcedure

Procedure Bitrix24_PauseTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.PauseTimekeeping(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.PauseTimekeeping(URL, UserID, Token);

    // END

EndProcedure

Procedure Bitrix24_GetTimekeepingStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTimekeepingStatus(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.GetTimekeepingStatus(URL, UserID, Token);

EndProcedure

Procedure Bitrix24_GetTimekeepingSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL, UserID, Token);

    // END

EndProcedure

Procedure Bitrix24_GetLeadFilterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetLeadFilterStructure(Clear);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetLeadFilterStructure");

EndProcedure

Procedure Bitrix24_GetLeadStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadStructure(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetLeadStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetLeadStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetLeadStructure");

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

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateLead", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("NAME"     , "Ivan");
    FieldsStructure.Insert("LAST_NAME", "Ivanov");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateLead", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateLead(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Lermontov st., b. 20");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Belarus");
    FieldsStructure.Insert("TITLE"          , "SuperClient");

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateLead", "Hook"); // SKIP

    FieldsStructure.Insert("NAME"     , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME", "Evgeniev");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateLead");

EndProcedure

Procedure Bitrix24_DeleteLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteLead");

EndProcedure

Procedure Bitrix24_GetLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetLead");

EndProcedure

Procedure Bitrix24_GetLeadsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadsList(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetLeadsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Result = OPI_Bitrix24.GetLeadsList(URL, Filter, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetLeadsList");

EndProcedure

Procedure Bitrix24_GetDealsFilterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetDealsFilterStructure(Clear);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDealsFilterStructure");

EndProcedure

Procedure Bitrix24_GetDealStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealStructure(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDealStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDealStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDealStructure");

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

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateDeal", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("TITLE"    , "Another deal");
    FieldsStructure.Insert("CLOSEDATE", "2031-01-01");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateDeal", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateDeal(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"      , "Sale in RUB");
    FieldsStructure.Insert("CURRENCY_ID", "RUB");
    FieldsStructure.Insert("OPPORTUNITY", 50000);

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateDeal", "Hook"); // SKIP

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateDeal");

EndProcedure

Procedure Bitrix24_GetDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDeal");

EndProcedure

Procedure Bitrix24_DeleteDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteDeal");

EndProcedure

Procedure Bitrix24_GetDealsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealsList(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDealsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Result = OPI_Bitrix24.GetDealsList(URL, Filter, , Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetDealsList");

EndProcedure

Procedure Bitrix24_GetTasksFilterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetTasksFilterStructure(Clear);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetTasksFilterStructure");

EndProcedure

Procedure Bitrix24_GetCommentStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetCommentStructure(Clear);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCommentStructure");

EndProcedure

Procedure Bitrix24_GetChatStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetChatStructure(Clear);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetChatStructure");

EndProcedure

Procedure Bitrix24_GetPictureBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Picture"];

    Result = OPI_Bitrix24.GetPictureBlock(Name, URL);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetPictureBlock");

EndProcedure

Procedure Bitrix24_GetFileBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Document"];

    Result = OPI_Bitrix24.GetFileBlock(Name, URL);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetFileBlock");

EndProcedure

Procedure Bitrix24_GetUserFilterStructure(FunctionParameters)

    Clear  = False;
    Result = OPI_Bitrix24.GetUserFilterStructure(Clear);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserFilterStructure");

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

    Result = OPI_Bitrix24.CreateCalendar(URL, CalendarsStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateCalendar", "Hook", FunctionParameters); // SKIP

    CalendarsStructure.Insert("name"       , "Another calendar");
    CalendarsStructure.Insert("description", "My other new calendar");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateCalendar(URL, CalendarsStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateCalendar", , FunctionParameters);

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

    Result = OPI_Bitrix24.UpdateCalendar(URL, CalendarID, CalendarsStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.UpdateCalendar(URL, CalendarID, CalendarsStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateCalendar");

EndProcedure

Procedure Bitrix24_DeleteCalendar(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];
    OwnerID    = 1;
    Type       = "user";

    Result = OPI_Bitrix24.DeleteCalendar(URL, CalendarID, OwnerID, Type);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.DeleteCalendar(URL, CalendarID, OwnerID, Type, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteCalendar");

EndProcedure

Procedure Bitrix24_GetCalendarStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalendarStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarStructure");

    Result = OPI_Bitrix24.GetCalendarStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarList(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Result = OPI_Bitrix24.GetCalendarList(URL, OwnerID, Type);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCalendarList(URL, OwnerID, Type, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarList");

EndProcedure

Procedure Bitrix24_GetCalendarSettingsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCalendarSettingsStructure(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarSettingsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCalendarSettingsStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarSettingsStructure");

EndProcedure

Procedure Bitrix24_GetCalednarCustomSettingsStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalednarCustomSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalednarCustomSettingsStructure");

    Result = OPI_Bitrix24.GetCalednarCustomSettingsStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalednarCustomSettingsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCustomCalendarSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCustomCalendarSettings(URL);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCustomCalendarSettings(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCustomCalendarSettings");

EndProcedure

Procedure Bitrix24_SetCustomCalendarSettings(FunctionParameters)

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("view"              , "month");
    CalendarsStructure.Insert("showDeclined"      , "Y");
    CalendarsStructure.Insert("collapseOffHours"  , "N");
    CalendarsStructure.Insert("showCompletedTasks", "N");

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.SetCustomCalendarSettings(URL, CalendarsStructure);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.SetCustomCalendarSettings(URL, CalendarsStructure, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetCustomCalendarSettings");

EndProcedure

Procedure Bitrix24_GetUserBusy(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    User = 1;

    Week        = 604800;
    CurrentDate = OPI_Tools.GetCurrentDate();

    StartDate = CurrentDate;
    EndDate   = CurrentDate + Week;

    Result = OPI_Bitrix24.GetUserBusy(URL, User, StartDate, EndDate);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserBusy", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.GetUserBusy(URL, User, StartDate, EndDate, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserBusy");

EndProcedure

Procedure Bitrix24_CreateCalendarEvent(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    Tomorrow = OPI_Tools.GetCurrentDate() + 86400;
    Hour     = 3600;

    EventStucture = New Structure;

    EventStucture.Insert("type"         , "user");
    EventStucture.Insert("ownerId"      , 1);
    EventStucture.Insert("from"         , OPI_Tools.GetXMLString(Tomorrow));
    EventStucture.Insert("to"           , OPI_Tools.GetXMLString(Tomorrow + Hour));
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
    RepeatabilityStructure.Insert("UNTIL", (Tomorrow + Hour * 24 * 10));

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

    Result = OPI_Bitrix24.CreateCalendarEvent(URL, EventStucture);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    EventStucture.Insert("section", CalendarID);

    Result = OPI_Bitrix24.CreateCalendarEvent(URL, EventStucture, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "CreateCalendarEvent", , FunctionParameters);

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

    Result = OPI_Bitrix24.UpdateCalendarEvent(URL, EventID, EventStucture);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    EventID    = FunctionParameters["Bitrix24_CEventID"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Result = OPI_Bitrix24.UpdateCalendarEvent(URL, EventID, EventStucture, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "UpdateCalendarEvent", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Result = OPI_Bitrix24.DeleteCalendarEvent(URL, EventID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.DeleteCalendarEvent(URL, EventID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "DeleteCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Result = OPI_Bitrix24.GetCalendarEvent(URL, EventID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.GetCalendarEvent(URL, EventID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvents(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Result = OPI_Bitrix24.GetCalendarEvents(URL, OwnerID, Type);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEvents", "Hook"); // SKIP

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

    Result = OPI_Bitrix24.GetCalendarEvents(URL, OwnerID, Type, Filter, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEvents");

EndProcedure

Procedure Bitrix24_SetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];
    Status  = "Y";

    Result = OPI_Bitrix24.SetUserParticipationStatus(URL, EventID, Status);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.SetUserParticipationStatus(URL, EventID, Status, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "SetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Result = OPI_Bitrix24.GetUserParticipationStatus(URL, EventID);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Result = OPI_Bitrix24.GetUserParticipationStatus(URL, EventID, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetCalendarEventsStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalendarEventsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEventsStructure");

    Result = OPI_Bitrix24.GetCalendarEventsStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEventsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarEventsFilterStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCalendarEventsFilterStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEventsFilterStructure");

    Result = OPI_Bitrix24.GetCalendarEventsFilterStructure(True);

    OPI_TestDataRetrieval.Process(Result, "Bitrix24", "GetCalendarEventsFilterStructure", "Clear");

EndProcedure

#EndRegion // Bitrix24

#EndRegion // AtomicTests

#EndRegion // Private

#EndIf // !OPI
