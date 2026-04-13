// OneScript: ./OInt/tests/Modules/OPItc_Telegram.os

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

//#Use "../../tools/main"
//#Use "../../tools/http"
//#Use "../../api"
//#Use asserts
//#Use "internal"


// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI("Telegram");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI("Telegram");

EndFunction

#Region Internal

#Region RunnableTests

#Region Telegram

Procedure TelegramAPI_GetBotInfo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);

    Telegram_GetBotInformation(TestParameters);

EndProcedure

Procedure TelegramAPI_GetUpdates() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);

    Telegram_DeleteWebhook(TestParameters);
    Telegram_GetUpdates(TestParameters);

EndProcedure

Procedure TelegramAPI_SetWebhook() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_URL"  , TestParameters);

    Telegram_SetWebhook(TestParameters);
    Telegram_DeleteWebhook(TestParameters);

EndProcedure

Procedure TelegramAPI_SendTextMessage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);

    Telegram_SendTextMessage(TestParameters);
    Telegram_ReplaceMessageText(TestParameters);
    Telegram_ReplaceMessageKeyboard(TestParameters);
    Telegram_FormKeyboardFromButtonArray(TestParameters);

EndProcedure

Procedure TelegramAPI_SendImage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"           , TestParameters);

    Telegram_SendImage(TestParameters);
    Telegram_ReplaceMessageCaption(TestParameters);
    Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure TelegramAPI_SendVideo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"             , TestParameters);

    Telegram_SendVideo(TestParameters);
    Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure TelegramAPI_SendAudio() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio"             , TestParameters);

    Telegram_SendAudio(TestParameters);
    Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure TelegramAPI_SendDocument() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"          , TestParameters);

    Telegram_SendDocument(TestParameters);

EndProcedure

Procedure TelegramAPI_SendGIF() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GIF"               , TestParameters);

    Telegram_SendGif(TestParameters);

EndProcedure

Procedure TelegramAPI_SendMediaGroup() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"          , TestParameters);

    Telegram_SendMediaGroup(TestParameters);

EndProcedure

Procedure TelegramAPI_SendLocation() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Long"              , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Lat"               , TestParameters);

    Telegram_SendLocation(TestParameters);

EndProcedure

Procedure TelegramAPI_SendContact() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Name"              , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Surname"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Phone"             , TestParameters);

    Telegram_SendContact(TestParameters);

EndProcedure

Procedure TelegramAPI_SendPoll() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    Telegram_SendPoll(TestParameters);

EndProcedure

Procedure TelegramAPI_ForwardMessage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"          , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);

    Telegram_ForwardMessage(TestParameters);

EndProcedure

Procedure TelegramAPI_BanUnban() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    Telegram_Ban(TestParameters);
    Telegram_Unban(TestParameters);

EndProcedure

Procedure TelegramAPI_CreateInvitationLink() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    Telegram_CreateInvitationLink(TestParameters);

EndProcedure

Procedure TelegramAPI_PinUnpinMessage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);

    Telegram_PinMessage(TestParameters);
    Telegram_UnpinMessage(TestParameters);
    Telegram_DeleteMessage(TestParameters);

EndProcedure

Procedure TelegramAPI_GetMemberCount() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    Telegram_GetParticipantCount(TestParameters);

EndProcedure

Procedure TelegramAPI_GetForumAvatarsList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);

    Telegram_GetAvatarIconList(TestParameters);

EndProcedure

Procedure TelegramAPI_CreateDeleteForumTopic() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"          , TestParameters);

    Telegram_CreateForumTopic(TestParameters);
    Telegram_EditForumTopic(TestParameters);
    Telegram_CloseForumTopic(TestParameters);
    Telegram_OpenForumTopic(TestParameters);
    Telegram_ClearTopicPinnedMessagesList(TestParameters);
    Telegram_DeleteForumTopic(TestParameters);

EndProcedure

Procedure TelegramAPI_HideShowMainTopic() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);

    Telegram_HideMainForumTopic(TestParameters);
    Telegram_ShowMainForumTopic(TestParameters);

EndProcedure

Procedure TelegramAPI_ChangeMainTopicName() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);

    Telegram_EditMainForumTopicName(TestParameters);

EndProcedure

#EndRegion // Telegram

#EndRegion // RunnableTests

#EndRegion // Internal

#Region Private

#Region AtomicTests

#Region Telegram

Procedure Telegram_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetBotInformation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "GetBotInformation");

EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetUpdates", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "GetUpdates");

EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    URL   = FunctionParameters["Telegram_URL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SetWebhook", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SetWebhook");

EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteWebhook", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "DeleteWebhook");

EndProcedure

Procedure Telegram_SendTextMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];

    KeyboardButtonsArray = New Array;
    KeyboardButtonsArray.Add("Button1");
    KeyboardButtonsArray.Add("Button2");

    // With keyboard, in chat
    Options = New Structure;
    Options.Insert("buttons", KeyboardButtonsArray);
    Options.Insert("under", Истина);

    Keyboard = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "FormKeyboardFromButtonArray", Options);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendTextMessage", , FunctionParameters, Text); // SKIP

    // Simple, to channel
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendTextMessage", "Channel", FunctionParameters, Text);

    Text   = "<b>Text html %F0%9F%93%9E 10%</b>";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("parsemode", "HTML");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendTextMessage", "HTML");

    Text   = "%F0%9F%A4%BC";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendTextMessage", "Emoji");

    Text   = "Text %F0%9F%A5%9D and emoji \(10%\)";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("parsemode", "MarkdownV2");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendTextMessage", "Text + Emoji");

    Keyboard = OPI_Tools.JsonToStructure(Keyboard, False);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendTextMessage", "Keyboard structure");

    Text = "%F0%9F%94%A5 *New release\!*
    |
    |%F0%9F%8F%B0 *Repository*: [240596448/devtools](https://github.com/240596448/devtools)
    |%F0%9F%94%A2 *Version*: \{0.6.0}
    |%F0%9F%93%85 *Date release*: 6 december 2025 y.
    |
    |>*AI summary*
    |>Devtools - this tool for automation work with configurations\extensions 1C:Enterprise and integration with Git. Application allows dump and upload objects, a also synchronize change between Git and repository 1C. In release 0.6.0 realized optimization logic work and added logging, that contributes stability and simplifies analysis work applications.
    |
    |
    |_Not forget put %E2%AD%90 liked projects_";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("parsemode", "MarkdownV2");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendTextMessage", "Complex");

EndProcedure

Procedure Telegram_FormKeyboardFromButtonArray(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "FormKeyboardFromButtonArray", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "FormKeyboardFromButtonArray");

EndProcedure

Procedure Telegram_SendImage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Image     = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    FileCopy(Image, ImagePath);

    ImageDD = New BinaryData(ImagePath);

    // In chat, by URL
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendImage", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("picture", ImagePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendImage", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("picture", ImageDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendImage", "Binary", FunctionParameters, Text);

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);
    Options.Insert("under", Истина);

    Keyboard = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "FormKeyboardFromButtonArray", Options);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("picture", Image);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendImage", "Keyboard", FunctionParameters, Text);

    Keyboard = OPI_Tools.JsonToStructure(Keyboard);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("picture", Image);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendImage", "Keyboard collection", FunctionParameters, Text);

    Text   = "Text %F0%9F%A5%9D and emoji \(10%\)";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("picture", Image);
    Options.Insert("parsemode", "MarkdownV2");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendImage", "Text + Emoji");

    Text = "%F0%9F%94%A5 *New release\!*
    |
    |%F0%9F%8F%B0 *Repository*: [240596448/devtools](https://github.com/240596448/devtools)
    |%F0%9F%94%A2 *Version*: \{0.6.0}
    |%F0%9F%93%85 *Date release*: 6 december 2025 y.
    |
    |>*AI summary*
    |>Devtools - this tool for automation work with configurations\extensions 1C:Enterprise and integration with Git. Application allows dump and upload objects, a also synchronize change between Git and repository 1C. In release 0.6.0 realized optimization logic work and added logging, that contributes stability and simplifies analysis work applications.
    |
    |
    |_Not forget put %E2%AD%90 liked projects_";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("picture", Image);
    Options.Insert("parsemode", "MarkdownV2");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendImage", "Complex");

    OPI_Tools.RemoveFileWithTry(ImagePath, "Failed to delete the temporary file after the test!!");

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendVideo(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Video     = FunctionParameters["Video"];

    VideoPath = GetTempFileName("mp4");
    FileCopy(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    // In chat, by URL
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("video", Video);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendVideo", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("video", VideoPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendVideo", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("video", VideoDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    // END

    OPI_Tools.RemoveFileWithTry(VideoPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendVideo", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendAudio(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Audio     = FunctionParameters["Audio"];

    AudioPath = GetTempFileName("mp3");
    FileCopy(Audio, AudioPath);

    AudioDD = New BinaryData(AudioPath);

    // In chat, by URL
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("audio", Audio);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendAudio", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("audio", AudioPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendAudio", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("audio", AudioDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    // END

    OPI_Tools.RemoveFileWithTry(AudioPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendAudio", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendDocument(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Document  = FunctionParameters["Document"];

    DocumentPath = GetTempFileName("docx");
    FileCopy(Document, DocumentPath);

    DocumentDD = New BinaryData(DocumentPath);

    // In chat, by URL
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("doc", Document);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendDocument", , FunctionParameters, Text); // SKIP

    // In chat, by URL, with file name
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("doc", Document);
    Options.Insert("filename", "customname.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendDocument", "With name", FunctionParameters, Text); // SKIP

    // To channel, on disk
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("doc", DocumentPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendDocument", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data, with file name
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("doc", DocumentDD);
    Options.Insert("filename", "customname.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    // END

    OPI_Tools.RemoveFileWithTry(DocumentPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendDocument", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendGif(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    GIF       = FunctionParameters["GIF"];

    GifPath = GetTempFileName("gif");
    FileCopy(GIF, GifPath);

    GifDD = New BinaryData(GifPath);

    // In chat, by URL
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("gif", GIF);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendGif", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("gif", GifPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendGif", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("gif", GifDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    // END

    OPI_Tools.RemoveFileWithTry(GifPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendGif", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendMediaGroup(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    Text   = FunctionParameters["String"];
    Image  = FunctionParameters["Picture"];
    Video  = FunctionParameters["Video"];

    ImagePath = GetTempFileName("png");
    FileCopy(Image, ImagePath);

    VideoPath = GetTempFileName("mp4");
    FileCopy(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    MediaGroup = New Map;
    MediaGroup.Insert(ImagePath, "photo");
    MediaGroup.Insert(VideoDD  , "video");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("media", MediaGroup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendMediaGroup", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendMediaGroup");

    DocumentURL  = FunctionParameters["Document"];
    DocumentPath = GetTempFileName("docx");
    ChannelID    = FunctionParameters["Telegram_ChannelID"];

    FileCopy(DocumentURL, DocumentPath);

    MediaGroup = New Map;
    MediaGroup.Insert(DocumentURL , "document");
    MediaGroup.Insert(DocumentPath, "document");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("media", MediaGroup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendMediaGroup", Options);

    OPI_Tools.RemoveFileWithTry(VideoPath   , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(ImagePath   , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(DocumentPath, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendMediaGroup", "Documents");

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendLocation(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Width     = FunctionParameters["Lat"];
    Longitude = FunctionParameters["Long"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("lat", Width);
    Options.Insert("long", Longitude);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendLocation", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendLocation"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("lat", Width);
    Options.Insert("long", Longitude);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendLocation", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendLocation", "Channel");

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendContact(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Name      = FunctionParameters["Name"];
    LastName  = FunctionParameters["Surname"];
    Phone     = FunctionParameters["Phone"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("name", Name);
    Options.Insert("surname", LastName);
    Options.Insert("phone", Phone);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendContact", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendContact", , Name); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("name", Name);
    Options.Insert("surname", LastName);
    Options.Insert("phone", Phone);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendContact", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendContact", "Channel", Name);

EndProcedure

Procedure Telegram_SendPoll(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Question  = "What's your favorite color??";

    AnswersArray = New Array;
    AnswersArray.Add("Red");
    AnswersArray.Add("Yellow");
    AnswersArray.Add("Green");
    AnswersArray.Add("Blue");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("question", Question);
    Options.Insert("options", AnswersArray);
    Options.Insert("anonymous", Ложь);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendPoll", , Question); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("question", Question);
    Options.Insert("options", AnswersArray);
    Options.Insert("anonymous", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendPoll", "Channel", Question); // SKIP

    // END

    StringArray = "['Red', 'Yellow', 'Green', 'Blue']";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("question", Question);
    Options.Insert("options", StringArray);
    Options.Insert("anonymous", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "SendPoll", "Questions as string", Question);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DownloadFile(FunctionParameters)

    FileID = FunctionParameters["Telegram_FileID"];
    Token  = FunctionParameters["Telegram_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DownloadFile", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "DownloadFile");

EndProcedure

Procedure Telegram_ForwardMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("message", MessageID);
    Options.Insert("from", ChannelID);
    Options.Insert("to", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ForwardMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ForwardMessage", , MessageID);

EndProcedure

Procedure Telegram_Ban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "Ban", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "Ban");

EndProcedure

Procedure Telegram_Unban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "Unban", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "Unban");

EndProcedure

Procedure Telegram_CreateInvitationLink(FunctionParameters)

    Token       = FunctionParameters["Telegram_Token"];
    ChannelID   = FunctionParameters["Telegram_ChannelID"];
    Day         = 86400;
    CurrentDate = OPI_Tools.GetCurrentDate();

    Title          = "Link " + String(CurrentDate);
    Expiration     = CurrentDate + Day;
    UnixExpiration = OPI_Tools.UNIXTime(Expiration);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("title", Title);
    Options.Insert("expire", Expiration);
    Options.Insert("limit", 200);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CreateInvitationLink", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "CreateInvitationLink", , Title, UnixExpiration);

EndProcedure

Procedure Telegram_PinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "PinMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "PinMessage");

EndProcedure

Procedure Telegram_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "UnpinMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "UnpinMessage");

EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetParticipantCount", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "GetParticipantCount");

EndProcedure

Procedure Telegram_GetAvatarIconList(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetAvatarIconList", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "GetAvatarIconList");

EndProcedure

Procedure Telegram_CreateForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Icon  = "5357419403325481346";
    Name  = "TestTopic " + String(New UUID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("title", Name);
    Options.Insert("icon", Icon);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CreateForumTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "CreateForumTopic", , FunctionParameters, Name, Icon);

    ChatTopic = Chat + "*" + FunctionParameters["Telegram_TopicID"];
    Text      = FunctionParameters["String"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatTopic);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "CreateForumTopic", "Message", FunctionParameters, Text);

EndProcedure

Procedure Telegram_EditForumTopic(FunctionParameters)

    Token   = FunctionParameters["Telegram_Token"];
    Chat    = FunctionParameters["Telegram_ForumID"];
    Topic   = FunctionParameters["Telegram_TopicID"];
    NewName = "NewTestTitle";
    NewIcon = "5310132165583840589";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("topic", Topic);
    Options.Insert("title", NewName);
    Options.Insert("icon", NewIcon);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "EditForumTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "EditForumTopic");

EndProcedure

Procedure Telegram_CloseForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    OPI_Telegram.OpenForumTopic(Token, Chat); // SKIP

    Result = OPI_Telegram.CloseForumTopic(Token, Chat); // Closes main topic

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "CloseForumTopic", "Main"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("topic", Topic);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CloseForumTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "CloseForumTopic");

EndProcedure

Procedure Telegram_OpenForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.OpenForumTopic(Token, Chat); // Opens main topic

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "OpenForumTopic", "Main"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("topic", Topic);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "OpenForumTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "OpenForumTopic");

EndProcedure

Procedure Telegram_DeleteForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("topic", Topic);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteForumTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "DeleteForumTopic");

EndProcedure

Procedure Telegram_ClearTopicPinnedMessagesList(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ClearTopicPinnedMessagesList", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ClearTopicPinnedMessagesList", "Main"); // SKIP

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ClearTopicPinnedMessagesList");

EndProcedure

Procedure Telegram_HideMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "HideMainForumTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "HideMainForumTopic");

EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ShowMainForumTopic", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ShowMainForumTopic");

EndProcedure

Procedure Telegram_EditMainForumTopicName(FunctionParameters)

    Title = "New main topic name " + String(New UUID);
    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "EditMainForumTopicName", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "EditMainForumTopicName");

EndProcedure

Procedure Telegram_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteMessage", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "DeleteMessage");

EndProcedure

Procedure Telegram_ReplaceMessageText(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    Text      = "New message text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageText", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ReplaceMessageText", , Text);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("text", "<b>Bold text</b>");
    Options.Insert("parsemode", "HTML");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageText", Options);

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ReplaceMessageText", "Markup", "Bold text");

EndProcedure

Procedure Telegram_ReplaceMessageKeyboard(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    MessageID = FunctionParameters["Telegram_MessageID"];

    ButtonArray = New Array;
    ButtonArray.Add("New button 3");
    ButtonArray.Add("New button 2");
    ButtonArray.Add("New button 1");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);
    Options.Insert("under", Истина);
    Options.Insert("column", Ложь);

    Keyboard = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "FormKeyboardFromButtonArray", Options);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageKeyboard", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ReplaceMessageKeyboard", , Keyboard);

EndProcedure

Procedure Telegram_ReplaceMessageCaption(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    MessageID = FunctionParameters["Telegram_PicMessageID"];

    Description = "New picture description";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("caption", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageCaption", Options);

    // END

    OPI_TestDataRetrieval.ProcessCLI(Result, "Telegram", "ReplaceMessageCaption", , Description);

EndProcedure

#EndRegion // Telegram

#EndRegion // AtomicTests

#EndRegion // Private

#Region Alternate

Procedure Телеграм_ПолучитьИнформациюБота() Export
    TelegramAPI_GetBotInfo();
EndProcedure

Procedure Телеграм_ПолучитьОбновления() Export
    TelegramAPI_GetUpdates();
EndProcedure

Procedure Телеграм_УстановитьWebhook() Export
    TelegramAPI_SetWebhook();
EndProcedure

Procedure Телеграм_ОтправитьТекстовоеСообщение() Export
    TelegramAPI_SendTextMessage();
EndProcedure

Procedure Телеграм_ОтправитьКартинку() Export
    TelegramAPI_SendImage();
EndProcedure

Procedure Телеграм_ОтправитьВидео() Export
    TelegramAPI_SendVideo();
EndProcedure

Procedure Телеграм_ОтправитьАудио() Export
    TelegramAPI_SendAudio();
EndProcedure

Procedure Телеграм_ОтправитьДокумент() Export
    TelegramAPI_SendDocument();
EndProcedure

Procedure Телеграм_ОтправитьГифку() Export
    TelegramAPI_SendGIF();
EndProcedure

Procedure Телеграм_ОтправитьМедиагруппу() Export
    TelegramAPI_SendMediaGroup();
EndProcedure

Procedure Телеграм_ОтправитьМестоположение() Export
    TelegramAPI_SendLocation();
EndProcedure

Procedure Телеграм_ОтправитьКонтакт() Export
    TelegramAPI_SendContact();
EndProcedure

Procedure Телеграм_ОтправитьОпрос() Export
    TelegramAPI_SendPoll();
EndProcedure

Procedure Телеграм_ПереслатьСообщение() Export
    TelegramAPI_ForwardMessage();
EndProcedure

Procedure Телеграм_БанРазбан() Export
    TelegramAPI_BanUnban();
EndProcedure

Procedure Телеграм_СоздатьСсылкуПриглашение() Export
    TelegramAPI_CreateInvitationLink();
EndProcedure

Procedure Телеграм_ЗакрепитьОткрепитьСообщение() Export
    TelegramAPI_PinUnpinMessage();
EndProcedure

Procedure Телеграм_ПолучитьЧислоУчастников() Export
    TelegramAPI_GetMemberCount();
EndProcedure

Procedure Телеграм_ПолучитьСписокАватаровФорума() Export
    TelegramAPI_GetForumAvatarsList();
EndProcedure

Procedure Телеграм_СоздатьУдалитьТемуФорума() Export
    TelegramAPI_CreateDeleteForumTopic();
EndProcedure

Procedure Телеграм_СкрытьПоказатьГлавнуюТему() Export
    TelegramAPI_HideShowMainTopic();
EndProcedure

Procedure Телеграм_ИзменитьИмяГлавнойТемы() Export
    TelegramAPI_ChangeMainTopicName();
EndProcedure

#EndRegion
