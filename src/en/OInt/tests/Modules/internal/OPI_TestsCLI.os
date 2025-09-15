﻿// OneScript: ./OInt/tests/Modules/internal/OPI_TestsCLI.os

// MIT License

// Copyright (c) 2023-2025 Anton Tsitavets

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
// BSLLS:UnreachableCode-off
// BSLLS:UnusedLocalMethod-off
// BSLLS:NestedFunctionInParameters-off
// BSLLS:MissingTemporaryFileDeletion-off
// BSLLS:UsingSynchronousCalls-off
// BSLLS:MagicNumber-off
// BSLLS:MagicDate-off

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

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTestsCLI();

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

    Return OPI_TestDataRetrieval.FormAssertsTestsCLI();

EndFunction

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

#EndRegion

#Region VK

Procedure VKAPI_CreateTokenLink() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VK_AppID", TestParameters);

    VK_CreateTokenRetrievalLink(TestParameters);

EndProcedure

Procedure VKAPI_CreateDeletePost() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);

    VK_CreatePost(TestParameters);
    VK_DeletePost(TestParameters);

EndProcedure

Procedure VKAPI_CreateCompositePost() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"  , TestParameters);

    VK_CreateCompositePost(TestParameters);

EndProcedure

Procedure VKAPI_CreatePoll() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);

    VK_CreatePoll(TestParameters);

EndProcedure

Procedure VKAPI_SaveDeleteImage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);

    VK_CreateAlbum(TestParameters);
    VK_SaveImageToAlbum(TestParameters);
    VK_DeleteImage(TestParameters);
    VK_DeleteAlbum(TestParameters);
    VK_UploadPhotoToServer(TestParameters);

EndProcedure

Procedure VKAPI_CreateStory() Export

    TestParameters = New Map;
    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);

    VK_CreateStory(TestParameters);

EndProcedure

Procedure VKAPI_DiscussionMethods() Export

    TestParameters = New Structure;
    Parameters     = GetVKParameters();

    VK_CreateDiscussion(TestParameters);
    VK_CloseDiscussion(TestParameters);
    VK_OpenDiscussion(TestParameters);
    VK_WriteInDiscussion(TestParameters);

    OPI_VK.CloseDiscussion(TestParameters["VK_ConvID"], True, Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_LikeRepostComment() Export

    TestParameters = New Structure;
    Parameters     = GetVKParameters();
    Text           = "Post from autotest";

    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    PostID = Result["response"]["post_id"];

    OPI_TestDataRetrieval.WriteParameter("VK_PostID", PostID);
    OPI_TestDataRetrieval.ParameterToCollection("VK_PostID", TestParameters);

    VK_LikePost(TestParameters);
    VK_MakeRepost(TestParameters);
    VK_WriteComment(TestParameters);
    VK_ShortenLink(TestParameters);

    OPI_VK.DeletePost(PostID                  , Parameters);
    OPI_VK.DeletePost(TestParameters["Repost"], Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_GetStatistics() Export

    TestParameters = New Structure;

    VK_GetStatistics(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_GetPostStatistics() Export

    TestParameters = New Structure;

    VK_GetPostStatistics(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_CreateAdCampaign() Export

    Parameters = GetVKParameters();
    Text       = "Post from autotest";

    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    PostID = Result["response"]["post_id"];

    OPI_TestDataRetrieval.WriteParameter("VK_PostID", PostID);

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VK_AdsCabinetID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VK_PostID"      , TestParameters);

    VK_CreateAdvertisingCampaign(TestParameters);
    VK_CreateAd(TestParameters);
    VK_PauseAdvertising(TestParameters);
    VK_GetAdvertisingCategoryList(TestParameters);

    OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_SendMessage() Export

    TestParameters = New Structure;

    OPI_TestDataRetrieval.ParameterToCollection("VK_UserID"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VK_CommunityToken", TestParameters);

    VK_FormKeyboard(TestParameters);
    VK_WriteMessage(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_GetProductCategories() Export

    TestParameters = New Structure;

    VK_GetProductCategoryList(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_CreateProductSelection() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);

    VK_CreateProductCollection(TestParameters);
    VK_EditProductCollection(TestParameters);
    VK_GetSelectionsByID(TestParameters);
    VK_AddProduct(TestParameters);
    VK_EditProduct(TestParameters);
    VK_AddProductToCollection(TestParameters);
    VK_RemoveProductFromSelection(TestParameters);
    VK_DeleteProduct(TestParameters);
    VK_DeleteSelection(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_CreateProductWithProperties() Export

    Parameters = GetVKParameters();

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);

    VK_GetProductDescription(TestParameters);
    VK_CreateProductProperty(TestParameters);
    VK_EditProductProperty(TestParameters);
    VK_AddProductPropertyVariant(TestParameters);
    VK_EditProductPropertyVariant(TestParameters);
    VK_CreateProductWithProp(TestParameters);
    VK_GetProductsByID(TestParameters);
    VK_GroupProducts(TestParameters);

    OPI_VK.DeleteProduct(TestParameters["VK_MarketItemID2"], Parameters);
    OPI_VK.DeleteProduct(TestParameters["VK_MarketItemID3"], Parameters);

    VK_DeleteProductPropertyVariant(TestParameters);
    VK_DeleteProductProperty(TestParameters);

EndProcedure

Procedure VKAPI_GetProductList() Export

    TestParameters = New Structure;

    VK_GetProductList(TestParameters);

EndProcedure

Procedure VKAPI_GetSelectionList() Export

    TestParameters = New Structure;

    VK_GetSelectionList(TestParameters);

EndProcedure

Procedure VKAPI_GetPropertyList() Export

    TestParameters = New Structure;

    VK_GetPropertyList(TestParameters);

EndProcedure

Procedure VKAPI_GetOrderList() Export

    TestParameters = New Structure;

    VK_GetOrderList(TestParameters);

EndProcedure

Procedure VKAPI_UploadVideo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Video", TestParameters);

    VK_UploadVideoToServer(TestParameters);

EndProcedure

#EndRegion

#Region YandexDisk

Procedure YDisk_GetDiskInfo() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_GetDiskInformation(TestParameters);

EndProcedure

Procedure YDisk_CreateFolder() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_CreateFolder(TestParameters);

EndProcedure

Procedure YDisk_UploadByUrlAndGetObject() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    YandexDisk_UploadFileByURL(TestParameters);
    YandexDisk_GetObject(TestParameters);
    YandexDisk_DeleteObject(TestParameters);

EndProcedure

Procedure YDisk_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"         , TestParameters);

    YandexDisk_UploadFile(TestParameters);

EndProcedure

Procedure YDisk_CreateObjectCopy() Export

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

    YandexDisk_CreateObjectCopy(TestParameters);

    CopyPath = TestParameters["YandexDisk_CopyFilePath"];

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, CopyPath    , False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_GetDownloadLink() Export

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

    YandexDisk_GetDownloadLink(TestParameters);
    YandexDisk_DownloadFile(TestParameters);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure YDisk_GetFileList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_GetFilesList(TestParameters);

EndProcedure

Procedure YDisk_MoveObject() Export

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

    YandexDisk_MoveObject(TestParameters);

    NewPath = TestParameters["YandexDisk_NewFilePath"];

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);
    OPI_YandexDisk.DeleteObject(Token, NewPath     , False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_PublicObjectActions() Export

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

    YandexDisk_PublishObject(TestParameters);
    YandexDisk_GetDownloadLinkForPublicObject(TestParameters);
    YandexDisk_GetPublicObject(TestParameters);
    YandexDisk_SavePublicObjectToDisk(TestParameters);
    YandexDisk_CancelObjectPublication(TestParameters);

    OPI_YandexDisk.DeleteObject(Token, OriginalPath, False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YDisk_GetPublishedList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("YandexDisk_Token", TestParameters);

    YandexDisk_GetPublishedObjectsList(TestParameters);

EndProcedure

#EndRegion

#Region Viber

Procedure Viber_DataRetrieval() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelToken"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelAdminID", TestParameters);

    Return;

    //@skip-check unreachable-statements
    // BSLLS:UnreachableCode-off

    Viber_GetChannelInformation(TestParameters);
    Viber_GetUserData(TestParameters);
    Viber_GetOnlineUsers(TestParameters);
    Viber_SetWebhook(TestParameters);

    // BSLLS:UnreachableCode-on

EndProcedure

Procedure Viber_MessagesSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelToken"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_ChannelAdminID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_Token"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Viber_UserID"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"            , TestParameters);

    Viber_CreateKeyboardFromArrayButton(TestParameters);

    Return;

    //@skip-check unreachable-statement
    // BSLLS:UnreachableCode-off

    Viber_SendTextMessage(TestParameters);
    Viber_SendImage(TestParameters);
    Viber_SendFile(TestParameters);
    Viber_SendContact(TestParameters);
    Viber_SendLocation(TestParameters);
    Viber_SendLink(TestParameters);

    // BSLLS:UnreachableCode-on

EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure GW_Auth() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ServiceData" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Access_Token"       , TestParameters);

    GoogleWorkspace_FormCodeRetrievalLink(TestParameters);
    GoogleWorkspace_GetTokenByCode(TestParameters);
    GoogleWorkspace_RefreshToken(TestParameters);
    GoogleWorkspace_GetServiceAccountToken(TestParameters);

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure GC_GetCalendarList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleCalendar_GetCalendarList(TestParameters);

EndProcedure

Procedure GC_CreateDeleteCalendar() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleCalendar_CreateCalendar(TestParameters);
    GoogleCalendar_EditCalendarMetadata(TestParameters);
    GoogleCalendar_GetCalendarMetadata(TestParameters);
    GoogleCalendar_AddCalendarToList(TestParameters);
    GoogleCalendar_EditListCalendar(TestParameters);
    GoogleCalendar_GetListCalendar(TestParameters);
    GoogleCalendar_ClearMainCalendar(TestParameters);
    GoogleCalendar_DeleteCalendarFromList(TestParameters);
    GoogleCalendar_DeleteCalendar(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GC_CreateDeleteEvent() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_NewCalendarID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_CalendarID"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"            , TestParameters);

    GoogleCalendar_CreateCalendar(TestParameters);
    GoogleCalendar_CreateEvent(TestParameters);
    GoogleCalendar_EditEvent(TestParameters);
    GoogleCalendar_GetEvent(TestParameters);
    GoogleCalendar_MoveEvent(TestParameters);
    GoogleCalendar_GetEventList(TestParameters);
    GoogleCalendar_GetEventDescription(TestParameters);
    GoogleCalendar_DeleteEvent(TestParameters);
    GoogleCalendar_DeleteCalendar(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleDrive

Procedure GD_GetCatalogList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleDrive_GetDirectoriesList(TestParameters);
    GoogleDrive_GetObjectInformation(TestParameters);

EndProcedure

Procedure GD_UploadDeleteFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Big"         , TestParameters);

    TestParameters.Insert("ArrayOfDeletions", New Array);

    GoogleDrive_UploadFile(TestParameters);
    GoogleDrive_CopyObject(TestParameters);
    GoogleDrive_DownloadFile(TestParameters);
    GoogleDrive_UpdateFile(TestParameters);
    GoogleDrive_GetFilesList(TestParameters);
    GoogleDrive_DeleteObject(TestParameters);
    GoogleDrive_GetFileDescription(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GD_CreateDeleteComment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);

    TestParameters.Insert("ArrayOfDeletions", New Array);

    GoogleDrive_UploadFile(TestParameters);

    GoogleDrive_CreateComment(TestParameters);
    GoogleDrive_GetComment(TestParameters);
    GoogleDrive_GetCommentList(TestParameters);
    GoogleDrive_DeleteComment(TestParameters);

    GoogleDrive_DeleteObject(TestParameters);

EndProcedure

Procedure GD_CreateCatalog() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GD_Catalog"  , TestParameters);

    GoogleDrive_CreateFolder(TestParameters);

EndProcedure

#EndRegion

#Region GoogleSheets

Procedure GT_CreateTable() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleSheets_CreateSpreadsheet(TestParameters);
    GoogleSheets_GetSpreadsheet(TestParameters);
    GoogleSheets_CopySheet(TestParameters);
    GoogleSheets_AddSheet(TestParameters);
    GoogleSheets_DeleteSheet(TestParameters);
    GoogleSheets_EditSpreadsheetTitle(TestParameters);
    GoogleSheets_GetTable(TestParameters);

    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet"]);
    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet2"]);

EndProcedure

Procedure GT_FillClearCells() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token", TestParameters);

    GoogleSheets_CreateSpreadsheet(TestParameters);
    GoogleSheets_SetCellValues(TestParameters);
    GoogleSheets_GetCellValues(TestParameters);
    GoogleSheets_ClearCells(TestParameters);

    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet"]);
    OPI_GoogleDrive.DeleteObject(TestParameters["Google_Token"], TestParameters["GS_Spreadsheet2"]);

EndProcedure

#EndRegion

#Region Twitter

Procedure TwitterAPI_AccountData() Export

    TestParameters = New Structure;

    Twitter_GetToken(TestParameters);
    Twitter_GetAuthorizationLink(TestParameters);
    Twitter_RefreshToken(TestParameters);

EndProcedure

Procedure TwitterAPI_Tweets() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GIF"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"   , TestParameters);

    Twitter_CreateTextTweet(TestParameters);
    Twitter_UploadAttachmentsArray(TestParameters);
    Twitter_CreateVideoTweet(TestParameters);
    Twitter_CreateImageTweet(TestParameters);
    Twitter_CreateGifTweet(TestParameters);
    Twitter_CreatePollTweet(TestParameters);
    Twitter_CreateCustomTweet(TestParameters);

EndProcedure

#EndRegion

#Region Notion

Procedure NotionAPI_CreatePage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"     , TestParameters);

    Notion_CreatePage(TestParameters);
    Notion_GetPage(TestParameters);
    Notion_EditPageProperties(TestParameters);

EndProcedure

Procedure NotionAPI_CreateUpdateBase() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);

    Notion_CreateDatabase(TestParameters);
    Notion_EditDatabaseProperties(TestParameters);
    Notion_GetDatabase(TestParameters);
    Notion_CreatePageInDatabase(TestParameters);

EndProcedure

Procedure NotionAPI_CreateDeleteBlock() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Parent", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Block" , TestParameters);

    Notion_ReturnBlock(TestParameters);
    Notion_CreateBlock(TestParameters);
    Notion_ReturnChildBlocks(TestParameters);
    Notion_DeleteBlock(TestParameters);

EndProcedure

Procedure NotionAPI_GetUsers() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Notion_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Notion_User" , TestParameters);

    Notion_UserList(TestParameters);
    Notion_GetUserData(TestParameters);

EndProcedure

#EndRegion

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

#EndRegion

#Region Airtable

Procedure AT_CreateDatabase() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Workspace", TestParameters);

    Airtable_CreateDatabase(TestParameters);
    Airtable_GetDatabaseTables(TestParameters);
    Airtable_GetListOfBases(TestParameters);

EndProcedure

Procedure AT_CreateTable() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);

    Airtable_GetNumberField(TestParameters);
    Airtable_GetStringField(TestParameters);
    Airtable_GetAttachmentField(TestParameters);
    Airtable_GetCheckboxField(TestParameters);
    Airtable_GetDateField(TestParameters);
    Airtable_GetPhoneField(TestParameters);
    Airtable_GetEmailField(TestParameters);
    Airtable_GetLinkField(TestParameters);
    Airtable_CreateTable(TestParameters);
    Airtable_ModifyTable(TestParameters);

EndProcedure

Procedure AT_CreateField() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Table", TestParameters);

    Airtable_CreateField(TestParameters);
    Airtable_ModifyField(TestParameters);

EndProcedure

Procedure AT_CreateDeleteRecords() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Base" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Airtable_Table", TestParameters);

    Airtable_CreatePosts(TestParameters);
    Airtable_GetRecord(TestParameters);
    Airtable_CreateComment(TestParameters);
    Airtable_EditComment(TestParameters);
    Airtable_GetComments(TestParameters);
    Airtable_DeleteComment(TestParameters);
    Airtable_GetListOfRecords(TestParameters);
    Airtable_DeleteRecords(TestParameters);

EndProcedure

#EndRegion

#Region Dropbox

Procedure DropboxAPI_GetUpdateToken() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Appkey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Appsecret", TestParameters);

    Dropbox_GetAuthorizationLink(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Code", TestParameters);

    Dropbox_GetToken(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Refresh", TestParameters);

    Dropbox_RefreshToken(TestParameters);

EndProcedure

Procedure DropboxAPI_UploadFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Big"          , TestParameters);

    Dropbox_UploadFile(TestParameters);
    Dropbox_GetObjectInformation(TestParameters);
    Dropbox_GetObjectVersionList(TestParameters);
    Dropbox_RestoreObjectToVersion(TestParameters);
    Dropbox_GetPreview(TestParameters);
    Dropbox_DownloadFile(TestParameters);
    Dropbox_MoveObject(TestParameters);
    Dropbox_CopyObject(TestParameters);
    Dropbox_DeleteObject(TestParameters);

EndProcedure

Procedure DropboxAPI_CreateFolder() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_CreateFolder(TestParameters);
    Dropbox_DownloadFolder(TestParameters);

EndProcedure

Procedure DropboxAPI_GetFolderFileList() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_GetListOfFolderFiles(TestParameters);

EndProcedure

Procedure DropboxAPI_UploadFileByURL() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"     , TestParameters);

    Dropbox_UploadFileByURL(TestParameters);
    Dropbox_GetUploadStatusByURL(TestParameters);

EndProcedure

Procedure DropboxAPI_CreateDeleteTag() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_AddTag(TestParameters);
    Dropbox_GetTagList(TestParameters);
    Dropbox_DeleteTag(TestParameters);

EndProcedure

Procedure DropboxAPI_GetAccount() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);

    Dropbox_GetAccountInformation(TestParameters);
    Dropbox_GetSpaceUsageData(TestParameters);

EndProcedure

Procedure DropboxAPI_AccessManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_OtherUser", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_FileID"   , TestParameters);

    Dropbox_AddUsersToFile(TestParameters);
    Dropbox_PublishFolder(TestParameters);
    Dropbox_AddUsersToFolder(TestParameters);
    Dropbox_CancelFolderPublication(TestParameters);
    Dropbox_GetAsynchronousChangeStatus(TestParameters);
    Dropbox_CancelFilePublication(TestParameters);

EndProcedure

#EndRegion

#Region Bitrix24

Procedure B24_TokenManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_ClientSecret", TestParameters);

    Bitrix24_GetAppAuthLink(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Code", TestParameters);

    Bitrix24_GetToken(TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Refresh", TestParameters);

    Bitrix24_RefreshToken(TestParameters);

EndProcedure

Procedure B24_ServerTime() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_ServerTime(TestParameters);

EndProcedure

Procedure B24_PostsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);

    Bitrix24_CreatePost(TestParameters);
    Bitrix24_UpdatePost(TestParameters);
    Bitrix24_GetImportantPostViewers(TestParameters);
    Bitrix24_GetPosts(TestParameters);
    Bitrix24_AddPostComment(TestParameters);
    Bitrix24_AddPostRecipients(TestParameters);
    Bitrix24_DeletePost(TestParameters);

EndProcedure

Procedure B24_TaskManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_UserID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);

    Bitrix24_GetTaskFieldsStructure(TestParameters);
    Bitrix24_CreateTask(TestParameters);
    Bitrix24_CreateTasksDependencies(TestParameters);
    Bitrix24_DeleteTasksDependencies(TestParameters);
    Bitrix24_UpdateTask(TestParameters);
    Bitrix24_GetTask(TestParameters);
    Bitrix24_MuteTask(TestParameters);
    Bitrix24_UnmuteTask(TestParameters);
    Bitrix24_AddTaskToFavorites(TestParameters);
    Bitrix24_RemoveTaskFromFavorites(TestParameters);
    Bitrix24_DelegateTask(TestParameters);
    Bitrix24_DeferTask(TestParameters);
    Bitrix24_CompleteTask(TestParameters);
    Bitrix24_DisapproveTask(TestParameters);
    Bitrix24_ApproveTask(TestParameters);
    Bitrix24_RenewTask(TestParameters);
    Bitrix24_StartTask(TestParameters);
    Bitrix24_StartWatchingTask(TestParameters);
    Bitrix24_StopWatchingTask(TestParameters);
    Bitrix24_PauseTask(TestParameters);
    Bitrix24_GetTaskHistory(TestParameters);
    Bitrix24_GetTasksList(TestParameters);
    Bitrix24_CheckTaskAccesses(TestParameters);
    Bitrix24_AddTasksChecklistElement(TestParameters);
    Bitrix24_UpdateTasksChecklistElement(TestParameters);
    Bitrix24_GetTasksChecklist(TestParameters);
    Bitrix24_GetTasksChecklistElement(TestParameters);
    Bitrix24_CompleteTasksChecklistElement(TestParameters);
    Bitrix24_RenewTasksChecklistElement(TestParameters);
    Bitrix24_DeleteTasksChecklistElement(TestParameters);
    Bitrix24_GetDailyPlan(TestParameters);
    Bitrix24_GetTasksFilterStructure(TestParameters);

    Name          = "Topic picture.jpg";
    Image         = TestParameters["Picture"];
    DestinationID = 3;

    URL = TestParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID);
    FileID = Result["result"]["ID"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_TaskFileID", FileID);
    TestParameters.Insert("Bitrix24_TaskFileID", FileID);

    Bitrix24_AttachFileToTopic(TestParameters);

    OPI_Bitrix24.DeleteFile(URL, FileID);

    Bitrix24_DeleteTask(TestParameters);

EndProcedure

Procedure B24_WorkingWithDrive() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);

    Bitrix24_GetStoragesList(TestParameters);
    Bitrix24_GetAppStorage(TestParameters);
    Bitrix24_RenameStorage(TestParameters);
    Bitrix24_GetStorage(TestParameters);
    Bitrix24_UploadFileToStorage(TestParameters);
    Bitrix24_GetStorageObjects(TestParameters);
    Bitrix24_GetFileInformation(TestParameters);
    Bitrix24_GetFileExternalLink(TestParameters);
    Bitrix24_RenameFile(TestParameters);
    Bitrix24_MarkFileAsDeleted(TestParameters);
    Bitrix24_RestoreFile(TestParameters);
    Bitrix24_CreateStorageFolder(TestParameters);
    Bitrix24_RenameFolder(TestParameters);
    Bitrix24_GetFolderInformation(TestParameters);
    Bitrix24_GetFolderExternalLink(TestParameters);
    Bitrix24_CreateSubfolder(TestParameters);
    Bitrix24_MoveFileToFolder(TestParameters);
    Bitrix24_MakeFolderCopy(TestParameters);
    Bitrix24_UploadFileToFolder(TestParameters);
    Bitrix24_MakeFileCopy(TestParameters);
    Bitrix24_DeleteFile(TestParameters);
    Bitrix24_GetFolderFilterStructure(TestParameters);
    Bitrix24_GetFolderItems(TestParameters);
    Bitrix24_MoveFolder(TestParameters);
    Bitrix24_MarkFolderAsDeleted(TestParameters);
    Bitrix24_RestoreFolder(TestParameters);
    Bitrix24_DeleteFolder(TestParameters);

EndProcedure

Procedure B24_CommentsManagement() Export

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

    Bitrix24_AddTaskComment(TestParameters);
    Bitrix24_UpdateTaskComment(TestParameters);
    Bitrix24_CreateResultFromComment(TestParameters);
    Bitrix24_GetResultsList(TestParameters);
    Bitrix24_DeleteResultFromComment(TestParameters);
    Bitrix24_GetTaskCommentsList(TestParameters);
    Bitrix24_GetTaskComment(TestParameters);
    Bitrix24_DeleteTaskComment(TestParameters);
    Bitrix24_GetCommentStructure(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

EndProcedure

Procedure B24_Timekeeping() Export

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

    Bitrix24_AddTaskTimeAccounting(TestParameters);
    Bitrix24_GetTaskTimeAccounting(TestParameters);
    Bitrix24_GetTaskTimeAccountingList(TestParameters);
    Bitrix24_UpdateTaskTimeAccounting(TestParameters);
    Bitrix24_DeleteTaskTimeAccounting(TestParameters);
    Bitrix24_StartTimekeeping(TestParameters);
    Bitrix24_PauseTimekeeping(TestParameters);
    Bitrix24_GetTimekeepingStatus(TestParameters);
    Bitrix24_StopTimekeeping(TestParameters);
    Bitrix24_GetTimekeepingSettings(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

EndProcedure

Procedure B24_Kanban() Export

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

    Bitrix24_AddKanbanStage(TestParameters);
    Bitrix24_GetKanbanStages(TestParameters);
    Bitrix24_MoveTaskToKanbanStage(TestParameters);
    Bitrix24_UpdateKanbansStage(TestParameters);

    OPI_Bitrix24.DeleteTask(URL, TaskID);

    Bitrix24_DeleteKanbanStage(TestParameters);

EndProcedure

Procedure B24_ChatManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"       , TestParameters);

    Bitrix24_GetUserStatus(TestParameters);
    Bitrix24_SetUserStatus(TestParameters);
    Bitrix24_GetUsers(TestParameters);
    Bitrix24_CreateChat(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_GetChatUsers(TestParameters);
    Bitrix24_DeleteUserFromChat(TestParameters);
    Bitrix24_AddUsersToChat(TestParameters);
    Bitrix24_ChangeChatTitle(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_ChangeChatColor(TestParameters);
    Bitrix24_ChangeChatPicture(TestParameters);
    Bitrix24_DisableChatNotifications(TestParameters);
    Bitrix24_EnableChatNotifications(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_GetChatMessagesList(TestParameters);
    Bitrix24_MarkMessageAsReaded(TestParameters);
    Bitrix24_MarkMessageAsUnreaded(TestParameters);
    Bitrix24_GetDialog(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_GetChatMembersList(TestParameters);
    Bitrix24_SendWritingNotification(TestParameters);
    Bitrix24_SendMessage(TestParameters);
    Bitrix24_EditMessage(TestParameters);
    Bitrix24_GetPictureBlock(TestParameters);
    Bitrix24_GetFileBlock(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_SetMessageReaction(TestParameters);
    Bitrix24_DeleteMessage(TestParameters);
    Bitrix24_GetChatFilesFolder(TestParameters);
    Bitrix24_SendFile(TestParameters);

    OPI_Tools.Pause(5);

    Bitrix24_ReadAll(TestParameters);
    Bitrix24_ChangeChatOwner(TestParameters);
    Bitrix24_LeaveChat(TestParameters);

    Bitrix24_GetChatStructure(TestParameters);

EndProcedure

Procedure B24_NotificationsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Document"       , TestParameters);

    Bitrix24_CreatePersonalNotification(TestParameters);
    Bitrix24_CreateSystemNotification(TestParameters);
    Bitrix24_DeleteNotification(TestParameters);

EndProcedure

Procedure B24_TasksFieldsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token"          , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_HookTaskFieldID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_TaskFieldID"    , TestParameters);

    Bitrix24_AddCustomTaskField(TestParameters);
    Bitrix24_UpdateCustomTaskField(TestParameters);
    Bitrix24_GetCustomTaskField(TestParameters);
    Bitrix24_GetCustomTaskFieldsList(TestParameters);
    Bitrix24_DeleteCustomTaskField(TestParameters);

EndProcedure

Procedure B24_DepartmentsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_CreateDepartment(TestParameters);
    Bitrix24_GetDepartments(TestParameters);
    Bitrix24_UpdateDepartment(TestParameters);
    Bitrix24_DeleteDepartment(TestParameters);

EndProcedure

Procedure B2_UsersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_GetCurrentUser(TestParameters);
    Bitrix24_GetUserFieldsStructure(TestParameters);
    Bitrix24_CreateUser(TestParameters);
    Bitrix24_FindUsers(TestParameters);
    Bitrix24_UpdateUser(TestParameters);
    Bitrix24_GetUser(TestParameters);
    Bitrix24_ChangeUserStatus(TestParameters);
    Bitrix24_GetUserFilterStructure(TestParameters);

EndProcedure

Procedure B24_LeadsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_GetLeadsList(TestParameters);
    Bitrix24_GetLeadFilterStructure(TestParameters);
    Bitrix24_GetLeadStructure(TestParameters);
    Bitrix24_CreateLead(TestParameters);
    Bitrix24_GetLead(TestParameters);
    Bitrix24_UpdateLead(TestParameters);
    Bitrix24_DeleteLead(TestParameters);

EndProcedure

Procedure B24_DealsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_GetDealsFilterStructure(TestParameters);
    Bitrix24_GetDealStructure(TestParameters);
    Bitrix24_CreateDeal(TestParameters);
    Bitrix24_GetDeal(TestParameters);
    Bitrix24_UpdateDeal(TestParameters);
    Bitrix24_DeleteDeal(TestParameters);
    Bitrix24_GetDealsList(TestParameters);

EndProcedure

Procedure B24_CalendarsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_CreateCalendar(TestParameters);
    Bitrix24_UpdateCalendar(TestParameters);
    Bitrix24_GetCalendarList(TestParameters);
    Bitrix24_CreateCalendarEvent(TestParameters);
    Bitrix24_SetUserParticipationStatus(TestParameters);
    Bitrix24_GetUserParticipationStatus(TestParameters);
    Bitrix24_GetCalendarEvent(TestParameters);
    Bitrix24_GetCalendarEvents(TestParameters);
    Bitrix24_UpdateCalendarEvent(TestParameters);
    Bitrix24_GetUserBusy(TestParameters);
    Bitrix24_DeleteCalendarEvent(TestParameters);
    Bitrix24_DeleteCalendar(TestParameters);
    Bitrix24_GetCustomCalendarSettings(TestParameters);
    Bitrix24_SetCustomCalendarSettings(TestParameters);
    Bitrix24_GetCalendarStructure(TestParameters);
    Bitrix24_GetCalendarSettingsStructure(TestParameters);
    Bitrix24_GetCalednarCustomSettingsStructure(TestParameters);
    Bitrix24_GetCalendarEventsStructure(TestParameters);
    Bitrix24_GetCalendarEventsFilterStructure(TestParameters);

EndProcedure

#EndRegion

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

#EndRegion

#Region OzonSeller

Procedure OzonAPI_AttributesAndFeatures() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"  , TestParameters);

    Ozon_GetCategoriesAndProductTypesTree(TestParameters);
    Ozon_GetCategoryAttributes(TestParameters);
    Ozon_GetAttributeValues(TestParameters);
    Ozon_SearchAttributeValue(TestParameters);
    Ozon_GetProductsRequestsLimits(TestParameters);

EndProcedure

Procedure OzonAPI_UploadingAndUpdatingProducts() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"     , TestParameters);

    Ozon_GetProductStructure(TestParameters);
    Ozon_CreateUpdateProducts(TestParameters);
    Ozon_GetProductCreationStatus(TestParameters);
    Ozon_AddProductVideo(TestParameters);
    Ozon_AddProductVideoCover(TestParameters);
    Ozon_CompleteComplexAttribute(TestParameters);
    Ozon_CreateProductByOzonID(TestParameters);
    Ozon_GetSimplifiedProductStructure(TestParameters);
    Ozon_GetAttributesUpdateStructure(TestParameters);
    Ozon_UpdateProductsAttributes(TestParameters);
    Ozon_GetProductsFilterStructure(TestParameters);
    Ozon_GetProductList(TestParameters);
    Ozon_GetProductsAttributesData(TestParameters);
    Ozon_GetProductsInformation(TestParameters);
    Ozon_GetProductsContentRating(TestParameters);
    Ozon_GetProductDescription(TestParameters);
    Ozon_UpdateProductImages(TestParameters);
    Ozon_CheckProductsImagesUpload(TestParameters);
    Ozon_UpdateProductsArticles(TestParameters);
    Ozon_ArchiveProducts(TestParameters);
    Ozon_UnarchiveProducts(TestParameters);
    Ozon_UploadProductActivationCodes(TestParameters);
    //Ozon_GetCodesUploadStatus(TestParameters);
    Ozon_GetProductSubscribersCount(TestParameters);
    Ozon_GetRelatedSKUs(TestParameters);
    Ozon_DeleteProductsWithoutSKU(TestParameters);

EndProcedure

Procedure OzonAPI_Barcodes() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ProductID", TestParameters);

    Ozon_BindBarcodes(TestParameters);
    Ozon_CreateBarcodes(TestParameters);

EndProcedure

Procedure OzonAPI_PricesAndStocks() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ProductID", TestParameters);

    Ozon_GetProductsStocks(TestParameters);
    Ozon_UpdateProductsPrices(TestParameters);
    Ozon_UpdateProductsStocks(TestParameters);
    Ozon_GetProductsPrices(TestParameters);
    Ozon_GetDiscountInformation(TestParameters);
    Ozon_SetProductDiscount(TestParameters);
    Ozon_GetProductStocksStructure(TestParameters);
    Ozon_GetProductPriceStructure(TestParameters);

EndProcedure

Procedure OzonAPI_WarehousesManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"  , TestParameters);

    Ozon_GetWarehousesList(TestParameters);

EndProcedure

Procedure OzonAPI_PromotionsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"  , TestParameters);

    Ozon_GetPromotionsList(TestParameters);
    Ozon_GetCurrentPromoProducts(TestParameters);
    Ozon_GetAvailablePromoProducts(TestParameters);

EndProcedure

Procedure OzonAPI_FBOScheme() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"  , TestParameters);

    Ozon_GetClustersList(TestParameters);
    Ozon_GetShippingWarehousesList(TestParameters);
    Ozon_CreateFBODraft(TestParameters);
    Ozon_GetFBODraft(TestParameters);
    Ozon_GetShipmentAdditionalFields(TestParameters);
    Ozon_GetShipmentsFilterStructure(TestParameters);
    Ozon_GetFBOShipmentsList(TestParameters);
    Ozon_GetFBOTimeslots(TestParameters);

EndProcedure

#EndRegion

#Region Neocities

Procedure NC_FilesManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("NC_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Gif"     , TestParameters);

    Neocities_UploadFile(TestParameters);
    Neocities_UploadFiles(TestParameters);
    Neocities_GetFilesList(TestParameters);
    Neocities_DeleteSelectedFiles(TestParameters);
    Neocities_SynchronizeFolders(TestParameters);

EndProcedure

Procedure NC_DataRetrieving() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("NC_Token"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("NC_Login"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("NC_Password", TestParameters);

    Neocities_GetSiteData(TestParameters);
    Neocities_GetToken(TestParameters);

EndProcedure

#EndRegion

#Region CDEK

Procedure CdekAPI_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Account" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Password", TestParameters);

    CDEK_GetToken(TestParameters);
    CDEK_GetCashboxChecksByDate(TestParameters);
    CDEK_GetDeliveryCashRegistry(TestParameters);
    CDEK_GetDeliveryCashTransfers(TestParameters);
    CDEK_GetOfficeFilterDescription(TestParameters);
    CDEK_GetOfficeList(TestParameters);
    CDEK_GetRegionsList(TestParameters);

EndProcedure

Procedure CDEKAPI_OrdersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Token", TestParameters);

    CDEK_GetOrderDescription(TestParameters);
    CDEK_CreateOrder(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetOrder(TestParameters);
    CDEK_GetOrderByNumber(TestParameters);
    CDEK_CreateReceipt(TestParameters);
    CDEK_CreateBarcode(TestParameters);
    CDEK_CreatePrealert(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetReceipt(TestParameters);
    CDEK_GetBarcode(TestParameters);
    CDEK_GetPrealert(TestParameters);
    CDEK_GetPassportDataStatus(TestParameters);
    CDEK_GetCashboxCheck(TestParameters);
    CDEK_UpdateOrder(TestParameters);
    CDEK_CreateCustomerRefund(TestParameters);
    CDEK_CreateRefusal(TestParameters);
    CDEK_DeleteOrder(TestParameters);

EndProcedure

Procedure CdekAPI_CourierInvitationsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Token", TestParameters);

    CDEK_CreateOrder(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetCourierInvitationsDescription(TestParameters);
    CDEK_CreateCourierInvitation(TestParameters);
    CDEK_GetCourierInvitation(TestParameters);
    CDEK_DeleteCourierInvitation(TestParameters);
    CDEK_GetAppointmentDescription(TestParameters);

    CDEK_GetAvailableDeliveryIntervals(TestParameters);
    CDEK_RegisterDeliveryAppointment(TestParameters);

    OPI_Tools.Pause(25);

    CDEK_GetDeliveryAppointment(TestParameters);
    CDEK_DeleteOrder(TestParameters);

EndProcedure

#EndRegion

#Region YandexMetrika

Procedure YaMetrika_TagsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    YandexMetrika_CreateTag(TestParameters);
    YandexMetrika_GetTagsList(TestParameters);
    YandexMetrika_UpdateTag(TestParameters);
    YandexMetrika_GetTag(TestParameters);
    YandexMetrika_DeleteTag(TestParameters);

EndProcedure

Procedure YaMetrika_CountersManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    YandexMetrika_GetCounterStructure(TestParameters);
    YandexMetrika_CreateCounter(TestParameters);
    YandexMetrika_GetCounter(TestParameters);
    YandexMetrika_UpdateCounter(TestParameters);
    YandexMetrika_DeleteCounter(TestParameters);
    YandexMetrika_RestoreCounter(TestParameters);
    YandexMetrika_GetCountersList(TestParameters);
    YandexMetrika_DeleteCounter(TestParameters);

EndProcedure

Procedure YaMetrika_ActionsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Metrika_Token", TestParameters);

    YandexMetrika_CreateCounter(TestParameters);
    YandexMetrika_GetActionsList(TestParameters);
    YandexMetrika_DeleteCounter(TestParameters);

EndProcedure

#EndRegion

#Region S3

Procedure AWS_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetS3ParameterOptions();

    For Each TestParameters In OptionArray Do

        S3_GetBasicDataStructure(TestParameters);
        S3_SendRequestWithoutBody(TestParameters);
        S3_SendRequestWithBody(TestParameters);

   EndDo;

EndProcedure

Procedure AWS_BucketsManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetS3ParameterOptions();

    For Each TestParameters In OptionArray Do

        S3_CreateBucket(TestParameters);
        S3_ListBuckets(TestParameters);
        S3_HeadBucket(TestParameters);
        S3_PutBucketTagging(TestParameters);
        S3_GetBucketTagging(TestParameters);
        S3_DeleteBucketTagging(TestParameters);
        S3_PutBucketEncryption(TestParameters);
        S3_GetBucketEncryption(TestParameters);
        S3_DeleteBucketEncryption(TestParameters);
        S3_PutBucketVersioning(TestParameters);
        S3_GetBucketVersioning(TestParameters);
        S3_DeleteBucket(TestParameters);

    EndDo;

EndProcedure

Procedure AWS_ObjectsManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetS3ParameterOptions();

    For Each TestParameters In OptionArray Do

        S3_CreateBucket(TestParameters);
        S3_PutObject(TestParameters);
        S3_UploadFullObject(TestParameters);
        S3_InitPartsUpload(TestParameters);
        S3_UploadObjectPart(TestParameters);
        S3_FinishPartsUpload(TestParameters);
        S3_AbortMultipartUpload(TestParameters);
        S3_HeadObject(TestParameters);
        S3_CopyObject(TestParameters);
        S3_PutObjectTagging(TestParameters);
        S3_GetObjectTagging(TestParameters);
        S3_DeleteObjectTagging(TestParameters);
        S3_ListObjects(TestParameters);
        S3_ListObjectVersions(TestParameters);
        S3_GetObject(TestParameters);
        S3_GetObjectDownloadLink(TestParameters);
        S3_DeleteObject(TestParameters);
        S3_DeleteBucket(TestParameters);
        S3_GetObjectUploadLink(TestParameters);

    EndDo;

EndProcedure

#EndRegion

#Region TCP

Procedure TC_Client() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("TCP_Address"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("TCP_AddressTLS", TestParameters);

    TCP_CreateConnection(TestParameters);
    TCP_CloseConnection(TestParameters);
    TCP_ReadBinaryData(TestParameters);
    TCP_SendBinaryData(TestParameters);
    TCP_ReadLine(TestParameters);
    TCP_SendLine(TestParameters);
    TCP_ProcessRequest(TestParameters);
    TCP_GetTLSSettings(TestParameters);
    TCP_GetLastError(TestParameters);

EndProcedure

#EndRegion

#Region SQLite

Procedure SQLL_CommonMethods() Export

    TestParameters = New Structure;

    Base = GetTempFileName("sqlite");
    OPI_TestDataRetrieval.WriteParameter("SQLite_DB", Base);
    OPI_Tools.AddField("SQLite_DB", Base, "String", TestParameters);

    OPI_TestDataRetrieval.ParameterToCollection("Picture"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQLite_Ext"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQLite_ExtLinux", TestParameters);

    SQLite_CreateConnection(TestParameters);
    SQLite_CloseConnection(TestParameters);
    SQLite_ExecuteSQLQuery(TestParameters);
    SQLite_IsConnector(TestParameters);
    SQLite_ConnectExtension(TestParameters);

    Try
        DeleteFiles(Base);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

Procedure SQLL_ORM() Export

    TestParameters = New Structure;

    Base = GetTempFileName("sqlite");

    Connection = OPI_SQLite.CreateConnection(Base);
    TestParameters.Insert("SQLite_DB", Connection);

    OPI_TestDataRetrieval.ParameterToCollection("Picture", TestParameters);

    SQLite_CreateTable(TestParameters);
    SQLite_AddRecords(TestParameters);
    SQLite_GetRecords(TestParameters);
    SQLite_UpdateRecords(TestParameters);
    SQLite_DeleteRecords(TestParameters);
    SQLite_GetTableInformation(TestParameters);
    SQLite_AddTableColumn(TestParameters);
    SQLite_DeleteTableColumn(TestParameters);
    SQLite_EnsureTable(TestParameters);
    SQLite_ClearTable(TestParameters);
    SQLite_DeleteTable(TestParameters);
    SQLite_GetRecordsFilterStrucutre(TestParameters);

    OPI_TestDataRetrieval.WriteParameter("SQLite_DB", Base);
    OPI_Tools.AddField("SQLite_DB", Base, "String", TestParameters);

    SQLite_CreateTable(TestParameters);
    SQLite_AddRecords(TestParameters);
    SQLite_GetRecords(TestParameters);
    SQLite_UpdateRecords(TestParameters);
    SQLite_DeleteRecords(TestParameters);
    SQLite_GetTableInformation(TestParameters);
    SQLite_AddTableColumn(TestParameters);
    SQLite_DeleteTableColumn(TestParameters);
    SQLite_EnsureTable(TestParameters);
    SQLite_ClearTable(TestParameters);
    SQLite_DeleteTable(TestParameters);
    SQLite_GetRecordsFilterStrucutre(TestParameters);

    Try
        DeleteFiles(Base);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

#EndRegion

#Region PostgreSQL

Procedure Postgres_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetPostgresParameterOptions();

    For Each TestParameters In OptionArray Do

        PostgreSQL_GenerateConnectionString(TestParameters);
        PostgreSQL_CreateConnection(TestParameters);
        PostgreSQL_CloseConnection(TestParameters);
        PostgreSQL_IsConnector(TestParameters);
        PostgreSQL_ExecuteSQLQuery(TestParameters);
        PostgreSQL_GetTLSSettings(TestParameters);

    EndDo;

EndProcedure

Procedure Postgres_ORM() Export

    OptionArray = OPI_TestDataRetrieval.GetPostgresParameterOptions();

    For Each TestParameters In OptionArray Do

        PostgreSQL_CreateDatabase(TestParameters);
        PostgreSQL_CreateTable(TestParameters);
        PostgreSQL_AddRecords(TestParameters);
        PostgreSQL_GetRecords(TestParameters);
        PostgreSQL_UpdateRecords(TestParameters);
        PostgreSQL_DeleteRecords(TestParameters);
        PostgreSQL_ClearTable(TestParameters);
        PostgreSQL_GetTableInformation(TestParameters);
        PostgreSQL_AddTableColumn(TestParameters);
        PostgreSQL_DeleteTableColumn(TestParameters);
        PostgreSQL_EnsureTable(TestParameters);
        PostgreSQL_DeleteTable(TestParameters);
        PostgreSQL_DisableAllDatabaseConnections(TestParameters);
        PostgreSQL_DeleteDatabase(TestParameters);
        PostgreSQL_GetRecordsFilterStrucutre(TestParameters);

    EndDo;

EndProcedure

#EndRegion

#Region MySQL

Procedure MYS_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetMySQLParameterOptions();

    For Each TestParameters In OptionArray Do

        MySQL_GenerateConnectionString(TestParameters);
        MySQL_CreateConnection(TestParameters);
        MySQL_CloseConnection(TestParameters);
        MySQL_IsConnector(TestParameters);
        MySQL_ExecuteSQLQuery(TestParameters);
        MySQL_GetTLSSettings(TestParameters);

    EndDo;

EndProcedure

Procedure MYS_ORM() Export

    OptionArray = OPI_TestDataRetrieval.GetMySQLParameterOptions();

    For Each TestParameters In OptionArray Do

        MySQL_CreateDatabase(TestParameters);
        MySQL_CreateTable(TestParameters);
        MySQL_AddRecords(TestParameters);
        MySQL_GetRecords(TestParameters);
        MySQL_UpdateRecords(TestParameters);
        MySQL_DeleteRecords(TestParameters);
        MySQL_ClearTable(TestParameters);
        MySQL_GetTableInformation(TestParameters);
        MySQL_AddTableColumn(TestParameters);
        MySQL_DeleteTableColumn(TestParameters);
        MySQL_EnsureTable(TestParameters);
        MySQL_DeleteTable(TestParameters);
        MySQL_DeleteDatabase(TestParameters);
        MySQL_GetRecordsFilterStrucutre(TestParameters);

    EndDo;

EndProcedure

#EndRegion

#Region GreenAPI

Procedure GAPI_Account() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);

    GreenAPI_ArchiveChat(TestParameters);
    GreenAPI_UnarchiveChat(TestParameters);
    GreenAPI_FormAccessParameters(TestParameters);
    GreenAPI_GetInstanceSettings(TestParameters);
    GreenAPI_GetAccountInformation(TestParameters);
    GreenAPI_GetInstanceSettingsStructure(TestParameters);
    GreenAPI_SetInstanceSettings(TestParameters);
    GreenAPI_GetInstanceStatus(TestParameters);
    GreenAPI_SetProfilePicture(TestParameters);
    GreenAPI_RebootInstance(TestParameters);
    // GreenAPI_GetAuthorizationCode(TestParameters);
    // GreenAPI_LogoutInstance(TestParameters);
    // GreenAPI_GetQR(TestParameters);

EndProcedure

Procedure GAPI_GroupManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"            , TestParameters);

    GreenAPI_CreateGroup(TestParameters);
    GreenAPI_GetGroupInformation(TestParameters);
    GreenAPI_UpdateGroupName(TestParameters);
    GreenAPI_SetGroupPicture(TestParameters);
    GreenAPI_AddGroupMember(TestParameters);
    GreenAPI_ExcludeGroupMember(TestParameters);
    GreenAPI_SetAdminRights(TestParameters);
    GreenAPI_RevokeAdminRights(TestParameters);
    GreenAPI_LeaveGroup(TestParameters);

EndProcedure

Procedure GAPI_MessageSending() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"             , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"               , TestParameters);

    GreenAPI_SendTextMessage(TestParameters);
    GreenAPI_SendFile(TestParameters);
    GreenAPI_SendFileByURL(TestParameters);
    GreenAPI_SendPoll(TestParameters);
    GreenAPI_SendLocation(TestParameters);
    GreenAPI_SendContact(TestParameters);
    GreenAPI_ForwardMessages(TestParameters);
    GreenAPI_GetLocationDescription(TestParameters);
    GreenAPI_GetContactDescription(TestParameters);
    GreenAPI_EditMessageText(TestParameters);
    GreenAPI_DeleteMessage(TestParameters);

EndProcedure

Procedure GAPI_NotificationsReceiving() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"           , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"         , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"            , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_FileMessageID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_DownloadMessageID", TestParameters);

    GreenAPI_GetNotification(TestParameters);
    GreenAPI_SetReadMark(TestParameters);
    //GreenAPI_DownloadMessageFile(TestParameters);
    GreenAPI_DeleteNotificationFromQueue(TestParameters);

EndProcedure

Procedure GAPI_MessageQueue() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);

    GreenAPI_GetMessageQueue(TestParameters);
    GreenAPI_ClearMessageQueue(TestParameters);

EndProcedure

Procedure GAPI_MessageLogs() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_ApiURL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MediaURL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_IdInstance" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_Token"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_TestGroupID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_AccountID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("GreenAPI_MessageID"  , TestParameters);

    GreenAPI_GetChatHistory(TestParameters);
    GreenAPI_GetMessage(TestParameters);
    GreenAPI_GetIncomingMessageLog(TestParameters);
    GreenAPI_GetOutgoingMessageLog(TestParameters);

EndProcedure

#EndRegion

#Region RCON

Procedure RC_CommandsExecution() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RCON_URL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RCON_Password", TestParameters);

    RCON_FormConnectionParameters(TestParameters);
    RCON_CreateConnection(TestParameters);
    RCON_ExecuteCommand(TestParameters);
    RCON_IsConnector(TestParameters);

EndProcedure

#EndRegion

#Region Ollama

Procedure OLLM_RequestsProcessing() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_URL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_Token", TestParameters);

    Ollama_PullModel(TestParameters);
    Ollama_GetVersion(TestParameters);
    Ollama_GetResponse(TestParameters);
    Ollama_GetContextResponse(TestParameters);
    Ollama_GetEmbeddings(TestParameters);
    Ollama_GetRequestParameterStructure(TestParameters);
    Ollama_GetContextParameterStructure(TestParameters);
    Ollama_GetContextMessageStructure(TestParameters);
    Ollama_GetEmbeddingsParameterStructure(TestParameters);

EndProcedure

Procedure OLLM_ModelsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_URL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_Token", TestParameters);

    Ollama_PullModel(TestParameters);
    Ollama_LoadModelToMemory(TestParameters);
    Ollama_UnloadModelFromMemory(TestParameters);
    Ollama_CreateModel(TestParameters);
    Ollama_GetModelInformation(TestParameters);
    Ollama_GetModelList(TestParameters);
    Ollama_ListRunningModels(TestParameters);
    Ollama_CopyModel(TestParameters);
    Ollama_PushModel(TestParameters);
    Ollama_GetModelSettingsStructure(TestParameters);
    Ollama_DeleteModel(TestParameters);

EndProcedure

Procedure OLLM_WorkingWithBlob() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_URL"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ollama_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"     , TestParameters);

    Ollama_PushBlob(TestParameters);
    Ollama_CheckBlob(TestParameters);

EndProcedure

#EndRegion

#Region HTTP

Procedure HTTP_Initialization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL" , TestParameters);

    HTTPClient_Initialize(TestParameters);
    HTTPClient_SetURL(TestParameters);
    HTTPClient_SetURLParams(TestParameters);
    HTTPClient_SetResponseFile(TestParameters);
    HTTPClient_SetDataType(TestParameters);
    HTTPClient_GetLog(TestParameters);
    HTTPClient_SetProxy(TestParameters);
    HTTPClient_SetTimeout(TestParameters);

EndProcedure

Procedure HTTP_BodySet() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTPClient_SetBinaryBody(TestParameters);
    HTTPClient_SetStringBody(TestParameters);
    HTTPClient_SetJsonBody(TestParameters);
    HTTPClient_SetFormBody(TestParameters);
    HTTPClient_StartMultipartBody(TestParameters);
    HTTPClient_AddMultipartFormDataField(TestParameters);
    HTTPClient_AddMultipartFormDataFile(TestParameters);
    HTTPClient_AddDataAsRelated(TestParameters);

EndProcedure

Procedure HTTP_Settings() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTPClient_UseEncoding(TestParameters);
    HTTPClient_UseGzipCompression(TestParameters);
    HTTPClient_UseBodyFiledsAtOAuth(TestParameters);
    HTTPClient_UseURLEncoding(TestParameters);
    HTTPClient_SplitArraysInURL(TestParameters);

EndProcedure

Procedure HTTP_HeadersSetting() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);

    HTTPClient_SetHeaders(TestParameters);
    HTTPClient_AddHeader(TestParameters);

EndProcedure

Procedure HTTP_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);

    HTTPClient_AddBasicAuthorization(TestParameters);
    HTTPClient_AddBearerAuthorization(TestParameters);
    HTTPClient_AddAWS4Authorization(TestParameters);
    HTTPClient_AddOAuthV1Authorization(TestParameters);
    HTTPClient_SetOAuthV1Algorithm(TestParameters);

EndProcedure

Procedure HTTP_RequestProcessing() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);

    HTTPClient_ProcessRequest(TestParameters);
    HTTPClient_ExecuteRequest(TestParameters);
    HTTPClient_ReturnRequest(TestParameters);
    HTTPClient_ReturnConnection(TestParameters);

EndProcedure

Procedure HTTP_ResponseReceiving() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("HTTP_URL", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    HTTPClient_ReturnResponse(TestParameters);
    HTTPClient_ReturnResponseAsJSONObject(TestParameters);
    HTTPClient_ReturnResponseAsBinaryData(TestParameters);
    HTTPClient_ReturnResponseAsString(TestParameters);
    HTTPClient_ReturnResponseFilename(TestParameters);

EndProcedure

#EndRegion

#Region OpenAI

Procedure OAI_RequestsProcessing() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token2" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL2"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_File"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"       , TestParameters);

    OpenAI_GetResponse(TestParameters);
    OpenAI_GetEmbeddings(TestParameters);
    OpenAI_GetMessageStructure(TestParameters);
    OpenAI_GetImageMessageStructure(TestParameters);
    OpenAI_GetImages(TestParameters);
    OpenAI_GetAssistantMessage(TestParameters);
    OpenAI_GetUserMessage(TestParameters);
    OpenAI_GetSystemMessage(TestParameters);

EndProcedure

Procedure OAI_Assistants() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);

    OpenAI_CreateAssistant(TestParameters);
    OpenAI_RetrieveAssistant(TestParameters);
    OpenAI_GetAssistantsList(TestParameters);
    OpenAI_DeleteAssistant(TestParameters);

EndProcedure

Procedure OAI_FileManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);

    OpenAI_UploadFile(TestParameters);
    OpenAI_GetFileInformation(TestParameters);
    OpenAI_GetFilesList(TestParameters);
    OpenAI_DownloadFile(TestParameters);
    OpenAI_DeleteFile(TestParameters);

EndProcedure

Procedure OAI_AudioProcessing() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);

    OpenAI_GenerateSpeech(TestParameters);
    OpenAI_CreateTranscription(TestParameters);

EndProcedure

Procedure OAI_ModelsManagement() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("OpenAI_URL"   , TestParameters);

    OpenAI_GetModelList(TestParameters);

EndProcedure

#EndRegion

#Region MSSQL

Procedure MSS_CommonMethods() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("PG_IP"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("PG_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("SQL2"       , TestParameters);

    MSSQL_GenerateConnectionString(TestParameters);
    MSSQL_CreateConnection(TestParameters);
    MSSQL_CloseConnection(TestParameters);
    MSSQL_IsConnector(TestParameters);
    MSSQL_ExecuteSQLQuery(TestParameters);
    MSSQL_GetTLSSettings(TestParameters);

EndProcedure

Procedure MSS_ORM() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("PG_IP"      , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("PG_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"    , TestParameters);

    MSSQL_CreateDatabase(TestParameters);
    MSSQL_CreateTable(TestParameters);
    MSSQL_AddRecords(TestParameters);
    MSSQL_GetRecords(TestParameters);
    MSSQL_UpdateRecords(TestParameters);
    MSSQL_DeleteRecords(TestParameters);
    MSSQL_ClearTable(TestParameters);
    MSSQL_GetTableInformation(TestParameters);
    MSSQL_AddTableColumn(TestParameters);
    MSSQL_DeleteTableColumn(TestParameters);
    MSSQL_EnsureTable(TestParameters);
    MSSQL_DeleteTable(TestParameters);
    MSSQL_DeleteDatabase(TestParameters);
    MSSQL_GetRecordsFilterStrucutre(TestParameters);

EndProcedure

#EndRegion

#Region FTP

Procedure FT_DirecotryManagement() Export

    OptionArray = OPI_TestDataRetrieval.GetFTPParameterOptions();

    For Each TestParameters In OptionArray Do

        FTP_ClearDirectory(TestParameters);
        FTP_CreateNewDirectory(TestParameters);
        FTP_GetCurrentDirectory(TestParameters);
        FTP_ChangeCurrentDirectory(TestParameters);
        FTP_ListObjects(TestParameters);
        FTP_DeleteDirectory(TestParameters);

    EndDo;

EndProcedure

Procedure FT_FileOperations() Export

    OptionArray = OPI_TestDataRetrieval.GetFTPParameterOptions();

    For Each TestParameters In OptionArray Do

        FTP_UploadFile(TestParameters);
        FTP_SaveFile(TestParameters);
        FTP_GetFileData(TestParameters);
        FTP_DeleteFile(TestParameters);

    EndDo

EndProcedure

Procedure FT_CommonMethods() Export

    OptionArray = OPI_TestDataRetrieval.GetFTPParameterOptions();

    For Each TestParameters In OptionArray Do

        FTP_CreateConnection(TestParameters);
        FTP_GetWelcomeMessage(TestParameters);
        FTP_GetProtocolFeatureList(TestParameters);
        FTP_GetConnectionConfiguration(TestParameters);
        FTP_CloseConnection(TestParameters);
        FTP_IsConnector(TestParameters);
        FTP_GetConnectionSettings(TestParameters);
        FTP_GetProxySettings(TestParameters);
        FTP_GetTLSSettings(TestParameters);
        FTP_GetObjectSize(TestParameters);
        FTP_UpdatePath(TestParameters);
        FTP_ExecuteCustomCommand(TestParameters);
        FTP_ExecuteArbitraryCommand(TestParameters);
        FTP_Ping(TestParameters);

    EndDo;

EndProcedure

#EndRegion

#Region ReportPortal

Procedure RPortal_Authorization() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_URL"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_Login"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_Password", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("RPortal_UserID"  , TestParameters);

    ReportPortal_GetTemporaryToken(TestParameters);
    ReportPortal_GetPermanentToken(TestParameters);
    ReportPortal_DeletePermanentToken(TestParameters);

EndProcedure

#EndRegion

#EndRegion

#EndRegion

#Region Private

Function GetVKParameters()

    Parameters  = New Structure;
    GroupNumber = OPI_TestDataRetrieval.GetParameter("VK_GroupID");

    Parameters.Insert("access_token", OPI_TestDataRetrieval.GetParameter("VK_Token"));
    Parameters.Insert("owner_id"    , "-" + GroupNumber);
    Parameters.Insert("app_id"      , OPI_TestDataRetrieval.GetParameter("VK_AppID"));
    Parameters.Insert("group_id"    , GroupNumber);

    Return Parameters;

EndFunction

Function GetTwitterAuthData()

    Parameters = New Map;

    Parameters.Insert("redirect_uri"      , OPI_TestDataRetrieval.GetParameter("Twitter_Redirect"));
    Parameters.Insert("client_id"         , OPI_TestDataRetrieval.GetParameter("Twitter_ClinetID"));
    Parameters.Insert("client_secret"     , OPI_TestDataRetrieval.GetParameter("Twitter_ClientSecret"));
    Parameters.Insert("access_token"      , OPI_TestDataRetrieval.GetParameter("Twitter_Token"));
    Parameters.Insert("refresh_token"     , OPI_TestDataRetrieval.GetParameter("Twitter_Refresh"));
    Parameters.Insert("oauth_token"       , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthToken"));
    Parameters.Insert("oauth_token_secret", OPI_TestDataRetrieval.GetParameter("Twitter_OAuthSecret"));

    Parameters.Insert("oauth_consumer_key"   , OPI_TestDataRetrieval.GetParameter("Twitter_OAuthConsumerKey"));
    Parameters.Insert("oauth_consumer_secret", OPI_TestDataRetrieval.GetParameter(
        "Twitter_OAuthConsumerSecret"));

    Return Parameters;

EndFunction

Procedure Process(Val Result
    , Val Library
    , Val Method
    , Val Option = ""
    , AddParam1  = Undefined
    , AddParam2  = Undefined
    , AddParam3  = Undefined)

    CLITestsMark = 1;

    SetEnvironmentVariable("OINT_TESTS_CLI", CLITestsMark);

    OPI_TestDataRetrieval.ProcessTestingResult(Result
        , Method
        , Library
        , Option
        , AddParam1
        , AddParam2
        , AddParam3);

EndProcedure

#Region AtomicTests

#Region Telegram

Procedure Telegram_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetBotInformation", Options);

    // END

    Process(Result, "Telegram", "GetBotInformation");

EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetUpdates", Options);

    // END

    Process(Result, "Telegram", "GetUpdates");

EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    URL   = FunctionParameters["Telegram_URL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SetWebhook", Options);

    // END

    Process(Result, "Telegram", "SetWebhook");

EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "DeleteWebhook", Options);

    // END

    Process(Result, "Telegram", "DeleteWebhook");

EndProcedure

Procedure Telegram_SendTextMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];

    KeyboardButtonsArray = New Array;
    KeyboardButtonsArray.Add("Button1");
    KeyboardButtonsArray.Add("Button2");

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

    Process(Result, "Telegram", "SendTextMessage", , FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    // END

    Process(Result, "Telegram", "SendTextMessage", "Channel", FunctionParameters, Text);

    Text   = "<b>Text html %F0%9F%93%9E 10%</b>";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("parsemode", "HTML");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    Process(Result, "Telegram", "SendTextMessage", "HTML");

    Text   = "%F0%9F%A4%BC";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    Process(Result, "Telegram", "SendTextMessage", "Emoji");

    Text   = "Text %F0%9F%A5%9D and emoji \(10%\)";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("parsemode", "MarkdownV2");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    Process(Result, "Telegram", "SendTextMessage", "Text + Emoji");

    Keyboard = OPI_Tools.JsonToStructure(Keyboard, False);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    Process(Result, "Telegram", "SendTextMessage", "Keyboard structure");

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

    Process(Result, "Telegram", "FormKeyboardFromButtonArray");

EndProcedure

Procedure Telegram_SendImage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Image     = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    ImageDD = New BinaryData(ImagePath);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    Process(Result, "Telegram", "SendImage", , FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("picture", ImagePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    Process(Result, "Telegram", "SendImage", "Path", FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("picture", ImageDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    // END

    Process(Result, "Telegram", "SendImage", "Binary", FunctionParameters, Text);

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

    Process(Result, "Telegram", "SendImage", "Keyboard", FunctionParameters, Text);

    Keyboard = OPI_Tools.JsonToStructure(Keyboard);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("picture", Image);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendImage", Options);

    Process(Result, "Telegram", "SendImage", "Keyboard collection", FunctionParameters, Text);

    DeleteFiles(ImagePath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendVideo(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Video     = FunctionParameters["Video"];

    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);

    VideoDD = New BinaryData(VideoPath);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("video", Video);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    Process(Result, "Telegram", "SendVideo", , FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("video", VideoPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    Process(Result, "Telegram", "SendVideo", "Path", FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("video", VideoDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendVideo", Options);

    // END

    DeleteFiles(VideoPath);
    Process(Result, "Telegram", "SendVideo", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendAudio(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Audio     = FunctionParameters["Audio"];

    AudioPath = GetTempFileName("mp3");
    CopyFile(Audio, AudioPath);

    AudioDD = New BinaryData(AudioPath);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("audio", Audio);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    Process(Result, "Telegram", "SendAudio", , FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("audio", AudioPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    Process(Result, "Telegram", "SendAudio", "Path", FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("audio", AudioDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendAudio", Options);

    // END

    DeleteFiles(AudioPath);
    Process(Result, "Telegram", "SendAudio", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendDocument(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Document  = FunctionParameters["Document"];

    DocumentPath = GetTempFileName("docx");
    CopyFile(Document, DocumentPath);

    DocumentDD = New BinaryData(DocumentPath);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("doc", Document);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    Process(Result, "Telegram", "SendDocument", , FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("doc", Document);
    Options.Insert("filename", "customname.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    Process(Result, "Telegram", "SendDocument", "With name", FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("doc", DocumentPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    Process(Result, "Telegram", "SendDocument", "Path", FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("doc", DocumentDD);
    Options.Insert("filename", "customname.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendDocument", Options);

    // END

    DeleteFiles(DocumentPath);
    Process(Result, "Telegram", "SendDocument", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendGif(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    GIF       = FunctionParameters["GIF"];

    GifPath = GetTempFileName("gif");
    CopyFile(GIF, GifPath);

    GifDD = New BinaryData(GifPath);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("gif", GIF);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    Process(Result, "Telegram", "SendGif", , FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("gif", GifPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    Process(Result, "Telegram", "SendGif", "Path", FunctionParameters, Text); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("gif", GifDD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendGif", Options);

    // END

    DeleteFiles(GifPath);
    Process(Result, "Telegram", "SendGif", "Binary", FunctionParameters, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendMediaGroup(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    ChatID = FunctionParameters["Telegram_ChatID"];
    Text   = FunctionParameters["String"];
    Image  = FunctionParameters["Picture"];
    Video  = FunctionParameters["Video"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    VideoPath = GetTempFileName("mp4");
    CopyFile(Video, VideoPath);

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

    Process(Result, "Telegram", "SendMediaGroup");

    DocumentURL  = FunctionParameters["Document"];
    DocumentPath = GetTempFileName("docx");
    ChannelID    = FunctionParameters["Telegram_ChannelID"];

    CopyFile(DocumentURL, DocumentPath);

    MediaGroup = New Map;
    MediaGroup.Insert(DocumentURL , "document");
    MediaGroup.Insert(DocumentPath, "document");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("text", Text);
    Options.Insert("media", MediaGroup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendMediaGroup", Options);

    DeleteFiles(VideoPath);
    DeleteFiles(ImagePath);
    DeleteFiles(DocumentPath);

    Process(Result, "Telegram", "SendMediaGroup", "Documents");

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

    Process(Result, "Telegram", "SendLocation"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("lat", Width);
    Options.Insert("long", Longitude);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendLocation", Options);

    // END

    Process(Result, "Telegram", "SendLocation", "Channel");

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

    Process(Result, "Telegram", "SendContact", , Name); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("name", Name);
    Options.Insert("surname", LastName);
    Options.Insert("phone", Phone);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendContact", Options);

    // END

    Process(Result, "Telegram", "SendContact", "Channel", Name);

EndProcedure

Procedure Telegram_SendPoll(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Question  = "What's your favorite color?";

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

    Process(Result, "Telegram", "SendPoll", , Question); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("question", Question);
    Options.Insert("options", AnswersArray);
    Options.Insert("anonymous", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    Process(Result, "Telegram", "SendPoll", "Channel", Question); // SKIP

    // END

    StringArray = "['Red', 'Yellow', 'Green', 'Blue']";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);
    Options.Insert("question", Question);
    Options.Insert("options", StringArray);
    Options.Insert("anonymous", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendPoll", Options);

    Process(Result, "Telegram", "SendPoll", "Questions as string", Question);

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

    Process(Result, "Telegram", "DownloadFile");

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

    Process(Result, "Telegram", "ForwardMessage", , MessageID);

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

    Process(Result, "Telegram", "Ban");

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

    Process(Result, "Telegram", "Unban");

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

    Process(Result, "Telegram", "CreateInvitationLink", , Title, UnixExpiration);

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

    Process(Result, "Telegram", "PinMessage");

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

    Process(Result, "Telegram", "UnpinMessage");

EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChannelID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetParticipantCount", Options);

    // END

    Process(Result, "Telegram", "GetParticipantCount");

EndProcedure

Procedure Telegram_GetAvatarIconList(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "GetAvatarIconList", Options);

    // END

    Process(Result, "Telegram", "GetAvatarIconList");

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

    Process(Result, "Telegram", "CreateForumTopic", , FunctionParameters, Name, Icon);

    ChatTopic = Chat + "*" + FunctionParameters["Telegram_TopicID"];
    Text      = FunctionParameters["String"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatTopic);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "SendTextMessage", Options);

    Process(Result, "Telegram", "CreateForumTopic", "Message", FunctionParameters, Text);

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

    Process(Result, "Telegram", "EditForumTopic");

EndProcedure

Procedure Telegram_CloseForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    OPI_Telegram.OpenForumTopic(Token, Chat); // SKIP

    Result = OPI_Telegram.CloseForumTopic(Token, Chat); // Closes main topic

    Process(Result, "Telegram", "CloseForumTopic", "Main"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("topic", Topic);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "CloseForumTopic", Options);

    // END

    Process(Result, "Telegram", "CloseForumTopic");

EndProcedure

Procedure Telegram_OpenForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.OpenForumTopic(Token, Chat); // Opens main topic

    Process(Result, "Telegram", "OpenForumTopic", "Main"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);
    Options.Insert("topic", Topic);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "OpenForumTopic", Options);

    // END

    Process(Result, "Telegram", "OpenForumTopic");

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

    Process(Result, "Telegram", "DeleteForumTopic");

EndProcedure

Procedure Telegram_ClearTopicPinnedMessagesList(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ClearTopicPinnedMessagesList", Options);

    Process(Result, "Telegram", "ClearTopicPinnedMessagesList", "Main"); // SKIP

    // END

    Process(Result, "Telegram", "ClearTopicPinnedMessagesList");

EndProcedure

Procedure Telegram_HideMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "HideMainForumTopic", Options);

    // END

    Process(Result, "Telegram", "HideMainForumTopic");

EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("forum", Chat);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ShowMainForumTopic", Options);

    // END

    Process(Result, "Telegram", "ShowMainForumTopic");

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

    Process(Result, "Telegram", "EditMainForumTopicName");

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

    Process(Result, "Telegram", "DeleteMessage");

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

    Process(Result, "Telegram", "ReplaceMessageText", , Text);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("text", "<b>Bold text</b>");
    Options.Insert("parsemode", "HTML");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("telegram", "ReplaceMessageText", Options);

    Process(Result, "Telegram", "ReplaceMessageText", "Markup", "Bold text");

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

    Process(Result, "Telegram", "ReplaceMessageKeyboard", , Keyboard);

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

    Process(Result, "Telegram", "ReplaceMessageCaption", , Description);

EndProcedure

#EndRegion

#Region VK

Procedure VK_CreateTokenRetrievalLink(FunctionParameters)

    Application = FunctionParameters["VK_AppID"];
    Options = New Structure;
    Options.Insert("app", Application);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateTokenRetrievalLink", Options);

    // END

    Process(Result, "VK", "CreateTokenRetrievalLink");

EndProcedure

Procedure VK_CreatePost(FunctionParameters)

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
    Options.Insert("text", Text);
    Options.Insert("pictures", ImageArray);
    Options.Insert("ad", Истина);
    Options.Insert("url", URL);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    Process(Result, "VK", "CreatePost", , Parameters); // SKIP

    PostID = Result["response"]["post_id"]; // SKIP
    OPI_VK.DeletePost(PostID, Parameters); // SKIP

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("pictures", Image);
    Options.Insert("ad", Ложь);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    // END

    Process(Result, "VK", "CreatePost", "Image", Parameters);

    PostID = Result["response"]["post_id"];
    OPI_VK.DeletePost(PostID, Parameters);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("pictures", TFN);
    Options.Insert("ad", Истина);
    Options.Insert("url", URL);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePost", Options);

    Process(Result, "VK", "CreatePost", "Path", FunctionParameters);

    DeleteFiles(TFN);

EndProcedure

Procedure VK_DeletePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Options = New Structure;
    Options.Insert("post", PostID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeletePost", Options);

    // END

    Process(Result, "VK", "DeletePost");

EndProcedure

Procedure VK_CreateCompositePost(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "Post from autotest";
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Video = FunctionParameters["Video"]; // URL, Path or Binary Data

    TFN = GetTempFileName("png");
    CopyFile(Image, TFN);

    ImageUpload = OPI_VK.UploadPhotoToServer(TFN, Parameters)["response"][0];
    Options = New Structure;
    Options.Insert("file", Video);
    Options.Insert("title", "NewVideo");
    Options.Insert("auth", Parameters);

    VideoUpload = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "UploadVideoToServer", Options);

    ImageOwner = OPI_Tools.NumberToString(ImageUpload["owner_id"]);
    VideoOwner = OPI_Tools.NumberToString(VideoUpload["owner_id"]);

    ImageID = OPI_Tools.NumberToString(ImageUpload["id"]);
    VideoID = OPI_Tools.NumberToString(VideoUpload["video_id"]);

    AttachmentsArray = New Array;
    AttachmentsArray.Add("photo" + ImageOwner + "_" + ImageID);
    AttachmentsArray.Add("video" + VideoOwner + "_" + VideoID);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("objects", AttachmentsArray);
    Options.Insert("ad", Ложь);
    Options.Insert("url", URL);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateCompositePost", Options);

    // END

    Process(Result, "VK", "CreateCompositePost");
    DeleteFiles(TFN);


EndProcedure

Procedure VK_CreatePoll(FunctionParameters)

    Parameters = GetVKParameters();
    Question   = "What's your favorite color?";

    OptionArray = New Array;
    OptionArray.Add("Red");
    OptionArray.Add("Yellow");
    OptionArray.Add("Green");

    Options = New Structure;
    Options.Insert("question", Question);
    Options.Insert("options", OptionArray);
    Options.Insert("text", "Post text");
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePoll", Options);

    Process(Result, "VK", "CreatePoll", "Text"); // SKIP

    // With picture

    Image = FunctionParameters["Picture"]; // URL, File path or Binary Data

    Options = New Structure;
    Options.Insert("question", Question);
    Options.Insert("options", OptionArray);
    Options.Insert("picture", Image);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreatePoll", Options);

    // END

    Process(Result, "VK", "CreatePoll");

    PostID = Result["response"]["post_id"];
    OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateAlbum(FunctionParameters)

    Parameters  = GetVKParameters();
    Name        = "AlbumFromAutoTest";
    Description = "NewAlbumFromAutoTest";

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("description", Description);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateAlbum", Options);

    // END

    Process(Result, "VK", "CreateAlbum", , FunctionParameters, Description);

EndProcedure

Procedure VK_SaveImageToAlbum(FunctionParameters)

    Parameters       = GetVKParameters();
    ImageDescription = "AutoTestImage";
    AlbumID          = FunctionParameters["VK_AlbumID"];

    Image = FunctionParameters["Picture"]; // URL, File path or Binary Data

    Options = New Structure;
    Options.Insert("album", AlbumID);
    Options.Insert("picture", Image);
    Options.Insert("description", ImageDescription);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "SaveImageToAlbum", Options);

    // END

    Process(Result, "VK", "SaveImageToAlbum", , FunctionParameters, ImageDescription, AlbumID);

EndProcedure

Procedure VK_DeleteImage(FunctionParameters)

    Parameters = GetVKParameters();
    ImageID    = FunctionParameters["VK_PictureID"];

    Options = New Structure;
    Options.Insert("pictureid", ImageID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteImage", Options);

    // END

    Process(Result, "VK", "DeleteImage");

EndProcedure

Procedure VK_DeleteAlbum(FunctionParameters)

    Parameters = GetVKParameters();
    AlbumID    = FunctionParameters["VK_AlbumID"];

    Options = New Structure;
    Options.Insert("album", AlbumID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteAlbum", Options);

    // END

    Process(Result, "VK", "DeleteAlbum");

EndProcedure

Procedure VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, File path or Binary Data
    TFN   = GetTempFileName("png");
    CopyFile(Image, TFN);
    Image = New BinaryData(TFN);

    Options = New Structure;
    Options.Insert("picture", Image);
    Options.Insert("url", URL);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateStory", Options);

    Process(Result, "VK", "CreateStory"); // SKIP

    // END

    Options = New Structure;
    Options.Insert("picture", TFN);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateStory", Options);

    Process(Result, "VK", "CreateStory", "Path");

    DeleteFiles(TFN);

EndProcedure

Procedure VK_CreateDiscussion(FunctionParameters)

    Parameters = GetVKParameters();
    Name       = "Discussing: Which color is better?";
    Message    = "Red, yellow, blue, or some other?";

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("text", Message);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateDiscussion", Options);

    // END

    Process(Result, "VK", "CreateDiscussion", , FunctionParameters);

EndProcedure

Procedure VK_CloseDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Options = New Structure;
    Options.Insert("topic", DiscussionID);
    Options.Insert("remove", Ложь);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CloseDiscussion", Options);

    // END

    Process(Result, "VK", "CloseDiscussion");

EndProcedure

Procedure VK_OpenDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Options = New Structure;
    Options.Insert("topic", DiscussionID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "OpenDiscussion", Options);

    // END

    Process(Result, "VK", "OpenDiscussion");

EndProcedure

Procedure VK_WriteInDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Message      = "I like yellow more";

    Options = New Structure;
    Options.Insert("topic", DiscussionID);
    Options.Insert("text", Message);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "WriteInDiscussion", Options);

    // END

    Process(Result, "VK", "WriteInDiscussion");

EndProcedure

Procedure VK_LikePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Options = New Structure;
    Options.Insert("post", PostID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "LikePost", Options);

    // END

    Process(Result, "VK", "LikePost");

EndProcedure

Procedure VK_MakeRepost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = 2571;
    WallID     = -218704372;

    Options = New Structure;
    Options.Insert("post", PostID);
    Options.Insert("from", WallID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "MakeRepost", Options);

    // END

    Process(Result, "VK", "MakeRepost", , FunctionParameters);

EndProcedure

Procedure VK_WriteComment(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "NewComment";
    PostID     = FunctionParameters["VK_PostID"];
    WallID     = Parameters["owner_id"];

    Options = New Structure;
    Options.Insert("post", PostID);
    Options.Insert("wall", WallID);
    Options.Insert("text", Text);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "WriteComment", Options);

    // END

    Process(Result, "VK", "WriteComment");

EndProcedure

Procedure VK_GetStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    CurrentDate = OPI_Tools.GetCurrentDate();
    StartDate   = BegOfDay(CurrentDate);
    EndDate     = EndOfDay(StartDate);

    Options = New Structure;
    Options.Insert("datefrom", StartDate);
    Options.Insert("dateto", EndDate);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetStatistics", Options);

    // END

    Process(Result, "VK", "GetStatistics");

EndProcedure

Procedure VK_GetPostStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    ArrayOfPosts = New Array;
    ArrayOfPosts.Add(214);
    ArrayOfPosts.Add(215);

    Options = New Structure;
    Options.Insert("posts", ArrayOfPosts);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetPostStatistics", Options);

    // END

    Process(Result, "VK", "GetPostStatistics");

EndProcedure

Procedure VK_CreateAdvertisingCampaign(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    Name      = "New campaign";

    Options = New Structure;
    Options.Insert("cabinet", AccountID);
    Options.Insert("title", Name);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateAdvertisingCampaign", Options);

    // END

    Process(Result, "VK", "CreateAdvertisingCampaign", , FunctionParameters);

EndProcedure

Procedure VK_CreateAd(FunctionParameters)

    Parameters = GetVKParameters();

    CampaignNumber = FunctionParameters["VK_AdsCampaignID"];
    DailyLimit     = 150;
    CategoryNumber = 126;
    PostID         = FunctionParameters["VK_PostID"];
    AccountID      = FunctionParameters["VK_AdsCabinetID"];

    Options = New Structure;
    Options.Insert("campaign", CampaignNumber);
    Options.Insert("limit", DailyLimit);
    Options.Insert("category", CategoryNumber);
    Options.Insert("post", PostID);
    Options.Insert("cabinet", AccountID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateAd", Options);

    // END

    Process(Result, "VK", "CreateAd", , FunctionParameters);

EndProcedure

Procedure VK_PauseAdvertising(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    AdID      = FunctionParameters["VK_AdsPostID"];

    Options = New Structure;
    Options.Insert("cabinet", AccountID);
    Options.Insert("adv", AdID);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "PauseAdvertising", Options);

    // END

    Process(Result, "VK", "PauseAdvertising");

EndProcedure

Procedure VK_FormKeyboard(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "FormKeyboard", Options);

    // END

    Process(Result, "VK", "FormKeyboard");

EndProcedure

Procedure VK_WriteMessage(FunctionParameters)

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
    Options.Insert("text", Text);
    Options.Insert("user", UserID);
    Options.Insert("ct", Communitytoken);
    Options.Insert("keyboard", Keyboard);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "WriteMessage", Options);

    // END

    Process(Result, "VK", "WriteMessage");

EndProcedure

Procedure VK_GetProductCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductCategoryList", Options);

    // END

    Process(Result, "VK", "GetProductCategoryList");

EndProcedure

Procedure VK_CreateProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name   = "TestCollection";
    Image  = FunctionParameters["Picture"];
    Main   = True;
    Hidden = False;

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("picture", Image);
    Options.Insert("main", Main);
    Options.Insert("hidden", Hidden);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateProductCollection", Options);

    // END

    Process(Result, "VK", "CreateProductCollection", , FunctionParameters);

EndProcedure

Procedure VK_EditProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name      = "EditedCollection";
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("sel", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProductCollection", Options);

    // END

    Process(Result, "VK", "EditProductCollection");

EndProcedure

Procedure VK_GetSelectionsByID(FunctionParameters)

    Parameters = GetVKParameters();
    Selection  = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sels", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetSelectionsByID", Options);

    // END

    Process(Result, "VK", "GetSelectionsByID");

EndProcedure

Procedure VK_AddProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Image1    = FunctionParameters["Picture"]; // URL, Binary or File path
    Image2    = FunctionParameters["Picture2"]; // URL, Binary or File path
    Selection = FunctionParameters["VK_MarketAlbumID"];

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    ProductDescription = New Map;
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
    Options.Insert("sel", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProduct", Options);

    // END

    Process(Result, "VK", "AddProduct", , FunctionParameters);

EndProcedure

Procedure VK_EditProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    ProductDescription = New Map;
    ProductDescription.Insert("Name", "EditedTestProduct");

    Options = New Structure;
    Options.Insert("item", Product);
    Options.Insert("product", ProductDescription);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProduct", Options);

    // END

    Process(Result, "VK", "EditProduct");

EndProcedure

Procedure VK_AddProductToCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("items", Product);
    Options.Insert("sel", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProductToCollection", Options);

    // END

    Process(Result, "VK", "AddProductToCollection");

EndProcedure

Procedure VK_RemoveProductFromSelection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("item", Product);
    Options.Insert("sel", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "RemoveProductFromSelection", Options);

    // END

    Process(Result, "VK", "RemoveProductFromSelection");

EndProcedure

Procedure VK_DeleteProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    Options = New Structure;
    Options.Insert("item", Product);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProduct", Options);

    // END

    Process(Result, "VK", "DeleteProduct");

EndProcedure

Procedure VK_DeleteSelection(FunctionParameters)

    Parameters = GetVKParameters();

    Selection = FunctionParameters["VK_MarketAlbumID"];

    Options = New Structure;
    Options.Insert("sel", Selection);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteSelection", Options);

    // END

    Process(Result, "VK", "DeleteSelection");

EndProcedure

Procedure VK_CreateProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name = "Color";

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "CreateProductProperty", Options);

    // END

    Process(Result, "VK", "CreateProductProperty", , FunctionParameters);

EndProcedure

Procedure VK_EditProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name     = "Color (change.)";
    Property = FunctionParameters["VK_PropID"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("prop", Property);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProductProperty", Options);

    // END

    Process(Result, "VK", "EditProductProperty");

EndProcedure

Procedure VK_AddProductPropertyVariant(FunctionParameters)

    Counter    = 1; // SKIP
    Parameters = GetVKParameters();

    Property    = FunctionParameters["VK_PropID"];
    OptionArray = New Array;
    OptionArray.Add("Yellow");
    OptionArray.Add("Blue");
    OptionArray.Add("Red");

    For Each Value In OptionArray Do

        Result = OPI_VK.AddProductPropertyVariant(Value, Property, Parameters);

        Process(Result, "VK", "AddProductPropertyVariant", , FunctionParameters, Counter); // SKIP

        Counter = Counter + 1; // SKIP

    EndDo;

    // END

EndProcedure

Procedure VK_EditProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];
    Option   = FunctionParameters["VK_PropVarID1"];
    Value    = "New variant name";

    Options = New Structure;
    Options.Insert("value", Value);
    Options.Insert("prop", Property);
    Options.Insert("option", Option);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "EditProductPropertyVariant", Options);

    // END

    Process(Result, "VK", "EditProductPropertyVariant");

EndProcedure

Procedure VK_CreateProductWithProp(FunctionParameters)

    Parameters = GetVKParameters();

    Image1       = FunctionParameters["Picture"];
    Image2       = FunctionParameters["Picture2"];
    PropVariant1 = FunctionParameters["VK_PropVarID1"];
    PropVariant2 = FunctionParameters["VK_PropVarID2"];

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Product = New Map;
    Product.Insert("Name"             , "Test product (with prop)");
    Product.Insert("Description"      , "Product description");
    Product.Insert("Category"         , "20173");
    Product.Insert("Price"            , 1);
    Product.Insert("OldPrice"         , 15);
    Product.Insert("MainPhoto"        , Image1);
    Product.Insert("URL"              , "https://github.com/Bayselonarrend/OpenIntegrations");
    Product.Insert("AdditionalPhotos" , ImageArray);
    Product.Insert("MainInGroup"      , True);
    Product.Insert("Width"            , 20);
    Product.Insert("Height"           , 30);
    Product.Insert("Depth"            , 40);
    Product.Insert("Weight"           , 100);
    Product.Insert("SKU"              , 12345);
    Product.Insert("AvailableBalance" , "10");
    Product.Insert("PropertyValues"   , PropVariant1);

    Options = New Structure;
    Options.Insert("product", Product);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProduct", Options);

    // END

    Process(Result, "VK", "CreateProductWithProp", "First", FunctionParameters, 2);

    Product.Insert("Name"          , "Test product (another)");
    Product.Insert("PropertyValues", PropVariant2);

    Options = New Structure;
    Options.Insert("product", Product);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "AddProduct", Options);

    Process(Result, "VK", "CreateProductWithProp", "Second", FunctionParameters, 3);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetProductsByID(FunctionParameters)

    Parameters = GetVKParameters();

    Item1 = FunctionParameters["VK_MarketItemID2"];
    Item2 = FunctionParameters["VK_MarketItemID3"];

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Options = New Structure;
    Options.Insert("items", ProductsArray);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductsByID", Options);

    // END

    Process(Result, "VK", "GetProductsByID");

EndProcedure

Procedure VK_GroupProducts(FunctionParameters)

    Parameters = GetVKParameters();

    Item1 = FunctionParameters["VK_MarketItemID2"];
    Item2 = FunctionParameters["VK_MarketItemID3"];

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Options = New Structure;
    Options.Insert("items", ProductsArray);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GroupProducts", Options);

    // END

    Process(Result, "VK", "GroupProducts");

EndProcedure

Procedure VK_DeleteProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Option = FunctionParameters["VK_PropVarID1"];

    Options = New Structure;
    Options.Insert("option", Option);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProductPropertyVariant", Options);

    // END

    Process(Result, "VK", "DeleteProductPropertyVariant");

EndProcedure

Procedure VK_DeleteProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];

    Options = New Structure;
    Options.Insert("prop", Property);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "DeleteProductProperty", Options);

    // END

    Process(Result, "VK", "DeleteProductProperty");

EndProcedure

Procedure VK_GetProductList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductList", Options);

    // END

    Process(Result, "VK", "GetProductList");

EndProcedure

Procedure VK_GetSelectionList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetSelectionList", Options);

    // END

    Process(Result, "VK", "GetSelectionList");

EndProcedure

Procedure VK_GetPropertyList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetPropertyList", Options);

    // END

    Process(Result, "VK", "GetPropertyList");

EndProcedure

Procedure VK_GetOrderList(FunctionParameters)

    Parameters = GetVKParameters();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetOrderList", Options);

    // END

    Process(Result, "VK", "GetOrderList");

EndProcedure

Procedure VK_UploadVideoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Video       = FunctionParameters["Video"]; // URL, Binary Data or File path
    Name        = "NewVideo";
    Description = "Video description";

    Options = New Structure;
    Options.Insert("file", Video);
    Options.Insert("title", Name);
    Options.Insert("description", Description);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "UploadVideoToServer", Options);

    // END

    Process(Result, "VK", "UploadVideoToServer");

EndProcedure

Procedure VK_UploadPhotoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Image = FunctionParameters["Picture"]; // URL, Binary Data or File path
    View  = "Post";

    Options = New Structure;
    Options.Insert("file", Image);
    Options.Insert("auth", Parameters);
    Options.Insert("type", View);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "UploadPhotoToServer", Options);

    // END

    Process(Result, "VK", "UploadPhotoToServer");

EndProcedure

Procedure VK_ShortenLink(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("url", "https://github.com/Bayselonarrend/OpenIntegrations");
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "ShortenLink", Options);

EndProcedure

Procedure VK_GetAdvertisingCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetAdvertisingCategoryList", Options);

    // END

    Process(Result, "VK", "GetAdvertisingCategoryList");

EndProcedure

Procedure VK_GetProductDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vk", "GetProductDescription", Options);

    // END

    Process(Result, "VK", "GetProductDescription");

EndProcedure

#EndRegion

#Region YandexDisk

Procedure YandexDisk_GetDiskInformation(FunctionParameters)

    Token  = FunctionParameters["YandexDisk_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetDiskInformation", Options);

    // END

    Process(Result, "YandexDisk", "GetDiskInformation");

EndProcedure

Procedure YandexDisk_CreateFolder(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = "/" + String(New UUID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "CreateFolder", Options);

    // END

    Process(Result, "YandexDisk", "CreateFolder", , Token, Path);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

EndProcedure

Procedure YandexDisk_UploadFileByURL(FunctionParameters)

    Token   = FunctionParameters["YandexDisk_Token"];
    Address = FunctionParameters["Picture"];
    Path    = "/" + String(New UUID) + ".png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("url", Address);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFileByURL", Options);

    // END

    Process(Result, "YandexDisk", "UploadFileByURL", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetObject", Options);

    // END

    Process(Result, "YandexDisk", "GetObject", , Path);

EndProcedure

Procedure YandexDisk_DeleteObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("can", Ложь);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "DeleteObject", Options);

    // END

    Process(Result, "YandexDisk", "DeleteObject");

EndProcedure

Procedure YandexDisk_UploadFile(FunctionParameters)

    Path1 = "/" + String(New UUID) + ".png";
    Path2 = "/" + String(New UUID) + ".png";

    Token = FunctionParameters["YandexDisk_Token"];
    Image = FunctionParameters["Picture"]; // URL

    TFN = GetTempFileName("png"); // Path
    CopyFile(Image, TFN);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path1);
    Options.Insert("file", Image);
    Options.Insert("rewrite", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFile", Options);

    Process(Result, "YandexDisk", "UploadFile", "URL"); // SKIP

    OPI_YandexDisk.DeleteObject(Token, Path1, False); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path2);
    Options.Insert("file", TFN);
    Options.Insert("rewrite", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "UploadFile", Options);

    // END

    DeleteFiles(TFN);
    Process(Result, "YandexDisk", "UploadFile");

    OPI_YandexDisk.DeleteObject(Token, Path2, False); // SKIP

EndProcedure

Procedure YandexDisk_CreateObjectCopy(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", Original);
    Options.Insert("to", Path);
    Options.Insert("rewrite", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "CreateObjectCopy", Options);

    // END

    Process(Result, "YandexDisk", "CreateObjectCopy", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetDownloadLink(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetDownloadLink", Options);

    // END

    Process(Result, "YandexDisk", "GetDownloadLink");

EndProcedure

Procedure YandexDisk_DownloadFile(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "DownloadFile", Options);

    // END

    Process(Result, "YandexDisk", "DownloadFile");

EndProcedure

Procedure YandexDisk_GetFilesList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;
    FilterByType    = "image";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("amount", Count);
    Options.Insert("offset", OffsetFromStart);
    Options.Insert("type", FilterByType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetFilesList", Options);

    // END

    Process(Result, "YandexDisk", "GetFilesList", , Count, OffsetFromStart);

EndProcedure

Procedure YandexDisk_MoveObject(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", Original);
    Options.Insert("to", Path);
    Options.Insert("rewrite", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "MoveObject", Options);

    // END

    Process(Result, "YandexDisk", "MoveObject", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetPublishedObjectsList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("amount", Count);
    Options.Insert("offset", OffsetFromStart);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetPublishedObjectsList", Options);

    // END

    Process(Result, "YandexDisk", "GetPublishedObjectsList", , Count, OffsetFromStart);

EndProcedure

Procedure YandexDisk_PublishObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "PublishObject", Options);

    // END

    Process(Result, "YandexDisk", "PublishObject", , FunctionParameters, Path);

EndProcedure

Procedure YandexDisk_GetDownloadLinkForPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetDownloadLinkForPublicObject", Options);

    // END

    Process(Result, "YandexDisk", "GetDownloadLinkForPublicObject");

EndProcedure

Procedure YandexDisk_GetPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "GetPublicObject", Options);

    // END

    Process(Result, "YandexDisk", "GetPublicObject");

EndProcedure

Procedure YandexDisk_SavePublicObjectToDisk(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "SavePublicObjectToDisk", Options);

    // END

    Process(Result, "YandexDisk", "SavePublicObjectToDisk");

EndProcedure

Procedure YandexDisk_CancelObjectPublication(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("yadisk", "CancelObjectPublication", Options);

    // END

    Process(Result, "YandexDisk", "CancelObjectPublication", , Path);

EndProcedure

#EndRegion

#Region Viber

Procedure Viber_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Viber_ChannelToken"];
    URL   = "http://api.athenaeum.digital/hs/viber";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SetWebhook", Options);

    // END

    Process(Result, "Viber", "SetWebhook");

EndProcedure

Procedure Viber_GetChannelInformation(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "GetChannelInformation", Options);

    // END

    Process(Result, "Viber", "GetChannelInformation");

EndProcedure

Procedure Viber_GetUserData(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "GetUserData", Options);

    // END

    Process(Result, "Viber", "GetUserData");

EndProcedure

Procedure Viber_GetOnlineUsers(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("users", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "GetOnlineUsers", Options);

    // END

    Process(Result, "Viber", "GetOnlineUsers");

EndProcedure

Procedure Viber_CreateKeyboardFromArrayButton(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Options = New Structure;
    Options.Insert("buttons", ButtonArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "CreateKeyboardFromArrayButton", Options);

    // END

    Process(Result, "Viber", "CreateKeyboardFromArrayButton");

EndProcedure

Procedure Viber_SendTextMessage(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("text", Text);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendTextMessage", Options);

    Process(Result, "Viber", "SendTextMessage"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("text", Text);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("keyboard", Keyboard);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendTextMessage", Options);

    // END

    Process(Result, "Viber", "SendTextMessage", "Channel");

EndProcedure

Procedure Viber_SendImage(FunctionParameters)

    Description = "TestMessage";
    URL         = FunctionParameters["Picture"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("picture", URL);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendImage", Options);

    Process(Result, "Viber", "SendImage"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("picture", URL);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendImage", Options);

    // END

    Process(Result, "Viber", "SendImage", "Channel");

EndProcedure

Procedure Viber_SendFile(FunctionParameters)

    Extension = "docx";
    URL       = FunctionParameters["Document"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", URL);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("ext", Extension);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendFile", Options);

    Process(Result, "Viber", "SendFile"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", URL);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);
    Options.Insert("ext", Extension);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendFile", Options);

    // END

    Process(Result, "Viber", "SendFile", "Channel");

EndProcedure

Procedure Viber_SendContact(FunctionParameters)

    Name  = "Petr Petrov";
    Phone = "+123456789";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("name", Name);
    Options.Insert("phone", Phone);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendContact", Options);

    Process(Result, "Viber", "SendContact"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("name", Name);
    Options.Insert("phone", Phone);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendContact", Options);

    // END

    Process(Result, "Viber", "SendContact", "Channel");

EndProcedure

Procedure Viber_SendLocation(FunctionParameters)

    Latitude  = "48.87373649724122";
    Longitude = "2.2954639195323967";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLocation", Options);

    Process(Result, "Viber", "SendLocation"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLocation", Options);

    // END

    Process(Result, "Viber", "SendLocation", "Channel");

EndProcedure

Procedure Viber_SendLink(FunctionParameters)

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLink", Options);

    Process(Result, "Viber", "SendLink"); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("ischannel", SendingToChannel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("viber", "SendLink", Options);

    // END

    Process(Result, "Viber", "SendLink", "Channel");

EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure GoogleWorkspace_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Options = New Structure;
    Options.Insert("id", ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("google", "FormCodeRetrievalLink", Options);

    // END

    Process(Result, "GoogleWorkspace", "FormCodeRetrievalLink");

EndProcedure

Procedure GoogleWorkspace_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("code", Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("google", "GetTokenByCode", Options);

    // END

    Process(Result, "GoogleWorkspace", "GetTokenByCode");

EndProcedure

Procedure GoogleWorkspace_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Options = New Structure;
    Options.Insert("id", ClientID);
    Options.Insert("secret", ClientSecret);
    Options.Insert("refresh", RefreshToken);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("google", "RefreshToken", Options);

    // END

    Process(Result, "GoogleWorkspace", "RefreshToken");

EndProcedure

Procedure GoogleWorkspace_GetServiceAccountToken(FunctionParameters)

    Data = FunctionParameters["Google_ServiceData"]; // URL, binary Data, file or collection

    Token = FunctionParameters["Access_Token"]; // SKIP
    Data  = OPI_HTTPRequests // SKIP
        .NewRequest() // SKIP
        .Initialize(Data) // SKIP
        .AddBearerAuthorization(Token) // SKIP
        .ProcessRequest("GET") // SKIP
        .ReturnResponseAsBinaryData(); // SKIP

    Scope = New Array;
    Scope.Add("https://www.googleapis.com/auth/calendar");
    Scope.Add("https://www.googleapis.com/auth/drive");
    Scope.Add("https://www.googleapis.com/auth/spreadsheets");

    Options = New Structure;
    Options.Insert("auth", Data);
    Options.Insert("scope", Scope);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("google", "GetServiceAccountToken", Options);

    // END

    Process(Result, "GoogleWorkspace", "GetServiceAccountToken");

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure GoogleCalendar_GetCalendarList(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetCalendarList", Options);

    // END

    Process(Result, "GoogleCalendar", "GetCalendarList");

EndProcedure

Procedure GoogleCalendar_CreateCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestCalendar";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "CreateCalendar", Options);

    // END

    Process(Result, "GoogleCalendar", "CreateCalendar", , FunctionParameters, Name);

EndProcedure

Procedure GoogleCalendar_EditCalendarMetadata(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New name";
    Description = "New description";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("title", Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditCalendarMetadata", Options);

    // END

    Process(Result, "GoogleCalendar", "EditCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetCalendarMetadata(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetCalendarMetadata", Options);

    // END

    Name        = "New name";
    Description = "New description";

    Process(Result, "GoogleCalendar", "GetCalendarMetadata", , Name, Description);

EndProcedure

Procedure GoogleCalendar_AddCalendarToList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "AddCalendarToList", Options);

    // END

    Name        = "New name";
    Description = "New description";

    Process(Result, "GoogleCalendar", "AddCalendarToList", , Name, Description);

EndProcedure

Procedure GoogleCalendar_EditListCalendar(FunctionParameters)

    Token          = FunctionParameters["Google_Token"];
    Calendar       = FunctionParameters["Google_NewCalendarID"];
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("primary", PrimaryColor);
    Options.Insert("secondary", SecondaryColor);
    Options.Insert("hidden", Hidden);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditListCalendar", Options);

    // END

    Process(Result, "GoogleCalendar", "EditListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_GetListCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetListCalendar", Options);

    // END

    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";

    Process(Result, "GoogleCalendar", "GetListCalendar", , PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_ClearMainCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "ClearMainCalendar", Options);

    // END

    Process(Result, "GoogleCalendar", "ClearMainCalendar");

EndProcedure

Procedure GoogleCalendar_DeleteCalendarFromList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteCalendarFromList", Options);

    // END

    Process(Result, "GoogleCalendar", "DeleteCalendarFromList");

EndProcedure

Procedure GoogleCalendar_DeleteCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteCalendar", Options);

    // END

    Process(Result, "GoogleCalendar", "DeleteCalendar");

EndProcedure

Procedure GoogleCalendar_CreateEvent(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();
    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New event";
    Description = "TestEventDescription";
    Hour        = 3600;

    Image1      = FunctionParameters["Picture"]; // URL, Binary or File path
    Image2      = FunctionParameters["Picture2"]; // URL, Binary or File path
    Attachments = New Map;

    Attachments.Insert("Image1", Image1);
    Attachments.Insert("Image2", Image2);

    EventDescription = New Map;
    EventDescription.Insert("Description"          , Description);
    EventDescription.Insert("Title"                , Name);
    EventDescription.Insert("Venue"                , "InOffice");
    EventDescription.Insert("StartDate"            , CurrentDate);
    EventDescription.Insert("EndDate"              , EventDescription["StartDate"] + Hour);
    EventDescription.Insert("ArrayOfAttachmentURLs", Attachments);
    EventDescription.Insert("SendNotifications"    , True);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("props", EventDescription);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "CreateEvent", Options);

    // END

    Process(Result, "GoogleCalendar", "CreateEvent", , FunctionParameters, Name, Description);

EndProcedure

Procedure GoogleCalendar_EditEvent(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Event       = FunctionParameters["Google_EventID"];
    Description = "New event description";

    EventDescription = New Map;
    EventDescription.Insert("Description", Description);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("props", EventDescription);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "EditEvent", Options);

    // END

    Name = "New event";

    Process(Result, "GoogleCalendar", "EditEvent", , Name, Description);

EndProcedure

Procedure GoogleCalendar_GetEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEvent", Options);

    // END

    Name        = "New event";
    Description = "New event description";

    Process(Result, "GoogleCalendar", "GetEvent", , Name, Description);

EndProcedure

Procedure GoogleCalendar_MoveEvent(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Event = FunctionParameters["Google_EventID"];

    SourceCalendar = FunctionParameters["Google_NewCalendarID"];
    TargetCalendar = FunctionParameters["Google_CalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", SourceCalendar);
    Options.Insert("to", TargetCalendar);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "MoveEvent", Options);

    // END

    Name        = "New event";
    Description = "New event description";

    Process(Result, "GoogleCalendar", "MoveEvent", , Name, Description);

    OPI_GoogleCalendar.MoveEvent(Token, TargetCalendar, SourceCalendar, Event);

EndProcedure

Procedure GoogleCalendar_DeleteEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);
    Options.Insert("event", Event);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "DeleteEvent", Options);

    // END

    Process(Result, "GoogleCalendar", "DeleteEvent");

EndProcedure

Procedure GoogleCalendar_GetEventList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("calendar", Calendar);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEventList", Options);

    // END

    Process(Result, "GoogleCalendar", "GetEventList");

EndProcedure

Procedure GoogleCalendar_GetEventDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gcalendar", "GetEventDescription", Options);

    // END

    Process(Result, "GoogleCalendar", "GetEventDescription");

EndProcedure

#EndRegion

#Region GoogleDrive

Procedure GoogleDrive_GetDirectoriesList(FunctionParameters)

    Name  = "TestFolder";
    Token = FunctionParameters["Google_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("querry", Name);
    Options.Insert("depth", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetDirectoriesList", Options);

    // END

    Process(Result, "GoogleDrive", "GetDirectoriesList", , FunctionParameters);

EndProcedure

Procedure GoogleDrive_GetObjectInformation(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_Catalog"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetObjectInformation", Options);

    // END

    Process(Result, "GoogleDrive", "GetObjectInformation");

EndProcedure

Procedure GoogleDrive_UploadFile(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Image     = FunctionParameters["Picture"];
    Directory = FunctionParameters["GD_Catalog"];

    Options = New Structure;

    Description = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFileDescription", Options);
    Description.Insert("Parent", Directory);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", Image);
    Options.Insert("props", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UploadFile", Options);

    // END

    Process(Result, "GoogleDrive", "UploadFile", , FunctionParameters, Description);

    If Not OPI_Tools.IsOneScript() And FunctionParameters.Property("Big") Then

        BigFile = FunctionParameters["Big"];
        Description.Insert("Name", "big.rar");

        Options = New Structure;
        Options.Insert("token", Token);
        Options.Insert("file", BigFile);
        Options.Insert("props", Description);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UploadFile", Options);

        Process(Result, "GoogleDrive", "UploadFile", "Big", FunctionParameters, Description);

    EndIf;

EndProcedure

Procedure GoogleDrive_CopyObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("title", NewName);
    Options.Insert("catalog", NewParent);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CopyObject", Options);

    // END

    Process(Result, "GoogleDrive", "CopyObject", , FunctionParameters, NewName);

EndProcedure

Procedure GoogleDrive_DownloadFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DownloadFile", Options);

    // END

    Process(Result, "GoogleDrive", "DownloadFile", , FunctionParameters);

EndProcedure

Procedure GoogleDrive_UpdateFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    NewName    = "UpdatedFile.jpg";
    Identifier = FunctionParameters["GD_File"];
    File       = FunctionParameters["Picture2"]; // URL, Binary Data or File path

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("file", File);
    Options.Insert("title", NewName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "UpdateFile", Options);

    // END

    Process(Result, "GoogleDrive", "UpdateFile", , NewName);

EndProcedure

Procedure GoogleDrive_GetFilesList(FunctionParameters)

    Token        = FunctionParameters["Google_Token"];
    Directory    = "root";
    NameContains = "data";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("querry", NameContains);
    Options.Insert("catalog", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFilesList", Options);

    // END

    Process(Result, "GoogleDrive", "GetFilesList");

EndProcedure

Procedure GoogleDrive_DeleteObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DeleteObject", Options);

    // END

    Process(Result, "GoogleDrive", "DeleteObject");

    For Each Deletable In FunctionParameters["ArrayOfDeletions"] Do

        Result = OPI_GoogleDrive.DeleteObject(Token, Deletable);

        Process(Result, "GoogleDrive", "DeleteObject", "Additional");

        OPI_Tools.Pause(2);

    EndDo;

EndProcedure

Procedure GoogleDrive_GetFileDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetFileDescription", Options);

    // END

    Process(Result, "GoogleDrive", "GetFileDescription");

EndProcedure

Procedure GoogleDrive_CreateComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    Comment    = "Comment text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("text", Comment);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateComment", Options);

    // END

    Process(Result, "GoogleDrive", "CreateComment", , FunctionParameters, Comment);

EndProcedure

Procedure GoogleDrive_GetComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetComment", Options);

    // END

    Process(Result, "GoogleDrive", "GetComment");

EndProcedure

Procedure GoogleDrive_GetCommentList(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "GetCommentList", Options);

    // END

    Process(Result, "GoogleDrive", "GetCommentList");

EndProcedure

Procedure GoogleDrive_DeleteComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("object", Identifier);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "DeleteComment", Options);

    // END

    Process(Result, "GoogleDrive", "DeleteComment");

EndProcedure

Procedure GoogleDrive_CreateFolder(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Directory = FunctionParameters["GD_Catalog"];
    Name      = "TestFolder";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);
    Options.Insert("catalog", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateFolder", Options);

    // END

    Process(Result, "GoogleDrive", "CreateFolder");

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gdrive", "CreateFolder", Options);

    Process(Result, "GoogleDrive", "CreateFolder", "Root");

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

EndProcedure

#EndRegion

#Region GoogleSheets

Procedure GoogleSheets_CreateSpreadsheet(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);
    Options.Insert("sheets", SheetArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CreateSpreadsheet", Options);

    // END

    Process(Result, "GoogleSheets", "CreateSpreadsheet", , FunctionParameters, Name, SheetArray);

    Name   = "Test table (new.)";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);
    Options.Insert("sheets", SheetArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CreateSpreadsheet", Options);

    Process(Result, "GoogleSheets", "CreateSpreadsheet", "Additionally", FunctionParameters, Name);

EndProcedure

Procedure GoogleSheets_GetSpreadsheet(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GS_Spreadsheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Identifier);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetSpreadsheet", Options);

    // END

    Process(Result, "GoogleSheets", "GetSpreadsheet");

EndProcedure

Procedure GoogleSheets_CopySheet(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    From   = FunctionParameters["GS_Spreadsheet"];
    Target = FunctionParameters["GS_Spreadsheet2"];
    Sheet  = FunctionParameters["GS_Sheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", From);
    Options.Insert("to", Target);
    Options.Insert("sheet", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "CopySheet", Options);

    // END

    Process(Result, "GoogleSheets", "CopySheet");

EndProcedure

Procedure GoogleSheets_AddSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "TestSheet";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "AddSheet", Options);

    // END

    Process(Result, "GoogleSheets", "AddSheet");

EndProcedure

Procedure GoogleSheets_DeleteSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = FunctionParameters["GS_Sheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("sheet", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "DeleteSheet", Options);

    // END

    Process(Result, "GoogleSheets", "DeleteSheet", , Spreadsheet);

EndProcedure

Procedure GoogleSheets_EditSpreadsheetTitle(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "Test table (changed.)";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "EditSpreadsheetTitle", Options);

    // END

    Process(Result, "GoogleSheets", "EditSpreadsheetTitle", , Spreadsheet);

EndProcedure

Procedure GoogleSheets_GetTable(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetSpreadsheet", Options);

    // END

    Process(Result, "GoogleSheets", "GetTable");

EndProcedure

Procedure GoogleSheets_SetCellValues(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("data", ValueMapping);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "SetCellValues", Options);

    // END

    Process(Result, "GoogleSheets", "SetCellValues", , ValueMapping.Count());

EndProcedure

Procedure GoogleSheets_GetCellValues(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("cells", CellsArray);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetCellValues", Options);

    // END

    Process(Result, "GoogleSheets", "GetCellValues", , CellsArray.Count());

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "GetCellValues", Options);

    Process(Result, "GoogleSheets", "GetCellValues", "All", Spreadsheet);

EndProcedure

Procedure GoogleSheets_ClearCells(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("spreadsheet", Spreadsheet);
    Options.Insert("cells", CellsArray);
    Options.Insert("sheetname", Sheet);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("gsheets", "ClearCells", Options);

    // END

    Process(Result, "GoogleSheets", "ClearCells", , CellsArray.Count());

EndProcedure

#EndRegion

#Region Slack

Procedure Slack_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetBotInformation", Options);

    // END

    Process(Result, "Slack", "GetBotInformation");

EndProcedure

Procedure Slack_GetUserList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetUserList", Options);

    // END

    Process(Result, "Slack", "GetUserList");

EndProcedure

Procedure Slack_GetWorkspaceList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetWorkspaceList", Options);

    // END

    Process(Result, "Slack", "GetWorkspaceList");

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

    Process(Result, "Slack", "SendMessage", , FunctionParameters, Text, Channel); // SKIP

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

    Process(Result, "Slack", "SendMessage", "Image", FunctionParameters, Text, Channel); // SKIP

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

    Process(Result, "Slack", "SendMessage", "Sheduled", FunctionParameters, Text, Channel);

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

    Process(Result, "Slack", "GenerateImageBlock");

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

    Process(Result, "Slack", "EditMessage", , Text, Channel);

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

    Process(Result, "Slack", "GetMessageReplyList");

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

    Process(Result, "Slack", "GetMessageLink", , Channel);

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

    Process(Result, "Slack", "DeleteMessage");

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

    Process(Result, "Slack", "SendEphemeralMessage");

EndProcedure

Procedure Slack_GetDelayedMessageList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetDelayedMessageList", Options);

    // END

    Process(Result, "Slack", "GetDelayedMessageList");

EndProcedure

Procedure Slack_CreateChannel(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Name  = "testconv" + String(New UUID);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "CreateChannel", Options);

    // END

    Process(Result, "Slack", "CreateChannel", , FunctionParameters, Name);

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

    Process(Result, "Slack", "SetChannelTopic", , Topic);

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

    Process(Result, "Slack", "SetChannelGoal");

EndProcedure

Procedure Slack_GetChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannel", Options);

    // END

    Process(Result, "Slack", "GetChannel", , FunctionParameters["Slack_NewChannelName"]);

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

    Process(Result, "Slack", "InviteUsersToChannel", , FunctionParameters["Slack_NewChannelName"]);

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

    Process(Result, "Slack", "KickUserFromChannel");

EndProcedure

Procedure Slack_GetChannelHistory(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelHistory", Options);

    // END

    Process(Result, "Slack", "GetChannelHistory");

EndProcedure

Procedure Slack_GetChannelUserList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelUserList", Options);

    // END

    Process(Result, "Slack", "GetChannelUserList");

EndProcedure

Procedure Slack_LeaveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "LeaveChannel", Options);

    // END

    Process(Result, "Slack", "LeaveChannel");

EndProcedure

Procedure Slack_JoinChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "JoinChannel", Options);

    // END

    Process(Result, "Slack", "JoinChannel", , FunctionParameters["Slack_NewChannelName"]);

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

    Process(Result, "Slack", "RenameChannel", , Name);

EndProcedure

Procedure Slack_ArchiveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "ArchiveChannel", Options);

    // END

    Process(Result, "Slack", "ArchiveChannel");

EndProcedure

Procedure Slack_GetChannelList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetChannelList", Options);

    // END

    Process(Result, "Slack", "GetChannelList");

EndProcedure

Procedure Slack_OpenDialog(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    User  = FunctionParameters["Slack_User"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("users", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "OpenDialog", Options);

    // END

    Process(Result, "Slack", "OpenDialog", , FunctionParameters);

    Channel = Result["channel"]["id"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);
    Options.Insert("text", "Test dialog");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "SendMessage", Options);

    Process(Result, "Slack", "OpenDialog", "Message", FunctionParameters);

EndProcedure

Procedure Slack_CloseDialog(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Dialog = FunctionParameters["Slack_Dialog"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("conv", Dialog);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "CloseDialog", Options);

    // END

    Process(Result, "Slack", "CloseDialog");

EndProcedure

Procedure Slack_GetFilesList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFilesList", Options);

    // END

    Process(Result, "Slack", "GetFilesList");

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFilesList", Options);

    Process(Result, "Slack", "GetFilesList", "All");

EndProcedure

Procedure Slack_UploadFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    File    = FunctionParameters["Document"]; // URL, Binary Data or File path

    FileName = "megadoc.docx";
    Title    = "NewFile";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "UploadFile", Options);

    Process(Result, "Slack", "UploadFile", , FunctionParameters, FileName); // SKIP
    Process(Result, "Slack", "MakeFilePublic"); // SKIP
    Process(Result, "Slack", "MakeFilePrivate"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("title", Title);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "UploadFile", Options);

    // END

    Process(Result, "Slack", "UploadFile", "Channel", FunctionParameters, FileName);
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

    Process(Result, "Slack", "MakeFilePublic", "No record");

EndProcedure

Procedure Slack_MakeFilePrivate(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "MakeFilePrivate", Options);

    // END

    Process(Result, "Slack", "MakeFilePrivate", "No record");

EndProcedure

Procedure Slack_GetFileData(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetFileData", Options);

    // END

    Process(Result, "Slack", "GetFileData", , "megadoc.docx");

EndProcedure

Procedure Slack_DeleteFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteFile", Options);

    // END

    Process(Result, "Slack", "DeleteFile");

EndProcedure

Procedure Slack_GetExternalFileList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("channel", Channel);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFileList", Options);

    // END

    Process(Result, "Slack", "GetExternalFileList");

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFileList", Options);

    Process(Result, "Slack", "GetExternalFileList", "All");

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

    Process(Result, "Slack", "AddExternalFile", , FunctionParameters, Title);

EndProcedure

Procedure Slack_GetExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "GetExternalFile", Options);

    // END

    Process(Result, "Slack", "GetExternalFile");

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

    Process(Result, "Slack", "SendExternalFile");

EndProcedure

Procedure Slack_DeleteExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("slack", "DeleteExternalFile", Options);

    // END

    Process(Result, "Slack", "DeleteExternalFile");

EndProcedure

#EndRegion

#Region Airtable

Procedure Airtable_CreateDatabase(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("ws", Region);
    Options.Insert("title", Name);
    Options.Insert("tablesdata", TableMapping);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateDatabase", Options);

    // END

    Process(Result, "Airtable", "CreateDatabase", , FunctionParameters, TableName);


EndProcedure

Procedure Airtable_GetDatabaseTables(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetDatabaseTables", Options);

    // END

    Process(Result, "Airtable", "GetDatabaseTables");

EndProcedure

Procedure Airtable_GetListOfBases(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetListOfBases", Options);

    // END

    Process(Result, "Airtable", "GetListOfBases");

EndProcedure

Procedure Airtable_GetNumberField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Number");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetNumberField", Options);

    // END

    Process(Result, "Airtable", "GetNumberField");

EndProcedure

Procedure Airtable_GetStringField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "String");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetStringField", Options);

    // END

    Process(Result, "Airtable", "GetStringField");

EndProcedure

Procedure Airtable_GetAttachmentField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Attachment");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetAttachmentField", Options);

    // END

    Process(Result, "Airtable", "GetAttachmentField");

EndProcedure

Procedure Airtable_GetCheckboxField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Checkbox");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetCheckboxField", Options);

    // END

    Process(Result, "Airtable", "GetCheckboxField");

EndProcedure

Procedure Airtable_GetDateField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Date");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetDateField", Options);

    // END

    Process(Result, "Airtable", "GetDateField");

EndProcedure

Procedure Airtable_GetPhoneField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Phone");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetPhoneField", Options);

    // END

    Process(Result, "Airtable", "GetPhoneField");

EndProcedure

Procedure Airtable_GetEmailField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Email");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetEmailField", Options);

    // END

    Process(Result, "Airtable", "GetEmailField");

EndProcedure

Procedure Airtable_GetLinkField(FunctionParameters)

    Options = New Structure;
    Options.Insert("title", "Link");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetLinkField", Options);

    // END

    Process(Result, "Airtable", "GetLinkField");

EndProcedure

Procedure Airtable_CreateTable(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("title", Name);
    Options.Insert("fieldsdata", FieldArray);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateTable", Options);

    // END

    Process(Result, "Airtable", "CreateTable", , FunctionParameters, Name, Description);

EndProcedure

Procedure Airtable_ModifyTable(FunctionParameters)

    Token       = FunctionParameters["Airtable_Token"];
    Base        = FunctionParameters["Airtable_Base"];
    Table       = FunctionParameters["Airtable_Table"];
    Name        = "Test table 2 (change.)";
    Description = "New table (change.)";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("title", Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "ModifyTable", Options);

    // END

    Process(Result, "Airtable", "ModifyTable", , Name, Description);

EndProcedure

Procedure Airtable_CreateField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Name  = String(New UUID);

    Options = New Structure;
    Options.Insert("title", Name);

    Field = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetNumberField", Options);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("fielddata", Field);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateField", Options);

    // END

    Process(Result, "Airtable", "CreateField", , FunctionParameters, Name);

EndProcedure

Procedure Airtable_ModifyField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Field = FunctionParameters["Airtable_Field"];

    Name        = String(New UUID) + "(change.)";
    Description = "New description";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("field", Field);
    Options.Insert("title", Name);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "ModifyField", Options);

    // END

    Process(Result, "Airtable", "ModifyField", , Name, Description);

EndProcedure

Procedure Airtable_CreatePosts(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("data", ArrayOfDescriptions);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreatePosts", Options);

    // END

    Process(Result, "Airtable", "CreatePosts", , FunctionParameters);

    ArrayOfDeletions = New Array;

    For Each Record In Result["records"] Do

        CurrentRecord = Record["id"];
        ArrayOfDeletions.Add(CurrentRecord);

    EndDo;

    OPI_Airtable.DeleteRecords(Token, Base, Table, ArrayOfDeletions);

    // Single

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("data", RowDescription1);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreatePosts", Options);

    Process(Result, "Airtable", "CreatePosts", "Single", FunctionParameters, Number, String);

EndProcedure

Procedure Airtable_GetRecord(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetRecord", Options);

    // END

    Process(Result, "Airtable", "GetRecord", , Record);

EndProcedure

Procedure Airtable_CreateComment(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];
    Text   = "TestComment";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "CreateComment", Options);

    // END

    Process(Result, "Airtable", "CreateComment", , FunctionParameters, Text);

EndProcedure

Procedure Airtable_EditComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Text   = "Test comment (change.)";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);
    Options.Insert("comment", Comment);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "EditComment", Options);

    // END

    Process(Result, "Airtable", "EditComment", , Text);

EndProcedure

Procedure Airtable_GetComments(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetComments", Options);

    // END

    Process(Result, "Airtable", "GetComments");

EndProcedure

Procedure Airtable_DeleteComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("record", Record);
    Options.Insert("comment", Comment);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "DeleteComment", Options);

    // END

    Process(Result, "Airtable", "DeleteComment", , Comment);

EndProcedure

Procedure Airtable_GetListOfRecords(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "GetListOfRecords", Options);

    // END

    Process(Result, "Airtable", "GetListOfRecords");

EndProcedure

Procedure Airtable_DeleteRecords(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("table", Table);
    Options.Insert("records", Record);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("airtable", "DeleteRecords", Options);

    // END

    Process(Result, "Airtable", "DeleteRecords");

EndProcedure

#EndRegion

#Region Twitter

Procedure Twitter_GetToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Code       = "123456";

    Options = New Structure;
    Options.Insert("code", Code);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "GetToken", Options);

    // END

    Process(Result, "Twitter", "GetToken");

EndProcedure

Procedure Twitter_GetAuthorizationLink(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "GetAuthorizationLink", Options);

    // END

    Process(Result, "Twitter", "GetAuthorizationLink");

EndProcedure

Procedure Twitter_RefreshToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Options = New Structure;
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "RefreshToken", Options);

    // END

    Process(Result, "Twitter", "RefreshToken");

EndProcedure

Procedure Twitter_CreateTextTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateTextTweet", Options);

    // END

    Process(Result, "Twitter", "CreateTextTweet", , Text);

EndProcedure

Procedure Twitter_CreateImageTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image  = FunctionParameters["Picture"]; // URL, Binary or File path
    Image2 = FunctionParameters["Picture2"]; // URL, Binary or File path

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(Image2);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("pictures", ImageArray);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateImageTweet", Options);

    Process(Result, "Twitter", "CreateImageTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("pictures", Image);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateImageTweet", Options);

    // END

    Process(Result, "Twitter", "CreateImageTweet", "Single", Text);

    Image = OPI_HTTPRequests.Get(Image);

    Text   = "TestTweet" + String(New UUID);
    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("pictures", Image);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateImageTweet", Options);

    Process(Result, "Twitter", "CreateImageTweet", "Binary", Text);

EndProcedure

Procedure Twitter_CreateVideoTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Video  = FunctionParameters["Video"]; // URL, Binary or File path
    Video2 = FunctionParameters["Video"]; // URL, Binary or File path

    VideosArray = New Array;
    VideosArray.Add(Video);
    VideosArray.Add(Video2);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("videos", VideosArray);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateVideoTweet", Options);

    Process(Result, "Twitter", "CreateVideoTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("videos", Video);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateVideoTweet", Options);

    // END

    Process(Result, "Twitter", "CreateVideoTweet", "Single", Text);

    Video = OPI_HTTPRequests.Get(Video);

    Text   = "TestTweet" + String(New UUID);
    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("videos", Video);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateVideoTweet", Options);

    Process(Result, "Twitter", "CreateVideoTweet", "Binary", Text);

EndProcedure

Procedure Twitter_CreateGifTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    GIF  = FunctionParameters["GIF"]; // URL, Binary or File path
    Gif2 = FunctionParameters["GIF"]; // URL, Binary or File path

    GifsArray = New Array;
    GifsArray.Add(GIF);
    GifsArray.Add(Gif2);

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("gifs", GifsArray);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateGifTweet", Options);

    Process(Result, "Twitter", "CreateGifTweet", , Text); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("gifs", GIF);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateGifTweet", Options);

    // END

    Process(Result, "Twitter", "CreateGifTweet", "Single", Text);

    GIF = OPI_HTTPRequests.Get(GIF);

    Text   = "TestTweet" + String(New UUID);
    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("gifs", GIF);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateGifTweet", Options);

    Process(Result, "Twitter", "CreateGifTweet", "Binary", Text);

EndProcedure

Procedure Twitter_CreatePollTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    AnswersArray = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");

    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("options", AnswersArray);
    Options.Insert("duration", 60);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreatePollTweet", Options);

    // END

    Process(Result, "Twitter", "CreatePollTweet", , Text);

EndProcedure

Procedure Twitter_CreateCustomTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or File path
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or File path

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Options = New Structure;
    Options.Insert("files", ImageArray);
    Options.Insert("type", "tweet_image");
    Options.Insert("auth", Parameters);

    MediaArray = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "UploadAttachmentsArray", Options);
    Options = New Structure;
    Options.Insert("text", Text);
    Options.Insert("media", MediaArray);
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "CreateCustomTweet", Options);

    // END

    Process(Result, "Twitter", "CreateCustomTweet", , Text);

EndProcedure

Procedure Twitter_UploadAttachmentsArray(FunctionParameters)

    Parameters = GetTwitterAuthData();

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or File path
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or File path

    ImageArray = New Array;
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Options = New Structure;
    Options.Insert("files", ImageArray);
    Options.Insert("type", "tweet_image");
    Options.Insert("auth", Parameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("twitter", "UploadAttachmentsArray", Options);

    // END

    Process(Result, "Twitter", "UploadAttachmentsArray");

EndProcedure

#EndRegion

#Region Notion

Procedure Notion_CreatePage(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Parent);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreatePage", Options);

    // END

    Process(Result, "Notion", "CreatePage", , FunctionParameters);

EndProcedure

Procedure Notion_CreateDatabase(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Properties = New Map;
    Properties.Insert("Name"        , "title");
    Properties.Insert("Description" , "rich_text");
    Properties.Insert("Number"      , "number");
    Properties.Insert("CreationDate", "date");
    Properties.Insert("Image"       , "files");
    Properties.Insert("Active"      , "checkbox");
    Properties.Insert("Website"     , "url");
    Properties.Insert("Email"       , "email");
    Properties.Insert("Phone"       , "phone_number");
    Properties.Insert("User"        , "people");

    ValueSelection = New Map;
    ValueSelection.Insert("New"        , "green");
    ValueSelection.Insert("InProgress" , "yellow");
    ValueSelection.Insert("Remote"     , "red");

    Properties.Insert("Status", ValueSelection);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Parent);
    Options.Insert("title", Title);
    Options.Insert("props", Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreateDatabase", Options);

    // END

    Process(Result, "Notion", "CreateDatabase", , FunctionParameters);

EndProcedure

Procedure Notion_EditDatabaseProperties(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Title       = "TestTitle";
    Description = "TestDescription";

    Properties = New Map;
    Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
    Properties.Insert("Website"); // Field "Website" will deleted

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("props", Properties);
    Options.Insert("title", Title);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "EditDatabaseProperties", Options);

    // END

    Process(Result, "Notion", "EditDatabaseProperties");

EndProcedure

Procedure Notion_GetPage(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Page  = FunctionParameters["Notion_Page"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Page);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetPage", Options);

    // END

    Process(Result, "Notion", "GetPage");

EndProcedure

Procedure Notion_GetDatabase(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetDatabase", Options);

    // END

    Process(Result, "Notion", "GetDatabase");

EndProcedure

Procedure Notion_CreatePageInDatabase(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Base   = FunctionParameters["Notion_Base"];
    Image_ = FunctionParameters["Picture"]; // URL, Binary Data or File path

    Image = New Map;
    Image.Insert("Logo", Image_);

    Properties = New Map;
    Properties.Insert("Name"        , "LLC Vector");
    Properties.Insert("Description" , "OurFirstClient");
    Properties.Insert("Number"      , 1);
    Properties.Insert("CreationDate", OPI_Tools.GetCurrentDate());
    Properties.Insert("Image"       , Image);
    Properties.Insert("Active"      , True);
    Properties.Insert("Website"     , "https://vector.ru");
    Properties.Insert("Email"       , "mail@vector.ru");
    Properties.Insert("Phone"       , "88005553535");
    Properties.Insert("Status"      , "New");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("base", Base);
    Options.Insert("data", Properties);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreatePageInDatabase", Options);

    // END

    Process(Result, "Notion", "CreatePageInDatabase", , Base);

EndProcedure

Procedure Notion_EditPageProperties(FunctionParameters)

    Token   = FunctionParameters["Notion_Token"];
    Page    = FunctionParameters["Notion_Page"];
    Icon    = FunctionParameters["Picture"];
    Cover   = FunctionParameters["Picture2"];
    Archive = False;

    Properties = New Map;
    Properties.Insert("Active", False);
    Properties.Insert("Email" , "vector@mail.ru");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Page);
    Options.Insert("data", Properties);
    Options.Insert("icon", Icon);
    Options.Insert("cover", Cover);
    Options.Insert("archive", Archive);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "EditPageProperties", Options);

    // END

    Process(Result, "Notion", "EditPageProperties");

EndProcedure

Procedure Notion_ReturnBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_Block"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnBlock", Options);

    // END

    Process(Result, "Notion", "ReturnBlock");

EndProcedure

Procedure Notion_CreateBlock(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Block  = FunctionParameters["Notion_Block"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    BlockData = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnBlock", Options);
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("page", Parent);
    Options.Insert("block", BlockData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "CreateBlock", Options);

    // END

    Process(Result, "Notion", "CreateBlock", , FunctionParameters);

EndProcedure

Procedure Notion_ReturnChildBlocks(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "ReturnChildBlocks", Options);

    // END

    Process(Result, "Notion", "ReturnChildBlocks");

EndProcedure

Procedure Notion_DeleteBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("block", Block);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "DeleteBlock", Options);

    // END

    Process(Result, "Notion", "DeleteBlock");

EndProcedure

Procedure Notion_UserList(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "UserList", Options);

    // END

    Process(Result, "Notion", "UserList");

EndProcedure

Procedure Notion_GetUserData(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    User  = FunctionParameters["Notion_User"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("user", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("notion", "GetUserData", Options);

    // END

    Process(Result, "Notion", "GetUserData");

EndProcedure

#EndRegion

#Region Dropbox

Procedure Dropbox_GetAuthorizationLink(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];
    Options = New Structure;
    Options.Insert("appkey", AppKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAuthorizationLink", Options);

    // END

    Process(Result, "Dropbox", "GetAuthorizationLink");

EndProcedure

Procedure Dropbox_GetToken(FunctionParameters)

    AppKey    = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    Code      = FunctionParameters["Dropbox_Code"];

    Options = New Structure;
    Options.Insert("appkey", AppKey);
    Options.Insert("appsecret", AppSecret);
    Options.Insert("code", Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetToken", Options);

    // END

    Process(Result, "Dropbox", "GetToken");

EndProcedure

Procedure Dropbox_RefreshToken(FunctionParameters)

    AppKey       = FunctionParameters["Dropbox_Appkey"];
    AppSecret    = FunctionParameters["Dropbox_Appsecret"];
    RefreshToken = FunctionParameters["Dropbox_Refresh"];

    Options = New Structure;
    Options.Insert("appkey", AppKey);
    Options.Insert("appsecret", AppSecret);
    Options.Insert("refresh", RefreshToken);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "RefreshToken", Options);

    // END

    Process(Result, "Dropbox", "RefreshToken");

EndProcedure

Procedure Dropbox_GetObjectInformation(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("detail", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetObjectInformation", Options);

    // END

    Process(Result, "Dropbox", "GetObjectInformation", , Path);

EndProcedure

Procedure Dropbox_GetPreview(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetPreview", Options);

    // END

    Process(Result, "Dropbox", "GetPreview");

EndProcedure

Procedure Dropbox_UploadFile(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];
    Image = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    CopyFile(Image, ImagePath);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("file", ImagePath);
    Options.Insert("path", Path);
    Options.Insert("overwrite", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "UploadFile", Options);

    // END

    Process(Result, "Dropbox", "UploadFile", , Path);
    DeleteFiles(ImagePath);

    If Not OPI_Tools.IsOneScript() And FunctionParameters.Property("Big") Then

        BigFile = FunctionParameters["Big"];

        Path   = "/giant.tmp";
        Options = New Structure;
        Options.Insert("token", Token);
        Options.Insert("file", BigFile);
        Options.Insert("path", Path);
        Options.Insert("overwrite", Истина);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "UploadFile", Options);

        Process(Result, "Dropbox", "UploadFile", "Big", Path);

    EndIf;

EndProcedure

Procedure Dropbox_UploadFileByURL(FunctionParameters)

    Path  = "/New/url_doc.docx";
    Token = FunctionParameters["Dropbox_Token"];
    URL   = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("url", URL);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "UploadFileByURL", Options);

    // END

    Process(Result, "Dropbox", "UploadFileByURL", , FunctionParameters);

EndProcedure

Procedure Dropbox_GetUploadStatusByURL(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    WorkID = FunctionParameters["Dropbox_Job"];
    Status = "in_progress";

    While Status = "in_progress" Do

        Result = OPI_Dropbox.GetUploadStatusByURL(Token, WorkID);
        Status = Result[".tag"];

        OPI_Tools.Pause(5);

        Process(Result, "Dropbox", "GetUploadStatusByURL", "Progress"); // SKIP

    EndDo;

    // END

    Process(Result, "Dropbox", "GetUploadStatusByURL");

    Token  = FunctionParameters["Dropbox_Token"];
    Path   = "/New/url_doc.docx";
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteObject", Options);

    Process(Result, "Dropbox", "GetUploadStatusByURL", "Deletion", Path);

EndProcedure

Procedure Dropbox_DeleteObject(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteObject", Options);

    // END

    Process(Result, "Dropbox", "DeleteObject", , Path);

EndProcedure

Procedure Dropbox_CopyObject(FunctionParameters)

    Original = "/New/pic.png";
    Copy     = "/New/pic_copy.png";
    Token    = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", Original);
    Options.Insert("to", Copy);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CopyObject", Options);

    // END

    Process(Result, "Dropbox", "CopyObject", , Copy);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Copy);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteObject", Options);

    Process(Result, "Dropbox", "CopyObject", "Deletion", Copy);

EndProcedure

Procedure Dropbox_MoveObject(FunctionParameters)

    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", OriginalPath);
    Options.Insert("to", TargetPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "MoveObject", Options);

    // END

    Process(Result, "Dropbox", "MoveObject", , TargetPath);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("from", TargetPath);
    Options.Insert("to", OriginalPath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "MoveObject", Options);

    Process(Result, "Dropbox", "MoveObject", "Deletion", OriginalPath);

EndProcedure

Procedure Dropbox_CreateFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New catalog";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CreateFolder", Options);

    // END

    Process(Result, "Dropbox", "CreateFolder", , Path);

    OPI_Dropbox.DeleteObject(Token, Path);

EndProcedure

Procedure Dropbox_DownloadFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DownloadFile", Options);

    // END

    Process(Result, "Dropbox", "DownloadFile");

EndProcedure

Procedure Dropbox_DownloadFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DownloadFolder", Options);

    // END

    Process(Result, "Dropbox", "DownloadFolder");

EndProcedure

Procedure Dropbox_GetListOfFolderFiles(FunctionParameters)

    Path  = "/New";
    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("detail", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetListOfFolderFiles", Options);

    // END

    Process(Result, "Dropbox", "GetListOfFolderFiles");

EndProcedure

Procedure Dropbox_GetObjectVersionList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("amount", 1);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetObjectVersionList", Options);

    // END

    Process(Result, "Dropbox", "GetObjectVersionList", , FunctionParameters);

EndProcedure

Procedure Dropbox_RestoreObjectToVersion(FunctionParameters)

    Version = FunctionParameters["Dropbox_FileRevision"];
    Token   = FunctionParameters["Dropbox_Token"];
    Path    = "/New/pic.png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("rev", Version);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "RestoreObjectToVersion", Options);

    // END

    Process(Result, "Dropbox", "RestoreObjectToVersion", , Path);

EndProcedure

Procedure Dropbox_GetTagList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    PathsArray = New Array;
    PathsArray.Add("/New/Dogs.mp3");
    PathsArray.Add("/New/mydoc.docx");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("paths", PathsArray);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetTagList", Options);

    // END

    Process(Result, "Dropbox", "GetTagList", , FunctionParameters, PathsArray);

EndProcedure

Procedure Dropbox_AddTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("tag", Tag);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddTag", Options);

    // END

    Process(Result, "Dropbox", "AddTag");

EndProcedure

Procedure Dropbox_DeleteTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("tag", Tag);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "DeleteTag", Options);

    // END

    Process(Result, "Dropbox", "DeleteTag");

EndProcedure

Procedure Dropbox_GetAccountInformation(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAccountInformation", Options);

    // END

    Process(Result, "Dropbox", "GetAccountInformation");

    AccountID = Result["account_id"];
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("account", AccountID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAccountInformation", Options);

    Process(Result, "Dropbox", "GetAccountInformation", "By ID");

EndProcedure

Procedure Dropbox_GetSpaceUsageData(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetSpaceUsageData", Options);

    // END

    Process(Result, "Dropbox", "GetSpaceUsageData");

EndProcedure

Procedure Dropbox_AddUsersToFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
    File  = FunctionParameters["Dropbox_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", File);
    Options.Insert("emails", Email);
    Options.Insert("readonly", Ложь);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFile", Options);

    // END

    Process(Result, "Dropbox", "AddUsersToFile", , Email, False);

    Mails = New Array;
    Mails.Add(Email);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", File);
    Options.Insert("emails", Mails);
    Options.Insert("readonly", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFile", Options);

    Process(Result, "Dropbox", "AddUsersToFile", , Email, True);

EndProcedure

Procedure Dropbox_PublishFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "PublishFolder", Options);

    // END

    Process(Result, "Dropbox", "PublishFolder", , FunctionParameters);

EndProcedure

Procedure Dropbox_CancelFolderPublication(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Folder = FunctionParameters["Dropbox_SharedFolder"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("folder", Folder);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CancelFolderPublication", Options);

    Process(Result, "Dropbox", "CancelFolderPublication"); // SKIP

    CurrentStatus = "in_progress";
    JobID         = Result["async_job_id"];

    While CurrentStatus = "in_progress" Do
        Result          = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
        CurrentStatus   = Result[".tag"];
        OPI_Tools.Pause(3);
    EndDo;

    // END

    Process(Result, "Dropbox", "CancelFolderPublication", "Ending", FunctionParameters, JobID);

EndProcedure

Procedure Dropbox_GetAsynchronousChangeStatus(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    JobID = FunctionParameters["Dropbox_NewJobID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("job", JobID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "GetAsynchronousChangeStatus", Options);

    // END

    Process(Result, "Dropbox", "GetAsynchronousChangeStatus");

EndProcedure

Procedure Dropbox_AddUsersToFolder(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Email  = FunctionParameters["Dropbox_OtherUser"];
    Folder = FunctionParameters["Dropbox_SharedFolder"]; // shared_folder_id

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("folder", Folder);
    Options.Insert("emails", Email);
    Options.Insert("readonly", Ложь);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFolder", Options);

    // END

    Process(Result, "Dropbox", "AddUsersToFolder");

    Mails = New Array;
    Mails.Add(Email);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("folder", Folder);
    Options.Insert("emails", Mails);
    Options.Insert("readonly", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "AddUsersToFolder", Options);

    Process(Result, "Dropbox", "AddUsersToFolder", "Additional");

EndProcedure

Procedure Dropbox_CancelFilePublication(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    File  = FunctionParameters["Dropbox_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("dropbox", "CancelFilePublication", Options);

    // END

    Process(Result, "Dropbox", "CancelFilePublication");

EndProcedure

#EndRegion

#Region Bitrix24

Procedure Bitrix24_GetAppAuthLink(FunctionParameters)

    Domain   = FunctionParameters["Bitrix24_Domain"];
    ClientID = FunctionParameters["Bitrix24_ClientID"];

    Options = New Structure;
    Options.Insert("domain", Domain);
    Options.Insert("clientid", ClientID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetAppAuthLink", Options);

    // END

    Process(Result, "Bitrix24", "GetAppAuthLink");

EndProcedure

Procedure Bitrix24_GetToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Code         = FunctionParameters["Bitrix24_Code"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("clientsecret", ClientSecret);
    Options.Insert("code", Code);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetToken", Options);

    // END

    Process(Result, "Bitrix24", "GetToken");

EndProcedure

Procedure Bitrix24_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Refresh      = FunctionParameters["Bitrix24_Refresh"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("clientsecret", ClientSecret);
    Options.Insert("refresh", Refresh);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RefreshToken", Options);

    // END

    Process(Result, "Bitrix24", "RefreshToken");

EndProcedure

Procedure Bitrix24_ServerTime(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ServerTime", Options);

    Process(Result, "Bitrix24", "ServerTime", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ServerTime", Options);

    // END

    Process(Result, "Bitrix24", "ServerTime");

EndProcedure

Procedure Bitrix24_CreatePost(FunctionParameters)

    Text   = "Text of post";
    Title  = "Post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Image2 = FunctionParameters["Picture2"]; // URL, Path or Binary Data

    Files = New Map;
    Files.Insert("1.png", Image1);
    Files.Insert("2.png", Image2);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);
    Options.Insert("important", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePost", Options);

    Process(Result, "Bitrix24", "CreatePost", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePost", Options);

    // END

    Process(Result, "Bitrix24", "CreatePost", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdatePost(FunctionParameters)

    Text   = "New post text";
    Title  = "New post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary Data
    PostID = FunctionParameters["Bitrix24_PostID"];

    Files = New Map;
    Files.Insert("1.png", Image1);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdatePost", Options);

    Process(Result, "Bitrix24", "UpdatePost", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);
    Options.Insert("files", Files);
    Options.Insert("title", Title);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdatePost", Options);

    // END

    Process(Result, "Bitrix24", "UpdatePost");

EndProcedure

Procedure Bitrix24_DeletePost(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeletePost", Options);

    Process(Result, "Bitrix24", "DeletePost", "Hook"); // SKIP

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeletePost", Options);

    // END

    Process(Result, "Bitrix24", "DeletePost");

EndProcedure

Procedure Bitrix24_GetImportantPostViewers(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetImportantPostViewers", Options);

    Process(Result, "Bitrix24", "GetImportantPostViewers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetImportantPostViewers", Options);

    // END

    Process(Result, "Bitrix24", "GetImportantPostViewers");

EndProcedure

Procedure Bitrix24_GetPosts(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPosts", Options);

    Process(Result, "Bitrix24", "GetPosts", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPosts", Options);

    // END

    Process(Result, "Bitrix24", "GetPosts");

EndProcedure

Procedure Bitrix24_AddPostComment(FunctionParameters)

    Text   = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostComment", Options);

    Process(Result, "Bitrix24", "AddPostComment", "Hook"); // SKIP

    Text  = "Another comment";
    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostComment", Options);

    // END

    Process(Result, "Bitrix24", "AddPostComment");

EndProcedure

Procedure Bitrix24_AddPostRecipients(FunctionParameters)

    Visibility = "UA";
    PostID     = FunctionParameters["Bitrix24_PostID"];
    URL        = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("vision", Visibility);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostRecipients", Options);

    Process(Result, "Bitrix24", "AddPostRecipients", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("postid", PostID);
    Options.Insert("vision", Visibility);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddPostRecipients", Options);

    // END

    Process(Result, "Bitrix24", "AddPostRecipients");

EndProcedure

Procedure Bitrix24_GetTaskFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskFieldsStructure", Options);

    Process(Result, "Bitrix24", "GetTaskFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskFieldsStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetTaskFieldsStructure");

EndProcedure

Procedure Bitrix24_CreateTask(FunctionParameters)

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
    Options.Insert("url", URL);
    Options.Insert("fields", TaskData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTask", Options);

    Process(Result, "Bitrix24", "CreateTask", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", TaskData);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTask", Options);

    // END

    Process(Result, "Bitrix24", "CreateTask", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTask(FunctionParameters)

    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    TaskData = New Structure;
    TaskData.Insert("TITLE"      , "Another task title");
    TaskData.Insert("DESCRIPTION", "Another task description");
    TaskData.Insert("PRIORITY"   , "1");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fields", TaskData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTask", Options);

    Process(Result, "Bitrix24", "UpdateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fields", TaskData);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTask", Options);

    // END

    Process(Result, "Bitrix24", "UpdateTask");

EndProcedure

Procedure Bitrix24_GetTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTask", Options);

    Process(Result, "Bitrix24", "GetTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTask", Options);

    // END

    Process(Result, "Bitrix24", "GetTask");

EndProcedure

Procedure Bitrix24_ApproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ApproveTask", Options);

    Process(Result, "Bitrix24", "ApproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ApproveTask", Options);

    // END

    Process(Result, "Bitrix24", "ApproveTask");

EndProcedure

Procedure Bitrix24_DisapproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisapproveTask", Options);

    Process(Result, "Bitrix24", "DisapproveTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisapproveTask", Options);

    // END

    Process(Result, "Bitrix24", "DisapproveTask");

EndProcedure

Procedure Bitrix24_CompleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTask", Options);

    Process(Result, "Bitrix24", "CompleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTask", Options);

    // END

    Process(Result, "Bitrix24", "CompleteTask");

EndProcedure

Procedure Bitrix24_RenewTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTask", Options);

    Process(Result, "Bitrix24", "RenewTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTask", Options);

    // END

    Process(Result, "Bitrix24", "RenewTask");

EndProcedure

Procedure Bitrix24_DeferTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeferTask", Options);

    Process(Result, "Bitrix24", "DeferTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeferTask", Options);

    // END

    Process(Result, "Bitrix24", "DeferTask");

EndProcedure

Procedure Bitrix24_StartTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTask", Options);

    Process(Result, "Bitrix24", "StartTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTask", Options);

    // END

    Process(Result, "Bitrix24", "StartTask");

EndProcedure

Procedure Bitrix24_StartWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartWatchingTask", Options);

    Process(Result, "Bitrix24", "StartWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartWatchingTask", Options);

    // END

    Process(Result, "Bitrix24", "StartWatchingTask");

EndProcedure

Procedure Bitrix24_StopWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopWatchingTask", Options);

    Process(Result, "Bitrix24", "StopWatchingTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopWatchingTask", Options);

    // END

    Process(Result, "Bitrix24", "StopWatchingTask");

EndProcedure

Procedure Bitrix24_PauseTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTask", Options);

    Process(Result, "Bitrix24", "PauseTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTask", Options);

    // END

    Process(Result, "Bitrix24", "PauseTask");

EndProcedure

Procedure Bitrix24_DeleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTask", Options);

    Process(Result, "Bitrix24", "DeleteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTask", Options);

    // END

    Process(Result, "Bitrix24", "DeleteTask");

EndProcedure

Procedure Bitrix24_DelegateTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DelegateTask", Options);

    Process(Result, "Bitrix24", "DelegateTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("user", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DelegateTask", Options);

    // END

    Process(Result, "Bitrix24", "DelegateTask");

EndProcedure

Procedure Bitrix24_AddTaskToFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskToFavorites", Options);

    Process(Result, "Bitrix24", "AddTaskToFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskToFavorites", Options);

    // END

    Process(Result, "Bitrix24", "AddTaskToFavorites");

EndProcedure

Procedure Bitrix24_RemoveTaskFromFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RemoveTaskFromFavorites", Options);

    Process(Result, "Bitrix24", "RemoveTaskFromFavorites", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RemoveTaskFromFavorites", Options);

    // END

    Process(Result, "Bitrix24", "RemoveTaskFromFavorites");

EndProcedure

Procedure Bitrix24_GetTaskHistory(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskHistory", Options);

    Process(Result, "Bitrix24", "GetTaskHistory", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskHistory", Options);

    // END

    Process(Result, "Bitrix24", "GetTaskHistory");

EndProcedure

Procedure Bitrix24_GetTasksList(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();

    // Full filter structure you can find at GetTasksFilterStructure method
    Filter = New Map;
    Filter.Insert("CREATED_BY", 1); // Producer with ID 1
    Filter.Insert("!RESPONSIBLE_ID", 10); // Performers with ID not equal to 10
    Filter.Insert(">=CREATED_DATE ", CurrentDate - 60 * 60 * 24); // Creation date >= yesterday

    Fields = New Array;
    Fields.Add("UF_CRM_TASK");
    Fields.Add("CREATED_BY");

    Indent = 1;
    URL    = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", Filter);
    Options.Insert("select", Fields);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksList", Options);

    Process(Result, "Bitrix24", "GetTasksList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("offset", Indent);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksList", Options);

    // END

    Process(Result, "Bitrix24", "GetTasksList");

EndProcedure

Procedure Bitrix24_GetStoragesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStoragesList", Options);

    Process(Result, "Bitrix24", "GetStoragesList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStoragesList", Options);

    // END

    Process(Result, "Bitrix24", "GetStoragesList");

EndProcedure

Procedure Bitrix24_GetAppStorage(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetAppStorage", Options);

    // END

    Process(Result, "Bitrix24", "GetAppStorage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UploadFileToStorage(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary Data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary Data

    DestinationID = 3;

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Filename2);
    Options.Insert("file", Image2);
    Options.Insert("storageid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToStorage", Options);

    Process(Result, "Bitrix24", "UploadFileToStorage", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("file", Image);
    Options.Insert("storageid", DestinationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToStorage", Options);

    // END

    Process(Result, "Bitrix24", "UploadFileToStorage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFile", Options);

    Process(Result, "Bitrix24", "DeleteFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFile", Options);

    // END

    Process(Result, "Bitrix24", "DeleteFile");

EndProcedure

Procedure Bitrix24_CreateStorageFolder(FunctionParameters)

    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateStorageFolder", Options);

    Process(Result, "Bitrix24", "CreateStorageFolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateStorageFolder", Options);

    // END

    Process(Result, "Bitrix24", "CreateStorageFolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFolder", Options);

    Process(Result, "Bitrix24", "DeleteFolder", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteFolder", Options);

    // END

    Process(Result, "Bitrix24", "DeleteFolder");

EndProcedure

Procedure Bitrix24_GetStorage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorage", Options);

    Process(Result, "Bitrix24", "GetStorage", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorage", Options);

    // END

    Process(Result, "Bitrix24", "GetStorage");

EndProcedure

Procedure Bitrix24_GetStorageObjects(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorageObjects", Options);

    Process(Result, "Bitrix24", "GetStorageObjects", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetStorageObjects", Options);

    // END

    Process(Result, "Bitrix24", "GetStorageObjects");

EndProcedure

Procedure Bitrix24_RenameStorage(FunctionParameters)

    Name      = "New storage name";
    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("storageid", StorageID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameStorage", Options);

    // END

    Process(Result, "Bitrix24", "RenameStorage");

EndProcedure

Procedure Bitrix24_GetFolderInformation(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderInformation", Options);

    Process(Result, "Bitrix24", "GetFolderInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderInformation", Options);

    // END

    Process(Result, "Bitrix24", "GetFolderInformation");

EndProcedure

Procedure Bitrix24_CreateSubfolder(FunctionParameters)

    FolderID  = FunctionParameters["Bitrix24_FolderID"];
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSubfolder", Options);

    Process(Result, "Bitrix24", "CreateSubfolder", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSubfolder", Options);

    // END

    Process(Result, "Bitrix24", "CreateSubfolder", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MakeFolderCopy(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookSubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("tagetid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFolderCopy", Options);

    Process(Result, "Bitrix24", "MakeFolderCopy", "Hook"); // SKIP

    DestinationID = FunctionParameters["Bitrix24_SubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    // END

    Process(Result, "Bitrix24", "MakeFolderCopy");

EndProcedure

Procedure Bitrix24_GetFolderExternalLink(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderExternalLink", Options);

    Process(Result, "Bitrix24", "GetFolderExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderExternalLink", Options);

    // END

    Process(Result, "Bitrix24", "GetFolderExternalLink");

EndProcedure

Procedure Bitrix24_GetFolderFilterStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderFilterStructure", Options);

    Process(Result, "Bitrix24", "GetFolderFilterStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("empty", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderFilterStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetFolderFilterStructure");

EndProcedure

Procedure Bitrix24_GetFolderItems(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderItems", Options);

    Process(Result, "Bitrix24", "GetFolderItems", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFolderItems", Options);

    // END

    Process(Result, "Bitrix24", "GetFolderItems");

EndProcedure

Procedure Bitrix24_MarkFolderAsDeleted(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFolderAsDeleted", Options);

    Process(Result, "Bitrix24", "MarkFolderAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFolderAsDeleted", Options);

    // END

    Process(Result, "Bitrix24", "MarkFolderAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFolder", Options);

    Process(Result, "Bitrix24", "RestoreFolder", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFolder", Options);

    // END

    Process(Result, "Bitrix24", "RestoreFolder");

EndProcedure

Procedure Bitrix24_MoveFolder(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("tagetid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFolder", Options);

    Process(Result, "Bitrix24", "MoveFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("tagetid", DestinationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFolder", Options);

    // END

    Process(Result, "Bitrix24", "MoveFolder");

EndProcedure

Procedure Bitrix24_RenameFolder(FunctionParameters)

    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = FunctionParameters["Bitrix24_HookFolderID"];
    URL       = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID2);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFolder", Options);

    Process(Result, "Bitrix24", "RenameFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];
    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("folderid", FolderID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFolder", Options);

    // END

    Process(Result, "Bitrix24", "RenameFolder");

EndProcedure

Procedure Bitrix24_UploadFileToFolder(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary Data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary Data

    DestinationID = FunctionParameters["Bitrix24_FolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Filename2);
    Options.Insert("file", Image2);
    Options.Insert("folderid", DestinationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);

    Process(Result, "Bitrix24", "UploadFileToFolder", "Hook", URL); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_Bitrix24.DeleteFile(URL, FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("file", Image);
    Options.Insert("folderid", DestinationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);

    // END

    Process(Result, "Bitrix24", "UploadFileToFolder", , URL, Token);

    FileID = Result["result"]["ID"];

    OPI_Bitrix24.DeleteFile(URL, FileID, Token);

EndProcedure

Procedure Bitrix24_MakeFileCopy(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFileCopy", Options);

    Process(Result, "Bitrix24", "MakeFileCopy", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MakeFileCopy", Options);

    // END

    Process(Result, "Bitrix24", "MakeFileCopy");

EndProcedure

Procedure Bitrix24_GetFileInformation(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileInformation", Options);

    Process(Result, "Bitrix24", "GetFileInformation", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileInformation", Options);

    // END

    Process(Result, "Bitrix24", "GetFileInformation");

EndProcedure

Procedure Bitrix24_GetFileExternalLink(FunctionParameters)

    OPI_Tools.Pause(20); // SKIP

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileExternalLink", Options);

    Process(Result, "Bitrix24", "GetFileExternalLink", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileExternalLink", Options);

    // END

    Process(Result, "Bitrix24", "GetFileExternalLink");

EndProcedure

Procedure Bitrix24_MarkFileAsDeleted(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFileAsDeleted", Options);

    Process(Result, "Bitrix24", "MarkFileAsDeleted", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkFileAsDeleted", Options);

    // END

    Process(Result, "Bitrix24", "MarkFileAsDeleted");

EndProcedure

Procedure Bitrix24_RestoreFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFile", Options);

    Process(Result, "Bitrix24", "RestoreFile", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RestoreFile", Options);

    // END

    Process(Result, "Bitrix24", "RestoreFile");

EndProcedure

Procedure Bitrix24_RenameFile(FunctionParameters)

    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = FunctionParameters["Bitrix24_HookFileID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID2);
    Options.Insert("title", Filename2);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFile", Options);

    Process(Result, "Bitrix24", "RenameFile", "Hook"); // SKIP

    FileID = FunctionParameters["Bitrix24_FileID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("title", Name);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenameFile", Options);

    // END

    Process(Result, "Bitrix24", "RenameFile");

EndProcedure

Procedure Bitrix24_MoveFileToFolder(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookSubFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFileToFolder", Options);

    Process(Result, "Bitrix24", "MoveFileToFolder", "Hook"); // SKIP

    FolderID = FunctionParameters["Bitrix24_SubFolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fileid", FileID);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveFileToFolder", Options);

    // END

    Process(Result, "Bitrix24", "MoveFileToFolder");

EndProcedure

Procedure Bitrix24_AttachFileToTopic(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    FileID = FunctionParameters["Bitrix24_TaskFileID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AttachFileToTopic", Options);

    Process(Result, "Bitrix24", "AttachFileToTopic", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("fileid", FileID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AttachFileToTopic", Options);

    // END

    Process(Result, "Bitrix24", "AttachFileToTopic");

EndProcedure

Procedure Bitrix24_CheckTaskAccesses(FunctionParameters)

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("users", ArrayOfUsers);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CheckTaskAccesses", Options);

    Process(Result, "Bitrix24", "CheckTaskAccesses", "Hook", ArrayOfUsers.Count()); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("users", ArrayOfUsers);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CheckTaskAccesses", Options);

    // END

    Process(Result, "Bitrix24", "CheckTaskAccesses", , ArrayOfUsers.Count());

EndProcedure

Procedure Bitrix24_MuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MuteTask", Options);

    Process(Result, "Bitrix24", "MuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MuteTask", Options);

    // END

    Process(Result, "Bitrix24", "MuteTask");

EndProcedure

Procedure Bitrix24_UnmuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UnmuteTask", Options);

    Process(Result, "Bitrix24", "UnmuteTask", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UnmuteTask", Options);

    // END

    Process(Result, "Bitrix24", "UnmuteTask");

EndProcedure

Procedure Bitrix24_AddTaskComment(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Text = "Task impossible, let's split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskComment", Options);

    Process(Result, "Bitrix24", "AddTaskComment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text = "Task uninpossible, don't split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskComment", Options);

    // END

    Process(Result, "Bitrix24", "AddTaskComment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskComment", Options);

    Process(Result, "Bitrix24", "DeleteTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskComment", Options);

    // END

    Process(Result, "Bitrix24", "DeleteTaskComment");

EndProcedure

Procedure Bitrix24_CreateResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateResultFromComment", Options);

    Process(Result, "Bitrix24", "CreateResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateResultFromComment", Options);

    // END

    Process(Result, "Bitrix24", "CreateResultFromComment");

EndProcedure

Procedure Bitrix24_DeleteResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteResultFromComment", Options);

    Process(Result, "Bitrix24", "DeleteResultFromComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteResultFromComment", Options);

    // END

    Process(Result, "Bitrix24", "DeleteResultFromComment");

EndProcedure

Procedure Bitrix24_GetResultsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetResultsList", Options);

    Process(Result, "Bitrix24", "GetResultsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetResultsList", Options);

    // END

    Process(Result, "Bitrix24", "GetResultsList");

EndProcedure

Procedure Bitrix24_GetTaskCommentsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskCommentsList", Options);

    Process(Result, "Bitrix24", "GetTaskCommentsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskCommentsList", Options);

    // END

    Process(Result, "Bitrix24", "GetTaskCommentsList");

EndProcedure

Procedure Bitrix24_GetTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskComment", Options);

    Process(Result, "Bitrix24", "GetTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskComment", Options);

    // END

    Process(Result, "Bitrix24", "GetTaskComment");

EndProcedure

Procedure Bitrix24_UpdateTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Text = "The task has been changed, do not split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskComment", Options);

    Process(Result, "Bitrix24", "UpdateTaskComment", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Text = "The task has been changed, let's split up";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("comment", CommentID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskComment", Options);

    // END

    Process(Result, "Bitrix24", "UpdateTaskComment");

EndProcedure

Procedure Bitrix24_CreateTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTasksDependencies", Options);

    Process(Result, "Bitrix24", "CreateTasksDependencies", "Hook"); // SKIP

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateTasksDependencies", Options);

    // END

    Process(Result, "Bitrix24", "CreateTasksDependencies");

    OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token)

EndProcedure

Procedure Bitrix24_DeleteTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP
    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksDependencies", Options);

    Process(Result, "Bitrix24", "DeleteTasksDependencies", "Hook"); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token); // SKIP
    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("taskfrom", FromID);
    Options.Insert("taskto", DestinationID);
    Options.Insert("linktype", LinkType);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksDependencies", Options);

    // END

    Process(Result, "Bitrix24", "DeleteTasksDependencies");

EndProcedure

Procedure Bitrix24_AddKanbanStage(FunctionParameters)

    Name  = "New stage";
    Color = "0026FF";

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("color", Color);
    Options.Insert("prevstage", 6);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddKanbanStage", Options);

    Process(Result, "Bitrix24", "AddKanbanStage", "Hook", FunctionParameters); // SKIP

    Name  = "New stage 2";
    Color = "0026FF";

    URL         = FunctionParameters["Bitrix24_Domain"];
    Token       = FunctionParameters["Bitrix24_Token"];
    PrevStageID = Result["result"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("color", Color);
    Options.Insert("prevstage", PrevStageID);
    Options.Insert("admin", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddKanbanStage", Options);

    // END

    Process(Result, "Bitrix24", "AddKanbanStage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteKanbanStage(FunctionParameters)

    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("stage", StageID);
    Options.Insert("admin", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteKanbanStage", Options);

    Process(Result, "Bitrix24", "DeleteKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("stage", StageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteKanbanStage", Options);

    // END

    Process(Result, "Bitrix24", "DeleteKanbanStage");

EndProcedure

Procedure Bitrix24_GetKanbanStages(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("admin", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetKanbanStages", Options);

    Process(Result, "Bitrix24", "GetKanbanStages", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetKanbanStages", Options);

    // END

    Process(Result, "Bitrix24", "GetKanbanStages");

EndProcedure

Procedure Bitrix24_MoveTaskToKanbanStage(FunctionParameters)

    TaskID  = FunctionParameters["Bitrix24_KanbanTaskID"];
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("stage", StageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveTaskToKanbanStage", Options);

    Process(Result, "Bitrix24", "MoveTaskToKanbanStage", "Hook"); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("stage", StageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MoveTaskToKanbanStage", Options);

    // END

    Process(Result, "Bitrix24", "MoveTaskToKanbanStage");

    OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, 2, , , Token);

EndProcedure

Procedure Bitrix24_UpdateKanbansStage(FunctionParameters)

    Name    = "New stage name";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("stage", StageID);
    Options.Insert("color", Color);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateKanbansStage", Options);

    Process(Result, "Bitrix24", "UpdateKanbansStage", "Hook"); // SKIP

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("stage", StageID);
    Options.Insert("color", Color);
    Options.Insert("prevstage", 6);
    Options.Insert("admin", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateKanbansStage", Options);

    // END

    Process(Result, "Bitrix24", "UpdateKanbansStage");

EndProcedure

Procedure Bitrix24_AddTasksChecklistElement(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Text = "Checklist element";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);
    Options.Insert("complete", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTasksChecklistElement", Options);

    Process(Result, "Bitrix24", "AddTasksChecklistElement", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTasksChecklistElement", Options);

    // END

    Process(Result, "Bitrix24", "AddTasksChecklistElement", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Text = "New elements text";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTasksChecklistElement", Options);

    Process(Result, "Bitrix24", "UpdateTasksChecklistElement", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTasksChecklistElement", Options);

    // END

    Process(Result, "Bitrix24", "UpdateTasksChecklistElement");

EndProcedure

Procedure Bitrix24_DeleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksChecklistElement", Options);

    Process(Result, "Bitrix24", "DeleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTasksChecklistElement", Options);

    // END

    Process(Result, "Bitrix24", "DeleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_GetTasksChecklist(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklist", Options);

    Process(Result, "Bitrix24", "GetTasksChecklist", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklist", Options);

    // END

    Process(Result, "Bitrix24", "GetTasksChecklist");

EndProcedure

Procedure Bitrix24_GetTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklistElement", Options);

    Process(Result, "Bitrix24", "GetTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksChecklistElement", Options);

    // END

    Process(Result, "Bitrix24", "GetTasksChecklistElement");

EndProcedure

Procedure Bitrix24_CompleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTasksChecklistElement", Options);

    Process(Result, "Bitrix24", "CompleteTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CompleteTasksChecklistElement", Options);

    // END

    Process(Result, "Bitrix24", "CompleteTasksChecklistElement");

EndProcedure

Procedure Bitrix24_RenewTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTasksChecklistElement", Options);

    Process(Result, "Bitrix24", "RenewTasksChecklistElement", "Hook"); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("element", ElementID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "RenewTasksChecklistElement", Options);

    // END

    Process(Result, "Bitrix24", "RenewTasksChecklistElement");

EndProcedure

Procedure Bitrix24_AddTaskTimeAccounting(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Time = 3600;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("amount", Time);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskTimeAccounting", Options);

    Process(Result, "Bitrix24", "AddTaskTimeAccounting", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text      = "Time spent on work";
    UserID    = 10;
    Time      = 7200;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("amount", Time);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("date", SetupDate);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddTaskTimeAccounting", Options);

    // END

    Process(Result, "Bitrix24", "AddTaskTimeAccounting", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Text = "The text I forgot last time";
    Time = 4800;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("amount", Time);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskTimeAccounting", Options);

    Process(Result, "Bitrix24", "UpdateTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Text      = "New time record";
    Time      = 4800;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("amount", Time);
    Options.Insert("text", Text);
    Options.Insert("date", SetupDate);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateTaskTimeAccounting", Options);

    // END

    Process(Result, "Bitrix24", "UpdateTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_DeleteTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskTimeAccounting", Options);

    Process(Result, "Bitrix24", "DeleteTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteTaskTimeAccounting", Options);

    // END

    Process(Result, "Bitrix24", "DeleteTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccounting", Options);

    Process(Result, "Bitrix24", "GetTaskTimeAccounting", "Hook"); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("record", RecordID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccounting", Options);

    // END

    Process(Result, "Bitrix24", "GetTaskTimeAccounting");

EndProcedure

Procedure Bitrix24_GetTaskTimeAccountingList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccountingList", Options);

    Process(Result, "Bitrix24", "GetTaskTimeAccountingList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("task", TaskID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTaskTimeAccountingList", Options);

    // END

    Process(Result, "Bitrix24", "GetTaskTimeAccountingList");

EndProcedure

Procedure Bitrix24_GetDailyPlan(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDailyPlan", Options);

    Process(Result, "Bitrix24", "GetDailyPlan", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDailyPlan", Options);

    // END

    Process(Result, "Bitrix24", "GetDailyPlan");

EndProcedure

Procedure Bitrix24_CreateChat(FunctionParameters)

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
    ChatStructure.Insert("AVATAR"     , B64Image);
    ChatStructure.Insert("OWNER_ID"   , 1);

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", ChatStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateChat", Options);

    Process(Result, "Bitrix24", "CreateChat", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE" , "CHAT");
    ChatStructure.Insert("TITLE", "Private chat");
    ChatStructure.Insert("USERS", MembersArray);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", ChatStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateChat", Options);

    // END

    Process(Result, "Bitrix24", "CreateChat", , FunctionParameters);

EndProcedure

Procedure Bitrix24_GetChatUsers(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatUsers", Options);

    Process(Result, "Bitrix24", "GetChatUsers", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatUsers", Options);

    // END

    Process(Result, "Bitrix24", "GetChatUsers");

EndProcedure

Procedure Bitrix24_LeaveChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "LeaveChat", Options);

    Process(Result, "Bitrix24", "LeaveChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "LeaveChat", Options);

    // END

    Process(Result, "Bitrix24", "LeaveChat");

EndProcedure

Procedure Bitrix24_DeleteUserFromChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteUserFromChat", Options);

    Process(Result, "Bitrix24", "DeleteUserFromChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteUserFromChat", Options);

    // END

    Process(Result, "Bitrix24", "DeleteUserFromChat");

EndProcedure

Procedure Bitrix24_AddUsersToChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("users", UserIDs);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddUsersToChat", Options);

    Process(Result, "Bitrix24", "AddUsersToChat", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("users", UserID);
    Options.Insert("hide", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddUsersToChat", Options);

    // END

    Process(Result, "Bitrix24", "AddUsersToChat");

EndProcedure

Procedure Bitrix24_ChangeChatTitle(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Title = "New chat title";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatTitle", Options);

    Process(Result, "Bitrix24", "ChangeChatTitle", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Title = "Another title";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("title", Title);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatTitle", Options);

    // END

    Process(Result, "Bitrix24", "ChangeChatTitle");

EndProcedure

Procedure Bitrix24_ChangeChatColor(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Color = "AZURE";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("color", Color);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatColor", Options);

    Process(Result, "Bitrix24", "ChangeChatColor", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Color = "PURPLE";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("color", Color);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatColor", Options);

    // END

    Process(Result, "Bitrix24", "ChangeChatColor");

EndProcedure

Procedure Bitrix24_ChangeChatPicture(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Image = FunctionParameters["Picture2"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatPicture", Options);

    Process(Result, "Bitrix24", "ChangeChatPicture", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("picture", Image);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatPicture", Options);

    // END

    Process(Result, "Bitrix24", "ChangeChatPicture");

EndProcedure

Procedure Bitrix24_DisableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisableChatNotifications", Options);

    Process(Result, "Bitrix24", "DisableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DisableChatNotifications", Options);

    // END

    Process(Result, "Bitrix24", "DisableChatNotifications");

EndProcedure

Procedure Bitrix24_EnableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EnableChatNotifications", Options);

    Process(Result, "Bitrix24", "EnableChatNotifications", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EnableChatNotifications", Options);

    // END

    Process(Result, "Bitrix24", "EnableChatNotifications");

EndProcedure

Procedure Bitrix24_ChangeChatOwner(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatOwner", Options);

    Process(Result, "Bitrix24", "ChangeChatOwner", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("user", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeChatOwner", Options);

    // END

    Process(Result, "Bitrix24", "ChangeChatOwner");

EndProcedure

Procedure Bitrix24_GetChatMessagesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat4";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMessagesList", Options);

    Process(Result, "Bitrix24", "GetChatMessagesList", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("first", 0);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMessagesList", Options);

    // END

    Process(Result, "Bitrix24", "GetChatMessagesList", , FunctionParameters);

EndProcedure

Procedure Bitrix24_MarkMessageAsReaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);
    ChatString = "chat" + ChatID;

    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsReaded", Options);

    Process(Result, "Bitrix24", "MarkMessageAsReaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsReaded", Options);

    // END

    Process(Result, "Bitrix24", "MarkMessageAsReaded");

EndProcedure

Procedure Bitrix24_MarkMessageAsUnreaded(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;
    MessageID  = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsUnreaded", Options);

    Process(Result, "Bitrix24", "MarkMessageAsUnreaded", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "MarkMessageAsUnreaded", Options);

    // END

    Process(Result, "Bitrix24", "MarkMessageAsUnreaded");

EndProcedure

Procedure Bitrix24_GetDialog(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDialog", Options);

    Process(Result, "Bitrix24", "GetDialog", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDialog", Options);

    // END

    Process(Result, "Bitrix24", "GetDialog");

EndProcedure

Procedure Bitrix24_GetChatMembersList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMembersList", Options);

    Process(Result, "Bitrix24", "GetChatMembersList", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatMembersList", Options);

    // END

    Process(Result, "Bitrix24", "GetChatMembersList");

EndProcedure

Procedure Bitrix24_SendWritingNotification(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendWritingNotification", Options);

    Process(Result, "Bitrix24", "SendWritingNotification", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendWritingNotification", Options);

    // END

    Process(Result, "Bitrix24", "SendWritingNotification");

EndProcedure

Procedure Bitrix24_ReadAll(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ReadAll", Options);

    Process(Result, "Bitrix24", "ReadAll", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ReadAll", Options);

    // END

    Process(Result, "Bitrix24", "ReadAll");

EndProcedure

Procedure Bitrix24_SendMessage(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    OPI_TypeConversion.GetLine(ChatID);

    ChatString = "chat" + ChatID;
    Text       = "Message text";
    Image      = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File       = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatString);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendMessage", Options);

    Process(Result, "Bitrix24", "SendMessage", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", UserID);
    Options.Insert("text", Text);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendMessage", Options);

    // END

    Process(Result, "Bitrix24", "SendMessage", , FunctionParameters);

EndProcedure

Procedure Bitrix24_EditMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Text = "New message text";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EditMessage", Options);

    Process(Result, "Bitrix24", "EditMessage", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "EditMessage", Options);

    // END

    Process(Result, "Bitrix24", "EditMessage");

EndProcedure

Procedure Bitrix24_DeleteMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteMessage", Options);

    Process(Result, "Bitrix24", "DeleteMessage", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteMessage", Options);

    // END

    Process(Result, "Bitrix24", "DeleteMessage");

EndProcedure

Procedure Bitrix24_SetMessageReaction(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetMessageReaction", Options);

    Process(Result, "Bitrix24", "SetMessageReaction", "Hook"); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("message", MessageID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetMessageReaction", Options);

    // END

    Process(Result, "Bitrix24", "SetMessageReaction");

EndProcedure

Procedure Bitrix24_GetChatFilesFolder(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);

    Process(Result, "Bitrix24", "GetChatFilesFolder", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);

    // END

    Process(Result, "Bitrix24", "GetChatFilesFolder");

EndProcedure

Procedure Bitrix24_SendFile(FunctionParameters)

    URL         = FunctionParameters["Bitrix24_URL"];
    ChatID      = FunctionParameters["Bitrix24_HookChatID"];
    File        = FunctionParameters["Document"]; // Binary Data, URL or path to file
    Description = "Very important file";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);

    Directory = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);
    FolderID  = Directory["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", "Imortant doc.docx");
    Options.Insert("file", File);
    Options.Insert("folderid", FolderID);

    UploadedFile = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);
    FileID       = UploadedFile["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("fileid", FileID);
    Options.Insert("description", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendFile", Options);

    Process(Result, "Bitrix24", "SendFile", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("token", Token);

    Directory = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatFilesFolder", Options);
    FolderID  = Directory["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", "Imortant doc.docx");
    Options.Insert("file", File);
    Options.Insert("folderid", FolderID);
    Options.Insert("token", Token);

    UploadedFile = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UploadFileToFolder", Options);
    FileID       = UploadedFile["result"]["ID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("chat", ChatID);
    Options.Insert("fileid", FileID);
    Options.Insert("description", Description);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SendFile", Options);

    // END

    Process(Result, "Bitrix24", "SendFile");

EndProcedure

Procedure Bitrix24_GetUsers(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    ArrayOfUsers = New Array;

    ArrayOfUsers.Add(1);
    ArrayOfUsers.Add(10);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", ArrayOfUsers);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUsers", Options);

    Process(Result, "Bitrix24", "GetUsers", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    UserIDs = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", UserIDs);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUsers", Options);

    // END

    Process(Result, "Bitrix24", "GetUsers");

EndProcedure

Procedure Bitrix24_GetUserStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserStatus", Options);

    Process(Result, "Bitrix24", "GetUserStatus", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserStatus", Options);

    // END

    Process(Result, "Bitrix24", "GetUserStatus");

EndProcedure

Procedure Bitrix24_SetUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Status = "dnd";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("status", Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserStatus", Options);

    Process(Result, "Bitrix24", "SetUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Status = "away";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("status", Status);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserStatus", Options);

    // END

    Process(Result, "Bitrix24", "SetUserStatus");

EndProcedure

Procedure Bitrix24_CreatePersonalNotification(FunctionParameters)

    UserID = 1;

    URL   = FunctionParameters["Bitrix24_URL"];
    Text  = "Message text";
    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePersonalNotification", Options);

    Process(Result, "Bitrix24", "CreatePersonalNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("tag", Tag);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreatePersonalNotification", Options);

    // END

    Process(Result, "Bitrix24", "CreatePersonalNotification", , FunctionParameters);

EndProcedure

Procedure Bitrix24_CreateSystemNotification(FunctionParameters)

    UserID = 1;

    URL   = FunctionParameters["Bitrix24_URL"];
    Text  = "Message text";
    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("blocks", Attachments);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSystemNotification", Options);

    Process(Result, "Bitrix24", "CreateSystemNotification", "Hook", FunctionParameters); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("user", UserID);
    Options.Insert("text", Text);
    Options.Insert("tag", Tag);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateSystemNotification", Options);

    // END

    Process(Result, "Bitrix24", "CreateSystemNotification", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteNotification(FunctionParameters)

    URL            = FunctionParameters["Bitrix24_URL"];
    NotificationID = FunctionParameters["Bitrix24_PersoalHookNotifyID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("notif", NotificationID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteNotification", Options);

    Process(Result, "Bitrix24", "DeleteNotification", "Hook"); // SKIP

    URL            = FunctionParameters["Bitrix24_Domain"];
    Token          = FunctionParameters["Bitrix24_Token"];
    NotificationID = FunctionParameters["Bitrix24_PersoalNotifyID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("notif", NotificationID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteNotification", Options);

    // END

    Process(Result, "Bitrix24", "DeleteNotification");

EndProcedure

Procedure Bitrix24_AddCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Type = "date";
    Name = "BIRTHDAY_FIELD";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("type", Type);
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
    Options.Insert("url", URL);
    Options.Insert("type", Type);
    Options.Insert("fieldname", Name);
    Options.Insert("externalid", ExternalID);
    Options.Insert("title", Title);
    Options.Insert("label", Signature);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "AddCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_UpdateCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];
    Title   = "New title";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("title", Title);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCustomTaskField", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FieldID    = FunctionParameters["Bitrix24_TaskFieldID"];
    ExternalID = "NEW_TEXT_FIELD";
    Signature  = New Structure("en,ru", "Updated field", "Izmenennoe pole");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("externalid", ExternalID);
    Options.Insert("label", Signature);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskField", Options);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskFieldsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskFieldsList", Options);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomTaskFieldsList", Options);

    // END

EndProcedure

Procedure Bitrix24_DeleteCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCustomTaskField", Options);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fieldid", FieldID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCustomTaskField", Options);

    // END

EndProcedure

Procedure Bitrix24_CreateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Name     = "Main department";
    ParentID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("parentid", ParentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDepartment", Options);

    Process(Result, "Bitrix24", "CreateDepartment", "Hook", FunctionParameters); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Name     = "Subordinate department";
    ParentID = FunctionParameters["Bitrix24_HookDepID"];
    HeadID   = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("title", Name);
    Options.Insert("parentid", ParentID);
    Options.Insert("headid", HeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDepartment", Options);

    // END

    Process(Result, "Bitrix24", "CreateDepartment", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];
    ParentID     = 7;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);
    Options.Insert("parentid", ParentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDepartment", Options);

    Process(Result, "Bitrix24", "UpdateDepartment", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    DepartmentID = FunctionParameters["Bitrix24_DepID"];
    Name         = "New department";
    ParentID     = 1;
    HeadID       = 10;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);
    Options.Insert("title", Name);
    Options.Insert("parentid", ParentID);
    Options.Insert("headid", HeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDepartment", Options);

    // END

    Process(Result, "Bitrix24", "UpdateDepartment");

EndProcedure

Procedure Bitrix24_DeleteDepartment(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDepartment", Options);

    Process(Result, "Bitrix24", "DeleteDepartment", "Hook"); // SKIP

    URL          = FunctionParameters["Bitrix24_Domain"];
    Token        = FunctionParameters["Bitrix24_Token"];
    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDepartment", Options);

    // END

    Process(Result, "Bitrix24", "DeleteDepartment");

EndProcedure

Procedure Bitrix24_GetDepartments(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("depid", DepartmentID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDepartments", Options);

    Process(Result, "Bitrix24", "GetDepartments", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    HeadID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headid", HeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDepartments", Options);

    // END

    Process(Result, "Bitrix24", "GetDepartments");

EndProcedure

Procedure Bitrix24_GetCurrentUser(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCurrentUser", Options);

    Process(Result, "Bitrix24", "GetCurrentUser", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCurrentUser", Options);

    // END

    Process(Result, "Bitrix24", "GetCurrentUser");

EndProcedure

Procedure Bitrix24_GetUserFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFieldsStructure", Options);

    Process(Result, "Bitrix24", "GetUserFieldsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFieldsStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetUserFieldsStructure");

EndProcedure

Procedure Bitrix24_CreateUser(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_URL"];
    Email = String(New UUID) + "@exepmple.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", UserStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateUser", Options);

    Process(Result, "Bitrix24", "CreateUser", "Hook", FunctionParameters); // SKIP

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
    Options.Insert("url", URL);
    Options.Insert("fields", UserStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateUser", Options);

    // END

    Process(Result, "Bitrix24", "CreateUser", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];
    Email  = String(New UUID) + "@exepmple.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fields", UserStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateUser", Options);

    Process(Result, "Bitrix24", "UpdateUser", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];
    Email  = String(New UUID) + "@exepmple.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("NAME"         , "Oleg");
    UserStructure.Insert("LAST_NAME"    , "Lama");
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fields", UserStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateUser", Options);

    // END

    Process(Result, "Bitrix24", "UpdateUser");

EndProcedure

Procedure Bitrix24_ChangeUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fire", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeUserStatus", Options);

    Process(Result, "Bitrix24", "ChangeUserStatus", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("fire", Истина);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "ChangeUserStatus", Options);

    // END

    Process(Result, "Bitrix24", "ChangeUserStatus");

EndProcedure

Procedure Bitrix24_GetUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUser", Options);

    Process(Result, "Bitrix24", "GetUser", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUser", Options);

    // END

    Process(Result, "Bitrix24", "GetUser");

EndProcedure

Procedure Bitrix24_FindUsers(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FilterStructure = New Structure;
    FilterStructure.Insert("NAME"              , "Vitaly");
    FilterStructure.Insert("LAST_NAME"         , "Alpaca");
    FilterStructure.Insert("WORK_POSITION"     , "DevOps engineer");
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Marketing department");
    FilterStructure.Insert("USER_TYPE"         , "employee");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", FilterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "FindUsers", Options);

    Process(Result, "Bitrix24", "FindUsers", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", FilterStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "FindUsers", Options);

    // END

    Process(Result, "Bitrix24", "FindUsers");

EndProcedure

Procedure Bitrix24_StartTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTimekeeping", Options);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate() - Hour;
    Report = "Late";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("time", Time);
    Options.Insert("report", Report);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StartTimekeeping", Options);

    // END

EndProcedure

Procedure Bitrix24_StopTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopTimekeeping", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate();
    Report = "Time off";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("time", Time);
    Options.Insert("report", Report);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "StopTimekeeping", Options);

EndProcedure

Procedure Bitrix24_PauseTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTimekeeping", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "PauseTimekeeping", Options);

    // END

EndProcedure

Procedure Bitrix24_GetTimekeepingStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingStatus", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingStatus", Options);

EndProcedure

Procedure Bitrix24_GetTimekeepingSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingSettings", Options);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("userid", UserID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTimekeepingSettings", Options);

    // END

EndProcedure

Procedure Bitrix24_GetLeadFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadFilterStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetLeadFilterStructure");

EndProcedure

Procedure Bitrix24_GetLeadStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadStructure", Options);

    Process(Result, "Bitrix24", "GetLeadStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetLeadStructure");

EndProcedure

Procedure Bitrix24_CreateLead(FunctionParameters)

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
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateLead", Options);

    Process(Result, "Bitrix24", "CreateLead", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("NAME"     , "Ivan");
    FieldsStructure.Insert("LAST_NAME", "Ivanov");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateLead", Options);

    // END

    Process(Result, "Bitrix24", "CreateLead", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateLead(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Lermontov st., b. 20");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Belarus");
    FieldsStructure.Insert("TITLE"          , "SuperClient");

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateLead", Options);

    Process(Result, "Bitrix24", "UpdateLead", "Hook"); // SKIP

    FieldsStructure.Insert("NAME"     , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME", "Evgeniev");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateLead", Options);

    // END

    Process(Result, "Bitrix24", "UpdateLead");

EndProcedure

Procedure Bitrix24_DeleteLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteLead", Options);

    Process(Result, "Bitrix24", "DeleteLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteLead", Options);

    // END

    Process(Result, "Bitrix24", "DeleteLead");

EndProcedure

Procedure Bitrix24_GetLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLead", Options);

    Process(Result, "Bitrix24", "GetLead", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("lead", LeadID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLead", Options);

    // END

    Process(Result, "Bitrix24", "GetLead");

EndProcedure

Procedure Bitrix24_GetLeadsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadsList", Options);

    Process(Result, "Bitrix24", "GetLeadsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", Filter);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetLeadsList", Options);

    // END

    Process(Result, "Bitrix24", "GetLeadsList");

EndProcedure

Procedure Bitrix24_GetDealsFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsFilterStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetDealsFilterStructure");

EndProcedure

Procedure Bitrix24_GetDealStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealStructure", Options);

    Process(Result, "Bitrix24", "GetDealStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetDealStructure");

EndProcedure

Procedure Bitrix24_CreateDeal(FunctionParameters)

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
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDeal", Options);

    Process(Result, "Bitrix24", "CreateDeal", "Hook", FunctionParameters); // SKIP

    FieldsStructure.Insert("TITLE"    , "Another deal");
    FieldsStructure.Insert("CLOSEDATE", "2031-01-01");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateDeal", Options);

    // END

    Process(Result, "Bitrix24", "CreateDeal", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateDeal(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"      , "Sale in RUB");
    FieldsStructure.Insert("CURRENCY_ID", "RUB");
    FieldsStructure.Insert("OPPORTUNITY", 50000);

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("fields", FieldsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDeal", Options);

    Process(Result, "Bitrix24", "UpdateDeal", "Hook"); // SKIP

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("fields", FieldsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateDeal", Options);

    // END

    Process(Result, "Bitrix24", "UpdateDeal");

EndProcedure

Procedure Bitrix24_GetDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDeal", Options);

    Process(Result, "Bitrix24", "GetDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDeal", Options);

    // END

    Process(Result, "Bitrix24", "GetDeal");

EndProcedure

Procedure Bitrix24_DeleteDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDeal", Options);

    Process(Result, "Bitrix24", "DeleteDeal", "Hook"); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("deal", DealID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteDeal", Options);

    // END

    Process(Result, "Bitrix24", "DeleteDeal");

EndProcedure

Procedure Bitrix24_GetDealsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsList", Options);

    Process(Result, "Bitrix24", "GetDealsList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("filter", Filter);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetDealsList", Options);

    // END

    Process(Result, "Bitrix24", "GetDealsList");

EndProcedure

Procedure Bitrix24_GetTasksFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetTasksFilterStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetTasksFilterStructure");

EndProcedure

Procedure Bitrix24_GetCommentStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCommentStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetCommentStructure");

EndProcedure

Procedure Bitrix24_GetChatStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetChatStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetChatStructure");

EndProcedure

Procedure Bitrix24_GetPictureBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Picture"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetPictureBlock", Options);

    // END

    Process(Result, "Bitrix24", "GetPictureBlock");

EndProcedure

Procedure Bitrix24_GetFileBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Document"];

    Options = New Structure;
    Options.Insert("title", Name);
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetFileBlock", Options);

    // END

    Process(Result, "Bitrix24", "GetFileBlock");

EndProcedure

Procedure Bitrix24_GetUserFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserFilterStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetUserFilterStructure");

EndProcedure

Procedure Bitrix24_CreateCalendar(FunctionParameters)

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
    Options.Insert("url", URL);
    Options.Insert("fields", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendar", Options);

    Process(Result, "Bitrix24", "CreateCalendar", "Hook", FunctionParameters); // SKIP

    CalendarsStructure.Insert("name"       , "Another calendar");
    CalendarsStructure.Insert("description", "My other new calendar");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", CalendarsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendar", Options);

    // END

    Process(Result, "Bitrix24", "CreateCalendar", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateCalendar(FunctionParameters)

    UserID = 1;

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("type"       , "user");
    CalendarsStructure.Insert("ownerId"    , UserID);
    CalendarsStructure.Insert("name"       , "New calendar name");
    CalendarsStructure.Insert("description", "This calendar has been changed");

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("fields", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendar", Options);

    Process(Result, "Bitrix24", "UpdateCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("fields", CalendarsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendar", Options);

    // END

    Process(Result, "Bitrix24", "UpdateCalendar");

EndProcedure

Procedure Bitrix24_DeleteCalendar(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];
    OwnerID    = 1;
    Type       = "user";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendar", Options);

    Process(Result, "Bitrix24", "DeleteCalendar", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("calendar", CalendarID);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendar", Options);

    // END

    Process(Result, "Bitrix24", "DeleteCalendar");

EndProcedure

Procedure Bitrix24_GetCalendarStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetCalendarStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarStructure", Options);

    Process(Result, "Bitrix24", "GetCalendarStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarList(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarList", Options);

    Process(Result, "Bitrix24", "GetCalendarList", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarList", Options);

    // END

    Process(Result, "Bitrix24", "GetCalendarList");

EndProcedure

Procedure Bitrix24_GetCalendarSettingsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarSettingsStructure", Options);

    Process(Result, "Bitrix24", "GetCalendarSettingsStructure", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarSettingsStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetCalendarSettingsStructure");

EndProcedure

Procedure Bitrix24_GetCalednarCustomSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalednarCustomSettingsStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetCalednarCustomSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalednarCustomSettingsStructure", Options);

    Process(Result, "Bitrix24", "GetCalednarCustomSettingsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCustomCalendarSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomCalendarSettings", Options);

    Process(Result, "Bitrix24", "GetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCustomCalendarSettings", Options);

    // END

    Process(Result, "Bitrix24", "GetCustomCalendarSettings");

EndProcedure

Procedure Bitrix24_SetCustomCalendarSettings(FunctionParameters)

    CalendarsStructure = New Structure;
    CalendarsStructure.Insert("view"              , "month");
    CalendarsStructure.Insert("showDeclined"      , "Y");
    CalendarsStructure.Insert("collapseOffHours"  , "N");
    CalendarsStructure.Insert("showCompletedTasks", "N");

    URL = FunctionParameters["Bitrix24_URL"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("settings", CalendarsStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetCustomCalendarSettings", Options);

    Process(Result, "Bitrix24", "SetCustomCalendarSettings", "Hook"); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("settings", CalendarsStructure);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetCustomCalendarSettings", Options);

    // END

    Process(Result, "Bitrix24", "SetCustomCalendarSettings");

EndProcedure

Procedure Bitrix24_GetUserBusy(FunctionParameters)

    URL        = FunctionParameters["Bitrix24_URL"];
    CalendarID = FunctionParameters["Bitrix24_HookCalendarID"];

    User = 1;

    Week        = 604800;
    CurrentDate = OPI_Tools.GetCurrentDate();

    StartDate = CurrentDate;
    EndDate   = CurrentDate + Week;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", User);
    Options.Insert("from", StartDate);
    Options.Insert("to", EndDate);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserBusy", Options);

    Process(Result, "Bitrix24", "GetUserBusy", "Hook"); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("users", User);
    Options.Insert("from", StartDate);
    Options.Insert("to", EndDate);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserBusy", Options);

    // END

    Process(Result, "Bitrix24", "GetUserBusy");

EndProcedure

Procedure Bitrix24_CreateCalendarEvent(FunctionParameters)

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
    EventStucture.Insert("accessibility", "quest");
    EventStucture.Insert("importance"   , "normal");
    EventStucture.Insert("private_event", "Y");

    RepeatabilityStructure = New Structure;
    RepeatabilityStructure.Insert("FREQ"    , "DAILY");
    RepeatabilityStructure.Insert("COUNT"   , 3);
    RepeatabilityStructure.Insert("INTERVAL", 10);

    DaysArray = New Array;
    DaysArray.Add("SA");
    DaysArray.Add("MO");

    RepeatabilityStructure.Insert("BYDAY", DaysArray);
    RepeatabilityStructure.Insert("UNTIL", XMLString(Tomorrow + Hour * 24 * 10));

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
    Options.Insert("url", URL);
    Options.Insert("fields", EventStucture);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendarEvent", Options);

    Process(Result, "Bitrix24", "CreateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    EventStucture.Insert("section", CalendarID);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("fields", EventStucture);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "CreateCalendarEvent", Options);

    // END

    Process(Result, "Bitrix24", "CreateCalendarEvent", , FunctionParameters);

EndProcedure

Procedure Bitrix24_UpdateCalendarEvent(FunctionParameters)

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
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("fields", EventStucture);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendarEvent", Options);

    Process(Result, "Bitrix24", "UpdateCalendarEvent", "Hook", FunctionParameters); // SKIP

    URL        = FunctionParameters["Bitrix24_Domain"];
    Token      = FunctionParameters["Bitrix24_Token"];
    EventID    = FunctionParameters["Bitrix24_CEventID"];
    CalendarID = FunctionParameters["Bitrix24_CalendarID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("fields", EventStucture);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "UpdateCalendarEvent", Options);

    // END

    Process(Result, "Bitrix24", "UpdateCalendarEvent", , FunctionParameters);

EndProcedure

Procedure Bitrix24_DeleteCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendarEvent", Options);

    Process(Result, "Bitrix24", "DeleteCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "DeleteCalendarEvent", Options);

    // END

    Process(Result, "Bitrix24", "DeleteCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvent(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvent", Options);

    Process(Result, "Bitrix24", "GetCalendarEvent", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvent", Options);

    // END

    Process(Result, "Bitrix24", "GetCalendarEvent");

EndProcedure

Procedure Bitrix24_GetCalendarEvents(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    OwnerID = 1;
    Type    = "user";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvents", Options);

    Process(Result, "Bitrix24", "GetCalendarEvents", "Hook"); // SKIP

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
    Options.Insert("url", URL);
    Options.Insert("owner", OwnerID);
    Options.Insert("type", Type);
    Options.Insert("filter", Filter);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEvents", Options);

    // END

    Process(Result, "Bitrix24", "GetCalendarEvents");

EndProcedure

Procedure Bitrix24_SetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];
    Status  = "Y";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("status", Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserParticipationStatus", Options);

    Process(Result, "Bitrix24", "SetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("status", Status);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "SetUserParticipationStatus", Options);

    // END

    Process(Result, "Bitrix24", "SetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetUserParticipationStatus(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    EventID = FunctionParameters["Bitrix24_HookCEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserParticipationStatus", Options);

    Process(Result, "Bitrix24", "GetUserParticipationStatus", "Hook"); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    EventID = FunctionParameters["Bitrix24_CEventID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("event", EventID);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetUserParticipationStatus", Options);

    // END

    Process(Result, "Bitrix24", "GetUserParticipationStatus");

EndProcedure

Procedure Bitrix24_GetCalendarEventsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetCalendarEventsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsStructure", Options);

    Process(Result, "Bitrix24", "GetCalendarEventsStructure", "Clear");

EndProcedure

Procedure Bitrix24_GetCalendarEventsFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsFilterStructure", Options);

    // END

    Process(Result, "Bitrix24", "GetCalendarEventsFilterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("bitrix24", "GetCalendarEventsFilterStructure", Options);

    Process(Result, "Bitrix24", "GetCalendarEventsFilterStructure", "Clear");

EndProcedure

#EndRegion

#Region VKTeams

Procedure VKTeams_CheckToken(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "CheckToken", Options);

    // END

    Process(Result, "VKTeams", "CheckToken");

EndProcedure

Procedure VKTeams_GetEvents(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    LastID = 0;

    For N = 1 To 5 Do // In real work - endless loop

        Result = OPI_VKTeams.GetEvents(Token, LastID, 3);

        Process(Result, "VKTeams", "GetEvents"); // SKIP

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

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendTextMessage", Options);

    Process(Result, "VKTeams", "SendTextMessage", "Simple", FunctionParameters); // SKIP

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

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);
    Options.Insert("reply", ReplyID);
    Options.Insert("keyboard", Keyboard);
    Options.Insert("parsemod", Markup);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendTextMessage", Options);

    // END

    Process(Result, "VKTeams", "SendTextMessage", , FunctionParameters);

EndProcedure

Procedure VKTeams_ForwardMessage(FunctionParameters)

    Token      = FunctionParameters["VkTeams_Token"];
    ChatID     = FunctionParameters["VkTeams_ChatID"];
    FromChatID = FunctionParameters["VkTeams_ChatID2"];
    MessageID  = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("messageid", MessageID);
    Options.Insert("fromid", FromChatID);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ForwardMessage", Options);

    Process(Result, "VKTeams", "ForwardMessage", "Simple"); // SKIP

    Text = "Additional text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("messageid", MessageID);
    Options.Insert("fromid", FromChatID);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ForwardMessage", Options);

    // END

    Process(Result, "VKTeams", "ForwardMessage");

EndProcedure

Procedure VKTeams_SendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
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

    Process(Result, "VKTeams", "SendFile", "URL", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FilePath);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    Process(Result, "VKTeams", "SendFile", "Path", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FileBD);
    Options.Insert("text", Text);
    Options.Insert("filename", "ImportantDocument.docx");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendFile", Options);

    // END

    Process(Result, "VKTeams", "SendFile", , FunctionParameters);

    DeleteFiles(FilePath);

EndProcedure

Procedure VKTeams_ResendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_FileID"];
    Text   = "File caption";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("fileid", FileID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ResendFile", Options);

    // END

    Process(Result, "VKTeams", "ResendFile");

EndProcedure

Procedure VKTeams_GetFileInformation(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    FileID = FunctionParameters["VkTeams_FileID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetFileInformation", Options);

    // END

    Process(Result, "VKTeams", "GetFileInformation");

EndProcedure

Procedure VKTeams_EditMessageText(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];
    Text      = "New message text";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "EditMessageText", Options);

    Process(Result, "VKTeams", "EditMessageText", "Path"); // SKIP

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

    Process(Result, "VKTeams", "EditMessageText");

EndProcedure

Procedure VKTeams_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DeleteMessage", Options);

    // END

    Process(Result, "VKTeams", "DeleteMessage");

EndProcedure

Procedure VKTeams_SendVoice(FunctionParameters)

    Token   = FunctionParameters["VkTeams_Token"];
    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];

    File     = FunctionParameters["Audio2"]; // URL
    FilePath = GetTempFileName("m4a"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    Process(Result, "VKTeams", "SendVoice", "URL", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FilePath);
    Options.Insert("reply", ReplyID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    Process(Result, "VKTeams", "SendVoice", "Path", FunctionParameters); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FileBD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SendVoice", Options);

    // END

    Process(Result, "VKTeams", "SendVoice", , FunctionParameters);

    DeleteFiles(FilePath);

EndProcedure

Procedure VKTeams_ResendVoice(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_VoiceID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("fileid", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ResendVoice", Options);

    // END

    Process(Result, "VKTeams", "ResendVoice");

EndProcedure

Procedure VKTeams_RemoveChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("members", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "RemoveChatMembers", Options);

    // END

    Process(Result, "VKTeams", "RemoveChatMembers");

EndProcedure

Procedure VKTeams_ChangeChatPicture(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    File     = FunctionParameters["Picture3"]; // URL
    FilePath = GetTempFileName("png"); // Path

    CopyFile(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", File);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    Process(Result, "VKTeams", "ChangeChatPicture", "URL");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FilePath);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    Process(Result, "VKTeams", "ChangeChatPicture", "Path");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("file", FileBD);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ChangeChatPicture", Options);

    // END

    Process(Result, "VKTeams", "ChangeChatPicture");

    DeleteFiles(FilePath);

EndProcedure

Procedure VKTeams_GetChatInfo(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatInfo", Options);

    // END

    Process(Result, "VKTeams", "GetChatInfo");

EndProcedure

Procedure VKTeams_GetChatAdmins(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatAdmins", Options);

    // END

    Process(Result, "VKTeams", "GetChatAdmins");

EndProcedure

Procedure VKTeams_GetChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatMembers", Options);

    // END

    Process(Result, "VKTeams", "GetChatMembers");

EndProcedure

Procedure VKTeams_GetChatBlockedUsers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatBlockedUsers", Options);

    // END

    Process(Result, "VKTeams", "GetChatBlockedUsers");

EndProcedure

Procedure VKTeams_GetChatJoinRequests(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "GetChatJoinRequests", Options);

    // END

    Process(Result, "VKTeams", "GetChatJoinRequests");

EndProcedure

Procedure VKTeams_BlockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);
    Options.Insert("dellast", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "BlockChatUser", Options);

    // END

    Process(Result, "VKTeams", "BlockChatUser");

EndProcedure

Procedure VKTeams_UnblockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "UnblockChatUser", Options);

    // END

    Process(Result, "VKTeams", "UnblockChatUser");

EndProcedure

Procedure VKTeams_PinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "PinMessage", Options);

    // END

    Process(Result, "VKTeams", "PinMessage");

EndProcedure

Procedure VKTeams_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("messageid", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "UnpinMessage", Options);

    // END

    Process(Result, "VKTeams", "UnpinMessage");

EndProcedure

Procedure VKTeams_ApprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ApprovePending", Options);

    Process(Result, "VKTeams", "ApprovePending", "One"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "ApprovePending", Options);

    // END

    Process(Result, "VKTeams", "ApprovePending");

EndProcedure

Procedure VKTeams_DisapprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("userid", User);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DisapprovePending", Options);

    Process(Result, "VKTeams", "DisapprovePending", "One"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "DisapprovePending", Options);

    // END

    Process(Result, "VKTeams", "DisapprovePending");

EndProcedure

Procedure VKTeams_SetChatTitle(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New title";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatTitle", Options);

    // END

    Process(Result, "VKTeams", "SetChatTitle");

EndProcedure

Procedure VKTeams_SetChatDescription(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New description";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatDescription", Options);

    // END

    Process(Result, "VKTeams", "SetChatDescription");

EndProcedure

Procedure VKTeams_SetChatRules(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "Text of the new rules";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("chatid", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("vkteams", "SetChatRules", Options);

    // END

    Process(Result, "VKTeams", "SetChatRules");

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
                    Result  = OPI_VKTeams.AnswerButtonEvent(Token, EventID, "Get it!");

                    Process(Result, "VKTeams", "AnswerButtonEvent"); // SKIP

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

#EndRegion

#Region Ozon

Procedure Ozon_GetCategoriesAndProductTypesTree(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("lang", "EN");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCategoriesAndProductTypesTree", Options);

    Process(Result, "Ozon", "GetCategoriesAndProductTypesTree", "EN"); // SKIP

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCategoriesAndProductTypesTree", Options);

    // END

    Process(Result, "Ozon", "GetCategoriesAndProductTypesTree");

EndProcedure

Procedure Ozon_GetCategoryAttributes(FunctionParameters)

    ClientID   = FunctionParameters["Ozon_ClientID"];
    APIKey     = FunctionParameters["Ozon_ApiKey"];
    CategoryID = 17029016;
    TypeID     = 970778135;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("categoryid", CategoryID);
    Options.Insert("typeid", TypeID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCategoryAttributes", Options);

    // END

    Process(Result, "Ozon", "GetCategoryAttributes");

EndProcedure

Procedure Ozon_GetAttributeValues(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("categoryid", CategoryID);
    Options.Insert("typeid", TypeID);
    Options.Insert("attributeid", AttributeID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetAttributeValues", Options);

    // END

    Process(Result, "Ozon", "GetAttributeValues");

EndProcedure

Procedure Ozon_SearchAttributeValue(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;
    Value       = "Sunshine";

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("categoryid", CategoryID);
    Options.Insert("typeid", TypeID);
    Options.Insert("attributeid", AttributeID);
    Options.Insert("value", Value);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "SearchAttributeValue", Options);

    // END

    Process(Result, "Ozon", "SearchAttributeValue");

EndProcedure

Procedure Ozon_GetProductStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductStructure", Options);

    // END

    Process(Result, "Ozon", "GetProductStructure");

EndProcedure

Procedure Ozon_CreateUpdateProducts(FunctionParameters)

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
    ItemStructure.Insert("type_id"                , 91565);

    // Video

    OPI_Ozon.AddProductVideo(ItemStructure, Video, "viedo1");

    // Attributes individualized for different categories

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");
    CategoryAttribute2 = New Structure("dictionary_value_id,value", 5060050, "Samsung");
    CategoryAttribute3 = New Structure("dictionary_value_id,value", 61576, "gray");
    CategoryAttribute4 = New Structure("dictionary_value_id,value", 95911,
        "Protective film set for X3 NFC. Dark cotton");

    CategoryAttribute5 = New Structure("value", "Protective film set for X3 NFC. Dark cotton");

    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 85   , 0, CategoryAttribute2);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 10096, 0, CategoryAttribute3);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 8229 , 0, CategoryAttribute4);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 9048 , 0, CategoryAttribute5);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("items", ItemStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateUpdateProducts", Options);

    // END

    Process(Result, "Ozon", "CreateUpdateProducts", , FunctionParameters);

    ItemStructure.Insert("offer_id", "1432106010");
    OPI_Ozon.CreateUpdateProducts(ClientID, APIKey, ItemStructure);

    OPI_Tools.Pause(120);

EndProcedure

Procedure Ozon_AddProductVideo(FunctionParameters)

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

    OPI_Ozon.AddProductVideo(ItemStructure, Video, "viedo1");

    // END

    Process(ItemStructure, "Ozon", "AddProductVideo");

EndProcedure

Procedure Ozon_AddProductVideoCover(FunctionParameters)

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

    OPI_Ozon.AddProductVideoCover(ItemStructure, Video);

    // END

    Process(ItemStructure, "Ozon", "AddProductVideoCover");

EndProcedure

Procedure Ozon_CompleteComplexAttribute(FunctionParameters)

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

    CategoryAttribute2 = New Structure("value", "Protective film set for X3 NFC. Dark cotton");

    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 5076, 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 9048, 0, CategoryAttribute2);

    // END

    Process(ItemStructure, "Ozon", "CompleteComplexAttribute");

EndProcedure

Procedure Ozon_GetProductCreationStatus(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    TaskID   = FunctionParameters["Ozon_TaskID"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("taskid", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    // END

    While Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    EndDo;

    Process(Result, "Ozon", "GetProductCreationStatus");

EndProcedure

Procedure Ozon_CreateProductByOzonID(FunctionParameters)

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
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("items", ItemStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateProductByOzonID", Options);

    // END

    Process(Result, "Ozon", "CreateProductByOzonID");

EndProcedure

Procedure Ozon_GetSimplifiedProductStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetSimplifiedProductStructure", Options);

    // END

    Process(Result, "Ozon", "GetSimplifiedProductStructure");

EndProcedure

Procedure Ozon_GetAttributesUpdateStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetAttributesUpdateStructure", Options);

    // END

    Process(Result, "Ozon", "GetAttributesUpdateStructure");

EndProcedure

Procedure Ozon_UpdateProductsAttributes(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    AttributesStructure = New Structure("offer_id", "143210609");

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");
    CategoryAttribute2 = New Structure("dictionary_value_id,value", 5060050, "Samsung");
    CategoryAttribute3 = New Structure("dictionary_value_id,value", 61576, "red");

    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 85   , 0, CategoryAttribute2);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 10096, 0, CategoryAttribute3);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("items", AttributesStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsAttributes", Options);

    // END

    Process(Result, "Ozon", "UpdateProductsAttributes", , FunctionParameters);

    TaskID = Result["task_id"];
    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("taskid", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductCreationStatus", Options);

    If Result["result"]["items"].Count() > 0 Then

        While Result["result"]["items"][0]["status"] = "pending" Do

            OPI_Tools.Pause(30);
            Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

        EndDo;

        Process(Result, "Ozon", "UpdateProductsAttributes", "Check", FunctionParameters);

    EndIf;

EndProcedure

Procedure Ozon_GetProductsFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsFilterStructure", Options);

    // END

    Process(Result, "Ozon", "GetProductsFilterStructure");

EndProcedure

Procedure Ozon_GetProductList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210609");
    IDArray.Add("1432106010");

    Filter = New Structure;
    Filter.Insert("visibility", "ALL");
    Filter.Insert("offer_id"  , IDArray);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("filter", Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductList", Options);

    // END

    Process(Result, "Ozon", "GetProductList", , FunctionParameters);

EndProcedure

Procedure Ozon_GetProductsAttributesData(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210609");

    Filter = New Structure;
    Filter.Insert("visibility", "ALL");
    Filter.Insert("offer_id"  , IDArray);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("filter", Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsAttributesData", Options);

    // END

    Process(Result, "Ozon", "GetProductsAttributesData");

EndProcedure

Procedure Ozon_GetProductsContentRating(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("sku", SKU);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsContentRating", Options);

    // END

    Process(Result, "Ozon", "GetProductsContentRating");

EndProcedure

Procedure Ozon_GetProductsInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("offerid", Article);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsInformation", Options);

    // END

    Process(Result, "Ozon", "GetProductsInformation");

EndProcedure

Procedure Ozon_GetProductDescription(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("offerid", Article);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductDescription", Options);

    // END

    Process(Result, "Ozon", "GetProductDescription");

EndProcedure

Procedure Ozon_GetProductsRequestsLimits(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsRequestsLimits", Options);

    // END

    Process(Result, "Ozon", "GetProductsRequestsLimits");

EndProcedure

Procedure Ozon_UpdateProductImages(FunctionParameters)

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
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("productid", ProductID);
    Options.Insert("images", ImagesArray);
    Options.Insert("color", MarketingColor);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductImages", Options);

    // END

    Process(Result, "Ozon", "UpdateProductImages");

EndProcedure

Procedure Ozon_CheckProductsImagesUpload(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("products", ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CheckProductsImagesUpload", Options);

    // END

    Process(Result, "Ozon", "CheckProductsImagesUpload");

EndProcedure

Procedure Ozon_UpdateProductsArticles(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210609", "143210612");

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("offers", ArticlesMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsArticles", Options);

    // END

    Process(Result, "Ozon", "UpdateProductsArticles");

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210612", "143210609");

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("offers", ArticlesMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsArticles", Options);

    Process(Result, "Ozon", "UpdateProductsArticles", "Reverse");

EndProcedure

Procedure Ozon_ArchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("products", ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "ArchiveProducts", Options);

    // END

    Process(Result, "Ozon", "ArchiveProducts");

    ProductID = FunctionParameters["Ozon_ProductID2"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("products", ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "ArchiveProducts", Options);

    Process(Result, "Ozon", "ArchiveProducts", "Additional");

EndProcedure

Procedure Ozon_UnarchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("products", ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UnarchiveProducts", Options);

    // END

    Process(Result, "Ozon", "UnarchiveProducts");

EndProcedure

Procedure Ozon_DeleteProductsWithoutSKU(FunctionParameters)

    OPI_Tools.Pause(30);

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("products", ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "ArchiveProducts", Options);

    OPI_TestDataRetrieval.LogServiceInformation(Result, "ArchiveProducts (for deleting)", "Ozon"); // SKIP
    OPI_Tools.Pause(15); // SKIP

    Article = "143210609";

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("articles", Article);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "DeleteProductsWithoutSKU", Options);

    // END

    Process(Result, "Ozon", "DeleteProductsWithoutSKU");

    Article = "1432106010";
    OPI_Ozon.DeleteProductsWithoutSKU(ClientID, APIKey, Article);

EndProcedure

Procedure Ozon_UploadProductActivationCodes(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Codes = New Array;
    Codes.Add("11111111");
    Codes.Add("22222222");

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("productid", ProductID);
    Options.Insert("codes", Codes);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UploadProductActivationCodes", Options);

    // END

    Process(Result, "Ozon", "UploadProductActivationCodes", , FunctionParameters);

EndProcedure

Procedure Ozon_GetCodesUploadStatus(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    TaskID   = FunctionParameters["Ozon_CodesTaskID"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("taskid", TaskID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCodesUploadStatus", Options);

    // END

    If ValueIsFilled(Result["result"]) Then
        While Result["result"]["status"] = "pending" Do

            OPI_Tools.Pause(30);
            Result = OPI_Ozon.GetCodesUploadStatus(ClientID, APIKey, TaskID);

        EndDo;
    EndIf;

    Process(Result, "Ozon", "GetCodesUploadStatus");

EndProcedure

Procedure Ozon_GetProductSubscribersCount(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("sku", SKU);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductSubscribersCount", Options);

    // END

    Process(Result, "Ozon", "GetProductSubscribersCount");

EndProcedure

Procedure Ozon_GetRelatedSKUs(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("sku", SKU);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetRelatedSKUs", Options);

    // END

    Process(Result, "Ozon", "GetRelatedSKUs");

EndProcedure

Procedure Ozon_BindBarcodes(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    BarcodesMap = New Map;
    BarcodesMap.Insert(1626044001, "112233");

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("barcodes", BarcodesMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "BindBarcodes", Options);

    // END

    Process(Result, "Ozon", "BindBarcodes");

EndProcedure

Procedure Ozon_CreateBarcodes(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("productids", ProductID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateBarcodes", Options);

    // END

    Process(Result, "Ozon", "CreateBarcodes");

EndProcedure

Procedure Ozon_GetWarehousesList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetWarehousesList", Options);

    // END

    Process(Result, "Ozon", "GetWarehousesList");

EndProcedure

Procedure Ozon_GetProductsStocks(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210608");

    Filter = New Structure;
    Filter.Insert("visibility", "ALL");
    Filter.Insert("offer_id"  , IDArray);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("filter", Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsStocks", Options);

    // END

    Process(Result, "Ozon", "GetProductsStocks");

EndProcedure

Procedure Ozon_UpdateProductsPrices(FunctionParameters)

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
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("prices", Prices);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsPrices", Options);

    // END

    Process(Result, "Ozon", "UpdateProductsPrices");

EndProcedure

Procedure Ozon_UpdateProductsStocks(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Stocks = New Structure;
    Stocks.Insert("offer_id"    , "143210610");
    Stocks.Insert("product_id"  , ProductID);
    Stocks.Insert("stock"       , 20);
    Stocks.Insert("warehouse_id", 1);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("stocks", Stocks);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "UpdateProductsStocks", Options);

    // END

    Process(Result, "Ozon", "UpdateProductsStocks");

EndProcedure

Procedure Ozon_GetProductsPrices(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductsPrices", Options);

    // END

    Process(Result, "Ozon", "GetProductsPrices");

EndProcedure

Procedure Ozon_GetDiscountInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("sku", SKU);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetDiscountInformation", Options);

    // END

    Process(Result, "Ozon", "GetDiscountInformation");

EndProcedure

Procedure Ozon_SetProductDiscount(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = 1156646653;

    Discount = 10;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("productid", ProductID);
    Options.Insert("discount", Discount);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "SetProductDiscount", Options);

    // END

    Process(Result, "Ozon", "SetProductDiscount");

EndProcedure

Procedure Ozon_GetPromotionsList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetPromotionsList", Options);

    // END

    Process(Result, "Ozon", "GetPromotionsList");

EndProcedure

Procedure Ozon_GetAvailablePromoProducts(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    PromoID  = 111111111;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("actionid", PromoID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetAvailablePromoProducts", Options);

    // END

    Process(Result, "Ozon", "GetAvailablePromoProducts");

EndProcedure

Procedure Ozon_GetCurrentPromoProducts(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    PromoID  = 111111111;

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("actionid", PromoID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetCurrentPromoProducts", Options);

    // END

    Process(Result, "Ozon", "GetCurrentPromoProducts");

EndProcedure

Procedure Ozon_GetProductStocksStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductStocksStructure", Options);

    // END

    Process(Result, "Ozon", "GetProductStocksStructure");

EndProcedure

Procedure Ozon_GetProductPriceStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetProductPriceStructure", Options);

    // END

    Process(Result, "Ozon", "GetProductPriceStructure");

EndProcedure

Procedure Ozon_GetClustersList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetClustersList", Options);

    // END

    Process(Result, "Ozon", "GetClustersList");

EndProcedure

Procedure Ozon_GetShippingWarehousesList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Search   = "Tver";

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("search", Search);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetShippingWarehousesList", Options);

    // END

    Process(Result, "Ozon", "GetShippingWarehousesList");

EndProcedure

Procedure Ozon_CreateFBODraft(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Cluster  = 2;

    Items = New Map;
    Items.Insert("1783161863", 5);
    Items.Insert("1784654052", 2);

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("clusters", Cluster);
    Options.Insert("items", Items);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "CreateFBODraft", Options);

    // END

    Process(Result, "Ozon", "CreateFBODraft", , FunctionParameters);

EndProcedure

Procedure Ozon_GetFBODraft(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    OperationID = FunctionParameters["Ozon_FBOOperID"];

    Status = "CALCULATION_STATUS_IN_PROGRESS";

    While Status = "CALCULATION_STATUS_IN_PROGRESS" Do

        Result = OPI_Ozon.GetFBODraft(ClientID, APIKey, OperationID);
        Status = Result["status"];

        OPI_Tools.Pause(20);

    EndDo;

    // END

    Process(Result, "Ozon", "GetFBODraft", , FunctionParameters);

EndProcedure

Procedure Ozon_GetShipmentAdditionalFields(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetShipmentAdditionalFields", Options);

    // END

    Process(Result, "Ozon", "GetShipmentAdditionalFields");

EndProcedure

Procedure Ozon_GetShipmentsFilterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetShipmentsFilterStructure", Options);

    // END

    Process(Result, "Ozon", "GetShipmentsFilterStructure");

EndProcedure

Procedure Ozon_GetFBOShipmentsList(FunctionParameters)

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
    Options.Insert("apikey", APIKey);
    Options.Insert("filter", Filter);
    Options.Insert("with", AddFields);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetFBOShipmentsList", Options);

    // END

    Process(Result, "Ozon", "GetFBOShipmentsList");

EndProcedure

Procedure Ozon_GetFBOTimeslots(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Day      = 86400;

    DateFrom  = OPI_Tools.GetCurrentDate();
    DateTo    = DateFrom + Day;
    Draft     = FunctionParameters["Ozon_Draft"];
    Warehouse = FunctionParameters["Ozon_FBOWarehouse"];

    Options = New Structure;
    Options.Insert("clientid", ClientID);
    Options.Insert("apikey", APIKey);
    Options.Insert("from", DateFrom);
    Options.Insert("to", DateTo);
    Options.Insert("draft", Draft);
    Options.Insert("whs", Warehouse);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ozon", "GetFBOTimeslots", Options);

    // END

    Process(Result, "Ozon", "GetFBOTimeslots");

EndProcedure

#EndRegion

#Region Neocities

Procedure Neocities_UploadFile(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Data  = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Path  = "testfolder/test_pic.png";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);
    Options.Insert("file", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "UploadFile", Options);

    // END

    Process(Result, "Neocities", "UploadFile");

EndProcedure

Procedure Neocities_UploadFiles(FunctionParameters)

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

    // END

    Process(Result, "Neocities", "UploadFiles");

EndProcedure

Procedure Neocities_DeleteSelectedFiles(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    Paths = New Array;
    Paths.Add("/test/pic1.png");
    Paths.Add("/test/gif.gif");
    Paths.Add("/pic2.png");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("paths", Paths);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "DeleteSelectedFiles", Options);

    // END

    Process(Result, "Neocities", "DeleteSelectedFiles");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("paths", "/testfolder");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "DeleteSelectedFiles", Options);

    Process(Result, "Neocities", "DeleteSelectedFiles", "Directory 1");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("paths", "/test");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "DeleteSelectedFiles", Options);

    Process(Result, "Neocities", "DeleteSelectedFiles", "Directory 2");

EndProcedure

Procedure Neocities_GetFilesList(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Path  = "test";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("path", Path);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetFilesList", Options);

    // END

    Process(Result, "Neocities", "GetFilesList");

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetFilesList", Options);

    Process(Result, "Neocities", "GetFilesList", "All");

EndProcedure

Procedure Neocities_GetSiteData(FunctionParameters)

    Token   = FunctionParameters["NC_Token"];
    Website = "2athenaeum";

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetSiteData", Options);

    Process(Result, "Neocities", "GetSiteData"); // SKIP

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("sitename", Website);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetSiteData", Options);

    // END

    Process(Result, "Neocities", "GetSiteData", "Website");

EndProcedure

Procedure Neocities_GetToken(FunctionParameters)

    Login    = FunctionParameters["NC_Login"];
    Password = FunctionParameters["NC_Password"];

    Options = New Structure;
    Options.Insert("login", Login);
    Options.Insert("password", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "GetToken", Options);

    // END

    Result["api_key"] = "***";

    Process(Result, "Neocities", "GetToken");

EndProcedure

Procedure Neocities_SynchronizeFolders(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    LocalFolder  = "C:\test_site";
    RemoteFolder = "test_sync";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("local", LocalFolder);
    Options.Insert("remote", RemoteFolder);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("neocities", "SynchronizeFolders", Options);

    // END

    Process(Result, "Neocities", "SynchronizeFolders");

EndProcedure

#EndRegion

#Region CDEK

Procedure CDEK_GetToken(FunctionParameters)

    Account  = FunctionParameters["CDEK_Account"];
    Password = FunctionParameters["CDEK_Password"];

    Options = New Structure;
    Options.Insert("account", Account);
    Options.Insert("pass", Password);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetToken", Options);

    // END

    Process(Result, "CDEK", "GetToken", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOrderDescription", Options);

    // END

    Process(Result, "CDEK", "GetOrderDescription");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOrderDescription", Options);

    Process(Result, "CDEK", "GetOrderDescription", "Clear");

EndProcedure

Procedure CDEK_CreateOrder(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("order", OrderDescription);
    Options.Insert("ostore", Истина);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateOrder", Options);

    // END

    Process(Result, "CDEK", "CreateOrder", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOrder", Options);

    // END

    Process(Result, "CDEK", "GetOrder", , FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderByNumber(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    OrderNumber = FunctionParameters["CDEK_OrderIMN"];
    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("number", OrderNumber);
    Options.Insert("internal", Истина);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOrderByNumber", Options);

    // END

    Process(Result, "CDEK", "GetOrderByNumber");

EndProcedure

Procedure CDEK_UpdateOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    OrderDescription = New Structure("comment", "NewComment");

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("order", OrderDescription);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "UpdateOrder", Options);

    // END

    Process(Result, "CDEK", "UpdateOrder");

EndProcedure

Procedure CDEK_DeleteOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "DeleteOrder", Options);

    // END

    Process(Result, "CDEK", "DeleteOrder");

EndProcedure

Procedure CDEK_CreateCustomerRefund(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Tariff = 139;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("tariff", Tariff);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateCustomerRefund", Options);

    // END

    Process(Result, "CDEK", "CreateCustomerRefund");

EndProcedure

Procedure CDEK_CreateRefusal(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateRefusal", Options);

    // END

    Process(Result, "CDEK", "CreateRefusal");

EndProcedure

Procedure CDEK_GetCourierInvitationsDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCourierInvitationsDescription", Options);

    // END

    Process(Result, "CDEK", "GetCourierInvitationsDescription");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCourierInvitationsDescription", Options);

    Process(Result, "CDEK", "GetCourierInvitationsDescription", "Clear");

EndProcedure

Procedure CDEK_CreateCourierInvitation(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("intake", InvitationDescription);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateCourierInvitation", Options);

    // END

    Process(Result, "CDEK", "CreateCourierInvitation", , FunctionParameters);

EndProcedure

Procedure CDEK_GetCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCourierInvitation", Options);

    // END

    Process(Result, "CDEK", "GetCourierInvitation");

EndProcedure

Procedure CDEK_DeleteCourierInvitation(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_IntakeUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "DeleteCourierInvitation", Options);

    // END

    Process(Result, "CDEK", "DeleteCourierInvitation");

EndProcedure

Procedure CDEK_CreateReceipt(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Type   = "tpl_russia";
    Copies = 1;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuids", UUID);
    Options.Insert("type", Type);
    Options.Insert("count", Copies);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateReceipt", Options);

    // END

    Process(Result, "CDEK", "CreateReceipt", , FunctionParameters);

EndProcedure

Procedure CDEK_GetReceipt(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_PrintUUID"];

    Result = OPI_CDEK.GetReceipt(Token, UUID, , True); // Server response with a URL

    // END

    Process(Result, "CDEK", "GetReceipt");

EndProcedure

Procedure CDEK_CreateBarcode(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Format = "A5";
    Copies = 1;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuids", UUID);
    Options.Insert("count", Copies);
    Options.Insert("format", Format);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreateBarcode", Options);

    // END

    Process(Result, "CDEK", "CreateBarcode", , FunctionParameters);

EndProcedure

Procedure CDEK_GetBarcode(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_BarcodeUUID"];

    Result = OPI_CDEK.GetBarcode(Token, UUID, , True); // Server response with a URL

    // END

    Process(Result, "CDEK", "GetBarcode");

EndProcedure

Procedure CDEK_GetAvailableDeliveryIntervals(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetAvailableDeliveryIntervals", Options);

    // END

    Process(Result, "CDEK", "GetAvailableDeliveryIntervals");

EndProcedure

Procedure CDEK_GetAppointmentDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetAppointmentDescription", Options);

    // END

    Process(Result, "CDEK", "GetAppointmentDescription");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetAppointmentDescription", Options);

    Process(Result, "CDEK", "GetAppointmentDescription", "Clear");

EndProcedure

Procedure CDEK_RegisterDeliveryAppointment(FunctionParameters)

    Token     = FunctionParameters["CDEK_Token"];
    OrderUUID = FunctionParameters["CDEK_OrderUUID"];

    Day          = 60 * 60 * 24;
    CurrentDate  = BegOfDay(OPI_Tools.GetCurrentDate());
    DeliveryDate = CurrentDate + Day * 14;

    While DayOfWeek(DeliveryDate) > 5 Do
        DeliveryDate = DeliveryDate + Day;
    EndDo;

    Appointment = New Structure;

    Appointment.Insert("cdek_number", "1106207236");
    Appointment.Insert("order_uuid" , OrderUUID);
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
    Options.Insert("token", Token);
    Options.Insert("appt", Appointment);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "RegisterDeliveryAppointment", Options);

    // END

    Process(Result, "CDEK", "RegisterDeliveryAppointment", , FunctionParameters);

EndProcedure

Procedure CDEK_GetDeliveryAppointment(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_ApptUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetDeliveryAppointment", Options);

    // END

    Process(Result, "CDEK", "GetDeliveryAppointment");

EndProcedure

Procedure CDEK_CreatePrealert(FunctionParameters)

    Token        = FunctionParameters["CDEK_Token"];
    UUID         = FunctionParameters["CDEK_OrderUUID"];
    Point        = "NSK27";
    TransferDate = OPI_Tools.GetCurrentDate() + 60 * 60 * 24;

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuids", UUID);
    Options.Insert("date", TransferDate);
    Options.Insert("point", Point);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "CreatePrealert", Options);

    // END

    Process(Result, "CDEK", "CreatePrealert", , FunctionParameters);

EndProcedure

Procedure CDEK_GetPrealert(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_PrealertUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetPrealert", Options);

    // END

    Process(Result, "CDEK", "GetPrealert");

EndProcedure

Procedure CDEK_GetPassportDataStatus(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetPassportDataStatus", Options);

    // END

    Process(Result, "CDEK", "GetPassportDataStatus");

EndProcedure

Procedure CDEK_GetCashboxCheck(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("uuid", UUID);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCashboxCheck", Options);

    // END

    Process(Result, "CDEK", "GetCashboxCheck");

EndProcedure

Procedure CDEK_GetCashboxChecksByDate(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("date", ReceivingDate);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetCashboxChecksByDate", Options);

    // END

    Process(Result, "CDEK", "GetCashboxChecksByDate");

EndProcedure

Procedure CDEK_GetDeliveryCashRegistry(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("date", ReceivingDate);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetDeliveryCashRegistry", Options);

    // END

    Process(Result, "CDEK", "GetDeliveryCashRegistry");

EndProcedure

Procedure CDEK_GetDeliveryCashTransfers(FunctionParameters)

    Token         = FunctionParameters["CDEK_Token"];
    ReceivingDate = OPI_Tools.GetCurrentDate();

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("date", ReceivingDate);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetDeliveryCashTransfers", Options);

    // END

    Process(Result, "CDEK", "GetDeliveryCashTransfers");

EndProcedure

Procedure CDEK_GetOfficeFilterDescription(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOfficeFilterDescription", Options);

    // END

    Process(Result, "CDEK", "GetOfficeFilterDescription");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOfficeFilterDescription", Options);

    Process(Result, "CDEK", "GetOfficeFilterDescription", "Clear");

EndProcedure

Procedure CDEK_GetOfficeList(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    Filter = New Structure;
    Filter.Insert("weight_max" , 50);
    Filter.Insert("city_code"  , 270);
    Filter.Insert("allowed_cod", True);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("filter", Filter);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetOfficeList", Options);

    // END

    Process(Result, "CDEK", "GetOfficeList");

EndProcedure

Procedure CDEK_GetRegionsList(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("testapi", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("cdek", "GetRegionsList", Options);

    // END

    Process(Result, "CDEK", "GetRegionsList");

EndProcedure

#EndRegion

#Region YandexMetrika

Procedure YandexMetrika_GetTagsList(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetTagsList", Options);

    // END

    Process(Result, "YandexMetrika", "GetTagsList");

EndProcedure

Procedure YandexMetrika_CreateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    Name  = "New tag";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "CreateTag", Options);

    // END

    Process(Result, "YandexMetrika", "CreateTag", , FunctionParameters, Name);

EndProcedure

Procedure YandexMetrika_DeleteTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "DeleteTag", Options);

    // END

    Process(Result, "YandexMetrika", "DeleteTag");

EndProcedure

Procedure YandexMetrika_UpdateTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];
    Name  = "New tag title";

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);
    Options.Insert("title", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "UpdateTag", Options);

    // END

    Process(Result, "YandexMetrika", "UpdateTag", , Name);

EndProcedure

Procedure YandexMetrika_GetTag(FunctionParameters)

    Token = FunctionParameters["Metrika_Token"];
    TagID = FunctionParameters["Metrika_LabelID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("label", TagID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetTag", Options);

    // END

    Process(Result, "YandexMetrika", "GetTag");

EndProcedure

Procedure YandexMetrika_GetCounterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCounterStructure", Options);

    // END

    Process(Result, "YandexMetrika", "GetCounterStructure");

EndProcedure

Procedure YandexMetrika_CreateCounter(FunctionParameters)

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
    Options.Insert("token", Token);
    Options.Insert("fields", CounterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "CreateCounter", Options);

    // END

    Process(Result, "YandexMetrika", "CreateCounter", , FunctionParameters);

EndProcedure

Procedure YandexMetrika_DeleteCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "DeleteCounter", Options);

    // END

    Process(Result, "YandexMetrika", "DeleteCounter");

EndProcedure

Procedure YandexMetrika_UpdateCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    CounterStructure = New Structure;
    CounterStructure.Insert("autogoals_enabled", True);

    FlagsStructure = New Structure;
    FlagsStructure.Insert("collect_first_party_data"             , False);
    FlagsStructure.Insert("measurement_enabled"                  , False);
    FlagsStructure.Insert("use_in_benchmarks"                    , False);
    FlagsStructure.Insert("direct_allow_use_goals_without_access", False);

    CounterStructure.Insert("counter_flags", FlagsStructure);
    CounterStructure.Insert("favorite"     , 0);
    CounterStructure.Insert("filter_robots", 1);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);
    Options.Insert("fields", CounterStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "UpdateCounter", Options);

    // END

    Process(Result, "YandexMetrika", "UpdateCounter");

EndProcedure

Procedure YandexMetrika_GetCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCounter", Options);

    // END

    Process(Result, "YandexMetrika", "GetCounter");

EndProcedure

Procedure YandexMetrika_RestoreCounter(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "RestoreCounter", Options);

    // END

    Process(Result, "YandexMetrika", "RestoreCounter");

EndProcedure

Procedure YandexMetrika_GetCountersList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCountersList", Options);

    Process(Result, "YandexMetrika", "GetCountersList"); // SKIP

    // filter by IDs list

    Filter = New Structure;

    CountersArray = New Array;
    CountersArray.Add(CounterID);

    Filter.Insert("counter_ids", CountersArray);

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("filter", Filter);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetCountersList", Options);

    // END

    Process(Result, "YandexMetrika", "GetCountersList", "Filter");

EndProcedure

Procedure YandexMetrika_GetActionsList(FunctionParameters)

    Token     = FunctionParameters["Metrika_Token"];
    CounterID = FunctionParameters["Metrika_CounterID"];

    Options = New Structure;
    Options.Insert("token", Token);
    Options.Insert("counter", CounterID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("metrika", "GetActionsList", Options);

    // END

    Process(Result, "YandexMetrika", "GetActionsList");

EndProcedure

#EndRegion

#Region S3

Procedure S3_GetBasicDataStructure(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    // END

    Process(Result, "S3", "GetBasicDataStructure");

EndProcedure

Procedure S3_SendRequestWithoutBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"] + "/opi-newbucket2";
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);
    Method    = "GET";

    Options = New Structure;
    Options.Insert("method", Method);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "SendRequestWithoutBody", Options);

    // END

    Process(Result, "S3", "SendRequestWithoutBody");

EndProcedure

Procedure S3_SendRequestWithBody(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Method = "PUT";
    Body   = "C:\test_data\document.docx"; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("method", Method);
    Options.Insert("basic", BasicData);
    Options.Insert("body", Body);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "SendRequestWithBody", Options);

    // END

    Process(Result, "S3", "SendRequestWithBody");

EndProcedure

Procedure S3_CreateBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP


    Result = OPI_S3.DeleteBucket(Name, BasicData, Directory); // SKIP
    Process(Result, "S3", "CreateBucket", "Deletion"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "CreateBucket", Options);

    // END

    Process(Result, "S3", "CreateBucket");

EndProcedure

Procedure S3_DeleteBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucket", Options);

    // END

    Process(Result, "S3", "DeleteBucket");

EndProcedure

Procedure S3_ListBuckets(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);
    Options = New Structure;
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListBuckets", Options);

    // END

    Process(Result, "S3", "ListBuckets");

EndProcedure

Procedure S3_HeadBucket(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadBucket", Options);

    Process(Result, "S3", "HeadBucket"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);
    Options.Insert("account", "1234");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadBucket", Options);

    // END

    Process(Result, "S3", "HeadBucket", "Account");

EndProcedure

Procedure S3_GetBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketEncryption", Options);

    // END

    Process(Result, "S3", "GetBucketEncryption");

EndProcedure

Procedure S3_DeleteBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucketEncryption", Options);

    // END

    Process(Result, "S3", "DeleteBucketEncryption");

EndProcedure

Procedure S3_PutBucketEncryption(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    XmlConfig = "<ServerSideEncryptionConfiguration xmlns=""http://s3.amazonaws.com/doc/2006-03-01/"">
                      | <Rule>
                      | <ApplyServerSideEncryptionByDefault>
                      | <SSEAlgorithm>AES256</SSEAlgorithm>
                      | </ApplyServerSideEncryptionByDefault>
                      | </Rule>
                      |</ServerSideEncryptionConfiguration>";

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("conf", XmlConfig);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketEncryption", Options);

    // END

    Process(Result, "S3", "PutBucketEncryption");

EndProcedure

Procedure S3_GetBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketTagging", Options);

    // END

    Process(Result, "S3", "GetBucketTagging");

EndProcedure

Procedure S3_PutBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    TagStructure = New Structure;
    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("tagset", TagStructure);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketTagging", Options);

    // END

    Process(Result, "S3", "PutBucketTagging");

EndProcedure

Procedure S3_DeleteBucketTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteBucketTagging", Options);

    // END

    Process(Result, "S3", "DeleteBucketTagging");

EndProcedure

Procedure S3_GetBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBucketVersioning", Options);

    // END

    Process(Result, "S3", "GetBucketVersioning");

EndProcedure

Procedure S3_PutBucketVersioning(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);
    Status    = True;

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Name = "opi-dirbucket3";
    Name = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("basic", BasicData);
    Options.Insert("status", Status);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutBucketVersioning", Options);

    // END

    Process(Result, "S3", "PutBucketVersioning");

EndProcedure

Procedure S3_PutObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Name   = "picture.jpg";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data", Entity);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObject", Options);

    Process(Result, "S3", "PutObject"); // SKIP

    Name   = "fileChunked.mp3";
    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data

    BasicData.Insert("ChunkSize", 5242880); // Size parts for upload in multiple of requests

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data", Entity);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObject", Options);

    // END

    Process(Result, "S3", "PutObject", "ByParts");

    OPI_S3.DeleteObject(Name, Bucket, BasicData, , , Directory);

EndProcedure

Procedure S3_UploadFullObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name   = "pictureSmall.jpg";
    Entity = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("data", Entity);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "UploadFullObject", Options);

    // END

    Process(Result, "S3", "UploadFullObject");

    OPI_S3.DeleteObject(Name, Bucket, BasicData, , , Directory);

EndProcedure

Procedure S3_DeleteObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteObject", Options);

    // END

    Process(Result, "S3", "DeleteObject");

EndProcedure

Procedure S3_HeadObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadObject", Options);

    // END

    Process(Result, "S3", "HeadObject");

EndProcedure

Procedure S3_CopyObject(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    SourcePath        = "picture.jpg";
    DestinationBucket = "newbucket2";

    DestinationPath = "new_picture.jpg";
    SourceBucket    = "opi-dirbucket3";
    SourceBucket    = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("sname", SourcePath);
    Options.Insert("sbucket", DestinationBucket);
    Options.Insert("name", DestinationPath);
    Options.Insert("bucket", SourceBucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "CopyObject", Options);

    // END

    Process(Result, "S3", "CopyObject");

    OPI_S3.DeleteObject(DestinationPath, SourceBucket, BasicData, , , Directory);

EndProcedure

Procedure S3_PutObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    TagStructure = New Structure;

    TagStructure.Insert("MyTag1", "SomeValue");
    TagStructure.Insert("MyTag2", "AnotherOne");

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("tagset", TagStructure);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "PutObjectTagging", Options);

    // END

    Process(Result, "S3", "PutObjectTagging");

EndProcedure

Procedure S3_GetObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectTagging", Options);

    // END

    Process(Result, "S3", "GetObjectTagging");

EndProcedure

Procedure S3_DeleteObjectTagging(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "DeleteObjectTagging", Options);

    // END

    Process(Result, "S3", "DeleteObjectTagging");

EndProcedure

Procedure S3_ListObjects(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListObjects", Options);

    // END

    Process(Result, "S3", "ListObjects");

EndProcedure

Procedure S3_ListObjectVersions(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Prefix = "pic";
    Options = New Structure;
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("prefix", Prefix);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "ListObjectVersions", Options);

    // END

    Process(Result, "S3", "ListObjectVersions");

EndProcedure

Procedure S3_GetObject(FunctionParameters)

    Image        = FunctionParameters["Picture"]; // SKIP
    OPI_TypeConversion.GetBinaryData(Image); // SKIP
    RequiredSize = Image.Size(); // SKIP

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    Process(Result, "S3", "GetObject", , RequiredSize); // SKIP

    TempFile = GetTempFileName();
    BasicData.Insert("ChunkSize", 200000);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("out", TempFile);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    // END

    Process(Result, "S3", "GetObject", "File", RequiredSize);

    Name   = "bigfile.exe";
    Bucket = "newbucket2";

    BigTempFile = GetTempFileName();
    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("out", BigTempFile);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    Process(Result, "S3", "GetObject", "Big file", 34432400);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObject", Options);

    Process(Result, "S3", "GetObject", "Big BD", 34432400);

    DeleteFiles(BigTempFile);
    DeleteFiles(TempFile);

EndProcedure

Procedure S3_InitPartsUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    Process(Result, "S3", "InitPartsUpload"); // SKIP

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

        If CurrentData.Size() = 0 Then
            Break;
        EndIf;

        Result = OPI_S3.UploadObjectPart(Name
            , Bucket
            , BasicData
            , UploadID
            , PartNumber
            , CurrentData
            , Directory);

        Process(Result, "S3", "InitPartsUpload", "Part"); // SKIP

        BytesRead = SourceStream.CurrentPosition();

        ETag = Result["headers"]["Etag"];
        ETag = ?(ETag = Undefined, Result["headers"]["ETag"], ETag);

        TagsArray.Add(ETag);

        PartNumber = PartNumber + 1;

    EndDo;

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("tags", TagsArray);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "FinishPartsUpload", Options);

    // END

    Process(Result, "S3", "InitPartsUpload", "Completion");

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_FinishPartsUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);

    Process(Result, "S3", "FinishPartsUpload", "Start"); // SKIP

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

        If CurrentData.Size() = 0 Then
            Break;
        EndIf;

        Result = OPI_S3.UploadObjectPart(Name
            , Bucket
            , BasicData
            , UploadID
            , PartNumber
            , CurrentData
            , Directory);

        Process(Result, "S3", "FinishPartsUpload", "Part"); // SKIP

        BytesRead = SourceStream.CurrentPosition();

        ETag = Result["headers"]["Etag"];
        ETag = ?(ETag = Undefined, Result["headers"]["ETag"], ETag);

        TagsArray.Add(ETag);

        PartNumber = PartNumber + 1;

    EndDo;

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("tags", TagsArray);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "FinishPartsUpload", Options);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // END

    Process(Result, "S3", "FinishPartsUpload");

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_UploadObjectPart(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Entity = FunctionParameters["Audio"]; // URL, Path or Binary Data
    Entity = OPI_HTTPRequests.Get(Entity);

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);

    Process(Result, "S3", "UploadObjectPart", "Start"); // SKIP

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

        If CurrentData.Size() = 0 Then
            Break;
        EndIf;

        Result = OPI_S3.UploadObjectPart(Name
            , Bucket
            , BasicData
            , UploadID
            , PartNumber
            , CurrentData
            , Directory);

        // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

        Process(Result, "S3", "UploadObjectPart"); // SKIP

        BytesRead = SourceStream.CurrentPosition();

        ETag = Result["headers"]["Etag"];
        ETag = ?(ETag = Undefined, Result["headers"]["ETag"], ETag);

        TagsArray.Add(ETag);

        PartNumber = PartNumber + 1;

    EndDo;

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("tags", TagsArray);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "FinishPartsUpload", Options);

    // END

    Process(Result, "S3", "UploadObjectPart", "Completion"); // SKIP

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

Procedure S3_AbortMultipartUpload(FunctionParameters)

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "fileChunked.mp3";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("dir", Directory);

    Start = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "InitPartsUpload", Options);
    UploadID = Start["response"]["InitiateMultipartUploadResult"]["UploadId"];

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("upload", UploadID);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "AbortMultipartUpload", Options);

    // END

    Process(Result, "S3", "AbortMultipartUpload");

EndProcedure

Procedure S3_GetObjectDownloadLink(FunctionParameters)

    Image        = FunctionParameters["Picture"]; // SKIP
    OPI_TypeConversion.GetBinaryData(Image); // SKIP
    RequiredSize = Image.Size(); // SKIP

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "picture.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "opi-dirbucket3";
    Bucket = ?(Directory, "opi-dirbucket3", "opi-gpbucket3"); // SKIP

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("expires", 7200);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectDownloadLink", Options);

    // END

    Process(Result, "S3", "GetObjectDownloadLink");

    Result = OPI_HTTPRequests.Get(Result);

    Process(Result, "S3", "GetObjectDownloadLink", "Check", RequiredSize);

EndProcedure

Procedure S3_GetObjectUploadLink(FunctionParameters)

    Image        = FunctionParameters["Picture"]; // SKIP
    OPI_TypeConversion.GetBinaryData(Image); // SKIP
    RequiredSize = Image.Size(); // SKIP

    URL       = FunctionParameters["S3_URL"];
    AccessKey = FunctionParameters["S3_AccessKey"];
    SecretKey = FunctionParameters["S3_SecretKey"];
    Region    = "BTC";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("access", AccessKey);
    Options.Insert("secret", SecretKey);
    Options.Insert("region", Region);

    BasicData = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetBasicDataStructure", Options);

    Name = "pictureU.jpg";

    Directory = True; // Formation URL in path-style
    Directory = FunctionParameters["Directory"]; // SKIP

    Bucket = "newbucket2";

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);
    Options.Insert("expires", 7200);
    Options.Insert("dir", Directory);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "GetObjectUploadLink", Options);

    // END

    Process(Result, "S3", "GetObjectUploadLink");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(Result)
        .SetBinaryBody(Image)
        .ProcessRequest("PUT");

    Process(Result, "S3", "GetObjectUploadLink", "Upload");

    Options = New Structure;
    Options.Insert("name", Name);
    Options.Insert("bucket", Bucket);
    Options.Insert("basic", BasicData);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("s3", "HeadObject", Options);

    Process(Check, "S3", "GetObjectUploadLink", "Check", RequiredSize);

    OPI_S3.DeleteObject(Name, Bucket, BasicData);

EndProcedure

#EndRegion

#Region TCP

Procedure TCP_CreateConnection(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);

    Process(Connection, "TCP", "CreateConnection"); // SKIP

    OPI_TCP.CloseConnection(Connection);

    Address    = "tcpbin.com:4243";
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetTLSSettings", Options);
    Connection = OPI_TCP.CreateConnection(Address, TLS);

    // END

    Process(Connection, "TCP", "CreateConnection", "TLS");

EndProcedure

Procedure TCP_CloseConnection(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);

    Result = OPI_TCP.CloseConnection(Connection);

    // END

    Process(Result, "TCP", "CloseConnection");

EndProcedure

Procedure TCP_ReadBinaryData(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Message    = "Hello server!" + Chars.LF;
    Data       = GetBinaryDataFromString(Message);

    OPI_TCP.SendBinaryData(Connection, Data);

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Result = OPI_TCP.ReadBinaryData(Connection, , Marker);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OPI_TCP.CloseConnection(Connection);

    // END

    Process(Result, "TCP", "ReadBinaryData", , Message);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendBinaryData(Connection, Data);
    Result = OPI_TCP.ReadBinaryData(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    Process(Result, "TCP", "ReadBinaryData", "Timeout", Message);

EndProcedure

Procedure TCP_SendBinaryData(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Message    = "Hello server!" + Chars.LF;
    Data       = GetBinaryDataFromString(Message);

    Result = OPI_TCP.SendBinaryData(Connection, Data);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Response = OPI_TCP.ReadBinaryData(Connection, , Marker);

    OPI_TCP.CloseConnection(Connection);

    // END

    Process(Response, "TCP", "SendBinaryData", , Message);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendBinaryData(Connection, Data);
    Result = OPI_TCP.ReadBinaryData(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    Process(Result, "TCP", "SendBinaryData", "Timeout", Message);

EndProcedure

Procedure TCP_ProcessRequest(FunctionParameters)

    Address = FunctionParameters["TCP_Address"];
    Data    = "Echo this!" + Chars.LF;

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("data", Data);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ProcessRequest", Options);

    Process(Result, "TCP", "ProcessRequest", , "Echo this!" + Chars.LF); // SKIP

    Address = FunctionParameters["TCP_AddressTLS"];
    Options = New Structure;
    Options.Insert("trust", Истина);

    Tls = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetTLSSettings", Options);

    Options = New Structure;
    Options.Insert("address", Address);
    Options.Insert("data", Data);
    Options.Insert("tls", Tls);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "ProcessRequest", Options);

    // END

    Process(Result, "TCP", "ProcessRequest", "TLS", "Echo this!" + Chars.LF);

EndProcedure

Procedure TCP_ReadLine(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Data       = "Hello server!" + Chars.LF;

    OPI_TCP.SendLine(Connection, Data);

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Result = OPI_TCP.ReadLine(Connection, , Marker);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    OPI_TCP.CloseConnection(Connection);

    // END

    Process(Result, "TCP", "ReadLine", , Data);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendLine(Connection, Data);
    Result = OPI_TCP.ReadLine(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    Process(Result, "TCP", "ReadLine", "Timeout", Data);

EndProcedure

Procedure TCP_SendLine(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Data       = "Hello server!" + Chars.LF;

    Result = OPI_TCP.SendLine(Connection, Data);
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    // End of message marker to avoid waiting for the end of timeout
    Marker = Chars.LF;
    Response = OPI_TCP.ReadLine(Connection, , Marker);

    OPI_TCP.CloseConnection(Connection);

    // END

    Process(Response, "TCP", "SendLine", , Data);

    Connection = OPI_TCP.CreateConnection(Address);

    OPI_TCP.SendLine(Connection, Data);
    Result = OPI_TCP.ReadLine(Connection, , , 50000);

    OPI_TCP.CloseConnection(Connection);

    Process(Result, "TCP", "SendLine", "Timeout", Data);

EndProcedure

Procedure TCP_GetTLSSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("tcp", "GetTLSSettings", Options);

    // END

    Process(Result, "TCP", "GetTLSSettings");

EndProcedure

Procedure TCP_GetLastError(FunctionParameters)

    Address    = FunctionParameters["TCP_Address"];
    Connection = OPI_TCP.CreateConnection(Address);
    Data       = "Hello server!" + Chars.LF;

    Sending = OPI_TCP.SendLine(Connection, Data);
    Result  = OPI_TCP.GetLastError(Connection); // SKIP

    // END

    Process(Result, "TCP", "GetLastError");

EndProcedure

#EndRegion

#Region SQLite

Procedure SQLite_CreateConnection(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    LocalBase    = OPI_SQLite.CreateConnection(TFN);
    InMemoryBase = OPI_SQLite.CreateConnection();

    // END

    Process(LocalBase   , "SQLite", "CreateConnection");
    Process(InMemoryBase, "SQLite", "CreateConnection", "IM");

    Closing = OPI_SQLite.CloseConnection(LocalBase);

    Process(Closing, "SQLite", "CreateConnection", "Closing");

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

Procedure SQLite_CloseConnection(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    Connection = OPI_SQLite.CreateConnection(TFN);

    Process(Connection, "SQLite", "CloseConnection", "Openning"); // SKIP

    Closing = OPI_SQLite.CloseConnection(Connection);

    // END

    Process(Closing, "SQLite", "CloseConnection");

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

Procedure SQLite_ExecuteSQLQuery(FunctionParameters)

    TFN = GetTempFileName("sqlite");

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Connection = OPI_SQLite.CreateConnection(TFN);

    Process(Connection, "SQLite", "ExecuteSQLQuery", "Openning"); // SKIP

    // CREATE

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
    Options.Insert("sql", QueryText);
    Options.Insert("db", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    Process(Result, "SQLite", "ExecuteSQLQuery", "Create"); // SKIP

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
    ParameterArray.Add(New Structure("blob", Image)); // BLOB

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("params", ParameterArray);
    Options.Insert("db", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    Process(Result, "SQLite", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("db", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    Process(Result, "SQLite", "ExecuteSQLQuery", , Image); // SKIP

    // Transaction

    QueryText = "BEGIN TRANSACTION;
                   | CREATE TABLE IF NOT EXISTS users (
                   | id INTEGER PRIMARY KEY AUTOINCREMENT,
                   | name TEXT NOT NULL,
                   | age INTEGER NOT NULL
                   | );
                   | INSERT INTO users (name, age) VALUES ('Alice', 30);
                   | INSERT INTO users (name, age) VALUES ('Bob', 25);
                   | INSERT INTO users (name, age) VALUES ('Charlie', 35);
                   | COMMIT;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("db", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    Process(Result, "SQLite", "ExecuteSQLQuery", "Transaction"); // SKIP

    // With extension

    If OPI_Tools.IsWindows() Then
        Extension = FunctionParameters["SQLite_Ext"]; // URL, Path or Binary Data
    Else
        Extension = FunctionParameters["SQLite_ExtLinux"]; // URL, Path or Binary Data
    EndIf;

    EntryPoint = "sqlite3_uuid_init";

    ExtensionMap = New Map;
    ExtensionMap.Insert(Extension, EntryPoint);

    QueryText = "SELECT uuid4();";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("db", Connection);
    Options.Insert("exts", ExtensionMap);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ExecuteSQLQuery", Options);

    Process(Result, "SQLite", "ExecuteSQLQuery", "Extension"); // SKIP

    Closing = OPI_SQLite.CloseConnection(Connection);

    // END

    Process(Result, "SQLite", "ExecuteSQLQuery", "Closing");

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Database file deletion error", "SQLite");
    EndTry;

EndProcedure

Procedure SQLite_IsConnector(FunctionParameters)

    Connection = OPI_SQLite.CreateConnection();
    Result     = OPI_SQLite.IsConnector(Connection);

    // END

    Process(Result, "SQLite", "IsConnector");

EndProcedure

Procedure SQLite_CreateTable(FunctionParameters)

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
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "CreateTable", Options);

    // END

    Process(Result, "SQLite", "CreateTable");

    ColoumnsMap = New Map;
    ColoumnsMap.Insert("id"                 , "INTEGER PRIMARY KEY");
    ColoumnsMap.Insert("[An obscure column]", "TEXT");

    Options = New Structure;
    Options.Insert("table", "test1");
    Options.Insert("cols", ColoumnsMap);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "CreateTable", Options);

    Process(Result, "SQLite", "CreateTable", "An obscure column");

EndProcedure

Procedure SQLite_AddRecords(FunctionParameters)

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
    RowStructure2.Insert("data"      , New Structure("blob", Image)); // BLOB

    RowStrucutre1 = New Structure;
    RowStrucutre1.Insert("name"      , "Lesha"); // TEXT
    RowStrucutre1.Insert("age"       , 20); // INTEGER
    RowStrucutre1.Insert("salary"    , 200.20); // REAL
    RowStrucutre1.Insert("is_active" , False); // BOOL
    RowStrucutre1.Insert("created_at", OPI_Tools.GetCurrentDate()); // DATETIME
    RowStrucutre1.Insert("data"      , New Structure("blob", PictureFile)); // BLOB

    DataArray.Add(RowStructure2);
    DataArray.Add(RowStrucutre1);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options);

    // END

    Process(Result, "SQLite", "AddRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("trn", Ложь);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options);

    Process(Result, "SQLite", "AddRecords", "No transaction");

    RowStrucutre1.Insert("error", "Lesha");
    DataArray.Add(RowStrucutre1);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options);
    Process(Result, "SQLite", "AddRecords", "Field error");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", DataArray);
    Options.Insert("trn", Ложь);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options);
    Process(Result, "SQLite", "AddRecords", "Error without transaction");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", "not valid json");
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options);
    Process(Result, "SQLite", "AddRecords", "JSON Error");

    RowMap = New Map;
    RowMap.Insert("[An obscure column]", "yo");

    Options = New Structure;
    Options.Insert("table", "test1");
    Options.Insert("rows", RowMap);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddRecords", Options);
    Process(Result, "SQLite", "AddRecords", "An obscure column");

    Try
        DeleteFiles(PictureFile);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Error deleting a picture file", "SQLite");
    EndTry;

EndProcedure

Procedure SQLite_GetRecords(FunctionParameters)

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
    Options.Insert("table", Table);
    Options.Insert("fields", Fields);
    Options.Insert("filter", Filters);
    Options.Insert("order", Sort);
    Options.Insert("limit", Count);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    // END

    Process(Result, "SQLite", "GetRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['name','age','salary','is_active','created_at']");
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    Process(Result, "SQLite", "GetRecords", "No parameters");

    FilterStructure2.Insert("type", "BEETWEEN");
    Filters.Add(FilterStructure2);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['name','age','salary','is_active','created_at']");
    Options.Insert("filter", Filters);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    Process(Result, "SQLite", "GetRecords", "Error");

    Options = New Structure;
    Options.Insert("table", "test1");
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    Process(Result, "SQLite", "GetRecords", "An obscure column");

EndProcedure

Procedure SQLite_UpdateRecords(FunctionParameters)

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
    Options.Insert("table", Table);
    Options.Insert("values", FieldsStructure);
    Options.Insert("filter", FilterStructure);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "UpdateRecords", Options);

    // END

    Process(Result, "SQLite", "UpdateRecords");

    FilterStructure.Insert("value", "Vitaly A.");

    Filters = New Array;
    Filters.Add(FilterStructure);

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['name','salary']");
    Options.Insert("filter", Filters);
    Options.Insert("db", Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    Process(Check, "SQLite", "UpdateRecords", "Check", FieldsStructure);

EndProcedure

Procedure SQLite_DeleteRecords(FunctionParameters)

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
    Options.Insert("table", Table);
    Options.Insert("filter", FilterStructure);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "DeleteRecords", Options);

    // END

    Process(Result, "SQLite", "DeleteRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['name','salary']");
    Options.Insert("filter", Filters);
    Options.Insert("db", Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    Process(Check, "SQLite", "DeleteRecords", "Check");

EndProcedure

Procedure SQLite_GetTableInformation(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    // END

    Process(Result, "SQLite", "GetTableInformation");

EndProcedure

Procedure SQLite_GetRecordsFilterStrucutre(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecordsFilterStrucutre", Options);

    // END

    Process(Result, "SQLite", "GetRecordsFilterStrucutre");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecordsFilterStrucutre", Options);

    Process(Result, "SQLite", "GetRecordsFilterStrucutre", "Clear");

EndProcedure

Procedure SQLite_DeleteTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "DeleteTable", Options);

    // END

    Process(Result, "SQLite", "DeleteTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    Process(Check, "SQLite", "DeleteTable", "Check");

    OPI_SQLite.DeleteTable("test1", Base);

EndProcedure

Procedure SQLite_ClearTable(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "ClearTable", Options);

    // END

    Process(Result, "SQLite", "ClearTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    Process(Check, "SQLite", "ClearTable", "Table");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetRecords", Options);

    Process(Check, "SQLite", "ClearTable", "Check");

EndProcedure

Procedure SQLite_ConnectExtension(FunctionParameters)

    If OPI_Tools.IsWindows() Then
        Extension = FunctionParameters["SQLite_Ext"]; // URL, Path or Binary Data
    Else
        Extension = FunctionParameters["SQLite_ExtLinux"]; // URL, Path or Binary Data
    EndIf;

    Base       = FunctionParameters["SQLite_DB"];
    EntryPoint = "sqlite3_uuid_init";

    Connection = OPI_SQLite.CreateConnection(Base);
    Result     = OPI_SQLite.ConnectExtension(Extension, EntryPoint, Connection);

    // END

    Process(Result, "SQLite", "ConnectExtension");

    TFN = GetTempFileName("dll");
    CopyFile(Extension, TFN);

    Result = OPI_SQLite.ConnectExtension(TFN, EntryPoint, Connection);

    Process(Result, "SQLite", "ConnectExtension", "Path");

    Result = OPI_SQLite.ConnectExtension(New BinaryData(TFN), EntryPoint, Connection);

    Process(Result, "SQLite", "ConnectExtension", "Binary");

    Result = OPI_SQLite.CloseConnection(Connection);

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Error deleting extension file", "SQLite");
    EndTry;

EndProcedure

Procedure SQLite_AddTableColumn(FunctionParameters)

    Base     = FunctionParameters["SQLite_DB"];
    Table    = "test";
    Name     = "new_col";
    DataType = "TEXT";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("type", DataType);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "AddTableColumn", Options);

    // END

    Process(Result, "SQLite", "AddTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    Process(Result, "SQLite", "AddTableColumn", "Check");

EndProcedure

Procedure SQLite_DeleteTableColumn(FunctionParameters)

    Base  = FunctionParameters["SQLite_DB"];
    Table = "test";
    Name  = "new_col";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "DeleteTableColumn", Options);

    // END

    Process(Result, "SQLite", "DeleteTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    Process(Result, "SQLite", "DeleteTableColumn", "Check");

EndProcedure

Procedure SQLite_EnsureTable(FunctionParameters)

    Base = FunctionParameters["SQLite_DB"];

    Table = "test";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("id"   , "INTEGER");
    ColoumnsStruct.Insert("code" , "INTEGER");
    ColoumnsStruct.Insert("name" , "TEXT");
    ColoumnsStruct.Insert("age"  , "INTEGER");
    ColoumnsStruct.Insert("info" , "TEXT");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "EnsureTable", Options);

    // END

    Process(Result, "SQLite", "EnsureTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    Process(Check, "SQLite", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("db", Base);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "EnsureTable", Options);

    Process(Result, "SQLite", "EnsureTable", "New");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("db", Base);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("sqlite", "GetTableInformation", Options);

    Process(Check, "SQLite", "EnsureTable", "Check 2", ColoumnsStruct);

EndProcedure

#EndRegion

#Region PostgreSQL

Procedure PostgreSQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    Process(Result, "PostgreSQL", "GenerateConnectionString");

EndProcedure

Procedure PostgreSQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Result = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    OPI_PostgreSQL.CloseConnection(Result);

    Process(Result, "PostgreSQL", "CreateConnection");

EndProcedure

Procedure PostgreSQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_PostgreSQL.CloseConnection(Connection);

    // END

    Process(Result, "PostgreSQL", "CloseConnection");

EndProcedure

Procedure PostgreSQL_IsConnector(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_PostgreSQL.IsConnector(Connection);

    OPI_PostgreSQL.CloseConnection(Result);

    // END

    Process(Result, "PostgreSQL", "IsConnector");

EndProcedure

Procedure PostgreSQL_ExecuteSQLQuery(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_PostgreSQL.DeleteTable("users"     , Connection); // SKIP
    OPI_PostgreSQL.DeleteTable("test_data" , Connection); // SKIP
    OPI_PostgreSQL.DeleteTable("test_table", Connection); // SKIP

    Process(Connection, "PostgreSQL", "ExecuteSQLQuery", "Connection"); // SKIP

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
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options);

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Create"); // SKIP

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
    ParameterArray.Add(New Structure("BYTEA", Image));

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("params", ParameterArray);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options);

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT id, name, age, salary, is_active, created_at, data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options);

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", , Image); // SKIP

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
                   |END $$ LANGUAGE plpgsql;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options);

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Transaction"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL"]; // Binary Data, URL or path to file

    Options = New Structure;
    Options.Insert("sql", SQLFile);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ExecuteSQLQuery", Options);

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_PostgreSQL.CloseConnection(Connection);

    // END

    Process(Result, "PostgreSQL", "ExecuteSQLQuery", "Closing");

EndProcedure

Procedure PostgreSQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    Deletion = OPI_PostgreSQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP
    OPI_TestDataRetrieval.LogServiceInformation(Deletion, "CreateDatabase (deleting)", "PostgreSQL"); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateDatabase", Options);

    // END

    Process(Result, "PostgreSQL", "CreateDatabase");

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "PostgreSQL", "CreateDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateDatabase", Options);

    Process(Result, "PostgreSQL", "CreateDatabase", "Existing");

    Base = "testbase2";

    OPI_PostgreSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateDatabase", Options);

    Process(Result, "PostgreSQL", "CreateDatabase", "New");

    OPI_PostgreSQL.CloseConnection(Connection);

EndProcedure

Procedure PostgreSQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

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

    OPI_PostgreSQL.DeleteTable(Table, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateTable", Options);

    // END

    Process(Result, "PostgreSQL", "CreateTable");

    Table = "ABC DEF";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateTable", Options);

    Process(Result, "PostgreSQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "CreateTable", Options);

    Process(Result, "PostgreSQL", "CreateTable", "Type error");

EndProcedure

Procedure PostgreSQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    // END

    Process(Result, "PostgreSQL", "GetTableInformation");

    Table = "heyho";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    Process(Result, "PostgreSQL", "GetTableInformation", "Error");

EndProcedure

Procedure PostgreSQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

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
    RecordStructure.Insert("bytea_field"      , New Structure("BYTEA"                   , Image));
    RecordStructure.Insert("ts_field"         , New Structure("TIMESTAMP"               , CurrentDate));
    RecordStructure.Insert("tswtz_field"      , New Structure("TIMESTAMP_WITH_TIME_ZONE", CurrentDateTZ)); // or TIMESTAMP WITH TIME ZONE
    RecordStructure.Insert("ip_field"         , New Structure("INET"                    , "127.0.0.1"));
    RecordStructure.Insert("json_field"       , New Structure("JSON"                    , CasualStructure));
    RecordStructure.Insert("jsonb_field"      , New Structure("JSONB"                   , CasualStructure));
    RecordStructure.Insert("date_field"       , New Structure("DATE"                    , CurrentDate));
    RecordStructure.Insert("time_field"       , New Structure("TIME"                    , CurrentDate));
    RecordStructure.Insert("uuid_field"       , New Structure("UUID"                    , New UUID));

    RecordsArray.Add(RecordStructure);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", RecordsArray);
    Options.Insert("trn", Истина);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "AddRecords", Options);

    // END

    Process(Result, "PostgreSQL", "AddRecords");

EndProcedure

Procedure PostgreSQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    Process(Result, "PostgreSQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", "test_data");
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

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
    Options.Insert("table", Table);
    Options.Insert("fields", Fields);
    Options.Insert("filter", Filters);
    Options.Insert("order", Sort);
    Options.Insert("limit", Count);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    // END

    Process(Result, "PostgreSQL", "GetRecords", "Filters");

EndProcedure

Procedure PostgreSQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

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

    Count = OPI_PostgreSQl.GetRecords(Table, , Filters, , , ConnectionString); // SKIP
    Process(Count, "PostgreSQL", "UpdateRecords", "Count"); // SKIP
    Count = Count["data"].Count(); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Result = OPI_PostgreSQl.UpdateRecords(Table
        , FieldsStructure
        , FilterStructure
        , ConnectionString
        , TLSSettings);

    // END

    Process(Result, "PostgreSQL", "UpdateRecords");

    Check = OPI_PostgreSQl.GetRecords(Table, "['ip_address']", Filters, , , ConnectionString);

    Process(Check, "PostgreSQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure PostgreSQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

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

    Obtaining = OPI_PostgreSQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteRecords", Options);

    // END

    Process(Obtaining, "PostgreSQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    Process(Result, "PostgreSQL", "DeleteRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    Process(Result, "PostgreSQL", "DeleteRecords", "Check", Residue);


EndProcedure

Procedure PostgreSQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTable", Options);

    // END

    Process(Result, "PostgreSQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTable", Options);

    Process(Result, "PostgreSQL", "DeleteTable", "Test");

EndProcedure

Procedure PostgreSQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "postgres";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteDatabase", Options);

    // END

    Process(Result, "PostgreSQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_PostgreSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "PostgreSQL", "DeleteDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DisableAllDatabaseConnections", Options);

    Process(Result, "PostgreSQL", "DeleteDatabase", "Shutdown");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteDatabase", Options);

    Process(Result, "PostgreSQL", "DeleteDatabase", "Deletion");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteDatabase", Options);

    Process(Result, "PostgreSQL", "DeleteDatabase", "Error");

    Closing = OPI_PostgreSQL.CloseConnection(Connection);

    Process(Closing, "PostgreSQL", "DeleteDatabase", "Closing");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteDatabase", Options);

    Process(Result, "PostgreSQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure PostgreSQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "ClearTable", Options);

    // END

    Process(Result, "PostgreSQL", "ClearTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecords", Options);

    Process(Result, "PostgreSQL", "ClearTable", "Check");

EndProcedure

Procedure PostgreSQL_DisableAllDatabaseConnections(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DisableAllDatabaseConnections", Options);

    // END

    Process(Result, "PostgreSQL", "DisableAllDatabaseConnections");

EndProcedure

Procedure PostgreSQL_GetRecordsFilterStrucutre(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecordsFilterStrucutre", Options);

    // END

    Process(Result, "PostgreSQL", "GetRecordsFilterStrucutre");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetRecordsFilterStrucutre", Options);

    Process(Result, "PostgreSQL", "GetRecordsFilterStrucutre", "Clear");

EndProcedure

Procedure PostgreSQL_GetTLSSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);

    // END

    Process(Result, "PostgreSQL", "GetTLSSettings");

EndProcedure

Procedure PostgreSQL_AddTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table    = "testtable";
    Name     = "new_field";
    DataType = "TEXT";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("type", DataType);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "AddTableColumn", Options);

    // END

    Process(Result, "PostgreSQL", "AddTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    Process(Result, "PostgreSQL", "AddTableColumn", "Check");

EndProcedure

Procedure PostgreSQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";
    Name  = "new_field";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "DeleteTableColumn", Options);

    // END

    Process(Result, "PostgreSQL", "DeleteTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    Process(Result, "PostgreSQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure PostgreSQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 5432;
    Port = ?(TLS, 5433, 5432); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "SMALLINT");
    ColoumnsStruct.Insert("uuid_field"     , "uuid");
    ColoumnsStruct.Insert("bigint_field"   , "BIGINT");
    ColoumnsStruct.Insert("custom_field"   , "TEXT");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "EnsureTable", Options);

    // END

    Process(Result, "PostgreSQL", "EnsureTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    Process(Check, "PostgreSQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "EnsureTable", Options);

    Process(Result, "PostgreSQL", "EnsureTable", "New");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("postgres", "GetTableInformation", Options);

    Process(Check, "PostgreSQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

#EndRegion

#Region MySQL

Procedure MySQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    Process(Result, "MySQL", "GenerateConnectionString");

EndProcedure

Procedure MySQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Result = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    OPI_MySQL.CloseConnection(Result);
    Process(Result, "MySQL", "CreateConnection");

EndProcedure

Procedure MySQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MySQL.CloseConnection(Connection);

    // END

    Process(Result, "MySQL", "CloseConnection");

EndProcedure

Procedure MySQL_IsConnector(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MySQL.IsConnector(Connection);

    OPI_MySQL.CloseConnection(Result);

    // END

    Process(Result, "MySQL", "IsConnector");

EndProcedure

Procedure MySQL_ExecuteSQLQuery(FunctionParameters)

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_MySQL.DeleteTable("users"     , Connection); // SKIP
    OPI_MySQL.DeleteTable("test_data" , Connection); // SKIP
    OPI_MySQL.DeleteTable("test_table", Connection); // SKIP

    Process(Connection, "MySQL", "ExecuteSQLQuery", "Connection"); // SKIP

    // CREATE

    QueryText = "
                   |CREATE TABLE test_table (
                   |id INT AUTO_INCREMENT PRIMARY KEY,
                   |name VARCHAR(255),
                   |age INT,
                   |salary DOUBLE,
                   |amount FLOAT,
                   |type TINYINT UNSIGNED,
                   |date DATE,
                   |time TIME,
                   |data MEDIUMBLOB
                   |);";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    Process(Result, "MySQL", "ExecuteSQLQuery", "Create"); // SKIP

    // INSERT with parameters

    QueryText = "
                   |INSERT INTO test_table (name, age, salary, amount, type, date, time, data)
                   |VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

    ParameterArray = New Array;
    ParameterArray.Add(New Structure("TEXT"  , "Vitaly"));
    ParameterArray.Add(New Structure("INT"   , 25));
    ParameterArray.Add(New Structure("DOUBLE", 1000.12));
    ParameterArray.Add(New Structure("FLOAT" , 1000.12));
    ParameterArray.Add(New Structure("UINT"  , 1));
    ParameterArray.Add(New Structure("DATE"  , OPI_Tools.GetCurrentDate()));
    ParameterArray.Add(New Structure("TIME"  , OPI_Tools.GetCurrentDate()));
    ParameterArray.Add(New Structure("BYTES" , Image));

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("params", ParameterArray);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    Process(Result, "MySQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT name, age, salary, amount, type, date, time, data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    Process(Result, "MySQL", "ExecuteSQLQuery", , Image); // SKIP

    Result = OPI_MySQL.ExecuteSQLQuery("create table test_data (id INT,first_name VARCHAR(50),last_name VARCHAR(50),email VARCHAR(50),gender VARCHAR(50),ip_address VARCHAR(20));", , , Connection); // SKIP
    Process(Result, "MySQL", "ExecuteSQLQuery", "Test data"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL2"]; // Binary Data, URL or path to file

    Options = New Structure;
    Options.Insert("sql", SQLFile);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ExecuteSQLQuery", Options);

    Process(Result, "MySQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_MySQL.CloseConnection(Connection);

    // END

    Process(Closing, "MySQL", "ExecuteSQLQuery", "Closing"); // SKIP

EndProcedure

Procedure MySQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    OPI_MySQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateDatabase", Options);

    // END

    Process(Result, "MySQL", "CreateDatabase");

    Base = "testbase2";
    OPI_MySQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MySQL", "CreateDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateDatabase", Options);

    Process(Result, "MySQL", "CreateDatabase", "Creation");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateDatabase", Options);

    Process(Result, "MySQL", "CreateDatabase", "Existing");

    OPI_MySQL.CloseConnection(Connection);

EndProcedure

Procedure MySQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("char_field"      , "CHAR(5)");
    ColoumnsStruct.Insert("varchar_field"   , "VARCHAR(255)");
    ColoumnsStruct.Insert("tinytext_field"  , "TINYTEXT");
    ColoumnsStruct.Insert("text_field"      , "TEXT");
    ColoumnsStruct.Insert("mediumtext_field", "MEDIUMTEXT");
    ColoumnsStruct.Insert("longtext_field"  , "LONGTEXT");
    ColoumnsStruct.Insert("tinyint_field"   , "TINYINT");
    ColoumnsStruct.Insert("smallint_field"  , "SMALLINT");
    ColoumnsStruct.Insert("mediumint_field" , "MEDIUMINT");
    ColoumnsStruct.Insert("int_field"       , "INT");
    ColoumnsStruct.Insert("uint_field"      , "INT UNSIGNED");
    ColoumnsStruct.Insert("bigint_field"    , "BIGINT");
    ColoumnsStruct.Insert("float_field"     , "FLOAT");
    ColoumnsStruct.Insert("double_field"    , "DOUBLE");
    ColoumnsStruct.Insert("date_field"      , "DATE");
    ColoumnsStruct.Insert("time_field"      , "TIME");
    ColoumnsStruct.Insert("datetime_field"  , "DATETIME");
    ColoumnsStruct.Insert("timestamp_field" , "TIMESTAMP");
    ColoumnsStruct.Insert("mediumblob_field", "MEDIUMBLOB");
    ColoumnsStruct.Insert("set_field"       , "SET('one','two','three')");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateTable", Options);

    // END

    Process(Result, "MySQL", "CreateTable");

    Table = "ABC DEF";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateTable", Options);

    Process(Result, "MySQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "CreateTable", Options);

    Process(Result, "MySQL", "CreateTable", "Type error");

EndProcedure

Procedure MySQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    CurrentDate = OPI_Tools.GetCurrentDate();

    RecordStructure = New Structure;
    RecordStructure.Insert("char_field"      , New Structure("TEXT"  , "AAAAA"));
    RecordStructure.Insert("varchar_field"   , New Structure("TEXT"  , "Some varchar"));
    RecordStructure.Insert("tinytext_field"  , New Structure("TEXT"  , "Some tiny text"));
    RecordStructure.Insert("text_field"      , New Structure("TEXT"  , "Some text"));
    RecordStructure.Insert("mediumtext_field", New Structure("TEXT"  , "Some medium text"));
    RecordStructure.Insert("longtext_field"  , New Structure("TEXT"  , "Some looooooong text"));
    RecordStructure.Insert("tinyint_field"   , New Structure("INT"   , 127));
    RecordStructure.Insert("smallint_field"  , New Structure("INT"   , -32767));
    RecordStructure.Insert("mediumint_field" , New Structure("INT"   , 8388607));
    RecordStructure.Insert("int_field"       , New Structure("INT"   , -2147483647));
    RecordStructure.Insert("uint_field"      , New Structure("UINT"  , 4294967295));
    RecordStructure.Insert("bigint_field"    , New Structure("INT"   , 9223372036854775807));
    RecordStructure.Insert("float_field"     , New Structure("FLOAT" , 100.50));
    RecordStructure.Insert("double_field"    , New Structure("FLOAT" , 100.512123));
    RecordStructure.Insert("date_field"      , New Structure("DATE"  , CurrentDate));
    RecordStructure.Insert("time_field"      , New Structure("TIME"  , CurrentDate));
    RecordStructure.Insert("datetime_field"  , New Structure("DATE"  , CurrentDate));
    RecordStructure.Insert("timestamp_field" , New Structure("DATE"  , CurrentDate));
    RecordStructure.Insert("mediumblob_field", New Structure("BYTES" , Image));
    RecordStructure.Insert("set_field"       , New Structure("TEXT"  , "one"));

    RecordsArray.Add(RecordStructure);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", RecordsArray);
    Options.Insert("trn", Истина);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "AddRecords", Options);

    // END

    Process(Result, "MySQL", "AddRecords");

EndProcedure

Procedure MySQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    Process(Result, "MySQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", "test_data");
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

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
    Options.Insert("table", Table);
    Options.Insert("fields", Fields);
    Options.Insert("filter", Filters);
    Options.Insert("order", Sort);
    Options.Insert("limit", Count);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    // END

    Process(Result, "MySQL", "GetRecords", "Filters");

EndProcedure

Procedure MySQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

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

    Count = OPI_MySQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP
    Process(Count, "MySQL", "UpdateRecords", "Count"); // SKIP
    Count = Count["data"].Count(); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("values", FieldsStructure);
    Options.Insert("filter", FilterStructure);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "UpdateRecords", Options);

    // END

    Process(Result, "MySQL", "UpdateRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['ip_address']");
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    Process(Check, "MySQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure MySQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

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

    Obtaining = OPI_MySQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteRecords", Options);

    // END

    Process(Obtaining, "MySQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    Process(Result, "MySQL", "DeleteRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    Process(Result, "MySQL", "DeleteRecords", "Check", Residue);

EndProcedure

Procedure MySQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteTable", Options);

    // END

    Process(Result, "MySQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteTable", Options);

    Process(Result, "MySQL", "DeleteTable", "Test");

EndProcedure

Procedure MySQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    // END

    Process(Result, "MySQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_MySQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MySQL", "DeleteDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    Process(Result, "MySQL", "DeleteDatabase", "Deletion");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    Process(Result, "MySQL", "DeleteDatabase", "Error");

    Closing = OPI_MySQL.CloseConnection(Connection);

    Process(Closing, "MySQL", "DeleteDatabase", "Closing");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteDatabase", Options);

    Process(Result, "MySQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure MySQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "ClearTable", Options);

    // END

    Process(Result, "MySQL", "ClearTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecords", Options);

    Process(Result, "MySQL", "ClearTable", "Check");

EndProcedure

Procedure MySQL_GetRecordsFilterStrucutre(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecordsFilterStrucutre", Options);

    // END

    Process(Result, "MySQL", "GetRecordsFilterStrucutre");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetRecordsFilterStrucutre", Options);

    Process(Result, "MySQL", "GetRecordsFilterStrucutre", "Clear");

EndProcedure

Procedure MySQL_GetTLSSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);

    // END

    Process(Result, "MySQL", "GetTLSSettings");

EndProcedure

Procedure MySQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    // END

    Process(Result, "MySQL", "GetTableInformation");

    Table = "heyho";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    Process(Result, "MySQL", "GetTableInformation", "Error");

EndProcedure

Procedure MySQL_AddTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table    = "testtable";
    Name     = "new_field";
    DataType = "MEDIUMTEXT";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("type", DataType);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "AddTableColumn", Options);

    // END

    Process(Result, "MySQL", "AddTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    Process(Result, "MySQL", "AddTableColumn", "Check");

EndProcedure

Procedure MySQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";
    Name  = "new_field";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "DeleteTableColumn", Options);

    // END

    Process(Result, "MySQL", "DeleteTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    Process(Result, "MySQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure MySQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    TLS = True;
    TLS = FunctionParameters["TLS"]; // SKIP

    Port = 3306;
    Port = ?(TLS, 3307, 3306); // SKIP

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("port", Port);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GenerateConnectionString", Options);

    If TLS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTLSSettings", Options);
    Else
        TLSSettings = Undefined;
    EndIf;

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "SMALLINT");
    ColoumnsStruct.Insert("double_field"   , "DOUBLE");
    ColoumnsStruct.Insert("bigint_field"   , "BIGINT");
    ColoumnsStruct.Insert("custom_field"   , "TEXT");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "EnsureTable", Options);

    // END

    Process(Result, "MySQL", "EnsureTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    Process(Check, "MySQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "EnsureTable", Options);

    Process(Result, "MySQL", "EnsureTable", "New");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mysql", "GetTableInformation", Options);

    Process(Check, "MySQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

#EndRegion

#Region GreenAPI

Procedure GreenAPI_FormAccessParameters(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    // END

    Process(Result, "GreenAPI", "FormAccessParameters");

EndProcedure

Procedure GreenAPI_GetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettings", Options);

    // END

    Process(Result, "GreenAPI", "GetInstanceSettings", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetAccountInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetAccountInformation", Options);

    // END

    Process(Result, "GreenAPI", "GetAccountInformation");

EndProcedure

Procedure GreenAPI_GetInstanceSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettingsStructure", Options);

    // END

    Process(Result, "GreenAPI", "GetInstanceSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceSettingsStructure", Options);

    Process(Result, "GreenAPI", "GetInstanceSettingsStructure", "Clear");

EndProcedure

Procedure GreenAPI_SetInstanceSettings(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    SettingsStructure = New Structure;
    SettingsStructure.Insert("pollMessageWebhook"       , "yes");
    SettingsStructure.Insert("incomingBlockWebhook"     , "no");
    SettingsStructure.Insert("incomingCallWebhook"      , "no");
    SettingsStructure.Insert("editedMessageWebhook"     , "yes");
    SettingsStructure.Insert("deletedMessageWebhook"    , "yes");
    SettingsStructure.Insert("outgoingAPIMessageWebhook", "yes");

    Options = New Structure;
    Options.Insert("settings", SettingsStructure);
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetInstanceSettings", Options);

    // END

    Process(Result, "GreenAPI", "SetInstanceSettings");

EndProcedure

Procedure GreenAPI_GetInstanceStatus(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetInstanceStatus", Options);

    // END

    Process(Result, "GreenAPI", "GetInstanceStatus");

EndProcedure

Procedure GreenAPI_RebootInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "RebootInstance", Options);

    // END

    Process(Result, "GreenAPI", "RebootInstance");

EndProcedure

Procedure GreenAPI_GetQR(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetQR", Options);

    // END

    Process(Result, "GreenAPI", "GetQR");

EndProcedure

Procedure GreenAPI_LogoutInstance(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "LogoutInstance", Options);

    // END

    Process(Result, "GreenAPI", "LogoutInstance");

EndProcedure

Procedure GreenAPI_GetAuthorizationCode(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    PhoneNumber = 441234567890;

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("phone", PhoneNumber);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetAuthorizationCode", Options);

    // END

    Process(Result, "GreenAPI", "GetAuthorizationCode");

EndProcedure

Procedure GreenAPI_SetProfilePicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetProfilePicture", Options);

    // END

    Process(Result, "GreenAPI", "SetProfilePicture");

EndProcedure

Procedure GreenAPI_CreateGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Name = "New group";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("name", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "CreateGroup", Options);

    // END

    Process(Result, "GreenAPI", "CreateGroup", , FunctionParameters);

EndProcedure

Procedure GreenAPI_LeaveGroup(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "LeaveGroup", Options);

    // END

    Process(Result, "GreenAPI", "LeaveGroup");

EndProcedure

Procedure GreenAPI_GetGroupInformation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetGroupInformation", Options);

    // END

    Process(Result, "GreenAPI", "GetGroupInformation");

EndProcedure

Procedure GreenAPI_UpdateGroupName(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    Name    = "New name";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("name", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "UpdateGroupName", Options);

    // END

    Process(Result, "GreenAPI", "UpdateGroupName");

EndProcedure

Procedure GreenAPI_AddGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "AddGroupMember", Options);

    // END

    Process(Result, "GreenAPI", "AddGroupMember");

EndProcedure

Procedure GreenAPI_ExcludeGroupMember(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ExcludeGroupMember", Options);

    // END

    Process(Result, "GreenAPI", "ExcludeGroupMember");

EndProcedure

Procedure GreenAPI_SetAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetAdminRights", Options);

    // END

    Process(Result, "GreenAPI", "SetAdminRights");

EndProcedure

Procedure GreenAPI_RevokeAdminRights(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    GroupID = FunctionParameters["GreenAPI_GroupID"];
    UserID  = "123123123@c.us";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("user", UserID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "RevokeAdminRights", Options);

    // END

    Process(Result, "GreenAPI", "RevokeAdminRights");

EndProcedure

Procedure GreenAPI_SetGroupPicture(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Image   = FunctionParameters["Picture"]; // URL, Path or Binary Data
    GroupID = FunctionParameters["GreenAPI_GroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("group", GroupID);
    Options.Insert("picture", Image);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetGroupPicture", Options);

    // END

    Process(Result, "GreenAPI", "SetGroupPicture");

EndProcedure

Procedure GreenAPI_SendTextMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];
    Text   = "New message";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendTextMessage", Options);

    // END

    Process(Result, "GreenAPI", "SendTextMessage", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendTextMessage", Options);

    Process(Result, "GreenAPI", "SendTextMessage", "Quote");

EndProcedure

Procedure GreenAPI_DeleteMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "DeleteMessage", Options);

    // END

    Process(Result, "GreenAPI", "DeleteMessage");

EndProcedure

Procedure GreenAPI_EditMessageText(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];
    Text      = "New message text";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);
    Options.Insert("text", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "EditMessageText", Options);

    // END

    Process(Result, "GreenAPI", "EditMessageText");

EndProcedure

Procedure GreenAPI_SendFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = "photo.jpg";
    ChatID      = FunctionParameters["GreenAPI_TestGroupID"];
    Description = "File description";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFile", Options);

    // END

    Process(Result, "GreenAPI", "SendFile", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("file", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFile", Options);

    Process(Result, "GreenAPI", "SendFile", "Quote");

EndProcedure

Procedure GreenAPI_SendFileByURL(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    File        = FunctionParameters["Picture"];
    FileName    = "photo.jpg";
    ChatID      = FunctionParameters["GreenAPI_TestGroupID"];
    Description = "File description";

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("url", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFileByURL", Options);

    // END

    Process(Result, "GreenAPI", "SendFileByURL", , FunctionParameters);

    File     = FunctionParameters["Video"];
    FileName = "vid.mp4";

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("url", File);
    Options.Insert("filename", FileName);
    Options.Insert("caption", Description);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendFileByURL", Options);

    Process(Result, "GreenAPI", "SendFileByURL", "Quote");

EndProcedure

Procedure GreenAPI_SendPoll(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];
    Text   = "What's your favorite color?";

    Options = New Array;
    Options.Add("Red");
    Options.Add("Yellow");
    Options.Add("Green");

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("options", Options);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendPoll", Options);

    // END

    Process(Result, "GreenAPI", "SendPoll", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("text", Text);
    Options.Insert("options", Options);
    Options.Insert("multi", Истина);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendPoll", Options);

    Process(Result, "GreenAPI", "SendPoll", "Quote");

EndProcedure

Procedure GreenAPI_GetLocationDescription(FunctionParameters)

    Latitude  = 53.908522;
    Longitude = 27.574821;
    Address   = "Victory Square, Minsk";
    Name      = "Victory sq.";

    Options = New Structure;
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);
    Options.Insert("addr", Address);
    Options.Insert("name", Name);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetLocationDescription", Options);

    // END

    Process(Result, "GreenAPI", "GetLocationDescription");

EndProcedure

Procedure GreenAPI_SendLocation(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Latitude  = 53.908522;
    Longitude = 27.574821;
    Address   = "Victory Square, Minsk";
    Name      = "Victory sq.";

    Options = New Structure;
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);
    Options.Insert("addr", Address);
    Options.Insert("name", Name);

    Location = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetLocationDescription", Options);

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("loc", Location);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendLocation", Options);

    // END

    Process(Result, "GreenAPI", "SendLocation", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("lat", Latitude);
    Options.Insert("long", Longitude);

    Location = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetLocationDescription", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("loc", Location);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendLocation", Options);

    Process(Result, "GreenAPI", "SendLocation", "Quote");

EndProcedure

Procedure GreenAPI_GetContactDescription(FunctionParameters)

    Phone      = 79001234568;
    Name       = "Artem";
    LastName   = "Evpatoriysky";
    Patronymic = "Petrovich";
    Company    = "Bicycle";

    Options = New Structure;
    Options.Insert("phone", Phone);
    Options.Insert("name", Name);
    Options.Insert("surname", LastName);
    Options.Insert("midname", Patronymic);
    Options.Insert("company", Company);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetContactDescription", Options);

    // END

    Process(Result, "GreenAPI", "GetContactDescription");

EndProcedure

Procedure GreenAPI_SendContact(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Phone      = 79001234568;
    Name       = "Artem";
    LastName   = "Evpatoriysky";
    Patronymic = "Petrovich";
    Company    = "Bicycle";

    Options = New Structure;
    Options.Insert("phone", Phone);
    Options.Insert("name", Name);
    Options.Insert("surname", LastName);
    Options.Insert("midname", Patronymic);
    Options.Insert("company", Company);

    Contact = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetContactDescription", Options);

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("contact", Contact);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendContact", Options);

    // END

    Process(Result, "GreenAPI", "SendContact", , FunctionParameters);

    MessageID = Result["idMessage"];
    Options = New Structure;
    Options.Insert("phone", Phone);
    Options.Insert("company", Company);

    Contact = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetContactDescription", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("contact", Contact);
    Options.Insert("quoted", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SendContact", Options);

    Process(Result, "GreenAPI", "SendContact", "Quote");

EndProcedure

Procedure GreenAPI_ForwardMessages(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    From   = "11001234567@c.us";
    From   = FunctionParameters["GreenAPI_TestGroupID"]; // SKIP
    Target = FunctionParameters["GreenAPI_TestGroupID"];

    Message = FunctionParameters["GreenAPI_MessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("from", From);
    Options.Insert("to", Target);
    Options.Insert("msgs", Message);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ForwardMessages", Options);

    // END

    Process(Result, "GreenAPI", "ForwardMessages");

EndProcedure

Procedure GreenAPI_GetNotification(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetNotification", Options);

    // END

    Process(Result, "GreenAPI", "GetNotification", , FunctionParameters);

EndProcedure

Procedure GreenAPI_DeleteNotificationFromQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ReceiptID = FunctionParameters["GreenAPI_ReceiptID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("receipt", ReceiptID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "DeleteNotificationFromQueue", Options);

    // END

    Process(Result, "GreenAPI", "DeleteNotificationFromQueue");

EndProcedure

Procedure GreenAPI_DownloadMessageFile(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_FileMessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "DownloadMessageFile", Options);

    // END

    Process(Result, "GreenAPI", "DownloadMessageFile");

EndProcedure

Procedure GreenAPI_SetReadMark(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_FileMessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("message", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "SetReadMark", Options);

    // END

    Process(Result, "GreenAPI", "SetReadMark");

EndProcedure

Procedure GreenAPI_GetMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetMessageQueue", Options);

    // END

    Process(Result, "GreenAPI", "GetMessageQueue");

EndProcedure

Procedure GreenAPI_ClearMessageQueue(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ClearMessageQueue", Options);

    // END

    Process(Result, "GreenAPI", "ClearMessageQueue");

EndProcedure

Procedure GreenAPI_GetChatHistory(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetChatHistory", Options);

    // END

    Process(Result, "GreenAPI", "GetChatHistory", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetMessage(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID    = FunctionParameters["GreenAPI_TestGroupID"];
    MessageID = FunctionParameters["GreenAPI_MessageID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);
    Options.Insert("msg", MessageID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetMessage", Options);

    // END

    Process(Result, "GreenAPI", "GetMessage", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetIncomingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetIncomingMessageLog", Options);

    // END

    Process(Result, "GreenAPI", "GetIncomingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_GetOutgoingMessageLog(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "GetOutgoingMessageLog", Options);

    // END

    Process(Result, "GreenAPI", "GetOutgoingMessageLog", , FunctionParameters);

EndProcedure

Procedure GreenAPI_ArchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);

    OPI_GreenAPI.UnarchiveChat(AccessParameters, ChatID); // SKIP

    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "ArchiveChat", Options);

    // END

    Process(Result, "GreenAPI", "ArchiveChat");

EndProcedure

Procedure GreenAPI_UnarchiveChat(FunctionParameters)

    ApiUrl           = FunctionParameters["GreenAPI_ApiURL"];
    MediaUrl         = FunctionParameters["GreenAPI_MediaURL"];
    IdInstance       = FunctionParameters["GreenAPI_IdInstance"];
    ApiTokenInstance = FunctionParameters["GreenAPI_Token"];

    ChatID = FunctionParameters["GreenAPI_TestGroupID"];

    Options = New Structure;
    Options.Insert("api", ApiUrl);
    Options.Insert("media", MediaUrl);
    Options.Insert("id", IdInstance);
    Options.Insert("token", ApiTokenInstance);

    AccessParameters = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "FormAccessParameters", Options);
    Options = New Structure;
    Options.Insert("access", AccessParameters);
    Options.Insert("chat", ChatID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("greenapi", "UnarchiveChat", Options);

    // END

    Process(Result, "GreenAPI", "UnarchiveChat");

EndProcedure

#EndRegion

#Region RCON

Procedure RCON_FormConnectionParameters(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);

    // END

    Process(Result, "RCON", "FormConnectionParameters");

EndProcedure

Procedure RCON_CreateConnection(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    ConnectionParams = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);
    Result           = OPI_RCON.CreateConnection(ConnectionParams);

    // END

    Process(Result, "RCON", "CreateConnection");

EndProcedure

Procedure RCON_ExecuteCommand(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    ConnectionParams = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);
    Connection       = OPI_RCON.CreateConnection(ConnectionParams);

    Command = "list";
    Options = New Structure;
    Options.Insert("exec", Command);
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "ExecuteCommand", Options);

    // END

    Process(Result, "RCON", "ExecuteCommand");

    Command = "list";
    Options = New Structure;
    Options.Insert("exec", Command);
    Options.Insert("conn", ConnectionParams);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "ExecuteCommand", Options);

    Process(Result, "RCON", "ExecuteCommand", "No connection");

EndProcedure

Procedure RCON_IsConnector(FunctionParameters)

    URL          = FunctionParameters["RCON_URL"];
    Password     = FunctionParameters["RCON_Password"];
    WriteTimeout = 20;
    ReadTimeout  = 20;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("pass", Password);
    Options.Insert("rtout", ReadTimeout);
    Options.Insert("wtout", WriteTimeout);

    ConnectionParams = OPI_TestDataRetrieval.ExecuteTestCLI("rcon", "FormConnectionParameters", Options);
    Connection       = OPI_RCON.CreateConnection(ConnectionParams);
    Result           = OPI_RCON.IsConnector(Connection);

    // END

    Process(Result, "RCON", "IsConnector");

EndProcedure

#EndRegion

#Region Ollama

Procedure Ollama_GetResponse(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Prompt = "What is 1C:Enterprise?";
    Model  = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("prompt", Prompt);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetResponse", Options);

    Process(Result, "Ollama", "GetResponse"); // SKIP

    // With paramether

    Prompt = "Ollama is 22 years old and is busy saving the world. Respond using JSON";

    Format = OPI_Tools.JSONToStructure("
    |{
    |""type"": ""object"",
    |""properties"": {
    | ""age"": {
    | ""type"": ""integer""
    | },
    | ""available"": {
    | ""type"": ""boolean""
    | }
    |},
    |""required"": [
    | ""age"",
    | ""available""
    |]
    |}");

    AdditionalParameters = New Structure("format", Format);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("prompt", Prompt);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetResponse", Options);

    // END

    Process(Result, "Ollama", "GetResponse", "Parameters");

EndProcedure

Procedure Ollama_GetContextResponse(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Model = "tinyllama";

    MessagesArray = New Array;

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "What is 1C:Enterprise?");

    Question1 = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextMessageStructure", Options);
    Question2 = OPI_Ollama.GetContextMessageStructure("user", "When the first version was released?"); // Question without specifics

    // Adding the first question to the context
    MessagesArray.Add(Question1);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("headers", AdditionalHeaders);

    Response1 = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    Process(Response1, "Ollama", "GetContextResponse", "Preliminary"); // SKIP

    MessagesArray.Add(Response1["message"]); // Add response to first question in context
    MessagesArray.Add(Question2); // Add second question in context

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("headers", AdditionalHeaders);

    Response2 = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    MessagesArray.Add(Response2["message"]);

    // ...

    // END

    Process(Response2, "Ollama", "GetContextResponse");

    MessagesArray = New Array;

    Question = New Structure("role,content", "user", "Hello!");
    MessagesArray.Add(Question);

    Options              = New Structure("seed,temperature", 101, 0);
    AdditionalParameters = New Structure("options", Options);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    Process(Result, "Ollama", "GetContextResponse", "Seed 1");

    Message1 = Result["message"]["content"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    Process(Result, "Ollama", "GetContextResponse", "Seed 2");

    Message2 = Result["message"]["content"];

    Options              = New Structure("seed,temperature", 555, 10);
    AdditionalParameters = New Structure("options", Options);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("msgs", MessagesArray);
    Options.Insert("options", AdditionalParameters);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextResponse", Options);

    Process(Result, "Ollama", "GetContextResponse", "Seed 3");

    Message3 = Result["message"]["content"];

    Process(Message3, "Ollama", "GetContextResponse", "Comparison", Message1, Message2, Message3);

EndProcedure

Procedure Ollama_LoadModelToMemory(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model  = "tinyllama";
    Period = 500;

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("keep", Period);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "LoadModelToMemory", Options);

    // END

    Process(Result, "Ollama", "LoadModelToMemory");

EndProcedure

Procedure Ollama_UnloadModelFromMemory(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "UnloadModelFromMemory", Options);

    // END

    Process(Result, "Ollama", "UnloadModelFromMemory");

EndProcedure

Procedure Ollama_GetRequestParameterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetRequestParameterStructure", Options);

    // END

    Process(Result, "Ollama", "GetRequestParameterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetRequestParameterStructure", Options);

    Process(Result, "Ollama", "GetRequestParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextParameterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextParameterStructure", Options);

    // END

    Process(Result, "Ollama", "GetContextParameterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextParameterStructure", Options);

    Process(Result, "Ollama", "GetContextParameterStructure", "Clear");

EndProcedure

Procedure Ollama_GetContextMessageStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "Hello!");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetContextMessageStructure", Options);

    // END

    Process(Result, "Ollama", "GetContextMessageStructure");

EndProcedure

Procedure Ollama_GetModelSettingsStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelSettingsStructure", Options);

    // END

    Process(Result, "Ollama", "GetModelSettingsStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelSettingsStructure", Options);

    Process(Result, "Ollama", "GetModelSettingsStructure", "Clear");

EndProcedure

Procedure Ollama_CreateModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Settings = New Structure("from,system", "tinyllama", "You are Mario from Super Mario Bros.");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("settings", Settings);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CreateModel", Options);

    // END

    Process(Result, "Ollama", "CreateModel");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("prompt", "How are you?");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetResponse", Options);

    Process(Result, "Ollama", "CreateModel", "Request");

EndProcedure

Procedure Ollama_DeleteModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "DeleteModel", Options);

    // END

    Process(Result, "Ollama", "DeleteModel");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", "library/tinyllama:latest");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "DeleteModel", Options);
    Process(Result, "Ollama", "DeleteModel", "Tiny");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", "bayselonarrend/tinyllama:latest");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "DeleteModel", Options);
    Process(Result, "Ollama", "DeleteModel", "Tiny, account");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelList", Options);

    Process(Result, "Ollama", "DeleteModel", "List");

EndProcedure

Procedure Ollama_GetModelList(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelList", Options);

    // END

    Process(Result, "Ollama", "GetModelList");

EndProcedure

Procedure Ollama_ListRunningModels(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "ListRunningModels", Options);

    // END

    Process(Result, "Ollama", "ListRunningModels");

EndProcedure

Procedure Ollama_GetModelInformation(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("verbose", Ложь);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetModelInformation", Options);

    // END

    Process(Result, "Ollama", "GetModelInformation");

EndProcedure

Procedure Ollama_CopyModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "mario";
    Name  = "mario2";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("name", Name);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CopyModel", Options);

    // END

    Process(Result, "Ollama", "CopyModel");

    OPI_Ollama.DeleteModel(URL, Name, AdditionalHeaders);

EndProcedure

Procedure Ollama_GetVersion(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetVersion", Options);

    // END

    Process(Result, "Ollama", "GetVersion");

EndProcedure

Procedure Ollama_GetEmbeddings(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    StingsArray = New Array;
    StingsArray.Add("Why is the sky blue?");
    StingsArray.Add("Why is the grass green?");

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("input", StingsArray);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetEmbeddings", Options);

    // END

    Process(Result, "Ollama", "GetEmbeddings");

EndProcedure

Procedure Ollama_GetEmbeddingsParameterStructure(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetEmbeddingsParameterStructure", Options);

    // END

    Process(Result, "Ollama", "GetEmbeddingsParameterStructure");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "GetEmbeddingsParameterStructure", Options);

    Process(Result, "Ollama", "GetEmbeddingsParameterStructure", "Clear");

EndProcedure

Procedure Ollama_PushModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "bayselonarrend/tinyllama:latest";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PushModel", Options);

    // END

    Process(Result, "Ollama", "PushModel");

EndProcedure

Procedure Ollama_PullModel(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Model = "tinyllama";

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", Model);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PullModel", Options);

    // END

    Process(Result, "Ollama", "PullModel");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("model", "bayselonarrend/tinyllama:latest");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PullModel", Options);

    Process(Result, "Ollama", "PullModel", "Account");

EndProcedure

Procedure Ollama_PushBlob(FunctionParameters)

    URL   = FunctionParameters["Ollama_URL"];
    Token = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    OPI_TypeConversion.GetBinaryData(Image, True); // SKIP
    Random = GetBinaryDataFromString(String(New UUID)); // SKIP
    Image  = OPI_Tools.MergeData(Image, Random); // SKIP

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("data", Image);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "PushBlob", Options);

    // END

    Process(Result, "Ollama", "PushBlob", , FunctionParameters);

EndProcedure

Procedure Ollama_CheckBlob(FunctionParameters)

    URL    = FunctionParameters["Ollama_URL"];
    Token  = FunctionParameters["Ollama_Token"]; // Authorization - not part API Ollama
    SHA256 = FunctionParameters["Ollama_Blob"];

    AdditionalHeaders = New Map;
    AdditionalHeaders.Insert("Authorization", StrTemplate("Bearer %1", Token));

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("digest", SHA256);
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CheckBlob", Options);

    // END

    Process(Result, "Ollama", "CheckBlob");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("digest", "yoyoyo");
    Options.Insert("headers", AdditionalHeaders);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ollama", "CheckBlob", Options);

    Process(Result, "Ollama", "CheckBlob", "Error");

EndProcedure

#EndRegion

#Region HTTP

Procedure HTTPClient_Initialize(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "Initialize");

    HTTPClient = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .ProcessRequest("POST", False);

    Process(HTTPClient, "HTTPClient", "Initialize", "Check 1", FunctionParameters);

    AnotherRequest = HTTPClient.SetURL(FunctionParameters["HTTP_URL"] + "/post")
        .ProcessRequest("POST", False)
        .ReturnRequest();

    Process(AnotherRequest, "HTTPClient", "Initialize", "Check 2");

EndProcedure

Procedure HTTPClient_SetURL(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetURL");

    HTTPClient = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("POST", False);

    Process(HTTPClient, "HTTPClient", "SetURL", "Check", FunctionParameters);

EndProcedure

Procedure HTTPClient_SetURLParams(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ParametersStructure = New Structure("param1,param2", "text", 10);

    Result = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .SetURLParams(ParametersStructure) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetURLParams", , FunctionParameters);

    HTTPClient = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetURLParams(ParametersStructure)
        .ProcessRequest("POST", False);

    HTTPRequest = HTTPClient.ReturnRequest();

    Process(HTTPRequest, "HTTPClient", "SetURLParams", "Check");

    // Encoding check

    // Complex

    ParameterStructure1 = New Structure;
    ParameterStructure1.Insert("param1", "search?text");
    ParameterStructure1.Insert("param2", "John Doe");
    ParameterStructure1.Insert("param3", "value&another");
    ParameterStructure1.Insert("param4", "кириллица");
    ParameterStructure1.Insert("param5", "<script>alert('XSS')</script>");

    ResourceAddress1 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParameterStructure1)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    Process(ResourceAddress1, "HTTPClient", "SetURLParams", "Option 1");

    ParameterStructure2 = New Structure;
    ParameterStructure2.Insert("param1", "search?text");
    ParameterStructure2.Insert("param2", "John Doe");

    // Parameters in the original URL

    ResourceAddress2 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page?existing=value")
        .SetURLParams(ParameterStructure2)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    Process(ResourceAddress2, "HTTPClient", "SetURLParams", "Option 2");

    // Empty parameter string

    ParameterStructure3 = New Structure;
    ParameterStructure3.Insert("param1", "search?text");
    ParameterStructure3.Insert("param2", "John Doe");

    ResourceAddress3 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page?")
        .SetURLParams(ParameterStructure3)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    Process(ResourceAddress3, "HTTPClient", "SetURLParams", "Variant 3");

    // Special characters at path

    ParameterStructure4 = New Structure;
    ParameterStructure4.Insert("param1", "search?text");
    ParameterStructure4.Insert("param2", "John Doe");

    ResourceAddress4 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/path with spaces")
        .SetURLParams(ParameterStructure4)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    Process(ResourceAddress4, "HTTPClient", "SetURLParams", "Variant 4");

    // URL with a snippet

    ParameterStructure5 = New Structure;
    ParameterStructure5.Insert("param1", "search?text");
    ParameterStructure5.Insert("param2", "John Doe");

    ResourceAddress5 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page#section")
        .SetURLParams(ParameterStructure5)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    Process(ResourceAddress5, "HTTPClient", "SetURLParams", "Variant 5");

    // Cyrillic at path

    ParameterStructure6 = New Structure;
    ParameterStructure6.Insert("param1", "search?text");
    ParameterStructure6.Insert("param2", "John Doe");

    ResourceAddress6 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/путь")
        .SetURLParams(ParameterStructure6)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    Process(ResourceAddress6, "HTTPClient", "SetURLParams", "Variant 6");

    // Multiple parameters and encoding

    ParameterStructure7 = New Structure;
    ParameterStructure7.Insert("param1", "value1");
    ParameterStructure7.Insert("param2", "value two");
    ParameterStructure7.Insert("param3", "value<three>");

    ResourceAddress7 = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParameterStructure7)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    Process(ResourceAddress7, "HTTPClient", "SetURLParams", "Variant 7");

EndProcedure

Procedure HTTPClient_SetResponseFile(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    TFN = GetTempFileName();

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetResponseFile(TFN) // <---
        .ProcessRequest("GET")
        .ReturnResponseFilename();

    // END

    Process(Result, "HTTPClient", "SetResponseFile", , TFN);

    CheckResult = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetResponseFile(TFN) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsBinaryData();

    Process(CheckResult, "HTTPClient", "SetResponseFile", "Body", TFN);

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "File deletion error", "HTTPClient");
    EndTry;

EndProcedure

Procedure HTTPClient_SetDataType(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    MIMEType = "text/markdown";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetStringBody("# Hello world!")
        .SetDataType(MIMEType) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetDataType");

EndProcedure

Procedure HTTPClient_GetLog(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ParametersStructure = New Structure("param1,param2", "text", 10);

    HTTPClient = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .SetURLParams(ParametersStructure)
        .ProcessRequest("GET");

    Response = HTTPClient.ReturnResponseAsJSONObject();
    Log      = HTTPClient.GetLog(True);

    // END

    Process(Log, "HTTPClient", "GetLog");

EndProcedure

Procedure HTTPClient_SetBinaryBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetBinaryBody", , Image);

EndProcedure

Procedure HTTPClient_SetStringBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Text     = "Hello world!";
    Encoding = "Windows-1251";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .UseEncoding(Encoding)
        .SetStringBody(Text) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetStringBody");

EndProcedure

Procedure HTTPClient_SetJsonBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    RandomArray = New Array;
    RandomArray.Add("A");
    RandomArray.Add("B");
    RandomArray.Add("C");

    Data = New Structure("Field1,Field2,Field3", 10, "Text", RandomArray);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetJsonBody(Data) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetJsonBody", , Data);

EndProcedure

Procedure HTTPClient_SetFormBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Data = New Structure("Field1,Field2", "10", "Text");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetFormBody(Data) // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetFormBody", , Data);

EndProcedure

Procedure HTTPClient_StartMultipartBody(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody() // <---
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("Field1", "Text")
        .AddMultipartFormDataField("Field2", "10")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "StartMultipartBody", , Image);

EndProcedure

Procedure HTTPClient_AddMultipartFormDataFile(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png") // <---
        .AddMultipartFormDataField("Field1", "Text")
        .AddMultipartFormDataField("Field2", "10")
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddMultipartFormDataFile", , Image);

EndProcedure

Procedure HTTPClient_AddMultipartFormDataField(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("Field1", "Text") // <---
        .AddMultipartFormDataField("Field2", "10") // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddMultipartFormDataField", , Image);

EndProcedure

Procedure HTTPClient_AddDataAsRelated(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    RandomArray = New Array;
    RandomArray.Add("A");
    RandomArray.Add("B");
    RandomArray.Add("C");

    Data = New Structure("Field1,Field2,Field3", 10, "Text", RandomArray);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .StartMultipartBody(True, "related")
        .AddDataAsRelated(Data, "application/json; charset=UTF-8") // <---
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddDataAsRelated");

EndProcedure

Procedure HTTPClient_UseEncoding(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Text     = "Hello world!";
    Encoding = "Windows-1251";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .UseEncoding(Encoding) // <---
        .SetStringBody(Text)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "UseEncoding");

EndProcedure

Procedure HTTPClient_UseGzipCompression(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .UseGzipCompression(False) // <---
        .ProcessRequest("POST", False)
        .ReturnRequest();

    // END

    Process(Result, "HTTPClient", "UseGzipCompression");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .UseGzipCompression(True) // <---
        .ProcessRequest("POST", False)
        .ReturnRequest();

    Process(Result, "HTTPClient", "UseGzipCompression", "Enabled");

EndProcedure

Procedure HTTPClient_UseBodyFiledsAtOAuth(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Token       = "***";
    Secret      = "***";
    UsersKey    = "***";
    UsersSecret = "***";
    Version     = "1.0";

    NewRequest = OPI_HTTPRequests.NewRequest().Initialize(URL);

    Result = NewRequest
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("field1", "Text")
        .AddMultipartFormDataField("field2", "10")
        .UseBodyFiledsAtOAuth(False) // <---
        .AddOauthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject();

    // END

    LogAsString = NewRequest.GetLog(True);
    Process(Result, "HTTPClient", "UseBodyFiledsAtOAuth", , LogAsString);

    Result = OPI_HTTPRequests
        .NewRequest()
        .Initialize(URL)
        .StartMultipartBody()
        .AddMultipartFormDataFile("file1", "pic.png", Image, "image/png")
        .AddMultipartFormDataField("field1", "Text")
        .AddMultipartFormDataField("field2", "10")
        .UseBodyFiledsAtOAuth(True) // <---
        .AddOauthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .ProcessRequest("POST", False)
        .GetLog(True);

    Process(Result, "HTTPClient", "UseBodyFiledsAtOAuth", "Enabled");

EndProcedure

Procedure HTTPClient_SetHeaders(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Headers = New Map;
    Headers.Insert("X-Header1", "Value1");
    Headers.Insert("X-Header2", "Value2");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetHeaders(Headers) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetHeaders");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("1111")
        .SetHeaders(Headers, True) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    Process(Result, "HTTPClient", "SetHeaders", "Rewrite");

EndProcedure

Procedure HTTPClient_AddHeader(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddHeader("X-Header1", "Value1") // <---
        .AddHeader("X-Header2", "Value2") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddHeader");

    Headers = New Map;
    Headers.Insert("X-Header1", "Value1");
    Headers.Insert("X-Header2", "Value2");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("1111")
        .AddHeader("X-Header3", "BadValue") // <---
        .AddHeader("X-Header4", "BadValue")
        .SetHeaders(Headers, True) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    Process(Result, "HTTPClient", "AddHeader", "Replace");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("1111")
        .AddHeader("X-Header3", "BadValue") // <---
        .AddHeader("X-Header4", "BadValue")
        .SetHeaders(Headers) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    Process(Result, "HTTPClient", "AddHeader", "Addition");

EndProcedure

Procedure HTTPClient_AddBasicAuthorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBasicAuthorization("user", "password") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddBasicAuthorization");

EndProcedure

Procedure HTTPClient_AddBearerAuthorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddBearerAuthorization("123123") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddBearerAuthorization");

EndProcedure

Procedure HTTPClient_AddAWS4Authorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    AccessKey = "AccessKey";
    SecretKey = "SecretKey";
    Region    = "Region";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .AddAWS4Authorization(AccessKey, SecretKey, Region) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddAWS4Authorization");

EndProcedure

Procedure HTTPClient_AddOAuthV1Authorization(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Token       = "***";
    Secret      = "***";
    UsersKey    = "***";
    UsersSecret = "***";
    Version     = "1.0";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .AddOAuthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version) // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "AddOAuthV1Authorization");

EndProcedure

Procedure HTTPClient_SetOAuthV1Algorithm(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Token       = "***";
    Secret      = "***";
    UsersKey    = "***";
    UsersSecret = "***";
    Version     = "1.0";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .AddOAuthV1Authorization(Token, Secret, UsersKey, UsersSecret, Version)
        .SetOAuthV1Algorithm("HMAC", "SHA1") // <---
        .ProcessRequest("GET")
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "SetOAuthV1Algorithm");

EndProcedure

Procedure HTTPClient_ProcessRequest(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET") // <---
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "ProcessRequest");

EndProcedure

Procedure HTTPClient_ExecuteRequest(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ExecuteRequest() // <---
        .ReturnResponseAsJSONObject();

    // END

    Process(Result, "HTTPClient", "ExecuteRequest");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ReturnResponse(True);

    Process(Result, "HTTPClient", "ExecuteRequest", "No execution");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ExecuteRequest()
        .ReturnResponse(True);

    Process(Result, "HTTPClient", "ExecuteRequest", "Execution");

EndProcedure

Procedure HTTPClient_ReturnRequest(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ReturnRequest(); // <---

    // END

    Process(Result, "HTTPClient", "ReturnRequest");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ReturnRequest(True);

    Process(Result, "HTTPClient", "ReturnRequest", "Forced");

EndProcedure

Procedure HTTPClient_ReturnConnection(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ProcessRequest("GET", False)
        .ReturnConnection(); // <---

    // END

    Process(Result, "HTTPClient", "ReturnConnection");

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .ReturnConnection(True);

    Process(Result, "HTTPClient", "ReturnConnection", "Forced");

EndProcedure

Procedure HTTPClient_ReturnResponse(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponse(); // <---

    // END

    Process(Result, "HTTPClient", "ReturnResponse");

EndProcedure

Procedure HTTPClient_ReturnResponseAsJSONObject(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponseAsJSONObject(); // <---

    // END

    Process(Result, "HTTPClient", "ReturnResponseAsJSONObject");

EndProcedure

Procedure HTTPClient_ReturnResponseAsBinaryData(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponseAsBinaryData(); // <---

    // END

    Process(Result, "HTTPClient", "ReturnResponseAsBinaryData");

EndProcedure

Procedure HTTPClient_ReturnResponseAsString(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/post";

    Image = FunctionParameters["Picture"]; // URL, Path or Binary Data

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetBinaryBody(Image)
        .ProcessRequest("POST")
        .ReturnResponseAsString(); // <---

    // END

    Process(Result, "HTTPClient", "ReturnResponseAsString");

EndProcedure

Procedure HTTPClient_ReturnResponseFilename(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    TFN = GetTempFileName();

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize(URL)
        .SetResponseFile(TFN) // <---
        .ProcessRequest("GET")
        .ReturnResponseFilename();

    // END

    Process(Result, "HTTPClient", "ReturnResponseFilename", , TFN);

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "File deletion error", "HTTPClient");
    EndTry;

EndProcedure

Procedure HTTPClient_SetProxy(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ProxySettings = New InternetProxy;
    ProxySettings.Set("https", "proxy.com", 443, "user", "password", False);

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetProxy(ProxySettings) // <---
        .ProcessRequest("GET", False)
        .ReturnConnection();

    // END

    Process(Result, "HTTPClient", "SetProxy");

EndProcedure

Procedure HTTPClient_SetTimeout(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    Result = OPI_HTTPRequests.NewRequest()
        .Initialize()
        .SetURL(URL)
        .SetTimeout(60) // <---
        .ProcessRequest("GET", False)
        .ReturnConnection();

    // END

    Process(Result, "HTTPClient", "SetTimeout");

EndProcedure

Procedure HTTPClient_UseURLEncoding(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ParametersStructure = New Structure;
    ParametersStructure.Insert("param1", "search?text");
    ParametersStructure.Insert("param2", "John Doe");
    ParametersStructure.Insert("param3", "value&another");
    ParametersStructure.Insert("param4", "кириллица");
    ParametersStructure.Insert("param5", "<script>alert('XSS')</script>");

    NoEncoding = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .UseURLEncoding(False) // <---
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    WithEncoding = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    // END

    Result = New Map;
    Result.Insert("No encoding"   , NoEncoding);
    Result.Insert("With encoding" , WithEncoding);

    Process(Result, "HTTPClient", "UseURLEncoding");

EndProcedure

Procedure HTTPClient_SplitArraysInURL(FunctionParameters)

    URL = FunctionParameters["HTTP_URL"];
    URL = URL + "/get";

    ArrayParam = New Array;
    ArrayParam.Add("val1");
    ArrayParam.Add("val2");
    ArrayParam.Add("val3");

    ParametersStructure = New Structure("arrayfield", ArrayParam);

    Separation = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .SplitArraysInURL(True) // <---
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    SeparationPhp = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .SplitArraysInURL(True, True) // <---
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    NoSeparation = OPI_HTTPRequests.NewRequest()
        .Initialize("https://example.com/page")
        .SetURLParams(ParametersStructure)
        .ProcessRequest("GET", False)
        .ReturnRequest()
        .ResourceAddress;

    // END

    Result = New Map;
    Result.Insert("No separation", NoSeparation);
    Result.Insert("Separation"   , Separation);
    Result.Insert("PHP"          , SeparationPhp);

    Process(Result, "HTTPClient", "SplitArraysInURL");

EndProcedure

#EndRegion

#Region OpenAI

Procedure OpenAI_GetResponse(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    // Text messages

    Messages = New Array;
    Messages.Add(OPI_OpenAI.GetMessageStructure("user"     , "What is 1C:Enterprise?"));
    Messages.Add(OPI_OpenAI.GetMessageStructure("assistant", "1C:Enterprise is a full-stack, low-code platform"));
    Messages.Add(OPI_OpenAI.GetMessageStructure("user"     , "When the first version was released?"));

    Model = "smolvlm-256m-instruct";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("msgs", Messages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetResponse", Options);

    Process(Result, "OpenAI", "GetResponse"); // SKIP

    // Pictures

    Model       = "moondream2-20250414";
    File        = FunctionParameters["Picture"]; // URL, Path or Binary Data
    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "user_data";

    Messages = New Array;

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("name", FileName);
    Options.Insert("data", File);
    Options.Insert("purpose", Destination);

    ImageUpload = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "UploadFile", Options);
    ImageID     = ImageUpload["id"];

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("file", ImageID);
    Options.Insert("prompt", "What is in this image?");

    Description = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImageMessageStructure", Options);

    Messages.Add(Description);

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("msgs", Messages);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetResponse", Options);

    OPI_OpenAI.DeleteFile(URL, Token, ImageID);

    // END

    Process(Result, "OpenAI", "GetResponse", "Image");

EndProcedure

Procedure OpenAI_GetEmbeddings(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "What is 1C:Enterprise?";
    Model = "text-embedding-ada-002";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("input", Text);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetEmbeddings", Options);

    // END

    Process(Result, "OpenAI", "GetEmbeddings");

EndProcedure

Procedure OpenAI_CreateAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Instruction = "You are a personal math tutor. When asked a question, write and run Python code to answer the question.";
    Model       = "smolvlm-256m-instruct";
    Name        = "Math tutor";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("name", Name);
    Options.Insert("inst", Instruction);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "CreateAssistant", Options);

    // END

    Process(Result, "OpenAI", "CreateAssistant", , FunctionParameters);

EndProcedure

Procedure OpenAI_DeleteAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", AssistantID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "DeleteAssistant", Options);

    // END

    Process(Result, "OpenAI", "DeleteAssistant", , AssistantID);

EndProcedure

Procedure OpenAI_RetrieveAssistant(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    AssistantID = FunctionParameters["OpenAI_Assistant"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", AssistantID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "RetrieveAssistant", Options);

    // END

    Process(Result, "OpenAI", "RetrieveAssistant");

EndProcedure

Procedure OpenAI_GetAssistantsList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Count                = 2;
    AdditionalParameters = New Structure("after,order", "asst_2", "desc");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("limit", Count);
    Options.Insert("options", AdditionalParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetAssistantsList", Options);

    // END

    Process(Result, "OpenAI", "GetAssistantsList");

EndProcedure

Procedure OpenAI_UploadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    File = FunctionParameters["Picture"]; // URL, Path or Binary Data

    FileName    = StrTemplate("%1.png", String(New UUID()));
    Destination = "assistants";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("name", FileName);
    Options.Insert("data", File);
    Options.Insert("purpose", Destination);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "UploadFile", Options);

    // END

    OPI_TypeConversion.GetBinaryData(File);
    Process(Result, "OpenAI", "UploadFile", , FunctionParameters, FileName, File.Size() + 2);

EndProcedure

Procedure OpenAI_DeleteFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "DeleteFile", Options);

    // END

    Process(Result, "OpenAI", "DeleteFile", , FileID);

EndProcedure

Procedure OpenAI_GetFileInformation(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetFileInformation", Options);

    // END

    Process(Result, "OpenAI", "GetFileInformation");

EndProcedure

Procedure OpenAI_GetFilesList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetFilesList", Options);

    // END

    Process(Result, "OpenAI", "GetFilesList");

EndProcedure

Procedure OpenAI_DownloadFile(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    FileID = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("id", FileID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "DownloadFile", Options);

    // END

    Process(Result, "OpenAI", "DownloadFile", , FunctionParameters);

EndProcedure

Procedure OpenAI_GetMessageStructure(FunctionParameters)

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "What is 1C:Enterprise?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);

    // END

    Process(Result, "OpenAI", "GetMessageStructure");

EndProcedure

Procedure OpenAI_GetImageMessageStructure(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];
    Image = FunctionParameters["OpenAI_File"];

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("file", Image);
    Options.Insert("prompt", "What is in this image?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImageMessageStructure", Options);

    // END

    Process(Result, "OpenAI", "GetImageMessageStructure");

EndProcedure

Procedure OpenAI_GenerateSpeech(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Text  = "Attack ships on fire off the shoulder of Orion bright as magnesium";
    Model = "tts-1";

    AdditionalParameters = New Structure("response_format", "wav");

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("input", Text);
    Options.Insert("options", AdditionalParameters);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GenerateSpeech", Options);

    // END

    Process(Result, "OpenAI", "GenerateSpeech", , FunctionParameters);

EndProcedure

Procedure OpenAI_CreateTranscription(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Audio = FunctionParameters["OpenAI_Speech"];
    Model = "whisper-1";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("audio", Audio);
    Options.Insert("type", "audio/wav");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "CreateTranscription", Options);

    // END

    Try
        DeleteFiles(Audio);
    Except
        Message("Error deleting file after test");
    EndTry;

    Process(Result, "OpenAI", "CreateTranscription");

EndProcedure

Procedure OpenAI_GetImages(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL2"];
    Token = FunctionParameters["OpenAI_Token2"];

    Model       = "dall-e-3";
    Options = New Structure;
    Options.Insert("prompt", "Yellow alpaca");
    Options.Insert("amount", 1);
    Options.Insert("size", "1024x1024");

    Description = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImageDescriptionStructure", Options);
    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("model", Model);
    Options.Insert("descr", Description);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetImages", Options);

    // END

    Process(Result, "OpenAI", "GetImages");

EndProcedure

Procedure OpenAI_GetModelList(FunctionParameters)

    URL   = FunctionParameters["OpenAI_URL"];
    Token = FunctionParameters["OpenAI_Token"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetModelList", Options);

    // END

    Process(Result, "OpenAI", "GetModelList");

EndProcedure

Procedure OpenAI_GetAssistantMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("text", "What is 1C:Enterprise?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetAssistantMessage", Options);

    // END

    Options = New Structure;
    Options.Insert("role", "assistant");
    Options.Insert("text", "What is 1C:Enterprise?");

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    Process(Result, "OpenAI", "GetAssistantMessage", , Check);

EndProcedure

Procedure OpenAI_GetUserMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("text", "What is 1C:Enterprise?");
    Options.Insert("name", "Vitaly");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetUserMessage", Options);

    // END

    Options = New Structure;
    Options.Insert("role", "user");
    Options.Insert("text", "What is 1C:Enterprise?");
    Options.Insert("name", "Vitaly");

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    Process(Result, "OpenAI", "GetUserMessage", , Check);

EndProcedure

Procedure OpenAI_GetSystemMessage(FunctionParameters)

    Options = New Structure;
    Options.Insert("text", "What is 1C:Enterprise?");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetSystemMessage", Options);

    // END

    Options = New Structure;
    Options.Insert("role", "system");
    Options.Insert("text", "What is 1C:Enterprise?");

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("openai", "GetMessageStructure", Options);
    Check  = OPI_Tools.JSONString(Check);
    Result = OPI_Tools.JSONString(Result);

    Process(Result, "OpenAI", "GetSystemMessage", , Check);

EndProcedure

#EndRegion

#Region MSSQL

Procedure MSSQL_GenerateConnectionString(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "bayselonarrend";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // END

    Result = StrReplace(Result, Password, "***");
    Result = StrReplace(Result, Address , "127.0.0.1");

    Process(Result, "MSSQL", "GenerateConnectionString");

EndProcedure

Procedure MSSQL_CreateConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    Result = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    // END

    Process(Result, "MSSQL", "CreateConnection");

EndProcedure

Procedure MSSQL_CloseConnection(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MSSQL.CloseConnection(Connection);

    // END

    OPI_MSSQL.CloseConnection(Result);

    Process(Result, "MSSQL", "CloseConnection");

EndProcedure

Procedure MSSQL_IsConnector(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);
    Result     = OPI_MSSQL.IsConnector(Connection);

    // END

    OPI_MSSQL.CloseConnection(Result);

    Process(Result, "MSSQL", "IsConnector");

EndProcedure

Procedure MSSQL_ExecuteSQLQuery(FunctionParameters)

    CurrentDate = OPI_Tools.GetCurrentDate();
    Image       = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Connection       = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    OPI_MSSQL.DeleteTable("users"     , Connection); // SKIP
    OPI_MSSQL.DeleteTable("test_data" , Connection); // SKIP
    OPI_MSSQL.DeleteTable("test_table", Connection); // SKIP
    Process(Connection, "MSSQL", "ExecuteSQLQuery", "Connection"); // SKIP

    // CREATE

    QueryText = "
        |CREATE TABLE test_table (
        | ID INT PRIMARY KEY,
        | FirstName NVARCHAR(50),
        | LastName NVARCHAR(50),
        | BirthDate DATE,
        | IsEmployed BIT,
        | Salary DECIMAL(10, 2),
        | CreatedAt DATETIME,
        | Age SMALLINT,
        | RowGuid UNIQUEIDENTIFIER,
        | Data VARBINARY(MAX)
        |);";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    Process(Result, "MSSQL", "ExecuteSQLQuery", "Create"); // SKIP

    // INSERT with parameters

    QueryText = "
        |INSERT INTO test_table (ID, FirstName, LastName, BirthDate, IsEmployed, Salary, CreatedAt, Age, RowGuid, Data)
        |VALUES (@P1, @P2, @P3, @P4, @P5, @P6, @P7, @P8, @P9, @P10);";

    ParameterArray = New Array;
    ParameterArray.Add(New Structure("INT"     , 1));
    ParameterArray.Add(New Structure("NVARCHAR", "Vitaly"));
    ParameterArray.Add(New Structure("NVARCHAR", "Alpaca"));
    ParameterArray.Add(New Structure("DATE"    , CurrentDate));
    ParameterArray.Add(New Structure("BIT"     , True));
    ParameterArray.Add(New Structure("DECIMAL" , 10.30));
    ParameterArray.Add(New Structure("DATETIME", CurrentDate));
    ParameterArray.Add(New Structure("SMALLINT", 20));
    ParameterArray.Add(New Structure("UUID"    , New UUID));
    ParameterArray.Add(New Structure("BYTES"   , Image));

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("params", ParameterArray);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    Process(Result, "MSSQL", "ExecuteSQLQuery", "Insert"); // SKIP

    // SELECT (The result of this query is shown in the Result block)

    QueryText = "SELECT FirstName, LastName, BirthDate, IsEmployed, Salary, CreatedAt, Age, RowGuid, Data FROM test_table;";

    Options = New Structure;
    Options.Insert("sql", QueryText);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    Process(Result, "MSSQL", "ExecuteSQLQuery", , Image); // SKIP

    QueryText = "create table test_data (id INT,first_name NVARCHAR(50),last_name NVARCHAR(50),email NVARCHAR(50),gender NVARCHAR(50),ip_address NVARCHAR(20));"; // SKIP
    Result    = OPI_MSSQL.ExecuteSQLQuery(QueryText, , , Connection); // SKIP
    Process(Result, "MSSQL", "ExecuteSQLQuery", "Test data"); // SKIP

    // SQL query from file

    SQLFile = FunctionParameters["SQL2"]; // Binary Data, URL or path to file

    Options = New Structure;
    Options.Insert("sql", SQLFile);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ExecuteSQLQuery", Options);

    Process(Result, "MSSQL", "ExecuteSQLQuery", "File"); // SKIP

    Closing = OPI_MSSQL.CloseConnection(Connection);

    // END

    Process(Closing, "MSSQL", "ExecuteSQLQuery", "Request"); // SKIP

EndProcedure

Procedure MSSQL_GetTLSSettings(FunctionParameters)

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);

    // END

    Process(Result, "MSSQL", "GetTLSSettings");

EndProcedure

Procedure MSSQL_CreateDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Base = "testbase1";

    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateDatabase", Options);

    // END

    Process(Result, "MSSQL", "CreateDatabase");

    Base = "testbase2";
    OPI_MSSQL.DeleteDatabase(Base, ConnectionString, TLSSettings);

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MSSQL", "CreateDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateDatabase", Options);

    Process(Result, "MSSQL", "CreateDatabase", "Creation");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateDatabase", Options);

    Process(Result, "MSSQL", "CreateDatabase", "Existing");

    OPI_MSSQL.CloseConnection(Connection);

EndProcedure

Procedure MSSQL_CreateTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "testtable";

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("tinyint_field"  , "tinyint");
    ColoumnsStruct.Insert("smallint_field" , "smallint");
    ColoumnsStruct.Insert("int_field"      , "int");
    ColoumnsStruct.Insert("bigint_field"   , "bigint");
    ColoumnsStruct.Insert("float24_field"  , "float(24)");
    ColoumnsStruct.Insert("float53_field"  , "float(53)");
    ColoumnsStruct.Insert("bit_field"      , "bit");
    ColoumnsStruct.Insert("nvarchar_field" , "nvarchar(4000)");
    ColoumnsStruct.Insert("varbinary_field", "varbinary(max)");
    ColoumnsStruct.Insert("uid_field"      , "uniqueidentifier");
    ColoumnsStruct.Insert("numeric_field"  , "numeric(5,3)"); // Or decimal
    ColoumnsStruct.Insert("xml_field"      , "xml");
    ColoumnsStruct.Insert("date_field"     , "date");
    ColoumnsStruct.Insert("time_field"     , "time");
    ColoumnsStruct.Insert("dto_field"      , "datetimeoffset");
    ColoumnsStruct.Insert("datetime_field" , "datetime");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateTable", Options);

    // END

    Process(Result, "MSSQL", "CreateTable");

    Table = "ABC DEF";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateTable", Options);

    Process(Result, "MSSQL", "CreateTable", "Name error");

    Table = "somename";
    ColoumnsStruct.Insert("wtf_field", "WTF");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "CreateTable", Options);

    Process(Result, "MSSQL", "CreateTable", "Type error");

EndProcedure

Procedure MSSQL_AddRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table        = "testtable";
    RecordsArray = New Array;

    Image = FunctionParameters["Picture"];
    OPI_TypeConversion.GetBinaryData(Image); // Image - Type: BinaryData

    XML = "<?xml version=""1.0""?>
        |<root>
        | <element>
        | <name>Example</name>
        | <value>123</value>
        | </element>
        | <element>
        | <name>Test</name>
        | <value>456</value>
        | </element>
        |</root>";

    CurrentDate   = OPI_Tools.GetCurrentDate();
    CurrentDateTZ = OPI_Tools.DateRFC3339(CurrentDate, "+05:00");

    RecordStructure = New Structure;
    RecordStructure.Insert("tinyint_field"  , New Structure("TINYINT"       , 5));
    RecordStructure.Insert("smallint_field" , New Structure("SMALLINT"      , 2000));
    RecordStructure.Insert("int_field"      , New Structure("INT"           , 200000));
    RecordStructure.Insert("bigint_field"   , New Structure("BIGINT"        , 20000000000));
    RecordStructure.Insert("float24_field"  , New Structure("FLOAT24"       , 10.1234567));
    RecordStructure.Insert("float53_field"  , New Structure("FLOAT53"       , 10.123456789123456));
    RecordStructure.Insert("bit_field"      , New Structure("BIT"           , True));
    RecordStructure.Insert("nvarchar_field" , New Structure("NVARCHAR"      , "Some text"));
    RecordStructure.Insert("varbinary_field", New Structure("BYTES"         , Image));
    RecordStructure.Insert("uid_field"      , New Structure("UUID"          , New UUID));
    RecordStructure.Insert("numeric_field"  , New Structure("NUMERIC"       , 5.333));
    RecordStructure.Insert("xml_field"      , New Structure("XML"           , XML));
    RecordStructure.Insert("date_field"     , New Structure("DATE"          , CurrentDate));
    RecordStructure.Insert("time_field"     , New Structure("TIME"          , CurrentDate));
    RecordStructure.Insert("dto_field"      , New Structure("DATETIMEOFFSET", CurrentDateTZ));
    RecordStructure.Insert("datetime_field" , New Structure("DATETIME"      , CurrentDate));

    RecordsArray.Add(RecordStructure);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("rows", RecordsArray);
    Options.Insert("trn", Истина);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "AddRecords", Options);

    // END

    Process(Result, "MSSQL", "AddRecords");

EndProcedure

Procedure MSSQL_GetRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // All records without filters

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    Process(Result, "MSSQL", "GetRecords"); // SKIP

    // Filter, selected fields, limit and sorting

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", "test_data");
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

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
    Options.Insert("table", Table);
    Options.Insert("fields", Fields);
    Options.Insert("filter", Filters);
    Options.Insert("order", Sort);
    Options.Insert("limit", Count);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    // END

    Process(Result, "MSSQL", "GetRecords", "Filters");

EndProcedure

Procedure MSSQL_UpdateRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "test_data";

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ip_address", New Structure("VARCHAR", "127.0.0.1"));

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("NVARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);

    Filters.Add(FilterStructure);

    Count = OPI_MSSQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP
    Process(Count, "MSSQL", "UpdateRecords", "Count"); // SKIP
    Count = Count["data"].Count(); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("values", FieldsStructure);
    Options.Insert("filter", FilterStructure);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "UpdateRecords", Options);

    // END

    Process(Result, "MSSQL", "UpdateRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("fields", "['ip_address']");
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    Process(Check, "MSSQL", "UpdateRecords", "Check", Count, FieldsStructure);

EndProcedure

Procedure MSSQL_DeleteRecords(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "test_data";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "test_data";

    Filters = New Array;

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "gender");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("NVARCHAR", "Male"));
    FilterStructure.Insert("raw"  , False);
    FilterStructure.Insert("union", "AND");

    Filters.Add(FilterStructure);

    FilterStructure = New Structure;

    FilterStructure.Insert("field", "ip_address");
    FilterStructure.Insert("type" , "=");
    FilterStructure.Insert("value", New Structure("NVARCHAR", "127.0.0.1"));
    FilterStructure.Insert("raw"  , False);

    Obtaining = OPI_MSSQL.GetRecords(Table, , Filters, , , ConnectionString, TLSSettings); // SKIP

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("filter", Filters);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteRecords", Options);

    // END

    Process(Obtaining, "MSSQL", "DeleteRecords", "Obtaining");

    Count   = Obtaining["data"].Count();
    Residue = 100 - Count;

    Process(Result, "MSSQL", "DeleteRecords");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    Process(Result, "MSSQL", "DeleteRecords", "Check", Residue);

EndProcedure

Procedure MSSQL_DeleteTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteTable", Options);

    // END

    Process(Result, "MSSQL", "DeleteTable");

    Base  = "test_data";
    Table = "test_data";

    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteTable", Options);

    Process(Result, "MSSQL", "DeleteTable", "Test");

EndProcedure

Procedure MSSQL_DeleteDatabase(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Base = "testbase1";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    // END

    Process(Result, "MSSQL", "DeleteDatabase");

    Base = "testbase2";

    Connection = OPI_MSSQL.CreateConnection(ConnectionString, TLSSettings);

    Process(Connection, "MSSQL", "DeleteDatabase", "Openning");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    Process(Result, "MSSQL", "DeleteDatabase", "Deletion");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    Process(Result, "MSSQL", "DeleteDatabase", "Error");

    Closing = OPI_MSSQL.CloseConnection(Connection);

    Process(Closing, "MSSQL", "DeleteDatabase", "Closing");

    Options = New Structure;
    Options.Insert("base", Base);
    Options.Insert("dbc", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteDatabase", Options);

    Process(Result, "MSSQL", "DeleteDatabase", "Connection error");

EndProcedure

Procedure MSSQL_ClearTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "ClearTable", Options);

    // END

    Process(Result, "MSSQL", "ClearTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecords", Options);

    Process(Result, "MSSQL", "ClearTable", "Check");

EndProcedure

Procedure MSSQL_GetTableInformation(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];
    Base     = "testbase1";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    Table = "testtable";

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    // END

    Process(Result, "MSSQL", "GetTableInformation");

    Table = "heyho";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    Process(Result, "MSSQL", "GetTableInformation", "Error");

EndProcedure

Procedure MSSQL_AddTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base     = "testbase1";
    Table    = "testtable";
    Name     = "new_field";
    DataType = "bigint";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("type", DataType);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "AddTableColumn", Options);

    // END

    Process(Result, "MSSQL", "AddTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    Process(Result, "MSSQL", "AddTableColumn", "Check");

EndProcedure

Procedure MSSQL_DeleteTableColumn(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";
    Name  = "new_field";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("name", Name);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "DeleteTableColumn", Options);

    // END

    Process(Result, "MSSQL", "DeleteTableColumn");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    Process(Result, "MSSQL", "DeleteTableColumn", "Check");

EndProcedure

Procedure MSSQL_EnsureTable(FunctionParameters)

    Address  = FunctionParameters["PG_IP"];
    Login    = "SA";
    Password = FunctionParameters["PG_Password"];

    Base  = "testbase1";
    Table = "testtable";

    Options = New Structure;
    Options.Insert("trust", Истина);

    TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTLSSettings", Options);
    Options = New Structure;
    Options.Insert("addr", Address);
    Options.Insert("db", Base);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    ConnectionString = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GenerateConnectionString", Options);

    ColoumnsStruct = New Structure;
    ColoumnsStruct.Insert("smallint_field" , "smallint");
    ColoumnsStruct.Insert("double_field"   , "real");
    ColoumnsStruct.Insert("bigint_field"   , "bigint");
    ColoumnsStruct.Insert("custom_field"   , "nvarchar");

    // When using the connection string, a new connection is initialised,
    // which will be closed after the function is executed.
    // If several operations are performed, it is desirable to use one connection,
    // previously created by the CreateConnection function()
    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "EnsureTable", Options);

    // END

    Process(Result, "MSSQL", "EnsureTable");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    Process(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

    Table = "test_new";

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("cols", ColoumnsStruct);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "EnsureTable", Options);

    Process(Result, "MSSQL", "EnsureTable", "New");

    Options = New Structure;
    Options.Insert("table", Table);
    Options.Insert("dbc", ConnectionString);
    Options.Insert("tls", TLSSettings);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetTableInformation", Options);

    Process(Check, "MSSQL", "EnsureTable", "Check", ColoumnsStruct);

EndProcedure

Procedure MSSQL_GetRecordsFilterStrucutre(FunctionParameters)

    Options = New Structure;

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecordsFilterStrucutre", Options);

    // END

    Process(Result, "MSSQL", "GetRecordsFilterStrucutre");

    Options = New Structure;
    Options.Insert("empty", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("mssql", "GetRecordsFilterStrucutre", Options);

    Process(Result, "MSSQL", "GetRecordsFilterStrucutre", "Clear");

EndProcedure

#EndRegion

#Region FTP

Procedure FTP_CreateConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Result = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    // END

    Process(Result, "FTP", "CreateConnection", Postfix);

EndProcedure

Procedure FTP_GetWelcomeMessage(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetWelcomeMessage", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "GetWelcomeMessage", Postfix);

EndProcedure

Procedure FTP_GetConnectionConfiguration(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Options = New Structure;
    Options.Insert("set", FTPSettings);
    Options.Insert("proxy", ProxySettings);
    Options.Insert("tls", TLSSettings);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionConfiguration", Options);

    // END

    Process(Result, "FTP", "GetConnectionConfiguration", Postfix, FunctionParameters);

    Options = New Structure;
    Options.Insert("conn", Result);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetWelcomeMessage", Options);

    Process(Check, "FTP", "GetConnectionConfiguration", "Check, " + Postfix);

EndProcedure

Procedure FTP_CloseConnection(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    Process(Connection, "FTP", "CloseConnection", "Openning, " + Postfix); // SKIP

    Result = OPI_FTP.CloseConnection(Connection);

    // END

    Process(Result, "FTP", "CloseConnection", Postfix);

EndProcedure

Procedure FTP_IsConnector(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    Process(Connection, "FTP", "IsConnector", "Openning, " + Postfix); // SKIP

    Result = OPI_FTP.IsConnector(Connection);

    // END

    Process(Result, "FTP", "IsConnector", Postfix);

EndProcedure

Procedure FTP_GetConnectionSettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    // END

    Process(Result, "FTP", "GetConnectionSettings", Postfix);

EndProcedure

Procedure FTP_GetProxySettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

    ProxyAddress  = FunctionParameters["Proxy_IP"];
    ProxyPort     = FunctionParameters["Proxy_Port"];
    ProxyLogin    = FunctionParameters["Proxy_User"];
    ProxyPassword = FunctionParameters["Proxy_Password"];

    Options = New Structure;
    Options.Insert("addr", ProxyAddress);
    Options.Insert("port", ProxyPort);
    Options.Insert("type", ProxyType);
    Options.Insert("login", ProxyLogin);
    Options.Insert("pass", ProxyPassword);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    // END

    Process(Result, "FTP", "GetProxySettings", Postfix);

EndProcedure

Procedure FTP_GetTLSSettings(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Options = New Structure;
    Options.Insert("trust", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);

    // END

    Process(Result, "FTP", "GetTLSSettings", Postfix);

EndProcedure

Procedure FTP_CreateNewDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Deletion = OPI_FTP.DeleteDirectory(Connection, "new_dir"); // SKIP
        Process(Deletion, "FTP", "CreateNewDirectory", "Deletion, " + Postfix); // SKIP

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "CreateNewDirectory", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "CreateNewDirectory", Postfix, True);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/another_one");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "CreateNewDirectory", Options);

    Process(Result, "FTP", "CreateNewDirectory", "Nested, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "second_dir/another_one");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "CreateNewDirectory", Options);

    Process(Result, "FTP", "CreateNewDirectory", "Double, " + Postfix);

    OPI_Tools.Pause(5);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir");
    Options.Insert("rcv", Истина);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    Process(Check, "FTP", "CreateNewDirectory", "Check 1, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "");
    Options.Insert("rcv", Истина);

    Check = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    Process(Check, "FTP", "CreateNewDirectory", "Check 2, " + Postfix);

EndProcedure

Procedure FTP_ListObjects(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "");
        Options.Insert("rcv", Истина);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "ListObjects", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "Dir1/Dir3/Git-2.50.0-64-bit.exe");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    Process(Result, "FTP", "ListObjects", "File, " + Postfix);

EndProcedure

Procedure FTP_UploadFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    ImagePath = "C:\pic.png";

    Image = FunctionParameters["Picture"]; // SKIP
    TFN   = GetTempFileName("png"); // SKIP
    CopyFile(Image, TFN); // SKIP
    Image = TFN; // SKIP

    ImageDD = New BinaryData(Image);

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);
    Options.Insert("rtout", 1000);
    Options.Insert("wtout", 1000);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("file", Image);
        Options.Insert("path", "new_dir/pic_from_disk.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UploadFile", Options);
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("file", ImageDD);
        Options.Insert("path", "pic_from_binary.png");

        Result2 = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UploadFile", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "UploadFile", Postfix             , ImageDD.Size());
    Process(Result2, "FTP", "UploadFile", "Binary, " + Postfix, ImageDD.Size());

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/pic_from_disk.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);
    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "pic_from_binary.png");

    Result2 = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    Process(Result , "FTP", "UploadFile", "Size 1, " + Postfix, ImageDD.Size());
    Process(Result2, "FTP", "UploadFile", "Size 2, " + Postfix, ImageDD.Size());

    For N = 1 To 7 Do

        Result  = OPI_FTP.UploadFile(Connection, Image, "new_dir/pic_from_disk.png");
        Result2 = OPI_FTP.UploadFile(Connection, ImageDD, "pic_from_binary.png");

        If Not Result["result"] Then
            Process(Result, "FTP", "UploadFile", "Multiple, " + Postfix, ImageDD.Size());
        EndIf;

        If Not Result2["result"] Then
            Process(Result2, "FTP", "UploadFile", "Multiple, binary, " + Postfix, ImageDD.Size());
        EndIf;

    EndDo;

    BigData = OPI_HTTPRequests.Get(FunctionParameters["Big"]);
    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("file", BigData);
    Options.Insert("path", "new_dir/big.bin");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UploadFile", Options);

    Process(Result, "FTP", "UploadFile", "Big, " + Postfix, BigData.Size());

    Try
        DeleteFiles(TFN);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Error deleting a picture file", "FTP");
    EndTry;

EndProcedure

Procedure FTP_DeleteFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "pic_from_binary.png");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "DeleteFile", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "DeleteFile", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "pic_from_binary.png");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "DeleteFile", Options);

    Process(Result , "FTP", "DeleteFile", "Nonexistent, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    Process(Result , "FTP", "DeleteFile", "Check, " + Postfix);

EndProcedure

Procedure FTP_DeleteDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir/another_one");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "DeleteDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "DeleteDirectory", Postfix);

EndProcedure

Procedure FTP_ClearDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", ".");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ClearDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "ClearDirectory", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", ".");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    Process(Result , "FTP", "ClearDirectory", "Check, " + Postfix);

EndProcedure

Procedure FTP_GetObjectSize(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", "new_dir/big.bin");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "GetObjectSize", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/another.bin");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    Process(Result , "FTP", "GetObjectSize", "Nonexistent, " + Postfix);

EndProcedure

Procedure FTP_UpdatePath(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("old", "new_dir/big.bin");
        Options.Insert("new", "new_dir/giant.bin");

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result , "FTP", "UpdatePath", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/giant.bin");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    Process(Result , "FTP", "UpdatePath", "Check, new, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", "new_dir/big.bin");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    Process(Result , "FTP", "UpdatePath", "Check, old, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("old", "new_dir");
    Options.Insert("new", "brand_new_dir");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);

    Process(Result , "FTP", "UpdatePath", "Directory, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", ".");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    Process(Result , "FTP", "UpdatePath", "List, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("old", "brand_new_dir");
    Options.Insert("new", "new_dir");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);

    Process(Result , "FTP", "UpdatePath", "Directory, back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("old", "new_dir/giant.bin");
    Options.Insert("new", "new_dir/big.bin");

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "UpdatePath", Options);

    Process(Result , "FTP", "UpdatePath", "Back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", ".");
    Options.Insert("rcv", Истина);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ListObjects", Options);

    Process(Result , "FTP", "UpdatePath", "List, back, " + Postfix);

EndProcedure

Procedure FTP_SaveFile(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Path     = "new_dir/big.bin";
        FileName = GetTempFileName("bin");

        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("path", Path);
        Options.Insert("file", FileName);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "SaveFile", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "SaveFile", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", Path);

    Size = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    Process(Size, "FTP", "SaveFile", "Size, " + Postfix);

    FileObject = New File(FileName);

    FileSize   = FileObject.Size();
    ResultSize = Result["bytes"];
    CheckSize  = Size["bytes"];

    Process(FileSize, "FTP", "SaveFile", "File size, " + Postfix, ResultSize, CheckSize);

    Path = "new_dir/pic_from_disk.png";

    For N = 1 To 20 Do

        Result = OPI_FTP.SaveFile(Connection, Path, FileName);

        If Not Result["result"] Then
            Process(FileSize, "FTP", "SaveFile", "Multiple, " + Postfix);
        EndIf;

    EndDo;

    Try
        DeleteFiles(FileName);
    Except
        OPI_TestDataRetrieval.LogServiceInformation(ErrorDescription(), "Error deleting a picture file", "FTP");
    EndTry;

EndProcedure

Procedure FTP_GetFileData(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        Path   = "new_dir/big.bin";
        Result = OPI_FTP.GetFileData(Connection, Path);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "GetFileData", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);
    Options.Insert("path", Path);

    Size = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetObjectSize", Options);

    Process(Size, "FTP", "GetFileData", "Size, " + Postfix);

    FileSize  = Result.Size();
    CheckSize = Size["bytes"];

    Process(FileSize, "FTP", "GetFileData", "File size, " + Postfix, CheckSize);

    Path = "new_dir/pic_from_disk.png";

    For N = 1 To 20 Do

        Result = OPI_FTP.GetFileData(Connection, Path);

        If Not TypeOf(Result) = Type("BinaryData") Then
            Process(Size, "FTP", "GetFileData", "Multiple, " + Postfix);
        EndIf;

    EndDo;

EndProcedure

Procedure FTP_Ping(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "Ping", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "Ping", Postfix);

EndProcedure

Procedure FTP_ExecuteCustomCommand(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "UMASK";
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("cmd", CommandText);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ExecuteCustomCommand", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "ExecuteCustomCommand", Postfix);

EndProcedure

Procedure FTP_ExecuteArbitraryCommand(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then

        CommandText = "PWD";
        Options = New Structure;
        Options.Insert("conn", Connection);
        Options.Insert("cmd", CommandText);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "ExecuteArbitraryCommand", Options);

    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "ExecuteArbitraryCommand", Postfix);

EndProcedure

Procedure FTP_GetCurrentDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetCurrentDirectory", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "GetCurrentDirectory", Postfix, FunctionParameters);

EndProcedure

Procedure FTP_ChangeCurrentDirectory(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Path   = "new_dir";
        Result = OPI_FTP.ChangeCurrentDirectory(Connection, Path);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "ChangeCurrentDirectory", Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetCurrentDirectory", Options);

    Process(Result, "FTP", "ChangeCurrentDirectory", "Check, " + Postfix, Path);

    Path   = FunctionParameters["FTP_RootPath"];
    Result = OPI_FTP.ChangeCurrentDirectory(Connection, Path);

    Process(Result, "FTP", "ChangeCurrentDirectory", "Back, " + Postfix);

    Options = New Structure;
    Options.Insert("conn", Connection);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetCurrentDirectory", Options);

    Process(Result, "FTP", "ChangeCurrentDirectory", "Check, back, " + Postfix, Path);

EndProcedure

Procedure FTP_GetProtocolFeatureList(FunctionParameters)

    Postfix = FunctionParameters["Postfix"]; // SKIP

    Host     = FunctionParameters["FTP_IP"];
    Port     = FunctionParameters["FTP_Port"];
    Login    = FunctionParameters["FTP_User"];
    Password = FunctionParameters["FTP_Password"];

    UseProxy = True;
    FTPS     = True;

    ProxySettings = Undefined;
    TLSSettings   = Undefined; // FTPS

    UseProxy = FunctionParameters["Proxy"]; // SKIP
    FTPS     = FunctionParameters["TLS"]; // SKIP

    Options = New Structure;
    Options.Insert("host", Host);
    Options.Insert("port", Port);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    FTPSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetConnectionSettings", Options);

    If UseProxy Then

        ProxyType = FunctionParameters["Proxy_Type"]; // http, socks5, socks4

        ProxyAddress  = FunctionParameters["Proxy_IP"];
        ProxyPort     = FunctionParameters["Proxy_Port"];
        ProxyLogin    = FunctionParameters["Proxy_User"];
        ProxyPassword = FunctionParameters["Proxy_Password"];

        Options = New Structure;
        Options.Insert("addr", ProxyAddress);
        Options.Insert("port", ProxyPort);
        Options.Insert("type", ProxyType);
        Options.Insert("login", ProxyLogin);
        Options.Insert("pass", ProxyPassword);

        ProxySettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProxySettings", Options);

    EndIf;

    If FTPS Then
        Options = New Structure;
        Options.Insert("trust", Истина);

        TLSSettings = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetTLSSettings", Options);
    EndIf;

    Connection = OPI_FTP.CreateConnection(FTPSettings, ProxySettings, TLSSettings);

    If OPI_FTP.IsConnector(Connection) Then
        Options = New Structure;
        Options.Insert("conn", Connection);

        Result = OPI_TestDataRetrieval.ExecuteTestCLI("ftp", "GetProtocolFeatureList", Options);
    Else
        Result = Connection; // Error of connection
    EndIf;

    // END

    Process(Result, "FTP", "GetProtocolFeatureList", Postfix);

EndProcedure

#EndRegion

#Region ReportPortal

Procedure ReportPortal_GetTemporaryToken(FunctionParameters)

    URL      = FunctionParameters["RPortal_URL"];
    Login    = FunctionParameters["RPortal_Login"];
    Password = FunctionParameters["RPortal_Password"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("login", Login);
    Options.Insert("pass", Password);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rportal", "GetTemporaryToken", Options);

    // END

    Process(Result, "ReportPortal", "GetTemporaryToken", , FunctionParameters);

EndProcedure

Procedure ReportPortal_GetPermanentToken(FunctionParameters)

    URL     = FunctionParameters["RPortal_URL"];
    Token   = FunctionParameters["RPortal_TempToken"];
    UserID  = FunctionParameters["RPortal_UserID"];
    KeyName = "test_key";

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("user", UserID);
    Options.Insert("name", KeyName);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rportal", "GetPermanentToken", Options);

    // END

    Process(Result, "ReportPortal", "GetPermanentToken", , FunctionParameters);

EndProcedure

Procedure ReportPortal_DeletePermanentToken(FunctionParameters)

    URL    = FunctionParameters["RPortal_URL"];
    Token  = FunctionParameters["RPortal_TestApiKey"];
    UserID = FunctionParameters["RPortal_UserID"];
    KeyID  = FunctionParameters["RPortal_TestKeyID"];

    Options = New Structure;
    Options.Insert("url", URL);
    Options.Insert("token", Token);
    Options.Insert("user", UserID);
    Options.Insert("id", KeyID);

    Result = OPI_TestDataRetrieval.ExecuteTestCLI("rportal", "DeletePermanentToken", Options);

    // END

    Process(Result, "ReportPortal", "DeletePermanentToken");

EndProcedure

#EndRegion

#EndRegion

#EndRegion
