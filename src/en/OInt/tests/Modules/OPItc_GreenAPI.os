// OneScript: ./OInt/tests/Modules/OPItc_GreenAPI.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("GreenAPI");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("GreenAPI");

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

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "FormAccessParameters");

EndProcedure

Procedure GreenAPI_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetInstanceSettings", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetAccountInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetAccountInformation");

EndProcedure

Procedure GreenAPI_GetInstanceSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetInstanceSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettingsStructure", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetInstanceSettingsStructure", "Clear");

EndProcedure

Procedure GreenAPI_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("pollMessageWebhook"       , "yes");
    SettingsStructure.Insert("incomingBlockWebhook"     , "no");
    SettingsStructure.Insert("incomingCallWebhook"      , "no");
    SettingsStructure.Insert("editedMessageWebhook"     , "yes");
    SettingsStructure.Insert("deletedMessageWebhook"    , "yes");
    SettingsStructure.Insert("outgoingAPIMessageWebhook", "yes");

    Options = New Structure;
    Options.Insert("settings", SettingsStructure);
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetInstanceSettings", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SetInstanceSettings");

EndProcedure

Procedure GreenAPI_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceStatus", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetInstanceStatus");

EndProcedure

Procedure GreenAPI_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "RebootInstance", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "RebootInstance");

EndProcedure

Procedure GreenAPI_GetQR(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetQR", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetQR");

EndProcedure

Procedure GreenAPI_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "LogoutInstance", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "LogoutInstance");

EndProcedure

Procedure GreenAPI_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    PhoneNumber = 441234567890;

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("phone", PhoneNumber);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetAuthorizationCode", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetAuthorizationCode");

EndProcedure

Procedure GreenAPI_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetProfilePicture", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SetProfilePicture");

EndProcedure

Procedure GreenAPI_CreateGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Name = "New group";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("name", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "CreateGroup", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "CreateGroup", , FunctionParameters);

EndProcedure

Procedure GreenAPI_LeaveGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "LeaveGroup", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "LeaveGroup");

EndProcedure

Procedure GreenAPI_GetGroupInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetGroupInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetGroupInformation");

EndProcedure

Procedure GreenAPI_UpdateGroupName(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    Name    = "New name";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("name", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "UpdateGroupName", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "UpdateGroupName");

EndProcedure

Procedure GreenAPI_AddGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "AddGroupMember", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "AddGroupMember");

EndProcedure

Procedure GreenAPI_ExcludeGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ExcludeGroupMember", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "ExcludeGroupMember");

EndProcedure

Procedure GreenAPI_SetAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetAdminRights", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SetAdminRights");

EndProcedure

Procedure GreenAPI_RevokeAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "RevokeAdminRights", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "RevokeAdminRights");

EndProcedure

Procedure GreenAPI_SetGroupPicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image   = FunctionParameters["Picture"]; // URL, Path or Binary Data
    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetGroupPicture", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SetGroupPicture");

EndProcedure

Procedure GreenAPI_SendTextMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];
    Text   = "New message";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendTextMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendTextMessage", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendTextMessage", "Quote");

EndProcedure

Procedure GreenAPI_DeleteMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "DeleteMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "DeleteMessage");

EndProcedure

Procedure GreenAPI_EditMessageText(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];
    Text      = "New message text";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "EditMessageText", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "EditMessageText");

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

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendFile", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendFile", "Quote");

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

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("url", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFileByURL", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendFileByURL", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("url", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFileByURL", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendFileByURL", "Quote");

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

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("options", Variants);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendPoll", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendPoll", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("options", Variants);
    Options.Insert("multi", Истина);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendPoll", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendPoll", "Quote");

EndProcedure

Procedure GreenAPI_GetLocationDescription(FunctionParameters)

    Latitude  = 53.908522;
    Longitude = 27.574821;
    Address   = "Victory Square, Minsk";
    Name      = "Victory sq.";

    Options = New Structure;
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);
    Options.Insert("addr", Address);
    Options.Insert("name", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetLocationDescription", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetLocationDescription");

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

    Options = New Structure;
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);
    Options.Insert("addr", Address);
    Options.Insert("name", Name);

    Location = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetLocationDescription", Options);

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("loc", Location);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendLocation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendLocation", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);

    Location = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetLocationDescription", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("loc", Location);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendLocation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendLocation", "Quote");

EndProcedure

Procedure GreenAPI_GetContactDescription(FunctionParameters)

    Phone      = 79001234568;
    Name       = "Artem";
    LastName   = "Evpatoriysky";
    Patronymic = "Petrovich";
    Company    = "Bicycle";

    Options = New Structure;
    Options.Insert("phone", Phone);
    Options.Insert("name", Name);
    Options.Insert("surname", LastName);
    Options.Insert("midname", Patronymic);
    Options.Insert("company", Company);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetContactDescription", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetContactDescription");

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

    Options = New Structure;
    Options.Insert("phone", Phone);
    Options.Insert("name", Name);
    Options.Insert("surname", LastName);
    Options.Insert("midname", Patronymic);
    Options.Insert("company", Company);

    Contact = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetContactDescription", Options);

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("contact", Contact);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendContact", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendContact", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("phone", Phone);
    Options.Insert("company", Company);

    Contact = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetContactDescription", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("contact", Contact);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendContact", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SendContact", "Quote");

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

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("from", From);
    Options.Insert("to", Target);
    Options.Insert("msgs", Message);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ForwardMessages", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "ForwardMessages");

EndProcedure

Procedure GreenAPI_GetNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetNotification", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetNotification", , FunctionParameters);

EndProcedure

Procedure GreenAPI_DeleteNotificationFromQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ReceiptID = FunctionParameters["GreenAPI_ReceiptID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("receipt", ReceiptID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "DeleteNotificationFromQueue", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "DeleteNotificationFromQueue");

EndProcedure

Procedure GreenAPI_DownloadMessageFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_FileMessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "DownloadMessageFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "DownloadMessageFile");

EndProcedure

Procedure GreenAPI_SetReadMark(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_FileMessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetReadMark", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "SetReadMark");

EndProcedure

Procedure GreenAPI_GetMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetMessageQueue", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetMessageQueue");

EndProcedure

Procedure GreenAPI_ClearMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ClearMessageQueue", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "ClearMessageQueue");

EndProcedure

Procedure GreenAPI_GetChatHistory(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetChatHistory", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetChatHistory", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("msg", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetMessage", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetIncomingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetIncomingMessageLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetIncomingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetOutgoingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetOutgoingMessageLog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "GetOutgoingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_ArchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    OPI_GreenAPI.UnarchiveChat(AccessParameters, ChatID); // SKIP

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ArchiveChat", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "ArchiveChat");

EndProcedure

Procedure GreenAPI_UnarchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "UnarchiveChat", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "GreenAPI", "UnarchiveChat");

EndProcedure

#EndRegion // GreenAPI

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure GAPI_Аккаунт() Export
    GAPI_Account();
EndProcedure

Procedure GAPI_УправлениеГруппами() Export
    GAPI_GroupManagement();
EndProcedure

Procedure GAPI_ОтправкаСообщений() Export
    GAPI_MessageSending();
EndProcedure

Procedure GAPI_ПолучениеУведомлений() Export
    GAPI_NotificationsReceiving();
EndProcedure

Procedure GAPI_ОчередьСообщений() Export
    GAPI_MessageQueue();
EndProcedure

Procedure GAPI_ЖурналыСообщений() Export
    GAPI_MessageLogs();
EndProcedure

#EndRegion
