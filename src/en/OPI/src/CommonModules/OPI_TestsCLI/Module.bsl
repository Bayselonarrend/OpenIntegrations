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

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

   Return OPI_TestDataRetrieval.FormAssertsTestsCLI();

EndFunction

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
    CLI_Telegram_FormKeyboardFromButtonArray(TestParameters);

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

#Region YandexDisk

Procedure CLI_YDisk_GetDiskInfo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    CLI_YandexDisk_GetDiskInfo(TestParameters);

EndProcedure

Procedure CLI_YDisk_CreateFolder() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    CLI_YandexDisk_CreateFolder(TestParameters);

EndProcedure

Procedure CLI_YDisk_UploadByUrlAndGetObject() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    CLI_YandexDisk_UploadFileByURL(TestParameters);
    CLI_YandexDisk_GetObject(TestParameters);
    CLI_YandexDisk_DeleteObject(TestParameters);

EndProcedure

Procedure CLI_YDisk_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    CLI_YandexDisk_UploadFile(TestParameters);

EndProcedure

Procedure CLI_YDisk_CreateObjectCopy() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    OriginalPath = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_OriginalFilePath", OriginalPath);
    TestParameters.Insert("YandexDisk_OriginalFilePath", OriginalPath);

    CLI_YandexDisk_CreateObjectCopy(TestParameters);

    CopyPath = TestParameters["YandexDisk_CopyFilePath"];

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, CopyPath    , False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YDisk_GetDownloadLink() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    Path = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, Path, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_PathForLink", Path);
    TestParameters.Insert("YandexDisk_PathForLink", Path);

    CLI_YandexDisk_GetDownloadLink(TestParameters);
    CLI_YandexDisk_DownloadFile(TestParameters);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure CLI_YDisk_GetFileList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    CLI_YandexDisk_GetFilesList(TestParameters);

EndProcedure

Procedure CLI_YDisk_MoveObject() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    OriginalPath = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_OriginalFilePath", OriginalPath);
    TestParameters.Insert("YandexDisk_OriginalFilePath", OriginalPath);

    CLI_YandexDisk_MoveObject(TestParameters);

    NewPath = TestParameters["YandexDisk_NewFilePath"];

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, NewPath     , False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YDisk_PublicObjectActions() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    Token = TestParameters["YandexDisk_Token"];
    URL   = TestParameters["Picture"];

    OriginalPath = "/" + String(New UUID) + ".png";

    OPI_YandexDisk.UploadFileByURL(Token, OriginalPath, URL);
    OPI_Tools.Pause(35);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_OriginalFilePath", OriginalPath);
    TestParameters.Insert("YandexDisk_OriginalFilePath", OriginalPath);

    CLI_YandexDisk_PublishObject(TestParameters);
    CLI_YandexDisk_GetDownloadLinkForPublicObject(TestParameters);
    CLI_YandexDisk_GetPublicObject(TestParameters);
    CLI_YandexDisk_SavePublicObjectToDisk(TestParameters);
    CLI_YandexDisk_CancelObjectPublication(TestParameters);

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YDisk_GetPublishedList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    CLI_YandexDisk_GetPublishedObjectsList(TestParameters);

EndProcedure

#EndRegion

#Region Viber

Procedure CLI_Viber_DataRetrieval() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelToken"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelAdminID", TestParameters);

    CLI_Viber_GetChannelInformation(TestParameters);
    CLI_Viber_GetUserData(TestParameters);
    CLI_Viber_GetOnlineUsers(TestParameters);
    CLI_Viber_SetWebhook(TestParameters);

EndProcedure

Procedure CLI_Viber_MessagesSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelToken"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelAdminID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_Token"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_UserID"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"            , TestParameters);

    CLI_Viber_CreateKeyboardFromArrayButton(TestParameters);
    CLI_Viber_SendTextMessage(TestParameters);
    CLI_Viber_SendImage(TestParameters);
    CLI_Viber_SendFile(TestParameters);
    CLI_Viber_SendContact(TestParameters);
    CLI_Viber_SendLocation(TestParameters);
    CLI_Viber_SendLink(TestParameters);

EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure CLI_GW_Auth() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);

    CLI_GoogleWorkspace_FormCodeRetrievalLink(TestParameters);
    CLI_GoogleWorkspace_GetTokenByCode(TestParameters);
    CLI_GoogleWorkspace_RefreshToken(TestParameters);

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure CLI_GC_GetCalendarList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    CLI_GoogleCalendar_GetCalendarList(TestParameters);

EndProcedure

Procedure CLI_GC_CreateDeleteCalendar() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    CLI_GoogleCalendar_CreateCalendar(TestParameters);
    CLI_GoogleCalendar_EditCalendarMetadata(TestParameters);
    CLI_GoogleCalendar_GetCalendarMetadata(TestParameters);
    CLI_GoogleCalendar_AddCalendarToList(TestParameters);
    CLI_GoogleCalendar_EditListCalendar(TestParameters);
    CLI_GoogleCalendar_GetListCalendar(TestParameters);
    CLI_GoogleCalendar_ClearMainCalendar(TestParameters);
    CLI_GoogleCalendar_DeleteCalendarFromList(TestParameters);
    CLI_GoogleCalendar_DeleteCalendar(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GC_CreateDeleteEvent() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_NewCalendarID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_CalendarID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"            , TestParameters);

    CLI_GoogleCalendar_CreateCalendar(TestParameters);
    CLI_GoogleCalendar_CreateEvent(TestParameters);
    CLI_GoogleCalendar_EditEvent(TestParameters);
    CLI_GoogleCalendar_GetEvent(TestParameters);
    CLI_GoogleCalendar_MoveEvent(TestParameters);
    CLI_GoogleCalendar_GetEventList(TestParameters);
    CLI_GoogleCalendar_DeleteEvent(TestParameters);
    CLI_GoogleCalendar_DeleteCalendar(TestParameters);
    CLI_GoogleCalendar_GetEventDescription(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleDrive

Procedure CLI_GD_GetCatalogList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    CLI_GoogleDrive_GetDirectoriesList(TestParameters);
    CLI_GoogleDrive_GetObjectInformation(TestParameters);

EndProcedure

Procedure CLI_GD_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"    , TestParameters);

    TestParameters.Insert("ArrayOfDeletions", New Array);

    CLI_GoogleDrive_UploadFile(TestParameters);
    CLI_GoogleDrive_CopyObject(TestParameters);
    CLI_GoogleDrive_DownloadFile(TestParameters);
    CLI_GoogleDrive_UpdateFile(TestParameters);
    CLI_GoogleDrive_GetFilesList(TestParameters);
    CLI_GoogleDrive_DeleteObject(TestParameters);
    CLI_GoogleDrive_GetFileDescription(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GD_CreateDeleteComment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);

    TestParameters.Insert("ArrayOfDeletions", New Array);

    CLI_GoogleDrive_UploadFile(TestParameters);

    CLI_GoogleDrive_CreateComment(TestParameters);
    CLI_GoogleDrive_GetComment(TestParameters);
    CLI_GoogleDrive_GetCommentList(TestParameters);
    CLI_GoogleDrive_DeleteComment(TestParameters);

    CLI_GoogleDrive_DeleteObject(TestParameters);

EndProcedure

Procedure CLI_GD_CreateCatalog() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);

    CLI_GoogleDrive_CreateFolder(TestParameters);

EndProcedure

#EndRegion

#Region GoogleSheets

Procedure CLI_GT_CreateTable() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    CLI_GoogleSheets_CreateSpreadsheet(TestParameters);
    CLI_GoogleSheets_GetSpreadsheet(TestParameters);
    CLI_GoogleSheets_CopySheet(TestParameters);
    CLI_GoogleSheets_AddSheet(TestParameters);
    CLI_GoogleSheets_DeleteSheet(TestParameters);
    CLI_GoogleSheets_EditSpreadsheetTitle(TestParameters);
    CLI_GoogleSheets_GetTable(TestParameters);

    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet"]);
    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet2"]);

EndProcedure

Procedure CLI_GT_FillClearCells() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token" , TestParameters);

    CLI_GoogleSheets_CreateSpreadsheet(TestParameters);
    CLI_GoogleSheets_SetCellValues(TestParameters);
    CLI_GoogleSheets_GetCellValues(TestParameters);
    CLI_GoogleSheets_ClearCells(TestParameters);

    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet"]);
    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet2"]);

EndProcedure

#EndRegion

#Region Twitter

Procedure CLI_TwitterAPI_AccountData() Export

    TestParameters = New Structure;

    CLI_Twitter_GetToken(TestParameters);
    CLI_Twitter_GetAuthorizationLink(TestParameters);
    CLI_Twitter_RefreshToken(TestParameters);

EndProcedure

Procedure CLI_TwitterAPI_Tweets() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GIF"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"   , TestParameters);


    CLI_Twitter_CreateTextTweet(TestParameters);
    CLI_Twitter_UploadAttachmentsArray(TestParameters);
    CLI_Twitter_CreateVideoTweet(TestParameters);
    CLI_Twitter_CreateImageTweet(TestParameters);
    CLI_Twitter_CreateGifTweet(TestParameters);
    CLI_Twitter_CreatePollTweet(TestParameters);
    CLI_Twitter_CreateCustomTweet(TestParameters);

EndProcedure

#EndRegion

#Region Notion

Procedure CLI_NotionAPI_CreatePage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"     , TestParameters);

    CLI_Notion_CreatePage(TestParameters);
    CLI_Notion_GetPage(TestParameters);
    CLI_Notion_EditPageProperties(TestParameters);

EndProcedure

Procedure CLI_NotionAPI_CreateUpdateBase() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);

    CLI_Notion_CreateDatabase(TestParameters);
    CLI_Notion_EditDatabaseProperties(TestParameters);
    CLI_Notion_GetDatabase(TestParameters);
    CLI_Notion_CreatePageInDatabase(TestParameters);

EndProcedure

Procedure CLI_NotionAPI_CreateDeleteBlock() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Block" , TestParameters);

    CLI_Notion_ReturnBlock(TestParameters);
    CLI_Notion_CreateBlock(TestParameters);
    CLI_Notion_ReturnChildBlocks(TestParameters);
    CLI_Notion_DeleteBlock(TestParameters);

EndProcedure

Procedure CLI_NotionAPI_GetUsers() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_User" , TestParameters);

    CLI_Notion_UserList(TestParameters);
    CLI_Notion_GetUserData(TestParameters);

EndProcedure

#EndRegion

#Region Slack

Procedure CLI_SlackGetData() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token", TestParameters);

    CLI_Slack_GetBotInformation(TestParameters);
    CLI_Slack_GetUserList(TestParameters);
    CLI_Slack_GetWorkspaceList(TestParameters);

EndProcedure

Procedure CLI_Slack_SendDeleteMessage() Export


    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Channel", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User"   , TestParameters);

    CLI_Slack_SendMessage(TestParameters);
    CLI_Slack_EditMessage(TestParameters);
    CLI_Slack_GetMessageReplyList(TestParameters);
    CLI_Slack_GetMessageLink(TestParameters);
    CLI_Slack_DeleteMessage(TestParameters);
    CLI_Slack_SendEphemeralMessage(TestParameters);
    CLI_Slack_GetDelayedMessageList(TestParameters);
    CLI_Slack_GenerateImageBlock(TestParameters);

EndProcedure

Procedure CLI_Slack_CreateArchiveChannel() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User"  , TestParameters);

    CLI_Slack_CreateChannel(TestParameters);
    CLI_Slack_SetChannelTopic(TestParameters);
    CLI_Slack_SetChannelGoal(TestParameters);
    CLI_Slack_GetChannel(TestParameters);
    CLI_Slack_InviteUsersToChannel(TestParameters);
    CLI_Slack_KickUserFromChannel(TestParameters);
    CLI_Slack_GetChannelHistory(TestParameters);
    CLI_Slack_GetChannelUserList(TestParameters);
    CLI_Slack_LeaveChannel(TestParameters);
    CLI_Slack_JoinChannel(TestParameters);
    CLI_Slack_RenameChannel(TestParameters);
    CLI_Slack_ArchiveChannel(TestParameters);
    CLI_Slack_GetChannelList(TestParameters);

EndProcedure

Procedure CLI_Slack_OpenCloseDialog() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User"  , TestParameters);

    CLI_Slack_OpenDialog(TestParameters);
    CLI_Slack_CloseDialog(TestParameters);

EndProcedure

Procedure CLI_Slack_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Channel", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"     , TestParameters);

    CLI_Slack_GetFilesList(TestParameters);
    CLI_Slack_UploadFile(TestParameters);
    CLI_Slack_MakeFilePublic(TestParameters);
    CLI_Slack_MakeFilePrivate(TestParameters);
    CLI_Slack_GetFileData(TestParameters);
    CLI_Slack_DeleteFile(TestParameters);

EndProcedure

Procedure CLI_Slack_UploadDeleteExternalFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Channel", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"     , TestParameters);

    CLI_Slack_GetExternalFileList(TestParameters);
    CLI_Slack_AddExternalFile(TestParameters);
    CLI_Slack_GetExternalFile(TestParameters);
    CLI_Slack_SendExternalFile(TestParameters);
    CLI_Slack_DeleteExternalFile(TestParameters);

EndProcedure

#EndRegion

#Region Airtable

Procedure CLI_AT_CreateDatabase() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Workspace", TestParameters);

    CLI_Airtable_CreateDatabase(TestParameters);
    CLI_Airtable_GetDatabaseTables(TestParameters);
    CLI_Airtable_GetListOfBases(TestParameters);

EndProcedure

Procedure CLI_AT_CreateTable() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);

    CLI_Airtable_GetNumberField(TestParameters);
    CLI_Airtable_GetStringField(TestParameters);
    CLI_Airtable_GetAttachmentField(TestParameters);
    CLI_Airtable_GetCheckboxField(TestParameters);
    CLI_Airtable_GetDateField(TestParameters);
    CLI_Airtable_GetPhoneField(TestParameters);
    CLI_Airtable_GetEmailField(TestParameters);
    CLI_Airtable_GetLinkField(TestParameters);
    CLI_Airtable_CreateTable(TestParameters);
    CLI_Airtable_ModifyTable(TestParameters);

EndProcedure

Procedure CLI_AT_CreateField() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Table", TestParameters);

    CLI_Airtable_CreateField(TestParameters);
    CLI_Airtable_ModifyField(TestParameters);

EndProcedure

Procedure CLI_AT_CreateDeleteRecords() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Table", TestParameters);

    CLI_Airtable_CreatePosts(TestParameters);
    CLI_Airtable_GetRecord(TestParameters);
    CLI_Airtable_CreateComment(TestParameters);
    CLI_Airtable_EditComment(TestParameters);
    CLI_Airtable_GetComments(TestParameters);
    CLI_Airtable_DeleteComment(TestParameters);
    CLI_Airtable_GetListOfRecords(TestParameters);
    CLI_Airtable_DeletePosts(TestParameters);

EndProcedure

#EndRegion

#Region Dropbox

Procedure CLI_DropboxAPI_GetUpdateToken() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Appkey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Appsecret", TestParameters);

    CLI_Dropbox_GetAuthorizationLink(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Code", TestParameters);

    CLI_Dropbox_GetToken(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Refresh", TestParameters);

    CLI_Dropbox_UpdateToken(TestParameters);

EndProcedure

Procedure CLI_DropboxAPI_UploadFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);

    CLI_Dropbox_UploadFile(TestParameters);
    CLI_Dropbox_GetObjectInformation(TestParameters);
    CLI_Dropbox_GetObjectVersionList(TestParameters);
    CLI_Dropbox_RestoreObjectToVersion(TestParameters);
    CLI_Dropbox_GetPreview(TestParameters);
    CLI_Dropbox_DownloadFile(TestParameters);
    CLI_Dropbox_MoveObject(TestParameters);
    CLI_Dropbox_CopyObject(TestParameters);
    CLI_Dropbox_DeleteObject(TestParameters);

EndProcedure

Procedure CLI_DropboxAPI_CreateFolder() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    CLI_Dropbox_CreateFolder(TestParameters);
    CLI_Dropbox_DownloadFolder(TestParameters);

EndProcedure

Procedure CLI_DropboxAPI_GetFolderFileList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    CLI_Dropbox_GetFolderFileList(TestParameters);

EndProcedure

Procedure CLI_DropboxAPI_UploadFileByURL() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"     , TestParameters);

    CLI_Dropbox_UploadFileByURL(TestParameters);
    CLI_Dropbox_GetUploadStatusByURL(TestParameters);

EndProcedure

Procedure CLI_DropboxAPI_CreateDeleteTag() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    CLI_Dropbox_AddTag(TestParameters);
    CLI_Dropbox_GetTagList(TestParameters);
    CLI_Dropbox_DeleteTag(TestParameters);

EndProcedure

Procedure CLI_DropboxAPI_GetAccount() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    CLI_Dropbox_GetAccountInformation(TestParameters);
    CLI_Dropbox_GetSpaceUsageData(TestParameters);

EndProcedure

Procedure CLI_DropboxAPI_AccessManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_OtherUser", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_FileID"   , TestParameters);

    CLI_Dropbox_AddUsersToFile(TestParameters);
    CLI_Dropbox_PublishFolder(TestParameters);
    CLI_Dropbox_AddUsersToFolder(TestParameters);
    CLI_Dropbox_CancelFolderPublication(TestParameters);
    CLI_Dropbox_GetAsynchronousChangeStatus(TestParameters);
    CLI_Dropbox_CancelFilePublication(TestParameters);

EndProcedure

#EndRegion

#Region VkTeams

Procedure CLI_VKT_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_FileID", TestParameters);

    CLI_VkTeams_CheckToken(TestParameters);
    CLI_VkTeams_GetEvents(TestParameters);
    CLI_VKTeams_GetFileInformation(TestParameters);

EndProcedure

Procedure CLI_VKT_MessagesSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID2"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_MessageID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio2"           , TestParameters);

    CLI_VkTeams_SendTextMessage(TestParameters);
    OPI_Tools.Pause(60);

    CLI_VKTeams_ForwardMessage(TestParameters);
    CLI_VKTeams_SendFile(TestParameters);
    CLI_VKTeams_ResendFile(TestParameters);
    CLI_VKTeams_EditMessageText(TestParameters);
    CLI_VKTeams_PinMessage(TestParameters);
    CLI_VKTeams_UnpinMessage(TestParameters);
    CLI_VKTeams_DeleteMessage(TestParameters);
    CLI_VKTeams_SendVoice(TestParameters);
    CLI_VKTeams_ResendVoice(TestParameters);

EndProcedure

Procedure CLI_VKT_ChatManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_Token"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID2" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture3"        , TestParameters);

    CLI_VKTeams_RemoveChatMembers(TestParameters);
    CLI_VKTeams_ChangeChatPicture(TestParameters);
    CLI_VKTeams_GetChatInfo(TestParameters);
    CLI_VKTeams_GetChatAdmins(TestParameters);
    CLI_VKTeams_GetChatMembers(TestParameters);
    CLI_VKTeams_GetChatBlockedUsers(TestParameters);
    CLI_VKTeams_GetChatJoinRequests(TestParameters);
    CLI_VKTeams_BlockChatUser(TestParameters);
    CLI_VKTeams_UnblockChatUser(TestParameters);
    CLI_VKTeams_ApprovePending(TestParameters);
    CLI_VKTeams_DisapprovePending(TestParameters);
    CLI_VKTeams_SetChatTitle(TestParameters);
    CLI_VKTeams_SetChatDescription(TestParameters);
    CLI_VKTeams_SetChatRules(TestParameters);

EndProcedure

#EndRegion

#Region OzonSeller

Procedure CLI_OzonAPI_AttributesAndFeatures() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    CLI_Ozon_GetCategoriesAndProductTypesTree(TestParameters);
    CLI_Ozon_GetCategoryAttributes(TestParameters);
    CLI_Ozon_GetAttributeValues(TestParameters);
    CLI_Ozon_SearchAttributeValue(TestParameters);
    CLI_Ozon_GetProductsRequestsLimits(TestParameters);

EndProcedure

Procedure CLI_OzonAPI_UploadingAndUpdatingProducts() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"      , TestParameters);

    CLI_Ozon_GetProductStructure(TestParameters);
    CLI_Ozon_CreateUpdateProducts(TestParameters);
    CLI_Ozon_GetProductCreationStatus(TestParameters);
    CLI_Ozon_AddProductVideo(TestParameters);
    CLI_Ozon_AddProductVideoCover(TestParameters);
    CLI_Ozon_CompleteComplexAttribute(TestParameters);
    CLI_Ozon_CreateProductByOzonID(TestParameters);
    CLI_Ozon_GetSimplifiedProductStructure(TestParameters);
    CLI_Ozon_GetAttributesUpdateStructure(TestParameters);
    CLI_Ozon_UpdateProductsAttributes(TestParameters);
    CLI_Ozon_GetProductsFilterStructure(TestParameters);
    CLI_Ozon_GetProductList(TestParameters);
    CLI_Ozon_GetProductsAttributesData(TestParameters);
    CLI_Ozon_GetProductsInformation(TestParameters);
    CLI_Ozon_GetProductsContentRating(TestParameters);
    CLI_Ozon_GetProductDescription(TestParameters);
    CLI_Ozon_UpdateProductImages(TestParameters);
    CLI_Ozon_CheckProductsImagesUpload(TestParameters);
    CLI_Ozon_UpdateProductsArticles(TestParameters);
    CLI_Ozon_ArchiveProducts(TestParameters);
    CLI_Ozon_UnarchiveProducts(TestParameters);
    CLI_Ozon_UploadProductActivationCodes(TestParameters);
    CLI_Ozon_GetCodesUploadStatus(TestParameters);
    CLI_Ozon_GetProductSubscribersCount(TestParameters);
    CLI_Ozon_GetRelatedSKUs(TestParameters);
    CLI_Ozon_DeleteProductsWithoutSKU(TestParameters);

EndProcedure

Procedure CLI_OzonAPI_Barcodes() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ProductID", TestParameters);

    CLI_Ozon_BindBarcodes(TestParameters);
    CLI_Ozon_CreateBarcodes(TestParameters);

EndProcedure

Procedure CLI_OzonAPI_PricesAndStocks() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ProductID", TestParameters);

    CLI_Ozon_GetProductsStocks(TestParameters);
    CLI_Ozon_UpdateProductsPrices(TestParameters);
    CLI_Ozon_UpdateProductsStocks(TestParameters);
    CLI_Ozon_GetProductsPrices(TestParameters);
    CLI_Ozon_GetDiscountInformation(TestParameters);
    CLI_Ozon_SetProductDiscount(TestParameters);
    CLI_Ozon_GetProductStocksStructure(TestParameters);
    CLI_Ozon_GetProductPriceStructure(TestParameters);

EndProcedure

Procedure CLI_OzonAPI_WarehousesManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    CLI_Ozon_GetWarehousesList(TestParameters);

EndProcedure

Procedure CLI_OzonAPI_PromotionsManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    CLI_Ozon_GetPromotionsList(TestParameters);
    CLI_Ozon_GetCurrentPromoProducts(TestParameters);
    CLI_Ozon_GetAvailablePromoProducts(TestParameters);

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

Procedure CLI_Telegram_FormKeyboardFromButtonArray(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "FormKeyboardFromButtonArray", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "FormKeyboardFromButtonArray", "Telegram");
    OPI_TestDataRetrieval.Check_Map(Result);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTokenRetrievalLink", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePost", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePost (one picture)");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePost (one path)");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeletePost", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCompositePost", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePoll", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateAlbum", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SaveImageToAlbum", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteImage", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteAlbum", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadVideoToServer", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateStory", "VK");
    OPI_TestDataRetrieval.Check_VKStory(Result);

    Options = New Structure;
    Options.Insert("picture", TFN);
    Options.Insert("auth"   , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateStory", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateStory (path)");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDiscussion", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CloseDiscussion", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "OpenDiscussion", "VK");

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "WriteInDiscussion", "VK");

    OPI_TestDataRetrieval.Check_VKDiscussion(Result);

EndProcedure

Procedure CLI_VK_LikePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Options = New Structure;
    Options.Insert("post" , PostID);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "LikePost", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "LikePost", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeRepost", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "WriteComment", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ShortenLink", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStatistics", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPostStatistics", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateAdvertisingCampaign", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateAd", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PauseAdvertising", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_VK_GetAdvertisingCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetAdvertisingCategoryList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAdvertisingCategoryList", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "WriteMessage", "VK");
    OPI_TestDataRetrieval.Check_VKNumber(Result);

EndProcedure

Procedure CLI_VK_GetProductCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductCategoryList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductCategoryList", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateProductCollection", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditProductCollection", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetSelectionsByID", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddProduct", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditProduct", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddProductToCollection", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RemoveProductFromSelection", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteProduct", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteSelection", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateProductProperty", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditProductProperty", "VK");
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

        OPI_TestDataRetrieval.WriteLogCLI(Result, "AddProductPropertyVariant", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditProductPropertyVariant", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ProductWithProp1");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ProductWithProp2");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsByID", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GroupProducts", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteProductPropertyVariant", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteProductProperty");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetProductDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductDescription", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_VK_GetProductList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductList", "VK");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetSelectionList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetSelectionList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetSelectionList", "VK");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetPropertyList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetPropertyList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPropertyList", "VK");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VK_GetOrderList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetOrderList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOrderList", "VK");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadVideoToServer", "VK");
    OPI_TestDataRetrieval.Check_VKVideo(Result);

    OPI_Tools.Pause(5);

EndProcedure


#EndRegion

#Region YandexDisk

Procedure CLI_YandexDisk_GetDiskInfo(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetDiskInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDiskInformation", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskDrive(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_CreateFolder(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = "/" + String(New UUID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "CreateFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateFolder", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskFolder(Result, Path);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_UploadFileByURL(FunctionParameters)

    Token   = FunctionParameters["YandexDisk_Token"];
    Address = FunctionParameters["Picture"];
    Path    = "/" + String(New UUID) + ".png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);
    Options.Insert("url"  , Address);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFileByURL", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFileByURL", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskProc(Result);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_FileByURLPath", Path);
    FunctionParameters.Insert("YandexDisk_FileByURLPath", Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_GetObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObject", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path);

EndProcedure

Procedure CLI_YandexDisk_DeleteObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);
    Options.Insert("can"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "DeleteObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObject", "YandexDisk");
    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_UploadFile(FunctionParameters)

    Path1 = "/" + String(New UUID) + ".png";
    Path2 = "/" + String(New UUID) + ".png";

    Token = FunctionParameters["YandexDisk_Token"];
    Image = FunctionParameters["Picture"]; // URL

    TFN = GetTempFileName("png"); // Path
    FileCopy(Image, TFN);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("path"   , Path1);
    Options.Insert("file"   , Image);
    Options.Insert("rewrite", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile (URL)", "YandexDisk");
    OPI_TestDataRetrieval.Check_Empty(Result); // SKIP

    OPI_Tools.Pause(5); // SKIP

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("path"   , Path2);
    Options.Insert("file"   , TFN);
    Options.Insert("rewrite", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFile", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile", "YandexDisk");

    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path1);
    Options.Insert("can"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "DeleteObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObject (URL)", "YandexDisk");
    OPI_TestDataRetrieval.Check_Empty(Result);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path2);
    Options.Insert("can"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "DeleteObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObject (Path)", "YandexDisk");
    OPI_TestDataRetrieval.Check_Empty(Result);

    DeleteFiles(TFN);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_CreateObjectCopy(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("from"   , Original);
    Options.Insert("to"     , Path);
    Options.Insert("rewrite", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "CreateObjectCopy", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateObjectCopy", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_CopyFilePath", Path);
    FunctionParameters.Insert("YandexDisk_CopyFilePath", Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_GetDownloadLink(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetDownloadLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDownloadLink", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskLink(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_DownloadFile(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "DownloadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DownloadFile", "YandexDisk");
    OPI_TestDataRetrieval.Check_BinaryData(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_GetFilesList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;
    FilterByType    = "image";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("amount", Count);
    Options.Insert("offset", OffsetFromStart);
    Options.Insert("type"  , FilterByType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetFilesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFilesList", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskFilesList(Result, Count, OffsetFromStart);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_MoveObject(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("from"   , Original);
    Options.Insert("to"     , Path);
    Options.Insert("rewrite", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "MoveObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveObject", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_NewFilePath", Path);
    FunctionParameters.Insert("YandexDisk_NewFilePath", Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_YandexDisk_PublishObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "PublishObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PublishObject", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path, True);

    URL = Result["public_url"];
    OPI_TestDataRetrieval.WriteParameter("YandexDisk_PublicURL", URL);
    FunctionParameters.Insert("YandexDisk_PublicURL", URL);

EndProcedure

Procedure CLI_YandexDisk_GetDownloadLinkForPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url"  , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetDownloadLinkForPublicObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDownloadLinkForPublicObject", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskLink(Result);

EndProcedure

Procedure CLI_YandexDisk_GetPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url"  , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetPublicObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPublicObject", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskPath(Result, "", True);

EndProcedure

Procedure CLI_YandexDisk_SavePublicObjectToDisk(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url"  , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "SavePublicObjectToDisk", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SavePublicObjectToDisk", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskPath(Result, "", False);

EndProcedure

Procedure CLI_YandexDisk_CancelObjectPublication(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "CancelObjectPublication", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CancelObjectPublication", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path, False);

EndProcedure

Procedure CLI_YandexDisk_GetPublishedObjectsList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("amount", Count);
    Options.Insert("offset", OffsetFromStart);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetPublishedObjectsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPublishedObjectsList", "YandexDisk");
    OPI_TestDataRetrieval.Check_YaDiskFilesList(Result, Count, OffsetFromStart);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region Viber

Procedure CLI_Viber_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Viber_ChannelToken"];
    URL   = "http://api.athenaeum.digital/hs/viber";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("url"   , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SetWebhook", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetWebhook", "Viber");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Viber_GetChannelInformation(FunctionParameters)

    Token = FunctionParameters["Viber_ChannelToken"];

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "GetChannelInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChannelInformation", "Viber");
    OPI_TestDataRetrieval.Check_ViberOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_GetUserData(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("user" , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "GetUserData", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserData", "Viber");
    OPI_TestDataRetrieval.Check_ViberUser(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_GetOnlineUsers(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("users", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "GetOnlineUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOnlineUsers", "Viber");
    OPI_TestDataRetrieval.Check_ViberOnline(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_CreateKeyboardFromArrayButton(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "CreateKeyboardFromArrayButton", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateKeyboardFromArrayButton", "Viber");

EndProcedure

Procedure CLI_Viber_SendTextMessage(FunctionParameters)

    Text = "TestMessage";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Keyboard = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "CreateKeyboardFromArrayButton", Options);

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("text"     , Text);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("keyboard" , Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("text"     , Text);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("keyboard" , Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (channel)", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_SendImage(FunctionParameters)

    Description = "TestMessage";
    URL         = FunctionParameters["Picture"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("picture"    , URL);
    Options.Insert("user"       , UserID);
    Options.Insert("ischannel"  , SendingToChannel);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendImage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendImage", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("picture"    , URL);
    Options.Insert("user"       , UserID);
    Options.Insert("ischannel"  , SendingToChannel);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendImage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendPicture (channel)", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_SendFile(FunctionParameters)

    Extension = "docx";
    URL       = FunctionParameters["Document"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("file"     , URL);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("ext"      , Extension);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("file"     , URL);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("ext"      , Extension);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile (channel)", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_SendContact(FunctionParameters)

    Name  = "Petr Petrov";
    Phone = "+123456789";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("name"     , Name);
    Options.Insert("phone"    , Phone);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendContact", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendContact", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("name"     , Name);
    Options.Insert("phone"    , Phone);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendContact", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendContact (channel)", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_SendLocation(FunctionParameters)

    Latitude  = "48.87373649724122";
    Longitude = "2.2954639195323967";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("lat"      , Latitude);
    Options.Insert("long"     , Longitude);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLocation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendLocation", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("lat"      , Latitude);
    Options.Insert("long"     , Longitude);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLocation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendLocation (channel)", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Viber_SendLink(FunctionParameters)

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("url"      , URL);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendLink", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("url"      , URL);
    Options.Insert("user"     , UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendLink (channel)", "Viber");
    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure CLI_GoogleWorkspace_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];

    Options = New Structure;
    Options.Insert("id" , ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("google", "FormCodeRetrievalLink", Options);
    Result = GetStringFromBinaryData(Result);

    OPI_TestDataRetrieval.Check_String(Result);
    OPI_TestDataRetrieval.WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleWorkspace_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Options = New Structure;
    Options.Insert("id"    , ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("code"  , Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("google", "GetTokenByCode", Options);


    If ValueIsFilled(Result["access_token"])
        And ValueIsFilled(Result["refresh_token"]) Then

        OPI_TestDataRetrieval.WriteParameter("Google_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleWorkspace_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Options = New Structure;
    Options.Insert("id"     , ClientID);
    Options.Insert("secret" , ClientSecret);
    Options.Insert("refresh", RefreshToken);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("google", "RefreshToken", Options);

    OPI_TestDataRetrieval.Check_GoogleToken(Result);
    OPI_TestDataRetrieval.WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure CLI_GoogleCalendar_GetCalendarList(FunctionParameters)

    Token = FunctionParameters["Google_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetCalendarList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarList", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleCalendar_CreateCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestCalendar";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "CreateCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCalendar", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_GoogleCalendar(Result, Name);

    Calendar = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Google_NewCalendarID", Calendar);
    OPI_Tools.AddField("Google_NewCalendarID", Calendar, "String", FunctionParameters);

EndProcedure

Procedure CLI_GoogleCalendar_EditCalendarMetadata(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New name";
    Description = "New description";

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("calendar"   , Calendar);
    Options.Insert("title"      , Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditCalendarMetadata", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditCalendarMetadata", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure CLI_GoogleCalendar_GetCalendarMetadata(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("calendar" , Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetCalendarMetadata", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarMetadata", "GoogleCalendar");

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure CLI_GoogleCalendar_AddCalendarToList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("calendar" , Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "AddCalendarToList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddCalendarToList", "GoogleCalendar");

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure CLI_GoogleCalendar_EditListCalendar(FunctionParameters)

    Token          = FunctionParameters["Google_Token"];
    Calendar       = FunctionParameters["Google_NewCalendarID"];
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("calendar" , Calendar);
    Options.Insert("primary"  , PrimaryColor);
    Options.Insert("secondary", SecondaryColor);
    Options.Insert("hidden"   , Hidden);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditListCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditListCalendar", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_GoogleCalendarColors(Result, PrimaryColor, SecondaryColor);

EndProcedure

Procedure CLI_GoogleCalendar_GetListCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("calendar" , Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetListCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetListCalendar", "GoogleCalendar");

    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";

    OPI_TestDataRetrieval.Check_GoogleCalendarColors(Result, PrimaryColor, SecondaryColor);

EndProcedure

Procedure CLI_GoogleCalendar_ClearMainCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "ClearMainCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearMainCalendar", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_GoogleCalendar_DeleteCalendarFromList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("calendar" , Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteCalendarFromList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteCalendarFromList", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_GoogleCalendar_DeleteCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("calendar" , Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteCalendar", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_GoogleCalendar_CreateEvent(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();
    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New event";
    Description = "TestEventDescription";
    Hour        = 3600;

    Image1      = FunctionParameters["Picture"]; // URL, Binary or Path to file
    Image2      = FunctionParameters["Picture2"]; // URL, Binary or Path to file
    Attachments = New Map;

    Attachments.Insert("Image1", Image1);
    Attachments.Insert("Image2", Image2);

    EventDescription = New Map;
    EventDescription.Insert("Description"           , Description);
    EventDescription.Insert("Title"                 , Name);
    EventDescription.Insert("Venue"                 , "InOffice");
    EventDescription.Insert("StartDate"             , CurrentDate);
    EventDescription.Insert("EndDate"               , EventDescription["StartDate"] + Hour);
    EventDescription.Insert("ArrayOfAttachmentURLs" , Attachments);
    EventDescription.Insert("SendNotifications"     , True);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("props"   , EventDescription);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "CreateEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateEvent", "GoogleCalendar");

    Event = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Google_EventID", Event);
    OPI_Tools.AddField("Google_EventID", Event, "String", FunctionParameters);

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure CLI_GoogleCalendar_EditEvent(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Event       = FunctionParameters["Google_EventID"];
    Description = "New event description";

    EventDescription = New Map;
    EventDescription.Insert("Description", Description);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("props"   , EventDescription);
    Options.Insert("event"   , Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditEvent", "GoogleCalendar");

    Name = "New event";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure CLI_GoogleCalendar_GetEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("event"   , Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetEvent", "GoogleCalendar");

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure CLI_GoogleCalendar_MoveEvent(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Event = FunctionParameters["Google_EventID"];

    SourceCalendar = FunctionParameters["Google_NewCalendarID"];
    TargetCalendar = FunctionParameters["Google_CalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from" , SourceCalendar);
    Options.Insert("to"   , TargetCalendar);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "MoveEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveEvent", "GoogleCalendar");

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

    OPI_GoogleCalendar.MoveEvent(Token, TargetCalendar, SourceCalendar, Event);

EndProcedure

Procedure CLI_GoogleCalendar_DeleteEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("event"   , Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteEvent", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_GoogleCalendar_GetEventList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEventList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetEventList", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

Procedure CLI_GoogleCalendar_GetEventDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEventDescription", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetEventDescription", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

#EndRegion

#Region GoogleDrive

Procedure CLI_GoogleDrive_GetDirectoriesList(FunctionParameters)

    Name  = "TestFolder";
    Token = FunctionParameters["Google_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("querry", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetDirectoriesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDirectoriesList", "GoogleDrive");

    Result = Result[0];

    OPI_TestDataRetrieval.Check_GoogleCatalogs(Result);

    Identifier = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("GD_Catalog", Identifier);
    OPI_Tools.AddField("GD_Catalog", Identifier, "String", FunctionParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleDrive_GetObjectInformation(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_Catalog"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetObjectInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObjectInformation", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleCatalog(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleDrive_UploadFile(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Image     = FunctionParameters["Picture"];
    Directory = FunctionParameters["GD_Catalog"];

    Options = New Structure;
    Options.Insert("empty", False);

    Description = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFileDescription", Options);
    Description.Insert("Parent", Directory);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file" , Image);
    Options.Insert("props", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UploadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleObject(Result, Description);

    Identifier = Result["id"];

    OPI_TestDataRetrieval.WriteParameter("GD_File", Identifier);
    OPI_Tools.AddField("GD_File", Identifier, "String", FunctionParameters);

EndProcedure

Procedure CLI_GoogleDrive_CopyObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);
    Options.Insert("title"  , NewName);
    Options.Insert("catalog", NewParent);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CopyObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CopyObject", "GoogleDrive");

    Description = New Structure("Name,MIME", NewName, "image/jpeg");
    OPI_TestDataRetrieval.Check_GoogleObject(Result, Description);

    Identifier = Result["id"];

    ArrayOfDeletions = FunctionParameters["ArrayOfDeletions"];
    ArrayOfDeletions.Add(Identifier);
    FunctionParameters.Insert("ArrayOfDeletions", ArrayOfDeletions);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleDrive_DownloadFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DownloadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DownloadFile", "GoogleDrive");

    Size       = OPI_Tools.Get(FunctionParameters["Picture"]).Size();
    ExtraBytes = 2;

    OPI_TestDataRetrieval.Check_BinaryData(Result, Size + ExtraBytes);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleDrive_UpdateFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    NewName    = "UpdatedFile.jpg";
    Identifier = FunctionParameters["GD_File"];
    File       = FunctionParameters["Picture2"]; // URL, Binary Data or Path to file

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);
    Options.Insert("file"   , File);
    Options.Insert("title"  , NewName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UpdateFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateFile", "GoogleDrive");

    Description = New Structure("Name,MIME", NewName, "image/jpeg");
    OPI_TestDataRetrieval.Check_GoogleObject(Result, Description);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleDrive_GetFilesList(FunctionParameters)

    Token        = FunctionParameters["Google_Token"];
    Directory    = "root";
    NameContains = "data";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("querry" , NameContains);
    Options.Insert("catalog", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFilesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFilesList", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

Procedure CLI_GoogleDrive_DeleteObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DeleteObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObject", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Empty(Result);

    For Each Deletable In FunctionParameters["ArrayOfDeletions"] Do

        Result = OPI_GoogleDrive.DeleteObject(Token, Deletable);

        OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObject");

        OPI_TestDataRetrieval.Check_Empty(Result);
        OPI_Tools.Pause(2);

    EndDo;

EndProcedure

Procedure CLI_GoogleDrive_GetFileDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFileDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileDescription", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_GoogleDrive_CreateComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    Comment    = "Comment text";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);
    Options.Insert("text"   , Comment);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateComment", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleComment(Result, Comment);

    Identifier = Result["id"];

    OPI_TestDataRetrieval.WriteParameter("GD_Comment", Identifier);
    OPI_Tools.AddField("GD_Comment", Identifier, "String", FunctionParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_GoogleDrive_GetComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetComment", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleComment(Result, "Comment text");

EndProcedure

Procedure CLI_GoogleDrive_GetCommentList(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetCommentList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCommentList", "GoogleDrive");

    Comments      = Result["comments"];
    CommentObject = Comments[Comments.UBound()];

    OPI_TestDataRetrieval.Check_GoogleComment(CommentObject, "Comment text");

EndProcedure

Procedure CLI_GoogleDrive_DeleteComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("object" , Identifier);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DeleteComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteComment", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_GoogleDrive_CreateFolder(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Directory = FunctionParameters["GD_Catalog"];
    Name      = "TestFolder";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("title"  , Name);
    Options.Insert("catalog", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateFolder", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleCatalog(Result);

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("title" , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateFolder (root)");
    OPI_TestDataRetrieval.Check_GoogleCatalog(Result);

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

EndProcedure

#EndRegion

#Region GoogleSheets

Procedure CLI_GoogleSheets_CreateSpreadsheet(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("title" , Name);
    Options.Insert("sheets", SheetArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CreateSpreadsheet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateSpreadsheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheet(Result, Name, SheetArray);

    Spreadsheet = Result["spreadsheetId"];
    Sheet       = Result["sheets"][0]["properties"]["sheetId"];
    Sheet       = OPI_Tools.NumberToString(Sheet);

    OPI_TestDataRetrieval.WriteParameter("GS_Spreadsheet", Spreadsheet);
    OPI_TestDataRetrieval.WriteParameter("GS_Sheet"      , Sheet);

    OPI_Tools.AddField("GS_Spreadsheet", Spreadsheet, "String", FunctionParameters);
    OPI_Tools.AddField("GS_Sheet"      , Sheet      , "String", FunctionParameters);

    Name = "Test table (new.)";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("title" , Name);
    Options.Insert("sheets", SheetArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CreateSpreadsheet", Options);

    Spreadsheet = Result["spreadsheetId"];

    OPI_TestDataRetrieval.WriteParameter("GS_Spreadsheet2", Spreadsheet);
    OPI_Tools.AddField("GS_Spreadsheet2", Spreadsheet, "String", FunctionParameters);

EndProcedure

Procedure CLI_GoogleSheets_GetSpreadsheet(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GS_Spreadsheet"];

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetSpreadsheet", Options);

    Name = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateSpreadsheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheet(Result, Name, SheetArray);

EndProcedure

Procedure CLI_GoogleSheets_CopySheet(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    From   = FunctionParameters["GS_Spreadsheet"];
    Target = FunctionParameters["GS_Spreadsheet2"];
    Sheet  = FunctionParameters["GS_Sheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from" , From);
    Options.Insert("to"   , Target);
    Options.Insert("sheet", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CopySheet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CopySheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSheet(Result);

EndProcedure

Procedure CLI_GoogleSheets_AddSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "TestSheet";

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("title"      , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "AddSheet", Options);

    NewSheet = Result["replies"][0]["addSheet"]["properties"];

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddSheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSheet(NewSheet);

EndProcedure

Procedure CLI_GoogleSheets_DeleteSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = FunctionParameters["GS_Sheet"];

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("sheet"      , Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "DeleteSheet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteSheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheetElement(Result, Spreadsheet);

EndProcedure

Procedure CLI_GoogleSheets_EditSpreadsheetTitle(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "Test table (changed.)";

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("title"      , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "EditSpreadsheetTitle", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditSpreadsheetTitle", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheetElement(Result, Spreadsheet);

EndProcedure

Procedure CLI_GoogleSheets_GetTable(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetSpreadsheet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTable", "GoogleSheets");

    Name = "Test table (changed.)";
    OPI_TestDataRetrieval.Check_GoogleSheetTitle(Result, Name);

EndProcedure

Procedure CLI_GoogleSheets_SetCellValues(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    ValueMapping = New Map;
    ValueMapping.Insert("A1", "ThisIsA1");
    ValueMapping.Insert("A2", "ThisIsA2");
    ValueMapping.Insert("B2", "ThisIsB2");
    ValueMapping.Insert("B3", "ThisIsB3");
    ValueMapping.Insert("A3", "ThisIsA3");
    ValueMapping.Insert("A4", "ThisIsA4");
    ValueMapping.Insert("B1", "ThisIsB1");
    ValueMapping.Insert("B4", "ThisIsB4");

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("data"       , ValueMapping);
    Options.Insert("sheetname"  , Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "SetCellValues", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetCellValues", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleCellUpdating(Result, ValueMapping.Count());

EndProcedure

Procedure CLI_GoogleSheets_GetCellValues(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("cells"      , CellsArray);
    Options.Insert("sheetname"  , Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetCellValues", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCellValues", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleCellValues(Result, CellsArray.Count());

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("sheetname"  , Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetCellValues", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCellValues (all)");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheetElement(Result, Spreadsheet);

EndProcedure

Procedure CLI_GoogleSheets_ClearCells(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("cells"      , CellsArray);
    Options.Insert("sheetname"  , Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "ClearCells", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearCells", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleCellCleanning(Result, CellsArray.Count());

EndProcedure

#EndRegion

#Region Twitter

Procedure CLI_Twitter_GetToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Code       = "123456";

    Options = New Structure;
    Options.Insert("code" , Code);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "GetToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetToken", "Twitter");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Twitter_GetAuthorizationLink(FunctionParameters)

    Parameters = GetTwitterAuthData();

    Options = New Structure;
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "GetAuthorizationLink", Options);

    Result = GetStringFromBinaryData(Result);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAuthorizationLink", "Twitter");
    OPI_TestDataRetrieval.Check_String(Result);

    OPI_TestDataRetrieval.WriteParameter("Twitter_URL", Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Twitter_RefreshToken(FunctionParameters)

    Parameters = GetTwitterAuthData();

    Options = New Structure;
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "RefreshToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RefreshToken", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterToken(Result);

    Refresh = Result["refresh_token"];
    Token   = Result["access_token"];

    If ValueIsFilled(Refresh) And Not Refresh = "null" Then
        OPI_TestDataRetrieval.WriteParameter("Twitter_Refresh", Refresh);
    EndIf;

    If ValueIsFilled(Token) And Not Token = "null" Then
        OPI_TestDataRetrieval.WriteParameter("Twitter_Token" , Token);
    EndIf;

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Twitter_CreateTextTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text" , Text);
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateTextTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTextTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Twitter_CreateImageTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image  = FunctionParameters["Picture"]; // URL, Binary or Path to file
    Image2 = FunctionParameters["Picture2"]; // URL, Binary or Path to file

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(Image2);

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("pictures", ImageArray);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateImageTweet", Options);


    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateImageTweet", "Twitter"); // SKIP
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15); // SKIP

    Text = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("pictures", Image);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateImageTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateImageTweet (single)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    Image = OPI_Tools.Get(Image);

    Text = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("pictures", Image);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateImageTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateImageTweet (TFN)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    OPI_Tools.Pause(20);

EndProcedure

Procedure CLI_Twitter_CreateVideoTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Video  = FunctionParameters["Video"]; // URL, Binary or Path to file
    Video2 = FunctionParameters["Video"]; // URL, Binary or Path to file

    VideosArray = New Array;
    VideosArray.Add(Video);
    VideosArray.Add(Video2);

    Options = New Structure;
    Options.Insert("text"  , Text);
    Options.Insert("videos", VideosArray);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateVideoTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateVideoTweet", "Twitter"); // SKIP
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15); // SKIP

    Text = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text"  , Text);
    Options.Insert("videos", Video);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateVideoTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateVideoTweet (single)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    Video = OPI_Tools.Get(Video);

    Text = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text"  , Text);
    Options.Insert("videos", Video);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateVideoTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateVideoTweet (TFN)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    OPI_Tools.Pause(20);

EndProcedure

Procedure CLI_Twitter_CreateGifTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    GIF  = FunctionParameters["GIF"]; // URL, Binary or Path to file
    Gif2 = FunctionParameters["GIF"]; // URL, Binary or Path to file

    GifsArray = New Array;
    GifsArray.Add(GIF);
    GifsArray.Add(Gif2);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("gifs", GifsArray);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateGifTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateGifTweet", "Twitter"); // SKIP
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text); // SKIP
    OPI_Tools.Pause(15); // SKIP

    Text = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("gifs", GIF);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateGifTweet", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateGifTweet (single)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    GIF = OPI_Tools.Get(GIF);

    Text = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("gifs", GIF);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateGifTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateGifTweet (TFN)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    OPI_Tools.Pause(20);

EndProcedure

Procedure CLI_Twitter_CreatePollTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    AnswersArray = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");

    Options = New Structure;
    Options.Insert("text"    , Text);
    Options.Insert("options" , AnswersArray);
    Options.Insert("duration", 60);
    Options.Insert("auth"    , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreatePollTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePollTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);

    OPI_Tools.Pause(20);

EndProcedure

Procedure CLI_Twitter_CreateCustomTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or Path to file
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or Path to file

    ImageArray = New Array();
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Options = New Structure;
    Options.Insert("files", ImageArray);
    Options.Insert("type" , "tweet_image");
    Options.Insert("auth" , Parameters);

    MediaArray = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "UploadAttachmentsArray", Options);

    Options = New Structure;
    Options.Insert("text"  , Text);
    Options.Insert("media" , MediaArray);
    Options.Insert("auth"  , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateCustomTweet", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCustomTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);

    OPI_Tools.Pause(20);

EndProcedure

Procedure CLI_Twitter_UploadAttachmentsArray(FunctionParameters)

    Parameters = GetTwitterAuthData();

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or Path to file
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or Path to file

    ImageArray = New Array();
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Options = New Structure;
    Options.Insert("files", ImageArray);
    Options.Insert("type" , "tweet_image");
    Options.Insert("auth" , Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "UploadAttachmentsArray", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadAttachmentsArray", "Twitter");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

#EndRegion

#Region Notion

Procedure CLI_Notion_CreatePage(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page" , Parent);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreatePage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePage", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result);

    Page = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Notion_Page", Page);
    OPI_Tools.AddField("Notion_Page", Page, "String", FunctionParameters);

EndProcedure

Procedure CLI_Notion_CreateDatabase(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Properties = New Map;
    Properties.Insert("Name"         , "title");
    Properties.Insert("Description"  , "rich_text");
    Properties.Insert("Number"       , "number");
    Properties.Insert("Status"       , "status");
    Properties.Insert("CreationDate" , "date");
    Properties.Insert("Image"        , "files");
    Properties.Insert("Active"       , "checkbox");
    Properties.Insert("Website"      , "url");
    Properties.Insert("Email"        , "email");
    Properties.Insert("Phone"        , "phone_number");
    Properties.Insert("User"         , "people");

    ValueSelection = New Map;
    ValueSelection.Insert("New"        , "green");
    ValueSelection.Insert("InProgress" , "yellow");
    ValueSelection.Insert("Remote"     , "red");

    Properties.Insert("Status", ValueSelection);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page" , Parent);
    Options.Insert("title", Title);
    Options.Insert("props", Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreateDatabase", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDatabase", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "database");

    Base = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Notion_Base", Base);
    OPI_Tools.AddField("Notion_Base", Base, "String", FunctionParameters);

EndProcedure

Procedure CLI_Notion_EditDatabaseProperties(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Title       = "TestTitle";
    Description = "TestDescription";

    Properties = New Map;
    Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
    Properties.Insert("Website"); // Field "Website" will deleted

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("base"       , Base);
    Options.Insert("props"      , Properties);
    Options.Insert("title"      , Title);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "EditDatabaseProperties", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditDatabaseProperties", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "database");

EndProcedure

Procedure CLI_Notion_GetPage(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Page  = FunctionParameters["Notion_Page"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("page"  , Page);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetPage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPage", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result);

EndProcedure

Procedure CLI_Notion_GetDatabase(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base" , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetDatabase", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDatabase", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "database");

EndProcedure

Procedure CLI_Notion_CreatePageInDatabase(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Base   = FunctionParameters["Notion_Base"];
    Image_ = FunctionParameters["Picture"]; // URL, Binary Data or Path to file

    Image = New Map;
    Image.Insert("Logo", Image_);

    Properties = New Map;
    Properties.Insert("Name"         , "LLC Vector");
    Properties.Insert("Description"  , "OurFirstClient");
    Properties.Insert("Number"       , 1);
    Properties.Insert("Status"       , "Regular");
    Properties.Insert("CreationDate" , OPI_Tools.GetCurrentDate());
    Properties.Insert("Image"        , Image);
    Properties.Insert("Active"       , True);
    Properties.Insert("Website"      , "https://vector.ru");
    Properties.Insert("Email"        , "mail@vector.ru");
    Properties.Insert("Phone"        , "88005553535");
    Properties.Insert("Status"       , "New");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base" , Base);
    Options.Insert("data" , Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreatePageInDatabase", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePageInDatabase", "Notion");
    OPI_TestDataRetrieval.Check_NotionBasePage(Result, Base);

EndProcedure

Procedure CLI_Notion_EditPageProperties(FunctionParameters)

    Token   = FunctionParameters["Notion_Token"];
    Page    = FunctionParameters["Notion_Page"];
    Icon    = FunctionParameters["Picture"];
    Cover   = FunctionParameters["Picture2"];
    Archive = False;

    Properties = New Map;
    Properties.Insert("Active" , False);
    Properties.Insert("Email"  , "vector@mail.ru");

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("page"   , Page);
    Options.Insert("data"   , Properties);
    Options.Insert("icon"   , Icon);
    Options.Insert("cover"  , Cover);
    Options.Insert("archive", Archive);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "EditPageProperties", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditPageProperties", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result);

EndProcedure

Procedure CLI_Notion_ReturnBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_Block"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("block" , Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnBlock", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ReturnBlock", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "block");

EndProcedure

Procedure CLI_Notion_CreateBlock(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Block  = FunctionParameters["Notion_Block"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("block" , Block);

    BlockData = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnBlock", Options);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("page"  , Parent);
    Options.Insert("block" , BlockData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreateBlock", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateBlock", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "list");

    Block = Result["results"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("Notion_NewBlock", Block);
    OPI_Tools.AddField("Notion_NewBlock", Block, "String", FunctionParameters);

EndProcedure

Procedure CLI_Notion_ReturnChildBlocks(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("block" , Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnChildBlocks", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ReturnChildBlocks", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "list");

EndProcedure

Procedure CLI_Notion_DeleteBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("block" , Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "DeleteBlock", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteBlock", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "block");

EndProcedure

Procedure CLI_Notion_UserList(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "UserList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UserList", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "list");

EndProcedure

Procedure CLI_Notion_GetUserData(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    User  = FunctionParameters["Notion_User"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("user"  , User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetUserData", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserData", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "user");

EndProcedure

#EndRegion

#Region Slack

Procedure CLI_Slack_GetBotInformation(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetBotInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBotInformation", "Slack");
    OPI_TestDataRetrieval.Check_SlackBot(Result);

EndProcedure

Procedure CLI_Slack_GetUserList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetUserList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserList", "Slack");
    OPI_TestDataRetrieval.Check_SlackUsers(Result);

EndProcedure

Procedure CLI_Slack_GetWorkspaceList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetWorkspaceList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetWorkspaceList", "Slack");
    OPI_TestDataRetrieval.Check_SlackWorkspaces(Result);

EndProcedure

Procedure CLI_Slack_SendMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    // Text

    Text = "TestMessage1";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage", "Slack"); // SKIP
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel); // SKIP

    Timestamp = Result["ts"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Slack_MessageTS", Timestamp); // SKIP
    OPI_Tools.AddField("Slack_MessageTS", Timestamp, "String", FunctionParameters); // SKIP


    // With attachments (picture block in the example)

    Text       = "Message with picture";
    Image      = FunctionParameters["Picture"];
    BlockArray = New Array;

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("alt"    , "Image");

    Block = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GenerateImageBlock", Options);

    BlockArray.Add(Block);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("text"   , Text);
    Options.Insert("blocks" , BlockArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage (picture)"); // SKIP
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel); // SKIP

    // Sheduled

    Text = "Sheduled message";
    Hour = 3600;
    Day  = 24;

    SendingDate = OPI_Tools.GetCurrentDate() + (Day * Hour);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("text"   , Text);
    Options.Insert("date"   , SendingDate);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage (scheduled)");
    OPI_TestDataRetrieval.Check_SlackSheduledMessage(Result, Channel);

    Timestamp = Result["scheduled_message_id"];
    Result    = OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteMessage (scheduled)");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_GenerateImageBlock(FunctionParameters)

    Image = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("alt"    , "Image");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GenerateImageBlock", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GenerateImageBlock", "Slack");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Slack_EditMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Text = "TestMessage2";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp"  , Timestamp);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "EditMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditMessage", "Slack");
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel);

EndProcedure

Procedure CLI_Slack_GetMessageReplyList(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp"  , Timestamp);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetMessageReplyList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetMessageReplyList", "Slack");
    OPI_TestDataRetrieval.Check_SlackMessages(Result);

EndProcedure

Procedure CLI_Slack_GetMessageLink(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp"  , Timestamp);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetMessageLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetMessageLink", "Slack");
    OPI_TestDataRetrieval.Check_SlackMessageLink(Result, Channel);

EndProcedure

Procedure CLI_Slack_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("stamp"  , Timestamp);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteMessage", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_SendEphemeralMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    User    = FunctionParameters["Slack_User"];
    Image   = FunctionParameters["Picture"];
    Text    = "Ephemeral message";

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("alt"    , "Image");

    Block = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GenerateImageBlock", Options);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("text"   , Text);
    Options.Insert("user"   , User);
    Options.Insert("blocks" , Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendEphemeralMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendEphemeralMessage", "Slack");
    OPI_TestDataRetrieval.Check_SlackEphemeral(Result);

EndProcedure

Procedure CLI_Slack_GetDelayedMessageList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetDelayedMessageList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDelayedMessageList", "Slack");
    OPI_TestDataRetrieval.Check_SlackSheduled(Result);

EndProcedure

Procedure CLI_Slack_CreateChannel(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Name  = "testconv" + String(New UUID);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("title"  , Name);
    Options.Insert("private", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "CreateChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, Name);

    Channel = Result["channel"]["id"];
    OPI_TestDataRetrieval.WriteParameter("Slack_NewChannel", Channel);
    OPI_Tools.AddField("Slack_NewChannel", Channel, "String", FunctionParameters);

    OPI_TestDataRetrieval.WriteParameter("Slack_NewChannelName", Name);
    OPI_Tools.AddField("Slack_NewChannelName", Name, "String", FunctionParameters);

EndProcedure

Procedure CLI_Slack_SetChannelTopic(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Topic   = "TestTopic";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("theme"  , Topic);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SetChannelTopic", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetChannelTopic", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelTopic(Result, Topic);

EndProcedure

Procedure CLI_Slack_SetChannelGoal(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Purpose = "TestGoal";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("purpose", Purpose);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SetChannelGoal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetChannelGoal", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_GetChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure CLI_Slack_InviteUsersToChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("users"  , User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "InviteUsersToChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "InviteUsersToChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure CLI_Slack_KickUserFromChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("user"   , User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "KickUserFromChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "KickUserFromChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_GetChannelHistory(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelHistory", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChannelHistory", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelHistory(Result);

EndProcedure

Procedure CLI_Slack_GetChannelUserList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelUserList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChannelUserList", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelUsers(Result);

EndProcedure

Procedure CLI_Slack_LeaveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "LeaveChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "LeaveChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_JoinChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "JoinChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "JoinChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure CLI_Slack_RenameChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Name    = "testconv" + String(New UUID);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);
    Options.Insert("title"  , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "RenameChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenameChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, Name);

EndProcedure

Procedure CLI_Slack_ArchiveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "ArchiveChannel", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ArchiveChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_GetChannelList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChannelList", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelsList(Result);

EndProcedure

Procedure CLI_Slack_OpenDialog(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    User  = FunctionParameters["Slack_User"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("users", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "OpenDialog", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "OpenDialog", "Slack");
    OPI_TestDataRetrieval.Check_SlackDialog(Result);

    Dialog = Result["channel"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Slack_Dialog", Dialog);
    OPI_Tools.AddField("Slack_Dialog", Dialog, "String", FunctionParameters);

    Result = OPI_Slack.SendMessage(Token, Dialog, "Test dialog");

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage (dialog)");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_CloseDialog(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Dialog = FunctionParameters["Slack_Dialog"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("conv" , Dialog);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "CloseDialog", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CloseDialog", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_GetFilesList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFilesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFilesList", "Slack");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFilesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFilesList (full)");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

EndProcedure

Procedure CLI_Slack_UploadFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    File    = FunctionParameters["Document"]; // URL, Binary Data or Path to file

    FileName = "megadoc.docx";
    Title    = "NewFile";

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("file"    , File);
    Options.Insert("filename", FileName);
    Options.Insert("title"   , Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "UploadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile"     , "Slack"); // SKIP
    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeFilePublic" , "Slack"); // SKIP
    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeFilePrivate", "Slack"); // SKIP
    OPI_TestDataRetrieval.Check_SlackFile(Result, FileName); // SKIP

    UploadedFile = Result["files"][0]["id"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Slack_FileID", UploadedFile); // SKIP
    OPI_Tools.AddField("Slack_FileID", UploadedFile, "String", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("file"    , File);
    Options.Insert("filename", FileName);
    Options.Insert("title"   , Title);
    Options.Insert("channel" , Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "UploadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile (to channel)");
    OPI_TestDataRetrieval.Check_SlackFile(Result, FileName);
    OPI_Slack.DeleteFile(Token, Result["files"][0]["id"]);

EndProcedure

Procedure CLI_Slack_MakeFilePublic(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "MakeFilePublic", Options);

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Slack_MakeFilePrivate(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "MakeFilePrivate", Options);

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Slack_GetFileData(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFileData", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileData", "Slack");
    OPI_TestDataRetrieval.Check_SlackFile(Result, "megadoc.docx");

EndProcedure

Procedure CLI_Slack_DeleteFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_GetExternalFileList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("channel" , Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFileList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetExternalFileList", "Slack");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFileList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetExternalFileList (full)");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

EndProcedure

Procedure CLI_Slack_AddExternalFile(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Title = "NewFile";
    File  = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("url"   , File);
    Options.Insert("title" , Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "AddExternalFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackExternalFile(Result, Title);

    UploadedFile = Result["file"]["id"];
    OPI_TestDataRetrieval.WriteParameter("Slack_ExtFileID", UploadedFile);
    OPI_Tools.AddField("Slack_ExtFileID", UploadedFile, "String", FunctionParameters);

EndProcedure

Procedure CLI_Slack_GetExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackExternalFile(Result, "NewFile");

EndProcedure

Procedure CLI_Slack_SendExternalFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    FileID  = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("fileid"  , FileID);
    Options.Insert("channels", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendExternalFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure CLI_Slack_DeleteExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteExternalFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

#EndRegion

#Region Airtable

Procedure CLI_Airtable_CreateDatabase(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Region = FunctionParameters["Airtable_Workspace"];
    Name   = "TestDatabase";

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));

    TableName = "TestTable";

    TableMapping = New Map;
    TableMapping.Insert(TableName, FieldArray);

    Options = New Structure;
    Options.Insert("token"     , Token);
    Options.Insert("ws"        , Region);
    Options.Insert("title"     , Name);
    Options.Insert("tablesdata", TableMapping);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateDatabase", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDatabase", "Airtable");
    OPI_TestDataRetrieval.Check_ATBaseWithTable(Result, TableName);

    Base = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Base", Base);
    OPI_Tools.AddField("Airtable_Base", Base, "String", FunctionParameters);

EndProcedure

Procedure CLI_Airtable_GetDatabaseTables(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("base"  , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetDatabaseTables", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDatabaseTables", "Airtable");
    OPI_TestDataRetrieval.Check_ATTablesList(Result);

EndProcedure

Procedure CLI_Airtable_GetListOfBases(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetListOfBases", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetListOfBases", "Airtable");
    OPI_TestDataRetrieval.Check_ATBasesList(Result);

EndProcedure

Procedure CLI_Airtable_GetNumberField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Number");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetNumberField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetNumberField", "Airtable");

EndProcedure

Procedure CLI_Airtable_GetStringField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "String");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetStringField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStringField", "Airtable");

EndProcedure

Procedure CLI_Airtable_GetAttachmentField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Attachment");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetAttachmentField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAttachmentField", "Airtable");

EndProcedure

Procedure CLI_Airtable_GetCheckboxField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Checkbox");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetCheckboxField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCheckboxField", "Airtable");

EndProcedure

Procedure CLI_Airtable_GetDateField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Date");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetDateField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDateField", "Airtable");

EndProcedure

Procedure CLI_Airtable_GetPhoneField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Phone");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetPhoneField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPhoneField", "Airtable");

EndProcedure

Procedure CLI_Airtable_GetEmailField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Email");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetEmailField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetEmailField", "Airtable");

EndProcedure

Procedure CLI_Airtable_GetLinkField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Link");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetLinkField", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLinkField", "Airtable");

EndProcedure

Procedure CLI_Airtable_CreateTable(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];

    FieldArray = New Array;
    FieldArray.Add(OPI_Airtable.GetNumberField("Number"));
    FieldArray.Add(OPI_Airtable.GetStringField("String"));
    FieldArray.Add(OPI_Airtable.GetAttachmentField("Attachment"));
    FieldArray.Add(OPI_Airtable.GetCheckboxField("Checkbox"));
    FieldArray.Add(OPI_Airtable.GetDateField("Date"));
    FieldArray.Add(OPI_Airtable.GetPhoneField("Phone"));
    FieldArray.Add(OPI_Airtable.GetEmailField("Email"));
    FieldArray.Add(OPI_Airtable.GetLinkField("Link"));

    Name        = "TestTable2";
    Description = "NewTable";

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("base"       , Base);
    Options.Insert("title"      , Name);
    Options.Insert("fieldsdata" , FieldArray);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTable", "Airtable");
    OPI_TestDataRetrieval.Check_ATTable(Result, Name, Description);

    Table = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Table", Table);
    OPI_Tools.AddField("Airtable_Table", Table, "String", FunctionParameters);

EndProcedure

Procedure CLI_Airtable_ModifyTable(FunctionParameters)

    Token       = FunctionParameters["Airtable_Token"];
    Base        = FunctionParameters["Airtable_Base"];
    Table       = FunctionParameters["Airtable_Table"];
    Name        = "Test table 2 (change.)";
    Description = "New table (change.)";

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("base"       , Base);
    Options.Insert("table"      , Table);
    Options.Insert("title"      , Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "ModifyTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ModifyTable", "Airtable");
    OPI_TestDataRetrieval.Check_ATTable(Result, Name, Description);

EndProcedure

Procedure CLI_Airtable_CreateField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Name  = String(New UUID);

    Options = New Structure;
    Options.Insert("title", Name);

    Field = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetNumberField", Options);

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("base"     , Base);
    Options.Insert("table"    , Table);
    Options.Insert("title"    , Name);
    Options.Insert("fielddata", Field);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateField", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateField", "Airtable");
    OPI_TestDataRetrieval.Check_ATField(Result, Name);

    Field = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Field", Field);
    OPI_Tools.AddField("Airtable_Field", Field, "String", FunctionParameters);

EndProcedure

Procedure CLI_Airtable_ModifyField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Field = FunctionParameters["Airtable_Field"];

    Name        = String(New UUID) + "(change.)";
    Description = "New description";

    Options = New Structure;
    Options.Insert("token"      , Token);
    Options.Insert("base"       , Base);
    Options.Insert("table"      , Table);
    Options.Insert("field"      , Field);
    Options.Insert("title"      , Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "ModifyField", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ModifyField", "Airtable");
    OPI_TestDataRetrieval.Check_ATTable(Result, Name, Description);

EndProcedure

Procedure CLI_Airtable_CreatePosts(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];

    Number = 10;
    String = "Hello";

    RowDescription1 = New Structure("Number,String", Number, String);
    RowDescription2 = New Structure("Number,String", Number, String);

    ArrayOfDescriptions = New Array;
    ArrayOfDescriptions.Add(RowDescription1);
    ArrayOfDescriptions.Add(RowDescription2);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("base"  , Base);
    Options.Insert("table" , Table);
    Options.Insert("data"  , ArrayOfDescriptions);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreatePosts", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePosts", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecords(Result);

    ArrayOfDeletions = New Array;

    For Each Record In Result["records"] Do

        CurrentRecord = Record["id"];
        ArrayOfDeletions.Add(CurrentRecord);

    EndDo;

    OPI_Airtable.DeletePosts(Token, Base, Table, ArrayOfDeletions);

    // Single

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("base"  , Base);
    Options.Insert("table" , Table);
    Options.Insert("data"  , RowDescription1);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreatePosts", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateRecords (one)");
    OPI_TestDataRetrieval.Check_ATRecordNumberAndString(Result, Number, String);

    Record = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Record", Record);
    OPI_Tools.AddField("Airtable_Record", Record, "String", FunctionParameters);

EndProcedure

Procedure CLI_Airtable_GetRecord(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("base"  , Base);
    Options.Insert("table" , Table);
    Options.Insert("record", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetRecord", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecord", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecord(Result, Record);

EndProcedure

Procedure CLI_Airtable_CreateComment(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];
    Text   = "TestComment";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("base"  , Base);
    Options.Insert("table" , Table);
    Options.Insert("record", Record);
    Options.Insert("text"  , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateComment", "Airtable");
    OPI_TestDataRetrieval.Check_ATText(Result, Text);

    Comment = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Comment", Comment);
    OPI_Tools.AddField("Airtable_Comment", Comment, "String", FunctionParameters);

EndProcedure

Procedure CLI_Airtable_EditComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Text = "Test comment (change.)";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("base"   , Base);
    Options.Insert("table"  , Table);
    Options.Insert("record" , Record);
    Options.Insert("comment", Comment);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "EditComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditComment", "Airtable");
    OPI_TestDataRetrieval.Check_ATText(Result, Text);

EndProcedure

Procedure CLI_Airtable_GetComments(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("base"   , Base);
    Options.Insert("table"  , Table);
    Options.Insert("record" , Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetComments", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetComments", "Airtable");
    OPI_TestDataRetrieval.Check_ATComments(Result);

EndProcedure

Procedure CLI_Airtable_DeleteComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("base"   , Base);
    Options.Insert("table"  , Table);
    Options.Insert("record" , Record);
    Options.Insert("comment", Comment);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "DeleteComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteComment", "Airtable");
    OPI_TestDataRetrieval.Check_ATCommentDeleting(Result, Comment);

EndProcedure

Procedure CLI_Airtable_GetListOfRecords(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("base"  , Base);
    Options.Insert("table" , Table);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetListOfRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetListOfRecords", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecords(Result);

EndProcedure

Procedure CLI_Airtable_DeletePosts(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("base"   , Base);
    Options.Insert("table"  , Table);
    Options.Insert("records", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "DeletePosts", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeletePosts", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecords(Result);

EndProcedure

#EndRegion

#Region Dropbox

Procedure CLI_Dropbox_GetAuthorizationLink(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];

    Options = New Structure;
    Options.Insert("appkey", AppKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAuthorizationLink", Options);
    Result = GetStringFromBinaryData(Result);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAuthorizationLink", "Dropbox");
    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String");

EndProcedure

Procedure CLI_Dropbox_GetToken(FunctionParameters)

    AppKey    = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    Code      = FunctionParameters["Dropbox_Code"];

    Options = New Structure;
    Options.Insert("appkey"   , AppKey);
    Options.Insert("appsecret", AppSecret);
    Options.Insert("code"     , Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetToken");

    Token   = Result["access_token"];
    Refresh = Result["refresh_token"];

    If ValueIsFilled(Token) Then
        OPI_TestDataRetrieval.WriteParameter("Dropbox_Token", Token);
    EndIf;

    If ValueIsFilled(Refresh) Then
        OPI_TestDataRetrieval.WriteParameter("Dropbox_Refresh", Refresh);
    EndIf;

EndProcedure

Procedure CLI_Dropbox_UpdateToken(FunctionParameters)

    AppKey       = FunctionParameters["Dropbox_Appkey"];
    AppSecret    = FunctionParameters["Dropbox_Appsecret"];
    RefreshToken = FunctionParameters["Dropbox_Refresh"];

    Options = New Structure;
    Options.Insert("appkey"   , AppKey);
    Options.Insert("appsecret", AppSecret);
    Options.Insert("refresh"  , RefreshToken);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "RefreshToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RefreshToken");

    Token = Result["access_token"];

    OPI_TestDataRetrieval.ExpectsThat(Token).Заполнено();

    OPI_TestDataRetrieval.WriteParameter("Dropbox_Token", Token);

EndProcedure

Procedure CLI_Dropbox_GetObjectInformation(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);
    Options.Insert("detail", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetObjectInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObjectInformation", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxFile(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetPreview(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetPreview", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPreview", "Dropbox");
    OPI_TestDataRetrieval.Check_BinaryData(Result, 120000);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_UploadFile(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];
    Image = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    FileCopy(Image, ImagePath);

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("file"     , ImagePath);
    Options.Insert("path"     , Path);
    Options.Insert("overwrite", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "UploadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxFile(Result, Path);
    DeleteFiles(ImagePath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_UploadFileByURL(FunctionParameters)

    Path  = "/New/url_doc.docx";
    Token = FunctionParameters["Dropbox_Token"];
    URL   = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("url"   , URL);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "UploadFileByURL", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFileByURL", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxWork(Result);

    Work = Result["async_job_id"];

    FunctionParameters.Insert("Dropbox_Job", Work);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_Job", Work);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetUploadStatusByURL(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    WorkID = FunctionParameters["Dropbox_Job"];
    Status = "in_progress";

    WHile Status = "in_progress" Do

        Options = New Structure;
        Options.Insert("token" , Token);
        Options.Insert("job"   , WorkID);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetUploadStatusByURL", Options);
        Status = Result[".tag"];

        OPI_Tools.Pause(5);

        OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUploadStatusByURL", "Dropbox");

    EndDo;

    // END

    OPI_TestDataRetrieval.Check_DropboxStatus(Result);

    Path = "/New/url_doc.docx";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteObject", Options);

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);
    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_DeleteObject(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObject", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_CopyObject(FunctionParameters)

    Original = "/New/pic.png";
    Copy     = "/New/pic_copy.png";
    Token    = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("from"  , Original);
    Options.Insert("to"    , Copy);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CopyObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CopyObject", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Copy);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Copy);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteObject", Options);

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Copy);
    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_MoveObject(FunctionParameters)

    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("from"  , OriginalPath);
    Options.Insert("to"    , TargetPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "MoveObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveObject", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, TargetPath);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("from"  , TargetPath);
    Options.Insert("to"    , OriginalPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "MoveObject", Options);

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, OriginalPath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_CreateFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New catalog";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CreateFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateFolder", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteObject", Options);
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_DownloadFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DownloadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DownloadFile", "Dropbox");
    OPI_TestDataRetrieval.Check_BinaryData(Result, 2000000);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_DownloadFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DownloadFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DownloadFolder", "Dropbox");
    OPI_TestDataRetrieval.Check_BinaryData(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetFolderFileList(FunctionParameters)

    Path  = "/New";
    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetListOfFolderFiles", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetListOfFolderFiles", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxArray(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetObjectVersionList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);
    Options.Insert("amount", 1);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetObjectVersionList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObjectVersionList", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxArray(Result, 1);

    Revision = Result["entries"][0]["rev"];

    FunctionParameters.Insert("Dropbox_FileRevision", Revision);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_FileRevision", Revision);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_RestoreObjectToVersion(FunctionParameters)

    Version = FunctionParameters["Dropbox_FileRevision"];
    Token   = FunctionParameters["Dropbox_Token"];
    Path    = "/New/pic.png";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);
    Options.Insert("rev"   , Version);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "RestoreObjectToVersion", Options);

    OPI_Tools.Pause(30);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RestoreObjectToVersion", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxFile(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetTagList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    PathsArray = New Array;
    PathsArray.Add("/New/Dogs.mp3");
    PathsArray.Add("/New/mydoc.docx");

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("paths" , PathsArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetTagList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTagList", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxTags(Result, PathsArray.Count());

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("paths" , "/New/mydoc.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetTagList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTagList (single)");
    OPI_TestDataRetrieval.Check_DropboxTags(Result, 1);

    HasTag = False;

    For Each Tag In Result["paths_to_tags"][0]["tags"] Do
        If Tag["tag_text"] = "important" Then
            HasTag         = True;
        EndIf;
    EndDo;

    OPI_TestDataRetrieval.ExpectsThat(HasTag).Равно(True);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_AddTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);
    Options.Insert("tag"   , Tag);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddTag", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTag", "Dropbox");
    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_DeleteTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("path"  , Path);
    Options.Insert("tag"   , Tag);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddTag", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTag", "Dropbox");
    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetAccountInformation(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAccountInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAccountInformation", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxAccount(Result);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("account", Result["account_id"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAccountInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAccountInformation (third-party)");
    OPI_TestDataRetrieval.Check_DropboxAccount(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetSpaceUsageData(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetSpaceUsageData", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetSpaceUsageData", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxSpace(Result);

EndProcedure

Procedure CLI_Dropbox_AddUsersToFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
    File  = FunctionParameters["Dropbox_FileID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("fileid"  , File);
    Options.Insert("emails"  , Email);
    Options.Insert("readonly", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddUsersToFile", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxMember(Result, Email, False);

    Mails = New Array;
    Mails.Add(Email);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("fileid"  , File);
    Options.Insert("emails"  , Mails);
    Options.Insert("readonly", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddUsersToFile (new.) ");
    OPI_TestDataRetrieval.Check_DropboxMember(Result, Email, True);

EndProcedure

Procedure CLI_Dropbox_PublishFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "PublishFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PublishFolder", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxPublicFolder(Result);

    FolderID = Result["shared_folder_id"];

    FunctionParameters.Insert("Dropbox_SharedFolder", FolderID);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_SharedFolder", FolderID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_CancelFolderPublication(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Folder = FunctionParameters["Dropbox_SharedFolder"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("folder", Folder);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CancelFolderPublication", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CancelFolderPublication", "Dropbox");

    CurrentStatus = "in_progress";
    JobID         = Result["async_job_id"];

    WHile CurrentStatus = "in_progress" Do

        Options = New Structure;
        Options.Insert("token" , Token);
        Options.Insert("job"   , JobID);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAsynchronousChangeStatus", Options);

        CurrentStatus = Result[".tag"];
        OPI_Tools.Pause(3);

    EndDo;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAsynchronousChangeStatus", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxStatus(Result);

    FunctionParameters.Insert("Dropbox_NewJobID", JobID);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_NewJobID", JobID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Dropbox_GetAsynchronousChangeStatus(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    JobID = FunctionParameters["Dropbox_NewJobID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("job"  , JobID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAsynchronousChangeStatus", Options);

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Dropbox_AddUsersToFolder(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Email  = FunctionParameters["Dropbox_OtherUser"];
    Folder = FunctionParameters["Dropbox_SharedFolder"]; // shared_folder_id

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("folder"  , Folder);
    Options.Insert("emails"  , Email);
    Options.Insert("readonly", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddUsersToFolder", "Dropbox");

    OPI_TestDataRetrieval.Check_Empty(Result);

    Mails = New Array;
    Mails.Add(Email);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("folder"  , Folder);
    Options.Insert("emails"  , Mails);
    Options.Insert("readonly", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFolder", Options);

    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_Dropbox_CancelFilePublication(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    File  = FunctionParameters["Dropbox_FileID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("fileid" , File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CancelFilePublication", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CancelFilePublication", "Dropbox");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

#EndRegion

#Region VKTeams

Procedure CLI_VKTeams_CheckToken(FunctionParameters)

    Token = FunctionParameters["VkTeams_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "CheckToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CheckToken", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTUser(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKTeams_GetEvents(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    LastID = 0;

    For N = 1 To 5 Do // In real work - endless loop

        Options = New Structure;
        Options.Insert("token"  , Token);
        Options.Insert("last"   , LastID);
        Options.Insert("timeout", 3);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetEvents", Options);

        OPI_TestDataRetrieval.WriteLogCLI(Result, "GetEvents", "VkTeams");
        OPI_TestDataRetrieval.Check_VKTEvents(Result); // SKIP

        Events = Result["events"];

        // Event handling...

        If Not Events.Count() = 0 Then

            LastID = Events[Events.UBound()]["eventId"];

        EndIf;

    EndDo;

    // END

    OPI_Tools.Pause(3);

EndProcedure

Procedure CLI_VKTeams_SendTextMessage(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    Text   = "Message text";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text"  , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (simple)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];
    Text    = "<b>Bold text</b>";
    Markup  = "HTML";

    Keyboard         = New Array;
    ButtonsLineArray = New Array;

    Options = New Structure;
    Options.Insert("text" , "Button1");
    Options.Insert("data" , "ButtonEvent1");
    Options.Insert("style", "attention");

    Button = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "MakeActionButton", Options);
    ButtonsLineArray.Add(Button);

    Options = New Structure;
    Options.Insert("text" , "Button2");
    Options.Insert("url"  , "https://openintegrations.dev");

    Button = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "MakeActionButton", Options);
    ButtonsLineArray.Add(Button);

    Keyboard.Add(ButtonsLineArray);
    Keyboard.Add(ButtonsLineArray);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("chatid"  , ChatID);
    Options.Insert("text"    , Text);
    Options.Insert("reply"   , ReplyID);
    Options.Insert("keyboard", Keyboard);
    Options.Insert("parsemod", Markup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

    MessageID = Result["msgId"];
    OPI_TestDataRetrieval.WriteParameter("VkTeams_MessageID", MessageID);
    FunctionParameters.Insert("VkTeams_MessageID", MessageID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKTeams_ForwardMessage(FunctionParameters)

    Token      = FunctionParameters["VkTeams_Token"];
    ChatID     = FunctionParameters["VkTeams_ChatID"];
    FromChatID = FunctionParameters["VkTeams_ChatID2"];
    MessageID  = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("messageid", MessageID);
    Options.Insert("fromid"   , FromChatID);
    Options.Insert("chatid"   , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ForwardMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ForwardMessage (simple)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Text = "Additional text";

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("messageid", MessageID);
    Options.Insert("fromid"   , FromChatID);
    Options.Insert("chatid"   , ChatID);
    Options.Insert("text"     , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ForwardMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ForwardMessage", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

EndProcedure

Procedure CLI_VKTeams_SendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    Text   = "File caption";

    File     = FunctionParameters["Document"]; // URL
    FilePath = GetTempFileName("docx"); // Path

    FileCopy(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile (URL)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , FilePath);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile (Path)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("chatid"   , ChatID);
    Options.Insert("file"     , FileBD);
    Options.Insert("text"     , Text);
    Options.Insert("filename" , "ImportantDocument.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

    DeleteFiles(FilePath);

    FileID = Result["fileId"];
    OPI_TestDataRetrieval.WriteParameter("VkTeams_FileID", FileID);
    FunctionParameters.Insert("VkTeams_FileID", FileID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKTeams_ResendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_FileID"];
    Text   = "File caption";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("fileid" , FileID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ResendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ResendFile", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

EndProcedure

Procedure CLI_VKTeams_GetFileInformation(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    FileID = FunctionParameters["VkTeams_FileID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetFileInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileInformation", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTFile(Result);

EndProcedure

Procedure CLI_VKTeams_EditMessageText(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];
    Text      = "New message text";

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("chatid"   , ChatID);
    Options.Insert("messageid", MessageID);
    Options.Insert("text"     , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "EditMessageText", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditMessageText (simple)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result); // SKIP

    Text   = "<b>New bold message text</b>";
    Markup = "HTML";

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("chatid"   , ChatID);
    Options.Insert("messageid", MessageID);
    Options.Insert("text"     , Text);
    Options.Insert("parsemod" , Markup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "EditMessageText", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditMessageText", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKTeams_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token"    , Token);
    Options.Insert("chatid"   , ChatID);
    Options.Insert("messageid", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DeleteMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteMessage", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKTeams_SendVoice(FunctionParameters)

    Token   = FunctionParameters["VkTeams_Token"];
    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];

    File     = FunctionParameters["Audio2"] ; // URL
    FilePath = GetTempFileName("m4a"); // Path

    FileCopy(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file"  , File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendVoice (URL)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file"  , FilePath);
    Options.Insert("reply" , ReplyID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendVoice (Path)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    DeleteFiles(FilePath);

    FileID = Result["fileId"];
    OPI_TestDataRetrieval.WriteParameter("VkTeams_VoiceID", FileID);
    FunctionParameters.Insert("VkTeams_VoiceID", FileID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_VKTeams_ResendVoice(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_VoiceID"];

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ResendVoice", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ResendVoice", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

EndProcedure

Procedure CLI_VKTeams_RemoveChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("members", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "RemoveChatMembers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RemoveChatMembers", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure CLI_VKTeams_ChangeChatPicture(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    File     = FunctionParameters["Picture3"]; // URL
    FilePath = GetTempFileName("png"); // Path

    FileCopy(File, FilePath);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatPicture (URL)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result); // SKIP

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , FilePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatPicture (Path)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result); // SKIP

    DeleteFiles(FilePath);

EndProcedure

Procedure CLI_VKTeams_GetChatInfo(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatInfo", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatInfo", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTChat(Result);

EndProcedure

Procedure CLI_VKTeams_GetChatAdmins(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatAdmins", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatAdmins", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTList(Result, "admins");

EndProcedure

Procedure CLI_VKTeams_GetChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatMembers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatMembers", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTList(Result, "members");

EndProcedure

Procedure CLI_VKTeams_GetChatBlockedUsers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatBlockedUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatBlockedUsers", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTList(Result, "users");

EndProcedure

Procedure CLI_VKTeams_GetChatJoinRequests(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatJoinRequests", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatJoinRequests", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTList(Result, "users");

EndProcedure

Procedure CLI_VKTeams_BlockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("userid" , User);
    Options.Insert("dellast", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "BlockChatUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "BlockChatUser", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure CLI_VKTeams_UnblockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("userid" , User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "UnblockChatUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UnblockChatUser", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure CLI_VKTeams_PinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token"     , Token);
    Options.Insert("chatid"    , ChatID);
    Options.Insert("messageid" , MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "PinMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PinMessage", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure CLI_VKTeams_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token"     , Token);
    Options.Insert("chatid"    , ChatID);
    Options.Insert("messageid" , MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "UnpinMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UnpinMessage", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure CLI_VKTeams_ApprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("userid" , User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ApprovePending", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ApprovePending (single)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTPending(Result); // SKIP

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ApprovePending", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ApprovePending", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTPending(Result);

EndProcedure

Procedure CLI_VKTeams_DisapprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("userid" , User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DisapprovePending", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DisapprovePending (single)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTPending(Result); // SKIP

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DisapprovePending", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DisapprovePending", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTPending(Result);

EndProcedure

Procedure CLI_VKTeams_SetChatTitle(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New title";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatTitle", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetChatTitle", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure CLI_VKTeams_SetChatDescription(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New description";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetChatDescription", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure CLI_VKTeams_SetChatRules(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "Text of the new rules";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatRules", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetChatRules", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure


#EndRegion

#Region Ozon

Procedure CLI_Ozon_GetCategoriesAndProductTypesTree(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey"  , APIKey);
    Options.Insert("lang"    , "EN");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCategoriesAndProductTypesTree", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoriesAndProductTypesTree (EN)", "Ozon");
    OPI_TestDataRetrieval.Check_OzonCategoryList(Result); // SKIP

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey"  , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCategoriesAndProductTypesTree", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoriesAndProductTypesTree", "Ozon");
    OPI_TestDataRetrieval.Check_OzonCategoryList(Result);

EndProcedure

Procedure CLI_Ozon_GetCategoryAttributes(FunctionParameters)

    ClientID   = FunctionParameters["Ozon_ClientID"];
    APIKey     = FunctionParameters["Ozon_ApiKey"];
    CategoryID = 17029016;
    TypeID     = 970778135;

    Options = New Structure;
    Options.Insert("clientid"  , ClientID);
    Options.Insert("apikey"    , APIKey);
    Options.Insert("categoryid", CategoryID);
    Options.Insert("typeid"    , TypeID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCategoryAttributes", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoryAttributes", "Ozon");
    OPI_TestDataRetrieval.Check_OzonAttributesList(Result);

EndProcedure

Procedure CLI_Ozon_GetAttributeValues(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;

    Options = New Structure;
    Options.Insert("clientid"   , ClientID);
    Options.Insert("apikey"     , APIKey);
    Options.Insert("categoryid" , CategoryID);
    Options.Insert("typeid"     , TypeID);
    Options.Insert("attributeid", AttributeID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetAttributeValues", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetAttributeValues", "Ozon");
    OPI_TestDataRetrieval.Check_OzonListOfAttributesValues(Result);

EndProcedure

Procedure CLI_Ozon_SearchAttributeValue(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;
    Value       = "Sunshine";

    Options = New Structure;
    Options.Insert("clientid"   , ClientID);
    Options.Insert("apikey"     , APIKey);
    Options.Insert("categoryid" , CategoryID);
    Options.Insert("typeid"     , TypeID);
    Options.Insert("attributeid", AttributeID);
    Options.Insert("value"      , Value);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "SearchAttributeValue", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "SearchAttributeValue", "Ozon");
    OPI_TestDataRetrieval.Check_OzonListOfAttributesValues(Result);

EndProcedure

Procedure CLI_Ozon_GetProductStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductStructure", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_CreateUpdateProducts(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Image1   = FunctionParameters["Picture"];
    Image2   = FunctionParameters["Picture2"];
    Video    = "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/";

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    // Common fields

    ItemStructure = New Structure;
    ItemStructure.Insert("description_category_id", 17028922);
    ItemStructure.Insert("name"                   , "Protective film set for X3 NFC. Dark cotton");
    ItemStructure.Insert("offer_id"               , "143210609");
    ItemStructure.Insert("barcode"                , "112772873170");
    ItemStructure.Insert("price"                  , "1300");
    ItemStructure.Insert("old_price"              , "1300");
    ItemStructure.Insert("vat"                    , "0.1");
    ItemStructure.Insert("height"                 , 250);
    ItemStructure.Insert("width"                  , 150);
    ItemStructure.Insert("depth"                  , 10);
    ItemStructure.Insert("dimension_unit"         , "mm");
    ItemStructure.Insert("weight"                 , 100);
    ItemStructure.Insert("weight_unit"            , "g");
    ItemStructure.Insert("images"                 , ImageArray);

    // Video

    Options = New Structure;
    Options.Insert("item"  , ItemStructure);
    Options.Insert("url"   , Video);
    Options.Insert("title" , "video1");

    ItemStructure = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "AddProductVideo", Options);

    // Attributes individualized for different categories

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");
    CategoryAttribute2 = New Structure("dictionary_value_id,value", 5060050 , "Samsung");
    CategoryAttribute3 = New Structure("dictionary_value_id,value", 61576 , "gray");
    CategoryAttribute4 = New Structure("dictionary_value_id,value", 95911 , "Protective film set for X3 NFC. Dark cotton");

    CategoryAttribute5 = New Structure("value", "Protective film set for X3 NFC. Dark cotton");


    Options = New Structure;
    Options.Insert("object"     , ItemStructure);
    Options.Insert("attributeid", 5076);
    Options.Insert("complexid"  , 0);
    Options.Insert("values"     , CategoryAttribute1);

    ItemStructure = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CompleteComplexAttribute", Options);

    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 85   , 0, CategoryAttribute2);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 10096, 0, CategoryAttribute3);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 8229 , 0, CategoryAttribute4);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 9048 , 0, CategoryAttribute5);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey"  , APIKey);
    Options.Insert("items"   , ItemStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateUpdateProducts", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateUpdateProducts", "Ozon");
    OPI_TestDataRetrieval.Check_OzonUploadTask(Result);

    TaskID = Result["result"]["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_TaskID", TaskID);
    FunctionParameters.Insert("Ozon_TaskID", TaskID);

    OPI_Tools.Pause(120);

EndProcedure

Procedure CLI_Ozon_AddProductVideo(FunctionParameters)

    Video = "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/";

    ItemStructure = New Structure;
    ItemStructure.Insert("description_category_id", 17028922);
    ItemStructure.Insert("name"                   , "Protective film set for X3 NFC. Dark cotton");
    ItemStructure.Insert("offer_id"               , "143210608");
    ItemStructure.Insert("barcode"                , "112772873170");
    ItemStructure.Insert("price"                  , "1000");
    ItemStructure.Insert("old_price"              , "1100");
    ItemStructure.Insert("vat"                    , "0.1");
    ItemStructure.Insert("height"                 , 250);
    ItemStructure.Insert("width"                  , 150);
    ItemStructure.Insert("depth"                  , 10);
    ItemStructure.Insert("dimension_unit"         , "mm");
    ItemStructure.Insert("weight"                 , 100);
    ItemStructure.Insert("weight_unit"            , "g");

    // Video

    Options = New Structure;
    Options.Insert("item"  , ItemStructure);
    Options.Insert("url"   , Video);
    Options.Insert("title" , "video1");

    ItemStructure = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "AddProductVideo", Options);

    OPI_TestDataRetrieval.WriteLog(ItemStructure, "AddProductVideo", "Ozon");
    OPI_TestDataRetrieval.Check_Map(ItemStructure);

EndProcedure

Procedure CLI_Ozon_AddProductVideoCover(FunctionParameters)

    Video = "https://rutube.ru/video/c6cc4d620b1d4338901770a44b3e82f4/";

    ItemStructure = New Structure;
    ItemStructure.Insert("description_category_id", 17028922);
    ItemStructure.Insert("name"                   , "Protective film set for X3 NFC. Dark cotton");
    ItemStructure.Insert("offer_id"               , "143210608");
    ItemStructure.Insert("barcode"                , "112772873170");
    ItemStructure.Insert("price"                  , "1000");
    ItemStructure.Insert("old_price"              , "1100");
    ItemStructure.Insert("vat"                    , "0.1");
    ItemStructure.Insert("height"                 , 250);
    ItemStructure.Insert("width"                  , 150);
    ItemStructure.Insert("depth"                  , 10);
    ItemStructure.Insert("dimension_unit"         , "mm");
    ItemStructure.Insert("weight"                 , 100);
    ItemStructure.Insert("weight_unit"            , "g");

    // Videocover

    Options = New Structure;
    Options.Insert("item" , ItemStructure);
    Options.Insert("url"  , Video);

    ItemStructure = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "AddProductVideoCover", Options);

    OPI_TestDataRetrieval.WriteLog(ItemStructure, "AddProductVideoCover", "Ozon");
    OPI_TestDataRetrieval.Check_Map(ItemStructure);

EndProcedure

Procedure CLI_Ozon_CompleteComplexAttribute(FunctionParameters)

    ItemStructure = New Structure;
    ItemStructure.Insert("description_category_id", 17028922);
    ItemStructure.Insert("name"                   , "Protective film set for X3 NFC. Dark cotton");
    ItemStructure.Insert("offer_id"               , "143210608");
    ItemStructure.Insert("barcode"                , "112772873170");
    ItemStructure.Insert("price"                  , "1000");
    ItemStructure.Insert("old_price"              , "1100");
    ItemStructure.Insert("vat"                    , "0.1");
    ItemStructure.Insert("height"                 , 250);
    ItemStructure.Insert("width"                  , 150);
    ItemStructure.Insert("depth"                  , 10);
    ItemStructure.Insert("dimension_unit"         , "mm");
    ItemStructure.Insert("weight"                 , 100);
    ItemStructure.Insert("weight_unit"            , "g");

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");

    Options = New Structure;
    Options.Insert("object"     , ItemStructure);
    Options.Insert("attributeid", 5076);
    Options.Insert("complexid"  , 0);
    Options.Insert("values"     , CategoryAttribute1);

    ItemStructure = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CompleteComplexAttribute", Options);

    OPI_TestDataRetrieval.WriteLog(ItemStructure, "CompleteComplexAttribute", "Ozon");
    OPI_TestDataRetrieval.Check_Map(ItemStructure);

EndProcedure

Procedure CLI_Ozon_GetProductCreationStatus(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    TaskID   = FunctionParameters["Ozon_TaskID"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("taskid"   , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCreationStatus", "Ozon");

    WHile Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    EndDo;

    OPI_TestDataRetrieval.Check_OzonNewProducts(Result);

EndProcedure

Procedure CLI_Ozon_CreateProductByOzonID(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    ItemStructure = New Structure;
    ItemStructure.Insert("name"         , "New imported product");
    ItemStructure.Insert("sku"          , 1626044001);
    ItemStructure.Insert("offer_id"     , "91132");
    ItemStructure.Insert("price"        , "1100");
    ItemStructure.Insert("old_price"    , "1100");
    ItemStructure.Insert("vat"          , "0.1");
    ItemStructure.Insert("currency_code", "RUB");

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("items"    , ItemStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateProductByOzonID", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductByOzonID", "Ozon");
    OPI_TestDataRetrieval.Check_OzonUploadTask(Result);

    TaskID = Result["result"]["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_SkuTaskID", TaskID);
    FunctionParameters.Insert("Ozon_SkuTaskID", TaskID);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("taskid"   , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    WHile Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    EndDo;

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCreationStatus (SKU)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNewProducts(Result);

EndProcedure

Procedure CLI_Ozon_GetSimplifiedProductStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetSimplifiedProductStructure", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetSimplifiedProductStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetAttributesUpdateStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetAttributesUpdateStructure", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetAttributesUpdateStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_UpdateProductsAttributes(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    AttributesStructure = New Structure("offer_id", "143210609");

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");
    CategoryAttribute2 = New Structure("dictionary_value_id,value", 5060050 , "Samsung");
    CategoryAttribute3 = New Structure("dictionary_value_id,value", 61576 , "red");

    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 85   , 0, CategoryAttribute2);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 10096, 0, CategoryAttribute3);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("items"    , AttributesStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsAttributes", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsAttributes", "Ozon");
    OPI_TestDataRetrieval.Check_OzonUploadTask(Result, False);

    TaskID = Result["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_AttUpdateTaskID", TaskID);
    FunctionParameters.Insert("Ozon_AttUpdateTaskID", TaskID);

    Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    WHile Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    EndDo;

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCreationStatus (att.)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNewProducts(Result);

EndProcedure

Procedure CLI_Ozon_GetProductsFilterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsFilterStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetProductList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210609");

    Filter = New Structure;
    Filter.Insert("visibility" , "ALL");
    Filter.Insert("offer_id"   , IDArray);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("filter"   , Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductList", "Ozon");
    OPI_TestDataRetrieval.Check_OzonObjectsArray(Result);

    ProductID = Result["result"]["items"][0]["product_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_ProductID", ProductID);
    FunctionParameters.Insert("Ozon_ProductID", ProductID);

EndProcedure

Procedure CLI_Ozon_GetProductsAttributesData(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210609");

    Filter = New Structure;
    Filter.Insert("visibility", "ALL");
    Filter.Insert("offer_id"  , IDArray);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("filter"   , Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsAttributesData", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsAttributesData", "Ozon");
    OPI_TestDataRetrieval.Check_OzonArray(Result);

EndProcedure

Procedure CLI_Ozon_GetProductsContentRating(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("sku"      , SKU);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsContentRating", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsContentRating", "Ozon");
    OPI_TestDataRetrieval.Check_OzonRatingArray(Result);

EndProcedure

Procedure CLI_Ozon_GetProductsInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("offerid"  , Article);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsInformation", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsInformation", "Ozon");
    OPI_TestDataRetrieval.Check_OzonProducts(Result);

EndProcedure

Procedure CLI_Ozon_GetProductDescription(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("offerid"  , Article);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductDescription", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductDescription", "Ozon");
    OPI_TestDataRetrieval.Check_OzonProduct(Result);

EndProcedure

Procedure CLI_Ozon_GetProductsRequestsLimits(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsRequestsLimits", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsRequestsLimits", "Ozon");
    OPI_TestDataRetrieval.Check_OzonLimits(Result);

EndProcedure

Procedure CLI_Ozon_UpdateProductImages(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Image1 = FunctionParameters["Picture"];
    Image2 = FunctionParameters["Picture2"];

    MarketingColor = "GREEN";

    ImagesArray = New Array;
    ImagesArray.Add(Image1);
    ImagesArray.Add(Image2);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("productid", ProductID);
    Options.Insert("images"   , ImagesArray);
    Options.Insert("color"    , MarketingColor);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductImages", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductImages", "Ozon");
    OPI_TestDataRetrieval.Check_OzonPictures(Result);

EndProcedure

Procedure CLI_Ozon_CheckProductsImagesUpload(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("products" , ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CheckProductsImagesUpload", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CheckProductsImagesUpload", "Ozon");
    OPI_TestDataRetrieval.Check_OzonPictures(Result);

EndProcedure

Procedure CLI_Ozon_UpdateProductsArticles(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210609", "143210612");

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("offers"   , ArticlesMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsArticles", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsArticles", "Ozon");
    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210612", "143210609");

    Result = OPI_Ozon.UpdateProductsArticles(ClientID, APIKey, ArticlesMap);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsArticles (reverse)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

EndProcedure

Procedure CLI_Ozon_ArchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("products" , ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "ArchiveProducts", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "ArchiveProducts", "Ozon");
    OPI_TestDataRetrieval.Check_OzonTrue(Result);

EndProcedure

Procedure CLI_Ozon_UnarchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("products" , ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UnarchiveProducts", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UnarchiveProducts", "Ozon");
    OPI_TestDataRetrieval.Check_OzonTrue(Result);

EndProcedure

Procedure CLI_Ozon_DeleteProductsWithoutSKU(FunctionParameters)

    OPI_Tools.Pause(30);

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.ArchiveProducts(ClientID, APIKey, ProductID);

    OPI_TestDataRetrieval.WriteLog(Result, "ArchiveProducts (for deleting)", "Ozon"); // SKIP
    OPI_Tools.Pause(15); // SKIP

    Article = "143210609";

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("articles" , Article);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "DeleteProductsWithoutSKU", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductsWithoutSKU", "Ozon");

EndProcedure

Procedure CLI_Ozon_UploadProductActivationCodes(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Codes = New Array;
    Codes.Add("11111111");
    Codes.Add("22222222");

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("productid", ProductID);
    Options.Insert("codes"    , Codes);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UploadProductActivationCodes", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadProductActivationCodes", "Ozon");

    TaskID = 1;
    OPI_TestDataRetrieval.WriteParameter("Ozon_CodesTaskID", TaskID);
    FunctionParameters.Insert("Ozon_CodesTaskID", TaskID);

    OPI_Tools.Pause(120);

EndProcedure

Procedure CLI_Ozon_GetCodesUploadStatus(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    TaskID   = FunctionParameters["Ozon_CodesTaskID"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("taskid"   , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCodesUploadStatus", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCodesUploadStatus", "Ozon");

    If ValueIsFilled(Result["result"]) Then
        WHile Result["result"]["status"] = "pending" Do

            OPI_Tools.Pause(30);
            Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCodesUploadStatus", Options);

        EndDo;
    EndIf;

    //OPI_TestDataRetrieval.Check_OzonCodesUpload(Result);

EndProcedure

Procedure CLI_Ozon_GetProductSubscribersCount(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("sku"      , 1626044001);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductSubscribersCount", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductSubscribersCount", "Ozon");
    OPI_TestDataRetrieval.Check_OzonSubscribers(Result);

EndProcedure

Procedure CLI_Ozon_GetRelatedSKUs(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("sku"      , 1626044001);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetRelatedSKUs", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetRelatedSKUs", "Ozon");
    OPI_TestDataRetrieval.Check_OzonSKU(Result);

EndProcedure

Procedure CLI_Ozon_BindBarcodes(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    BarcodesMap = New Map;
    BarcodesMap.Insert(1626044001, "112233");

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("barcodes" , BarcodesMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "BindBarcodes", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "BindBarcodes", "Ozon");

EndProcedure

Procedure CLI_Ozon_CreateBarcodes(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid"  , ClientID);
    Options.Insert("apikey"    , APIKey);
    Options.Insert("productids", ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateBarcodes", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateBarcodes", "Ozon");
    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

EndProcedure

Procedure CLI_Ozon_GetWarehousesList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetWarehousesList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetWarehousesList", "Ozon");
    OPI_TestDataRetrieval.Check_OzonArray(Result);

EndProcedure

Procedure CLI_Ozon_GetProductsStocks(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210608");

    Filter = New Structure;
    Filter.Insert("visibility" , "ALL");
    Filter.Insert("offer_id"   , IDArray);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("filter"   , Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsStocks", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsStocks", "Ozon");
    OPI_TestDataRetrieval.Check_OzonObjectsArray(Result);

EndProcedure

Procedure CLI_Ozon_UpdateProductsPrices(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Prices = New Structure;
    Prices.Insert("auto_action_enabled"   , "DISABLED");
    Prices.Insert("currency_code"         , "RUB");
    Prices.Insert("min_price"             , "1300");
    Prices.Insert("offer_id"              , "143210610");
    Prices.Insert("old_price"             , "1400");
    Prices.Insert("price"                 , "1300");
    Prices.Insert("price_strategy_enabled", "DISABLED");
    Prices.Insert("product_id"            , ProductID);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("prices"   , Prices);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsPrices", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsPrices", "Ozon");
    OPI_TestDataRetrieval.Check_OzonUpdatedArray(Result);

EndProcedure

Procedure CLI_Ozon_UpdateProductsStocks(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Stocks = New Structure;
    Stocks.Insert("offer_id"    , "143210610");
    Stocks.Insert("product_id"  , ProductID);
    Stocks.Insert("stock"       , 20);
    Stocks.Insert("warehouse_id", 1);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("stocks"   , Stocks);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsStocks", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsStocks", "Ozon");

EndProcedure

Procedure CLI_Ozon_GetProductsPrices(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("filter"   , New Structure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsPrices", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsPrices", "Ozon");
    OPI_TestDataRetrieval.Check_OzonObjectsArray(Result);

EndProcedure

Procedure CLI_Ozon_GetDiscountInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey"  , APIKey);
    Options.Insert("sku"     , SKU);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetDiscountInformation", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDiscountInformation", "Ozon");
    OPI_TestDataRetrieval.Check_OzonArray(Result, "items");

EndProcedure

Procedure CLI_Ozon_SetProductDiscount(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = 1156646653;

    Discount = 10;

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("productid", ProductID);
    Options.Insert("discount" , Discount);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "SetProductDiscount", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "SetProductDiscount", "Ozon");

EndProcedure

Procedure CLI_Ozon_GetPromotionsList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetPromotionsList", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetPromotionsList", "Ozon");
    OPI_TestDataRetrieval.Check_OzonArray(Result);

EndProcedure

Procedure CLI_Ozon_GetAvailablePromoProducts(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    PromoID  = 111111111;

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("actionid" , PromoID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetAvailablePromoProducts", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetAvailablePromoProducts", "Ozon");

EndProcedure

Procedure CLI_Ozon_GetCurrentPromoProducts(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    PromoID  = 111111111;

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("actionid" , PromoID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCurrentPromoProducts", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCurrentPromoProducts", "Ozon");

EndProcedure

Procedure CLI_Ozon_GetProductStocksStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductStocksStructure", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductStocksStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetProductPriceStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductPriceStructure", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductPriceStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

#EndRegion

#EndRegion

#EndRegion


