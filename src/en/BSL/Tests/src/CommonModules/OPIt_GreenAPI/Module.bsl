// OneScript: ./OInt/tests/Modules/OPIt_GreenAPI.os

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


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests("GreenAPI");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("GreenAPI");

EndFunction

#Region Internal

#Region RunnableTests

#Region GreenAPI

Procedure GAPI_Account() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);

    GreenAPI_ArchiveChat(TestParameters);
    GreenAPI_UnarchiveChat(TestParameters);
    GreenAPI_FormAccessParameters(TestParameters);
    GreenAPI_GetInstanceSettings(TestParameters);
    GreenAPI_GetAccountInformation(TestParameters);
    GreenAPI_GetInstanceSettingsStructure(TestParameters);
    GreenAPI_SetInstanceSettings(TestParameters);
    GreenAPI_GetInstanceStatus(TestParameters);
    GreenAPI_SetProfilePicture(TestParameters);
    // !DISABLED! GreenMax_RebootInstance(TestParameters);
    // !DISABLED! GreenAPI_GetAuthorizationCode(TestParameters);
    // !DISABLED! GreenAPI_LogoutInstance(TestParameters);
    // !DISABLED! GreenAPI_GetQR(TestParameters);

EndProcedure

Procedure GAPI_GroupManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"            , TestParameters);

    GreenAPI_CreateGroup(TestParameters);
    GreenAPI_GetGroupInformation(TestParameters);
    GreenAPI_UpdateGroupName(TestParameters);
    GreenAPI_SetGroupPicture(TestParameters);
    GreenAPI_AddGroupMember(TestParameters);
    GreenAPI_ExcludeGroupMember(TestParameters);
    GreenAPI_SetAdminRights(TestParameters);
    GreenAPI_RevokeAdminRights(TestParameters);
    GreenAPI_LeaveGroup(TestParameters);

EndProcedure

Procedure GAPI_MessageSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"               , TestParameters);

    GreenAPI_SendTextMessage(TestParameters);
    GreenAPI_SendFile(TestParameters);
    GreenAPI_SendFileByURL(TestParameters);
    GreenAPI_SendPoll(TestParameters);
    GreenAPI_SendLocation(TestParameters);
    GreenAPI_SendContact(TestParameters);
    GreenAPI_ForwardMessages(TestParameters);
    GreenAPI_GetLocationDescription(TestParameters);
    GreenAPI_GetContactDescription(TestParameters);
    GreenAPI_EditMessageText(TestParameters);
    GreenAPI_DeleteMessage(TestParameters);

EndProcedure

Procedure GAPI_NotificationsReceiving() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_FileMessageID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_DownloadMessageID", TestParameters);

    GreenAPI_GetNotification(TestParameters);
    GreenAPI_SetReadMark(TestParameters);
    // !DISABLED! GreenAPI_DownloadMessageFile(TestParameters);
    GreenAPI_DeleteNotificationFromQueue(TestParameters);

EndProcedure

Procedure GAPI_MessageQueue() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);

    GreenAPI_GetMessageQueue(TestParameters);
    GreenAPI_ClearMessageQueue(TestParameters);

EndProcedure

Procedure GAPI_MessageLogs() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MessageID"  , TestParameters);

    GreenAPI_GetChatHistory(TestParameters);
    GreenAPI_GetMessage(TestParameters);
    GreenAPI_GetIncomingMessageLog(TestParameters);
    GreenAPI_GetOutgoingMessageLog(TestParameters);

EndProcedure

#EndRegion // GreenAPI

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region GreenAPI

Procedure GreenAPI_FormAccessParameters(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Result = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "FormAccessParameters");

EndProcedure

Procedure GreenAPI_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetInstanceSettings(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetInstanceSettings", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetAccountInformation(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetAccountInformation");

EndProcedure

Procedure GreenAPI_GetInstanceSettingsStructure(FunctionParameters)

    Result = OPI_GreenAPI.GetInstanceSettingsStructure();

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetInstanceSettingsStructure");

    Result = OPI_GreenAPI.GetInstanceSettingsStructure(True);

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetInstanceSettingsStructure", "Clear");

EndProcedure

Procedure GreenAPI_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("pollMessageWebhook"       , "yes");
    SettingsStructure.Insert("incomingBlockWebhook"     , "no");
    SettingsStructure.Insert("incomingCallWebhook"      , "no");
    SettingsStructure.Insert("editedMessageWebhook"     , "yes");
    SettingsStructure.Insert("deletedMessageWebhook"    , "yes");
    SettingsStructure.Insert("outgoingAPIMessageWebhook", "yes");

    Result = OPI_GreenAPI.SetInstanceSettings(SettingsStructure, AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SetInstanceSettings");

EndProcedure

Procedure GreenAPI_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetInstanceStatus(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetInstanceStatus");

EndProcedure

Procedure GreenAPI_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.RebootInstance(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "RebootInstance");

EndProcedure

Procedure GreenAPI_GetQR(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetQR(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetQR");

EndProcedure

Procedure GreenAPI_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.LogoutInstance(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "LogoutInstance");

EndProcedure

Procedure GreenAPI_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    PhoneNumber = 441234567890;

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetAuthorizationCode(AccessParameters, PhoneNumber);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetAuthorizationCode");

EndProcedure

Procedure GreenAPI_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetProfilePicture(AccessParameters, Image);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SetProfilePicture");

EndProcedure

Procedure GreenAPI_CreateGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Name = "New group";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.CreateGroup(AccessParameters, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "CreateGroup", , FunctionParameters);

EndProcedure

Procedure GreenAPI_LeaveGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.LeaveGroup(AccessParameters, GroupID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "LeaveGroup");

EndProcedure

Procedure GreenAPI_GetGroupInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetGroupInformation(AccessParameters, GroupID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetGroupInformation");

EndProcedure

Procedure GreenAPI_UpdateGroupName(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    Name    = "New name";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.UpdateGroupName(AccessParameters, GroupID, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "UpdateGroupName");

EndProcedure

Procedure GreenAPI_AddGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.AddGroupMember(AccessParameters, GroupID, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "AddGroupMember");

EndProcedure

Procedure GreenAPI_ExcludeGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.ExcludeGroupMember(AccessParameters, GroupID, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "ExcludeGroupMember");

EndProcedure

Procedure GreenAPI_SetAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetAdminRights(AccessParameters, GroupID, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SetAdminRights");

EndProcedure

Procedure GreenAPI_RevokeAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.RevokeAdminRights(AccessParameters, GroupID, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "RevokeAdminRights");

EndProcedure

Procedure GreenAPI_SetGroupPicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image   = FunctionParameters["Picture"]; // URL, Path or Binary Data
    GroupID = FunctionParameters["GreenAPI_GroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetGroupPicture(AccessParameters, GroupID, Image);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SetGroupPicture");

EndProcedure

Procedure GreenAPI_SendTextMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];
    Text   = "New message";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendTextMessage(AccessParameters, ChatID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendTextMessage", , FunctionParameters);

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendTextMessage(AccessParameters, ChatID, Text, MessageID);

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendTextMessage", "Quote");

EndProcedure

Procedure GreenAPI_DeleteMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.DeleteMessage(AccessParameters, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "DeleteMessage");

EndProcedure

Procedure GreenAPI_EditMessageText(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];
    Text      = "New message text";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.EditMessageText(AccessParameters, ChatID, MessageID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "EditMessageText");

EndProcedure

Procedure GreenAPI_SendFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = "photo.jpg";
    ChatID      = FunctionParameters["GreenAPI_TestGroupID"];
    Description = "File description";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendFile(AccessParameters, ChatID, File, FileName, Description);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendFile", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendFile(AccessParameters, ChatID, File, FileName, Description, MessageID);

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendFile", "Quote");

EndProcedure

Procedure GreenAPI_SendFileByURL(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    File        = FunctionParameters["Picture"];
    FileName    = "photo.jpg";
    ChatID      = FunctionParameters["GreenAPI_TestGroupID"];
    Description = "File description";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendFileByURL(AccessParameters, ChatID, File, FileName, Description);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendFileByURL", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendFileByURL(AccessParameters, ChatID, File, FileName, Description, MessageID);

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendFileByURL", "Quote");

EndProcedure

Procedure GreenAPI_SendPoll(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];
    Text   = "What's your favorite color??";

    Variants = New Array;
    Variants.Add("Red");
    Variants.Add("Yellow");
    Variants.Add("Green");

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendPoll(AccessParameters, ChatID, Text, Variants);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendPoll", , FunctionParameters);

    MessageID = Result["idMessage"];
    Result    = OPI_GreenAPI.SendPoll(AccessParameters, ChatID, Text, Variants, True, MessageID);

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendPoll", "Quote");

EndProcedure

Procedure GreenAPI_GetLocationDescription(FunctionParameters)

    Latitude  = 53.908522;
    Longitude = 27.574821;
    Address   = "Victory Square, Minsk";
    Name      = "Victory sq.";

    Result = OPI_GreenAPI.GetLocationDescription(Latitude, Longitude, Address, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetLocationDescription");

EndProcedure

Procedure GreenAPI_SendLocation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Latitude  = 53.908522;
    Longitude = 27.574821;
    Address   = "Victory Square, Minsk";
    Name      = "Victory sq.";

    Location = OPI_GreenAPI.GetLocationDescription(Latitude, Longitude, Address, Name);

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendLocation(AccessParameters, ChatID, Location);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendLocation", , FunctionParameters);

    MessageID = Result["idMessage"];
    Location  = OPI_GreenAPI.GetLocationDescription(Latitude, Longitude);
    Result    = OPI_GreenAPI.SendLocation(AccessParameters, ChatID, Location, MessageID);

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendLocation", "Quote");

EndProcedure

Procedure GreenAPI_GetContactDescription(FunctionParameters)

    Phone      = 79001234568;
    Name       = "Artem";
    LastName   = "Evpatoriysky";
    Patronymic = "Petrovich";
    Company    = "Bicycle";

    Result = OPI_GreenAPI.GetContactDescription(Phone, Name, LastName, Patronymic, Company);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetContactDescription");

EndProcedure

Procedure GreenAPI_SendContact(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Phone      = 79001234568;
    Name       = "Artem";
    LastName   = "Evpatoriysky";
    Patronymic = "Petrovich";
    Company    = "Bicycle";

    Contact = OPI_GreenAPI.GetContactDescription(Phone, Name, LastName, Patronymic, Company);

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SendContact(AccessParameters, ChatID, Contact);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendContact", , FunctionParameters);

    MessageID = Result["idMessage"];
    Contact   = OPI_GreenAPI.GetContactDescription(Phone, , , , Company);
    Result    = OPI_GreenAPI.SendContact(AccessParameters, ChatID, Contact, MessageID);

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SendContact", "Quote");

EndProcedure

Procedure GreenAPI_ForwardMessages(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    From   = "11001234567@c.us";
    From   = FunctionParameters["GreenAPI_TestGroupID"]; // SKIP
    Target = FunctionParameters["GreenAPI_TestGroupID"];

    Message = FunctionParameters["GreenAPI_MessageID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.ForwardMessages(AccessParameters, From, Target, Message);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "ForwardMessages");

EndProcedure

Procedure GreenAPI_GetNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetNotification(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetNotification", , FunctionParameters);

EndProcedure

Procedure GreenAPI_DeleteNotificationFromQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ReceiptID = FunctionParameters["GreenAPI_ReceiptID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.DeleteNotificationFromQueue(AccessParameters, ReceiptID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "DeleteNotificationFromQueue");

EndProcedure

Procedure GreenAPI_DownloadMessageFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_FileMessageID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.DownloadMessageFile(AccessParameters, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "DownloadMessageFile");

EndProcedure

Procedure GreenAPI_SetReadMark(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_FileMessageID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.SetReadMark(AccessParameters, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "SetReadMark");

EndProcedure

Procedure GreenAPI_GetMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetMessageQueue(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetMessageQueue");

EndProcedure

Procedure GreenAPI_ClearMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.ClearMessageQueue(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "ClearMessageQueue");

EndProcedure

Procedure GreenAPI_GetChatHistory(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetChatHistory(AccessParameters, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetChatHistory", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetMessage(AccessParameters, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetMessage", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetIncomingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetIncomingMessageLog(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetIncomingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetOutgoingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.GetOutgoingMessageLog(AccessParameters);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "GetOutgoingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_ArchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    OPI_GreenAPI.UnarchiveChat(AccessParameters, ChatID); // SKIP

    Result = OPI_GreenAPI.ArchiveChat(AccessParameters, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "ArchiveChat");

EndProcedure

Procedure GreenAPI_UnarchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);
    Result           = OPI_GreenAPI.UnarchiveChat(AccessParameters, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "GreenAPI", "UnarchiveChat");

EndProcedure

#EndRegion // GreenAPI

#EndRegion // AtomicTests

#EndRegion // Private
