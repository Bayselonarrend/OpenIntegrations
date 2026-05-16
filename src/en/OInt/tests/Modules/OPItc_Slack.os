// OneScript: ./OInt/tests/Modules/OPItc_Slack.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("Slack");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Slack");

EndFunction

#Region Internal

#Region RunnableTests

#Region Slack

Procedure SlackGetData() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token", TestParameters);

    Slack_GetBotInformation(TestParameters);
    Slack_GetUserList(TestParameters);
    Slack_GetWorkspaceList(TestParameters);

EndProcedure

Procedure Slack_SendDeleteMessage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Channel", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User"   , TestParameters);

    Slack_SendMessage(TestParameters);
    Slack_EditMessage(TestParameters);
    Slack_GetMessageReplyList(TestParameters);
    Slack_GetMessageLink(TestParameters);
    Slack_DeleteMessage(TestParameters);
    Slack_SendEphemeralMessage(TestParameters);
    Slack_GetDelayedMessageList(TestParameters);
    Slack_GenerateImageBlock(TestParameters);

EndProcedure

Procedure Slack_CreateArchiveChannel() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User" , TestParameters);

    Slack_CreateChannel(TestParameters);
    Slack_SetChannelTopic(TestParameters);
    Slack_SetChannelGoal(TestParameters);
    Slack_GetChannel(TestParameters);
    Slack_InviteUsersToChannel(TestParameters);
    Slack_KickUserFromChannel(TestParameters);
    Slack_GetChannelHistory(TestParameters);
    Slack_GetChannelUserList(TestParameters);
    Slack_LeaveChannel(TestParameters);
    Slack_JoinChannel(TestParameters);
    Slack_RenameChannel(TestParameters);
    Slack_ArchiveChannel(TestParameters);
    Slack_GetChannelList(TestParameters);

EndProcedure

Procedure Slack_OpenCloseDialog() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User" , TestParameters);

    Slack_OpenDialog(TestParameters);
    Slack_CloseDialog(TestParameters);

EndProcedure

Procedure Slack_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Channel", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"     , TestParameters);

    Slack_GetFilesList(TestParameters);
    Slack_UploadFile(TestParameters);
    Slack_MakeFilePublic(TestParameters);
    Slack_MakeFilePrivate(TestParameters);
    Slack_GetFileData(TestParameters);
    Slack_DeleteFile(TestParameters);

EndProcedure

Procedure Slack_UploadDeleteExternalFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Channel", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"     , TestParameters);

    Slack_GetExternalFileList(TestParameters);
    Slack_AddExternalFile(TestParameters);
    Slack_GetExternalFile(TestParameters);
    Slack_SendExternalFile(TestParameters);
    Slack_DeleteExternalFile(TestParameters);

EndProcedure

#EndRegion // Slack

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Slack

Procedure Slack_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetBotInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetBotInformation");

EndProcedure

Procedure Slack_GetUserList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetUserList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetUserList");

EndProcedure

Procedure Slack_GetWorkspaceList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetWorkspaceList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetWorkspaceList");

EndProcedure

Procedure Slack_SendMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    // Text

    Text   = "TestMessage1";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "SendMessage", , FunctionParameters, Text, Channel); // SKIP

    // With attachments (picture block in the example)

    Text       = "Message with picture";
    Image      = FunctionParameters["Picture"];
    BlockArray = New Array;

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("alt", "Image");

    Block = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GenerateImageBlock", Options);
    BlockArray.Add(Block);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("text", Text);
    Options.Insert("blocks", BlockArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "SendMessage", "Image", FunctionParameters, Text, Channel); // SKIP

    // Sheduled

    Text = "Sheduled message";
    Hour = 3600;
    Day  = 24;

    SendingDate = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("text", Text);
    Options.Insert("date", SendingDate);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "SendMessage", "Sheduled", FunctionParameters, Text, Channel);

    Token     = FunctionParameters["Slack_Token"];
    Timestamp = Result["scheduled_message_id"];

    OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);

EndProcedure

Procedure Slack_GenerateImageBlock(FunctionParameters)

    Image = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("alt", "Image");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GenerateImageBlock", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GenerateImageBlock");

EndProcedure

Procedure Slack_EditMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Text = "TestMessage2";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp", Timestamp);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "EditMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "EditMessage", , Text, Channel);

EndProcedure

Procedure Slack_GetMessageReplyList(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp", Timestamp);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetMessageReplyList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetMessageReplyList");

EndProcedure

Procedure Slack_GetMessageLink(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp", Timestamp);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetMessageLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetMessageLink", , Channel);

EndProcedure

Procedure Slack_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp", Timestamp);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "DeleteMessage");

EndProcedure

Procedure Slack_SendEphemeralMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    User    = FunctionParameters["Slack_User"];
    Image   = FunctionParameters["Picture"];
    Text    = "Ephemeral message";

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("alt", "Image");

    Block = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GenerateImageBlock", Options);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("text", Text);
    Options.Insert("user", User);
    Options.Insert("blocks", Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendEphemeralMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "SendEphemeralMessage");

EndProcedure

Procedure Slack_GetDelayedMessageList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetDelayedMessageList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetDelayedMessageList");

EndProcedure

Procedure Slack_CreateChannel(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Name  = "testconv" + String(New UUID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "CreateChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "CreateChannel", , FunctionParameters, Name);

EndProcedure

Procedure Slack_SetChannelTopic(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Topic   = "TestTopic";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("theme", Topic);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SetChannelTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "SetChannelTopic", , Topic);

EndProcedure

Procedure Slack_SetChannelGoal(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Purpose = "TestGoal";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("purpose", Purpose);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SetChannelGoal", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "SetChannelGoal");

EndProcedure

Procedure Slack_GetChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_InviteUsersToChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("users", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "InviteUsersToChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "InviteUsersToChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_KickUserFromChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("user", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "KickUserFromChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "KickUserFromChannel");

EndProcedure

Procedure Slack_GetChannelHistory(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelHistory", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetChannelHistory");

EndProcedure

Procedure Slack_GetChannelUserList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelUserList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetChannelUserList");

EndProcedure

Procedure Slack_LeaveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "LeaveChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "LeaveChannel");

EndProcedure

Procedure Slack_JoinChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "JoinChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "JoinChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_RenameChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Name    = "testconv" + String(New UUID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "RenameChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "RenameChannel", , Name);

EndProcedure

Procedure Slack_ArchiveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "ArchiveChannel", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "ArchiveChannel");

EndProcedure

Procedure Slack_GetChannelList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetChannelList");

EndProcedure

Procedure Slack_OpenDialog(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    User  = FunctionParameters["Slack_User"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("users", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "OpenDialog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "OpenDialog", , FunctionParameters);

    Channel = Result["channel"]["id"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("text", "Test dialog");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "OpenDialog", "Message", FunctionParameters);

EndProcedure

Procedure Slack_CloseDialog(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Dialog = FunctionParameters["Slack_Dialog"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("conv", Dialog);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "CloseDialog", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "CloseDialog");

EndProcedure

Procedure Slack_GetFilesList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFilesList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetFilesList");

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFilesList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetFilesList", "All");

EndProcedure

Procedure Slack_UploadFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    File    = FunctionParameters["Document"]; // URL, Binary data or File path

    FileName = "megadoc.docx";
    Title    = "NewFile";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "UploadFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "UploadFile", , FunctionParameters, FileName); // SKIP
    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "MakeFilePublic"); // SKIP
    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "MakeFilePrivate"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("title", Title);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "UploadFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "UploadFile", "Channel", FunctionParameters, FileName);
    OPI_Slack.DeleteFile(FunctionParameters["Slack_Token"], Result["files"][0]["id"]);

EndProcedure

Procedure Slack_MakeFilePublic(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "MakeFilePublic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "MakeFilePublic", "No record");

EndProcedure

Procedure Slack_MakeFilePrivate(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "MakeFilePrivate", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "MakeFilePrivate", "No record");

EndProcedure

Procedure Slack_GetFileData(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFileData", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetFileData", , "megadoc.docx");

EndProcedure

Procedure Slack_DeleteFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "DeleteFile");

EndProcedure

Procedure Slack_GetExternalFileList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFileList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetExternalFileList");

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFileList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetExternalFileList", "All");

EndProcedure

Procedure Slack_AddExternalFile(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Title = "NewFile";
    File  = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", File);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "AddExternalFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "AddExternalFile", , FunctionParameters, Title);

EndProcedure

Procedure Slack_GetExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "GetExternalFile");

EndProcedure

Procedure Slack_SendExternalFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    FileID  = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);
    Options.Insert("channels", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendExternalFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "SendExternalFile");

EndProcedure

Procedure Slack_DeleteExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteExternalFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Slack", "DeleteExternalFile");

EndProcedure

#EndRegion // Slack

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure Слак_ПолучитьИнформацию() Export
    SlackGetData();
EndProcedure

Procedure Слак_ОтправитьУдалитьСообщение() Export
    Slack_SendDeleteMessage();
EndProcedure

Procedure Слак_СоздатьАрхивироватьКанал() Export
    Slack_CreateArchiveChannel();
EndProcedure

Procedure Слак_ОткрытьЗакрытьДиалог() Export
    Slack_OpenCloseDialog();
EndProcedure

Procedure Слак_ЗагрузитьУдалитьФайл() Export
    Slack_UploadDeleteFile();
EndProcedure

Procedure Слак_ЗагрузитьУдалитьВФ() Export
    Slack_UploadDeleteExternalFile();
EndProcedure

#EndRegion
