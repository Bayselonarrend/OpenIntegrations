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
// BSLLS:UsingHardcodePath-off
// BSLLS:UnusedLocalVariable-off
// BSLLS:DeprecatedMessage-off
// BSLLS:LineLength-off
// BSLLS:MagicNumber-off
// BSLLS:CommentedCode-off
// BSLLS:AssignAliasFieldsInQuery-off
// BSLLS:UsingHardcodeNetworkAddress-off

//@skip-check undefined-variable
//@skip-check wrong-string-literal-content
//@skip-check module-structure-top-region
//@skip-check module-structure-method-in-regions
//@skip-check undefined-function-or-procedure
//@skip-check wrong-string-literal-content
//@skip-check module-unused-local-variable

// Uncomment if OneScript is executed
#Use "../../../tools"
#Use "../../../core"
#Use asserts

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
    CLI_Telegram_ReplaceMessageText(TestParameters);
    CLI_Telegram_ReplaceMessageKeyboard(TestParameters);
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
    CLI_Telegram_ReplaceMessageCaption(TestParameters);
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

    CLI_Telegram_GetAvatarIconList(TestParameters);

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

    Return;

    //@skip-check unreachable-statement
    // BSLLS:UnreachableCode-off

    CLI_Viber_SendTextMessage(TestParameters);
    CLI_Viber_SendImage(TestParameters);
    CLI_Viber_SendFile(TestParameters);
    CLI_Viber_SendContact(TestParameters);
    CLI_Viber_SendLocation(TestParameters);
    CLI_Viber_SendLink(TestParameters);

    // BSLLS:UnreachableCode-on

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
    CLI_Airtable_DeleteRecords(TestParameters);

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
    CLI_VKTeams_MakeActionButton(TestParameters);

EndProcedure

Procedure CLI_VKT_ChatManagement() Export

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

    // Message("Ozon product checkout is unavailable");
    // Return;

    // BSLLS:UnreachableCode-off

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

    // BSLLS:UnreachableCode-on

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

Procedure CLI_OzonAPI_WarehousesManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    CLI_Ozon_GetWarehousesList(TestParameters);

EndProcedure

Procedure CLI_OzonAPI_PromotionsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    CLI_Ozon_GetPromotionsList(TestParameters);
    CLI_Ozon_GetCurrentPromoProducts(TestParameters);
    CLI_Ozon_GetAvailablePromoProducts(TestParameters);

EndProcedure

Procedure CLI_OzonAPI_FBOScheme() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    CLI_Ozon_GetClustersList(TestParameters);
    CLI_Ozon_GetShippingWarehousesList(TestParameters);
    CLI_Ozon_CreateFBODraft(TestParameters);
    CLI_Ozon_GetFBODraft(TestParameters);
    CLI_Ozon_GetShipmentAdditionalFields(TestParameters);
    CLI_Ozon_GetShipmentsFilterStructure(TestParameters);
    CLI_Ozon_GetFBOShipmentsList(TestParameters);
    CLI_Ozon_GetFBOTimeslots(TestParameters);

EndProcedure

#EndRegion

#Region Neocities

Procedure CLI_NC_FilesManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("NC_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Gif"      , TestParameters);

    CLI_Neocities_UploadFile(TestParameters);
    CLI_Neocities_UploadFiles(TestParameters);
    CLI_Neocities_GetFilesList(TestParameters);
    CLI_Neocities_DeleteSelectedFiles(TestParameters);
    CLI_Neocities_SynchronizeFolders(TestParameters);

EndProcedure

Procedure CLI_NC_DataRetrieving() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("NC_Token"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("NC_Login"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("NC_Password", TestParameters);

    CLI_Neocities_GetSiteData(TestParameters);
    CLI_Neocities_GetToken(TestParameters);

EndProcedure

#EndRegion

#Region Bitrix24

Procedure CLI_B24_TokenManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientSecret", TestParameters);

    CLI_Bitrix24_GetAppAuthLink(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Code", TestParameters);

    CLI_Bitrix24_GetToken(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Refresh", TestParameters);

    CLI_Bitrix24_RefreshToken(TestParameters);

EndProcedure

Procedure CLI_B24_ServerTime() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CLI_Bitrix24_ServerTime(TestParameters);

EndProcedure

Procedure CLI_B24_PostsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);

    CLI_Bitrix24_CreatePost(TestParameters);
    CLI_Bitrix24_UpdatePost(TestParameters);
    CLI_Bitrix24_GetImportantPostViewers(TestParameters);
    CLI_Bitrix24_GetPosts(TestParameters);
    CLI_Bitrix24_AddPostComment(TestParameters);
    CLI_Bitrix24_AddPostRecipients(TestParameters);
    CLI_Bitrix24_DeletePost(TestParameters);

EndProcedure

Procedure CLI_B24_TaskManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_UserID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);

    CLI_Bitrix24_GetTaskFieldsStructure(TestParameters);
    CLI_Bitrix24_CreateTask(TestParameters);
    CLI_Bitrix24_CreateTasksDependencies(TestParameters);
    CLI_Bitrix24_DeleteTasksDependencies(TestParameters);
    CLI_Bitrix24_UpdateTask(TestParameters);
    CLI_Bitrix24_GetTask(TestParameters);
    CLI_Bitrix24_MuteTask(TestParameters);
    CLI_Bitrix24_UnmuteTask(TestParameters);
    CLI_Bitrix24_AddTaskToFavorites(TestParameters);
    CLI_Bitrix24_RemoveTaskFromFavorites(TestParameters);
    CLI_Bitrix24_DelegateTask(TestParameters);
    CLI_Bitrix24_DeferTask(TestParameters);
    CLI_Bitrix24_CompleteTask(TestParameters);
    CLI_Bitrix24_DisapproveTask(TestParameters);
    CLI_Bitrix24_ApproveTask(TestParameters);
    CLI_Bitrix24_RenewTask(TestParameters);
    CLI_Bitrix24_StartTask(TestParameters);
    CLI_Bitrix24_StartWatchingTask(TestParameters);
    CLI_Bitrix24_StopWatchingTask(TestParameters);
    CLI_Bitrix24_PauseTask(TestParameters);
    CLI_Bitrix24_GetTaskHistory(TestParameters);
    CLI_Bitrix24_GetTasksList(TestParameters);
    CLI_Bitrix24_CheckTaskAccesses(TestParameters);
    CLI_Bitrix24_AddTasksChecklistElement(TestParameters);
    CLI_Bitrix24_UpdateTasksChecklistElement(TestParameters);
    CLI_Bitrix24_GetTasksChecklist(TestParameters);
    CLI_Bitrix24_GetTasksChecklistElement(TestParameters);
    CLI_Bitrix24_CompleteTasksChecklistElement(TestParameters);
    CLI_Bitrix24_RenewTasksChecklistElement(TestParameters);
    CLI_Bitrix24_DeleteTasksChecklistElement(TestParameters);
    CLI_Bitrix24_GetDailyPlan(TestParameters);
    CLI_Bitrix24_GetTasksFilterStructure(TestParameters);

    Name          = "Topic picture.jpg";
    Image         = TestParameters["Picture"];
    DestinationID = 3;

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID);
    FileID = Result["result"]["ID"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_TaskFileID", FileID);
    TestParameters.Insert("Bitrix24_TaskFileID", FileID);

    CLI_Bitrix24_AttachFileToTopic(TestParameters);

    OPI_Bitrix24.DeleteFile(URL, FileID);

    CLI_Bitrix24_DeleteTask(TestParameters);

EndProcedure

Procedure CLI_B24_CommentsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);
    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CommentsTaskID", TaskID);
    TestParameters.Insert("Bitrix24_CommentsTaskID", TaskID);

    CLI_Bitrix24_AddTaskComment(TestParameters);
    CLI_Bitrix24_UpdateTaskComment(TestParameters);
    CLI_Bitrix24_CreateResultFromComment(TestParameters);
    CLI_Bitrix24_GetResultsList(TestParameters);
    CLI_Bitrix24_DeleteResultFromComment(TestParameters);
    CLI_Bitrix24_GetTaskCommentsList(TestParameters);
    CLI_Bitrix24_GetTaskComment(TestParameters);
    CLI_Bitrix24_DeleteTaskComment(TestParameters);
    CLI_Bitrix24_GetCommentStructure(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

EndProcedure

Procedure CLI_B24_WorkingWithDrive() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);

    CLI_Bitrix24_GetStoragesList(TestParameters);
    CLI_Bitrix24_GetAppStorage(TestParameters);
    CLI_Bitrix24_RenameStorage(TestParameters);
    CLI_Bitrix24_GetStorage(TestParameters);
    CLI_Bitrix24_UploadFileToStorage(TestParameters);
    CLI_Bitrix24_GetStorageObjects(TestParameters);
    CLI_Bitrix24_GetFileInformation(TestParameters);
    CLI_Bitrix24_GetFileExternalLink(TestParameters);
    CLI_Bitrix24_RenameFile(TestParameters);
    CLI_Bitrix24_MarkFileAsDeleted(TestParameters);
    CLI_Bitrix24_RestoreFile(TestParameters);
    CLI_Bitrix24_CreateStorageFolder(TestParameters);
    CLI_Bitrix24_RenameFolder(TestParameters);
    CLI_Bitrix24_GetFolderInformation(TestParameters);
    CLI_Bitrix24_GetFolderExternalLink(TestParameters);
    CLI_Bitrix24_CreateSubfolder(TestParameters);
    CLI_Bitrix24_MoveFileToFolder(TestParameters);
    CLI_Bitrix24_MakeFolderCopy(TestParameters);
    CLI_Bitrix24_UploadFileToFolder(TestParameters);
    CLI_Bitrix24_MakeCopyFile(TestParameters);
    CLI_Bitrix24_DeleteFile(TestParameters);
    CLI_Bitrix24_GetFolderFilterStructure(TestParameters);
    CLI_Bitrix24_GetFolderItems(TestParameters);
    CLI_Bitrix24_MoveFolder(TestParameters);
    CLI_Bitrix24_MarkFolderAsDeleted(TestParameters);
    CLI_Bitrix24_RestoreFolder(TestParameters);
    CLI_Bitrix24_DeleteFolder(TestParameters);

EndProcedure

Procedure CLI_B24_Timekeeping() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);
    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ElapsedTaskID", TaskID);
    TestParameters.Insert("Bitrix24_ElapsedTaskID", TaskID);

    CLI_Bitrix24_AddTaskTimeAccounting(TestParameters);
    CLI_Bitrix24_GetTaskTimeAccounting(TestParameters);
    CLI_Bitrix24_GetTaskTimeAccountingList(TestParameters);
    CLI_Bitrix24_UpdateTaskTimeAccounting(TestParameters);
    CLI_Bitrix24_DeleteTaskTimeAccounting(TestParameters);
    CLI_Bitrix24_StartTimekeeping(TestParameters);
    CLI_Bitrix24_PauseTimekeeping(TestParameters);
    CLI_Bitrix24_GetTimekeepingStatus(TestParameters);
    CLI_Bitrix24_StopTimekeeping(TestParameters);
    CLI_Bitrix24_GetTimekeepingSettings(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

EndProcedure

Procedure CLI_B24_Kanban() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);
    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_KanbanTaskID", TaskID);
    TestParameters.Insert("Bitrix24_KanbanTaskID", TaskID);

    CLI_Bitrix24_AddKanbanStage(TestParameters);
    CLI_Bitrix24_GetKanbanStages(TestParameters);
    CLI_Bitrix24_MoveTaskToKanbanStage(TestParameters);
    CLI_Bitrix24_UpdateKanbansStage(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

    CLI_Bitrix24_DeleteKanbanStage(TestParameters);

EndProcedure

Procedure CLI_B24_NotificationsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"       , TestParameters);

    CLI_Bitrix24_CreatePersonalNotification(TestParameters);
    CLI_Bitrix24_CreateSystemNotification(TestParameters);
    CLI_Bitrix24_DeleteNotification(TestParameters);

EndProcedure

Procedure CLI_B24_TasksFieldsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token"          , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_HookTaskFieldID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_TaskFieldID"    , TestParameters);

    CLI_Bitrix24_AddCustomTaskField(TestParameters);
    CLI_Bitrix24_UpdateCustomTaskField(TestParameters);
    CLI_Bitrix24_GetCustomTaskField(TestParameters);
    CLI_Bitrix24_GetCustomTaskFieldsList(TestParameters);
    CLI_Bitrix24_DeleteCustomTaskField(TestParameters);

EndProcedure

Procedure CLI_B24_DepartmentsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CLI_Bitrix24_CreateDepartment(TestParameters);
    CLI_Bitrix24_GetDepartments(TestParameters);
    CLI_Bitrix24_UpdateDepartment(TestParameters);
    CLI_Bitrix24_DeleteDepartment(TestParameters);

EndProcedure

Procedure CLI_B24_ChatManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"       , TestParameters);

    CLI_Bitrix24_GetUserStatus(TestParameters);
    CLI_Bitrix24_SetUserStatus(TestParameters);
    CLI_Bitrix24_GetUsers(TestParameters);
    CLI_Bitrix24_CreateChat(TestParameters);

    OPI_Tools.Pause(5);

    CLI_Bitrix24_GetChatUsers(TestParameters);
    CLI_Bitrix24_DeleteUserFromChat(TestParameters);
    CLI_Bitrix24_AddUsersToChat(TestParameters);
    CLI_Bitrix24_ChangeChatTitle(TestParameters);

    OPI_Tools.Pause(5);

    CLI_Bitrix24_ChangeChatColor(TestParameters);
    CLI_Bitrix24_ChangeChatPicture(TestParameters);
    CLI_Bitrix24_DisableChatNotifications(TestParameters);
    CLI_Bitrix24_EnableChatNotifications(TestParameters);

    OPI_Tools.Pause(5);

    CLI_Bitrix24_GetChatMessagesList(TestParameters);
    CLI_Bitrix24_MarkMessageAsReaded(TestParameters);
    CLI_Bitrix24_MarkMessageAsUnreaded(TestParameters);
    CLI_Bitrix24_GetDialog(TestParameters);

    OPI_Tools.Pause(5);

    CLI_Bitrix24_GetChatMembersList(TestParameters);
    CLI_Bitrix24_SendWritingNotification(TestParameters);
    CLI_Bitrix24_SendMessage(TestParameters);
    CLI_Bitrix24_EditMessage(TestParameters);
    CLI_Bitrix24_GetPictureBlock(TestParameters);
    CLI_Bitrix24_GetFileBlock(TestParameters);

    OPI_Tools.Pause(5);

    CLI_Bitrix24_SetMessageReaction(TestParameters);
    CLI_Bitrix24_DeleteMessage(TestParameters);
    CLI_Bitrix24_GetChatFilesFolder(TestParameters);
    CLI_Bitrix24_SendFile(TestParameters);

    OPI_Tools.Pause(5);

    CLI_Bitrix24_ReadAll(TestParameters);
    CLI_Bitrix24_ChangeChatOwner(TestParameters);
    CLI_Bitrix24_LeaveChat(TestParameters);

    CLI_Bitrix24_GetChatStructure(TestParameters);

EndProcedure

Procedure CLI_B2_UsersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CLI_Bitrix24_GetCurrentUser(TestParameters);
    CLI_Bitrix24_GetUserFieldsStructure(TestParameters);
    CLI_Bitrix24_CreateUser(TestParameters);
    CLI_Bitrix24_FindUsers(TestParameters);
    CLI_Bitrix24_UpdateUser(TestParameters);
    CLI_Bitrix24_GetUser(TestParameters);
    CLI_Bitrix24_ChangeUserStatus(TestParameters);
    CLI_Bitrix24_GetUserFilterStructure(TestParameters);

EndProcedure

Procedure CLI_B24_LeadsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CLI_Bitrix24_GetLeadsList(TestParameters);
    CLI_Bitrix24_GetLeadFilterStructure(TestParameters);
    CLI_Bitrix24_GetLeadStructure(TestParameters);
    CLI_Bitrix24_CreateLead(TestParameters);
    CLI_Bitrix24_GetLead(TestParameters);
    CLI_Bitrix24_UpdateLead(TestParameters);
    CLI_Bitrix24_DeleteLead(TestParameters);

EndProcedure

Procedure CLI_B24_DealsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    CLI_Bitrix24_GetDealsFilterStructure(TestParameters);
    CLI_Bitrix24_GetDealStructure(TestParameters);
    CLI_Bitrix24_CreateDeal(TestParameters);
    CLI_Bitrix24_GetDeal(TestParameters);
    CLI_Bitrix24_UpdateDeal(TestParameters);
    CLI_Bitrix24_DeleteDeal(TestParameters);
    CLI_Bitrix24_GetDealsList(TestParameters);

EndProcedure

Procedure CLI_B24_CalendarsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token"  , TestParameters);

    CLI_Bitrix24_CreateCalendar(TestParameters);
    CLI_Bitrix24_UpdateCalendar(TestParameters);
    CLI_Bitrix24_GetCalendarList(TestParameters);
    CLI_Bitrix24_CreateCalendarEvent(TestParameters);
    CLI_Bitrix24_SetUserParticipationStatus(TestParameters);
    CLI_Bitrix24_GetUserParticipationStatus(TestParameters);
    CLI_Bitrix24_GetCalendarEvent(TestParameters);
    CLI_Bitrix24_GetCalendarEvents(TestParameters);
    CLI_Bitrix24_UpdateCalendarEvent(TestParameters);
    CLI_Bitrix24_GetUserBusy(TestParameters);
    CLI_Bitrix24_DeleteCalendarEvent(TestParameters);
    CLI_Bitrix24_DeleteCalendar(TestParameters);
    CLI_Bitrix24_GetCustomCalendarSettings(TestParameters);
    CLI_Bitrix24_SetCustomCalendarSettings(TestParameters);
    CLI_Bitrix24_GetCalendarStructure(TestParameters);
    CLI_Bitrix24_GetCalendarSettingsStructure(TestParameters);
    CLI_Bitrix24_GetCalednarCustomSettingsStructure(TestParameters);
    CLI_Bitrix24_GetCalendarEventsStructure(TestParameters);
    CLI_Bitrix24_GetCalendarEventsFilterStructure(TestParameters);

EndProcedure

#EndRegion

#Region CDEK

Procedure CLI_CdekAPI_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Account"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Password" , TestParameters);

    CLI_CDEK_GetToken(TestParameters);
    CLI_CDEK_GetCashboxChecksByDate(TestParameters);
    CLI_CDEK_GetDeliveryCashRegistry(TestParameters);
    CLI_CDEK_GetDeliveryCashTransfers(TestParameters);
    CLI_CDEK_GetOfficeFilterDescription(TestParameters);
    CLI_CDEK_GetOfficeList(TestParameters);
    CLI_CDEK_GetRegionsList(TestParameters);

EndProcedure

Procedure CLI_CDEKAPI_OrdersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Token" , TestParameters);

    CLI_CDEK_GetOrderDescription(TestParameters);
    CLI_CDEK_CreateOrder(TestParameters);

    OPI_Tools.Pause(25);

    CLI_CDEK_GetOrder(TestParameters);
    CLI_CDEK_GetOrderByNumber(TestParameters);
    CLI_CDEK_CreateReceipt(TestParameters);
    CLI_CDEK_CreateBarcode(TestParameters);
    CLI_CDEK_CreatePrealert(TestParameters);

    OPI_Tools.Pause(25);

    CLI_CDEK_GetReceipt(TestParameters);
    CLI_CDEK_GetBarcode(TestParameters);
    CLI_CDEK_GetPrealert(TestParameters);
    CLI_CDEK_GetPassportDataStatus(TestParameters);
    CLI_CDEK_GetCashboxCheck(TestParameters);
    CLI_CDEK_UpdateOrder(TestParameters);
    CLI_CDEK_CreateCustomerRefund(TestParameters);
    CLI_CDEK_CreateRefusal(TestParameters);
    CLI_CDEK_DeleteOrder(TestParameters);

EndProcedure

Procedure CLI_CdekAPI_CourierInvitationsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Token", TestParameters);

    CLI_CDEK_CreateOrder(TestParameters);

    OPI_Tools.Pause(25);

    CLI_CDEK_GetCourierInvitationsDescription(TestParameters);
    CLI_CDEK_CreateCourierInvitation(TestParameters);
    CLI_CDEK_GetCourierInvitation(TestParameters);
    CLI_CDEK_DeleteCourierInvitation(TestParameters);
    CLI_CDEK_GetAppointmentDescription(TestParameters);
    CLI_CDEK_GetAvailableDeliveryIntervals(TestParameters);
    CLI_CDEK_RegisterDeliveryAppointment(TestParameters);

    OPI_Tools.Pause(25);

    CLI_CDEK_GetDeliveryAppointment(TestParameters);
    CLI_CDEK_DeleteOrder(TestParameters);

EndProcedure

#EndRegion

#Region YandexMetrika

Procedure CLI_YaMetrika_TagsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    CLI_YandexMetrika_CreateTag(TestParameters);
    CLI_YandexMetrika_GetTagsList(TestParameters);
    CLI_YandexMetrika_UpdateTag(TestParameters);
    CLI_YandexMetrika_GetTag(TestParameters);
    CLI_YandexMetrika_DeleteTag(TestParameters);

EndProcedure

Procedure CLI_YaMetrika_CountersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    CLI_YandexMetrika_GetCounterStructure(TestParameters);
    CLI_YandexMetrika_CreateCounter(TestParameters);
    CLI_YandexMetrika_GetCounter(TestParameters);
    CLI_YandexMetrika_UpdateCounter(TestParameters);
    CLI_YandexMetrika_DeleteCounter(TestParameters);
    CLI_YandexMetrika_RestoreCounter(TestParameters);
    CLI_YandexMetrika_GetCountersList(TestParameters);
    CLI_YandexMetrika_DeleteCounter(TestParameters);

EndProcedure

Procedure CLI_YaMetrika_ActionsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    CLI_YandexMetrika_CreateCounter(TestParameters);
    CLI_YandexMetrika_GetActionsList(TestParameters);
    CLI_YandexMetrika_DeleteCounter(TestParameters);

EndProcedure

#EndRegion

#Region S3

Procedure CLI_AWS_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("S3_AccessKey", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("S3_SecretKey", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("S3_URL"      , TestParameters);

    CLI_S3_GetBasicDataStructure(TestParameters);
    CLI_S3_SendRequestWithoutBody(TestParameters);
    CLI_S3_SendRequestWithBody(TestParameters);

EndProcedure

Procedure CLI_AWS_BucketsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("S3_AccessKey", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("S3_SecretKey", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("S3_URL"      , TestParameters);

    CLI_S3_CreateBucket(TestParameters);
    CLI_S3_ListBuckets(TestParameters);
    CLI_S3_HeadBucket(TestParameters);
    CLI_S3_PutBucketTagging(TestParameters);
    CLI_S3_GetBucketTagging(TestParameters);
    CLI_S3_DeleteBucketTagging(TestParameters);
    CLI_S3_PutBucketEncryption(TestParameters);
    CLI_S3_GetBucketEncryption(TestParameters);
    CLI_S3_DeleteBucketEncryption(TestParameters);
    CLI_S3_PutBucketVersioning(TestParameters);
    CLI_S3_GetBucketVersioning(TestParameters);
    CLI_S3_DeleteBucket(TestParameters);

EndProcedure

Procedure CLI_AWS_ObjectsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("S3_AccessKey", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("S3_SecretKey", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("S3_URL"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Audio"       , TestParameters);

    CLI_S3_CreateBucket(TestParameters);
    CLI_S3_PutObject(TestParameters);
    CLI_S3_UploadFullObject(TestParameters);
    CLI_S3_InitPartsUpload(TestParameters);
    CLI_S3_AbortMultipartUpload(TestParameters);
    CLI_S3_HeadObject(TestParameters);
    CLI_S3_CopyObject(TestParameters);
    CLI_S3_PutObjectTagging(TestParameters);
    CLI_S3_GetObjectTagging(TestParameters);
    CLI_S3_DeleteObjectTagging(TestParameters);
    CLI_S3_ListObjects(TestParameters);
    CLI_S3_ListObjectVersions(TestParameters);
    CLI_S3_GetObject(TestParameters);
    CLI_S3_GetObjectDownloadLink(TestParameters);
    CLI_S3_DeleteObject(TestParameters);
    CLI_S3_DeleteBucket(TestParameters);
    CLI_S3_GetObjectUploadLink(TestParameters);

EndProcedure

#EndRegion

#Region TCP

Procedure CLI_TC_Client() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("TCP_Address", TestParameters);

    CLI_TCP_ProcessRequest(TestParameters);

EndProcedure

#EndRegion

#Region SQLite

Procedure CLI_SQLL_CommonMethods() Export

    TestParameters = New Structure;

    Base = GetTempFileName("sqlite");
    OPI_TestDataRetrieval.WriteParameter("SQLite_DB", Base);
    OPI_Tools.AddField("SQLite_DB", Base, "String", TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Picture"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQLite_Ext", TestParameters);

    CLI_SQLite_ExecuteSQLQuery(TestParameters);

    Try
       DeleteFiles(Base);
    Except
        OPI_TestDataRetrieval.WriteLogCLI(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

Procedure CLI_SQLL_ORM() Export

    TestParameters = New Structure;

    Base = GetTempFileName("sqlite");
    OPI_TestDataRetrieval.WriteParameter("CDEK_OrderUUID", Base);
    OPI_Tools.AddField("SQLite_DB", Base, "String", TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);

    CLI_SQLite_CreateTable(TestParameters);
    CLI_SQLite_AddRecords(TestParameters);
    CLI_SQLite_GetRecords(TestParameters);
    CLI_SQLite_UpdateRecords(TestParameters);
    CLI_SQLite_DeleteRecords(TestParameters);
    CLI_SQLite_GetTableInformation(TestParameters);
    CLI_SQLite_ClearTable(TestParameters);
    CLI_SQLite_DeleteTable(TestParameters);
    CLI_SQLite_GetRecordsFilterStrucutre(TestParameters);

    Try
       DeleteFiles(Base);
    Except
        OPI_TestDataRetrieval.WriteLogCLI(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

#EndRegion

#Region PostgreSQL

Procedure CLI_Postgres_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("PG_IP"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("PG_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQL"        , TestParameters);

    CLI_PostgreSQL_GenerateConnectionString(TestParameters);
    CLI_PostgreSQL_ExecuteSQLQuery(TestParameters);

EndProcedure

Procedure CLI_Postgres_ORM() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("PG_IP"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("PG_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"    , TestParameters);

    CLI_PostgreSQL_CreateDatabase(TestParameters);
    CLI_PostgreSQL_CreateTable(TestParameters);
    CLI_PostgreSQL_GetTableInformation(TestParameters);
    CLI_PostgreSQL_AddRecords(TestParameters);
    CLI_PostgreSQL_GetRecords(TestParameters);
    CLI_PostgreSQL_UpdateRecords(TestParameters);
    CLI_PostgreSQL_DeleteRecords(TestParameters);
    CLI_PostgreSQL_ClearTable(TestParameters);
    CLI_PostgreSQL_DeleteTable(TestParameters);
    CLI_PostgreSQL_DisableAllDatabaseConnections(TestParameters);
    CLI_PostgreSQL_DeleteDatabase(TestParameters);
    CLI_PostgreSQL_GetRecordsFilterStrucutre(TestParameters);

EndProcedure

#EndRegion

#Region GreenAPI

Procedure CLI_GAPI_Account() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"            , TestParameters);

    CLI_GreenAPI_FormAccessParameters(TestParameters);
    CLI_GreenAPI_GetInstanceSettings(TestParameters);
    CLI_GreenAPI_GetAccountInformation(TestParameters);
    CLI_GreenAPI_GetInstanceSettingsStructure(TestParameters);
    CLI_GreenAPI_SetInstanceSettings(TestParameters);
    CLI_GreenAPI_GetInstanceStatus(TestParameters);
    //CLI_GreenAPI_LogoutInstance(TestParameters);
    //CLI_GreenAPI_GetQR(TestParameters);
    CLI_GreenAPI_SetProfilePicture(TestParameters);
    CLI_GreenAPI_RebootInstance(TestParameters);
    CLI_GreenAPI_GetAuthorizationCode(TestParameters);

EndProcedure

Procedure CLI_GAPI_GroupManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"     , TestParameters);

    CLI_GreenAPI_CreateGroup(TestParameters);
    CLI_GreenAPI_GetGroupInformation(TestParameters);
    CLI_GreenAPI_UpdateGroupName(TestParameters);
    CLI_GreenAPI_AddGroupMember(TestParameters);
    CLI_GreenAPI_ExcludeGroupMember(TestParameters);
    CLI_GreenAPI_LeaveGroup(TestParameters);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBotInformation", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramBotInformation(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_GetUpdates(FunctionParameters)

    Options = New Structure("token", FunctionParameters["Telegram_Token"]);
    Result  = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetUpdates", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUpdates", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramArray(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_SetWebhook(FunctionParameters)

    Options = New Structure;
    Options.Insert("token", FunctionParameters["Telegram_Token"]);
    Options.Insert("url"  , FunctionParameters["Telegram_URL"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SetWebhook", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetWebhook", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramWebhookSetup(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_DeleteWebhook(FunctionParameters)

    Options = New Structure("token", FunctionParameters["Telegram_Token"]);
    Result  = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteWebhook", Options);

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
    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text);

    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_TestDataRetrieval.WriteParameter("Telegram_MessageID", MessageID);
    OPI_Tools.AddField("Telegram_MessageID", MessageID, "String", FunctionParameters);

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage (channel)");
    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text);

    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_TestDataRetrieval.WriteParameter("Telegram_ChannelMessageID", MessageID);
    OPI_Tools.AddField("Telegram_ChannelMessageID", MessageID, "String", FunctionParameters);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "FormKeyboardFromButtonArray", "Telegram");
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
    CopyFile(Image, ImagePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendImage", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramImage(Result, Text);

    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_TestDataRetrieval.WriteParameter("Telegram_PicMessageID", MessageID);
    OPI_Tools.AddField("Telegram_PicMessageID", MessageID, "String", FunctionParameters);

    Options.Insert("picture" , ImagePath);
    Options.Insert("chat"    , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendPicture (Path)");
    OPI_TestDataRetrieval.Check_TelegramImage(Result, Text);

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
    OPI_TestDataRetrieval.Check_TelegramVideo(Result, Text);

    Options.Insert("video" , VideoPath);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendVideo (Path)");
    OPI_TestDataRetrieval.Check_TelegramVideo(Result, Text);

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
    OPI_TestDataRetrieval.Check_TelegramAudio(Result, Text);

    Options.Insert("audio" , AudioPath);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendAudio (Path)");
    OPI_TestDataRetrieval.Check_TelegramAudio(Result, Text);

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
    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text);

    Options.Insert("doc" , DocumentPath);
    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendDocument (Path)");
    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text);

    Options.Insert("filename", "custom.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendDocument (name)");
    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text);

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
    OPI_TestDataRetrieval.Check_TelegramGif(Result, Text);

    Options.Insert("gif" , GifPath);
    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendGif (Path)");
    OPI_TestDataRetrieval.Check_TelegramGif(Result, Text);

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
    OPI_TestDataRetrieval.Check_TelegramLocation(Result);

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendLocation", Options);

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
    OPI_TestDataRetrieval.Check_TelegramContact(Result, Name);

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendContact", Options);

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
    OPI_TestDataRetrieval.Check_TelegramPoll(Result, Question);

    Options.Insert("chat", FunctionParameters["Telegram_ChannelID"]);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendPoll (channel)");
    OPI_TestDataRetrieval.Check_TelegramPoll(Result, Question);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_DownloadFile(FunctionParameters)

    Options = New Structure;
    Options.Insert("token"  , FunctionParameters["Telegram_Token"]);
    Options.Insert("fileid" , FunctionParameters["Telegram_FileID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DownloadFile", Options);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UnpinMessage", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_GetParticipantCount(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);
    Options.Insert("chat"  , FunctionParameters["Telegram_ChannelID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetParticipantCount", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetParticipantCount", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramNumber(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Telegram_GetAvatarIconList(FunctionParameters)

    Options = New Structure;
    Options.Insert("token" , FunctionParameters["Telegram_Token"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetAvatarIconList", Options);

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

    OPI_Telegram.OpenForumThread(Token, Chat);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CloseForumThread", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CloseForumTopic (main)");
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    Options.Insert("topic" , FunctionParameters["Telegram_TopicID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CloseForumThread", Options);

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
    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

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

Procedure CLI_Telegram_ReplaceMessageText(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];
    Text      = "New message text";

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chat"   , ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageText", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ReplaceMessageText", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text);

EndProcedure

Procedure CLI_Telegram_ReplaceMessageKeyboard(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    MessageID = FunctionParameters["Telegram_MessageID"];

    ButtonArray = New Array;
    ButtonArray.Add("1");
    ButtonArray.Add("2");
    ButtonArray.Add("3");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);
    Options.Insert("under"  , True);
    Options.Insert("column" , False);

    Keyboard = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "FormKeyboardFromButtonArray", Options);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("chat"    , ChatID);
    Options.Insert("message" , MessageID);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageKeyboard", Options);

    Keyboard = OPI_Tools.JSONString(Keyboard);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ReplaceMessageKeyboard", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramMessageKeyboard(Result, Keyboard);

EndProcedure

Procedure CLI_Telegram_ReplaceMessageCaption(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    MessageID = FunctionParameters["Telegram_PicMessageID"];

    Description = "New picture description";

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("chat"    , ChatID);
    Options.Insert("message" , MessageID);
    Options.Insert("caption" , Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageCaption", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ReplaceMessageCaption", "Telegram");
    OPI_TestDataRetrieval.Check_TelegramImage(Result, Description);

EndProcedure

#EndRegion

#Region VK

Procedure CLI_VK_CreateTokenRetrievalLink(FunctionParameters)

    Options = New Structure;
    Options.Insert("app" , FunctionParameters["VK_AppID"]);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateTokenRetrievalLink", Options);

    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

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
    CopyFile(Image2, TFN);

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
    CopyFile(Image, TFN);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadVideoToServer", "VK");
    OPI_TestDataRetrieval.Check_VKAlbumPicture(Result, "");

EndProcedure

Procedure CLI_VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path to file or Binary Data
    TFN   = GetTempFileName("png");
    CopyFile(Image, TFN);
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

    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

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

    Counter    = 1;
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
    CopyFile(Image, TFN);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("path"   , Path1);
    Options.Insert("file"   , Image);
    Options.Insert("rewrite", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile (URL)", "YandexDisk");
    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("path"   , Path2);
    Options.Insert("file"   , TFN);
    Options.Insert("rewrite", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFile", Options);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendTextMessage", "Viber");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendImage", "Viber");
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
    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

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

    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateImageTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateVideoTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateGifTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    Text = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("gifs", GIF);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateGifTweet", Options);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage", "Slack");
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel);

    Timestamp = Result["ts"];
    OPI_TestDataRetrieval.WriteParameter("Slack_MessageTS", Timestamp);
    OPI_Tools.AddField("Slack_MessageTS", Timestamp, "String", FunctionParameters);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage (picture)");
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile"     , "Slack");
    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeFilePublic" , "Slack");
    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeFilePrivate", "Slack");
    OPI_TestDataRetrieval.Check_SlackFile(Result, FileName);

    UploadedFile = Result["files"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("Slack_FileID", UploadedFile);
    OPI_Tools.AddField("Slack_FileID", UploadedFile, "String", FunctionParameters);

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

    OPI_Airtable.DeleteRecords(Token, Base, Table, ArrayOfDeletions);

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

Procedure CLI_Airtable_DeleteRecords(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("base"   , Base);
    Options.Insert("table"  , Table);
    Options.Insert("records", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "DeleteRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteRecords", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecords(Result);

EndProcedure

#EndRegion

#Region Dropbox

Procedure CLI_Dropbox_GetAuthorizationLink(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];

    Options = New Structure;
    Options.Insert("appkey", AppKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAuthorizationLink", Options);
    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

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
    CopyFile(Image, ImagePath);

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

    While Status = "in_progress" Do

        Options = New Structure;
        Options.Insert("token" , Token);
        Options.Insert("job"   , WorkID);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetUploadStatusByURL", Options);
        Status = Result[".tag"];

        OPI_Tools.Pause(5);

        OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUploadStatusByURL", "Dropbox");

    EndDo;

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

    While CurrentStatus = "in_progress" Do

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
        OPI_TestDataRetrieval.Check_VKTEvents(Result);

        Events = Result["events"];

        // Event handling...

        If Not Events.Count() = 0 Then

            LastID = Events[Events.UBound()]["eventId"];

        EndIf;

    EndDo;

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
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

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
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

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

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile (URL)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , FilePath);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile (Path)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

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
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

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

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file"  , File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendVoice (URL)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file"  , FilePath);
    Options.Insert("reply" , ReplyID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendVoice (Path)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTMessage(Result);

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

    CopyFile(File, FilePath);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatPicture (URL)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("chatid" , ChatID);
    Options.Insert("file"   , FilePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatPicture (Path)", "VkTeams");
    OPI_TestDataRetrieval.Check_VKTTrue(Result);

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
    OPI_TestDataRetrieval.Check_VKTPending(Result);

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
    OPI_TestDataRetrieval.Check_VKTPending(Result);

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

Procedure CLI_VKTeams_MakeActionButton(FunctionParameters)

    Options = New Structure;
    Options.Insert("text"  , "Button1");
    Options.Insert("data"  , "ButtonEvent1");
    Options.Insert("style" , "attention");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatRules", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeActionButton", "VkTeams");

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCategoriesAndProductTypesTree (EN)", "Ozon");
    OPI_TestDataRetrieval.Check_OzonCategoryList(Result);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey"  , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCategoriesAndProductTypesTree", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCategoriesAndProductTypesTree", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCategoryAttributes", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAttributeValues", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SearchAttributeValue", "Ozon");
    OPI_TestDataRetrieval.Check_OzonListOfAttributesValues(Result);

EndProcedure

Procedure CLI_Ozon_GetProductStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductStructure", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateUpdateProducts", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(ItemStructure, "AddProductVideo", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(ItemStructure, "AddProductVideoCover", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(ItemStructure, "CompleteComplexAttribute", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductCreationStatus", "Ozon");

    While Result["result"]["items"][0]["status"] = "pending" Do

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateProductByOzonID", "Ozon");
    OPI_TestDataRetrieval.Check_OzonUploadTask(Result);

    TaskID = Result["result"]["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_SkuTaskID", TaskID);
    FunctionParameters.Insert("Ozon_SkuTaskID", TaskID);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("taskid"   , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    While Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    EndDo;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductCreationStatus (SKU)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNewProducts(Result);

EndProcedure

Procedure CLI_Ozon_GetSimplifiedProductStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetSimplifiedProductStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetSimplifiedProductStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetAttributesUpdateStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetAttributesUpdateStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAttributesUpdateStructure", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateProductsAttributes", "Ozon");
    OPI_TestDataRetrieval.Check_OzonUploadTask(Result, False);

    TaskID = Result["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_AttUpdateTaskID", TaskID);
    FunctionParameters.Insert("Ozon_AttUpdateTaskID", TaskID);

    Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    While Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    EndDo;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductCreationStatus (att.)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNewProducts(Result);

EndProcedure

Procedure CLI_Ozon_GetProductsFilterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsFilterStructure", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductList", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsAttributesData", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsContentRating", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsInformation", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductDescription", "Ozon");
    OPI_TestDataRetrieval.Check_OzonProduct(Result);

EndProcedure

Procedure CLI_Ozon_GetProductsRequestsLimits(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsRequestsLimits", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsRequestsLimits", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateProductImages", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CheckProductsImagesUpload", "Ozon");
    OPI_TestDataRetrieval.Check_OzonObjects(Result);

EndProcedure

Procedure CLI_Ozon_UpdateProductsArticles(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210609", "143210613");

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("offers"   , ArticlesMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsArticles", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateProductsArticles", "Ozon");
    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210613", "143210609");

    Result = OPI_Ozon.UpdateProductsArticles(ClientID, APIKey, ArticlesMap);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateProductsArticles (reverse)", "Ozon");

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ArchiveProducts", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UnarchiveProducts", "Ozon");
    OPI_TestDataRetrieval.Check_OzonTrue(Result);

EndProcedure

Procedure CLI_Ozon_DeleteProductsWithoutSKU(FunctionParameters)

    OPI_Tools.Pause(30);

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.ArchiveProducts(ClientID, APIKey, ProductID);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ArchiveProducts (for deleting)", "Ozon");
    OPI_Tools.Pause(15);

    Article = "143210609";

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("articles" , Article);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "DeleteProductsWithoutSKU", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteProductsWithoutSKU", "Ozon");

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadProductActivationCodes", "Ozon");

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCodesUploadStatus", "Ozon");

    If ValueIsFilled(Result["result"]) Then
        While Result["result"]["status"] = "pending" Do

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductSubscribersCount", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRelatedSKUs", "Ozon");
    OPI_TestDataRetrieval.Check_OzonSKU(Result);

EndProcedure

Procedure CLI_Ozon_BindBarcodes(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    BarcodesMap = New Map;
    BarcodesMap.Insert("1626044001", "112233");

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("barcodes" , BarcodesMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "BindBarcodes", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "BindBarcodes", "Ozon");

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateBarcodes", "Ozon");
    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

EndProcedure

Procedure CLI_Ozon_GetWarehousesList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetWarehousesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetWarehousesList", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsStocks", "Ozon");
    OPI_TestDataRetrieval.Check_OzonObjects(Result);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateProductsPrices", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateProductsStocks", "Ozon");

EndProcedure

Procedure CLI_Ozon_GetProductsPrices(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsPrices", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductsPrices", "Ozon");
    OPI_TestDataRetrieval.Check_OzonObjects(Result);

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDiscountInformation", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetProductDiscount", "Ozon");

EndProcedure

Procedure CLI_Ozon_GetPromotionsList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetPromotionsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPromotionsList", "Ozon");
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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAvailablePromoProducts", "Ozon");

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

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCurrentPromoProducts", "Ozon");

EndProcedure

Procedure CLI_Ozon_GetProductStocksStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductStocksStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductStocksStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetProductPriceStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductPriceStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetProductPriceStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetClustersList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetClustersList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetClustersList", "Ozon");
    OPI_TestDataRetrieval.Check_OzonClusters(Result);

EndProcedure

Procedure CLI_Ozon_GetShippingWarehousesList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Search   = "Tver";

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("search"   , Search);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetShippingWarehousesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetShippingWarehousesList", "Ozon");
    OPI_TestDataRetrieval.Check_OzonSearch(Result);

EndProcedure

Procedure CLI_Ozon_CreateFBODraft(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Cluster  = 1;

    Items = New Map;
    Items.Insert("1783161863", 5);
    Items.Insert("1784654052", 2);

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("clusters" , Cluster);
    Options.Insert("items"    , Items);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateFBODraft", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateFBODraft", "Ozon");
    OPI_TestDataRetrieval.Check_OzonDraft(Result);

    DraftID = Result["operation_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_FBOOperID", DraftID);
    FunctionParameters.Insert("Ozon_FBOOperID", DraftID);

EndProcedure

Procedure CLI_Ozon_GetFBODraft(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    OperationID = FunctionParameters["Ozon_FBOOperID"];

    Status = "CALCULATION_STATUS_IN_PROGRESS";

    Options = New Structure;
    Options.Insert("clientid" , ClientID);
    Options.Insert("apikey"   , APIKey);
    Options.Insert("oper"     , OperationID);

    While Status = "CALCULATION_STATUS_IN_PROGRESS" Do

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetFBODraft", Options);
        Status = Result["status"];

        OPI_Tools.Pause(20);

    EndDo;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFBODraft", "Ozon");
    OPI_TestDataRetrieval.Check_OzonReadyDraft(Result);

    DraftID = Result["draft_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_Draft", DraftID);
    FunctionParameters.Insert("Ozon_Draft", DraftID);

    WarehouseID = Result["clusters"][0]["warehouses"][0]["supply_warehouse"]["warehouse_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_FBOWarehouse", WarehouseID);
    FunctionParameters.Insert("Ozon_FBOWarehouse", WarehouseID);

EndProcedure

Procedure CLI_Ozon_GetShipmentAdditionalFields(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetShipmentAdditionalFields", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetShipmentAdditionalFields", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetShipmentsFilterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetShipmentsFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetShipmentsFilterStructure", "Ozon");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Ozon_GetFBOShipmentsList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    AddFields = New Structure;
    AddFields.Insert("analytics_data", True);
    AddFields.Insert("financial_data", True);

    Filter = New Structure;
    Filter.Insert("since", XMLString('20230101') + "Z");
    Filter.Insert("to"   , XMLString('20240101') + "Z");

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey"  , APIKey);
    Options.Insert("filter"  , Filter);
    Options.Insert("with"    , AddFields);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetFBOShipmentsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFBOShipmentsList", "Ozon");
    OPI_TestDataRetrieval.Check_OzonArray(Result);

EndProcedure

Procedure CLI_Ozon_GetFBOTimeslots(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Day      = 86400;

    DateFrom  = OPI_Tools.GetCurrentDate();
    DateTo    = DateFrom + Day;
    Draft     = FunctionParameters["Ozon_Draft"];
    Warehouse = FunctionParameters["Ozon_FBOWarehouse"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey"  , APIKey);
    Options.Insert("from"    , DateFrom);
    Options.Insert("to"      , DateTo);
    Options.Insert("draft"   , Draft);
    Options.Insert("whs"     , Warehouse);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetFBOTimeslots", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFBOTimeslots", "Ozon");
    OPI_TestDataRetrieval.Check_OzonTimeslots(Result);

EndProcedure

#EndRegion

#Region Neocities

Procedure CLI_Neocities_UploadFile(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Data  = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Path  = "testfolder/test_pic.png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);
    Options.Insert("file" , Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "UploadFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFile", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure CLI_Neocities_UploadFiles(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary Data
    GIF    = FunctionParameters["Gif"]; // URL, Path or Binary Data

    FileMapping = New Map;
    FileMapping.Insert("test/pic1.png", Image1);
    FileMapping.Insert("test/gif.gif" , Image2);
    FileMapping.Insert("pic2.png"     , GIF);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("files", FileMapping);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "UploadFiles", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFiles", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure CLI_Neocities_DeleteSelectedFiles(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    Paths = New Array;
    Paths.Add("/test/pic1.png");
    Paths.Add("/test/gif.gif");
    Paths.Add("/pic2.png");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("paths", Paths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "DeleteSelectedFiles", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteSelectedFiles", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/testfolder");

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteSelectedFiles (folder 1)");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/test");

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteSelectedFiles (folder 2)");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure CLI_Neocities_GetFilesList(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Path  = "test";

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetFilesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFilesList (All)");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path" , Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetFilesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFilesList", "Neocities");
    OPI_TestDataRetrieval.Check_NCFolderFiles(Result, 2);

EndProcedure

Procedure CLI_Neocities_GetSiteData(FunctionParameters)

    Token   = FunctionParameters["NC_Token"];
    Website = "2athenaeum";

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetSiteData", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetSiteData", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("sitename", Website);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetSiteData", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetSiteData (Site)");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure CLI_Neocities_GetToken(FunctionParameters)

    Login    = FunctionParameters["NC_Login"];
    Password = FunctionParameters["NC_Password"];

    Options = New Structure;
    Options.Insert("login"   , Login);
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetToken", Options);

    Result["api_key"] = "***";

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetToken", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure CLI_Neocities_SynchronizeFolders(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    LocalFolder  = "C:\test_site";
    RemoteFolder = "test_sync";

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("local" , LocalFolder);
    Options.Insert("remote", RemoteFolder);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "SynchronizeFolders", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SynchronizeFolders", "Neocities");
    OPI_TestDataRetrieval.Check_NCSync(Result);

EndProcedure

#EndRegion

#Region Bitrix24

Procedure CLI_Bitrix24_GetAppAuthLink(FunctionParameters)

    Domain   = FunctionParameters["Bitrix24_Domain"];
    ClientID = FunctionParameters["Bitrix24_ClientID"];

    Options = New Structure;
    Options.Insert("domain"  , Domain);
    Options.Insert("clientid", ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetAppAuthLink", Options);

    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAppAuthLink", "Bitrix24");
    OPI_TestDataRetrieval.Check_String(Result);
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_AuthURL", Result);

EndProcedure

Procedure CLI_Bitrix24_GetToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Code         = FunctionParameters["Bitrix24_Code"];

    Options = New Structure;
    Options.Insert("clientid"    , ClientID);
    Options.Insert("clientsecret", ClientSecret);
    Options.Insert("code"        , Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetToken", "Bitrix24");

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);
    EndIf;

EndProcedure

Procedure CLI_Bitrix24_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Refresh      = FunctionParameters["Bitrix24_Refresh"];

    Options = New Structure;
    Options.Insert("clientid"    , ClientID);
    Options.Insert("clientsecret", ClientSecret);
    Options.Insert("refresh"     , Refresh);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RefreshToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RefreshToken", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixAuth(Result);

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);
    EndIf;

EndProcedure

Procedure CLI_Bitrix24_ServerTime(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ServerTime", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ServerTime (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTime(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ServerTime", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ServerTime", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTime(Result);

EndProcedure

Procedure CLI_Bitrix24_CreatePost(FunctionParameters)

    Text   = "Text of post";
    Title  = "Post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary Data

    Files = New Map;
    Files.Insert("1.png", Image1);
    Files.Insert("2.png", Image2);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("text"     , Text);
    Options.Insert("files"    , Files);
    Options.Insert("title"    , Title);
    Options.Insert("important", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePost", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePost (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    PostID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookPostID", PostID);
    FunctionParameters.Insert("Bitrix24_HookPostID", PostID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("text"  , Text);
    Options.Insert("files" , Files);
    Options.Insert("title" , Title);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePost", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePost", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    PostID = Result["result"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_PostID", PostID);
    FunctionParameters.Insert("Bitrix24_PostID", PostID);

EndProcedure

Procedure CLI_Bitrix24_UpdatePost(FunctionParameters)

    Text   = "New post text";
    Title  = "New post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary Data
    PostID = FunctionParameters["Bitrix24_PostID"];

    Files = New Map;
    Files.Insert("1.png", Image1);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("text"   , Text);
    Options.Insert("files"  , Files);
    Options.Insert("title"  , Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdatePost", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdatePost (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("text"   , Text);
    Options.Insert("files"  , Files);
    Options.Insert("title"  , Title);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdatePost", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdatePost", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

EndProcedure

Procedure CLI_Bitrix24_DeletePost(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeletePost", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeletePost (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeletePost", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeletePost", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetImportantPostViewers(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetImportantPostViewers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetImportantPostViewers (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetImportantPostViewers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetImportantPostViewers", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_GetPosts(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPosts", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPosts (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPosts", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPosts", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result);

EndProcedure

Procedure CLI_Bitrix24_AddPostComment(FunctionParameters)

    Text   = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddPostComment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    Text  = "Another comment";
    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("text"   , Text);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddPostComment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

EndProcedure

Procedure CLI_Bitrix24_AddPostRecipients(FunctionParameters)

    Visibility = "UA";
    PostID     = FunctionParameters["Bitrix24_PostID"];
    URL        = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("vision" , Visibility);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostRecipients", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddPostRecipients (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("postid" , PostID);
    Options.Insert("vision" , Visibility);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostRecipients", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddPostRecipients", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTaskFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskFieldsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskFieldsStructure (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixFields(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskFieldsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskFieldsStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixFields(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateTask(FunctionParameters)

    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    CurrentDate = OPI_Tools.GetCurrentDate();
    Hour        = 3600;
    Day         = 24;
    Responsible = 1;

    TaskData = New Structure;
    TaskData.Insert("TITLE"         , "New task");
    TaskData.Insert("DESCRIPTION"   , "New task description");
    TaskData.Insert("PRIORITY"      , "2");
    TaskData.Insert("DEADLINE"      , CurrentDate + Hour * Day);
    TaskData.Insert("RESPONSIBLE_ID", Responsible);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fields" , TaskData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookTaskID", TaskID);
    FunctionParameters.Insert("Bitrix24_HookTaskID", TaskID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fields" , TaskData);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_TaskID", TaskID);
    FunctionParameters.Insert("Bitrix24_TaskID", TaskID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure CLI_Bitrix24_UpdateTask(FunctionParameters)

    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    TaskData = New Structure;
    TaskData.Insert("TITLE"      , "Another task title");
    TaskData.Insert("DESCRIPTION", "Another task description");
    TaskData.Insert("PRIORITY"   , "1");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("fields" , TaskData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("fields" , TaskData);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_ApproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ApproveTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ApproveTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ApproveTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ApproveTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_DisapproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisapproveTask", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "DisapproveTask (wh)", "Bitrix24");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisapproveTask", Options);

    OPI_TestDataRetrieval.Check_Map(Result);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "DisapproveTask", "Bitrix24");

EndProcedure

Procedure CLI_Bitrix24_CompleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CompleteTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CompleteTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_RenewTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenewTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenewTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_DeferTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeferTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeferTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeferTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeferTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_StartTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "StartTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "StartTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_StartWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartWatchingTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "StartWatchingTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartWatchingTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "StartWatchingTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_StopWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopWatchingTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "StopWatchingTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopWatchingTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "StopWatchingTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_PauseTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PauseTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PauseTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_DelegateTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);
    Options.Insert("user" , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DelegateTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DelegateTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("user"  , UserID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DelegateTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DelegateTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_AddTaskToFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskToFavorites", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "StopWatchingTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskToFavorites", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTaskToFavorites", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_RemoveTaskFromFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RemoveTaskFromFavorites", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RemoveTaskFromFavorites (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RemoveTaskFromFavorites", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RemoveTaskFromFavorites", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTaskHistory(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskHistory", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskHistory (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixList(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskHistory", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskHistory", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixList(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTasksList(FunctionParameters)

    // Full filter structure you can find at GetTasksFilterStructure method
    Filter = New Structure;
    Filter.Insert("CREATED_BY" , 1);
    Filter.Insert("RESPONSIBLE_ID", 10);

    Indent = 1;
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("filter" , Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTasksList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTasksList(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("offset" , Indent);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTasksList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTasksList(Result);

EndProcedure

Procedure CLI_Bitrix24_AddTasksChecklistElement(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Text = "Checklist element";

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("text"    , Text);
    Options.Insert("complete", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTasksChecklistElement (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    ElementID = Result["result"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCheckElementID", ElementID);
    FunctionParameters.Insert("Bitrix24_HookCheckElementID", ElementID);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("text"  , Text);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTasksChecklistElement", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    ElementID = Result["result"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CheckElementID", ElementID);
    FunctionParameters.Insert("Bitrix24_CheckElementID", ElementID);

EndProcedure

Procedure CLI_Bitrix24_UpdateTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Text = "New elements text";

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);
    Options.Insert("text"    , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTasksChecklistElement (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);
    Options.Insert("text"    , Text);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTasksChecklistElement", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTasksChecklistElement (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTasksChecklistElement", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTasksChecklist(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklist", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTasksChecklist (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklist", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTasksChecklist", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTasksChecklistElement (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTasksChecklistElement", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_CompleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CompleteTasksChecklistElement (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CompleteTasksChecklistElement", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_RenewTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenewTasksChecklistElement (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("task"    , TaskID);
    Options.Insert("element" , ElementID);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTasksChecklistElement", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenewTasksChecklistElement", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_AttachFileToTopic(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    FileID = FunctionParameters["Bitrix24_TaskFileID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AttachFileToTopic", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AttachFileToTopic (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixAttachment(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("fileid" , FileID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AttachFileToTopic", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AttachFileToTopic", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixAttachment(Result);

EndProcedure

Procedure CLI_Bitrix24_CheckTaskAccesses(FunctionParameters)

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("users" , ArrayOfUsers);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CheckTaskAccesses", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CheckTaskAccesses (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixAvailableActions(Result, ArrayOfUsers.Count());

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("users" , ArrayOfUsers);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CheckTaskAccesses", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CheckTaskAccesses", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixAvailableActions(Result, ArrayOfUsers.Count());

EndProcedure

Procedure CLI_Bitrix24_MuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MuteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MuteTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MuteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MuteTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_UnmuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UnmuteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UnmuteTask (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UnmuteTask", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UnmuteTask", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("taskfrom" , FromID);
    Options.Insert("taskto"   , DestinationID);
    Options.Insert("linktype" , LinkType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTasksDependencies", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTasksDependencies (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType);

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("taskfrom" , FromID);
    Options.Insert("taskto"   , DestinationID);
    Options.Insert("linktype" , LinkType);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTasksDependencies", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTasksDependencies", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

EndProcedure

Procedure CLI_Bitrix24_DeleteTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType);

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("taskfrom" , FromID);
    Options.Insert("taskto"   , DestinationID);
    Options.Insert("linktype" , LinkType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksDependencies", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTasksDependencies (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("taskfrom" , FromID);
    Options.Insert("taskto"   , DestinationID);
    Options.Insert("linktype" , LinkType);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksDependencies", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTasksDependencies", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_GetDailyPlan(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDailyPlan", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDailyPlan (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDailyPlan", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDailyPlan", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTasksFilterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTasksFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_AddTaskComment(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Text = "Task impossible, let's split up";

    Options = New Structure;
    Options.Insert("url" , URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTaskComment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    CommentID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCommentID", CommentID);
    FunctionParameters.Insert("Bitrix24_HookCommentID", CommentID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text = "Task uninpossible, don't split up";

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);
    Options.Insert("text" , Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTaskComment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    CommentID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CommentID", CommentID);
    FunctionParameters.Insert("Bitrix24_CommentID", CommentID);

EndProcedure

Procedure CLI_Bitrix24_DeleteTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTaskComment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTaskComment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateResultFromComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateResultFromComment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixResult(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("comment", CommentID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateResultFromComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateResultFromComment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixResult(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteResultFromComment(FunctionParameters) Export

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteResultFromComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "Delete result from comment)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("comment", CommentID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteResultFromComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteResultFromComment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure CLI_Bitrix24_GetResultsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetResultsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetResultsList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixResultsList(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetResultsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetResultsList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixResultsList(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTaskCommentsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskCommentsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskCommentsList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixCommentsList(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskCommentsList", Options);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskCommentsList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixCommentsList(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskComment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixComment(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskComment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixComment(Result);

EndProcedure

Procedure CLI_Bitrix24_UpdateTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Text = "The task has been changed, do not split up";

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTaskComment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Text = "The task has been changed, let's split up";

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("text"   , Text);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskComment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTaskComment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCommentStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCommentStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCommentStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetStoragesList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStoragesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStoragesList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixStorage(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStoragesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStoragesList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixStorage(Result);

EndProcedure

Procedure CLI_Bitrix24_GetAppStorage(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetAppSotrage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAppSotrage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    StorageID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_StorageID", StorageID);
    FunctionParameters.Insert("Bitrix24_StorageID", StorageID);

EndProcedure

Procedure CLI_Bitrix24_UploadFileToStorage(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary Data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary Data

    DestinationID = 3;

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("title"    , Filename2);
    Options.Insert("file"     , Image2);
    Options.Insert("storageid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToStorage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFileToStorage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFileID", FileID);
    FunctionParameters.Insert("Bitrix24_HookFileID", FileID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("title"    , Name);
    Options.Insert("file"     , Image);
    Options.Insert("storageid", DestinationID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToStorage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFileToStorage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FileID", FileID);
    FunctionParameters.Insert("Bitrix24_FileID", FileID);

EndProcedure

Procedure CLI_Bitrix24_DeleteFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteFile (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteFile", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateStorageFolder(FunctionParameters)

    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title"    , Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateStorageFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateStorageFolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FolderID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFolderID", FolderID);
    FunctionParameters.Insert("Bitrix24_HookFolderID", FolderID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title"    , Name);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateStorageFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateStorageFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FolderID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FolderID", FolderID);
    FunctionParameters.Insert("Bitrix24_FolderID", FolderID);

EndProcedure

Procedure CLI_Bitrix24_DeleteFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteFolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetStorage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Options = New Structure;
    Options.Insert("url"       , URL);
    Options.Insert("storageid" , StorageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStorage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"       , URL);
    Options.Insert("storageid" , StorageID);
    Options.Insert("token"     , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStorage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_GetStorageObjects(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Options = New Structure;
    Options.Insert("url"       , URL);
    Options.Insert("storageid" , StorageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorageObjects", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStorageObjects (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"       , URL);
    Options.Insert("storageid" , StorageID);
    Options.Insert("token"     , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorageObjects", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetStorageObjects", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_RenameStorage(FunctionParameters)

    Name      = "New storage name";
    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];

    Options = New Structure;
    Options.Insert("url"       , URL);
    Options.Insert("storageid" , StorageID);
    Options.Insert("title"     , Name);
    Options.Insert("token"     , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameStorage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenameStorage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_GetFolderInformation(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderInformation (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderInformation", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateSubfolder(FunctionParameters)

    FolderID  = FunctionParameters["Bitrix24_FolderID"];
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("title"    , Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSubfolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateSubfolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    SubfolderID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookSubfolderID", SubfolderID);
    FunctionParameters.Insert("Bitrix24_HookSubfolderID", SubfolderID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("title"    , Name);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSubfolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateSubfolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    SubfolderID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_SubfolderID", SubfolderID);
    FunctionParameters.Insert("Bitrix24_SubfolderID", SubfolderID);

EndProcedure

Procedure CLI_Bitrix24_MakeFolderCopy(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookSubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("tagetid"  , DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFolderCopy", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeFolderCopy (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    DestinationID = FunctionParameters["Bitrix24_SubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("tagetid"  , DestinationID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFolderCopy", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeFolderCopy", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_GetFolderExternalLink(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderExternalLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderExternalLink (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixString(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderExternalLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderExternalLink", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixString(Result);

EndProcedure

Procedure CLI_Bitrix24_GetFolderFilterStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderFilterStructure (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetFolderItems(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderItems", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderItems (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderItems", Options);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFolderItems", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_MarkFolderAsDeleted(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFolderAsDeleted", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkFolderAsDeleted (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFolderAsDeleted", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkFolderAsDeleted", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_RestoreFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RestoreFolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RestoreFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_MoveFolder(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("tagetid"  , DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveFolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FolderID = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("tagetid"  , DestinationID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_RenameFolder(FunctionParameters)

    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = FunctionParameters["Bitrix24_HookFolderID"];
    URL       = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID2);
    Options.Insert("title"    , Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenameFolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FolderID = FunctionParameters["Bitrix24_FolderID"];
    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("folderid" , FolderID);
    Options.Insert("title"    , Name);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenameFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_UploadFileToFolder(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary Data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary Data

    DestinationID = FunctionParameters["Bitrix24_FolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("title"    , Filename2);
    Options.Insert("file"     , Image2);
    Options.Insert("folderid" , DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFileToFolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    OPI_Bitrix24.DeleteFile(URL, FileID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("title"    , Name);
    Options.Insert("file"     , Image);
    Options.Insert("folderid" , DestinationID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFileToFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);

EndProcedure

Procedure CLI_Bitrix24_MakeCopyFile(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("fileid"   , FileID);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeCopyFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeCopyFile (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FolderID = FunctionParameters["Bitrix24_FolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("fileid"   , FileID);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeCopyFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MakeCopyFile", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_GetFileInformation(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileInformation (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileInformation", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_GetFileExternalLink(FunctionParameters)

    OPI_Tools.Pause(20);

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileExternalLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileExternalLink (wh)", "Bitrix24");

    // OPI_TestDataRetrieval.Check_BitrixString(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileExternalLink", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileExternalLink", "Bitrix24");

    // OPI_TestDataRetrieval.Check_BitrixString(Result);

EndProcedure

Procedure CLI_Bitrix24_MarkFileAsDeleted(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFileAsDeleted", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkFileAsDeleted (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFileAsDeleted", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkFileAsDeleted", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_RestoreFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RestoreFile (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RestoreFile", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_RenameFile(FunctionParameters)

    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = FunctionParameters["Bitrix24_HookFileID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID2);
    Options.Insert("title"  , Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenameFile (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FileID = FunctionParameters["Bitrix24_FileID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fileid" , FileID);
    Options.Insert("title"  , Name);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RenameFile", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_MoveFileToFolder(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookSubFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("fileid"   , FileID);
    Options.Insert("folderid" , FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFileToFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveFileToFolder (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FolderID = FunctionParameters["Bitrix24_SubFolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("fileid"   , FileID);
    Options.Insert("folderid" , FolderID);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFileToFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveFileToFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_AddTaskTimeAccounting(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Time = 3600;

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("amount" , Time);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTaskTimeAccounting (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    SpendingID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookTimeID", SpendingID);
    FunctionParameters.Insert("Bitrix24_HookTimeID", SpendingID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text      = "Time spent on work";
    UserID    = 10;
    Time      = 7200;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("amount" , Time);
    Options.Insert("user"   , UserID);
    Options.Insert("text"   , Text);
    Options.Insert("date"   , SetupDate);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddTaskTimeAccounting", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    SpendingID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_TimeID", SpendingID);
    FunctionParameters.Insert("Bitrix24_TimeID", SpendingID);

EndProcedure

Procedure CLI_Bitrix24_UpdateTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Text = "The text I forgot last time";
    Time = 4800;

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("record" , RecordID);
    Options.Insert("amount" , Time);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTaskTimeAccounting (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Text      = "New time record";
    Time      = 4800;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("record" , RecordID);
    Options.Insert("amount" , Time);
    Options.Insert("text"   , Text);
    Options.Insert("date"   , SetupDate);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTaskTimeAccounting", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("record" , RecordID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTaskTimeAccounting (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("record" , RecordID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTaskTimeAccounting", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("record" , RecordID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskTimeAccounting (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("task"   , TaskID);
    Options.Insert("record" , RecordID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccounting", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskTimeAccounting", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_GetTaskTimeAccountingList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccountingList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskTimeAccountingList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("task"  , TaskID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccountingList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTaskTimeAccountingList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result);

EndProcedure

Procedure CLI_Bitrix24_StartTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTimekeeping", Options);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate() - Hour;
    Report = "Late";

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("userid" , UserID);
    Options.Insert("time"   , Time);
    Options.Insert("report" , Report);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTimekeeping", Options);

EndProcedure

Procedure CLI_Bitrix24_StopTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopTimekeeping", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate();
    Report = "Time off";

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("userid" , UserID);
    Options.Insert("time"   , Time);
    Options.Insert("report" , Report);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopTimekeeping", Options);

EndProcedure

Procedure CLI_Bitrix24_PauseTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTimekeeping", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("userid" , UserID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTimekeeping", Options);

EndProcedure

Procedure CLI_Bitrix24_GetTimekeepingStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingStatus", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("userid" , UserID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingStatus", Options);

EndProcedure

Procedure CLI_Bitrix24_GetTimekeepingSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingSettings", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("userid" , UserID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingSettings", Options);

EndProcedure

Procedure CLI_Bitrix24_AddKanbanStage(FunctionParameters)

    Name  = "New stage";
    Color = "0026FF";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("title"    , Name);
    Options.Insert("color"    , Color);
    Options.Insert("prevstage", 6);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddKanbanStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddKanbanStage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    PrevStageID = Result["result"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookStageID", PrevStageID);
    FunctionParameters.Insert("Bitrix24_HookStageID", PrevStageID);

    Name  = "New stage 2";
    Color = "0026FF";

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("title"    , Name);
    Options.Insert("color"    , Color);
    Options.Insert("prevstage", PrevStageID);
    Options.Insert("admin"    , True);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddKanbanStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddKanbanStage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    StageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_StageID", StageID);
    FunctionParameters.Insert("Bitrix24_StageID", StageID);

EndProcedure

Procedure CLI_Bitrix24_DeleteKanbanStage(FunctionParameters)

    StageID = FunctionParameters["Bitrix24_HookStageID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("stage" , StageID);
    Options.Insert("admin" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteKanbanStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteKanbanStage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("stage" , StageID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteKanbanStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteKanbanStage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetKanbanStages(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("admin" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetKanbanStages", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetKanbanStages (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetKanbanStages", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetKanbanStages", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure CLI_Bitrix24_MoveTaskToKanbanStage(FunctionParameters)

    TaskID  = FunctionParameters["Bitrix24_KanbanTaskID"];
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);
    Options.Insert("stage", StageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveTaskToKanbanStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveTaskToKanbanStage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("task" , TaskID);
    Options.Insert("stage", StageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveTaskToKanbanStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MoveTaskToKanbanStage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, 2, , , Token);

EndProcedure

Procedure CLI_Bitrix24_UpdateKanbansStage(FunctionParameters)

    Name    = "New stage name";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("title", Name);
    Options.Insert("stage", StageID);
    Options.Insert("color", Color);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateKanbansStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateKanbansStage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("title"    , Name);
    Options.Insert("stage"    , StageID);
    Options.Insert("color"    , Color);
    Options.Insert("prevstage", 6);
    Options.Insert("admin"    , True);
    Options.Insert("token"    , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateKanbansStage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateKanbansStage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_CreatePersonalNotification(FunctionParameters)

    UserID = 1;

    URL   = FunctionParameters["Bitrix24_URL"];
    Text  = "Message text";
    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("user"  , UserID);
    Options.Insert("text"  , Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePersonalNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePersonalNotification)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_PersoalHookNotifyID", MessageID);
    FunctionParameters.Insert("Bitrix24_PersoalHookNotifyID", MessageID);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("user"  , UserID);
    Options.Insert("text"  , Text);
    Options.Insert("tag"   , Tag);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePersonalNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePersonalNotification", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_PersoalNotifyID", MessageID);
    FunctionParameters.Insert("Bitrix24_PersoalNotifyID", MessageID);

EndProcedure

Procedure CLI_Bitrix24_CreateSystemNotification(FunctionParameters)

    UserID = 1;

    URL   = FunctionParameters["Bitrix24_URL"];
    Text  = "Message text";
    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("user"  , UserID);
    Options.Insert("text"  , Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSystemNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateSystemNotification (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_SystemHookNotifyID", MessageID);
    FunctionParameters.Insert("Bitrix24_SystemHookNotifyID", MessageID);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("user"  , UserID);
    Options.Insert("text"  , Text);
    Options.Insert("tag"   , Tag);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSystemNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateSystemNotification", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_SystemNotifyID", MessageID);
    FunctionParameters.Insert("Bitrix24_SystemNotifyID", MessageID);

EndProcedure

Procedure CLI_Bitrix24_DeleteNotification(FunctionParameters)

    URL            = FunctionParameters["Bitrix24_URL"];
    NotificationID = FunctionParameters["Bitrix24_PersoalHookNotifyID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("notif" , NotificationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteNotification", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL            = FunctionParameters["Bitrix24_Domain"];
    Token          = FunctionParameters["Bitrix24_Token"];
    NotificationID = FunctionParameters["Bitrix24_PersoalNotifyID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("notif" , NotificationID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteNotification (app)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixBool(Result);

EndProcedure

Procedure CLI_Bitrix24_AddCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Type = "date";
    Name = "BIRTHDAY_FIELD";

    Options = New Structure;
    Options.Insert("url"      , URL);
    Options.Insert("type"     , Type);
    Options.Insert("fieldname", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddCustomTaskField", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Type       = "string";
    Name       = "TEXT_FIELD";
    ExternalID = "BITRIX_TEXT_FIELD";
    Title      = "Text field";
    Signature  = New Structure("en,ru", "Some field", "Nekotoroe pole");

    Options = New Structure;
    Options.Insert("url"       , URL);
    Options.Insert("type"      , Type);
    Options.Insert("fieldname" , Name);
    Options.Insert("externalid", ExternalID);
    Options.Insert("title"     , Title);
    Options.Insert("label"     , Signature);
    Options.Insert("token"     , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddCustomTaskField", Options);

EndProcedure

Procedure CLI_Bitrix24_UpdateCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];
    Title   = "New title";

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("fieldid" , FieldID);
    Options.Insert("title"   , Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCustomTaskField", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FieldID    = FunctionParameters["Bitrix24_TaskFieldID"];
    ExternalID = "NEW_TEXT_FIELD";
    Signature  = New Structure("en,ru", "Updated field", "Izmenennoe pole");

    Options = New Structure;
    Options.Insert("url"       , URL);
    Options.Insert("fieldid"   , FieldID);
    Options.Insert("externalid", ExternalID);
    Options.Insert("label"     , Signature);
    Options.Insert("token"     , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddCustomTaskField", Options);

EndProcedure

Procedure CLI_Bitrix24_GetCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("fieldid" , FieldID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskField", Options);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("fieldid" , FieldID);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskField", Options);

EndProcedure

Procedure CLI_Bitrix24_GetCustomTaskFieldsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskFieldsList", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskFieldsList", Options);

EndProcedure

Procedure CLI_Bitrix24_DeleteCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fieldid", FieldID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCustomTaskField", Options);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCustomTaskField", Options);

EndProcedure

Procedure CLI_Bitrix24_CreateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Name     = "Main department";
    ParentID = 1;

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("title"   , Name);
    Options.Insert("parentid", ParentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDepartment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDepartment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    DepartmentID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookDepID", DepartmentID);
    FunctionParameters.Insert("Bitrix24_HookDepID", DepartmentID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Name     = "Subordinate department";
    ParentID = FunctionParameters["Bitrix24_HookDepID"];
    HeadID   = 1;

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("title"   , Name);
    Options.Insert("parentid", ParentID);
    Options.Insert("headid"  , HeadID);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDepartment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDepartment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    DepartmentID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_DepID", DepartmentID);
    FunctionParameters.Insert("Bitrix24_DepID", DepartmentID);

EndProcedure

Procedure CLI_Bitrix24_UpdateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];
    ParentID     = 7;

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("depid"   , DepartmentID);
    Options.Insert("parentid", ParentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDepartment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateDepartment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    DepartmentID = FunctionParameters["Bitrix24_DepID"];
    Name         = "New department";
    ParentID     = 1;
    HeadID       = 10;

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("depid"   , DepartmentID);
    Options.Insert("title"   , Name);
    Options.Insert("parentid", ParentID);
    Options.Insert("headid"  , HeadID);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDepartment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateDepartment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteDepartment(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("depid" , DepartmentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDepartment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteDepartment (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL          = FunctionParameters["Bitrix24_Domain"];
    Token        = FunctionParameters["Bitrix24_Token"];
    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("depid" , DepartmentID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDepartment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteDepartment", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetDepartments(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("depid" , DepartmentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDepartments", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDepartments (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    HeadID = 1;

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("headid" , HeadID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDepartments", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDepartments", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateChat(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image);

    B64Image = GetBase64StringFromBinaryData(Image);

    MembersArray = New Array;
    MembersArray.Add(10);
    MembersArray.Add(1);

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE"       , "OPEN");
    ChatStructure.Insert("TITLE"      , "New chat");
    ChatStructure.Insert("DESCRIPTION", "This is a new chat");
    ChatStructure.Insert("COLOR"      , "GREEN");
    ChatStructure.Insert("MESSAGE"    , "Welcome to new chat");
    ChatStructure.Insert("USERS"      , MembersArray);
    ChatStructure.Insert("OWNER_ID"   , 1);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", ChatStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateChat (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    ChatID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookChatID", ChatID);
    FunctionParameters.Insert("Bitrix24_HookChatID", ChatID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE"  , "CHAT");
    ChatStructure.Insert("TITLE" , "Private chat");
    ChatStructure.Insert("USERS" , MembersArray);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", ChatStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateChat", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    ChatID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatID", ChatID);
    FunctionParameters.Insert("Bitrix24_ChatID", ChatID);

EndProcedure

Procedure CLI_Bitrix24_GetChatUsers(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatUsers (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatUsers", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_LeaveChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "LeaveChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "LeaveChat (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "LeaveChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "LeaveChat", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteUserFromChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);
    Options.Insert("user" , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteUserFromChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteUserFromChat (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("user"  , UserID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteUserFromChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteUserFromChat", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_AddUsersToChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID  = 10;
    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("users" , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddUsersToChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddUsersToChat (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("users" , UserIDs);
    Options.Insert("hide"  , True);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddUsersToChat", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddUsersToChat", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_ChangeChatTitle(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Title = "New chat title";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("title" , Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatTitle", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatTitle (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Title = "Another title";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("title" , Title);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatTitle", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatTitle", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_ChangeChatColor(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Color = "AZURE";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("color" , Color);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatColor", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatColor (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    OPI_Tools.Pause(10);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Color = "PURPLE";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("color" , Color);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatColor", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatColor", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_ChangeChatPicture(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Image = FunctionParameters["Picture2"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("chat"   , ChatID);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatPicture (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("chat"   , ChatID);
    Options.Insert("picture", Image);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatPicture", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatPicture", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_DisableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisableChatNotifications", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DisableChatNotifications (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisableChatNotifications", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DisableChatNotifications", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_EnableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EnableChatNotifications", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EnableChatNotifications (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EnableChatNotifications", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EnableChatNotifications", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_ChangeChatOwner(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);
    Options.Insert("user" , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatOwner", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatOwner (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("user"  , UserID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatOwner", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeChatOwner", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetChatMessagesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat4";

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMessagesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatMessagesList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMessages(Result);

    MessageID = Result["result"]["messages"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatMessageID", MessageID);
    FunctionParameters.Insert("Bitrix24_ChatMessageID", MessageID);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , UserID);
    Options.Insert("first" , 0);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMessagesList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatMessagesList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMessages(Result);

    MessageID = Result["result"]["messages"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_UserMessageID", MessageID);
    FunctionParameters.Insert("Bitrix24_UserMessageID", MessageID);

EndProcedure

Procedure CLI_Bitrix24_MarkMessageAsReaded(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    ChatID    = "chat" + FunctionParameters["Bitrix24_HookChatID"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("chat"   , ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsReaded", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkMessageAsReaded (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixDialog(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("chat"   , UserID);
    Options.Insert("message", MessageID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsReaded", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkMessageAsReaded", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixDialog(Result);

EndProcedure

Procedure CLI_Bitrix24_MarkMessageAsUnreaded(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    ChatID    = "chat" + FunctionParameters["Bitrix24_HookChatID"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("chat"   , ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsUnreaded", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkMessageAsUnreaded)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("chat"   , UserID);
    Options.Insert("message", MessageID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsUnreaded", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "MarkMessageAsUnreaded", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetDialog(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDialog", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDialog (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMessage(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , UserID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDialog", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDialog", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMessage(Result);

EndProcedure

Procedure CLI_Bitrix24_GetChatMembersList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMembersList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatMembersList)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , UserID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMembersList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatMembersList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_SendWritingNotification(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendWritingNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendWritingNotification (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , UserID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendWritingNotification", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendWritingNotification", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_ReadAll(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ReadAll", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ReadAll (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ReadAll", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ReadAll", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_SendMessage(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];
    Text   = "Message text";
    Image  = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;

    Options = New Structure;
    Options.Insert("title" , "Image1");
    Options.Insert("url"   , Image);

    Attachment1 = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPictureBlock", Options);

    Options = New Structure;
    Options.Insert("title" , "File1.docx");
    Options.Insert("url"   , File);

    Attachment2 = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileBlock", Options);

    Attachments.Add(Attachment1);
    Attachments.Add(Attachment2);

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);
    Options.Insert("text" , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatMessageID", MessageID);
    FunctionParameters.Insert("Bitrix24_ChatMessageID", MessageID);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("chat"   , UserID);
    Options.Insert("text"   , Text);
    Options.Insert("blocks" , Attachments);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendMessage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_UserMessageID", MessageID);
    FunctionParameters.Insert("Bitrix24_UserMessageID", MessageID);

EndProcedure

Procedure CLI_Bitrix24_EditMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Text = "New message text";

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("message", MessageID);
    Options.Insert("text"   , Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EditMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditMessage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("message", MessageID);
    Options.Insert("text"   , Text);
    Options.Insert("blocks" , Attachments);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EditMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "EditMessage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteMessage (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("message", MessageID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteMessage", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteMessage", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_SetMessageReaction(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetMessageReaction", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetMessageReaction (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("message", MessageID);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetMessageReaction", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetMessageReaction", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetChatFilesFolder(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatFilesFolder)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("chat"  , ChatID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatFilesFolder", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_SendFile(FunctionParameters)

    URL         = FunctionParameters["Bitrix24_URL"];
    ChatID      = FunctionParameters["Bitrix24_HookChatID"];
    File        = FunctionParameters["Document"]; // Binary Data, URL or path to file
    Description = "Very important file";

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("chat" , ChatID);

    Directory = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);
    FolderID  = Directory["result"]["ID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("title"   , "Imortant doc.docx");
    Options.Insert("file"    , File);
    Options.Insert("folderid", FolderID);

    UploadedFile = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);
    FileID       = UploadedFile["result"]["ID"];

    Options = New Structure;
    Options.Insert("url"        , URL);
    Options.Insert("chat"       , ChatID);
    Options.Insert("fileid"     , FileID);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixFileMessage(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID, Token);
    FileID       = UploadedFile["result"]["ID"];

    Options = New Structure;
    Options.Insert("url"        , URL);
    Options.Insert("chat"       , ChatID);
    Options.Insert("fileid"     , FileID);
    Options.Insert("description", Description);
    Options.Insert("token"      , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendFile", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendFile", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixFileMessage(Result);

EndProcedure

Procedure CLI_Bitrix24_GetUsers(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    UserID       = 10;
    ArrayOfUsers = New Array;

    ArrayOfUsers.Add(1);
    ArrayOfUsers.Add(10);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("users" , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUsers (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("users" , ArrayOfUsers);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUsers", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure CLI_Bitrix24_GetUserStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserStatus (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixString(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserStatus", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixString(Result);

EndProcedure

Procedure CLI_Bitrix24_SetUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Status = "dnd";

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("status" , Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetUserStatus (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Status = "away";

    Options = New Structure;
    Options.Insert("url"    , URL);
    Options.Insert("status" , Status);
    Options.Insert("token"  , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetUserStatus", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetPictureBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("url"  , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPictureBlock", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPictureBlock", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetFileBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("url"  , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileBlock", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetFileBlock", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetChatStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetChatStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCurrentUser(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCurrentUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCurrentUser (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCurrentUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCurrentUser", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_GetUserFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFieldsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserFieldsStructure (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFieldsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserFieldsStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateUser(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_URL"];
    Email = String(New UUID) + "@exepmple.org";
    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", UserStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateUser (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    UserID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookUserID", UserID);
    FunctionParameters.Insert("Bitrix24_HookUserID", UserID);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    Email = String(New UUID) + "@exepmple.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"          , Email);
    UserStructure.Insert("NAME"           , "Vitaly");
    UserStructure.Insert("LAST_NAME"      , "Alpaca");
    UserStructure.Insert("PERSONAL_MOBILE", "88003553535");
    UserStructure.Insert("UF_DEPARTMENT"  , 1);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", UserStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateUser", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    UserID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_UserID", UserID);
    FunctionParameters.Insert("Bitrix24_UserID", UserID);

EndProcedure

Procedure CLI_Bitrix24_UpdateUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];
    Email  = String(New UUID) + "@exepmple.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 1);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("userid", UserID);
    Options.Insert("fields", UserStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateUser (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];
    Email  = String(New UUID) + "@exepmple.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"         , Email);
    UserStructure.Insert("NAME"          , "Oleg");
    UserStructure.Insert("LAST_NAME"     , "Lama");
    UserStructure.Insert("UF_DEPARTMENT" , 7);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("userid", UserID);
    Options.Insert("fields", UserStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateUser", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_ChangeUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("userid", UserID);
    Options.Insert("fire"  , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeUserStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeUserStatus (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("userid", UserID);
    Options.Insert("fire"  , True);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeUserStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ChangeUserStatus", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("userid", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUser (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("userid", UserID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUser", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUser", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_FindUsers(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FilterStructure = New Structure;
    FilterStructure.Insert("NAME"              , "Vitaly");
    FilterStructure.Insert("LAST_NAME"         , "Alpaca");
    FilterStructure.Insert("WORK_POSITION"     , "DevOps engineer");
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Marketing department");
    FilterStructure.Insert("USER_TYPE"         , "employee");

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("filter", FilterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "FindUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "FindUsers (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("filter", FilterStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "FindUsers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "FindUsers", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_GetUserFilterStructure(TestParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetLeadFilterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLeadFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetLeadStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLeadStructure (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixLead(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLeadStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixLead(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateLead(FunctionParameters)

    EmailsArray = New Array;
    EmailsArray.Add(New Structure("VALUE,VALUE_TYPE", "yo@example.com", "HOME"));
    EmailsArray.Add(New Structure("VALUE,VALUE_TYPE", "hi@example.com", "WORK"));

    PhonesArray = New Array;
    PhonesArray.Add(New Structure("VALUE,VALUE_TYPE", "88005553535", "WORK"));

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Pushkin st., b. 10");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Russia");
    FieldsStructure.Insert("EMAIL"          , EmailsArray);
    FieldsStructure.Insert("NAME"           , "John");
    FieldsStructure.Insert("LAST_NAME"      , "Doe");
    FieldsStructure.Insert("PHONE"          , PhonesArray);
    FieldsStructure.Insert("TITLE"          , "MegaClient");

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateLead (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    LeadID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookLeadID", LeadID);
    FunctionParameters.Insert("Bitrix24_HookLeadID", LeadID);

    FieldsStructure.Insert("NAME"      , "Ivan");
    FieldsStructure.Insert("LAST_NAME" , "Ivanov");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateLead", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    LeadID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_LeadID", LeadID);
    FunctionParameters.Insert("Bitrix24_LeadID", LeadID);

EndProcedure

Procedure CLI_Bitrix24_UpdateLead(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Lermontov st., b. 20");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Belarus");
    FieldsStructure.Insert("TITLE"          , "SuperClient");

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("lead"  , LeadID);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateLead (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    FieldsStructure.Insert("NAME"      , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME" , "Evgeniev");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("lead"  , LeadID);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateLead", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("lead" , LeadID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteLead (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("lead"  , LeadID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteLead", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("lead" , LeadID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLead (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixLead(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("lead"  , LeadID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLead", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLead", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixLead(Result);

EndProcedure

Procedure CLI_Bitrix24_GetLeadsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLeadsList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetLeadsList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_GetDealsFilterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDealsFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_Bitrix24_GetDealStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDealStructure (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixDeal(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDealStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixDeal(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateDeal(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"         , "Planned sale");
    FieldsStructure.Insert("TYPE_ID"       , "GOODS");
    FieldsStructure.Insert("STAGE_ID"      , "NEW");
    FieldsStructure.Insert("COMPANY_ID"    , 1);
    FieldsStructure.Insert("CONTACT_ID"    , 3);
    FieldsStructure.Insert("OPENED"        , "Y");
    FieldsStructure.Insert("ASSIGNED_BY_ID", 1);
    FieldsStructure.Insert("PROBABILITY"   , 30);
    FieldsStructure.Insert("CURRENCY_ID"   , "USD");
    FieldsStructure.Insert("OPPORTUNITY"   , 5000);
    FieldsStructure.Insert("CATEGORY_ID"   , 5);
    FieldsStructure.Insert("BEGINDATE"     , "2024-01-01");
    FieldsStructure.Insert("CLOSEDATE"     , "2030-01-01");

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDeal (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    LeadID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookDealID", LeadID);
    FunctionParameters.Insert("Bitrix24_HookDealID", LeadID);

    FieldsStructure.Insert("TITLE"    , "Another deal");
    FieldsStructure.Insert("CLOSEDATE", "2031-01-01");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDeal", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    LeadID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_DealID", LeadID);
    FunctionParameters.Insert("Bitrix24_DealID", LeadID);

EndProcedure

Procedure CLI_Bitrix24_UpdateDeal(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"       , "Sale in RUB");
    FieldsStructure.Insert("CURRENCY_ID" , "RUB");
    FieldsStructure.Insert("OPPORTUNITY" , 50000);

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("deal"  , DealID);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateDeal (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("deal"  , DealID);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateDeal", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("deal" , DealID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDeal (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixDeal(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("deal"  , DealID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDeal", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixDeal(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("deal" , DealID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteDeal (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("deal"  , DealID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDeal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteDeal", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetDealsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDealsList (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Options.Insert("url"   , URL);
    Options.Insert("filter", Filter);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDealsList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateCalendar(FunctionParameters)

    UserID = 1;

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("type"       , "user");
    CalendarsStructure.Insert("ownerId"    , UserID);
    CalendarsStructure.Insert("name"       , "new calendar");
    CalendarsStructure.Insert("description", "My new calendar");
    CalendarsStructure.Insert("color"      , "#FFFFFF");
    CalendarsStructure.Insert("text_color" , "#000000");

        ExportStructure = New Structure;
        ExportStructure.Insert("ALLOW", "True");
        ExportStructure.Insert("SET"  , "all");

    CalendarsStructure.Insert("export", ExportStructure);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCalendar (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    CalendarID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCalendarID", CalendarID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookCalendarID", CalendarID); // SKIP

    CalendarsStructure.Insert("name"       , "Another calendar");
    CalendarsStructure.Insert("description", "My other new calendar");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", CalendarsStructure);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCalendar", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    CalendarID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CalendarID", CalendarID);
    FunctionParameters.Insert("Bitrix24_CalendarID", CalendarID);

EndProcedure

Procedure CLI_Bitrix24_UpdateCalendar(FunctionParameters)

    UserID = 1;

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("type"       , "user");
    CalendarsStructure.Insert("ownerId"    , UserID);
    CalendarsStructure.Insert("name"       , "New calendar name");
    CalendarsStructure.Insert("description", "This calendar has been changed");

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("fields"  , CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateCalendar (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("fields"  , CalendarsStructure);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateCalendar", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

EndProcedure

Procedure CLI_Bitrix24_DeleteCalendar(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];
    OwnerID    = 1;
    Type       = "user";

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("owner"   , OwnerID);
    Options.Insert("type"    , Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteDeal (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("owner"   , OwnerID);
    Options.Insert("type"    , Type);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendar", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteCalendar", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCalendarStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options.Insert("empty" , True);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarStructure", Options);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarStructure (empty)", "Bitrix24");

    For Each Element In Result Do

        If OPI_Tools.IsPrimitiveType(Element.Value) Then
            OPI_TestDataRetrieval.Check_Empty(Element.Value);
        EndIf;

    EndDo;

EndProcedure

Procedure CLI_Bitrix24_GetCalendarList(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("owner" , OwnerID);
    Options.Insert("type"  , Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarList (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("owner" , OwnerID);
    Options.Insert("type"  , Type);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarList", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCalendarSettingsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url" , URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarSettingsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarSettingsStructure (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixMap(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarSettingsStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCalednarCustomSettingsStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalednarCustomSettingsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalednarCustomSettingsStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options.Insert("empty" , True);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalednarCustomSettingsStructure", Options);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalednarCustomSettingsStructure)", "Bitrix24");

    For Each Element In Result Do

        If OPI_Tools.IsPrimitiveType(Element.Value) Then
            OPI_TestDataRetrieval.Check_Empty(Element.Value);
        EndIf;

    EndDo;

EndProcedure

Procedure CLI_Bitrix24_GetCustomCalendarSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomCalendarSettings", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCustomCalendarSettings (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomCalendarSettings", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCustomCalendarSettings", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure CLI_Bitrix24_SetCustomCalendarSettings(FunctionParameters)

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("view"              , "month");
    CalendarsStructure.Insert("showDeclined"      , "Y");
    CalendarsStructure.Insert("collapseOffHours"  , "N");
    CalendarsStructure.Insert("showCompletedTasks", "N");

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("settings", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetCustomCalendarSettings", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetCustomCalendarSettings (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url"     , URL);
    Options.Insert("settings", CalendarsStructure);
    Options.Insert("token"   , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetCustomCalendarSettings", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetCustomCalendarSettings", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetUserBusy(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    User = 1;

    Week        = 604800;
    CurrentDate = OPI_Tools.GetCurrentDate();

    StartDate = CurrentDate;
    EndDate   = CurrentDate + Week;

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("users", User);
    Options.Insert("from" , StartDate);
    Options.Insert("to"   , EndDate);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserBusy", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserBusy (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixMap(Result); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url"  , URL);
    Options.Insert("users", User);
    Options.Insert("from" , StartDate);
    Options.Insert("to"   , EndDate);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserBusy", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserBusy", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure CLI_Bitrix24_CreateCalendarEvent(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    Tomorrow = OPI_Tools.GetCurrentDate() + 86400;
    Hour     = 3600;

    EventStucture = New Structure;

    EventStucture.Insert("type"         , "user");
    EventStucture.Insert("ownerId"      , 1);
    EventStucture.Insert("from"         , XMLString(Tomorrow));
    EventStucture.Insert("to"           , XMLString(Tomorrow + Hour));
    EventStucture.Insert("section"      , CalendarID);
    EventStucture.Insert("name"         , "New event");
    EventStucture.Insert("skip_time"    , "N");
    EventStucture.Insert("timezone_from", "Europe/Minsk");
    EventStucture.Insert("timezone_to"  , "Europe/Minsk");
    EventStucture.Insert("description"  , "Event description");
    EventStucture.Insert("color"        , "%23000000>");
    EventStucture.Insert("text_color"   , "%23FFFFFF");
    EventStucture.Insert("accessibility", "busy");
    EventStucture.Insert("importance"   , "high");
    EventStucture.Insert("private_event", "N");

        RepeatabilityStructure = New Structure;
        RepeatabilityStructure.Insert("FREQ"    , "DAILY");
        RepeatabilityStructure.Insert("COUNT"   , 3);
        RepeatabilityStructure.Insert("INTERVAL", 10);

            DaysArray = New Array;
            DaysArray.Add("SA");
            DaysArray.Add("MO");

        RepeatabilityStructure.Insert("BYDAY" , DaysArray);
        RepeatabilityStructure.Insert("UNTIL" , XMLString(Tomorrow + Hour * 24 * 10));

    EventStucture.Insert("rrule"     , RepeatabilityStructure);
    EventStucture.Insert("is_meeting", "Y");
    EventStucture.Insert("location"  , "Office");

        RemindersArray = New Array;

            ReminderStructure = New Structure;
            ReminderStructure.Insert("type" , "day");
            ReminderStructure.Insert("count", 1);

        RemindersArray.Add(ReminderStructure);

    EventStucture.Insert("remind"   , RemindersArray);
    EventStucture.Insert("attendees", StrSplit("1,10", ","));
    EventStucture.Insert("host"     , 1);

        MeetingStructure = New Structure;
        MeetingStructure.Insert("notify"      , "Y");
        MeetingStructure.Insert("reinvite"    , "Y");
        MeetingStructure.Insert("allow_invite", "N");
        MeetingStructure.Insert("hide_guests" , "N");

    EventStucture.Insert("meeting", MeetingStructure);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", EventStucture);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCalendarEvent (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    EventID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCEventID", EventID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookCEventID", EventID); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    EventStucture.Insert("section", CalendarID);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("fields", EventStucture);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCalendarEvent", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    EventID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CEventID", EventID);
    FunctionParameters.Insert("Bitrix24_CEventID", EventID);

EndProcedure

Procedure CLI_Bitrix24_DeleteCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteCalendarEvent (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteCalendarEvent", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEvent (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixMap(Result); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEvent", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCalendarEvents(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("owner" , OwnerID);
    Options.Insert("type"  , Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvents", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEvents (wh)", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    URL         = FunctionParameters["Bitrix24_Domain"];
    Token       = FunctionParameters["Bitrix24_Token"];
    EventID     = FunctionParameters["Bitrix24_CEventID"];
    CalendarID1 = FunctionParameters["Bitrix24_HookCalendarID"];
    CalendarID2 = FunctionParameters["Bitrix24_CalendarID"];

    Tomorrow = OPI_Tools.GetCurrentDate() + 86400;
    NextDay  = Tomorrow + 86400;

    ArrayOfCalendars = New Array;
    ArrayOfCalendars.Add(CalendarID1);
    ArrayOfCalendars.Add(CalendarID2);

    Filter = New Structure;
    Filter.Insert("from"   , Tomorrow);
    Filter.Insert("to"     , NextDay);
    Filter.Insert("section", ArrayOfCalendars);

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("owner" , OwnerID);
    Options.Insert("type"  , Type);
    Options.Insert("filter", Filter);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvents", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEvents", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure CLI_Bitrix24_UpdateCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    EventStucture = New Structure;

    EventStucture.Insert("ownerId"      , 1);
    EventStucture.Insert("type"         , "user");
    EventStucture.Insert("name"         , "Modified event");
    EventStucture.Insert("description"  , "New event description");
    EventStucture.Insert("importance"   , "low");
    EventStucture.Insert("private_event", "Y");

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);
    Options.Insert("fields", EventStucture);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateCalendarEvent (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    EventID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCEventID", EventID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookCEventID", EventID); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    EventID    = FunctionParameters["Bitrix24_CEventID"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);
    Options.Insert("fields", EventStucture);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendarEvent", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateCalendarEvent", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    EventID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CEventID", EventID);
    FunctionParameters.Insert("Bitrix24_CEventID", EventID);

EndProcedure

Procedure CLI_Bitrix24_SetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];
    Status  = "Y";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);
    Options.Insert("status", Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserParticipationStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserParticipationStatus (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);
    Options.Insert("status", Status);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserParticipationStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetUserParticipationStatus", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure CLI_Bitrix24_GetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserParticipationStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserParticipationStatus (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixString(Result); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("event" , EventID);
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserParticipationStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetUserParticipationStatus", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixString(Result);

EndProcedure

Procedure CLI_Bitrix24_GetCalendarEventsStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEventsStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options = New Structure;
    Options.Insert("empty" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEventsStructure (empty)", "Bitrix24");

    For Each Element In Result Do

        If OPI_Tools.IsPrimitiveType(Element.Value) Then
            OPI_TestDataRetrieval.Check_Empty(Element.Value);
        EndIf;

    EndDo;

EndProcedure

Procedure CLI_Bitrix24_GetCalendarEventsFilterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsFilterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEventsFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options = New Structure;
    Options.Insert("empty" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsFilterStructure", Options);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCalendarEventsFilterStructure (empty)", "Bitrix24");

    For Each Element In Result Do

        If OPI_Tools.IsPrimitiveType(Element.Value) Then
            OPI_TestDataRetrieval.Check_Empty(Element.Value);
        EndIf;

    EndDo;

EndProcedure

#EndRegion

#Region CDEK

Procedure CLI_CDEK_GetToken(FunctionParameters)

    Account  = FunctionParameters["CDEK_Account"];
    Password = FunctionParameters["CDEK_Password"];

    Options = New Structure;
    Options.Insert("account", Account);
    Options.Insert("pass"   , Password);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetToken", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetToken", "CDEK");
    OPI_TestDataRetrieval.Check_CdekToken(Result);

    Token = Result["access_token"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_Token", Token);
    OPI_Tools.AddField("CDEK_Token", Token, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetOrderDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOrderDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOrderDescription", "CDEK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_CDEK_CreateOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    OrderDescription = New Structure;

        SendLocation = New Structure;
        SendLocation.Insert("code"   , "44");
        SendLocation.Insert("city"   , "Moscow");
        SendLocation.Insert("address", "Ave. Leningradsky, 4");

        DestLocation = New Structure;
        DestLocation.Insert("code"   , "270");
        DestLocation.Insert("city"   , "Novosibirsk");
        DestLocation.Insert("address", "st. Bluchera, 32");

        Recipient = New Structure;

            Phones = New Array;
            Phones.Add(New Structure("number", "+79134637228"));

        Recipient.Insert("phones", Phones);
        Recipient.Insert("name"  , "Ivaniv Ivan");

        Sender = New Structure("name", "Petrov Petr");

        Services = New Array;

            Service = New Structure;
            Service.Insert("code"     , "SECURE_PACKAGE_A2");
            Service.Insert("parameter", 10);

        Services.Add(Service);

        Packages = New Array;

            Package = New Structure;

                Items = New Array;

                    Item = New Structure;

                        Payment = New Structure;
                        Payment.Insert("value", 3000);

                    Item.Insert("payment" , Payment);
                    Item.Insert("ware_key", "00055");
                    Item.Insert("name"    , "Product");
                    Item.Insert("cost"    , 300);
                    Item.Insert("amount"  , 2);
                    Item.Insert("weight"  , 700);
                    Item.Insert("url"     , "www.item.ru");

                Items.Add(Item);

            Package.Insert("items"  , Items);
            Package.Insert("number" , "bar-001");
            Package.Insert("comment", "Packaging");
            Package.Insert("height" , 10);
            Package.Insert("length" , 10);
            Package.Insert("weight" , "4000");
            Package.Insert("width"  , 10);

        Packages.Add(Package);

    OrderDescription.Insert("from_location", SendLocation);
    OrderDescription.Insert("to_location"  , DestLocation);
    OrderDescription.Insert("packages"     , Packages);
    OrderDescription.Insert("recipient"    , Recipient);
    OrderDescription.Insert("sender"       , Sender);
    OrderDescription.Insert("services"     , Services);

    OrderDescription.Insert("number"     , String(New UUID));
    OrderDescription.Insert("comment"    , "New order");
    OrderDescription.Insert("tariff_code", 139);

    OrderDescription.Insert("delivery_recipient_cost"    , New Structure("value"        , 50));
    OrderDescription.Insert("delivery_recipient_cost_adv", New Structure("sum,threshold", 3000, 200));

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("order"  , OrderDescription);
    Options.Insert("ostore" , True);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateOrder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

    UUID = Result["entity"]["uuid"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_OrderUUID", UUID);
    OPI_Tools.AddField("CDEK_OrderUUID", UUID, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOrder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrderNumber(Result);

    IMNumber = Result["entity"]["number"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_OrderIMN", IMNumber);
    OPI_Tools.AddField("CDEK_OrderIMN", IMNumber, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetOrderByNumber(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    OrderNumber = FunctionParameters["CDEK_OrderIMN"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("number"  , OrderNumber);
    Options.Insert("internal", True);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOrderByNumber", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOrderByNumber", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrderNumber(Result);

EndProcedure

Procedure CLI_CDEK_UpdateOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    OrderDescription = New Structure("comment", "NewComment");

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuid"    , UUID);
    Options.Insert("order"   , OrderDescription);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "UpdateOrder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CLI_CDEK_DeleteOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuid"    , UUID);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "DeleteOrder", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CLI_CDEK_CreateCustomerRefund(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Tariff = 139;

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuid"    , UUID);
    Options.Insert("tariff"  , Tariff);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateCustomerRefund", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCustomerRefund", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CLI_CDEK_CreateRefusal(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuid"    , UUID);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateRefusal", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateRefusal", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CLI_CDEK_GetCourierInvitationsDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCourierInvitationsDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCourierInvitationsDescription", "CDEK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_CDEK_CreateCourierInvitation(FunctionParameters)

    Token       = FunctionParameters["CDEK_Token"];
    CurrentDate = OPI_Tools.GetCurrentDate();

    InvitationDescription = New Structure;
    InvitationDescription.Insert("intake_date"     , Format(CurrentDate + 60 * 60 * 24, "DF=yyyy-MM-dd"));
    InvitationDescription.Insert("intake_time_from", "10:00");
    InvitationDescription.Insert("intake_time_to"  , "17:00");
    InvitationDescription.Insert("name"            , "Consolidated cargo");
    InvitationDescription.Insert("weight"          , 1000);
    InvitationDescription.Insert("length"          , 10);
    InvitationDescription.Insert("width"           , 10);
    InvitationDescription.Insert("height"          , 10);
    InvitationDescription.Insert("comment"         , "Comment to courier");
    InvitationDescription.Insert("need_call"       , False);

        Sender = New Structure;
        Sender.Insert("company", "Company");
        Sender.Insert("name"   , "Ivaniv Ivan");

            Phones = New Array;
            Phone  = New Structure("number", "+79589441654");
            Phones.Add(Phone);

        Sender.Insert("phones", Phones);

    InvitationDescription.Insert("sender", Sender);

        ShippingPoint = New Structure;
        ShippingPoint.Insert("code"        , "44");
        ShippingPoint.Insert("fias_guid"   , "0c5b2444-70a0-4932-980c-b4dc0d3f02b5");
        ShippingPoint.Insert("postal_code" , "109004");
        ShippingPoint.Insert("longitude"   , 37.6204);
        ShippingPoint.Insert("latitude"    , 55.754);
        ShippingPoint.Insert("country_code", "RU");
        ShippingPoint.Insert("region"      , "Moscow");
        ShippingPoint.Insert("sub_region"  , "Moscow");
        ShippingPoint.Insert("city"        , "Moscow");
        ShippingPoint.Insert("kladr_code"  , "7700000000000");
        ShippingPoint.Insert("address"     , "st. Bluchera, 32");

    InvitationDescription.Insert("from_location", ShippingPoint);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("intake" , InvitationDescription);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateCourierInvitation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCourierInvitation", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

    UUID = Result["entity"]["uuid"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_IntakeUUID", UUID);
    OPI_Tools.AddField("CDEK_IntakeUUID", UUID, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCourierInvitation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCourierInvitation", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CLI_CDEK_DeleteCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "DeleteCourierInvitation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteCourierInvitation", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CLI_CDEK_CreateReceipt(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Type   = "tpl_russia";
    Copies = 1;

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuids"  , UUID);
    Options.Insert("type"   , Type);
    Options.Insert("count"  , Copies);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateReceipt", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateReceipt", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

    UUID = Result["entity"]["uuid"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_PrintUUID", UUID);
    OPI_Tools.AddField("CDEK_PrintUUID", UUID, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetReceipt(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_PrintUUID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetReceipt", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetReceipt", "CDEK");
    OPI_TestDataRetrieval.Check_CdekReceipt(Result);

    TFN = GetTempFileName("pdf");

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("getfile", True);
    Options.Insert("testapi", True);
    Options.Insert("out"    , TFN);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetReceipt", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetReceipt (file)");
    OPI_TestDataRetrieval.Check_BinaryData(Result, 50000);
    DeleteFiles(TFN);

EndProcedure

Procedure CLI_CDEK_CreateBarcode(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Format = "A5";
    Copies = 1;

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuids"  , UUID);
    Options.Insert("count"  , Copies);
    Options.Insert("format" , Format);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateBarcode", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateBarcode", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

    UUID = Result["entity"]["uuid"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_BarcodeUUID", UUID);
    OPI_Tools.AddField("CDEK_BarcodeUUID", UUID, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetBarcode(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_BarcodeUUID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetBarcode", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBarcode", "CDEK");
    OPI_TestDataRetrieval.Check_CdekReceipt(Result);

    TFN = GetTempFileName("pdf");

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("getfile", True);
    Options.Insert("testapi", True);
    Options.Insert("out"    , TFN);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetBarcode", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBarcode (file)");
    OPI_TestDataRetrieval.Check_BinaryData(Result, 0);
    DeleteFiles(TFN);

EndProcedure

Procedure CLI_CDEK_GetAvailableDeliveryIntervals(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetAvailableDeliveryIntervals", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAvailableDeliveryIntervals", "CDEK");
    OPI_TestDataRetrieval.Check_CdekkDeliveryIntervals(Result);

EndProcedure

Procedure CLI_CDEK_GetAppointmentDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetAppointmentDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAppointmentDescription", "CDEK");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options = New Structure;
    Options.Insert("empty", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetAppointmentDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAppointmentDescription (empty)", "CDEK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_CDEK_RegisterDeliveryAppointment(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    Order = FunctionParameters["CDEK_OrderUUID"];

    Day          = 60 * 60 * 24;
    CurrentDate  = BegOfDay(OPI_Tools.GetCurrentDate());
    DeliveryDate = CurrentDate + Day * 14;

    While DayOfWeek(DeliveryDate) > 5 Do
        DeliveryDate = DeliveryDate + Day;
    EndDo;

    Appointment = New Structure;

    Appointment.Insert("cdek_number", "1106207236");
    Appointment.Insert("order_uuid" , Order);
    Appointment.Insert("date"       , Format(DeliveryDate, "DF=yyyy-MM-dd"));
    Appointment.Insert("time_from"  , "10:00");
    Appointment.Insert("time_to"    , "17:00");
    Appointment.Insert("comment"    , "Group office");

        DeliveryLocation = New Structure;
        DeliveryLocation.Insert("code"        , "270");
        DeliveryLocation.Insert("fias_guid"   , "0c5b2444-70a0-4932-980c-b4dc0d3f02b5");
        DeliveryLocation.Insert("postal_code" , "109004");
        DeliveryLocation.Insert("longitude"   , 37.6204);
        DeliveryLocation.Insert("latitude"    , 55.754);
        DeliveryLocation.Insert("country_code", "RU");
        DeliveryLocation.Insert("region"      , "Novosibirsk");
        DeliveryLocation.Insert("sub_region"  , "Novosibirsk");
        DeliveryLocation.Insert("city"        , "Novosibirsk");
        DeliveryLocation.Insert("kladr_code"  , "7700000000000");
        DeliveryLocation.Insert("address"     , "st. Bluchera, 33");

    Appointment.Insert("to_location", DeliveryLocation);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("appt"   , Appointment);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "RegisterDeliveryAppointment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RegisterDeliveryAppointment", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

    UUID = Result["entity"]["uuid"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_ApptUUID", UUID);
    OPI_Tools.AddField("CDEK_ApptUUID", UUID, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetDeliveryAppointment(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_ApptUUID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("uuid"   , UUID);
    Options.Insert("testapi", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetDeliveryAppointment", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDeliveryAppointment", "CDEK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_CDEK_CreatePrealert(FunctionParameters)

    Token        = FunctionParameters["CDEK_Token"];
    UUID         = FunctionParameters["CDEK_OrderUUID"];
    Point        = "NSK27";
    TransferDate = OPI_Tools.GetCurrentDate() + 60 * 60 * 24;

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuids"   , UUID);
    Options.Insert("date"    , TransferDate);
    Options.Insert("point"   , Point);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreatePrealert", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreatePrealert", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

    UUID = Result["entity"]["uuid"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_PrealertUUID", UUID);
    OPI_Tools.AddField("CDEK_PrealertUUID", UUID, "String", FunctionParameters);

EndProcedure

Procedure CLI_CDEK_GetPrealert(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_PrealertUUID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuid"    , UUID);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetPrealert", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPrealert", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CLI_CDEK_GetPassportDataStatus(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuid"    , UUID);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetPassportDataStatus", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetPassportDataStatus", "CDEK");
    OPI_TestDataRetrieval.Check_CdekPassport(Result);

EndProcedure

Procedure CLI_CDEK_GetCashboxCheck(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("uuid"    , UUID);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCashboxCheck", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCashboxCheck", "CDEK");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_CDEK_GetCashboxChecksByDate(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("date"    , ReceivingDate);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCashboxChecksByDate", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCashboxChecksByDate", "CDEK");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_CDEK_GetDeliveryCashRegistry(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("date"    , ReceivingDate);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetDeliveryCashRegistry", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDeliveryCashRegistry", "CDEK");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_CDEK_GetDeliveryCashTransfers(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("date"    , ReceivingDate);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetDeliveryCashTransfers", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetDeliveryCashTransfers", "CDEK");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure CLI_CDEK_GetOfficeFilterDescription(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOfficeFilterDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOfficeFilterDescription", "CDEK");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options = New Structure;
    Options.Insert("empty", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOfficeFilterDescription", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOfficeFilterDescription (empty)", "CDEK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_CDEK_GetOfficeList(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    Filter = New Structure;
    Filter.Insert("weight_max" , 50);
    Filter.Insert("city_code"  , 270);
    Filter.Insert("allowed_cod", True);

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("filter"  , Filter);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOfficeList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetOfficeList", "CDEK");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

Procedure CLI_CDEK_GetRegionsList(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    Options = New Structure;
    Options.Insert("token"   , Token);
    Options.Insert("testapi" , True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetRegionsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRegionsList", "CDEK");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

#EndRegion

#Region YandexMetrika

Procedure CLI_YandexMetrika_GetTagsList(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetTagsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTagsList", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaTags(Result);

EndProcedure

Procedure CLI_YandexMetrika_CreateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    Name  = "New tag";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "CreateTag", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTag", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaTag(Result, Name);

    TagID = Result["label"]["id"];
    OPI_TestDataRetrieval.WriteParameter("Metrika_LabelID", TagID);
    OPI_Tools.AddField("Metrika_LabelID", TagID, "String", FunctionParameters);

EndProcedure

Procedure CLI_YandexMetrika_DeleteTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "DeleteTag", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTag", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaSuccess(Result);

EndProcedure

Procedure CLI_YandexMetrika_UpdateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];
    Name  = "New tag title";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "UpdateTag", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateTag", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaTag(Result, Name);

EndProcedure

Procedure CLI_YandexMetrika_GetTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetTag", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTag", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaTag(Result);

EndProcedure

Procedure CLI_YandexMetrika_GetCounterStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCounterStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCounterStructure", "YandexMetrika");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_YandexMetrika_CreateCounter(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];

    CounterStructure = New Structure;
    CounterStructure.Insert("autogoals_enabled", True);

        CodeSettingsStructure = New Structure;
        CodeSettingsStructure.Insert("async"          , 0);
        CodeSettingsStructure.Insert("clickmap"       , 1);
        CodeSettingsStructure.Insert("ecommerce"      , 1);
        CodeSettingsStructure.Insert("in_one_line"    , 0);
        CodeSettingsStructure.Insert("track_hash"     , 1);
        CodeSettingsStructure.Insert("visor"          , 1);
        CodeSettingsStructure.Insert("xml_site"       , 0);
        CodeSettingsStructure.Insert("ytm"            , 0);
        CodeSettingsStructure.Insert("alternative_cdn", 1);

            InformerStructure = New Structure;
            InformerStructure.Insert("color_arrow", 1);
            InformerStructure.Insert("color_end"  , "EFEFEFFE");
            InformerStructure.Insert("color_start", "EEEEEEEE");
            InformerStructure.Insert("color_text" , 0);
            InformerStructure.Insert("enabled"    , 1);
            InformerStructure.Insert("indicator"  , "uniques");
            InformerStructure.Insert("size"       , 2);
            InformerStructure.Insert("type"       , "ext");

        CodeSettingsStructure.Insert("informer", InformerStructure);

    CounterStructure.Insert("code_options", CodeSettingsStructure);

        FlagsStructure = New Structure;
        FlagsStructure.Insert("collect_first_party_data"             , True);
        FlagsStructure.Insert("measurement_enabled"                  , True);
        FlagsStructure.Insert("use_in_benchmarks"                    , True);
        FlagsStructure.Insert("direct_allow_use_goals_without_access", True);

    CounterStructure.Insert("counter_flags"          , FlagsStructure);
    CounterStructure.Insert("favorite"               , 1);
    CounterStructure.Insert("filter_robots"          , 2);
    CounterStructure.Insert("gdpr_agreement_accepted", 1);

        DomainStructure = New Structure("site", "openintegrations.dev");

    CounterStructure.Insert("site2", DomainStructure);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("fields", CounterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "CreateCounter", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateCounter", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaCounter(Result);

    CounterID = Result["counter"]["id"];
    OPI_TestDataRetrieval.WriteParameter("Metrika_CounterID", CounterID);
    OPI_Tools.AddField("Metrika_CounterID", CounterID, "String", FunctionParameters);

EndProcedure

Procedure CLI_YandexMetrika_DeleteCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "DeleteCounter", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteCounter", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaSuccess(Result);

EndProcedure

Procedure CLI_YandexMetrika_UpdateCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    CounterStructure = New Structure;
    CounterStructure.Insert("autogoals_enabled", True);

        FlagsStructure = New Structure;
        FlagsStructure.Insert("collect_first_party_data"             , False);
        FlagsStructure.Insert("measurement_enabled"                  , False);
        FlagsStructure.Insert("use_in_benchmarks"                    , False);
        FlagsStructure.Insert("direct_allow_use_goals_without_access", False);

    CounterStructure.Insert("counter_flags" , FlagsStructure);
    CounterStructure.Insert("favorite"      , 0);
    CounterStructure.Insert("filter_robots" , 1);

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("counter", CounterID);
    Options.Insert("fields" , CounterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "UpdateCounter", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateCounter", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaCounter(Result);

EndProcedure

Procedure CLI_YandexMetrika_GetCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCounter", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCounter", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaCounter(Result);

EndProcedure

Procedure CLI_YandexMetrika_RestoreCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "RestoreCounter", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "RestoreCounter", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaSuccess(Result);

EndProcedure

Procedure CLI_YandexMetrika_GetCountersList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token" , Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCountersList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCountersList", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaCounters(Result);

    // filter by IDs list

    Filter = New Structure;

    CountersArray = New Array;
    CountersArray.Add(CounterID);

    Filter.Insert("counter_ids", CountersArray);

    Options = New Structure;
    Options.Insert("token" , Token);
    Options.Insert("filter", Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCountersList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetCountersList (filter))", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaCounters(Result);

EndProcedure

Procedure CLI_YandexMetrika_GetActionsList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token"  , Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetActionsList", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetActionsList", "YandexMetrika");
    OPI_TestDataRetrieval.Check_MetrikaActions(Result);

EndProcedure

#EndRegion

#Region S3

Procedure CLI_S3_GetBasicDataStructure(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBasicDataStructure", "S3");

EndProcedure

Procedure CLI_S3_SendRequestWithoutBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"] + "/opi-newbucket2";
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Method = "GET";

    Options = New Structure;
    Options.Insert("method", Method);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "SendRequestWithoutBody", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendRequestWithoutBody");

EndProcedure

Procedure CLI_S3_SendRequestWithBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Method = "PUT";
    Body   = "C:\test_data\document.docx";

    Options = New Structure;
    Options.Insert("method", Method);
    Options.Insert("basic" , BasicData);
    Options.Insert("body"  , Body);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "SendRequestWithBody", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SendRequestWithBody");

EndProcedure

Procedure CLI_S3_CreateBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    // Directory bucket

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "CreateBucket", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateBucket (DB)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);
    BasicData.Insert("URL", FunctionParameters["S3_URL"]);

    // General purpose bucket

    Name = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "CreateBucket", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateBucket", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_DeleteBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    // Directory bucket

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucket", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteBucket (DB)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);
    BasicData.Insert("URL", FunctionParameters["S3_URL"]);

    // General purpose bucket

    Name = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucket", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteBucket", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_ListBuckets(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Options = New Structure;
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListBuckets", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ListBuckets", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_HeadBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadBucket", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "HeadBucket", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    Options = New Structure;
    Options.Insert("name"   , Name);
    Options.Insert("basic"  , BasicData);
    Options.Insert("account", "1234");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadBucket", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "HeadBucket (account)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_GetBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "opi-newbucket2";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketEncryption", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBucketEncryption", "S3");

EndProcedure

Procedure CLI_S3_DeleteBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "opi-newbucket2";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucketEncryption", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteBucketEncryption", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_PutBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "opi-newbucket2";

    XmlConfig = "<ServerSideEncryptionConfiguration xmlns=""http://s3.amazonaws.com/doc/2006-03-01/"">
    | <Rule>
    | <ApplyServerSideEncryptionByDefault>
    | <SSEAlgorithm>AES256</SSEAlgorithm>
    | </ApplyServerSideEncryptionByDefault>
    | </Rule>
    |</ServerSideEncryptionConfiguration>";

    XmlConfig = ПолучитьДвоичныеДанныеИзСтроки(XmlConfig);
    TFN       = GetTempFileName("xml");
    XmlConfig.Write(TFN);

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("conf" , TFN);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketEncryption", Options);

    DeleteFiles(TFN);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutBucketEncryption", "S3");
    OPI_TestDataRetrieval.Check_S3NotImplemented(Result);
    OPI_TestDataRetrieval.WriteLogFile("", "PutBucketEncryption", "S3", True);

EndProcedure

Procedure CLI_S3_GetBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    // Directory bucket

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBucketTagging (DB)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);
    BasicData.Insert("URL", FunctionParameters["S3_URL"]);

    // General purpose bucket

    Name = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBucketTagging", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_PutBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    TagStructure = New Structure;

    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    // Directory bucket

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("basic" , BasicData);
    Options.Insert("tagset", TagStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutBucketTagging (DB)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);
    BasicData.Insert("URL", FunctionParameters["S3_URL"]);

    // General purpose bucket

    Name = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("basic" , BasicData);
    Options.Insert("tagset", TagStructure);
    Options.Insert("dir"   , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutBucketTagging", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_DeleteBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    // Directory bucket

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucketTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteBucketTagging (DB)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);
    BasicData.Insert("URL", FunctionParameters["S3_URL"]);

    // General purpose bucket

    Name = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucketTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteBucketTagging", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    Result = OPI_S3.GetBucketTagging(Name, BasicData, False);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteBucketTagging)", "S3");

EndProcedure

Procedure CLI_S3_GetBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    // Directory bucket

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketVersioning", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBucketVersioning (DB)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);
    BasicData.Insert("URL", FunctionParameters["S3_URL"]);

    // General purpose bucket

    Name = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name" , Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir"  , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketVersioning", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetBucketVersioning", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_PutBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);
    Status    = True;

    // Directory bucket

    Name = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("basic" , BasicData);
    Options.Insert("status", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketVersioning", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutBucketVersioning (DB)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);
    BasicData.Insert("URL", FunctionParameters["S3_URL"]);

    // General purpose bucket

    Name = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("basic" , BasicData);
    Options.Insert("status", True);
    Options.Insert("dir"   , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketVersioning", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutBucketVersioning", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_PutObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data"  , Entity);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutObject", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    Name   = "fileChunked.mp3";
    Bucket = "opi-gpbucket3";
    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data

    BasicData.Insert("ChunkSize", 5242880);

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data"  , Entity);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutObject (parts)", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure CLI_S3_UploadFullObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "pictureSmall.jpg";
    Bucket = "opi-gpbucket3";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data"  , Entity);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadFullObject", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure CLI_S3_DeleteObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObject", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_HeadObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "HeadObject", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_CopyObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    SourcePath        = "picture.jpg";
    DestinationBucket = "opi-gpbucket3";

    DestinationPath = "new_picture.jpg";
    SourceBucket    = "opi-dirbucket3";

    Options = New Structure;
    Options.Insert("sname"  , SourcePath);
    Options.Insert("sbucket", DestinationBucket);
    Options.Insert("name"   , DestinationPath);
    Options.Insert("bucket" , SourceBucket);
    Options.Insert("basic"  , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "CopyObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CopyObject", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    BasicData.Insert("URL", FunctionParameters["S3_URL"]);
    OPI_S3.DeleteObject(DestinationPath, SourceBucket, BasicData);

EndProcedure

Procedure CLI_S3_PutObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";

    TagStructure = New Structure;

    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);
    Options.Insert("tagset", TagStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObjectTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "PutObjectTagging", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_GetObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";

    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObjectTagging", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_DeleteObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";

    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteObjectTagging", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteObjectTagging", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_ListObjects(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Bucket = "opi-gpbucket3";

    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListObjects", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ListObjects", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_ListObjectVersions(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Bucket = "opi-gpbucket3";
    Prefix = "pic";

    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);
    Options.Insert("prefix", Prefix);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListObjectVersions", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ListObjectVersions", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_GetObject(FunctionParameters)

    Image        = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image);
    RequiredSize = Image.Size();

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObject", "S3");
    OPI_TestDataRetrieval.Check_BinaryData(Result, RequiredSize);

    TempFile = GetTempFileName();
    BasicData.Insert("ChunkSize", 200000);

    Options.Insert("basic", BasicData);
    Options.Insert("out"  , TempFile);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObject (file)", "S3");
    OPI_TestDataRetrieval.ExpectsThat(Result.Size() = RequiredSize);
    DeleteFiles(TempFile);

    Name   = "bigfile.exe";
    Bucket = "newbucket2";

    BigTempFile = GetTempFileName();

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);
    Options.Insert("out"   , BigTempFile);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObject (big, file)", "S3");
    OPI_TestDataRetrieval.ExpectsThat(Result.Size() = 34432400);
    DeleteFiles(BigTempFile);

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObject (big, BD)", "S3");
    OPI_TestDataRetrieval.Check_BinaryData(Result, 34432400);

EndProcedure

Procedure CLI_S3_InitPartsUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "fileChunked.mp3";
    Bucket = "opi-gpbucket3";

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_Tools.Get(Entity);

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "InitPartsUpload", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    UploadID   = Result["response"]["InitiateMultipartUploadResult"]["UploadId"];
    TotalSize  = Entity.Size();
    ChunkSize  = 5242880;
    BytesRead  = 0;
    PartNumber = 1;

    DataReader   = New DataReader(Entity);
    SourceStream = DataReader.SourceStream();
    TagsArray    = New Array;

    While BytesRead < TotalSize Do

        CurrentReading = DataReader.Read(ChunkSize);
        CurrentData    = CurrentReading.GetBinaryData();

        TFN = GetTempFileName();
        CurrentData.Write(TFN);

        If CurrentData.Size() = 0 Then
            Break;
        EndIf;

        Options = New Structure;
        Options.Insert("name"   , Name);
        Options.Insert("bucket" , Bucket);
        Options.Insert("basic"  , BasicData);
        Options.Insert("upload" , UploadID);
        Options.Insert("part"   , PartNumber);
        Options.Insert("content", TFN);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "UploadObjectPart", Options);

        OPI_TestDataRetrieval.WriteLogCLI(Result, "UploadObjectPart", "S3");
        OPI_TestDataRetrieval.Check_S3Success(Result);

        BytesRead = SourceStream.CurrentPosition();

        ETag = Result["headers"]["Etag"];
        ETag = ?(ETag = Undefined, Result["headers"]["ETag"], ETag);

        TagsArray.Add(ETag);

        DeleteFiles(TFN);

        PartNumber = PartNumber + 1;

    EndDo;

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("tags"  , TagsArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "FinishPartsUpload", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "FinishPartsUpload", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure CLI_S3_AbortMultipartUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "fileChunked.mp3";
    Bucket = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);

    Start    = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);
    UploadID = Start["response"]["InitiateMultipartUploadResult"]["UploadId"];

    Options = New Structure;
    Options.Insert("name"  , Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic" , BasicData);
    Options.Insert("upload", UploadID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "AbortMultipartUpload", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AbortMultipartUpload", "S3");
    OPI_TestDataRetrieval.Check_S3Success(Result);

EndProcedure

Procedure CLI_S3_GetObjectDownloadLink(FunctionParameters)

    Image        = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image);
    RequiredSize = Image.Size();

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "picture.jpg";
    Bucket = "opi-gpbucket3";

    Options = New Structure;
    Options.Insert("name"   , Name);
    Options.Insert("bucket" , Bucket);
    Options.Insert("basic"  , BasicData);
    Options.Insert("expires", 7200);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectDownloadLink", Options);
    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObjectDownloadLink", "S3");
    OPI_TestDataRetrieval.Check_String(Result);

    Result = OPI_Tools.Get(Result);

    OPI_TestDataRetrieval.Check_BinaryData(Result, RequiredSize);

EndProcedure

Procedure CLI_S3_GetObjectUploadLink(FunctionParameters)

    Image        = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image);
    RequiredSize = Image.Size();

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url"   , URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "pictureU.jpg";
    Bucket = "newbucket2";

    Options = New Structure;
    Options.Insert("name"   , Name);
    Options.Insert("bucket" , Bucket);
    Options.Insert("basic"  , BasicData);
    Options.Insert("expires", 7200);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectUploadLink", Options);
    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObjectUploadLink", "S3");
    OPI_TestDataRetrieval.Check_String(Result);

    Result = OPI_Tools.Put(Result, Image, , False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetObjectUploadLink (PUT)", "S3");

    Check = OPI_S3.HeadObject(Name, Bucket, BasicData);
    OPI_TestDataRetrieval.WriteLogCLI(Check, "HeadObject (Upload link)", "S3");

    OPI_TestDataRetrieval.ExpectsThat(RequiredSize = Number(Check["headers"]["Content-Length"])).Равно(True);

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

#EndRegion

#Region TCP

Procedure CLI_TCP_ProcessRequest(FunctionParameters) Export

    Address = FunctionParameters["TCP_Address"];
    Data    = "Echo this!\n";

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("data"   , Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ProcessRequest", Options);

    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ProcessRequest", "TCP");
    OPI_TestDataRetrieval.Check_String(StrReplace(Result, Chars.LF, "\n"), Data);

EndProcedure

#EndRegion

#Region SQLite

Procedure CLI_SQLite_ExecuteSQLQuery(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    PictureFile = GetTempFileName("png");

    Image = FunctionParameters["Picture"];
    CopyFile(Image, PictureFile);

    Blob = New Structure("blob", PictureFile);

    QueryText = "
    |CREATE TABLE test_table (
    |id INTEGER PRIMARY KEY,
    |name TEXT,
    |age INTEGER,
    |salary REAL,
    |is_active BOOLEAN,
    |created_at DATETIME,
    |data BLOB
    |);";

    Options = New Structure;
    Options.Insert("sql", StrReplace(QueryText, Chars.LF, ""));
    Options.Insert("db" , TFN);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (Create)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    // INSERT with parameters

    QueryText = "
    |INSERT INTO test_table (name, age, salary, is_active, created_at, data)
    |VALUES (?1, ?2, ?3, ?4, ?5, ?6);";

    ParameterArray = New Array;
    ParameterArray.Add("Vitaly"); // TEXT
    ParameterArray.Add(25); // INTEGER
    ParameterArray.Add(1000.12); // REAL
    ParameterArray.Add(True); // BOOL
    ParameterArray.Add(OPI_Tools.GetCurrentDate()); // DATETIME
    ParameterArray.Add(Blob); // BLOB

    Options = New Structure;
    Options.Insert("sql"   , StrReplace(QueryText, Chars.LF, ""));
    Options.Insert("params", ParameterArray);
    Options.Insert("db"    , TFN);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (Insert)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql", StrReplace(QueryText, Chars.LF, ""));
    Options.Insert("db" , TFN);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    Blob = Result["data"][0]["data"]["blob"];

    Result["data"][0]["data"]["blob"] = "Base64";

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (Select, code)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    Image = New BinaryData(PictureFile);
    OPI_TestDataRetrieval.Check_Equality(Base64Value(Result["data"][0]["data"]["blob"]).Size(), Image.Size());

    // With extension

    Extension  = FunctionParameters["SQLite_Ext"]; // URL, Path or Binary Data
    EntryPoint = "sqlite3_uuid_init";

    ExtensionMap = New Map;
    ExtensionMap.Insert(Extension, EntryPoint);

    QueryText = "SELECT uuid4();";

    Options = New Structure;
    Options.Insert("sql" , StrReplace(QueryText, Chars.LF, ""));
    Options.Insert("db"  , TFN);
    Options.Insert("exts", ExtensionMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (extension)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);
    OPI_TestDataRetrieval.Check_Array(Result["data"], 1);

    Try
       DeleteFiles(TFN);
       DeleteFiles(PictureFile);
    Except
        OPI_TestDataRetrieval.WriteLogCLI(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

Procedure CLI_SQLite_GetTableInformation(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTableInformation", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

EndProcedure

Procedure CLI_SQLite_CreateTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("id"        , "INTEGER PRIMARY KEY");
    ColoumnsStruct.Insert("name"      , "TEXT");
    ColoumnsStruct.Insert("age"       , "INTEGER");
    ColoumnsStruct.Insert("salary"    , "REAL");
    ColoumnsStruct.Insert("is_active" , "BOOLEAN");
    ColoumnsStruct.Insert("created_at", "DATETIME");
    ColoumnsStruct.Insert("data"      , "BLOB");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols" , ColoumnsStruct);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "CreateTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTable", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    ColoumnsMap = New Map;
    ColoumnsMap.Insert("id"                 , "INTEGER PRIMARY KEY");
    ColoumnsMap.Insert("[An obscure column]", "TEXT");

    Options = New Structure;
    Options.Insert("table", "test1");
    Options.Insert("cols" , ColoumnsMap);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "CreateTable", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTable (obscure column)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

EndProcedure

Procedure CLI_SQLite_AddRecords(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    PictureFile = GetTempFileName("png");
    Image.Write(PictureFile); // PictureFile - File to disk

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    DataArray = New Array;

    RowStructure2 = New Structure;
    RowStructure2.Insert("name"      , "Vitaly"); // TEXT
    RowStructure2.Insert("age"       , 25); // INTEGER
    RowStructure2.Insert("salary"    , 1000.12); // REAL
    RowStructure2.Insert("is_active" , True); // BOOL
    RowStructure2.Insert("created_at", OPI_Tools.GetCurrentDate()); // DATETIME
    RowStructure2.Insert("data"      , New Structure("blob", PictureFile)); // BLOB

    RowStrucutre1 = New Structure;
    RowStrucutre1.Insert("name"      , "Lesha") ; // TEXT
    RowStrucutre1.Insert("age"       , 20); // INTEGER
    RowStrucutre1.Insert("salary"    , 200.20) ; // REAL
    RowStrucutre1.Insert("is_active" , False) ; // BOOL
    RowStrucutre1.Insert("created_at", OPI_Tools.GetCurrentDate()); // DATETIME
    RowStrucutre1.Insert("data"      , New Structure("blob", PictureFile)); // BLOB

    DataArray.Add(RowStructure2);
    DataArray.Add(RowStrucutre1);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows" , DataArray);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddRecords", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows" , DataArray);
    Options.Insert("trn"  , False);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddRecords (no tr)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    RowStrucutre1.Insert("error", "Lesha") ;
    DataArray.Add(RowStrucutre1);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows" , DataArray);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddRecords (field error)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteError(Result);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows" , DataArray);
    Options.Insert("trn"  , False);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddRecords (field error without tr)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteRows(Result, 1);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows" , "not valid json");
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddRecords (json error)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteError(Result);

    RowMap = New Map;
    RowMap.Insert("[An obscure column]", "yo");

    Options = New Structure;
    Options.Insert("table", "test1");
    Options.Insert("rows" , RowMap);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddRecords (obscure column)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    Try
       DeleteFiles(PictureFile);
    Except
        OPI_TestDataRetrieval.WriteLogCLI(ErrorDescription(), "Error deleting a picture file", "SQLite");
    EndTry;

EndProcedure

Procedure CLI_SQLite_GetRecords(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Fields = New Array;
    Fields.Add("name");
    Fields.Add("salary");

    Filters = New Array;

    FilterStructure1 = New Structure;

    FilterStructure1.Insert("field", "name");
    FilterStructure1.Insert("type" , "=");
    FilterStructure1.Insert("value", "Vitaly");
    FilterStructure1.Insert("union", "AND");
    FilterStructure1.Insert("raw"  , False);

    FilterStructure2 = New Structure;

    FilterStructure2.Insert("field", "age");
    FilterStructure2.Insert("type" , "BETWEEN");
    FilterStructure2.Insert("value", "20 AND 30");
    FilterStructure2.Insert("raw"  , True);

    Filters.Add(FilterStructure1);
    Filters.Add(FilterStructure2);

    Sort  = New Structure("created_at", "DESC");
    Count = 1;

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("fields", Fields);
    Options.Insert("filter", Filters);
    Options.Insert("order" , Sort);
    Options.Insert("limit" , Count);
    Options.Insert("db"    , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecords", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("fields", "['name','age','salary','is_active','created_at']");
    Options.Insert("db"    , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecords (no params)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    FilterStructure2.Insert("type" , "BEETWEEN");
    Filters.Add(FilterStructure2);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("fields", "['name','age','salary','is_active','created_at']");
    Options.Insert("filter", Filters);
    Options.Insert("db"    , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecords (error)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteError(Result);

    Options = New Structure;
    Options.Insert("table" , "test1");
    Options.Insert("db"    , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecords (obscure column)", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

EndProcedure

Procedure CLI_SQLite_UpdateRecords(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    FieldsStructure = New Structure;
    FieldsStructure.Insert("name"  , "Vitaly A.");
    FieldsStructure.Insert("salary", "999999");

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "name");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", "Vitaly");
    FilterStructure.Insert("union", "AND");
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("values", FieldsStructure);
    Options.Insert("filter", Filters);
    Options.Insert("db"    , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "UpdateRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateRecords", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    FilterStructure.Insert("value", "Vitaly A.");

    Filters = New Array;
    Filters.Add(FilterStructure);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("fields", "['name','salary']");
    Options.Insert("filter", Filters);
    Options.Insert("db"    , Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Check, "Check", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Check);
    OPI_TestDataRetrieval.Check_SQLiteFieldsValues(Check["data"][0], FieldsStructure);

EndProcedure

Procedure CLI_SQLite_DeleteRecords(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "name");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", "Vitaly A.");
    FilterStructure.Insert("union", "AND");
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("filter", FilterStructure);
    Options.Insert("db"    , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "DeleteRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteRecords", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("fields", "['name','salary']");
    Options.Insert("filter", Filters);
    Options.Insert("db"    , Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Check, "Check", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteNoRows(Check);

EndProcedure

Procedure CLI_SQLite_GetRecordsFilterStrucutre(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty" , False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecordsFilterStrucutre", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecordsFilterStrucutre", "SQLite");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options.Insert("empty" , True);
    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecordsFilterStrucutre", Options);
    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecordsFilterStrucutre (empty)", "SQLite");

    For Each Element In Result Do

        OPI_TestDataRetrieval.Check_Empty(Element.Value);

    EndDo;

EndProcedure

Procedure CLI_SQLite_DeleteTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "DeleteTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTable", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Check, "Check", "SQLite");
    OPI_TestDataRetrieval.Check_Array(Check["data"], 0);

EndProcedure

Procedure CLI_SQLite_ClearTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db"   , Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ClearTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearTable", "SQLite");
    OPI_TestDataRetrieval.Check_SQLiteSuccess(Result);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Check, "Check", "SQLite");
    OPI_TestDataRetrieval.Check_Array(Check["data"], 7);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Check, "Check", "SQLite");
    OPI_TestDataRetrieval.Check_Array(Check["data"], 0);

EndProcedure

#EndRegion

#Region PostgreSQL

Procedure CLI_PostgreSQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);
    Result = ПолучитьСтрокуИзДвоичныхДанных(Result);

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GenerateConnectionString", "PostgreSQL");
    OPI_TestDataRetrieval.Check_String(Result);
    OPI_TestDataRetrieval.Check_True(StrStartsWith(Result, "postgresql"));

EndProcedure

Procedure CLI_PostgreSQL_ExecuteSQLQuery(FunctionParameters)

    Image = FunctionParameters["Picture"];
    TFN   = GetTempFileName();
    OPI_TypeConversion.GetBinaryData(Image);
    Image.Write(TFN);

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Options = New Structure();
    Options.Insert("dbc" , ConnectionString);

    Options.Insert("table", "users");
    OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTable", Options, False);

    Options.Insert("table", "test_data");
    OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTable", Options, False);

    Options.Insert("table", "test_table");
    OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTable", Options, False);

    // CREATE

    QueryText = "
    |CREATE TABLE test_table (
    |id SERIAL PRIMARY KEY,
    |name NAME,
    |age INT,
    |salary REAL,
    |is_active BOOL,
    |created_at DATE,
    |data BYTEA
    |);";

    Options = New Structure;
    Options.Insert("sql" , StrReplace(QueryText, Chars.LF, " "));
    Options.Insert("dbc" , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (Create)", "PostgreSQL"); // SKIP
    OPI_TestDataRetrieval.Check_ResultTrue(Result); // SKIP

    // INSERT with parameters

    QueryText = "
    |INSERT INTO test_table (name, age, salary, is_active, created_at, data)
    |VALUES ($1, $2, $3, $4, $5, $6);";

    ParameterArray = New Array;
    ParameterArray.Add(New Structure("NAME" , "Vitaly"));
    ParameterArray.Add(New Structure("INT"  , 25));
    ParameterArray.Add(New Structure("REAL" , 1000.12));
    ParameterArray.Add(New Structure("BOOL" , True));
    ParameterArray.Add(New Structure("DATE" , OPI_Tools.GetCurrentDate()));
    ParameterArray.Add(New Structure("BYTEA", TFN));

    Options = New Structure;
    Options.Insert("sql"   , StrReplace(QueryText, Chars.LF, " "));
    Options.Insert("params", ParameterArray);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (Insert)", "PostgreSQL"); // SKIP
    OPI_TestDataRetrieval.Check_ResultTrue(Result); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql" , StrReplace(QueryText, Chars.LF, " "));
    Options.Insert("dbc" , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options, False);

    Blob = Result["data"][0]["data"]["BYTEA"]; // SKIP

    Result["data"][0]["data"]["BYTEA"] = "Base64"; // SKIP
    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery", "PostgreSQL"); // SKIP
    OPI_TestDataRetrieval.Check_ResultTrue(Result); // SKIP
    OPI_TestDataRetrieval.Check_Equality(Base64Value(Blob).Size(), Image.Size()); // SKIP

    // DO + Transaction

    QueryText = "DO $$
    |BEGIN
    | CREATE TABLE users (
    | id SMALLSERIAL,
    | name TEXT NOT NULL,
    | age INT NOT NULL
    | );
    | INSERT INTO users (name, age) VALUES ('Alice', 30);
    | INSERT INTO users (name, age) VALUES ('Bob', 25);
    | INSERT INTO users (name, age) VALUES ('Charlie', 35);
    | COMMIT;
    |END $$ LANGUAGE plpgsql;";

    Options = New Structure;
    Options.Insert("sql" , StrReplace(QueryText, Chars.LF, " "));
    Options.Insert("dbc" , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (Transaction)", "PostgreSQL"); // SKIP
    OPI_TestDataRetrieval.Check_ResultTrue(Result); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL"]; // Binary Data, URL or path to file

    Options = New Structure;
    Options.Insert("sql" , SQLFile);
    Options.Insert("dbc" , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExecuteSQLQuery (file)", "PostgreSQL"); // SKIP
    OPI_TestDataRetrieval.Check_ResultTrue(Result); // SKIP

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.WriteLogCLI(ErrorDescription(), "Error deleting a picture file", "PostgreSQL");
    EndTry;

EndProcedure

Procedure CLI_PostgreSQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Base = "testbase1";

    Options = New Structure();
    Options.Insert("dbc" , ConnectionString);
    Options.Insert("base", Base);

    Deletion = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteDatabase", Options, False);
    OPI_TestDataRetrieval.WriteLogCLI(Deletion, "CreateDatabase (deleting)", "PostgreSQL");

    Options = New Structure;
    Options.Insert("base" , Base);
    Options.Insert("dbc"  , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateDatabase", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDatabase", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateDatabase", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateDatabase (existing)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultFalse(Result);

EndProcedure

Procedure CLI_PostgreSQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("bool_field"       , "BOOL");
    ColoumnsStruct.Insert("oldchar_field"    , """char""");
    ColoumnsStruct.Insert("smallint_field"   , "SMALLINT");
    ColoumnsStruct.Insert("smallserial_field", "SMALLSERIAL");
    ColoumnsStruct.Insert("int_field"        , "INT");
    ColoumnsStruct.Insert("serial_field"     , "SERIAL");
    ColoumnsStruct.Insert("oid_field"        , "OID");
    ColoumnsStruct.Insert("bigint_field"     , "BIGINT");
    ColoumnsStruct.Insert("bigserial_field"  , "BIGSERIAL");
    ColoumnsStruct.Insert("real_field"       , "REAL");
    ColoumnsStruct.Insert("dp_field"         , "DOUBLE PRECISION");
    ColoumnsStruct.Insert("text_field"       , "TEXT");
    ColoumnsStruct.Insert("varchar_field"    , "VARCHAR");
    ColoumnsStruct.Insert("charn_field"      , "CHAR(3)");
    ColoumnsStruct.Insert("char_field"       , "CHAR");
    ColoumnsStruct.Insert("name_field"       , "NAME");
    ColoumnsStruct.Insert("bytea_field"      , "BYTEA");
    ColoumnsStruct.Insert("ts_field"         , "TIMESTAMP");
    ColoumnsStruct.Insert("tswtz_field"      , "TIMESTAMP WITH TIME ZONE");
    ColoumnsStruct.Insert("ip_field"         , "INET");
    ColoumnsStruct.Insert("json_field"       , "JSON");
    ColoumnsStruct.Insert("jsonb_field"      , "JSONB");
    ColoumnsStruct.Insert("date_field"       , "DATE");
    ColoumnsStruct.Insert("time_field"       , "TIME");
    ColoumnsStruct.Insert("uuid_field"       , "UUID");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols" , ColoumnsStruct);
    Options.Insert("dbc"  , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateTable", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTable", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateTable (exists)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultFalse(Result);

EndProcedure

Procedure CLI_PostgreSQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table = "testtable";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc"  , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    // END

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTableInformation", "PostgreSQL");
    OPI_TestDataRetrieval.Check_Array(Result["data"], 25);

    Table = "heyho";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc"  , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetTableInformation (error)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_Array(Result["data"], 0);

EndProcedure

Procedure CLI_PostgreSQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    TFN   = GetTempFileName();
    OPI_TypeConversion.GetBinaryData(Image);
    Image.Write(TFN);

    CasualStructure = New Structure("key,value", "ItsKey", 10);

    CurrentDate   = OPI_Tools.GetCurrentDate();
    CurrentDateTZ = OPI_Tools.DateRFC3339(CurrentDate, "+05:00");

    RecordStructure = New Structure;
    RecordStructure.Insert("bool_field"       , New Structure("BOOL"                    , True));
    RecordStructure.Insert("oldchar_field"    , New Structure("OLDCHAR"                 , 1)); // or "char"
    RecordStructure.Insert("smallint_field"   , New Structure("SMALLINT"                , 5));
    RecordStructure.Insert("smallserial_field", New Structure("SMALLSERIAL"             , 6));
    RecordStructure.Insert("int_field"        , New Structure("INT"                     , 100));
    RecordStructure.Insert("serial_field"     , New Structure("SERIAL"                  , 100));
    RecordStructure.Insert("oid_field"        , New Structure("OID"                     , 24576));
    RecordStructure.Insert("bigint_field"     , New Structure("BIGINT"                  , 9999999));
    RecordStructure.Insert("bigserial_field"  , New Structure("BIGSERIAL"               , 9999999));
    RecordStructure.Insert("real_field"       , New Structure("REAL"                    , 15.2));
    RecordStructure.Insert("dp_field"         , New Structure("DOUBLE_PRECISION"        , 1.0002)); // or DOUBLE PRECISION
    RecordStructure.Insert("text_field"       , New Structure("TEXT"                    , "Some text"));
    RecordStructure.Insert("varchar_field"    , New Structure("VARCHAR"                 , "Some varchar"));
    RecordStructure.Insert("charn_field"      , New Structure("CHAR"                    , "AAA"));
    RecordStructure.Insert("char_field"       , New Structure("CHAR"                    , "A"));
    RecordStructure.Insert("name_field"       , New Structure("NAME"                    , "Vitaly"));
    RecordStructure.Insert("bytea_field"      , New Structure("BYTEA"                   , TFN));
    RecordStructure.Insert("ts_field"         , New Structure("TIMESTAMP"               , CurrentDate));
    RecordStructure.Insert("tswtz_field"      , New Structure("TIMESTAMP_WITH_TIME_ZONE", CurrentDateTZ)); // or TIMESTAMP WITH TIME ZONE
    RecordStructure.Insert("ip_field"         , New Structure("INET"                    , "127.0.0.1"));
    RecordStructure.Insert("json_field"       , New Structure("JSON"                    , CasualStructure));
    RecordStructure.Insert("jsonb_field"      , New Structure("JSONB"                   , CasualStructure));
    RecordStructure.Insert("date_field"       , New Structure("DATE"                    , CurrentDate));
    RecordStructure.Insert("time_field"       , New Structure("TIME"                    , CurrentDate));
    RecordStructure.Insert("uuid_field"       , New Structure("UUID"                    , String(New UUID())));

    RecordsArray.Add(RecordStructure);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows" , RecordsArray);
    Options.Insert("trn"  , True);
    Options.Insert("dbc"  , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "AddRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddRecords", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.WriteLogCLI(ErrorDescription(), "Error deleting a picture file", "PostgreSQL");
    EndTry;

EndProcedure

Procedure CLI_PostgreSQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    // All records without filters

    Table = "testtable";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc"  , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    If ValueIsFilled(Result["data"]) Then // SKIP
        Result["data"][0]["bytea_field"]["BYTEA"] // SKIP
 = Left(Result["data"][0]["bytea_field"]["BYTEA"], 10) + "..."; // SKIP
    EndIf; // SKIP

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecords", "PostgreSQL"); // SKIP
    OPI_TestDataRetrieval.Check_ResultTrue(Result); // SKIP

    // Filter, selected fields, limit and sorting

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , "test_data");
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table = "test_data";

    Fields = New Array;
    Fields.Add("first_name");
    Fields.Add("last_name");
    Fields.Add("email");

    Filters = New Array;

    FilterStructure1 = New Structure;

    FilterStructure1.Insert("field", "gender");
    FilterStructure1.Insert("type" , "=");
    FilterStructure1.Insert("value", "Male");
    FilterStructure1.Insert("union", "AND");
    FilterStructure1.Insert("raw"  , False);

    FilterStructure2 = New Structure;

    FilterStructure2.Insert("field", "id");
    FilterStructure2.Insert("type" , "BETWEEN");
    FilterStructure2.Insert("value", "20 AND 50");
    FilterStructure2.Insert("raw"  , True);

    Filters.Add(FilterStructure1);
    Filters.Add(FilterStructure2);

    Sort  = New Structure("ip_address", "DESC");
    Count = 5;

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("fields", Fields);
    Options.Insert("filter", Filters);
    Options.Insert("order" , Sort);
    Options.Insert("limit" , Count);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecords (filters)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);
    OPI_TestDataRetrieval.Check_Array(Result["data"], 5);

EndProcedure

Procedure CLI_PostgreSQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table = "test_data";

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ip_address", New Structure("VARCHAR", "127.0.0.1"));

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("VARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc"   , ConnectionString);

    Count = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Count, "UpdateRecords (amount)", "PostgreSQL"); // SKIP
    Count = Count["data"].Count(); // SKIP

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("values", FieldsStructure);
    Options.Insert("filter", Filters);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "UpdateRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateRecords", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("fields", "['ip_address']");
    Options.Insert("filter", Filters);
    Options.Insert("dbc"   , ConnectionString);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Check, "UpdateRecords (check)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Check);
    OPI_TestDataRetrieval.Check_Array(Check["data"], Count);

    For N = 0 To Check["data"].UBound() Do
        OPI_TestDataRetrieval.Check_SQLiteFieldsValues(Check["data"][N], FieldsStructure);
    EndDo;

EndProcedure

Procedure CLI_PostgreSQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table = "test_data";

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("VARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);
    FilterStructure.Insert("union", "AND");

    Filters.Add(FilterStructure);

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "ip_address");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("VARCHAR", "127.0.0.1"));
    FilterStructure.Insert("raw"  , False);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc"   , ConnectionString);

    Obtaining = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteRecords", Options);
    // END

    OPI_TestDataRetrieval.WriteLogCLI(Obtaining, "DeleteRecords (get)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteRecords", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteRecords (check)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);
    OPI_TestDataRetrieval.Check_Array(Result["data"], Residue);

EndProcedure

Procedure CLI_PostgreSQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table = "testtable";

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ClearTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearTable", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ClearTable (check)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);
    OPI_TestDataRetrieval.Check_Array(Result["data"], 0);

EndProcedure

Procedure CLI_PostgreSQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Table = "testtable";

    Options = New Structure;
    Options.Insert("table" , Table);
    Options.Insert("dbc"   , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTable", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTable", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

    Base  = "test_data";
    Table = "test_data";

    Options          = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);
    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc"  , ConnectionString);
    Result  = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTable", Options, False);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteTable (test)", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

EndProcedure

Procedure CLI_PostgreSQL_DisableAllDatabaseConnections(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc" , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DisableAllDatabaseConnections", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DisableAllDatabaseConnections", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

EndProcedure

Procedure CLI_PostgreSQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    Options = New Structure;
    Options.Insert("addr" , Address);
    Options.Insert("db"   , Base);
    Options.Insert("login", Login);
    Options.Insert("pass" , Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options, False);
    ConnectionString = ПолучитьСтрокуИзДвоичныхДанных(ConnectionString);

    Base = "testbase1";

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc" , ConnectionString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteDatabase", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "DeleteDatabase", "PostgreSQL");
    OPI_TestDataRetrieval.Check_ResultTrue(Result);

EndProcedure

Procedure CLI_PostgreSQL_GetRecordsFilterStrucutre(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecordsFilterStrucutre", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecordsFilterStrucutre", "PostgreSQL");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options = New Structure;
    Options.Insert("empty", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecordsFilterStrucutre", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetRecordsFilterStrucutre (empty)", "PostgreSQL");

    For Each Element In Result Do

        OPI_TestDataRetrieval.Check_Empty(Element.Value);

    EndDo;

EndProcedure

#EndRegion

#Region GreenAPI

Procedure CLI_GreenAPI_FormAccessParameters(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "FormAccessParameters", "GreenAPI");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure CLI_GreenAPI_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettings", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetInstanceSettings", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenInstance(Result);

EndProcedure

Procedure CLI_GreenAPI_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetAccountInformation", Options);

    Try
        Result["deviceId"] = "***";
        Result["phone"]    = "***";
    Except
        Message("Failed to replace the secrets!");
    EndTry;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAccountInformation", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenProfile(Result);

EndProcedure

Procedure CLI_GreenAPI_GetInstanceSettingsStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("empty", False);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettingsStructure", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetInstanceSettingsStructure", "GreenAPI");
    OPI_TestDataRetrieval.Check_Map(Result);

    Options = New Structure;
    Options.Insert("empty", True);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettingsStructure", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetInstanceSettingsStructure (empty)", "GreenAPI");

    For Each Element In Result Do

        If OPI_Tools.IsPrimitiveType(Element.Value) Then
            OPI_TestDataRetrieval.Check_Empty(Element.Value);
        EndIf;

    EndDo;

EndProcedure

Procedure CLI_GreenAPI_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("pollMessageWebhook"   , "yes");
    SettingsStructure.Insert("incomingBlockWebhook" , "no");
    SettingsStructure.Insert("incomingCallWebhook"  , "no");
    SettingsStructure.Insert("editedMessageWebhook" , "yes");
    SettingsStructure.Insert("deletedMessageWebhook", "yes");

    Options = New Structure;
    Options.Insert("settings", SettingsStructure);
    Options.Insert("access"  , AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetInstanceSettings", Options);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetInstanceSettings", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenSettingsSaving(Result);

EndProcedure

Procedure CLI_GreenAPI_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceStatus", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetInstanceStatus", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenAuth(Result);

EndProcedure

Procedure CLI_GreenAPI_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "RebootInstance", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "RebootInstance", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenReboot(Result);

EndProcedure

Procedure CLI_GreenAPI_GetQR(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetQR", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "GetQR", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenAuth(Result);

EndProcedure

Procedure CLI_GreenAPI_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "LogoutInstance", Options);

    OPI_TestDataRetrieval.WriteLog(Result, "LogoutInstance", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenReboot(Result);

EndProcedure

Procedure CLI_GreenAPI_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    PhoneNumber = 441234567890;

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("phone" , PhoneNumber);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetAuthorizationCode", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetAuthorizationCode", "GreenAPI");

EndProcedure

Procedure CLI_GreenAPI_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access" , AccessParameters);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetProfilePicture", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "SetProfilePicture", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenAva(Result);

EndProcedure

Procedure CLI_GreenAPI_CreateGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Name = "New group";

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("name"  , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "CreateGroup", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "CreateGroup", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenNewGroup(Result);

    GroupID = Result["chatId"];
    OPI_TestDataRetrieval.WriteParameter("GreenAPI_GroupID", GroupID);
    OPI_Tools.AddField("GreenAPI_GroupID", GroupID, "String", FunctionParameters);

EndProcedure

Procedure CLI_GreenAPI_LeaveGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group" , GroupID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "LeaveGroup", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "LeaveGroup", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenLeaveGroup(Result);

EndProcedure

Procedure CLI_GreenAPI_GetGroupInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group" , GroupID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetGroupInformation", Options);

    Try
        Result["owner"]                 = "***";
        Result["participants"][0]["id"] = "***";
    Except
        Message("Failed to replace the secrets!");
    EndTry;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "GetGroupInformation", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenGroup(Result);

EndProcedure

Procedure CLI_GreenAPI_UpdateGroupName(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    Name    = "New name";

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group" , GroupID);
    Options.Insert("name"  , Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "UpdateGroupName", Options);

    OPI_TestDataRetrieval.WriteLogCLI(Result, "UpdateGroupName", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenGroupName(Result);

EndProcedure

Procedure CLI_GreenAPI_AddGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api"  , ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id"   , IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group" , GroupID);
    Options.Insert("user"  , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "AddGroupMember", Options);

    Try
        Result["addParticipant"] = True;
    Except
        Message("Failed to replace the secrets!");
    EndTry;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "AddGroupMember", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenAddMember(Result);

EndProcedure

Procedure CLI_GreenAPI_ExcludeGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    AccessParameters = OPI_GreenAPI.FormAccessParameters(ApiUrl, MediaUrl, IdInstance, ApiTokenInstance);

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group" , GroupID);
    Options.Insert("user"  , UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ExcludeGroupMember", Options);

    Try
        Result["removeParticipant"] = True;
    Except
        Message("Failed to replace the secrets!");
    EndTry;

    OPI_TestDataRetrieval.WriteLogCLI(Result, "ExcludeGroupMember", "GreenAPI");
    OPI_TestDataRetrieval.Check_GreenExcludeMember(Result);

EndProcedure

#EndRegion

#EndRegion

#EndRegion
