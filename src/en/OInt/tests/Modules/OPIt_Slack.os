// OneScript: ./OInt/tests/Modules/OPIt_Slack.os

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

    OPI_TestDataRetrieval.FormYAXTests("Slack");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Slack");

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
    Result = OPI_Slack.GetBotInformation(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetBotInformation");

EndProcedure

Procedure Slack_GetUserList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetUserList(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetUserList");

EndProcedure

Procedure Slack_GetWorkspaceList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetWorkspaceList(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetWorkspaceList");

EndProcedure

Procedure Slack_SendMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    // Text

    Text   = "TestMessage1";
    Result = OPI_Slack.SendMessage(Token, Channel, Text);

    OPI_TestDataRetrieval.Process(Result, "Slack", "SendMessage", , FunctionParameters, Text, Channel); // SKIP

    // With attachments (picture block in the example)

    Text       = "Message with picture";
    Image      = FunctionParameters["Picture"];
    BlockArray = New Array;

    Block = OPI_Slack.GenerateImageBlock(Image, "Image");
    BlockArray.Add(Block);

    Result = OPI_Slack.SendMessage(Token, Channel, Text, , BlockArray);

    OPI_TestDataRetrieval.Process(Result, "Slack", "SendMessage", "Image", FunctionParameters, Text, Channel); // SKIP

    // Sheduled

    Text = "Sheduled message";
    Hour = 3600;
    Day  = 24;

    SendingDate = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Result      = OPI_Slack.SendMessage(Token, Channel, Text, SendingDate);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "SendMessage", "Sheduled", FunctionParameters, Text, Channel);

    Token     = FunctionParameters["Slack_Token"];
    Timestamp = Result["scheduled_message_id"];

    OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);

EndProcedure

Procedure Slack_GenerateImageBlock(FunctionParameters)

    Image = FunctionParameters["Picture"];

    Result = OPI_Slack.GenerateImageBlock(Image, "Image");

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GenerateImageBlock");

EndProcedure

Procedure Slack_EditMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Text = "TestMessage2";

    Result = OPI_Slack.EditMessage(Token, Channel, Timestamp, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "EditMessage", , Text, Channel);

EndProcedure

Procedure Slack_GetMessageReplyList(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.GetMessageReplyList(Token, Channel, Timestamp);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetMessageReplyList");

EndProcedure

Procedure Slack_GetMessageLink(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.GetMessageLink(Token, Channel, Timestamp);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetMessageLink", , Channel);

EndProcedure

Procedure Slack_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "DeleteMessage");

EndProcedure

Procedure Slack_SendEphemeralMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    User    = FunctionParameters["Slack_User"];
    Image   = FunctionParameters["Picture"];
    Text    = "Ephemeral message";

    Block  = OPI_Slack.GenerateImageBlock(Image, "Image");
    Result = OPI_Slack.SendEphemeralMessage(Token, Channel, Text, User, Block);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "SendEphemeralMessage");

EndProcedure

Procedure Slack_GetDelayedMessageList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetDelayedMessageList(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetDelayedMessageList");

EndProcedure

Procedure Slack_CreateChannel(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Name  = "testconv" + String(New UUID);

    Result = OPI_Slack.CreateChannel(Token, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "CreateChannel", , FunctionParameters, Name);

EndProcedure

Procedure Slack_SetChannelTopic(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Topic   = "TestTopic";

    Result = OPI_Slack.SetChannelTopic(Token, Channel, Topic);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "SetChannelTopic", , Topic);

EndProcedure

Procedure Slack_SetChannelGoal(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Purpose = "TestGoal";

    Result = OPI_Slack.SetChannelGoal(Token, Channel, Purpose);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "SetChannelGoal");

EndProcedure

Procedure Slack_GetChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_InviteUsersToChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Result = OPI_Slack.InviteUsersToChannel(Token, Channel, User);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "InviteUsersToChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_KickUserFromChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Result = OPI_Slack.KickUserFromChannel(Token, Channel, User);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "KickUserFromChannel");

EndProcedure

Procedure Slack_GetChannelHistory(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannelHistory(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetChannelHistory");

EndProcedure

Procedure Slack_GetChannelUserList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannelUserList(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetChannelUserList");

EndProcedure

Procedure Slack_LeaveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.LeaveChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "LeaveChannel");

EndProcedure

Procedure Slack_JoinChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.JoinChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "JoinChannel", , FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_RenameChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Name    = "testconv" + String(New UUID);

    Result = OPI_Slack.RenameChannel(Token, Channel, Name);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "RenameChannel", , Name);

EndProcedure

Procedure Slack_ArchiveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.ArchiveChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "ArchiveChannel");

EndProcedure

Procedure Slack_GetChannelList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Result = OPI_Slack.GetChannelList(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetChannelList");

EndProcedure

Procedure Slack_OpenDialog(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    User  = FunctionParameters["Slack_User"];

    Result = OPI_Slack.OpenDialog(Token, User);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "OpenDialog", , FunctionParameters);

    Channel = Result["channel"]["id"];

    Result = OPI_Slack.SendMessage(Token, Channel, "Test dialog");

    OPI_TestDataRetrieval.Process(Result, "Slack", "OpenDialog", "Message", FunctionParameters);

EndProcedure

Procedure Slack_CloseDialog(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Dialog = FunctionParameters["Slack_Dialog"];

    Result = OPI_Slack.CloseDialog(Token, Dialog);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "CloseDialog");

EndProcedure

Procedure Slack_GetFilesList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetFilesList(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetFilesList");

    Result = OPI_Slack.GetFilesList(Token);

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetFilesList", "All");

EndProcedure

Procedure Slack_UploadFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    File    = FunctionParameters["Document"]; // URL, Binary Data or File path

    FileName = "megadoc.docx";
    Title    = "NewFile";

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title);

    OPI_TestDataRetrieval.Process(Result, "Slack", "UploadFile", , FunctionParameters, FileName); // SKIP
    OPI_TestDataRetrieval.Process(Result, "Slack", "MakeFilePublic"); // SKIP
    OPI_TestDataRetrieval.Process(Result, "Slack", "MakeFilePrivate"); // SKIP

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "UploadFile", "Channel", FunctionParameters, FileName);
    OPI_Slack.DeleteFile(FunctionParameters["Slack_Token"], Result["files"][0]["id"]);

EndProcedure

Procedure Slack_MakeFilePublic(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.MakeFilePublic(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "MakeFilePublic", "No record");

EndProcedure

Procedure Slack_MakeFilePrivate(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.MakeFilePrivate(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "MakeFilePrivate", "No record");

EndProcedure

Procedure Slack_GetFileData(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.GetFileData(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetFileData", , "megadoc.docx");

EndProcedure

Procedure Slack_DeleteFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.DeleteFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "DeleteFile");

EndProcedure

Procedure Slack_GetExternalFileList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetExternalFileList(Token, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetExternalFileList");

    Result = OPI_Slack.GetExternalFileList(Token);

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetExternalFileList", "All");

EndProcedure

Procedure Slack_AddExternalFile(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Title = "NewFile";
    File  = FunctionParameters["Document"];

    Result = OPI_Slack.AddExternalFile(Token, File, Title);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "AddExternalFile", , FunctionParameters, Title);

EndProcedure

Procedure Slack_GetExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.GetExternalFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "GetExternalFile");

EndProcedure

Procedure Slack_SendExternalFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    FileID  = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.SendExternalFile(Token, FileID, Channel);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "SendExternalFile");

EndProcedure

Procedure Slack_DeleteExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.DeleteExternalFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Slack", "DeleteExternalFile");

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