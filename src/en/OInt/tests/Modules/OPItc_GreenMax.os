// OneScript: ./OInt/tests/Modules/OPItc_GreenMax.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("GreenMax");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("GreenMax");

EndFunction

#Region Internal

#Region RunnableTests

#Region GreenMax

Procedure GMax_Account() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    //OPI_TestDataRetrieval.ParameterToCollection("GreenMax_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);

    GreenMax_FormAccessParameters(TestParameters);
    // !DISABLED! GreenMax_LogoutInstance(TestParameters);
    // !DISABLED! GreenMax_GetAuthorizationCode(TestParameters);
    // !DISABLED! GreenMax_SendAuthorizationCode(TestParameters);
    GreenMax_GetInstanceStatus(TestParameters);
    GreenMax_GetInstanceSettings(TestParameters);
    GreenMax_SetInstanceSettings(TestParameters);
    GreenMax_GetInstanceSettingsStructure(TestParameters);
    GreenMax_SetProfilePicture(TestParameters);
    GreenMax_GetAccountInformation(TestParameters);
    GreenMax_CheckAccount(TestParameters);
    GreenMax_GetContactList(TestParameters);
    GreenMax_GetContactInformation(TestParameters);
    GreenMax_GetChatList(TestParameters);
    GreenMax_GetChatAvatar(TestParameters);
    GreenMax_RebootInstance(TestParameters);

EndProcedure

Procedure GMax_GroupManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MainGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture3"            , TestParameters);

    GreenMax_GetContactList(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_CreateGroup(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetGroupInformation(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_UpdateGroupName(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_ChangeGroupSettings(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SetAdminRights(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_RevokeAdminRights(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_RemoveGroupMember(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_AddGroupMember(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SetGroupPicture(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_LeaveGroup(TestParameters);
    GreenMax_GetGroupSettingsStructure(TestParameters);

EndProcedure

Procedure GMax_MessageSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"               , TestParameters);

    GreenMax_GetContactList(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_CreateGroup(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SendTextMessage(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SendFile(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_SendFileByURL(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_RemoveGroupMember(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_LeaveGroup(TestParameters);
    OPI_Tools.Pause(1);

EndProcedure

Procedure GMax_Notifications() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);

    GreenMax_GetNotification(TestParameters);
    GreenMax_DeleteNotification(TestParameters);

EndProcedure

Procedure GMax_MessageHistory() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MainGroupID", TestParameters);

    GreenMax_MarkMessagesAsRead(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetChatMessageHistory(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetChatMessage(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetIncomingMessageLog(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetOutgoingMessageLog(TestParameters);
    OPI_Tools.Pause(1);

EndProcedure

Procedure GMax_Queues() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_Phone"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenMax_MainGroupID", TestParameters);

    GreenMax_GetOutgoingMessageCount(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetOutgoingMessageQueue(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_ClearOutgoingMessageQueue(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_GetIncomingNotificationCount(TestParameters);
    OPI_Tools.Pause(1);
    GreenMax_ClearIncomingNotificationQueue(TestParameters);
    OPI_Tools.Pause(1);

EndProcedure

#EndRegion // GreenMax

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region GreenMax

Procedure GreenMax_FormAccessParameters(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "FormAccessParameters");

EndProcedure

Procedure GreenMax_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    PhoneNumber = 441234567890;

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("phone", PhoneNumber);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetAuthorizationCode", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetAuthorizationCode");

EndProcedure

Procedure GreenMax_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "LogoutInstance", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "LogoutInstance");

EndProcedure

Procedure GreenMax_SendAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AuthCode = 123456;

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("code", AuthCode);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SendAuthorizationCode", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendAuthorizationCode");

EndProcedure

Procedure GreenMax_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetInstanceStatus", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetInstanceStatus");

EndProcedure

Procedure GreenMax_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "RebootInstance", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "RebootInstance");

EndProcedure

Procedure GreenMax_GetInstanceSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetInstanceSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetInstanceSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetInstanceSettingsStructure", Options);

    OPI_TestDataRetrieval.Process(Result, "GreenMAx", "GetInstanceSettingsStructure", "Clear");

EndProcedure

Procedure GreenMax_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetInstanceSettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetInstanceSettings", , FunctionParameters);

EndProcedure

Procedure GreenMax_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("markIncomingMessagesReaded" , "no");
    SettingsStructure.Insert("outgoingWebhook"            , "no");
    SettingsStructure.Insert("outgoingAPIMessageWebhook"  , "yes");

    Options = New Structure;
    Options.Insert("settings", SettingsStructure);
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SetInstanceSettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SetInstanceSettings");

EndProcedure

Procedure GreenMax_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SetProfilePicture", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SetProfilePicture");

EndProcedure

Procedure GreenMax_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetAccountInformation", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetAccountInformation");

EndProcedure

Procedure GreenMax_CheckAccount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    PhoneNumber = 441234567890;
    PhoneNumber = FunctionParameters["GreenMax_Phone"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("phone", PhoneNumber);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "CheckAccount", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "CheckAccount", , FunctionParameters);

EndProcedure

Procedure GreenMax_GetContactList(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Count = 1;

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("count", Count);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetContactList", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetContactList", , FunctionParameters);

EndProcedure

Procedure GreenMax_GetContactInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ContactID = 87654321;
    ContactID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ContactID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetContactInformation", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetContactInformation");

EndProcedure

Procedure GreenMax_GetChatList(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetChatList", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetChatList");

EndProcedure

Procedure GreenMax_GetChatAvatar(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 87654321;
    ChatID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetChatAvatar", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetChatAvatar");

EndProcedure

Procedure GreenMax_CreateGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    UserID = 87654321;
    Name   = "New group";

    UserID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("name", Name);
    Options.Insert("members", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "CreateGroup", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "CreateGroup", , FunctionParameters);

EndProcedure

Procedure GreenMax_AddGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_GroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("member", MemberID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "AddGroupMember", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "AddGroupMember");

    GreenMax_RemoveGroupMember(FunctionParameters);

EndProcedure

Procedure GreenMax_RemoveGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_GroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("member", MemberID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "RemoveGroupMember", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "RemoveGroupMember");

EndProcedure

Procedure GreenMax_LeaveGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "LeaveGroup", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "LeaveGroup");

EndProcedure

Procedure GreenMax_UpdateGroupName(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Name   = "New group name";
    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("name", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "UpdateGroupName", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "UpdateGroupName");

EndProcedure

Procedure GreenMax_GetGroupInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetGroupInformation", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetGroupInformation");

EndProcedure

Procedure GreenMax_ChangeGroupSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Settings = New Structure;
    Settings.Insert("allowParticipantsEditGroupSettings" , True);
    Settings.Insert("allowParticipantsPinMessages"       , False);
    Settings.Insert("allowParticipantsAddMembers"        , False);

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("set", Settings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "ChangeGroupSettings", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "ChangeGroupSettings");

EndProcedure

Procedure GreenMax_GetGroupSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetGroupSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetGroupSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetGroupSettingsStructure", Options);

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetGroupSettingsStructure", "Clear");

EndProcedure

Procedure GreenMax_SetAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_MainGroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("member", MemberID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SetAdminRights", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SetAdminRights");

EndProcedure

Procedure GreenMax_RevokeAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID   = 12345678;
    MemberID = 87654321;

    ChatID   = FunctionParameters["GreenMax_MainGroupID"]; // SKIP
    MemberID = FunctionParameters["GreenMax_ContactID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("member", MemberID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "RevokeAdminRights", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "RevokeAdminRights");

EndProcedure

Procedure GreenMax_SetGroupPicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Image  = FunctionParameters["Picture3"]; // URL, Path or Binary Data
    ChatID = 12345678;

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SetGroupPicture", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SetGroupPicture");

EndProcedure

Procedure GreenMax_SendTextMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Text   = "Message text";
    ChatID = 12345678;
    Set    = 2000;

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("typing", Set);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SendTextMessage", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendTextMessage", , FunctionParameters);

EndProcedure

Procedure GreenMax_SendFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = "photo.jpg";
    ChatID      = 12345678;
    Description = "File description";

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SendFile", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendFile", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);
    Options.Insert("typing", 1000);
    Options.Insert("ttype", "video");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SendFile", Options);

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendFile", "Video");

EndProcedure

Procedure GreenMax_SendFileByURL(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    File        = FunctionParameters["Picture"];
    FileName    = "photo.jpg";
    ChatID      = 12345678;
    Description = "File description";

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("url", File);
    Options.Insert("filename", FileName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SendFileByURL", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendFileByURL");

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("url", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);
    Options.Insert("typing", 1000);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "SendFileByURL", Options);

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendFileByURL", "Typing");

EndProcedure

Procedure GreenMax_GetNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetNotification", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetNotification", , FunctionParameters);

EndProcedure

Procedure GreenMax_DeleteNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    NotificationID = FunctionParameters["GreenMax_ReceiptID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("id", NotificationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "DeleteNotification", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "DeleteNotification", , FunctionParameters);

EndProcedure

Procedure GreenMax_MarkMessagesAsRead(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;

    ChatID = FunctionParameters["GreenMax_MainGroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "MarkMessagesAsRead", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "MarkMessagesAsRead");

EndProcedure

Procedure GreenMax_GetChatMessageHistory(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID = 12345678;
    Count  = 3;

    ChatID = FunctionParameters["GreenMax_MainGroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("count", Count);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetChatMessageHistory", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetChatMessageHistory", , FunctionParameters);

EndProcedure

Procedure GreenMax_GetChatMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    ChatID    = 12345678;
    MessageID = FunctionParameters["GreenMax_MainMessageID"];

    ChatID = FunctionParameters["GreenMax_MainGroupID"]; // SKIP

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetChatMessage", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetChatMessage", , MessageID);

EndProcedure

Procedure GreenMax_GetIncomingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Period = 30;

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("span", Period);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetIncomingMessageLog", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetIncomingMessageLog");

EndProcedure

Procedure GreenMax_GetOutgoingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Period = 30;

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("span", Period);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetOutgoingMessageLog", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetOutgoingMessageLog");

EndProcedure

Procedure GreenMax_GetOutgoingMessageCount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetOutgoingMessageCount", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetOutgoingMessageCount");

EndProcedure

Procedure GreenMax_GetOutgoingMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetOutgoingMessageQueue", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetOutgoingMessageQueue");

EndProcedure

Procedure GreenMax_ClearOutgoingMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "ClearOutgoingMessageQueue", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "ClearOutgoingMessageQueue");

EndProcedure

Procedure GreenMax_GetIncomingNotificationCount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "GetIncomingNotificationCount", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetIncomingNotificationCount");

EndProcedure

Procedure GreenMax_ClearIncomingNotificationQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenmax", "ClearIncomingNotificationQueue", Options);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "ClearIncomingNotificationQueue");

EndProcedure

#EndRegion // GreenMax

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure GMax_Аккаунт() Export
    GMax_Account();
EndProcedure

Procedure GMax_РаботаСГруппами() Export
    GMax_GroupManagement();
EndProcedure

Procedure GMax_ОтправкаСообщений() Export
    GMax_MessageSending();
EndProcedure

Procedure GMax_Уведомления() Export
    GMax_Notifications();
EndProcedure

Procedure GMax_ИсторияСообщений() Export
    GMax_MessageHistory();
EndProcedure

Procedure GMax_Очереди() Export
    GMax_Queues();
EndProcedure

#EndRegion
