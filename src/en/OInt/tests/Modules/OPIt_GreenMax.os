// OneScript: ./OInt/tests/Modules/OPIt_GreenMax.os

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

    OPI_TestDataRetrieval.FormYAXTests("GreenMax");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("GreenMax");

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

    Result = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "FormAccessParameters");

EndProcedure

Procedure GreenMax_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    PhoneNumber = 441234567890;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetAuthorizationCode(AccessParameters, PhoneNumber);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetAuthorizationCode");

EndProcedure

Procedure GreenMax_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.LogoutInstance(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "LogoutInstance");

EndProcedure

Procedure GreenMax_SendAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AuthCode = 123456;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendAuthorizationCode(AccessParameters, AuthCode);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendAuthorizationCode");

EndProcedure

Procedure GreenMax_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetInstanceStatus(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetInstanceStatus");

EndProcedure

Procedure GreenMax_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.RebootInstance(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "RebootInstance");

EndProcedure

Procedure GreenMax_GetInstanceSettingsStructure(FunctionParameters)

    Result = OPI_GreenMax.GetInstanceSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetInstanceSettingsStructure");

    Result = OPI_GreenMax.GetInstanceSettingsStructure(True);

    OPI_TestDataRetrieval.Process(Result, "GreenMAx", "GetInstanceSettingsStructure", "Clear");

EndProcedure

Procedure GreenMax_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetInstanceSettings(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetInstanceSettings", , FunctionParameters);

EndProcedure

Procedure GreenMax_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("markIncomingMessagesReaded" , "no");
    SettingsStructure.Insert("outgoingWebhook"            , "no");
    SettingsStructure.Insert("outgoingAPIMessageWebhook"  , "yes");

    Result = OPI_GreenMax.SetInstanceSettings(SettingsStructure, AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SetInstanceSettings");

EndProcedure

Procedure GreenMax_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Image = FunctionParameters["Picture"]; // URL, Path or Binary data

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SetProfilePicture(AccessParameters, Image);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SetProfilePicture");

EndProcedure

Procedure GreenMax_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetAccountInformation(AccessParameters);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.CheckAccount(AccessParameters, PhoneNumber);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "CheckAccount", , FunctionParameters);

EndProcedure

Procedure GreenMax_GetContactList(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Count = 1;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetContactList(AccessParameters, Count);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetContactInformation(AccessParameters, ContactID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetContactInformation");

EndProcedure

Procedure GreenMax_GetChatList(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatList(AccessParameters);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatAvatar(AccessParameters, ChatID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.CreateGroup(AccessParameters, Name, UserID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.AddGroupMember(AccessParameters, ChatID, MemberID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.RemoveGroupMember(AccessParameters, ChatID, MemberID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.LeaveGroup(AccessParameters, ChatID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.UpdateGroupName(AccessParameters, ChatID, Name);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetGroupInformation(AccessParameters, ChatID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.ChangeGroupSettings(AccessParameters, ChatID, Settings);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "ChangeGroupSettings");

EndProcedure

Procedure GreenMax_GetGroupSettingsStructure(FunctionParameters)

    Result = OPI_GreenMax.GetGroupSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetGroupSettingsStructure");

    Result = OPI_GreenMax.GetGroupSettingsStructure(True);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SetAdminRights(AccessParameters, ChatID, MemberID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.RevokeAdminRights(AccessParameters, ChatID, MemberID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "RevokeAdminRights");

EndProcedure

Procedure GreenMax_SetGroupPicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Image  = FunctionParameters["Picture3"]; // URL, Path or Binary data
    ChatID = 12345678;

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SetGroupPicture(AccessParameters, ChatID, Image);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendTextMessage(AccessParameters, ChatID, Text, Set);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendTextMessage", , FunctionParameters);

EndProcedure

Procedure GreenMax_SendFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    File        = FunctionParameters["Picture"]; // URL, Path or Binary data
    FileName    = "photo.jpg";
    ChatID      = 12345678;
    Description = "File description";

    ChatID = FunctionParameters["GreenMax_GroupID"]; // SKIP

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendFile(AccessParameters, ChatID, File, FileName, Description);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendFile", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenMax.SendFile(AccessParameters, ChatID, File, FileName, Description, 1000, "video");

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.SendFileByURL(AccessParameters, ChatID, File, FileName);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendFileByURL");

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenMax.SendFileByURL(AccessParameters, ChatID, File, FileName, Description, 1000);

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "SendFileByURL", "Typing");

EndProcedure

Procedure GreenMax_GetNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetNotification(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetNotification", , FunctionParameters);

EndProcedure

Procedure GreenMax_DeleteNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    NotificationID = FunctionParameters["GreenMax_ReceiptID"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.DeleteNotification(AccessParameters, NotificationID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.MarkMessagesAsRead(AccessParameters, ChatID);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatMessageHistory(AccessParameters, ChatID, Count);

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

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetChatMessage(AccessParameters, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetChatMessage", , MessageID);

EndProcedure

Procedure GreenMax_GetIncomingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Period = 30;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetIncomingMessageLog(AccessParameters, Period);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetIncomingMessageLog");

EndProcedure

Procedure GreenMax_GetOutgoingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    Period = 30;

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetOutgoingMessageLog(AccessParameters, Period);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetOutgoingMessageLog");

EndProcedure

Procedure GreenMax_GetOutgoingMessageCount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetOutgoingMessageCount(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetOutgoingMessageCount");

EndProcedure

Procedure GreenMax_GetOutgoingMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetOutgoingMessageQueue(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetOutgoingMessageQueue");

EndProcedure

Procedure GreenMax_ClearOutgoingMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.ClearOutgoingMessageQueue(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "ClearOutgoingMessageQueue");

EndProcedure

Procedure GreenMax_GetIncomingNotificationCount(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.GetIncomingNotificationCount(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenMax", "GetIncomingNotificationCount");

EndProcedure

Procedure GreenMax_ClearIncomingNotificationQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenMax_ApiURL"];
    MediaUrl         = FunctionParameters["GreenMax_MediaURL"];
    IdInstance       = FunctionParameters["GreenMax_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenMax_Token"];

    AccessParameters = OPI_GreenMax.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenMax.ClearIncomingNotificationQueue(AccessParameters);

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