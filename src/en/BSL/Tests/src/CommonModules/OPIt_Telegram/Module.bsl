// OneScript: ./OInt/tests/Modules/OPIt_Telegram.os

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

    OPI_TestDataRetrieval.FormYAXTests("Telegram");

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTests("Telegram");

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
    Result = OPI_Telegram.GetBotInformation(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "GetBotInformation");

EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetUpdates(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "GetUpdates");

EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    URL   = FunctionParameters["Telegram_URL"];

    Result = OPI_Telegram.SetWebhook(Token, URL);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SetWebhook");

EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.DeleteWebhook(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "DeleteWebhook");

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
    Keyboard = OPI_Telegram.FormKeyboardFromButtonArray(KeyboardButtonsArray, True);
    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text, Keyboard);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendTextMessage", , FunctionParameters, Text); // SKIP

    // Simple, to channel
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendTextMessage", "Channel", FunctionParameters, Text);

    Text   = "<b>Text html %F0%9F%93%9E 10%</b>";
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "HTML");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendTextMessage", "HTML");

    Text   = "%F0%9F%A4%BC";
    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendTextMessage", "Emoji");

    Text   = "Text %F0%9F%A5%9D and emoji \(10%\)";
    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "MarkdownV2");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendTextMessage", "Text + Emoji");

    Keyboard = OPI_Tools.JsonToStructure(Keyboard, False);
    Result   = OPI_Telegram.SendTextMessage(Token, ChatID, Text, Keyboard);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendTextMessage", "Keyboard structure");

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

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text , , "MarkdownV2");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendTextMessage", "Complex");

EndProcedure

Procedure Telegram_FormKeyboardFromButtonArray(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Result = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "FormKeyboardFromButtonArray");

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
    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Image);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendImage", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImagePath);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendImage", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImageDD);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendImage", "Binary", FunctionParameters, Text);

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Keyboard = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray, True);
    Result   = OPI_Telegram.SendImage(Token, ChatID, Text, Image, Keyboard);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendImage", "Keyboard", FunctionParameters, Text);

    Keyboard = OPI_Tools.JsonToStructure(Keyboard);
    Result   = OPI_Telegram.SendImage(Token, ChannelID, Text, Image, Keyboard);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendImage", "Keyboard collection", FunctionParameters, Text);

    Text   = "Text %F0%9F%A5%9D and emoji \(10%\)";
    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, Image, , "MarkdownV2");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendImage", "Text + Emoji");

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

    Result = OPI_Telegram.SendImage(Token, ChatID, Text , Image, , "MarkdownV2");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendImage", "Complex");

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
    Result = OPI_Telegram.SendVideo(Token, ChatID, Text, Video);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendVideo", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoPath);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendVideo", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoDD);

    // END

    OPI_Tools.RemoveFileWithTry(VideoPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendVideo", "Binary", FunctionParameters, Text);

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
    Result = OPI_Telegram.SendAudio(Token, ChatID, Text, Audio);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendAudio", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioPath);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendAudio", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioDD);

    // END

    OPI_Tools.RemoveFileWithTry(AudioPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendAudio", "Binary", FunctionParameters, Text);

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
    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendDocument", , FunctionParameters, Text); // SKIP

    // In chat, by URL, with file name
    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document, , , "customname.docx");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendDocument", "With name", FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendDocument", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data, with file name
    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD, , , "customname.docx");

    // END

    OPI_Tools.RemoveFileWithTry(DocumentPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendDocument", "Binary", FunctionParameters, Text);

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
    Result = OPI_Telegram.SendGif(Token, ChatID, Text, GIF);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendGif", , FunctionParameters, Text); // SKIP

    // To channel, on disk
    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifPath);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendGif", "Path", FunctionParameters, Text); // SKIP

    // To channel, from binary data
    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifDD);

    // END

    OPI_Tools.RemoveFileWithTry(GifPath, "Failed to delete the temporary file after the test!!");
    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendGif", "Binary", FunctionParameters, Text);

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

    Result = OPI_Telegram.SendMediaGroup(Token, ChatID, Text, MediaGroup);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendMediaGroup");

    DocumentURL  = FunctionParameters["Document"];
    DocumentPath = GetTempFileName("docx");
    ChannelID    = FunctionParameters["Telegram_ChannelID"];

    FileCopy(DocumentURL, DocumentPath);

    MediaGroup = New Map;
    MediaGroup.Insert(DocumentURL , "document");
    MediaGroup.Insert(DocumentPath, "document");

    Result = OPI_Telegram.SendMediaGroup(Token, ChannelID, Text, MediaGroup);

    OPI_Tools.RemoveFileWithTry(VideoPath   , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(ImagePath   , "Failed to delete the temporary file after the test!!");
    OPI_Tools.RemoveFileWithTry(DocumentPath, "Failed to delete the temporary file after the test!!");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendMediaGroup", "Documents");

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendLocation(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Width     = FunctionParameters["Lat"];
    Longitude = FunctionParameters["Long"];

    Result = OPI_Telegram.SendLocation(Token, ChatID, Width, Longitude);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendLocation"); // SKIP

    Result = OPI_Telegram.SendLocation(Token, ChannelID, Width, Longitude);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendLocation", "Channel");

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendContact(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Name      = FunctionParameters["Name"];
    LastName  = FunctionParameters["Surname"];
    Phone     = FunctionParameters["Phone"];

    Result = OPI_Telegram.SendContact(Token, ChatID, Name, LastName, Phone);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendContact", , Name); // SKIP

    Result = OPI_Telegram.SendContact(Token, ChannelID, Name, LastName, Phone);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendContact", "Channel", Name);

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

    Result = OPI_Telegram.SendPoll(Token, ChatID, Question, AnswersArray, False);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendPoll", , Question); // SKIP

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, AnswersArray, True);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendPoll", "Channel", Question); // SKIP

    // END

    StringArray = "['Red', 'Yellow', 'Green', 'Blue']";

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, StringArray, True);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "SendPoll", "Questions as string", Question);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DownloadFile(FunctionParameters)

    FileID = FunctionParameters["Telegram_FileID"];
    Token  = FunctionParameters["Telegram_Token"];

    Result = OPI_Telegram.DownloadFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "DownloadFile");

EndProcedure

Procedure Telegram_ForwardMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.ForwardMessage(Token, MessageID, ChannelID, ChatID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ForwardMessage", , MessageID);

EndProcedure

Procedure Telegram_Ban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Ban(Token, ChannelID, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "Ban");

EndProcedure

Procedure Telegram_Unban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Unban(Token, ChannelID, UserID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "Unban");

EndProcedure

Procedure Telegram_CreateInvitationLink(FunctionParameters)

    Token       = FunctionParameters["Telegram_Token"];
    ChannelID   = FunctionParameters["Telegram_ChannelID"];
    Day         = 86400;
    CurrentDate = OPI_Tools.GetCurrentDate();

    Title          = "Link " + String(CurrentDate);
    Expiration     = CurrentDate + Day;
    UnixExpiration = OPI_Tools.UNIXTime(Expiration);

    Result = OPI_Telegram.CreateInvitationLink(Token, ChannelID, Title, Expiration, 200);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "CreateInvitationLink", , Title, UnixExpiration);

EndProcedure

Procedure Telegram_PinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.PinMessage(Token, ChannelID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "PinMessage");

EndProcedure

Procedure Telegram_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.UnpinMessage(Token, ChannelID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "UnpinMessage");

EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.GetParticipantCount(Token, ChannelID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "GetParticipantCount");

EndProcedure

Procedure Telegram_GetAvatarIconList(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetAvatarIconList(Token);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "GetAvatarIconList");

EndProcedure

Procedure Telegram_CreateForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Icon  = "5357419403325481346";
    Name  = "TestTopic " + String(New UUID);

    Result = OPI_Telegram.CreateForumTopic(Token, Chat, Name, Icon);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "CreateForumTopic", , FunctionParameters, Name, Icon);

    ChatTopic = Chat + "*" + FunctionParameters["Telegram_TopicID"];
    Text      = FunctionParameters["String"];

    Result = OPI_Telegram.SendTextMessage(Token, ChatTopic, Text);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "CreateForumTopic", "Message", FunctionParameters, Text);

EndProcedure

Procedure Telegram_EditForumTopic(FunctionParameters)

    Token   = FunctionParameters["Telegram_Token"];
    Chat    = FunctionParameters["Telegram_ForumID"];
    Topic   = FunctionParameters["Telegram_TopicID"];
    NewName = "NewTestTitle";
    NewIcon = "5310132165583840589";

    Result = OPI_Telegram.EditForumTopic(Token, Chat, Topic, NewName, NewIcon);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "EditForumTopic");

EndProcedure

Procedure Telegram_CloseForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    OPI_Telegram.OpenForumTopic(Token, Chat); // SKIP

    Result = OPI_Telegram.CloseForumTopic(Token, Chat); // Closes main topic

    OPI_TestDataRetrieval.Process(Result, "Telegram", "CloseForumTopic", "Main"); // SKIP

    Result = OPI_Telegram.CloseForumTopic(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "CloseForumTopic");

EndProcedure

Procedure Telegram_OpenForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.OpenForumTopic(Token, Chat); // Opens main topic

    OPI_TestDataRetrieval.Process(Result, "Telegram", "OpenForumTopic", "Main"); // SKIP

    Result = OPI_Telegram.OpenForumTopic(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "OpenForumTopic");

EndProcedure

Procedure Telegram_DeleteForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "DeleteForumTopic");

EndProcedure

Procedure Telegram_ClearTopicPinnedMessagesList(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.ClearTopicPinnedMessagesList(Token, Chat);

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ClearTopicPinnedMessagesList", "Main"); // SKIP

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ClearTopicPinnedMessagesList");

EndProcedure

Procedure Telegram_HideMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.HideMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "HideMainForumTopic");

EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ShowMainForumTopic");

EndProcedure

Procedure Telegram_EditMainForumTopicName(FunctionParameters)

    Title = "New main topic name " + String(New UUID);
    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "EditMainForumTopicName");

EndProcedure

Procedure Telegram_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.DeleteMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "DeleteMessage");

EndProcedure

Procedure Telegram_ReplaceMessageText(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    Text      = "New message text";

    Result = OPI_Telegram.ReplaceMessageText(Token, ChatID, MessageID, Text);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ReplaceMessageText", , Text);

    Result = OPI_Telegram.ReplaceMessageText(Token, ChatID, MessageID, "<b>Bold text</b>", "HTML");

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ReplaceMessageText", "Markup", "Bold text");

EndProcedure

Procedure Telegram_ReplaceMessageKeyboard(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    MessageID = FunctionParameters["Telegram_MessageID"];

    ButtonArray = New Array;
    ButtonArray.Add("New button 3");
    ButtonArray.Add("New button 2");
    ButtonArray.Add("New button 1");

    Keyboard = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray, True, False);

    Result = OPI_Telegram.ReplaceMessageKeyboard(Token, ChatID, MessageID, Keyboard);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ReplaceMessageKeyboard", , Keyboard);

EndProcedure

Procedure Telegram_ReplaceMessageCaption(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    MessageID = FunctionParameters["Telegram_PicMessageID"];

    Description = "New picture description";
    Result      = OPI_Telegram.ReplaceMessageCaption(Token, ChatID, MessageID, Description);

    // END

    OPI_TestDataRetrieval.Process(Result, "Telegram", "ReplaceMessageCaption", , Description);

EndProcedure

#EndRegion // Telegram

#EndRegion // AtomicTests

#EndRegion // Private
