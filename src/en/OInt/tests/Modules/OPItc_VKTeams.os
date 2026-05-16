// OneScript: ./OInt/tests/Modules/OPItc_VKTeams.os

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

    OPI_TestDataRetrieval.FormYAXTestsCLI("VKTeams");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("VKTeams");

EndFunction

#Region Internal

#Region RunnableTests

#Region VKTeams

Procedure VKT_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_FileID", TestParameters);

    VKTeams_CheckToken(TestParameters);
    VKTeams_GetEvents(TestParameters);
    VKTeams_GetFileInformation(TestParameters);

EndProcedure

Procedure VKT_MessagesSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_ChatID2"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_MessageID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio2"           , TestParameters);

    VKTeams_SendTextMessage(TestParameters);
    OPI_Tools.Pause(60);

    VKTeams_AnswerButtonEvent(TestParameters);
    VKTeams_ForwardMessage(TestParameters);
    VKTeams_SendFile(TestParameters);
    VKTeams_ResendFile(TestParameters);
    VKTeams_EditMessageText(TestParameters);
    VKTeams_PinMessage(TestParameters);
    VKTeams_UnpinMessage(TestParameters);
    VKTeams_DeleteMessage(TestParameters);
    VKTeams_SendVoice(TestParameters);
    VKTeams_ResendVoice(TestParameters);
    VKTeams_MakeActionButton(TestParameters);

EndProcedure

Procedure VKT_ChatManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VKTeams_ChatID2", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture3"       , TestParameters);

    VKTeams_RemoveChatMembers(TestParameters);
    VKTeams_ChangeChatPicture(TestParameters);
    VKTeams_GetChatInfo(TestParameters);
    VKTeams_GetChatAdmins(TestParameters);
    VKTeams_GetChatMembers(TestParameters);
    VKTeams_GetChatBlockedUsers(TestParameters);
    VKTeams_GetChatJoinRequests(TestParameters);
    VKTeams_BlockChatUser(TestParameters);
    VKTeams_UnblockChatUser(TestParameters);
    VKTeams_ApprovePending(TestParameters);
    VKTeams_DisapprovePending(TestParameters);
    VKTeams_SetChatTitle(TestParameters);
    VKTeams_SetChatDescription(TestParameters);
    VKTeams_SetChatRules(TestParameters);

EndProcedure

#EndRegion // VKTeams

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region VKTeams

Procedure VKTeams_CheckToken(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "CheckToken", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "CheckToken");

EndProcedure

Procedure VKTeams_GetEvents(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    LastID = 0;

    For N = 1 To 5 Do // In real work - endless loop

        Result = OPI_VKTeams.GetEvents(Token, LastID, 3);

        OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "GetEvents"); // SKIP

        Events = Result["events"];

        // Event handling...

        If Not Events.Count() = 0 Then

            LastID = Events[Events.UBound()]["eventId"];

        EndIf;

    EndDo;

    // END

    OPI_Tools.Pause(3);

EndProcedure

Procedure VKTeams_SendTextMessage(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];
    Text   = "Message text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendTextMessage", "Simple", FunctionParameters); // SKIP

    ChatID  = FunctionParameters["VKTeams_ChatID2"];
    ReplyID = FunctionParameters["VKTeams_MessageID"];
    Text    = "<b>Bold text</b>";
    Markup  = "HTML";

    Keyboard         = New Array;
    ButtonsLineArray = New Array;

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button1", "ButtonEvent1", , "attention"));

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button2", , "https://openintegrations.dev"));

    // BSLLS:DuplicatedInsertionIntoCollection-off // SKIP
    Keyboard.Add(ButtonsLineArray);
    Keyboard.Add(ButtonsLineArray);
    // BSLLS:DuplicatedInsertionIntoCollection-on // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);
    Options.Insert("reply", ReplyID);
    Options.Insert("keyboard", Keyboard);
    Options.Insert("parsemod", Markup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendTextMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendTextMessage", , FunctionParameters);

EndProcedure

Procedure VKTeams_ForwardMessage(FunctionParameters)

    Token      = FunctionParameters["VKTeams_Token"];
    ChatID     = FunctionParameters["VKTeams_ChatID"];
    FromChatID = FunctionParameters["VKTeams_ChatID2"];
    MessageID  = FunctionParameters["VKTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("messageid", MessageID);
    Options.Insert("fromid", FromChatID);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ForwardMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ForwardMessage", "Simple"); // SKIP

    Text = "Additional text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("messageid", MessageID);
    Options.Insert("fromid", FromChatID);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ForwardMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ForwardMessage");

EndProcedure

Procedure VKTeams_SendFile(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];
    Text   = "File caption";

    File     = FunctionParameters["Document"]; // URL
    FilePath = GetTempFileName("docx"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendFile", "URL", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FilePath);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendFile", "Path", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FileBD);
    Options.Insert("text", Text);
    Options.Insert("filename", "ImportantDocument.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendFile", , FunctionParameters);

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_ResendFile(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];
    FileID = FunctionParameters["VKTeams_FileID"];
    Text   = "File caption";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("fileid", FileID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ResendFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ResendFile");

EndProcedure

Procedure VKTeams_GetFileInformation(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    FileID = FunctionParameters["VKTeams_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetFileInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "GetFileInformation");

EndProcedure

Procedure VKTeams_EditMessageText(FunctionParameters)

    Token     = FunctionParameters["VKTeams_Token"];
    ChatID    = FunctionParameters["VKTeams_ChatID2"];
    MessageID = FunctionParameters["VKTeams_MessageID"];
    Text      = "New message text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "EditMessageText", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "EditMessageText", "Path"); // SKIP

    Text   = "<b>New bold message text</b>";
    Markup = "HTML";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);
    Options.Insert("text", Text);
    Options.Insert("parsemod", Markup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "EditMessageText", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "EditMessageText");

EndProcedure

Procedure VKTeams_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["VKTeams_Token"];
    ChatID    = FunctionParameters["VKTeams_ChatID2"];
    MessageID = FunctionParameters["VKTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DeleteMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "DeleteMessage");

EndProcedure

Procedure VKTeams_SendVoice(FunctionParameters)

    Token   = FunctionParameters["VKTeams_Token"];
    ChatID  = FunctionParameters["VKTeams_ChatID2"];
    ReplyID = FunctionParameters["VKTeams_MessageID"];

    File     = FunctionParameters["Audio2"]; // URL
    FilePath = GetTempFileName("m4a"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendVoice", "URL", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FilePath);
    Options.Insert("reply", ReplyID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendVoice", "Path", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FileBD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SendVoice", , FunctionParameters);

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_ResendVoice(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];
    FileID = FunctionParameters["VKTeams_VoiceID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ResendVoice", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ResendVoice");

EndProcedure

Procedure VKTeams_RemoveChatMembers(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("members", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "RemoveChatMembers", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "RemoveChatMembers");

EndProcedure

Procedure VKTeams_ChangeChatPicture(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];

    File     = FunctionParameters["Picture3"]; // URL
    FilePath = GetTempFileName("png"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ChangeChatPicture", "URL");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FilePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ChangeChatPicture", "Path");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FileBD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ChangeChatPicture");

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_GetChatInfo(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatInfo", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "GetChatInfo");

EndProcedure

Procedure VKTeams_GetChatAdmins(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatAdmins", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "GetChatAdmins");

EndProcedure

Procedure VKTeams_GetChatMembers(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatMembers", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "GetChatMembers");

EndProcedure

Procedure VKTeams_GetChatBlockedUsers(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatBlockedUsers", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "GetChatBlockedUsers");

EndProcedure

Procedure VKTeams_GetChatJoinRequests(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatJoinRequests", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "GetChatJoinRequests");

EndProcedure

Procedure VKTeams_BlockChatUser(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);
    Options.Insert("dellast", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "BlockChatUser", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "BlockChatUser");

EndProcedure

Procedure VKTeams_UnblockChatUser(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "UnblockChatUser", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "UnblockChatUser");

EndProcedure

Procedure VKTeams_PinMessage(FunctionParameters)

    Token     = FunctionParameters["VKTeams_Token"];
    ChatID    = FunctionParameters["VKTeams_ChatID2"];
    MessageID = FunctionParameters["VKTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "PinMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "PinMessage");

EndProcedure

Procedure VKTeams_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["VKTeams_Token"];
    ChatID    = FunctionParameters["VKTeams_ChatID2"];
    MessageID = FunctionParameters["VKTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "UnpinMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "UnpinMessage");

EndProcedure

Procedure VKTeams_ApprovePending(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ApprovePending", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ApprovePending", "One"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ApprovePending", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "ApprovePending");

EndProcedure

Procedure VKTeams_DisapprovePending(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DisapprovePending", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "DisapprovePending", "One"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DisapprovePending", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "DisapprovePending");

EndProcedure

Procedure VKTeams_SetChatTitle(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    Text   = "New title";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatTitle", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SetChatTitle");

EndProcedure

Procedure VKTeams_SetChatDescription(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    Text   = "New description";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatDescription", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SetChatDescription");

EndProcedure

Procedure VKTeams_SetChatRules(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    ChatID = FunctionParameters["VKTeams_ChatID2"];
    Text   = "Text of the new rules";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatRules", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "SetChatRules");

EndProcedure

Procedure VKTeams_AnswerButtonEvent(FunctionParameters)

    Token  = FunctionParameters["VKTeams_Token"];
    LastID = 0;

    For N = 1 To 5 Do

        Result = OPI_VKTeams.GetEvents(Token, LastID, 3);
        Events = Result["events"];

        If Not Events.Count() = 0 Then

            For Each Event In Events Do

                callbackData = Event["payload"];

                If callbackData["callbackData"] = "ButtonEvent1" Then

                    EventID = callbackData["queryId"];
                    Result  = OPI_VKTeams.AnswerButtonEvent(Token, EventID, "Get it!!");

                    OPI_TestDataRetrieval.ProcessCLI(Result, "VKTeams", "AnswerButtonEvent"); // SKIP

                EndIf;

            EndDo;

            LastID = Events[Events.UBound()]["eventId"];

        EndIf;

    EndDo;

    // END

    OPI_Tools.Pause(3);

EndProcedure

Procedure VKTeams_MakeActionButton(FunctionParameters)

    Keyboard         = New Array;
    ButtonsLineArray = New Array;

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button1", "ButtonEvent1", , "attention"));

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button2", , "https://openintegrations.dev"));

    // BSLLS:DuplicatedInsertionIntoCollection-off // SKIP
    Keyboard.Add(ButtonsLineArray);
    Keyboard.Add(ButtonsLineArray);
    // BSLLS:DuplicatedInsertionIntoCollection-on // SKIP

    // END

EndProcedure

#EndRegion // VKTeams

#EndRegion // AtomicTests

#EndRegion // Private


#Region Alternate

Procedure ВКТ_ОбщиеМетоды() Export
    VKT_CommonMethods();
EndProcedure

Procedure ВКТ_ОтправкаСообщений() Export
    VKT_MessagesSending();
EndProcedure

Procedure ВКТ_УправлениеЧатами() Export
    VKT_ChatManagement();
EndProcedure

#EndRegion
