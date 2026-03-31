// OneScript: ./OInt/tests/Modules/OPIt_ReportPortal.os

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

#Use oint
#Use asserts
#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("ReportPortal");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("ReportPortal");

EndFunction

#Region Internal

#Region RunnableTests

#Region ReportPortal

Procedure RPortal_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_URL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_Login"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_UserID"  , TestParameters);

    ReportPortal_GetTemporaryToken(TestParameters);
    ReportPortal_GetPermanentToken(TestParameters);
    ReportPortal_DeletePermanentToken(TestParameters);
    ReportPortal_GetUserTokens(TestParameters);

EndProcedure

Procedure RPortal_TestManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_TempToken", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_URL"      , TestParameters);

    ReportPortal_CreateLaunch(TestParameters);
    ReportPortal_GetLaunch(TestParameters);
    ReportPortal_GetLaunchItems(TestParameters);
    ReportPortal_UpdateLaunch(TestParameters);
    ReportPortal_CreateItem(TestParameters);
    ReportPortal_GetItem(TestParameters);
    ReportPortal_GetItemLogs(TestParameters);
    ReportPortal_UpdateItem(TestParameters);
    ReportPortal_FinishItem(TestParameters);
    ReportPortal_FinishLaunch(TestParameters);
    ReportPortal_DeleteItem(TestParameters);
    ReportPortal_GetLaunchReport(TestParameters);
    ReportPortal_DeleteLaunch(TestParameters);
    ReportPortal_GetLaunchStructure(TestParameters);
    ReportPortal_GetItemStructure(TestParameters);
    ReportPortal_GetItemCompletionStructure(TestParameters);
    ReportPortal_GetLaunchCompletionStructure(TestParameters);

EndProcedure

Procedure RPortal_LogRecording() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_TempToken", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_URL"      , TestParameters);

    ReportPortal_CreateLaunch(TestParameters);
    ReportPortal_CreateItem(TestParameters);

    ReportPortal_WriteLog(TestParameters);
    ReportPortal_GetLogStructure(TestParameters);
    ReportPortal_GetLog(TestParameters);
    ReportPortal_DeleteLog(TestParameters);

    ReportPortal_FinishItem(TestParameters);
    ReportPortal_FinishLaunch(TestParameters);

EndProcedure

Procedure RPortal_ProjectManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_TempToken", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_URL"      , TestParameters);

    ReportPortal_CreateProject(TestParameters);
    ReportPortal_GetProject(TestParameters);
    ReportPortal_GetProjects(TestParameters);
    ReportPortal_AddUsersToProject(TestParameters);
    ReportPortal_ExcludeUsersFromProject(TestParameters);
    ReportPortal_DeleteProject(TestParameters);

EndProcedure

Procedure RPortal_UserManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_TempToken", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_URL"      , TestParameters);

    ReportPortal_CreateUser(TestParameters);
    ReportPortal_GetCurrentUser(TestParameters);
    ReportPortal_GetUser(TestParameters);
    ReportPortal_GetUsers(TestParameters);
    ReportPortal_GetUserProjects(TestParameters);
    ReportPortal_UpdateUser(TestParameters);
    ReportPortal_DeleteUser(TestParameters);
    ReportPortal_GetUserFieldsStructure(TestParameters);

EndProcedure

#EndRegion // ReportPortal

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region ReportPortal

Procedure ReportPortal_GetTemporaryToken(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Login    = FunctionParameters["RPortal_Login"];
    Password = FunctionParameters["RPortal_Password"];

    Result = OPI_ReportPortal.GetTemporaryToken(URL, Login, Password);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetTemporaryToken", , FunctionParameters);

EndProcedure

Procedure ReportPortal_GetPermanentToken(FunctionParameters)

    URL     = FunctionParameters["RPortal_URL"];
    Token   = FunctionParameters["RPortal_TempToken"];
    UserID  = FunctionParameters["RPortal_UserID"];
    KeyName = "test_key_2";

    Result = OPI_ReportPortal.GetPermanentToken(URL, Token, UserID, KeyName);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetPermanentToken", , FunctionParameters);

EndProcedure

Procedure ReportPortal_DeletePermanentToken(FunctionParameters)

    URL    = FunctionParameters["RPortal_URL"];
    Token  = FunctionParameters["RPortal_TestApiKey"];
    UserID = FunctionParameters["RPortal_UserID"];
    KeyID  = FunctionParameters["RPortal_TestKeyID"];

    Result = OPI_ReportPortal.DeletePermanentToken(URL, Token, UserID, KeyID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "DeletePermanentToken");

EndProcedure

Procedure ReportPortal_GetUserTokens(FunctionParameters)

    URL    = FunctionParameters["RPortal_URL"];
    Token  = FunctionParameters["RPortal_TempToken"];
    UserID = FunctionParameters["RPortal_UserID"];

    Result = OPI_ReportPortal.GetUserTokens(URL, Token, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetUserTokens");

EndProcedure

Procedure ReportPortal_CreateLaunch(FunctionParameters)

    URL     = FunctionParameters["RPortal_URL"];
    Token   = FunctionParameters["RPortal_TempToken"];
    Project = "Test";

    StartDate = Date("20260101100000");

    LaunchStructure = New Structure;
    LaunchStructure.Insert("name"       , "Test");
    LaunchStructure.Insert("startTime"  , StartDate);
    LaunchStructure.Insert("description", "Test launch");

    Result = OPI_ReportPortal.CreateLaunch(URL, Token, Project, LaunchStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "CreateLaunch", , FunctionParameters);

EndProcedure

Procedure ReportPortal_FinishLaunch(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Token    = FunctionParameters["RPortal_TempToken"];
    LaunchID = FunctionParameters["RPortal_TestLaunch"];
    Project  = "Test";

    EndDate         = Date("20260101200000");
    FinishStructure = OPI_ReportPortal.GetLaunchCompletionStructure(EndDate
        , "passed"
        , "Updated launch description");

    Result = OPI_ReportPortal.FinishLaunch(URL, Token, Project, LaunchID, FinishStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "FinishLaunch");

EndProcedure

Procedure ReportPortal_CreateItem(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Token    = FunctionParameters["RPortal_TempToken"];
    LaunchID = FunctionParameters["RPortal_TestLaunch"];
    Project  = "Test";

    StartDate = Date("20260101100000");

    ElementStructure = New Structure;
    ElementStructure.Insert("name"       , "Test");
    ElementStructure.Insert("startTime"  , StartDate);
    ElementStructure.Insert("type"       , "test");
    ElementStructure.Insert("description", "Test launch");
    ElementStructure.Insert("launchUuid" , LaunchID);

    Result = OPI_ReportPortal.CreateItem(URL, Token, Project, ElementStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "CreateItem", , FunctionParameters);

EndProcedure

Procedure ReportPortal_FinishItem(FunctionParameters)

    URL       = FunctionParameters["RPortal_URL"];
    Token     = FunctionParameters["RPortal_TempToken"];
    ElementID = FunctionParameters["RPortal_TestItem"];
    Project   = "Test";

    EndDate = Date("20260101200000");

    FinishStructure = New Structure;
    FinishStructure.Insert("endTime", EndDate);
    FinishStructure.Insert("status" , "passed");

    Result = OPI_ReportPortal.FinishItem(URL, Token, Project, ElementID, FinishStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "FinishItem");

EndProcedure

Procedure ReportPortal_GetLaunchStructure(FunctionParameters)

    Result = OPI_ReportPortal.GetLaunchStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLaunchStructure");

    Result = OPI_ReportPortal.GetLaunchStructure(True);

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLaunchStructure", "Clear");

EndProcedure

Procedure ReportPortal_GetItemStructure(FunctionParameters)

    Result = OPI_ReportPortal.GetItemStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetItemStructure");

    Result = OPI_ReportPortal.GetItemStructure(True);

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetItemStructure", "Clear");

EndProcedure

Procedure ReportPortal_GetItemCompletionStructure(FunctionParameters)

    Result = OPI_ReportPortal.GetItemCompletionStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetItemCompletionStructure");

    Result = OPI_ReportPortal.GetItemCompletionStructure(True);

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetItemCompletionStructure", "Clear");

EndProcedure

Procedure ReportPortal_GetLaunchCompletionStructure(FunctionParameters)

    Time        = Date("20260101100000");
    Status      = "passed";
    Description = "Some test";
    Attributes  = "key1:value1, key2:value2";

    Result = OPI_ReportPortal.GetLaunchCompletionStructure(Time, Status, Description, Attributes);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLaunchCompletionStructure");

EndProcedure

Procedure ReportPortal_WriteLog(FunctionParameters)

    URL       = FunctionParameters["RPortal_URL"];
    Token     = FunctionParameters["RPortal_TempToken"];
    LaunchID  = FunctionParameters["RPortal_TestLaunch"];
    ElementID = FunctionParameters["RPortal_TestItem"];
    Project   = "Test";
    Time      = Date("20260101100010");
    Text      = "Some log 1";

    LogStructure = OPI_ReportPortal.GetLogStructure(LaunchID, ElementID, Time, Text);
    Result       = OPI_ReportPortal.WriteLog(URL, Token, Project, LogStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "WriteLog", , FunctionParameters);

EndProcedure

Procedure ReportPortal_GetLogStructure(FunctionParameters)

    URL       = FunctionParameters["RPortal_URL"];
    Token     = FunctionParameters["RPortal_TempToken"];
    LaunchID  = FunctionParameters["RPortal_TestLaunch"];
    ElementID = FunctionParameters["RPortal_TestItem"];
    Project   = "Test";
    Time      = Date("20260101100010");
    Text      = "Some log";

    Result = OPI_ReportPortal.GetLogStructure(LaunchID, ElementID, Time, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLogStructure");

EndProcedure

Procedure ReportPortal_GetLog(FunctionParameters)

    URL     = FunctionParameters["RPortal_URL"];
    Token   = FunctionParameters["RPortal_TempToken"];
    LogUUID = FunctionParameters["RPortal_TestLog"];
    Project = "Test";

    Result = OPI_ReportPortal.GetLog(URL, Token, Project, LogUUID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLog", , FunctionParameters);

EndProcedure

Procedure ReportPortal_DeleteLog(FunctionParameters)

    URL     = FunctionParameters["RPortal_URL"];
    Token   = FunctionParameters["RPortal_TempToken"];
    LogID   = FunctionParameters["RPortal_TestLogId"];
    Project = "Test";

    Result = OPI_ReportPortal.DeleteLog(URL, Token, Project, LogID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "DeleteLog");

EndProcedure

Procedure ReportPortal_CreateProject(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];
    Name  = "testproject";

    Result = OPI_ReportPortal.CreateProject(URL, Token, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "CreateProject", , FunctionParameters);

EndProcedure

Procedure ReportPortal_DeleteProject(FunctionParameters)

    URL       = FunctionParameters["RPortal_URL"];
    Token     = FunctionParameters["RPortal_TempToken"];
    ProjectID = FunctionParameters["RPortal_TestProject"];

    Result = OPI_ReportPortal.DeleteProject(URL, Token, ProjectID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "DeleteProject");

EndProcedure

Procedure ReportPortal_GetProject(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];
    Name  = "TestProject";

    Result = OPI_ReportPortal.GetProject(URL, Token, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetProject");

EndProcedure

Procedure ReportPortal_GetProjects(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];

    Result = OPI_ReportPortal.GetProjects(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetProjects");

EndProcedure

Procedure ReportPortal_AddUsersToProject(FunctionParameters)

    URL         = FunctionParameters["RPortal_URL"];
    Token       = FunctionParameters["RPortal_TempToken"];
    ProjectName = "TestProject";

    UserList = New Map;
    UserList.Insert("default", "MEMBER");

    Result = OPI_ReportPortal.AddUsersToProject(URL, Token, ProjectName, UserList);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "AddUsersToProject");

EndProcedure

Procedure ReportPortal_ExcludeUsersFromProject(FunctionParameters)

    URL         = FunctionParameters["RPortal_URL"];
    Token       = FunctionParameters["RPortal_TempToken"];
    ProjectName = "TestProject";

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("default");

    Result = OPI_ReportPortal.ExcludeUsersFromProject(URL, Token, ProjectName, ArrayOfUsers);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "ExcludeUsersFromProject");

EndProcedure

Procedure ReportPortal_GetLaunch(FunctionParameters)

    URL        = FunctionParameters["RPortal_URL"];
    Token      = FunctionParameters["RPortal_TempToken"];
    LaunchUUID = FunctionParameters["RPortal_TestLaunch"];
    Project    = "Test";

    Result = OPI_ReportPortal.GetLaunch(URL, Token, Project, LaunchUUID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLaunch", , FunctionParameters);

EndProcedure

Procedure ReportPortal_GetLaunchItems(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Token    = FunctionParameters["RPortal_TempToken"];
    LaunchID = FunctionParameters["RPortal_TestLaunchId"];
    Project  = "Test";

    Result = OPI_ReportPortal.GetLaunchItems(URL, Token, Project, LaunchID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLaunchItems");

EndProcedure

Procedure ReportPortal_GetItem(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Token    = FunctionParameters["RPortal_TempToken"];
    ItemUUID = FunctionParameters["RPortal_TestItem"];
    Project  = "Test";

    Result = OPI_ReportPortal.GetItem(URL, Token, Project, ItemUUID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetItem", , FunctionParameters);

EndProcedure

Procedure ReportPortal_GetItemLogs(FunctionParameters)

    URL       = FunctionParameters["RPortal_URL"];
    Token     = FunctionParameters["RPortal_TempToken"];
    ElementID = FunctionParameters["RPortal_TestItemId"];
    Project   = "Test";

    Result = OPI_ReportPortal.GetItemLogs(URL, Token, Project, ElementID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetItemLogs");

EndProcedure

Procedure ReportPortal_UpdateLaunch(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Token    = FunctionParameters["RPortal_TempToken"];
    LaunchID = FunctionParameters["RPortal_TestLaunchId"];
    Project  = "Test";

    LaunchStructure = New Structure;
    LaunchStructure.Insert("description", "New description");

    Result = OPI_ReportPortal.UpdateLaunch(URL, Token, Project, LaunchID, LaunchStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "UpdateLaunch");

EndProcedure

Procedure ReportPortal_UpdateItem(FunctionParameters)

    URL       = FunctionParameters["RPortal_URL"];
    Token     = FunctionParameters["RPortal_TempToken"];
    ElementID = FunctionParameters["RPortal_TestItemId"];
    Project   = "Test";

    LaunchStructure = New Structure;
    LaunchStructure.Insert("description", "New description");

    Result = OPI_ReportPortal.UpdateItem(URL, Token, Project, ElementID, LaunchStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "UpdateItem");

EndProcedure

Procedure ReportPortal_DeleteLaunch(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Token    = FunctionParameters["RPortal_TempToken"];
    LaunchID = FunctionParameters["RPortal_TestLaunchId"];
    Project  = "Test";

    Result = OPI_ReportPortal.DeleteLaunch(URL, Token, Project, LaunchID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "DeleteLaunch");

EndProcedure

Procedure ReportPortal_DeleteItem(FunctionParameters)

    URL       = FunctionParameters["RPortal_URL"];
    Token     = FunctionParameters["RPortal_TempToken"];
    ElementID = FunctionParameters["RPortal_TestItemId"];
    Project   = "Test";

    Result = OPI_ReportPortal.DeleteItem(URL, Token, Project, ElementID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "DeleteItem");

EndProcedure

Procedure ReportPortal_GetLaunchReport(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Token    = FunctionParameters["RPortal_TempToken"];
    LaunchID = FunctionParameters["RPortal_TestLaunchId"];
    Project  = "Test";

    Result = OPI_ReportPortal.GetLaunchReport(URL, Token, Project, LaunchID, "html");

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetLaunchReport");

EndProcedure

Procedure ReportPortal_CreateUser(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];
    Name  = "testproject";

    UserStructure = New Structure;
    UserStructure.Insert("active"        , True);
    UserStructure.Insert("login"         , "test");
    UserStructure.Insert("password"      , "G00d_Pass");
    UserStructure.Insert("fullName"      , "Test User");
    UserStructure.Insert("email"         , "test@example.com");
    UserStructure.Insert("accountRole"   , "USER");
    UserStructure.Insert("projectRole"   , "MEMBER");
    UserStructure.Insert("defaultProject", "test");

    Result = OPI_ReportPortal.CreateUser(URL, Token, UserStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "CreateUser", , FunctionParameters);

EndProcedure

Procedure ReportPortal_DeleteUser(FunctionParameters)

    URL    = FunctionParameters["RPortal_URL"];
    Token  = FunctionParameters["RPortal_TempToken"];
    UserID = FunctionParameters["RPortal_TestUser"];

    Result = OPI_ReportPortal.DeleteUser(URL, Token, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "DeleteUser");

EndProcedure

Procedure ReportPortal_GetUserFieldsStructure(FunctionParameters)

    Result = OPI_ReportPortal.GetUserFieldsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetUserFieldsStructure");

    Result = OPI_ReportPortal.GetUserFieldsStructure(True);

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetUserFieldsStructure", "Clear");

EndProcedure

Procedure ReportPortal_UpdateUser(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];
    Login = "test";

    UserStructure = New Structure;
    UserStructure.Insert("fullName", "Updated Test User");
    UserStructure.Insert("email"   , "updated@example.com");

    Result = OPI_ReportPortal.UpdateUser(URL, Token, Login, UserStructure);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "UpdateUser");

EndProcedure

Procedure ReportPortal_GetCurrentUser(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];

    Result = OPI_ReportPortal.GetCurrentUser(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetCurrentUser");

EndProcedure

Procedure ReportPortal_GetUser(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];
    Login = "test";

    Result = OPI_ReportPortal.GetUser(URL, Token, Login);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetUser");

EndProcedure

Procedure ReportPortal_GetUsers(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];

    Result = OPI_ReportPortal.GetUsers(URL, Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetUsers");

EndProcedure

Procedure ReportPortal_GetUserProjects(FunctionParameters)

    URL   = FunctionParameters["RPortal_URL"];
    Token = FunctionParameters["RPortal_TempToken"];
    Login = "test";

    Result = OPI_ReportPortal.GetUserProjects(URL, Token, Login);

    // END

    OPI_TestDataRetrieval.Process(Result, "ReportPortal", "GetUserProjects");

EndProcedure

#EndRegion // ReportPortal

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure RPortal_Авторизация() Export
    RPortal_Authorization();
EndProcedure

Procedure RPortal_УправлениеТестами() Export
    RPortal_TestManagement();
EndProcedure

Procedure RPortal_ЗаписьЛогов() Export
    RPortal_LogRecording();
EndProcedure

Procedure RPortal_УправлениеПроектами() Export
    RPortal_ProjectManagement();
EndProcedure

Procedure RPortal_УправлениеПользователями() Export
    RPortal_UserManagement();
EndProcedure

#EndRegion