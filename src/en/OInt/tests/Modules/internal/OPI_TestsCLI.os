// OneScript: ./OInt/tests/Modules/internal/OPI_TestsCLI.os

// MIT License

// Copyright (c) 2023 Anton Tsitavets

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
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

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable

// Uncomment if OneScript is executed
#Use oint
#Use asserts

#Region Internal

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI();

EndProcedure

#Region RunnableTests

#Region Telegram

Procedure CLI_TelegramAPI_GetBotInfo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);

    CLI_Telegram_GetBotInformation(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_GetUpdates() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);

    CLI_Telegram_DeleteWebhook(TestParameters);
    CLI_Telegram_GetUpdates(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SetWebhook() Export

     TestParameters = New Structure;
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_URL"  , TestParameters);

    CLI_Telegram_SetWebhook(TestParameters);
    CLI_Telegram_DeleteWebhook(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendTextMessage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);

    CLI_Telegram_SendTextMessage(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendImage() Export

    TestParameters = New Structure;
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Picture"           , TestParameters);

    CLI_Telegram_SendPicture(TestParameters);
    CLI_Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendVideo() Export

    TestParameters = New Structure;
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Video"             , TestParameters);

    CLI_Telegram_SendVideo(TestParameters);
    CLI_Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendAudio() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio"             , TestParameters);

    CLI_Telegram_SendAudio(TestParameters);
    CLI_Telegram_DownloadFile(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendDocument() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"          , TestParameters);

    CLI_Telegram_SendDocument(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendGIF() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GIF"               , TestParameters);

    CLI_Telegram_SendGif(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendMediaGroup() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"          , TestParameters);

    CLI_Telegram_SendMediaGroup(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendLocation() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Long"              , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Lat"               , TestParameters);

    CLI_Telegram_SendLocation(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendContact() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Name"              , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Surname"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Phone"             , TestParameters);

    CLI_Telegram_SendContact(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_SendPoll() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    CLI_Telegram_SendPoll(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_ForwardMessage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"          , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);

    CLI_Telegram_ForwardMessage(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_BanUnban() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID" , TestParameters);

    CLI_Telegram_Ban(TestParameters);
    CLI_Telegram_Unban(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_CreateInvitationLink() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    CLI_Telegram_CreateInviteLink(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_PinUnpinMessage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelMessageID", TestParameters);

    CLI_Telegram_PinMessage(TestParameters);
    CLI_Telegram_UnpinMessage(TestParameters);
    CLI_Telegram_DeleteMessage(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_GetMemberCount() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    CLI_Telegram_GetParticipantCount(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_GetForumAvatarsList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token", TestParameters);

    CLI_Telegram_GetForumAvatarList(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_CreateDeleteForumTopic() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("String"          , TestParameters);

    CLI_Telegram_CreateForumTopic(TestParameters);
    CLI_Telegram_EditForumTopic(TestParameters);
    CLI_Telegram_CloseForumTopic(TestParameters);
    CLI_Telegram_OpenForumTopic(TestParameters);
    CLI_Telegram_ClearPinnedMessagesList(TestParameters);
    CLI_Telegram_DeleteForumTopic(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_HideShowMainTopic() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);

    CLI_Telegram_HideMainForumTopic(TestParameters);
    CLI_Telegram_ShowMainForumTopic(TestParameters);

EndProcedure

Procedure CLI_TelegramAPI_ChangeMainTopicName() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ForumID", TestParameters);

    CLI_Telegram_ChangeMainTopicName(TestParameters);

EndProcedure

#EndRegion

#EndRegion

#EndRegion

#Region Private

Function GetVKParameters()

    Parameters  = New Structure;
    GroupNumber = OPI_TestDataRetrieval.GetParameter("VK_GroupID");

    Parameters.Insert("access_token" , OPI_TestDataRetrieval.GetParameter("VK_Token"));
    Parameters.Insert("owner_id"     , "-" + GroupNumber);
    Parameters.Insert("app_id"       , OPI_TestDataRetrieval.GetParameter("VK_AppID"));
    Parameters.Insert("group_id"     , GroupNumber);

    Return Parameters;

EndFunction

Function GetTwitterAuthData()

    Parameters = New Map;

    Parameters.Insert("redirect_uri"       , OPI_TestDataRetrieval.GetParameter("Twitter_Redirect"));
    Parameters.Insert("client_id"          , OPI_TestDataRetrieval.GetParameter("Twitter_ClinetID"));
    Parameters.Insert("client_secret"      , OPI_TestDataRetrieval.GetParameter("Twitter_ClientSecret"));
    Parameters.Insert("access_token"       , OPI_TestDataRetrieval.GetParameter("Twitter_Token"));
    Parameters.Insert("refresh_token"      , OPI_TestDataRetrieval.GetParameter("Twitter_Refresh"));
    Parameters.Insert("oauth_token"        , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthToken"));
    Parameters.Insert("oauth_token_secret" , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthSecret"));

    Parameters.Insert("oauth_consumer_key"
        , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthConsumerKey"));
    Parameters.Insert("oauth_consumer_secret"
        , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthConsumerSecret"));

    Return Parameters;

EndFunction

#Region AtomicTests

#Region Telegram

Procedure CLI_Telegram_GetBotInformation(FunctionParameters)

    Options = New Structure("token", FunctionParameters["Telegram_Token"]);
    Result  = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetBotInformation", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBotInformation", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramBotInformation(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_GetUpdates(FunctionParameters)

    Options = New Structure("token", FunctionParameters["Telegram_Token"]);
    Result  = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetUpdates", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUpdates", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramArray(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SetWebhook(FunctionParameters)

    Options = New Structure;
    Options.Insert("token", FunctionParameters["Telegram_Token"]);
    Options.Insert("url"  , FunctionParameters["Telegram_URL"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SetWebhook", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetWebhook", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramWebhookSetup(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_DeleteWebhook(FunctionParameters)

    Options = New Structure("token", FunctionParameters["Telegram_Token"]);
    Result  = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteWebhook", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteWebhook", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramWebhookDeletion(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendTextMessage(FunctionParameters)

    Text = FunctionParameters["String"];

    Options = New Structure;
    Options.Insert("token", FunctionParameters["Telegram_Token"]);
    Options.Insert("chat" , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("text" , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text); // SKIP

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (channel)");

    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text);

    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_TestDataRetrieval.WriteParameter("Telegram_ChannelMessageID", MessageID);

    // Additional test 1
    Options.Insert("text" , "<b>Text html %F0%9F%93%9E 10%</b>");
    Options.Insert("parsemode", "HTML");
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (HTML)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    // Additional test 2
    Options.Insert("text" , "%F0%9F%A4%BC");
    Options.Insert("parsemode", "Markdown");
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (emoji)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    // Additional test 3
    Options.Insert("text" , "Text %F0%9F%A5%9D and emoji \(10%\)");
    Options.Insert("parsemode", "MarkdownV2");
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (text and emoji)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendPicture(FunctionParameters)

    Text  = FunctionParameters["String"];
    Image = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("token"   , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"    , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("text"    , Text);
    Options.Insert("picture" , Image);

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendImage", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramImage(Result, Text); // SKIP

    Options.Insert("picture" , ImagePath);
    Options.Insert("chat"    , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendPicture (Path)");
    OPI_TestDataRetrieval.Check_TelegramImage(Result, Text); // SKIP

    DeleteFiles(ImagePath);

    FileID = Result["result"]["photo"][0]["file_id"];
    OPI_TestDataRetrieval.WriteParameter("Telegram_FileID", FileID);

    FunctionParameters.Insert("Telegram_FileID", FileID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendVideo(FunctionParameters)

    Text  = FunctionParameters["String"];
    Video = FunctionParameters["Video"];

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("text"  , Text);
    Options.Insert("video" , Video);

    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendVideo", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramVideo(Result, Text); // SKIP

    Options.Insert("video" , VideoPath);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendVideo (Path)");
    OPI_TestDataRetrieval.Check_TelegramVideo(Result, Text); // SKIP

    DeleteFiles(VideoPath);

    FileID = Result["result"]["video"]["file_id"];
    OPI_TestDataRetrieval.WriteParameter("Telegram_FileID", FileID);

    FunctionParameters.Insert("Telegram_FileID", FileID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendAudio(FunctionParameters)

    Text  = FunctionParameters["String"];
    Audio = FunctionParameters["Audio"];

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("text"  , Text);
    Options.Insert("audio" , Audio);

    AudioPath = GetTempFileName("mp3");
    CopyFile(Audio, AudioPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendAudio", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramAudio(Result, Text); // SKIP

    Options.Insert("audio" , AudioPath);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendAudio (Path)");
    OPI_TestDataRetrieval.Check_TelegramAudio(Result, Text); // SKIP

    DeleteFiles(AudioPath);

    FileID = Result["result"]["audio"]["file_id"];
    OPI_TestDataRetrieval.WriteParameter("Telegram_FileID", FileID);

    FunctionParameters.Insert("Telegram_FileID", FileID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendDocument(FunctionParameters)

    Text     = FunctionParameters["String"];
    Document = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("text"  , Text);
    Options.Insert("doc"   , Document);

    DocumentPath = GetTempFileName("docx");
    CopyFile(Document, DocumentPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendDocument", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text); // SKIP

    Options.Insert("doc" , DocumentPath);
    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendDocument (Path)");
    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text); // SKIP

    Options.Insert("filename", "custom.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendDocument (name)");
    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text); // SKIP

    DeleteFiles(DocumentPath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendGif(FunctionParameters)

    Text = FunctionParameters["String"];
    GIF  = FunctionParameters["GIF"];

    Options = New Structure;
    Options.Insert("token", FunctionParameters["Telegram_Token"]);
    Options.Insert("chat" , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("text" , Text);
    Options.Insert("gif"  , GIF);

    GifPath = GetTempFileName("gif");
    CopyFile(GIF, GifPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendGif", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramGif(Result, Text); // SKIP

    Options.Insert("gif" , GifPath);
    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendGif (Path)");
    OPI_TestDataRetrieval.Check_TelegramGif(Result, Text); // SKIP

    DeleteFiles(GifPath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendMediaGroup(FunctionParameters)

    Image = FunctionParameters["Picture"];
    Video = FunctionParameters["Video"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    MediaGroup = New Map;
    MediaGroup.Insert(ImagePath, "photo");
    MediaGroup.Insert(Video    , "video");

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("text"  , FunctionParameters["String"]);
    Options.Insert("media" , MediaGroup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendMediaGroup", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMediaGroup", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramMediaGroup(Result);

    DocumentURL  = FunctionParameters["Document"];
    DocumentPath = GetTempFileName("docx");

    CopyFile(DocumentURL, DocumentPath);

    MediaGroup = New Map;
    MediaGroup.Insert(DocumentURL , "document");
    MediaGroup.Insert(DocumentPath, "document");

    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("media" , MediaGroup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendMediaGroup", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMediaGroup (docs)", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramMediaGroup(Result);

    DeleteFiles(ImagePath);
    DeleteFiles(DocumentPath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendLocation(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("lat"   , FunctionParameters["Lat"]);
    Options.Insert("long"  , FunctionParameters["Long"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendLocation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendLocation", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramLocation(Result); // SKIP

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendLocation", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendLocation (channel)");
    OPI_TestDataRetrieval.Check_TelegramLocation(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendContact(FunctionParameters)

    Name = FunctionParameters["Name"];

    Options = New Structure;
    Options.Insert("token"  , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"   , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("surname", FunctionParameters["Surname"]);
    Options.Insert("phone"  , FunctionParameters["Phone"]);
    Options.Insert("name"   , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendContact", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendContact", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramContact(Result, Name); // SKIP

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendContact", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendContact (channel)");
    OPI_TestDataRetrieval.Check_TelegramContact(Result, Name);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SendPoll(FunctionParameters)

    Question = "What's your favorite color?";

    AnswersArray = New Array;
    AnswersArray.Add("Red");
    AnswersArray.Add("Yellow");
    AnswersArray.Add("Green");
    AnswersArray.Add("Blue");

    Options = New Structure;
    Options.Insert("token"   , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"    , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("question", Question);
    Options.Insert("options" , AnswersArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendPoll", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramPoll(Result, Question); // SKIP

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendPoll (channel)");
    OPI_TestDataRetrieval.Check_TelegramPoll(Result, Question); // SKIP

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_DownloadFile(FunctionParameters)

    Options = New Structure;
    Options.Insert("token"  , FunctionParameters["Telegram_Token"]);
    Options.Insert("fileid" , FunctionParameters["Telegram_FileID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DownloadFile", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DownloadFile", "Telegram");
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("BinaryData");

EndProcedure

Procedure CLI_Telegram_ForwardMessage(FunctionParameters)

    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Options = New Structure;
    Options.Insert("token"  , FunctionParameters["Telegram_Token"]);
    Options.Insert("from"   , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("to"     , FunctionParameters["Telegram_ChatID"]);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ForwardMessage", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ForwardMessage", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramForward(Result, MessageID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_Ban(FunctionParameters)

    Options = New Structure;
    Options.Insert("token", FunctionParameters["Telegram_Token"]);
    Options.Insert("chat" , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("user" , FunctionParameters["Telegram_ChatID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "Ban", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "Ban", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramBan(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_Unban(FunctionParameters)

    Options = New Structure;
    Options.Insert("token", FunctionParameters["Telegram_Token"]);
    Options.Insert("chat" , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("user" , FunctionParameters["Telegram_ChatID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "Unban", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "Unban", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramBan(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_CreateInviteLink(FunctionParameters)

    Day         = 86400;
    CurrentDate = OPI_Tools.GetCurrentDate();

    Title          = "Link " + String(CurrentDate);
    Expiration     = CurrentDate + Day;
    UnixExpiration = OPI_Tools.UNIXTime(Expiration);

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("expire", Expiration);
    Options.Insert("title" , Title);
    Options.Insert("limit" , 200);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CreateInvitationLink", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateInvitationLink", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramInvitation(Result, Title, UnixExpiration);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_PinMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("token"  , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"   , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("message", FunctionParameters["Telegram_ChannelMessageID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "PinMessage", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PinMessage", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_UnpinMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("token"  , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"   , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("message", FunctionParameters["Telegram_ChannelMessageID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "UnpinMessage", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UnpinMessage", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_GetParticipantCount(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetParticipantCount", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetParticipantCount", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramNumber(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_GetForumAvatarList(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetAvatarIconList", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAvatarIconList", "Telegram");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_CreateForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Icon  = "5357419403325481346";
    Name  = "TestTopic " + String(New UUID);

    Result = OPI_Telegram.CreateForumThread(Token, Chat, Name, Icon);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateForumThread", "Telegram");

    Topic = Result["result"]["message_thread_id"];

    FunctionParameters.Insert("Telegram_TopicID", Topic);
    OPI_Tools.AddField("Telegram_TopicID", Topic, "String", FunctionParameters);
    OPI_TestDataRetrieval.WriteParameter("Telegram_TopicID", FunctionParameters["Telegram_TopicID"]);

    OPI_TestDataRetrieval.Check_TelegramCreateTopic(Result, Name, Icon);

    ChatTopic = Chat + "*" + Topic;
    Text      = FunctionParameters["String"];
    Result    = OPI_Telegram.SendTextMessage(Token, ChatTopic, Text);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (forum)");

    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text);

EndProcedure

Procedure CLI_Telegram_EditForumTopic(FunctionParameters)

    Token   = FunctionParameters["Telegram_Token"];
    Chat    = FunctionParameters["Telegram_ForumID"];
    Topic   = FunctionParameters["Telegram_TopicID"];
    NewName = "NewTestTitle";
    NewIcon = "5310132165583840589";

    Result = OPI_Telegram.EditForumTopic(Token, Chat, Topic, NewName, NewIcon);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_CloseForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    OPI_Telegram.OpenForumThread(Token, Chat); // SKIP

    Result = OPI_Telegram.CloseForumThread(Token, Chat); // Closes main topic

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CloseForumTopic (main)");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.CloseForumThread(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CloseForumThread", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure CLI_Telegram_OpenForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.OpenForumThread(Token, Chat); // Opens main topic

    OPI_TestDataRetrieval.WriteLogCLI(Result, "OpenForumTopic (main)");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.OpenForumThread(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "OpenForumThread", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure CLI_Telegram_DeleteForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure CLI_Telegram_ClearPinnedMessagesList(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearPinnedMessagesList (main)");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearThreadPinnedMessagesList", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_HideMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.HideMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "HideMainForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_ShowMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ShowMainForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_ChangeMainTopicName(FunctionParameters)

    Title = "New main thread name " + String(New UUID);
    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditMainForumTopicName", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.DeleteMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteMessage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#EndRegion

#EndRegion


