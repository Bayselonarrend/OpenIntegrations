// OneScript: ./OInt/tests/Modules/OPIt_VKTeams.os

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

    OPI_TestDataRetrieval.FormYAXTests("VKTeams");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("VKTeams");

EndFunction

#Region Internal

#Region RunnableTests

#Region VkTeams

Procedure VKT_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_FileID", TestParameters);

    VkTeams_CheckToken(TestParameters);
    VkTeams_GetEvents(TestParameters);
    VKTeams_GetFileInformation(TestParameters);

EndProcedure

Procedure VKT_MessagesSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID2"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_MessageID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio2"           , TestParameters);

    VkTeams_SendTextMessage(TestParameters);
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
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID2", TestParameters);
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

#EndRegion // VkTeams

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region VKTeams

Procedure VKTeams_CheckToken(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    Result = OPI_VKTeams.CheckToken(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "CheckToken");

EndProcedure

Procedure VKTeams_GetEvents(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    LastID = 0;

    For N = 1 To 5 Do // In real work - endless loop

        Result = OPI_VKTeams.GetEvents(Token, LastID, 3);

        OPI_TestDataRetrieval.Process(Result, "VKTeams", "GetEvents"); // SKIP

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

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    Text   = "Message text";

    Result = OPI_VKTeams.SendTextMessage(Token, ChatID, Text);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendTextMessage", "Simple", FunctionParameters); // SKIP

    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];
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

    Result = OPI_VKTeams.SendTextMessage(Token, ChatID, Text, ReplyID, Keyboard, Markup);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendTextMessage", , FunctionParameters);

EndProcedure

Procedure VKTeams_ForwardMessage(FunctionParameters)

    Token      = FunctionParameters["VkTeams_Token"];
    ChatID     = FunctionParameters["VkTeams_ChatID"];
    FromChatID = FunctionParameters["VkTeams_ChatID2"];
    MessageID  = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ForwardMessage", "Simple"); // SKIP

    Text = "Additional text";

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ForwardMessage");

EndProcedure

Procedure VKTeams_SendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    Text   = "File caption";

    File     = FunctionParameters["Document"]; // URL
    FilePath = GetTempFileName("docx"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.SendFile(Token, ChatID, File);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendFile", "URL", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FilePath, Text);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendFile", "Path", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FileBD, Text, "ImportantDocument.docx");

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendFile", , FunctionParameters);

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_ResendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_FileID"];
    Text   = "File caption";

    Result = OPI_VKTeams.ResendFile(Token, ChatID, FileID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ResendFile");

EndProcedure

Procedure VKTeams_GetFileInformation(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    FileID = FunctionParameters["VkTeams_FileID"];

    Result = OPI_VKTeams.GetFileInformation(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "GetFileInformation");

EndProcedure

Procedure VKTeams_EditMessageText(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];
    Text      = "New message text";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "EditMessageText", "Path"); // SKIP

    Text   = "<b>New bold message text</b>";
    Markup = "HTML";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text, Markup);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "EditMessageText");

EndProcedure

Procedure VKTeams_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.DeleteMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "DeleteMessage");

EndProcedure

Procedure VKTeams_SendVoice(FunctionParameters)

    Token   = FunctionParameters["VkTeams_Token"];
    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];

    File     = FunctionParameters["Audio2"]; // URL
    FilePath = GetTempFileName("m4a"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.SendVoice(Token, ChatID, File);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendVoice", "URL", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FilePath, , ReplyID);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendVoice", "Path", FunctionParameters); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FileBD);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SendVoice", , FunctionParameters);

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_ResendVoice(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_VoiceID"];

    Result = OPI_VKTeams.ResendVoice(Token, ChatID, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ResendVoice");

EndProcedure

Procedure VKTeams_RemoveChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.RemoveChatMembers(Token, ChatID, User);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "RemoveChatMembers");

EndProcedure

Procedure VKTeams_ChangeChatPicture(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    File     = FunctionParameters["Picture3"]; // URL
    FilePath = GetTempFileName("png"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, File);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ChangeChatPicture", "URL");

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FilePath);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ChangeChatPicture", "Path");

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FileBD);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ChangeChatPicture");

    OPI_Tools.RemoveFileWithTry(FilePath, "Failed to delete the temporary file after the test!!");

EndProcedure

Procedure VKTeams_GetChatInfo(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatInfo(Token, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "GetChatInfo");

EndProcedure

Procedure VKTeams_GetChatAdmins(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatAdmins(Token, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "GetChatAdmins");

EndProcedure

Procedure VKTeams_GetChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatMembers(Token, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "GetChatMembers");

EndProcedure

Procedure VKTeams_GetChatBlockedUsers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatBlockedUsers(Token, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "GetChatBlockedUsers");

EndProcedure

Procedure VKTeams_GetChatJoinRequests(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatJoinRequests(Token, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "GetChatJoinRequests");

EndProcedure

Procedure VKTeams_BlockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.BlockChatUser(Token, ChatID, User, True);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "BlockChatUser");

EndProcedure

Procedure VKTeams_UnblockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.UnblockChatUser(Token, ChatID, User);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "UnblockChatUser");

EndProcedure

Procedure VKTeams_PinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.PinMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "PinMessage");

EndProcedure

Procedure VKTeams_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.UnpinMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "UnpinMessage");

EndProcedure

Procedure VKTeams_ApprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.ApprovePending(Token, ChatID, User);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ApprovePending", "One"); // SKIP

    Result = OPI_VKTeams.ApprovePending(Token, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "ApprovePending");

EndProcedure

Procedure VKTeams_DisapprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID, User);

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "DisapprovePending", "One"); // SKIP

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "DisapprovePending");

EndProcedure

Procedure VKTeams_SetChatTitle(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New title";

    Result = OPI_VKTeams.SetChatTitle(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SetChatTitle");

EndProcedure

Procedure VKTeams_SetChatDescription(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New description";

    Result = OPI_VKTeams.SetChatDescription(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SetChatDescription");

EndProcedure

Procedure VKTeams_SetChatRules(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "Text of the new rules";

    Result = OPI_VKTeams.SetChatRules(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "VKTeams", "SetChatRules");

EndProcedure

Procedure VKTeams_AnswerButtonEvent(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
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

                    OPI_TestDataRetrieval.Process(Result, "VKTeams", "AnswerButtonEvent"); // SKIP

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