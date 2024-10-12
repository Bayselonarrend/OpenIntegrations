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
// #Use oint
// #Use asserts

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

#Region VK

Procedure CLI_VKAPI_CreateTokenLink() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VK_AppID", TestParameters);

    CLI_VK_CreateTokenRetrievalLink(TestParameters);

EndProcedure

Procedure CLI_VKAPI_CreateDeletePost() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);

    CLI_VK_CreatePost(TestParameters);
    CLI_VK_DeletePost(TestParameters);

EndProcedure

Procedure CLI_VKAPI_CreateCompositePost() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"   , TestParameters);

    CLI_VK_CreateCompositePost(TestParameters);

EndProcedure

Procedure CLI_VKAPI_CreatePoll() Export

    CLI_VK_CreatePoll();

EndProcedure

Procedure CLI_VKAPI_SaveDeleteImage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    CLI_VK_CreateAlbum(TestParameters);
    CLI_VK_SavePictureToAlbum(TestParameters);
    CLI_VK_DeleteImage(TestParameters);
    CLI_VK_DeleteAlbum(TestParameters);
    CLI_VK_UploadPhotoToServer(TestParameters);

EndProcedure

Procedure CLI_VKAPI_CreateStory() Export

    TestParameters = New Map;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    CLI_VK_CreateStory(TestParameters);

EndProcedure

Procedure CLI_VKAPI_DiscussionMethods() Export

    TestParameters = New Structure;
    Parameters     = GetVKParameters();

    CLI_VK_CreateDiscussion(TestParameters);
    CLI_VK_CloseDiscussion(TestParameters);
    CLI_VK_OpenDiscussion(TestParameters);
    CLI_VK_PostToDiscussion(TestParameters);

    OPI_VK.CloseDiscussion(TestParameters["VK_ConvID"], True, Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_LikeRepostComment() Export

    TestParameters = New Structure();
    Parameters     = GetVKParameters();
    Text           = "Post from autotest";

    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    PostID = Result["response"]["post_id"];

    OPI_TestDataRetrieval.WriteParameter("VK_PostID", PostID);
    OPI_TestDataRetrieval.ParameterToCollection("VK_PostID", TestParameters);

    CLI_VK_LikePost(TestParameters);
    CLI_VK_MakeRepost(TestParameters);
    CLI_VK_WriteComment(TestParameters);
    CLI_VK_ShortenLink(TestParameters);

    OPI_VK.DeletePost(PostID                  , Parameters);
    OPI_VK.DeletePost(TestParameters["Repost"], Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_GetStatistics() Export

    TestParameters = New Structure();

    CLI_VK_GetStatistics(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_GetPostStatistics() Export

    TestParameters = New Structure();

    CLI_VK_GetPostStatistics(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_CreateAdCampaign() Export

    Parameters = GetVKParameters();
    Text       = "Post from autotest";

    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    PostID = Result["response"]["post_id"];

    OPI_TestDataRetrieval.WriteParameter("VK_PostID", PostID);

    TestParameters = New Structure();
    OPI_TestDataRetrieval.ParameterToCollection("VK_AdsCabinetID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VK_PostID"      , TestParameters);

    CLI_VK_CreateAdCampaign(TestParameters);
    CLI_VK_CreateAd(TestParameters);
    CLI_VK_PauseAdvertising(TestParameters);
    CLI_VK_GetAdvertisingCategoryList(TestParameters);

    OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_SendMessage() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("VK_UserID"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VK_CommunityToken", TestParameters);

    CLI_VK_FormKeyboard(TestParameters);
    CLI_VK_WriteMessage(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_GetProductCategories() Export

    TestParameters = New Structure;

    CLI_VK_GetProductCategoryList(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_CreateProductSelection() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);

    CLI_VK_CreateProductCollection(TestParameters);
    CLI_VK_EditProductCollection(TestParameters);
    CLI_VK_GetSelectionsByID(TestParameters);
    CLI_VK_AddProduct(TestParameters);
    CLI_VK_EditProduct(TestParameters);
    CLI_VK_AddProductToCollection(TestParameters);
    CLI_VK_RemoveProductFromCollection(TestParameters);
    CLI_VK_DeleteProduct(TestParameters);
    CLI_VK_DeleteCollection(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKAPI_CreateProductWithProperties() Export

    Parameters = GetVKParameters();

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);

    CLI_VK_GetProductDescription(TestParameters);
    CLI_VK_CreateProductProperty(TestParameters);
    CLI_VK_EditProductProperty(TestParameters);
    CLI_VK_AddProductPropertyVariant(TestParameters);
    CLI_VK_EditProductPropertyVariant(TestParameters);
    CLI_VK_CreateProductWithProp(TestParameters);
    CLI_VK_GetProductsByID(TestParameters);
    CLI_VK_GroupProducts(TestParameters);

    OPI_VK.DeleteProduct(TestParameters["VK_MarketItemID2"], Parameters);
    OPI_VK.DeleteProduct(TestParameters["VK_MarketItemID3"], Parameters);

    CLI_VK_DeleteProductPropertyVariant(TestParameters);
    CLI_VK_DeleteProductProperty(TestParameters);

EndProcedure

Procedure CLI_VKAPI_GetProductList() Export

    TestParameters = New Structure;

    CLI_VK_GetProductList(TestParameters);

EndProcedure

Procedure CLI_VKAPI_GetSelectionList() Export

    TestParameters = New Structure;

    CLI_VK_GetSelectionList(TestParameters);

EndProcedure

Procedure CLI_VKAPI_GetPropertyList() Export

    TestParameters = New Structure;

    CLI_VK_GetPropertyList(TestParameters);

EndProcedure

Procedure CLI_VKAPI_GetOrderList() Export

    TestParameters = New Structure;

    CLI_VK_GetOrderList(TestParameters);

EndProcedure

Procedure CLI_VKAPI_UploadVideo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Video", TestParameters);

    CLI_VK_UploadVideoToServer(TestParameters);

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
    Options.Insert("text" , "<b>Text html %%F0%%9F%%93%%9E 10%%</b>");
    Options.Insert("parsemode", "HTML");
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (HTML)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    // Additional test 2
    Options.Insert("text" , "%%F0%%9F%%A4%%BC");
    Options.Insert("parsemode", "Markdown");
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (emoji)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    // Additional test 3
    Options.Insert("text" , "Text %%F0%%9F%%A5%%9D and emoji \(10%%\)");
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
    FileCopy(Image, ImagePath);

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
    FileCopy(Video, VideoPath);

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
    FileCopy(Audio, AudioPath);

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
    FileCopy(Document, DocumentPath);

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
    FileCopy(GIF, GifPath);

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
    FileCopy(Image, ImagePath);

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

    FileCopy(DocumentURL, DocumentPath);

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

    Name  = "TestTopic " + String(New UUID);
    Icon  = "5357419403325481346";
    Chat  = FunctionParameters["Telegram_ForumID"];
    Token = FunctionParameters["Telegram_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("forum" , Chat);
    Options.Insert("icon"  , Icon);
    Options.Insert("title" , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CreateForumThread", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateForumThread", "Telegram");

    Topic = Result["result"]["message_thread_id"];

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

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("forum" , FunctionParameters["Telegram_ForumID"]);
    Options.Insert("icon"  , "5310132165583840589");
    Options.Insert("title" , "NewTestTitle");
    Options.Insert("topic" , FunctionParameters["Telegram_TopicID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "EditForumTopic", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditForumTopic", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_CloseForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("forum" , Chat);

    OPI_Telegram.OpenForumThread(Token, Chat); // SKIP

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CloseForumThread", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CloseForumTopic (main)");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Options.Insert("topic" , FunctionParameters["Telegram_TopicID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CloseForumThread", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CloseForumThread", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure CLI_Telegram_OpenForumTopic(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("forum" , FunctionParameters["Telegram_ForumID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "OpenForumThread", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "OpenForumTopic (main)");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    Options.Insert("topic" , FunctionParameters["Telegram_TopicID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "OpenForumThread", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "OpenForumThread", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure CLI_Telegram_DeleteForumTopic(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("forum" , FunctionParameters["Telegram_ForumID"]);
    Options.Insert("topic" , FunctionParameters["Telegram_TopicID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteForumTopic", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteForumTopic", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure CLI_Telegram_ClearPinnedMessagesList(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("forum" , FunctionParameters["Telegram_ForumID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ClearThreadPinnedMessagesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearPinnedMessagesList (main)");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Options.Insert("topic" , FunctionParameters["Telegram_TopicID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ClearThreadPinnedMessagesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearThreadPinnedMessagesList", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_HideMainForumTopic(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("forum" , FunctionParameters["Telegram_ForumID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "HideMainForumTopic", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "HideMainForumTopic", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_ShowMainForumTopic(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("forum" , FunctionParameters["Telegram_ForumID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ShowMainForumTopic", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ShowMainForumTopic", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_ChangeMainTopicName(FunctionParameters)


    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("forum" , FunctionParameters["Telegram_ForumID"]);
    Options.Insert("title" , "New main thread name " + String(New UUID));

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "EditMainForumTopicName", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditMainForumTopicName", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_DeleteMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("token"  , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"   , FunctionParameters["Telegram_ChannelID"]);
    Options.Insert("message", FunctionParameters["Telegram_ChannelMessageID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteMessage", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region VK

Procedure CLI_VK_CreateTokenRetrievalLink(FunctionParameters)

    Options = New Structure;
    Options.Insert("app" , FunctionParameters["VK_AppID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateTokenRetrievalLink", Options);

    Result = GetStringFromBinaryData(Result);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTokenRetrievalLink", "VK");
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String").Заполнено();

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_CreatePost(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "Post from autotest";
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image  = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary Data

    TFN = GetTempFileName("png");
    FileCopy(Image2, TFN);

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(TFN);

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("pictures", ImageArray);
    Options.Insert("ad"      , True);
    Options.Insert("url"     , URL);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost", "VK");
    OPI_TestDataRetrieval.Check_VKPost(Result);
    PostID = Result["response"]["post_id"];
    Result = OPI_VK.DeletePost(PostID, Parameters);

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("pictures", Image);
    Options.Insert("ad"      , False);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost (one picture)");
    OPI_TestDataRetrieval.Check_VKPost(Result);

    PostID = Result["response"]["post_id"];
    Result = OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(5);

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("pictures", TFN);
    Options.Insert("ad"      , True);
    Options.Insert("url"     , URL);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost (one path)");
    OPI_TestDataRetrieval.Check_VKPost(Result);

    PostID = Result["response"]["post_id"];
    OPI_Tools.AddField("VK_PostID", PostID, "String", FunctionParameters);
    OPI_TestDataRetrieval.WriteParameter("VK_PostID", FunctionParameters["VK_PostID"]);

    DeleteFiles(TFN);
    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_DeletePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Options = New Structure;
    Options.Insert("post", PostID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeletePost", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

EndProcedure

Procedure CLI_VK_CreateCompositePost(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "Post from autotest";
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Video = FunctionParameters["Video"]; // URL, Path or Binary Data

    TFN = GetTempFileName("png");
    FileCopy(Image, TFN);

    ImageUpload = OPI_VK.UploadPhotoToServer(TFN, Parameters)["response"][0];
    VideoUpload = OPI_VK.UploadVideoToServer(Video, "NewVideo", , , Parameters);

    ImageOwner = OPI_Tools.NumberToString(ImageUpload["owner_id"]);
    VideoOwner = OPI_Tools.NumberToString(VideoUpload["owner_id"]);

    ImageID = OPI_Tools.NumberToString(ImageUpload["id"]);
    VideoID = OPI_Tools.NumberToString(VideoUpload["video_id"]);

    AttachmentsArray = New Array;
    AttachmentsArray.Add("photo" + ImageOwner + "_" + ImageID);
    AttachmentsArray.Add("video" + VideoOwner + "_" + VideoID);

    Options = New Structure;
    Options.Insert("text"   , Text);
    Options.Insert("objects", AttachmentsArray);
    Options.Insert("ad"     , False);
    Options.Insert("url"    , URL);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateCompositePost", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateCompositePost", "VK");
    OPI_TestDataRetrieval.Check_VKPost(Result);
    DeleteFiles(TFN);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_CreatePoll()

    Parameters = GetVKParameters();
    Question   = "What's your favorite color?";

    OptionArray = New Array;
    OptionArray.Add("Red");
    OptionArray.Add("Yellow");
    OptionArray.Add("Green");

    Options = New Structure;
    Options.Insert("question", Question);
    Options.Insert("options" , OptionArray);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePoll", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePoll", "VK");
    OPI_TestDataRetrieval.Check_VKPost(Result);

    PostID = Result["response"]["post_id"];
    OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(10);

EndProcedure

Procedure CLI_VK_CreateAlbum(FunctionParameters)

    Parameters  = GetVKParameters();
    Name        = "AlbumFromAutoTest";
    Description = "NewAlbumFromAutoTest";

    Options = New Structure;
    Options.Insert("title"       , Name);
    Options.Insert("description" , Description);
    Options.Insert("auth"        , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateAlbum", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateAlbum", "VK");
    OPI_TestDataRetrieval.Check_VKAlbum(Result, Description);

    AlbumID = Result["response"]["id"];
    FunctionParameters.Insert("VK_AlbumID", AlbumID);
    OPI_TestDataRetrieval.WriteParameter("VK_AlbumID", AlbumID);

EndProcedure

Procedure CLI_VK_SavePictureToAlbum(FunctionParameters)

    Parameters       = GetVKParameters();
    ImageDescription = "AutoTestImage";
    AlbumID          = FunctionParameters["VK_AlbumID"];

    Image = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("album"       , AlbumID);
    Options.Insert("picture"     , Image);
    Options.Insert("description" , ImageDescription);
    Options.Insert("auth"        , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "SaveImageToAlbum", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "SaveImageToAlbum", "VK");
    OPI_TestDataRetrieval.Check_VKAlbumPicture(Result, ImageDescription, AlbumID);

    ImageID = Result["response"][0]["id"];
    FunctionParameters.Insert("VK_PictureID", ImageID);
    OPI_TestDataRetrieval.WriteParameter("VK_PictureID", ImageID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_DeleteImage(FunctionParameters)

    Parameters = GetVKParameters();
    ImageID    = FunctionParameters["VK_PictureID"];

    Options = New Structure;
    Options.Insert("pictureid", ImageID);
    Options.Insert("auth"     , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteImage", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteImage", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_DeleteAlbum(FunctionParameters)

    Parameters = GetVKParameters();
    AlbumID    = FunctionParameters["VK_AlbumID"];

    Options = New Structure;
    Options.Insert("album", AlbumID);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteAlbum", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteAlbum", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_UploadPhotoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Image = FunctionParameters["Picture"]; // URL, Binary Data or Path to file
    View  = "Post";

    Options = New Structure;
    Options.Insert("file", Image);
    Options.Insert("type", View);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "UploadPhotoToServer", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadVideoToServer", "VK");
    OPI_TestDataRetrieval.Check_VKAlbumPicture(Result, "");

EndProcedure

Procedure CLI_VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path to file or Binary Data
    TFN   = GetTempFileName("png");
    FileCopy(Image, TFN);
    Image = New BinaryData(TFN);

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("url"    , URL);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateStory", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStory", "VK");
    OPI_TestDataRetrieval.Check_VKStory(Result);

    Options = New Structure;
    Options.Insert("picture", TFN);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateStory", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStory (path)");
    OPI_TestDataRetrieval.Check_VKStory(Result);

    DeleteFiles(TFN);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_CreateDiscussion(FunctionParameters)

    Parameters = GetVKParameters();
    Name       = "Discussing: Which color is better?";
    Message    = "Red, yellow, blue, or some other?";

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("text" , Message);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateDiscussion", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDiscussion", "VK");
    OPI_TestDataRetrieval.Check_VKDiscussion(Result);

    DiscussionID = Result["response"];
    FunctionParameters.Insert("VK_ConvID", DiscussionID);
    OPI_TestDataRetrieval.WriteParameter("VK_ConvID", DiscussionID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_CloseDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];

    Options = New Structure;
    Options.Insert("topic" , DiscussionID);
    Options.Insert("remove", False);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CloseDiscussion", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CloseDiscussion", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_OpenDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];

    Options = New Structure;
    Options.Insert("topic" , DiscussionID);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "OpenDiscussion", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "OpenDiscussion", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_PostToDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Message      = "I like yellow more";

    Options = New Structure;
    Options.Insert("topic" , DiscussionID);
    Options.Insert("text"  , Message);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "WriteInDiscussion", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "WriteInDiscussion", "VK");

    OPI_TestDataRetrieval.Check_VKDiscussion(Result);

EndProcedure

Procedure CLI_VK_LikePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Options = New Structure;
    Options.Insert("post" , PostID);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "LikePost", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "LikePost", "VK");
    OPI_TestDataRetrieval.Check_VKLike(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_MakeRepost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = 2571;
    WallID     = -218704372;

    Options = New Structure;
    Options.Insert("post" , PostID);
    Options.Insert("from" , WallID);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "MakeRepost", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeRepost", "VK");
    OPI_TestDataRetrieval.Check_VKRepost(Result);

    FunctionParameters.Insert("Repost", Result["response"]["post_id"]);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_WriteComment(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "NewComment";
    PostID     = FunctionParameters["VK_PostID"];
    WallID     = Parameters["owner_id"];

    Options = New Structure;
    Options.Insert("post" , PostID);
    Options.Insert("wall" , WallID);
    Options.Insert("text" , Text);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "WriteComment", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "WriteComment", "VK");
    OPI_TestDataRetrieval.Check_VKComment(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_ShortenLink(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("url"  , "https://github.com/Bayselonarrend/OpenIntegrations");
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "ShortenLink", Options);

    Result = GetStringFromBinaryData(Result);

    OPI_TestDataRetrieval.WriteLog(Result, "ShortenLink", "VK");
    OPI_TestDataRetrieval.Check_String(Result);

EndProcedure

Procedure CLI_VK_GetStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    CurrentDate = OPI_Tools.GetCurrentDate();
    StartDate   = BegOfDay(CurrentDate);
    EndDate     = EndOfDay(StartDate);

    Options = New Structure;
    Options.Insert("datefrom", StartDate);
    Options.Insert("dateto"  , EndDate);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetStatistics", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetStatistics", "VK");
    OPI_TestDataRetrieval.Check_VKStatistic(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetPostStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    ArrayOfPosts = New Array;
    ArrayOfPosts.Add(214);
    ArrayOfPosts.Add(215);

    Options = New Structure;
    Options.Insert("posts", ArrayOfPosts);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetPostStatistics", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetPostStatistics", "VK");
    OPI_TestDataRetrieval.Check_VKPostsStatistic(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_CreateAdCampaign(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    Name      = "New campaign";

    Options = New Structure;
    Options.Insert("cabinet", AccountID);
    Options.Insert("title"  , Name);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateAdvertisingCampaign", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateAdvertisingCampaign", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

    CampaignID = Result["response"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("VK_AdsCampaignID", CampaignID);
    FunctionParameters.Insert("VK_AdsCampaignID", CampaignID);

EndProcedure

Procedure CLI_VK_CreateAd(FunctionParameters)

    Parameters = GetVKParameters();

    CampaignNumber = FunctionParameters["VK_AdsCampaignID"];
    DailyLimit     = 150;
    CategoryNumber = 126;
    PostID         = FunctionParameters["VK_PostID"];
    AccountID      = FunctionParameters["VK_AdsCabinetID"];


    Options = New Structure;
    Options.Insert("campaign", CampaignNumber);
    Options.Insert("limit"   , DailyLimit);
    Options.Insert("category", CategoryNumber);
    Options.Insert("post"    , PostID);
    Options.Insert("cabinet" , AccountID);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateAd", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateAd", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

    AnnouncementID = Result["response"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("VK_AdsPostID", AnnouncementID);
    FunctionParameters.Insert("VK_AdsPostID", AnnouncementID);

EndProcedure

Procedure CLI_VK_PauseAdvertising(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    AdID      = FunctionParameters["VK_AdsPostID"];

    Options = New Structure;
    Options.Insert("adv"     , AdID);
    Options.Insert("cabinet" , AccountID);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "PauseAdvertising", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "PauseAdvertising", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_VK_GetAdvertisingCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetAdvertisingCategoryList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetAdvertisingCategoryList", "VK");
    OPI_TestDataRetrieval.Check_VKCategories(Result);

EndProcedure

Procedure CLI_VK_FormKeyboard(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Keyboard = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "FormKeyboard", Options);
    Keyboard = OPI_Tools.JSONString(Keyboard);

    OPI_TestDataRetrieval.Check_String(Keyboard);

EndProcedure

Procedure CLI_VK_WriteMessage(FunctionParameters)

    Parameters = GetVKParameters();

    Text           = "Message from autotest";
    UserID         = FunctionParameters["VK_UserID"];
    Communitytoken = FunctionParameters["VK_CommunityToken"];

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Keyboard = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "FormKeyboard", Options);

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("user"    , UserID);
    Options.Insert("ct"      , Communitytoken);
    Options.Insert("keyboard", Keyboard);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "WriteMessage", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "WriteMessage", "VK");
    OPI_TestDataRetrieval.Check_VKNumber(Result);

EndProcedure

Procedure CLI_VK_GetProductCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductCategoryList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCategoryList", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_VK_CreateProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name   = "TestCollection";
    Image  = FunctionParameters["Picture"];
    Main   = True;
    Hidden = False;

    Options = New Structure;
    Options.Insert("title"  , Name);
    Options.Insert("picture", Image);
    Options.Insert("main"   , Main);
    Options.Insert("hidden" , Hidden);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateProductCollection", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductCollection", "VK");
    OPI_TestDataRetrieval.Check_VKCollection(Result);

    OPI_Tools.Pause(5);

    SelectionID = Result["response"]["market_album_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketAlbumID", SelectionID);
    FunctionParameters.Insert("VK_MarketAlbumID", SelectionID);

EndProcedure

Procedure CLI_VK_EditProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name      = "EditedCollection";
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("sel"  , Selection);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProductCollection", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "EditProductCollection", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetSelectionsByID(FunctionParameters)

    Parameters = GetVKParameters();
    Selection  = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sels" , Selection);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetSelectionsByID", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetSelectionsByID", "VK");
    OPI_TestDataRetrieval.Check_VKElement(Result);

EndProcedure

Procedure CLI_VK_AddProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Image1    = FunctionParameters["Picture"]; // URL, Binary or Path to file
    Image2    = FunctionParameters["Picture2"]; // URL, Binary or Path to file
    Selection = FunctionParameters["VK_MarketAlbumID"];

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    ProductDescription = New Map();
    ProductDescription.Insert("Name"             , "TestProduct");
    ProductDescription.Insert("Description"      , "Product description");
    ProductDescription.Insert("Category"         , "20173");
    ProductDescription.Insert("Price"            , 1);
    ProductDescription.Insert("OldPrice"         , 15);
    ProductDescription.Insert("MainPhoto"        , Image1);
    ProductDescription.Insert("URL"              , "https://github.com/Bayselonarrend/OpenIntegrations");
    ProductDescription.Insert("AdditionalPhotos" , ImageArray);
    ProductDescription.Insert("MainInGroup"      , True);
    ProductDescription.Insert("Width"            , 20);
    ProductDescription.Insert("Height"           , 30);
    ProductDescription.Insert("Depth"            , 40);
    ProductDescription.Insert("Weight"           , 100);
    ProductDescription.Insert("SKU"              , "12345");
    ProductDescription.Insert("AvailableBalance" , "10");

    Options = New Structure;
    Options.Insert("product", ProductDescription);
    Options.Insert("sel"    , Selection);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProduct", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "AddProduct", "VK");
    OPI_TestDataRetrieval.Check_VKProduct(Result);

    ProductID = Result["response"]["market_item_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketItemID", ProductID);
    FunctionParameters.Insert("VK_MarketItemID", ProductID);

EndProcedure

Procedure CLI_VK_EditProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    ProductDescription = New Map;
    ProductDescription.Insert("Name", "EditedTestProduct");

    Options = New Structure;
    Options.Insert("product", ProductDescription);
    Options.Insert("item"   , Product);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProduct", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "EditProduct", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

EndProcedure

Procedure CLI_VK_AddProductToCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sel"  , Selection);
    Options.Insert("items", Product);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProductToCollection", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "AddProductToCollection", "VK");
    OPI_TestDataRetrieval.Check_VKNumber(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_RemoveProductFromCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sel" , Selection);
    Options.Insert("item", Product);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "RemoveProductFromSelection", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveProductFromSelection", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_DeleteProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    Options = New Structure;
    Options.Insert("item", Product);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProduct", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProduct", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_DeleteCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sel" , Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteSelection", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSelection", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_CreateProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name = "Color";

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateProductProperty", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductProperty", "VK");
    OPI_TestDataRetrieval.Check_VKProp(Result);

    OPI_Tools.Pause(5);

    Property = Result["response"]["property_id"];
    Property = OPI_Tools.NumberToString(Property);

    OPI_TestDataRetrieval.WriteParameter("VK_PropID", Property);
    FunctionParameters.Insert("VK_PropID", Property);

EndProcedure

Procedure CLI_VK_EditProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name     = "Color (change.)";
    Property = FunctionParameters["VK_PropID"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("prop" , Property);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProductProperty", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "EditProductProperty", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_AddProductPropertyVariant(FunctionParameters)

    Counter    = 1; // SKIP
    Parameters = GetVKParameters();

    Property    = FunctionParameters["VK_PropID"];
    OptionArray = New Array;
    OptionArray.Add("Yellow");
    OptionArray.Add("Blue");
    OptionArray.Add("Red");

    For Each Value In OptionArray Do

        Options = New Structure;
        Options.Insert("value", Value);
        Options.Insert("prop" , Property);
        Options.Insert("auth" , Parameters);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProductPropertyVariant", Options);

        OPI_TestDataRetrieval.WriteLog(Result, "AddProductPropertyVariant", "VK");
        OPI_TestDataRetrieval.Check_VKPropVariant(Result);
        OPI_Tools.Pause(5);

        VariantID     = Result["response"]["variant_id"];
        ParameterName = "VK_PropVarID" + String(Counter);

        OPI_TestDataRetrieval.WriteParameter(ParameterName, VariantID);
        FunctionParameters.Insert(ParameterName, VariantID);
        Counter = Counter + 1;

    EndDo;

EndProcedure

Procedure CLI_VK_EditProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];
    Option   = FunctionParameters["VK_PropVarID1"];
    Value    = "New variant name";

    Options = New Structure;
    Options.Insert("value" , Value);
    Options.Insert("prop"  , Property);
    Options.Insert("option", Option);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProductPropertyVariant", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "EditProductPropertyVariant", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

EndProcedure

Procedure CLI_VK_CreateProductWithProp(FunctionParameters)

    Parameters = GetVKParameters();

    Image1       = FunctionParameters["Picture"];
    Image2       = FunctionParameters["Picture2"];
    PropVariant1 = FunctionParameters["VK_PropVarID1"];
    PropVariant2 = FunctionParameters["VK_PropVarID2"];

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Product = New Map();
    Product.Insert("Name"             , "Test product (with prop)");
    Product.Insert("Description"      , "Product description");
    Product.Insert("Category"         , "20173");
    Product.Insert("Price"            , 1);
    Product.Insert("OldPrice"         , 15);
    Product.Insert("MainPhoto"        , Image1);
    Product.Insert("URL"              , "https://github.com/Bayselonarrend/OpenIntegrations");
    Product.Insert("AdditionalPhotos" , ImageArray);
    Product.Insert("MainInGroup"      , True);
    Product.Insert("GroupNumber"      , Undefined);
    Product.Insert("Width"            , 20);
    Product.Insert("Height"           , 30);
    Product.Insert("Depth"            , 40);
    Product.Insert("Weight"           , 100);
    Product.Insert("SKU"              , 12345);
    Product.Insert("AvailableBalance" , "10");
    Product.Insert("PropertyValues"   , PropVariant1);

    Options = New Structure;
    Options.Insert("product", Product);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProduct", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "ProductWithProp1");
    OPI_TestDataRetrieval.Check_VKProduct(Result);

    ProductID = Result["response"]["market_item_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketItemID2", ProductID);
    FunctionParameters.Insert("VK_MarketItemID2", ProductID);

    Product.Insert("Name"          , "Test product (another)");
    Product.Insert("PropertyValues", PropVariant2);

    Options = New Structure;
    Options.Insert("product", Product);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProduct", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "ProductWithProp2");
    OPI_TestDataRetrieval.Check_VKProduct(Result);

    ProductID = Result["response"]["market_item_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketItemID3", ProductID);
    FunctionParameters.Insert("VK_MarketItemID3", ProductID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetProductsByID(FunctionParameters)

    Parameters = GetVKParameters();

    Item1 = FunctionParameters["VK_MarketItemID2"];
    Item2 = FunctionParameters["VK_MarketItemID3"];

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Options = New Structure;
    Options.Insert("items", ProductsArray);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductsByID", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsByID", "VK");
    OPI_TestDataRetrieval.Check_VKProductData(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GroupProducts(FunctionParameters)

    Parameters = GetVKParameters();

    Item1 = FunctionParameters["VK_MarketItemID2"];
    Item2 = FunctionParameters["VK_MarketItemID3"];

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Options = New Structure;
    Options.Insert("items", ProductsArray);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GroupProducts", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GroupProducts", "VK");
    OPI_TestDataRetrieval.Check_VKProductsGroup(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_DeleteProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Option = FunctionParameters["VK_PropVarID1"];

    Options = New Structure;
    Options.Insert("option", Option);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProductPropertyVariant", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductPropertyVariant", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_DeleteProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];

    Options = New Structure;
    Options.Insert("prop", Property);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProductProperty", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductProperty");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetProductDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductDescription", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductDescription", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_VK_GetProductList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductList", "VK");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetSelectionList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetSelectionList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetSelectionList", "VK");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetPropertyList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetPropertyList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetPropertyList", "VK");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetOrderList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetOrderList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetOrderList", "VK");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_UploadVideoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Video       = FunctionParameters["Video"]; // URL, Binary Data or Path to file
    Name        = "NewVideo";
    Description = "Video description";

    Options = New Structure;
    Options.Insert("file"       , Video);
    Options.Insert("title"      , Name);
    Options.Insert("description", Description);
    Options.Insert("auth"       , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "UploadVideoToServer", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadVideoToServer", "VK");
    OPI_TestDataRetrieval.Check_VKVideo(Result);

    OPI_Tools.Pause(5);

EndProcedure


#EndRegion

#EndRegion

#EndRegion


