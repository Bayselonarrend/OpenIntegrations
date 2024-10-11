// OneScript: ./OInt/tests/Modules/internal/OPI_Tests.os

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

// For YAxUnit

Procedure ИсполняемыеСценарии() Export

    OPI_TestDataRetrieval.FormYAXTests();

EndProcedure

// For Asserts

Function ПолучитьСписокТестов(UnitTesting) Export

   Return OPI_TestDataRetrieval.FormAssertsTests();

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
    Telegram_FormKeyboardFromButtonArray(TestParameters);

EndProcedure

Procedure TelegramAPI_SendImage() Export

    TestParameters = New Structure;
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"   , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("String"            , TestParameters);
     OPI_TestDataRetrieval.ParameterToCollection("Picture"           , TestParameters);

    Telegram_SendPicture(TestParameters);
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
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"     , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChatID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID" , TestParameters);

    Telegram_Ban(TestParameters);
    Telegram_Unban(TestParameters);

EndProcedure

Procedure TelegramAPI_CreateInvitationLink() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_Token"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Telegram_ChannelID", TestParameters);

    Telegram_CreateInviteLink(TestParameters);

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
    Telegram_ClearPinnedMessagesList(TestParameters);
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

    Telegram_ChangeMainTopicName(TestParameters);

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
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Video"   , TestParameters);

    VK_CreateCompositePost(TestParameters);

EndProcedure

Procedure VKAPI_CreatePoll() Export

    VK_CreatePoll();

EndProcedure

Procedure VKAPI_SaveDeleteImage() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    VK_CreateAlbum(TestParameters);
    VK_SavePictureToAlbum(TestParameters);
    VK_DeleteImage(TestParameters);
    VK_DeleteAlbum(TestParameters);
    VK_UploadPhotoToServer(TestParameters);

EndProcedure

Procedure VKAPI_CreateStory() Export

    TestParameters = New Map;
    OPI_TestDataRetrieval.ParameterToCollection("Picture" , TestParameters);

    VK_CreateStory(TestParameters);

EndProcedure

Procedure VKAPI_DiscussionMethods() Export

    TestParameters = New Structure;
    Parameters     = GetVKParameters();

    VK_CreateDiscussion(TestParameters);
    VK_CloseDiscussion(TestParameters);
    VK_OpenDiscussion(TestParameters);
    VK_PostToDiscussion(TestParameters);

    OPI_VK.CloseDiscussion(TestParameters["VK_ConvID"], True, Parameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_LikeRepostComment() Export

    TestParameters = New Structure();
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

    TestParameters = New Structure();

    VK_GetStatistics(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_GetPostStatistics() Export

    TestParameters = New Structure();

    VK_GetPostStatistics(TestParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKAPI_CreateAdCampaign() Export

    Parameters = GetVKParameters();
    Text       = "Post from autotest";

    Result = OPI_VK.CreatePost(Text, New Array, , , Parameters);
    PostID = Result["response"]["post_id"];

    OPI_TestDataRetrieval.WriteParameter("VK_PostID", PostID);

    TestParameters = New Structure();
    OPI_TestDataRetrieval.ParameterToCollection("VK_AdsCabinetID", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VK_PostID"      , TestParameters);

    VK_CreateAdCampaign(TestParameters);
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
    VK_RemoveProductFromCollection(TestParameters);
    VK_DeleteProduct(TestParameters);
    VK_DeleteCollection(TestParameters);

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

    YandexDisk_GetDiskInfo(TestParameters);

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

    Viber_GetChannelInformation(TestParameters);
    Viber_GetUserData(TestParameters);
    Viber_GetOnlineUsers(TestParameters);
    Viber_SetWebhook(TestParameters);

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
    Viber_SendTextMessage(TestParameters);
    Viber_SendImage(TestParameters);
    Viber_SendFile(TestParameters);
    Viber_SendContact(TestParameters);
    Viber_SendLocation(TestParameters);
    Viber_SendLink(TestParameters);

EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure GW_Auth() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientID"    , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_ClientSecret", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Code"        , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Google_Refresh"     , TestParameters);

    GoogleWorkspace_FormCodeRetrievalLink(TestParameters);
    GoogleWorkspace_GetTokenByCode(TestParameters);
    GoogleWorkspace_RefreshToken(TestParameters);

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
    OPI_TestDataRetrieval.ParameterToCollection("Google_Token" , TestParameters);

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
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User"  , TestParameters);

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
    OPI_TestDataRetrieval.ParameterToCollection("Slack_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Slack_User"  , TestParameters);

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
    Airtable_DeletePosts(TestParameters);

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

    Dropbox_UpdateToken(TestParameters);

EndProcedure

Procedure DropboxAPI_UploadFile() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Dropbox_Token", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"      , TestParameters);

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

    Dropbox_GetFolderFileList(TestParameters);

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

Procedure B24_TokenManagment() Export

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

Procedure B24_PostsManagment() Export

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

Procedure B24_TaskManagment() Export

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

Procedure B24_CommentsManagment() Export

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

Procedure B24_ChatManagment() Export

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

Procedure B24_NotificationsManagment() Export

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

Procedure B24_TasksFieldsManagment() Export

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

Procedure B24_DepartmentsManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_URL"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Domain", TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Bitrix24_Token" , TestParameters);

    Bitrix24_CreateDepartment(TestParameters);
    Bitrix24_GetDepartments(TestParameters);
    Bitrix24_UpdateDepartment(TestParameters);
    Bitrix24_DeleteDepartment(TestParameters);

EndProcedure

Procedure B2_UsersManagment() Export

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

Procedure B24_LeadsManagment() Export

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

Procedure B24_DealsManagment() Export

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

Procedure VKT_ChatManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_Token"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("VkTeams_ChatID2" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture3"        , TestParameters);

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
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    Ozon_GetCategoriesAndProductTypesTree(TestParameters);
    Ozon_GetCategoryAttributes(TestParameters);
    Ozon_GetAttributeValues(TestParameters);
    Ozon_SearchAttributeValue(TestParameters);
    Ozon_GetProductsRequestsLimits(TestParameters);

EndProcedure

Procedure OzonAPI_UploadingAndUpdatingProducts() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"       , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2"      , TestParameters);

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
    Ozon_GetCodesUploadStatus(TestParameters);
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

Procedure OzonAPI_WarehousesManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    Ozon_GetWarehousesList(TestParameters);

EndProcedure

Procedure OzonAPI_PromotionsManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ClientID" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Ozon_ApiKey"   , TestParameters);

    Ozon_GetPromotionsList(TestParameters);
    Ozon_GetCurrentPromoProducts(TestParameters);
    Ozon_GetAvailablePromoProducts(TestParameters);

EndProcedure

#EndRegion

#Region Neocities

Procedure NC_FilesManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("NC_Token" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Picture2" , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("Gif"      , TestParameters);

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
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Account"  , TestParameters);
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Password" , TestParameters);

    CDEK_GetToken(TestParameters);

EndProcedure

Procedure CDEKAPI_OrdersManagment() Export

    TestParameters = New Structure;
    OPI_TestDataRetrieval.ParameterToCollection("CDEK_Token" , TestParameters);

    CDEK_GetOrderDescription(TestParameters);
    CDEK_CreateOrder(TestParameters);
    CDEK_GetOrder(TestParameters);
    CDEK_GetOrderByNumber(TestParameters);
    CDEK_UpdateOrder(TestParameters);
    CDEK_CreateCustomerRefund(TestParameters);
    CDEK_CreateRefusal(TestParameters);
    CDEK_DeleteOrder(TestParameters);

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

Procedure Telegram_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetBotInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetBotInformation", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramBotInformation(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_GetUpdates(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetUpdates(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUpdates", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramArray(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    URL   = FunctionParameters["Telegram_URL"];

    Result = OPI_Telegram.SetWebhook(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetWebhook", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramWebhookSetup(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DeleteWebhook(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.DeleteWebhook(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteWebhook", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramWebhookDeletion(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendTextMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text); // SKIP

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (channel)");

    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text);

    MessageID = OPI_Tools.NumberToString(Result["result"]["message_id"]);
    OPI_TestDataRetrieval.WriteParameter("Telegram_ChannelMessageID", MessageID);

    Text = "<b>Text html %F0%9F%93%9E 10%</b>";

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "HTML");

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (HTML)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    Text = "%F0%9F%A4%BC";

    Result = OPI_Telegram.SendTextMessage(Token, ChatID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (emoji)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    Text = "Text %F0%9F%A5%9D and emoji \(10%\)";

    Result = OPI_Telegram.SendTextMessage(Token, ChannelID, Text, , "MarkdownV2");

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (text and emoji)");

    OPI_TestDataRetrieval.Check_TelegramOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_FormKeyboardFromButtonArray(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button1");
    ButtonArray.Add("Button2");
    ButtonArray.Add("Button3");

    Result = OPI_Telegram.FormKeyboardFromButtonArray(ButtonArray);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "FormKeyboardFromButtonArray", "Telegram");
    OPI_TestDataRetrieval.Check_String(Result);

EndProcedure

Procedure Telegram_SendPicture(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Text      = FunctionParameters["String"];
    Image     = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    FileCopy(Image, ImagePath);

    ImageDD = New BinaryData(ImagePath);

    Result = OPI_Telegram.SendImage(Token, ChatID, Text, Image);

    OPI_TestDataRetrieval.WriteLog(Result, "SendImage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramImage(Result, Text); // SKIP

    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImagePath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendPicture (Path)");

    OPI_TestDataRetrieval.Check_TelegramImage(Result, Text); // SKIP

    Result = OPI_Telegram.SendImage(Token, ChannelID, Text, ImageDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendPicture (DD)");

    OPI_TestDataRetrieval.Check_TelegramImage(Result, Text);

    DeleteFiles(ImagePath);

    FileID = Result["result"]["photo"][0]["file_id"];
    OPI_TestDataRetrieval.WriteParameter("Telegram_FileID", FileID);

    FunctionParameters.Insert("Telegram_FileID", FileID);

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

    Result = OPI_Telegram.SendVideo(Token, ChatID, Text, Video);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVideo", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramVideo(Result, Text); // SKIP

    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVideo (Path)");

    OPI_TestDataRetrieval.Check_TelegramVideo(Result, Text); // SKIP

    Result = OPI_Telegram.SendVideo(Token, ChannelID, Text, VideoDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendVideo (DD)");

    OPI_TestDataRetrieval.Check_TelegramVideo(Result, Text);

    DeleteFiles(VideoPath);

    FileID = Result["result"]["video"]["file_id"];
    OPI_TestDataRetrieval.WriteParameter("Telegram_FileID", FileID);

    FunctionParameters.Insert("Telegram_FileID", FileID);

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

    Result = OPI_Telegram.SendAudio(Token, ChatID, Text, Audio);

    OPI_TestDataRetrieval.WriteLog(Result, "SendAudio", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramAudio(Result, Text); // SKIP

    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendAudio (Path)");

    OPI_TestDataRetrieval.Check_TelegramAudio(Result, Text); // SKIP

    Result = OPI_Telegram.SendAudio(Token, ChannelID, Text, AudioDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendAudio (DD)");

    OPI_TestDataRetrieval.Check_TelegramAudio(Result, Text);

    DeleteFiles(AudioPath);

    FileID = Result["result"]["audio"]["file_id"];
    OPI_TestDataRetrieval.WriteParameter("Telegram_FileID", FileID);

    FunctionParameters.Insert("Telegram_FileID", FileID);

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

    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document);

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text); // SKIP

    Result = OPI_Telegram.SendDocument(Token, ChatID, Text, Document, , , "customname.docx");

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (with name)", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text); // SKIP

    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (Path)");

    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text); // SKIP

    Result = OPI_Telegram.SendDocument(Token, ChannelID, Text, DocumentDD, , , "customname.docx");

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendDocument (DD)");

    OPI_TestDataRetrieval.Check_TelegramDocument(Result, Text);

    DeleteFiles(DocumentPath);

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

    Result = OPI_Telegram.SendGif(Token, ChatID, Text, GIF);

    OPI_TestDataRetrieval.WriteLog(Result, "SendGif", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramGif(Result, Text); // SKIP

    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifPath);

    OPI_TestDataRetrieval.WriteLog(Result, "SendGif (Path)");

    OPI_TestDataRetrieval.Check_TelegramGif(Result, Text); // SKIP

    Result = OPI_Telegram.SendGif(Token, ChannelID, Text, GifDD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendGif (DD)");

    OPI_TestDataRetrieval.Check_TelegramGif(Result, Text);

    DeleteFiles(GifPath);

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

    OPI_TestDataRetrieval.WriteLog(Result, "SendMediaGroup", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramMediaGroup(Result);

    DocumentURL  = FunctionParameters["Document"];
    DocumentPath = GetTempFileName("docx");
    ChannelID    = FunctionParameters["Telegram_ChannelID"];

    FileCopy(DocumentURL, DocumentPath);

    MediaGroup = New Map;
    MediaGroup.Insert(DocumentURL , "document");
    MediaGroup.Insert(DocumentPath, "document");

    Result = OPI_Telegram.SendMediaGroup(Token, ChannelID, Text, MediaGroup);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMediaGroup (docs)", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramMediaGroup(Result);

    DeleteFiles(VideoPath);
    DeleteFiles(ImagePath);
    DeleteFiles(DocumentPath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendLocation(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Width     = FunctionParameters["Lat"];
    Longitude = FunctionParameters["Long"];

    Result = OPI_Telegram.SendLocation(Token, ChatID, Width, Longitude);

    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramLocation(Result); // SKIP

    Result = OPI_Telegram.SendLocation(Token, ChannelID, Width, Longitude);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation (channel)");

    OPI_TestDataRetrieval.Check_TelegramLocation(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_SendContact(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    Name      = FunctionParameters["Name"];
    LastName  = FunctionParameters["Surname"];
    Phone     = FunctionParameters["Phone"];

    Result = OPI_Telegram.SendContact(Token, ChatID , Name, LastName, Phone);

    OPI_TestDataRetrieval.WriteLog(Result, "SendContact", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramContact(Result, Name); // SKIP
    OPI_Tools.Pause(20); // SKIP

    Result = OPI_Telegram.SendContact(Token, ChannelID, Name, LastName, Phone);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendContact (channel)");

    OPI_TestDataRetrieval.Check_TelegramContact(Result, Name);

    OPI_Tools.Pause(5);

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

    Result = OPI_Telegram.SendPoll(Token, ChatID , Question, AnswersArray, False);

    OPI_TestDataRetrieval.WriteLog(Result, "SendPoll", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramPoll(Result, Question); // SKIP

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, AnswersArray, True);

    OPI_TestDataRetrieval.WriteLog(Result, "SendPoll (channel)");

    OPI_TestDataRetrieval.Check_TelegramPoll(Result, Question); // SKIP

    // END

    StringArray = "['Red', 'Yellow', 'Green', 'Blue']";

    Result = OPI_Telegram.SendPoll(Token, ChannelID, Question, StringArray, True);

    OPI_TestDataRetrieval.WriteLog(Result, "SendPoll (string array)");

    OPI_TestDataRetrieval.Check_TelegramPoll(Result, Question);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DownloadFile(FunctionParameters)

    FileID = FunctionParameters["Telegram_FileID"];
    Token  = FunctionParameters["Telegram_Token"];

    Result = OPI_Telegram.DownloadFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "Telegram");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("BinaryData");

EndProcedure

Procedure Telegram_ForwardMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.ForwardMessage(Token, MessageID, ChannelID, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ForwardMessage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramForward(Result, MessageID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_Ban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Ban(Token, ChannelID, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "Ban", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramBan(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_Unban(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    UserID    = FunctionParameters["Telegram_ChatID"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.Unban(Token, ChannelID, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "Unban", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramBan(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_CreateInviteLink(FunctionParameters)

    Token       = FunctionParameters["Telegram_Token"];
    ChannelID   = FunctionParameters["Telegram_ChannelID"];
    Day         = 86400;
    CurrentDate = OPI_Tools.GetCurrentDate();

    Title          = "Link " + String(CurrentDate);
    Expiration     = CurrentDate + Day;
    UnixExpiration = OPI_Tools.UNIXTime(Expiration);

    Result = OPI_Telegram.CreateInvitationLink(Token, ChannelID, Title, Expiration, 200);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateInvitationLink", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramInvitation(Result, Title, UnixExpiration);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_PinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.PinMessage(Token, ChannelID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PinMessage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.UnpinMessage(Token, ChannelID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnpinMessage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_GetParticipantCount(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChannelID = FunctionParameters["Telegram_ChannelID"];

    Result = OPI_Telegram.GetParticipantCount(Token, ChannelID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetParticipantCount", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramNumber(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_GetAvatarIconList(FunctionParameters)

    Token  = FunctionParameters["Telegram_Token"];
    Result = OPI_Telegram.GetAvatarIconList(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAvatarIconList", "Telegram");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("Map").Заполнено();

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_CreateForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Icon  = "5357419403325481346";
    Name  = "TestTopic " + String(New UUID);

    Result = OPI_Telegram.CreateForumThread(Token, Chat, Name, Icon);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateForumThread", "Telegram");

    Topic = Result["result"]["message_thread_id"];

    FunctionParameters.Insert("Telegram_TopicID", Topic);
    OPI_Tools.AddField("Telegram_TopicID", Topic, "String", FunctionParameters);
    OPI_TestDataRetrieval.WriteParameter("Telegram_TopicID", FunctionParameters["Telegram_TopicID"]);

    OPI_TestDataRetrieval.Check_TelegramCreateTopic(Result, Name, Icon);

    ChatTopic = Chat + "*" + Topic;
    Text      = FunctionParameters["String"];
    Result    = OPI_Telegram.SendTextMessage(Token, ChatTopic, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (forum)");

    OPI_TestDataRetrieval.Check_TelegramMessage(Result, Text);

EndProcedure

Procedure Telegram_EditForumTopic(FunctionParameters)

    Token   = FunctionParameters["Telegram_Token"];
    Chat    = FunctionParameters["Telegram_ForumID"];
    Topic   = FunctionParameters["Telegram_TopicID"];
    NewName = "NewTestTitle";
    NewIcon = "5310132165583840589";

    Result = OPI_Telegram.EditForumTopic(Token, Chat, Topic, NewName, NewIcon);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_CloseForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    OPI_Telegram.OpenForumThread(Token, Chat); // SKIP

    Result = OPI_Telegram.CloseForumThread(Token, Chat); // Closes main topic

    OPI_TestDataRetrieval.WriteLog(Result, "CloseForumTopic (main)");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.CloseForumThread(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CloseForumThread", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure Telegram_OpenForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.OpenForumThread(Token, Chat); // Opens main topic

    OPI_TestDataRetrieval.WriteLog(Result, "OpenForumTopic (main)");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.OpenForumThread(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "OpenForumThread", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure Telegram_DeleteForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.DeleteForumTopic(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(25);

EndProcedure

Procedure Telegram_ClearPinnedMessagesList(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];
    Topic = FunctionParameters["Telegram_TopicID"];

    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat);

    OPI_TestDataRetrieval.WriteLog(Result, "ClearPinnedMessagesList (main)");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result); // SKIP

    Result = OPI_Telegram.ClearThreadPinnedMessagesList(Token, Chat, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ClearThreadPinnedMessagesList", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_HideMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.HideMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "HideMainForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_ShowMainForumTopic(FunctionParameters)

    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.ShowMainForumTopic(Token, Chat);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ShowMainForumTopic", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_ChangeMainTopicName(FunctionParameters)

    Title = "New main thread name " + String(New UUID);
    Token = FunctionParameters["Telegram_Token"];
    Chat  = FunctionParameters["Telegram_ForumID"];

    Result = OPI_Telegram.EditMainForumTopicName(Token, Chat, Title);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditMainForumTopicName", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Telegram_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Telegram_Token"];
    ChatID    = FunctionParameters["Telegram_ChannelID"];
    MessageID = FunctionParameters["Telegram_ChannelMessageID"];

    Result = OPI_Telegram.DeleteMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage", "Telegram");

    OPI_TestDataRetrieval.Check_TelegramTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region VK

Procedure VK_CreateTokenRetrievalLink(FunctionParameters)

    Application = FunctionParameters["VK_AppID"];
    Result      = OPI_VK.CreateTokenRetrievalLink(Application);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTokenRetrievalLink", "VK");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String").Заполнено();

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreatePost(FunctionParameters)

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

    Result = OPI_VK.CreatePost(Text, ImageArray, True, URL, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost", "VK");

    OPI_TestDataRetrieval.Check_VKPost(Result); // SKIP
    PostID = Result["response"]["post_id"]; // SKIP
    Result = OPI_VK.DeletePost(PostID, Parameters); // SKIP

    Result = OPI_VK.CreatePost(Text, Image, False , , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost (one picture)");

    OPI_TestDataRetrieval.Check_VKPost(Result);

    PostID = Result["response"]["post_id"];
    Result = OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(5);

    Result = OPI_VK.CreatePost(Text, TFN , True, URL, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost (one path)");

    OPI_TestDataRetrieval.Check_VKPost(Result);

    PostID = Result["response"]["post_id"];
    OPI_Tools.AddField("VK_PostID", PostID, "String", FunctionParameters);
    OPI_TestDataRetrieval.WriteParameter("VK_PostID", FunctionParameters["VK_PostID"]);

    DeleteFiles(TFN);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeletePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Result = OPI_VK.DeletePost(PostID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

EndProcedure

Procedure VK_CreateCompositePost(FunctionParameters)

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

    Result = OPI_VK.CreateCompositePost(Text, AttachmentsArray, False, URL, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateCompositePost", "VK");

    OPI_TestDataRetrieval.Check_VKPost(Result);
    DeleteFiles(TFN);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreatePoll()

    Parameters = GetVKParameters();
    Question   = "What's your favorite color?";

    OptionArray = New Array;
    OptionArray.Add("Red");
    OptionArray.Add("Yellow");
    OptionArray.Add("Green");

    Result = OPI_VK.CreatePoll(Question, OptionArray, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePoll", "VK");

    OPI_TestDataRetrieval.Check_VKPost(Result);

    PostID = Result["response"]["post_id"];
    OPI_VK.DeletePost(PostID, Parameters);

    OPI_Tools.Pause(10);

EndProcedure

Procedure VK_CreateAlbum(FunctionParameters)

    Parameters  = GetVKParameters();
    Name        = "AlbumFromAutoTest";
    Description = "NewAlbumFromAutoTest";

    Result = OPI_VK.CreateAlbum(Name, Description, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateAlbum", "VK");

    OPI_TestDataRetrieval.Check_VKAlbum(Result, Description);

    AlbumID = Result["response"]["id"];
    FunctionParameters.Insert("VK_AlbumID", AlbumID);
    OPI_TestDataRetrieval.WriteParameter("VK_AlbumID", AlbumID);

EndProcedure

Procedure VK_SavePictureToAlbum(FunctionParameters)

    Parameters       = GetVKParameters();
    ImageDescription = "AutoTestImage";
    AlbumID          = FunctionParameters["VK_AlbumID"];

    Image = FunctionParameters["Picture"]; // URL, Path to file or Binary Data
    TFN   = GetTempFileName("png");
    FileCopy(Image, TFN);

    Image = New BinaryData(TFN);

    Result = OPI_VK.SaveImageToAlbum(AlbumID, Image, ImageDescription, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "SaveImageToAlbum", "VK");

    OPI_TestDataRetrieval.Check_VKAlbumPicture(Result, ImageDescription, AlbumID); // SKIP

    ImageID = Result["response"][0]["id"]; // SKIP
    Result  = OPI_VK.DeleteImage(ImageID, Parameters); // SKIP

    Result = OPI_VK.SaveImageToAlbum(AlbumID, TFN, ImageDescription, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SavePictureToAlbum (path)");

    OPI_TestDataRetrieval.Check_VKAlbumPicture(Result, ImageDescription, AlbumID); // SKIP

    ImageID = Result["response"][0]["id"];
    FunctionParameters.Insert("VK_PictureID", ImageID);
    OPI_TestDataRetrieval.WriteParameter("VK_PictureID", ImageID);

    DeleteFiles(TFN);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteImage(FunctionParameters)

    Parameters = GetVKParameters();
    ImageID    = FunctionParameters["VK_PictureID"];

    Result = OPI_VK.DeleteImage(ImageID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteImage", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteAlbum(FunctionParameters)

    Parameters = GetVKParameters();
    AlbumID    = FunctionParameters["VK_AlbumID"];

    Result = OPI_VK.DeleteAlbum(AlbumID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteAlbum", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateStory(FunctionParameters)

    Parameters = GetVKParameters();
    URL        = "https://github.com/Bayselonarrend/OpenIntegrations";

    Image = FunctionParameters["Picture"]; // URL, Path to file or Binary Data
    TFN   = GetTempFileName("png");
    FileCopy(Image, TFN);
    Image = New BinaryData(TFN);

    Result = OPI_VK.CreateStory(Image , URL, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStory", "VK");

    OPI_TestDataRetrieval.Check_VKStory(Result); // SKIP

    Result = OPI_VK.CreateStory(TFN, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStory (path)");

    OPI_TestDataRetrieval.Check_VKStory(Result);

    DeleteFiles(TFN);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateDiscussion(FunctionParameters)

    Parameters = GetVKParameters();
    Name       = "Discussing: Which color is better?";
    Message    = "Red, yellow, blue, or some other?";

    Result = OPI_VK.CreateDiscussion(Name, Message, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDiscussion", "VK");

    OPI_TestDataRetrieval.Check_VKDiscussion(Result);

    DiscussionID = Result["response"];
    FunctionParameters.Insert("VK_ConvID", DiscussionID);
    OPI_TestDataRetrieval.WriteParameter("VK_ConvID", DiscussionID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CloseDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result       = OPI_VK.CloseDiscussion(DiscussionID, False, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CloseDiscussion", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_OpenDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Result       = OPI_VK.OpenDiscussion(DiscussionID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "OpenDiscussion", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_PostToDiscussion(FunctionParameters)

    Parameters   = GetVKParameters();
    DiscussionID = FunctionParameters["VK_ConvID"];
    Message      = "I like yellow more";

    Result = OPI_VK.WriteInDiscussion(DiscussionID, Message, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "WriteInDiscussion", "VK");

    OPI_TestDataRetrieval.Check_VKDiscussion(Result);

EndProcedure

Procedure VK_LikePost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = FunctionParameters["VK_PostID"];

    Result = OPI_VK.LikePost(PostID, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "LikePost", "VK");

    OPI_TestDataRetrieval.Check_VKLike(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_MakeRepost(FunctionParameters)

    Parameters = GetVKParameters();
    PostID     = 2571;
    WallID     = -218704372;

    Result = OPI_VK.MakeRepost(PostID, WallID, , , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MakeRepost", "VK");

    OPI_TestDataRetrieval.Check_VKRepost(Result);

    FunctionParameters.Insert("Repost", Result["response"]["post_id"]);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_WriteComment(FunctionParameters)

    Parameters = GetVKParameters();
    Text       = "NewComment";
    PostID     = FunctionParameters["VK_PostID"];
    WallID     = Parameters["owner_id"];

    Result = OPI_VK.WriteComment(PostID, WallID, Text, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "WriteComment", "VK");

    OPI_TestDataRetrieval.Check_VKComment(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    CurrentDate = OPI_Tools.GetCurrentDate();
    StartDate   = BegOfDay(CurrentDate);
    EndDate     = EndOfDay(StartDate);

    Result = OPI_VK.GetStatistics(StartDate, EndDate, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetStatistics", "VK");

    OPI_TestDataRetrieval.Check_VKStatistic(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetPostStatistics(FunctionParameters)

    Parameters = GetVKParameters();

    ArrayOfPosts = New Array;
    ArrayOfPosts.Add(214);
    ArrayOfPosts.Add(215);

    Result = OPI_VK.GetPostStatistics(ArrayOfPosts, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPostStatistics", "VK");

    OPI_TestDataRetrieval.Check_VKPostsStatistic(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateAdCampaign(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    Name      = "New campaign";

    Result = OPI_VK.CreateAdvertisingCampaign(AccountID, Name, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateAdvertisingCampaign", "VK");

    OPI_TestDataRetrieval.Check_Map(Result);

    CampaignID = Result["response"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("VK_AdsCampaignID", CampaignID);
    FunctionParameters.Insert("VK_AdsCampaignID", CampaignID);

EndProcedure

Procedure VK_CreateAd(FunctionParameters)

    Parameters = GetVKParameters();

    CampaignNumber = FunctionParameters["VK_AdsCampaignID"];
    DailyLimit     = 150;
    CategoryNumber = 126;
    PostID         = FunctionParameters["VK_PostID"];
    AccountID      = FunctionParameters["VK_AdsCabinetID"];

    Result = OPI_VK.CreateAd(CampaignNumber
        , DailyLimit
        , CategoryNumber
        , PostID
        , AccountID
        , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateAd", "VK");

    OPI_TestDataRetrieval.Check_Map(Result);

    AnnouncementID = Result["response"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("VK_AdsPostID", AnnouncementID);
    FunctionParameters.Insert("VK_AdsPostID", AnnouncementID);

EndProcedure

Procedure VK_PauseAdvertising(FunctionParameters)

    Parameters = GetVKParameters();

    AccountID = FunctionParameters["VK_AdsCabinetID"];
    AdID      = FunctionParameters["VK_AdsPostID"];

    Result = OPI_VK.PauseAdvertising(AccountID, AdID, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PauseAdvertising", "VK");

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure VK_FormKeyboard(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Keyboard = OPI_VK.FormKeyboard(ButtonArray);

    // END

    OPI_TestDataRetrieval.Check_String(Keyboard);

EndProcedure

Procedure VK_WriteMessage(FunctionParameters)

    Parameters = GetVKParameters();

    Text           = "Message from autotest";
    UserID         = FunctionParameters["VK_UserID"];
    Communitytoken = FunctionParameters["VK_CommunityToken"];

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");

    Keyboard = OPI_VK.FormKeyboard(ButtonArray);
    Result   = OPI_VK.WriteMessage(Text, UserID, Communitytoken, Keyboard, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "WriteMessage", "VK");

    OPI_TestDataRetrieval.Check_VKNumber(Result);

EndProcedure

Procedure VK_GetProductCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Result = OPI_VK.GetProductCategoryList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCategoryList", "VK");

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure VK_CreateProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name   = "TestCollection";
    Image  = FunctionParameters["Picture"];
    Main   = True;
    Hidden = False;

    Result = OPI_VK.CreateProductCollection(Name
        , Image
        , Main
        , Hidden
        , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductCollection", "VK");

    OPI_TestDataRetrieval.Check_VKCollection(Result);

    OPI_Tools.Pause(5);

    SelectionID = Result["response"]["market_album_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketAlbumID", SelectionID);
    FunctionParameters.Insert("VK_MarketAlbumID", SelectionID);

EndProcedure

Procedure VK_EditProductCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Name      = "EditedCollection";
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.EditProductCollection(Name, Selection, , , , Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "EditProductCollection", "VK");
    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetSelectionsByID(FunctionParameters)

    Parameters = GetVKParameters();
    Selection  = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.GetSelectionsByID(Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSelectionsByID", "VK");
    OPI_TestDataRetrieval.Check_VKElement(Result);

EndProcedure

Procedure VK_AddProduct(FunctionParameters)

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

    Result = OPI_VK.AddProduct(ProductDescription, Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddProduct", "VK");

    OPI_TestDataRetrieval.Check_VKProduct(Result);

    ProductID = Result["response"]["market_item_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketItemID", ProductID);
    FunctionParameters.Insert("VK_MarketItemID", ProductID);

EndProcedure

Procedure VK_EditProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    ProductDescription = New Map;
    ProductDescription.Insert("Name", "EditedTestProduct");

    Result = OPI_VK.EditProduct(Product, ProductDescription, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditProduct", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

EndProcedure

Procedure VK_AddProductToCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.AddProductToCollection(Product, Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddProductToCollection", "VK");

    OPI_TestDataRetrieval.Check_VKNumber(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_RemoveProductFromCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Product   = FunctionParameters["VK_MarketItemID"];
    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.RemoveProductFromSelection(Product, Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveProductFromSelection", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteProduct(FunctionParameters)

    Parameters = GetVKParameters();

    Product = FunctionParameters["VK_MarketItemID"];

    Result = OPI_VK.DeleteProduct(Product, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProduct", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteCollection(FunctionParameters)

    Parameters = GetVKParameters();

    Selection = FunctionParameters["VK_MarketAlbumID"];

    Result = OPI_VK.DeleteSelection(Selection, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSelection", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_CreateProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name = "Color";

    Result = OPI_VK.CreateProductProperty(Name, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductProperty", "VK");

    OPI_TestDataRetrieval.Check_VKProp(Result);

    OPI_Tools.Pause(5);

    Property = Result["response"]["property_id"];
    Property = OPI_Tools.NumberToString(Property);

    OPI_TestDataRetrieval.WriteParameter("VK_PropID", Property);
    FunctionParameters.Insert("VK_PropID", Property);

EndProcedure

Procedure VK_EditProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Name     = "Color (change.)";
    Property = FunctionParameters["VK_PropID"];

    Result = OPI_VK.EditProductProperty(Name, Property, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditProductProperty", "VK");

    OPI_Tools.Pause(5);

    OPI_TestDataRetrieval.Check_VKTrue(Result);

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

        OPI_TestDataRetrieval.WriteLog(Result, "AddProductPropertyVariant", "VK");

        OPI_TestDataRetrieval.Check_VKPropVariant(Result); // SKIP
        OPI_Tools.Pause(5); // SKIP

        VariantID     = Result["response"]["variant_id"]; // SKIP
        ParameterName = "VK_PropVarID" + String(Counter); // SKIP

        OPI_TestDataRetrieval.WriteParameter(ParameterName, VariantID); // SKIP
        FunctionParameters.Insert(ParameterName, VariantID);
        Counter = Counter + 1; // SKIP

    EndDo;

    // END

EndProcedure

Procedure VK_EditProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];
    Option   = FunctionParameters["VK_PropVarID1"];
    Value    = "New variant name";

    Result = OPI_VK.EditProductPropertyVariant(Value
            , Property
            , Option
            , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditProductPropertyVariant", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

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

    Result = OPI_VK.AddProduct(Product, , Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "ProductWithProp1");

    OPI_TestDataRetrieval.Check_VKProduct(Result);

    ProductID = Result["response"]["market_item_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketItemID2", ProductID);
    FunctionParameters.Insert("VK_MarketItemID2", ProductID);

    Product.Insert("Name"          , "Test product (another)");
    Product.Insert("PropertyValues", PropVariant2);

    Result = OPI_VK.AddProduct(Product, , Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "ProductWithProp2");

    OPI_TestDataRetrieval.Check_VKProduct(Result);

    ProductID = Result["response"]["market_item_id"];
    OPI_TestDataRetrieval.WriteParameter("VK_MarketItemID3", ProductID);
    FunctionParameters.Insert("VK_MarketItemID3", ProductID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetProductsByID(FunctionParameters)

    Parameters = GetVKParameters();

    Item1 = FunctionParameters["VK_MarketItemID2"];
    Item2 = FunctionParameters["VK_MarketItemID3"];

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Result = OPI_VK.GetProductsByID(ProductsArray, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsByID", "VK");

    OPI_TestDataRetrieval.Check_VKProductData(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GroupProducts(FunctionParameters)

    Parameters = GetVKParameters();

    Item1 = FunctionParameters["VK_MarketItemID2"];
    Item2 = FunctionParameters["VK_MarketItemID3"];

    ProductsArray = New Array;
    ProductsArray.Add(Item1);
    ProductsArray.Add(Item2);

    Result = OPI_VK.GroupProducts(ProductsArray, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GroupProducts", "VK");

    OPI_TestDataRetrieval.Check_VKProductsGroup(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteProductPropertyVariant(FunctionParameters)

    Parameters = GetVKParameters();

    Option = FunctionParameters["VK_PropVarID1"];

    Result = OPI_VK.DeleteProductPropertyVariant(Option, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductPropertyVariant", "VK");

    OPI_TestDataRetrieval.Check_VKTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_DeleteProductProperty(FunctionParameters)

    Parameters = GetVKParameters();

    Property = FunctionParameters["VK_PropID"];

    Result = OPI_VK.DeleteProductProperty(Property, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductProperty");

    OPI_Tools.Pause(5);

    OPI_TestDataRetrieval.Check_VKTrue(Result);

EndProcedure

Procedure VK_GetProductList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetProductList(, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductList", "VK");

    OPI_TestDataRetrieval.Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetSelectionList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetSelectionList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSelectionList", "VK");

    OPI_TestDataRetrieval.Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetPropertyList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetPropertyList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPropertyList", "VK");

    OPI_TestDataRetrieval.Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_GetOrderList(FunctionParameters)

    Parameters = GetVKParameters();
    Result     = OPI_VK.GetOrderList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetOrderList", "VK");

    OPI_TestDataRetrieval.Check_Array(Result);
    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_UploadVideoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Video       = FunctionParameters["Video"]; // URL, Binary Data or Path to file
    Name        = "NewVideo";
    Description = "Video description";

    Result = OPI_VK.UploadVideoToServer(Video, Name, Description, , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadVideoToServer", "VK");
    OPI_TestDataRetrieval.Check_VKVideo(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VK_UploadPhotoToServer(FunctionParameters)

    Parameters = GetVKParameters();

    Image = FunctionParameters["Picture"]; // URL, Binary Data or Path to file
    View  = "Post";

    Result = OPI_VK.UploadPhotoToServer(Image, Parameters, View);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadVideoToServer", "VK");
    OPI_TestDataRetrieval.Check_VKAlbumPicture(Result, "");

EndProcedure

Procedure VK_ShortenLink(FunctionParameters)

    Parameters = GetVKParameters();

    Result = OPI_VK.ShortenLink("https://github.com/Bayselonarrend/OpenIntegrations", Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ShortenLink", "VK");
    OPI_TestDataRetrieval.Check_String(Result);

EndProcedure

Procedure VK_GetAdvertisingCategoryList(FunctionParameters)

    Parameters = GetVKParameters();

    Result = OPI_VK.GetAdvertisingCategoryList(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAdvertisingCategoryList", "VK");
    OPI_TestDataRetrieval.Check_VKCategories(Result);

EndProcedure

Procedure VK_GetProductDescription(FunctionParameters)

    Result = OPI_VK.GetProductDescription();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductDescription", "VK");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

#EndRegion

#Region YandexDisk

Procedure YandexDisk_GetDiskInfo(FunctionParameters)

    Token  = FunctionParameters["YandexDisk_Token"];
    Result = OPI_YandexDisk.GetDiskInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDiskInformation", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskDrive(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_CreateFolder(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = "/" + String(New UUID);

    Result = OPI_YandexDisk.CreateFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskFolder(Result, Path);

    OPI_YandexDisk.DeleteObject(Token, Path, False);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_UploadFileByURL(FunctionParameters)

    Token   = FunctionParameters["YandexDisk_Token"];
    Address = FunctionParameters["Picture"];
    Path    = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.UploadFileByURL(Token, Path, Address);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileByURL", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskProc(Result);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_FileByURLPath", Path);
    FunctionParameters.Insert("YandexDisk_FileByURLPath", Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_GetObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Result = OPI_YandexDisk.GetObject(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetObject", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path);

EndProcedure

Procedure YandexDisk_DeleteObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_FileByURLPath"];

    Result = OPI_YandexDisk.DeleteObject(Token, Path, False);

    // END

    OPI_Tools.Pause(5);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject", "YandexDisk");

    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure YandexDisk_UploadFile(FunctionParameters)

    Path1 = "/" + String(New UUID) + ".png";
    Path2 = "/" + String(New UUID) + ".png";

    Token = FunctionParameters["YandexDisk_Token"];
    Image = FunctionParameters["Picture"]; // URL

    TFN = GetTempFileName("png"); // Path
    FileCopy(Image, TFN);

    Result = OPI_YandexDisk.UploadFile(Token, Path1, Image, True);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile (URL)", "YandexDisk");

    OPI_TestDataRetrieval.Check_Empty(Result); // SKIP

    OPI_Tools.Pause(5); // SKIP

    Result = OPI_YandexDisk.UploadFile(Token, Path2, TFN, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile", "YandexDisk");

    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

    Result = OPI_YandexDisk.DeleteObject(Token, Path1, False);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject (URL)", "YandexDisk");

    OPI_TestDataRetrieval.Check_Empty(Result);

    Result = OPI_YandexDisk.DeleteObject(Token, Path2, False);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject (Path)", "YandexDisk");

    OPI_TestDataRetrieval.Check_Empty(Result);

    DeleteFiles(TFN);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_CreateObjectCopy(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.CreateObjectCopy(Token, Original, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateObjectCopy", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_CopyFilePath", Path);
    FunctionParameters.Insert("YandexDisk_CopyFilePath", Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_GetDownloadLink(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Result = OPI_YandexDisk.GetDownloadLink(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDownloadLink", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskLink(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_DownloadFile(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_PathForLink"];

    Result = OPI_YandexDisk.DownloadFile(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "YandexDisk");

    OPI_TestDataRetrieval.Check_BinaryData(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_GetFilesList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;
    FilterByType    = "image";

    Result = OPI_YandexDisk.GetFilesList(Token, Count, OffsetFromStart, FilterByType);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskFilesList(Result, Count, OffsetFromStart);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_MoveObject(FunctionParameters)

    Token    = FunctionParameters["YandexDisk_Token"];
    Original = FunctionParameters["YandexDisk_OriginalFilePath"];
    Path     = "/" + String(New UUID) + ".png";

    Result = OPI_YandexDisk.MoveObject(Token, Original, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MoveObject", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path);

    OPI_TestDataRetrieval.WriteParameter("YandexDisk_NewFilePath", Path);
    FunctionParameters.Insert("YandexDisk_NewFilePath", Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_GetPublishedObjectsList(FunctionParameters)

    Token           = FunctionParameters["YandexDisk_Token"];
    Count           = 2;
    OffsetFromStart = 1;

    Result = OPI_YandexDisk.GetPublishedObjectsList(Token, Count, OffsetFromStart);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPublishedObjectsList", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskFilesList(Result, Count, OffsetFromStart);

    OPI_Tools.Pause(5);

EndProcedure

Procedure YandexDisk_PublishObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.PublishObject(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PublishObject", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path, True);

    URL = Result["public_url"];
    OPI_TestDataRetrieval.WriteParameter("YandexDisk_PublicURL", URL);
    FunctionParameters.Insert("YandexDisk_PublicURL", URL);

EndProcedure

Procedure YandexDisk_GetDownloadLinkForPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.GetDownloadLinkForPublicObject(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDownloadLinkForPublicObject", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskLink(Result);

EndProcedure

Procedure YandexDisk_GetPublicObject(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.GetPublicObject(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPublicObject", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskPath(Result, "", True);

EndProcedure

Procedure YandexDisk_SavePublicObjectToDisk(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    URL   = FunctionParameters["YandexDisk_PublicURL"];

    Result = OPI_YandexDisk.SavePublicObjectToDisk(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SavePublicObjectToDisk", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskPath(Result, "", False);

EndProcedure

Procedure YandexDisk_CancelObjectPublication(FunctionParameters)

    Token = FunctionParameters["YandexDisk_Token"];
    Path  = FunctionParameters["YandexDisk_OriginalFilePath"];

    Result = OPI_YandexDisk.CancelObjectPublication(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CancelObjectPublication", "YandexDisk");

    OPI_TestDataRetrieval.Check_YaDiskPath(Result, Path, False);

EndProcedure

#EndRegion

#Region Viber

Procedure Viber_SetWebhook(FunctionParameters)

    Token = FunctionParameters["Viber_ChannelToken"];
    URL   = "http://api.athenaeum.digital/hs/viber";

    Result = OPI_Viber.SetWebhook(Token, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetWebhook", "Viber");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure Viber_GetChannelInformation(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    Result = OPI_Viber.GetChannelInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelInformation", "Viber");

    OPI_TestDataRetrieval.Check_ViberOk(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetUserData(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetUserData(Token, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserData", "Viber");

    OPI_TestDataRetrieval.Check_ViberUser(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_GetOnlineUsers(FunctionParameters)

    Token  = FunctionParameters["Viber_ChannelToken"];
    UserID = FunctionParameters["Viber_ChannelAdminID"];

    Result = OPI_Viber.GetOnlineUsers(Token, UserID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetOnlineUsers", "Viber");

    OPI_TestDataRetrieval.Check_ViberOnline(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_CreateKeyboardFromArrayButton(FunctionParameters)

    ButtonArray = New Array;
    ButtonArray.Add("Button 1");
    ButtonArray.Add("Button 2");
    ButtonArray.Add("Button 3");

    Result = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateKeyboardFromArrayButton", "Viber");

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

    Keyboard = OPI_Viber.CreateKeyboardFromArrayButton(ButtonArray);

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendTextMessage(Token, Text, UserID, SendingToChannel, Keyboard);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (channel)", "Viber");

    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendImage(FunctionParameters)

    Description = "TestMessage";
    URL         = FunctionParameters["Picture"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    OPI_TestDataRetrieval.WriteLog(Result, "SendImage", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendImage(Token, URL, UserID, SendingToChannel, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendPicture (channel)", "Viber");

    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendFile(FunctionParameters)

    Extension = "docx";
    URL       = FunctionParameters["Document"];

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendFile(Token, URL, UserID, SendingToChannel, Extension);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile (channel)", "Viber");

    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendContact(FunctionParameters)

    Name  = "Petr Petrov";
    Phone = "+123456789";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    OPI_TestDataRetrieval.WriteLog(Result, "SendContact", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendContact(Token, Name, Phone, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendContact (channel)", "Viber");

    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendLocation(FunctionParameters)

    Latitude  = "48.87373649724122";
    Longitude = "2.2954639195323967";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLocation(Token, Latitude, Longitude, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendLocation (channel)", "Viber");

    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Viber_SendLink(FunctionParameters)

    URL = "https://github.com/Bayselonarrend/OpenIntegrations";

    UserID           = FunctionParameters["Viber_UserID"];
    Token            = FunctionParameters["Viber_Token"];
    SendingToChannel = False;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    OPI_TestDataRetrieval.WriteLog(Result, "SendLink", "Viber"); // SKIP
    OPI_TestDataRetrieval.Check_ViberMessage(Result); // SKIP

    UserID           = FunctionParameters["Viber_ChannelAdminID"];
    Token            = FunctionParameters["Viber_ChannelToken"];
    SendingToChannel = True;

    Result = OPI_Viber.SendLink(Token, URL, UserID, SendingToChannel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendLink (channel)", "Viber");

    OPI_TestDataRetrieval.Check_ViberMessage(Result);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleWorkspace

Procedure GoogleWorkspace_FormCodeRetrievalLink(FunctionParameters)

    ClientID = FunctionParameters["Google_ClientID"];
    Result   = OPI_GoogleWorkspace.FormCodeRetrievalLink(ClientID);

    // END

    OPI_TestDataRetrieval.Check_String(Result);
    OPI_TestDataRetrieval.WriteParameter("Google_Link", Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleWorkspace_GetTokenByCode(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    Code         = FunctionParameters["Google_Code"];

    Result = OPI_GoogleWorkspace.GetTokenByCode(ClientID, ClientSecret, Code);

    // END

    If ValueIsFilled(Result["access_token"])
        And ValueIsFilled(Result["refresh_token"]) Then

        OPI_TestDataRetrieval.WriteParameter("Google_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Google_Refresh", Result["refresh_token"]);

    EndIf;

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleWorkspace_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Google_ClientID"];
    ClientSecret = FunctionParameters["Google_ClientSecret"];
    RefreshToken = FunctionParameters["Google_Refresh"];

    Result = OPI_GoogleWorkspace.RefreshToken(ClientID, ClientSecret, RefreshToken);

    // END

    OPI_TestDataRetrieval.Check_GoogleToken(Result);

    OPI_TestDataRetrieval.WriteParameter("Google_Token", Result["access_token"]);

    OPI_Tools.Pause(5);

EndProcedure

#EndRegion

#Region GoogleCalendar

Procedure GoogleCalendar_GetCalendarList(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    Result = OPI_GoogleCalendar.GetCalendarList(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCalendarList", "GoogleCalendar");

    OPI_TestDataRetrieval.Check_Array(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleCalendar_CreateCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Name  = "TestCalendar";

    Result = OPI_GoogleCalendar.CreateCalendar(Token, Name);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateCalendar", "GoogleCalendar");

    OPI_TestDataRetrieval.Check_GoogleCalendar(Result, Name);

    Calendar = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Google_NewCalendarID", Calendar);
    OPI_Tools.AddField("Google_NewCalendarID", Calendar, "String", FunctionParameters);

EndProcedure

Procedure GoogleCalendar_EditCalendarMetadata(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Name        = "New name";
    Description = "New description";

    Result = OPI_GoogleCalendar.EditCalendarMetadata(Token, Calendar, Name, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditCalendarMetadata", "GoogleCalendar");

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure GoogleCalendar_GetCalendarMetadata(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetCalendarMetadata(Token, Calendar);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCalendarMetadata", "GoogleCalendar");

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure GoogleCalendar_AddCalendarToList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.AddCalendarToList(Token, Calendar);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddCalendarToList", "GoogleCalendar");

    Name        = "New name";
    Description = "New description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure GoogleCalendar_EditListCalendar(FunctionParameters)

    Token          = FunctionParameters["Google_Token"];
    Calendar       = FunctionParameters["Google_NewCalendarID"];
    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";
    Hidden         = False;

    Result = OPI_GoogleCalendar.EditListCalendar(Token
        , Calendar
        , PrimaryColor
        , SecondaryColor
        , Hidden);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditListCalendar", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_GoogleCalendarColors(Result, PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_GetListCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetListCalendar(Token, Calendar);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetListCalendar", "GoogleCalendar");

    PrimaryColor   = "#000000";
    SecondaryColor = "#ffd800";

    OPI_TestDataRetrieval.Check_GoogleCalendarColors(Result, PrimaryColor, SecondaryColor);

EndProcedure

Procedure GoogleCalendar_ClearMainCalendar(FunctionParameters)

    Token = FunctionParameters["Google_Token"];

    Result = OPI_GoogleCalendar.ClearMainCalendar(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ClearMainCalendar", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure GoogleCalendar_DeleteCalendarFromList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.DeleteCalendarFromList(Token, Calendar);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteCalendarFromList", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure GoogleCalendar_DeleteCalendar(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.DeleteCalendar(Token, Calendar);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteCalendar", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure GoogleCalendar_CreateEvent(FunctionParameters)

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

    Result = OPI_GoogleCalendar.CreateEvent(Token, Calendar, EventDescription);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateEvent", "GoogleCalendar");

    Event = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Google_EventID", Event);
    OPI_Tools.AddField("Google_EventID", Event, "String", FunctionParameters);

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure GoogleCalendar_EditEvent(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Calendar    = FunctionParameters["Google_NewCalendarID"];
    Event       = FunctionParameters["Google_EventID"];
    Description = "New event description";

    EventDescription = New Map;
    EventDescription.Insert("Description", Description);

    Result = OPI_GoogleCalendar.EditEvent(Token, Calendar, EventDescription, Event);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditEvent", "GoogleCalendar");

    Name = "New event";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure GoogleCalendar_GetEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Result = OPI_GoogleCalendar.GetEvent(Token, Calendar, Event);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetEvent", "GoogleCalendar");

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

EndProcedure

Procedure GoogleCalendar_MoveEvent(FunctionParameters)

    Token = FunctionParameters["Google_Token"];
    Event = FunctionParameters["Google_EventID"];

    SourceCalendar = FunctionParameters["Google_NewCalendarID"];
    TargetCalendar = FunctionParameters["Google_CalendarID"];

    Result = OPI_GoogleCalendar.MoveEvent(Token, SourceCalendar, TargetCalendar, Event);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MoveEvent", "GoogleCalendar");

    Name        = "New event";
    Description = "New event description";

    OPI_TestDataRetrieval.Check_GKObject(Result, Name, Description);

    OPI_GoogleCalendar.MoveEvent(Token, TargetCalendar, SourceCalendar, Event);

EndProcedure

Procedure GoogleCalendar_DeleteEvent(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];
    Event    = FunctionParameters["Google_EventID"];

    Result = OPI_GoogleCalendar.DeleteEvent(Token, Calendar, Event);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteEvent", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure GoogleCalendar_GetEventList(FunctionParameters)

    Token    = FunctionParameters["Google_Token"];
    Calendar = FunctionParameters["Google_NewCalendarID"];

    Result = OPI_GoogleCalendar.GetEventList(Token, Calendar);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetEventList", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

Procedure GoogleCalendar_GetEventDescription(FunctionParameters)

    Result = OPI_GoogleCalendar.GetEventDescription();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetEventDescription", "GoogleCalendar");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

#EndRegion

#Region GoogleDrive

Procedure GoogleDrive_GetDirectoriesList(FunctionParameters)

    Name  = "TestFolder";
    Token = FunctionParameters["Google_Token"];

    Result = OPI_GoogleDrive.GetDirectoriesList(Token, Name, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDirectoriesList", "GoogleDrive");

    Result = Result[0];

    OPI_TestDataRetrieval.Check_GoogleCatalogs(Result);

    Identifier = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("GD_Catalog", Identifier);
    OPI_Tools.AddField("GD_Catalog", Identifier, "String", FunctionParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleDrive_GetObjectInformation(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_Catalog"];

    Result = OPI_GoogleDrive.GetObjectInformation(Token, Identifier);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetObjectInformation", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleCatalog(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleDrive_UploadFile(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Image     = FunctionParameters["Picture"];
    Directory = FunctionParameters["GD_Catalog"];

    Description = OPI_GoogleDrive.GetFileDescription();
    Description.Insert("Parent", Directory);

    Result = OPI_GoogleDrive.UploadFile(Token, Image, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleObject(Result, Description);

    Identifier = Result["id"];

    OPI_TestDataRetrieval.WriteParameter("GD_File", Identifier);
    OPI_Tools.AddField("GD_File", Identifier, "String", FunctionParameters);

EndProcedure

Procedure GoogleDrive_CopyObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    NewName    = "CopiedFile.jpeg";
    NewParent  = "root";

    Result = OPI_GoogleDrive.CopyObject(Token, Identifier, NewName, NewParent);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CopyObject", "GoogleDrive");

    Description = New Structure("Name,MIME", NewName, "image/jpeg");
    OPI_TestDataRetrieval.Check_GoogleObject(Result, Description);

    Identifier = Result["id"];

    ArrayOfDeletions = FunctionParameters["ArrayOfDeletions"];
    ArrayOfDeletions.Add(Identifier);
    FunctionParameters.Insert("ArrayOfDeletions", ArrayOfDeletions);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleDrive_DownloadFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Result = OPI_GoogleDrive.DownloadFile(Token, Identifier);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "GoogleDrive");

    Size       = OPI_Tools.Get(FunctionParameters["Picture"]).Size();
    ExtraBytes = 2;

    OPI_TestDataRetrieval.Check_BinaryData(Result, Size + ExtraBytes);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleDrive_UpdateFile(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    NewName    = "UpdatedFile.jpg";
    Identifier = FunctionParameters["GD_File"];
    File       = FunctionParameters["Picture2"]; // URL, Binary Data or Path to file

    Result = OPI_GoogleDrive.UpdateFile(Token, Identifier, File, NewName);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateFile", "GoogleDrive");

    Description = New Structure("Name,MIME", NewName, "image/jpeg");
    OPI_TestDataRetrieval.Check_GoogleObject(Result, Description);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleDrive_GetFilesList(FunctionParameters)

    Token        = FunctionParameters["Google_Token"];
    Directory    = "root";
    NameContains = "data";

    Result = OPI_GoogleDrive.GetFilesList(Token, NameContains, Directory);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

Procedure GoogleDrive_DeleteObject(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Result = OPI_GoogleDrive.DeleteObject(Token, Identifier);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Empty(Result);

    For Each Deletable In FunctionParameters["ArrayOfDeletions"] Do

        Result = OPI_GoogleDrive.DeleteObject(Token, Deletable);

        OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject");

        OPI_TestDataRetrieval.Check_Empty(Result);
        OPI_Tools.Pause(2);

    EndDo;

EndProcedure

Procedure GoogleDrive_GetFileDescription(FunctionParameters)

    Result = OPI_GoogleDrive.GetFileDescription();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileDescription", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure GoogleDrive_CreateComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    Comment    = "Comment text";

    Result = OPI_GoogleDrive.CreateComment(Token, Identifier, Comment);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleComment(Result, Comment);

    Identifier = Result["id"];

    OPI_TestDataRetrieval.WriteParameter("GD_Comment", Identifier);
    OPI_Tools.AddField("GD_Comment", Identifier, "String", FunctionParameters);

    OPI_Tools.Pause(5);

EndProcedure

Procedure GoogleDrive_GetComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Result = OPI_GoogleDrive.GetComment(Token, Identifier, CommentID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetComment", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleComment(Result, "Comment text");

EndProcedure

Procedure GoogleDrive_GetCommentList(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];

    Result = OPI_GoogleDrive.GetCommentList(Token, Identifier);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCommentList", "GoogleDrive");

    Comments      = Result["comments"];
    CommentObject = Comments[Comments.UBound()];

    OPI_TestDataRetrieval.Check_GoogleComment(CommentObject, "Comment text");

EndProcedure

Procedure GoogleDrive_DeleteComment(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GD_File"];
    CommentID  = FunctionParameters["GD_Comment"];

    Result = OPI_GoogleDrive.DeleteComment(Token, Identifier, CommentID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteComment", "GoogleDrive");
    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure GoogleDrive_CreateFolder(FunctionParameters)

    Token     = FunctionParameters["Google_Token"];
    Directory = FunctionParameters["GD_Catalog"];
    Name      = "TestFolder";

    Result = OPI_GoogleDrive.CreateFolder(Token, Name, Directory);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder", "GoogleDrive");
    OPI_TestDataRetrieval.Check_GoogleCatalog(Result);

    CatalogID = Result["id"];
    OPI_GoogleDrive.DeleteObject(Token, CatalogID);

    Result = OPI_GoogleDrive.CreateFolder(Token, Name);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder (root)");
    OPI_TestDataRetrieval.Check_GoogleCatalog(Result);

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

    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSpreadsheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheet(Result, Name, SheetArray);

    Spreadsheet = Result["spreadsheetId"];
    Sheet       = Result["sheets"][0]["properties"]["sheetId"];
    Sheet       = OPI_Tools.NumberToString(Sheet);

    OPI_TestDataRetrieval.WriteParameter("GS_Spreadsheet", Spreadsheet);
    OPI_TestDataRetrieval.WriteParameter("GS_Sheet"      , Sheet);

    OPI_Tools.AddField("GS_Spreadsheet", Spreadsheet, "String", FunctionParameters);
    OPI_Tools.AddField("GS_Sheet"      , Sheet      , "String", FunctionParameters);

    Name   = "Test table (new.)";
    Result = OPI_GoogleSheets.CreateSpreadsheet(Token, Name, SheetArray);

    Spreadsheet = Result["spreadsheetId"];

    OPI_TestDataRetrieval.WriteParameter("GS_Spreadsheet2", Spreadsheet);
    OPI_Tools.AddField("GS_Spreadsheet2", Spreadsheet, "String", FunctionParameters);

EndProcedure

Procedure GoogleSheets_GetSpreadsheet(FunctionParameters)

    Token      = FunctionParameters["Google_Token"];
    Identifier = FunctionParameters["GS_Spreadsheet"];

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Identifier);

    // END

    Name = "TestTable";

    SheetArray = New Array;
    SheetArray.Add("Sheet1");
    SheetArray.Add("Sheet2");

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSpreadsheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheet(Result, Name, SheetArray);

EndProcedure

Procedure GoogleSheets_CopySheet(FunctionParameters)

    Token  = FunctionParameters["Google_Token"];
    From   = FunctionParameters["GS_Spreadsheet"];
    Target = FunctionParameters["GS_Spreadsheet2"];
    Sheet  = FunctionParameters["GS_Sheet"];

    Result = OPI_GoogleSheets.CopySheet(Token, From, Target, Sheet);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CopySheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSheet(Result);

EndProcedure

Procedure GoogleSheets_AddSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "TestSheet";

    Result = OPI_GoogleSheets.AddSheet(Token, Spreadsheet, Name);

    // END

    NewSheet = Result["replies"][0]["addSheet"]["properties"];

    OPI_TestDataRetrieval.WriteLog(Result, "AddSheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSheet(NewSheet);

EndProcedure

Procedure GoogleSheets_DeleteSheet(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = FunctionParameters["GS_Sheet"];

    Result = OPI_GoogleSheets.DeleteSheet(Token, Spreadsheet, Sheet);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSheet", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheetElement(Result, Spreadsheet);

EndProcedure

Procedure GoogleSheets_EditSpreadsheetTitle(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Name        = "Test table (changed.)";

    Result = OPI_GoogleSheets.EditSpreadsheetTitle(Token, Spreadsheet, Name);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditSpreadsheetTitle", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheetElement(Result, Spreadsheet);

EndProcedure

Procedure GoogleSheets_GetTable(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];

    Result = OPI_GoogleSheets.GetSpreadsheet(Token, Spreadsheet);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTable", "GoogleSheets");

    Name = "Test table (changed.)";
    OPI_TestDataRetrieval.Check_GoogleSheetTitle(Result, Name);

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

    Result = OPI_GoogleSheets.SetCellValues(Token, Spreadsheet, ValueMapping, Sheet);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetCellValues", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleCellUpdating(Result, ValueMapping.Count());

EndProcedure

Procedure GoogleSheets_GetCellValues(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, CellsArray, Sheet);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCellValues", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleCellValues(Result, CellsArray.Count());

    Result = OPI_GoogleSheets.GetCellValues(Token, Spreadsheet, , Sheet);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCellValues (all)");
    OPI_TestDataRetrieval.Check_GoogleSpreadsheetElement(Result, Spreadsheet);

EndProcedure

Procedure GoogleSheets_ClearCells(FunctionParameters)

    Token       = FunctionParameters["Google_Token"];
    Spreadsheet = FunctionParameters["GS_Spreadsheet"];
    Sheet       = "Sheet2";

    CellsArray = New Array;
    CellsArray.Add("B2");
    CellsArray.Add("A3");
    CellsArray.Add("B4");

    Result = OPI_GoogleSheets.ClearCells(Token, Spreadsheet, CellsArray, Sheet);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ClearCells", "GoogleSheets");
    OPI_TestDataRetrieval.Check_GoogleCellCleanning(Result, CellsArray.Count());

EndProcedure

#EndRegion

#Region Slack

Procedure Slack_GetBotInformation(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetBotInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetBotInformation", "Slack");
    OPI_TestDataRetrieval.Check_SlackBot(Result);

EndProcedure

Procedure Slack_GetUserList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetUserList(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserList", "Slack");
    OPI_TestDataRetrieval.Check_SlackUsers(Result);

EndProcedure

Procedure Slack_GetWorkspaceList(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Result = OPI_Slack.GetWorkspaceList(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetWorkspaceList", "Slack");
    OPI_TestDataRetrieval.Check_SlackWorkspaces(Result);

EndProcedure

Procedure Slack_SendMessage(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    // Text

    Text   = "TestMessage1";
    Result = OPI_Slack.SendMessage(Token, Channel, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage", "Slack"); // SKIP
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel); // SKIP

    Timestamp = Result["ts"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Slack_MessageTS", Timestamp); // SKIP
    OPI_Tools.AddField("Slack_MessageTS", Timestamp, "String", FunctionParameters); // SKIP


    // With attachments (picture block in the example)

    Text       = "Message with picture";
    Image      = FunctionParameters["Picture"];
    BlockArray = New Array;

    Block = OPI_Slack.GenerateImageBlock(Image, "Image");
    BlockArray.Add(Block);

    Result = OPI_Slack.SendMessage(Token, Channel, Text, , BlockArray);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (picture)"); // SKIP
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel); // SKIP

    // Sheduled

    Text = "Sheduled message";
    Hour = 3600;
    Day  = 24;

    SendingDate = OPI_Tools.GetCurrentDate() + (Day * Hour);
    Result      = OPI_Slack.SendMessage(Token, Channel, Text, SendingDate);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (scheduled)");
    OPI_TestDataRetrieval.Check_SlackSheduledMessage(Result, Channel);

    Timestamp = Result["scheduled_message_id"];
    Result    = OPI_Slack.DeleteMessage(Token, Channel, Timestamp, True);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage (scheduled)");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_GenerateImageBlock(FunctionParameters)

    Image = FunctionParameters["Picture"];

    Result = OPI_Slack.GenerateImageBlock(Image, "Image");

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GenerateImageBlock", "Slack");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure Slack_EditMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Text = "TestMessage2";

    Result = OPI_Slack.EditMessage(Token, Channel, Timestamp, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessage", "Slack");
    OPI_TestDataRetrieval.Check_SlackMessage(Result, Text, Channel);

EndProcedure

Procedure Slack_GetMessageReplyList(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.GetMessageReplyList(Token, Channel, Timestamp);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetMessageReplyList", "Slack");
    OPI_TestDataRetrieval.Check_SlackMessages(Result);

EndProcedure

Procedure Slack_GetMessageLink(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.GetMessageLink(Token, Channel, Timestamp);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetMessageLink", "Slack");
    OPI_TestDataRetrieval.Check_SlackMessageLink(Result, Channel);

EndProcedure

Procedure Slack_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["Slack_Token"];
    Channel   = FunctionParameters["Slack_Channel"];
    Timestamp = FunctionParameters["Slack_MessageTS"];

    Result = OPI_Slack.DeleteMessage(Token, Channel, Timestamp);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

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

    OPI_TestDataRetrieval.WriteLog(Result, "SendEphemeralMessage", "Slack");
    OPI_TestDataRetrieval.Check_SlackEphemeral(Result);

EndProcedure

Procedure Slack_GetDelayedMessageList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetDelayedMessageList(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDelayedMessageList", "Slack");
    OPI_TestDataRetrieval.Check_SlackSheduled(Result);

EndProcedure

Procedure Slack_CreateChannel(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Name  = "testconv" + String(New UUID);

    Result = OPI_Slack.CreateChannel(Token, Name);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, Name);

    Channel = Result["channel"]["id"];
    OPI_TestDataRetrieval.WriteParameter("Slack_NewChannel", Channel);
    OPI_Tools.AddField("Slack_NewChannel", Channel, "String", FunctionParameters);

    OPI_TestDataRetrieval.WriteParameter("Slack_NewChannelName", Name);
    OPI_Tools.AddField("Slack_NewChannelName", Name, "String", FunctionParameters);

EndProcedure

Procedure Slack_SetChannelTopic(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Topic   = "TestTopic";

    Result = OPI_Slack.SetChannelTopic(Token, Channel, Topic);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChannelTopic", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelTopic(Result, Topic);

EndProcedure

Procedure Slack_SetChannelGoal(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Purpose = "TestGoal";

    Result = OPI_Slack.SetChannelGoal(Token, Channel, Purpose);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChannelGoal", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_GetChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_InviteUsersToChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Result = OPI_Slack.InviteUsersToChannel(Token, Channel, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "InviteUsersToChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_KickUserFromChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    User    = FunctionParameters["Slack_User"];

    Result = OPI_Slack.KickUserFromChannel(Token, Channel, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "KickUserFromChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_GetChannelHistory(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannelHistory(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelHistory", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelHistory(Result);

EndProcedure

Procedure Slack_GetChannelUserList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.GetChannelUserList(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelUserList", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelUsers(Result);

EndProcedure

Procedure Slack_LeaveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.LeaveChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "LeaveChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_JoinChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.JoinChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "JoinChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, FunctionParameters["Slack_NewChannelName"]);

EndProcedure

Procedure Slack_RenameChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];
    Name    = "testconv" + String(New UUID);

    Result = OPI_Slack.RenameChannel(Token, Channel, Name);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenameChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannel(Result, Name);

EndProcedure

Procedure Slack_ArchiveChannel(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_NewChannel"];

    Result = OPI_Slack.ArchiveChannel(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ArchiveChannel", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_GetChannelList(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];

    Result = OPI_Slack.GetChannelList(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChannelList", "Slack");
    OPI_TestDataRetrieval.Check_SlackChannelsList(Result);

EndProcedure

Procedure Slack_OpenDialog(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    User  = FunctionParameters["Slack_User"];

    Result = OPI_Slack.OpenDialog(Token, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "OpenDialog", "Slack");
    OPI_TestDataRetrieval.Check_SlackDialog(Result);

    Dialog = Result["channel"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Slack_Dialog", Dialog);
    OPI_Tools.AddField("Slack_Dialog", Dialog, "String", FunctionParameters);

    Result = OPI_Slack.SendMessage(Token, Dialog, "Test dialog");

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage (dialog)");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_CloseDialog(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    Dialog = FunctionParameters["Slack_Dialog"];

    Result = OPI_Slack.CloseDialog(Token, Dialog);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CloseDialog", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_GetFilesList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetFilesList(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList", "Slack");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

    Result = OPI_Slack.GetFilesList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList (full)");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

EndProcedure

Procedure Slack_UploadFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    File    = FunctionParameters["Document"]; // URL, Binary Data or Path to file

    FileName = "megadoc.docx";
    Title    = "NewFile";

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile"     , "Slack"); // SKIP
    OPI_TestDataRetrieval.WriteLog(Result, "MakeFilePublic" , "Slack"); // SKIP
    OPI_TestDataRetrieval.WriteLog(Result, "MakeFilePrivate", "Slack"); // SKIP
    OPI_TestDataRetrieval.Check_SlackFile(Result, FileName); // SKIP

    UploadedFile = Result["files"][0]["id"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Slack_FileID", UploadedFile); // SKIP
    OPI_Tools.AddField("Slack_FileID", UploadedFile, "String", FunctionParameters); // SKIP

    Result = OPI_Slack.UploadFile(Token, File, FileName, Title, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile (to channel)");
    OPI_TestDataRetrieval.Check_SlackFile(Result, FileName);
    OPI_Slack.DeleteFile(Token, Result["files"][0]["id"]);

EndProcedure

Procedure Slack_MakeFilePublic(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.MakeFilePublic(Token, FileID);

    // END

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure Slack_MakeFilePrivate(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.MakeFilePrivate(Token, FileID);

    // END

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure Slack_GetFileData(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.GetFileData(Token, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileData", "Slack");
    OPI_TestDataRetrieval.Check_SlackFile(Result, "megadoc.docx");

EndProcedure

Procedure Slack_DeleteFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_FileID"];

    Result = OPI_Slack.DeleteFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_GetExternalFileList(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];

    Result = OPI_Slack.GetExternalFileList(Token, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetExternalFileList", "Slack");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

    Result = OPI_Slack.GetExternalFileList(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetExternalFileList (full)");
    OPI_TestDataRetrieval.Check_SlackFilesList(Result);

EndProcedure

Procedure Slack_AddExternalFile(FunctionParameters)

    Token = FunctionParameters["Slack_Token"];
    Title = "NewFile";
    File  = FunctionParameters["Document"]; // URL, Binary Data or Path to file

    Result = OPI_Slack.AddExternalFile(Token, File, Title);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackExternalFile(Result, Title);

    UploadedFile = Result["file"]["id"];
    OPI_TestDataRetrieval.WriteParameter("Slack_ExtFileID", UploadedFile);
    OPI_Tools.AddField("Slack_ExtFileID", UploadedFile, "String", FunctionParameters);

EndProcedure

Procedure Slack_GetExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.GetExternalFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackExternalFile(Result, "NewFile");

EndProcedure

Procedure Slack_SendExternalFile(FunctionParameters)

    Token   = FunctionParameters["Slack_Token"];
    Channel = FunctionParameters["Slack_Channel"];
    FileID  = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.SendExternalFile(Token, FileID, Channel);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

EndProcedure

Procedure Slack_DeleteExternalFile(FunctionParameters)

    Token  = FunctionParameters["Slack_Token"];
    FileID = FunctionParameters["Slack_ExtFileID"];

    Result = OPI_Slack.DeleteExternalFile(Token, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteExternalFile", "Slack");
    OPI_TestDataRetrieval.Check_SlackOk(Result);

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

    Result = OPI_Airtable.CreateDatabase(Token, Region, Name, TableMapping);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDatabase", "Airtable");
    OPI_TestDataRetrieval.Check_ATBaseWithTable(Result, TableName);

    Base = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Base", Base);
    OPI_Tools.AddField("Airtable_Base", Base, "String", FunctionParameters);

EndProcedure

Procedure Airtable_GetDatabaseTables(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];

    Result = OPI_Airtable.GetDatabaseTables(Token, Base);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDatabaseTables", "Airtable");
    OPI_TestDataRetrieval.Check_ATTablesList(Result);

EndProcedure

Procedure Airtable_GetListOfBases(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];

    Result = OPI_Airtable.GetListOfBases(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetListOfBases", "Airtable");
    OPI_TestDataRetrieval.Check_ATBasesList(Result);

EndProcedure

Procedure Airtable_GetNumberField(FunctionParameters)

    Result = OPI_Airtable.GetNumberField("Number");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetNumberField", "Airtable");

EndProcedure

Procedure Airtable_GetStringField(FunctionParameters)

    Result = OPI_Airtable.GetStringField("String");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetStringField", "Airtable");

EndProcedure

Procedure Airtable_GetAttachmentField(FunctionParameters)

    Result = OPI_Airtable.GetAttachmentField("Attachment");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetAttachmentField", "Airtable");

EndProcedure

Procedure Airtable_GetCheckboxField(FunctionParameters)

    Result = OPI_Airtable.GetCheckboxField("Checkbox");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetCheckboxField", "Airtable");

EndProcedure

Procedure Airtable_GetDateField(FunctionParameters)

    Result = OPI_Airtable.GetDateField("Date");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetDateField", "Airtable");

EndProcedure

Procedure Airtable_GetPhoneField(FunctionParameters)

    Result = OPI_Airtable.GetPhoneField("Phone");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetPhoneField", "Airtable");

EndProcedure

Procedure Airtable_GetEmailField(FunctionParameters)

    Result = OPI_Airtable.GetEmailField("Email");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetEmailField", "Airtable");

EndProcedure

Procedure Airtable_GetLinkField(FunctionParameters)

    Result = OPI_Airtable.GetLinkField("Link");

    // END

    OPI_TestDataRetrieval.Check_Structure(Result);
    OPI_TestDataRetrieval.WriteLog(Result, "GetLinkField", "Airtable");

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

    Result = OPI_Airtable.CreateTable(Token, Base, Name, FieldArray, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTable", "Airtable");
    OPI_TestDataRetrieval.Check_ATTable(Result, Name, Description);

    Table = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Table", Table);
    OPI_Tools.AddField("Airtable_Table", Table, "String", FunctionParameters);

EndProcedure

Procedure Airtable_ModifyTable(FunctionParameters)

    Token       = FunctionParameters["Airtable_Token"];
    Base        = FunctionParameters["Airtable_Base"];
    Table       = FunctionParameters["Airtable_Table"];
    Name        = "Test table 2 (change.)";
    Description = "New table (change.)";

    Result = OPI_Airtable.ModifyTable(Token, Base, Table, Name, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ModifyTable", "Airtable");
    OPI_TestDataRetrieval.Check_ATTable(Result, Name, Description);

EndProcedure

Procedure Airtable_CreateField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Name  = String(New UUID);

    Field  = OPI_Airtable.GetNumberField(Name);
    Result = OPI_Airtable.CreateField(Token, Base, Table, Field);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateField", "Airtable");
    OPI_TestDataRetrieval.Check_ATField(Result, Name);

    Field = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Field", Field);
    OPI_Tools.AddField("Airtable_Field", Field, "String", FunctionParameters);

EndProcedure

Procedure Airtable_ModifyField(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];
    Field = FunctionParameters["Airtable_Field"];

    Name        = String(New UUID) + "(change.)";
    Description = "New description";

    Result = OPI_Airtable.ModifyField(Token, Base, Table, Field, Name, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ModifyField", "Airtable");
    OPI_TestDataRetrieval.Check_ATTable(Result, Name, Description);

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

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, ArrayOfDescriptions);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePosts", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecords(Result);

    ArrayOfDeletions = New Array;

    For Each Record In Result["records"] Do

        CurrentRecord = Record["id"];
        ArrayOfDeletions.Add(CurrentRecord);

    EndDo;

    OPI_Airtable.DeletePosts(Token, Base, Table, ArrayOfDeletions);

    // Single

    Result = OPI_Airtable.CreatePosts(Token, Base, Table, RowDescription1);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateRecords (one)");
    OPI_TestDataRetrieval.Check_ATRecordNumberAndString(Result, Number, String);

    Record = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Record", Record);
    OPI_Tools.AddField("Airtable_Record", Record, "String", FunctionParameters);

EndProcedure

Procedure Airtable_GetRecord(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Result = OPI_Airtable.GetRecord(Token, Base, Table, Record);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetRecord", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecord(Result, Record);

EndProcedure

Procedure Airtable_CreateComment(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];
    Text   = "TestComment";

    Result = OPI_Airtable.CreateComment(Token, Base, Table, Record, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateComment", "Airtable");
    OPI_TestDataRetrieval.Check_ATText(Result, Text);

    Comment = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Airtable_Comment", Comment);
    OPI_Tools.AddField("Airtable_Comment", Comment, "String", FunctionParameters);

EndProcedure

Procedure Airtable_EditComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Text   = "Test comment (change.)";
    Result = OPI_Airtable.EditComment(Token, Base, Table, Record, Comment, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "EditComment", "Airtable");
    OPI_TestDataRetrieval.Check_ATText(Result, Text);

EndProcedure

Procedure Airtable_GetComments(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Result = OPI_Airtable.GetComments(Token, Base, Table, Record);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetComments", "Airtable");
    OPI_TestDataRetrieval.Check_ATComments(Result);

EndProcedure

Procedure Airtable_DeleteComment(FunctionParameters)

    Token   = FunctionParameters["Airtable_Token"];
    Base    = FunctionParameters["Airtable_Base"];
    Table   = FunctionParameters["Airtable_Table"];
    Record  = FunctionParameters["Airtable_Record"];
    Comment = FunctionParameters["Airtable_Comment"];

    Result = OPI_Airtable.DeleteComment(Token, Base, Table, Record, Comment);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteComment", "Airtable");
    OPI_TestDataRetrieval.Check_ATCommentDeleting(Result, Comment);

EndProcedure

Procedure Airtable_GetListOfRecords(FunctionParameters)

    Token = FunctionParameters["Airtable_Token"];
    Base  = FunctionParameters["Airtable_Base"];
    Table = FunctionParameters["Airtable_Table"];

    Result = OPI_Airtable.GetListOfRecords(Token, Base, Table);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetListOfRecords", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecords(Result);

EndProcedure

Procedure Airtable_DeletePosts(FunctionParameters)

    Token  = FunctionParameters["Airtable_Token"];
    Base   = FunctionParameters["Airtable_Base"];
    Table  = FunctionParameters["Airtable_Table"];
    Record = FunctionParameters["Airtable_Record"];

    Result = OPI_Airtable.DeletePosts(Token, Base, Table, Record);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePosts", "Airtable");
    OPI_TestDataRetrieval.Check_ATRecords(Result);

EndProcedure

#EndRegion

#Region Twitter

Procedure Twitter_GetToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Code       = "123456";

    Result = OPI_Twitter.GetToken(Code, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetToken", "Twitter");
    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure Twitter_GetAuthorizationLink(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.GetAuthorizationLink(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAuthorizationLink", "Twitter");

    OPI_TestDataRetrieval.Check_String(Result);

    OPI_TestDataRetrieval.WriteParameter("Twitter_URL", Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Twitter_RefreshToken(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Result     = OPI_Twitter.RefreshToken(Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RefreshToken", "Twitter");

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

Procedure Twitter_CreateTextTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Result = OPI_Twitter.CreateTextTweet(Text, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTextTweet", "Twitter");

    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Twitter_CreateImageTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image  = FunctionParameters["Picture"]; // URL, Binary or Path to file
    Image2 = FunctionParameters["Picture2"]; // URL, Binary or Path to file

    ImageArray = New Array;
    ImageArray.Add(Image);
    ImageArray.Add(Image2);

    Result = OPI_Twitter.CreateImageTweet(Text, ImageArray, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateImageTweet", "Twitter"); // SKIP
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text); // SKIP
    OPI_Tools.Pause(15); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateImageTweet (single)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    Image = OPI_Tools.Get(Image);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateImageTweet(Text, Image, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateImageTweet (TFN)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_CreateVideoTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Video  = FunctionParameters["Video"]; // URL, Binary or Path to file
    Video2 = FunctionParameters["Video"]; // URL, Binary or Path to file

    VideosArray = New Array;
    VideosArray.Add(Video);
    VideosArray.Add(Video2);

    Result = OPI_Twitter.CreateVideoTweet(Text, VideosArray, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateVideoTweet", "Twitter"); // SKIP
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text); // SKIP
    OPI_Tools.Pause(15); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateVideoTweet (single)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    Video = OPI_Tools.Get(Video);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateVideoTweet(Text, Video, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateVideoTweet (TFN)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_CreateGifTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    GIF  = FunctionParameters["GIF"]; // URL, Binary or Path to file
    Gif2 = FunctionParameters["GIF"]; // URL, Binary or Path to file

    GifsArray = New Array;
    GifsArray.Add(GIF);
    GifsArray.Add(Gif2);

    Result = OPI_Twitter.CreateGifTweet(Text, GifsArray, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateGifTweet", "Twitter"); // SKIP
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text); // SKIP
    OPI_Tools.Pause(15); // SKIP

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateGifTweet (single)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    GIF = OPI_Tools.Get(GIF);

    Text   = "TestTweet" + String(New UUID);
    Result = OPI_Twitter.CreateGifTweet(Text, GIF, Parameters);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateGifTweet (TFN)");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);
    OPI_Tools.Pause(15);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_CreatePollTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    AnswersArray = New Array;
    AnswersArray.Add("Option 1");
    AnswersArray.Add("Option 2");

    Result = OPI_Twitter.CreatePollTweet(Text, AnswersArray, 60, Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePollTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_CreateCustomTweet(FunctionParameters)

    Parameters = GetTwitterAuthData();
    Text       = "TestTweet" + String(New UUID);

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or Path to file
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or Path to file

    ImageArray = New Array();
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    MediaArray = OPI_Twitter.UploadAttachmentsArray(ImageArray, "photo", Parameters);
    Result     = OPI_Twitter.CreateCustomTweet(Text, MediaArray, , , Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateCustomTweet", "Twitter");
    OPI_TestDataRetrieval.Check_TwitterText(Result, Text);

    OPI_Tools.Pause(20);

EndProcedure

Procedure Twitter_UploadAttachmentsArray(FunctionParameters)

    Parameters = GetTwitterAuthData();

    Image1 = FunctionParameters["Picture"]; // URL, Binary Data or Path to file
    Image2 = FunctionParameters["Picture2"]; // URL, Binary Data or Path to file

    ImageArray = New Array();
    ImageArray.Add(Image1);
    ImageArray.Add(Image2);

    Result = OPI_Twitter.UploadAttachmentsArray(ImageArray, "tweet_image", Parameters);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadAttachmentsArray", "Twitter");
    OPI_TestDataRetrieval.Check_Array(Result);

EndProcedure

#EndRegion

#Region Notion

Procedure Notion_CreatePage(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Title  = "TestTitle";

    Result = OPI_Notion.CreatePage(Token, Parent, Title);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePage", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result);

    Page = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Notion_Page", Page);
    OPI_Tools.AddField("Notion_Page", Page, "String", FunctionParameters);

EndProcedure

Procedure Notion_CreateDatabase(FunctionParameters)

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

    Result = OPI_Notion.CreateDatabase(Token, Parent, Title, Properties);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDatabase", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "database");

    Base = Result["id"];
    OPI_TestDataRetrieval.WriteParameter("Notion_Base", Base);
    OPI_Tools.AddField("Notion_Base", Base, "String", FunctionParameters);

EndProcedure

Procedure Notion_EditDatabaseProperties(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Title       = "TestTitle";
    Description = "TestDescription";

    Properties = New Map;
    Properties.Insert("Email", "rich_text"); // Type fields "Email" will changed with email to text
    Properties.Insert("Website"); // Field "Website" will deleted

    Result = OPI_Notion.EditDatabaseProperties(Token, Base, Properties, Title, Description);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditDatabaseProperties", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "database");

EndProcedure

Procedure Notion_GetPage(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Page  = FunctionParameters["Notion_Page"];

    Result = OPI_Notion.GetPage(Token, Page);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPage", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result);

EndProcedure

Procedure Notion_GetDatabase(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Base  = FunctionParameters["Notion_Base"];

    Result = OPI_Notion.GetDatabase(Token, Base);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDatabase", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "database");

EndProcedure

Procedure Notion_CreatePageInDatabase(FunctionParameters)

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

    Result = OPI_Notion.CreatePageInDatabase(Token, Base, Properties);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePageInDatabase", "Notion");
    OPI_TestDataRetrieval.Check_NotionBasePage(Result, Base);

EndProcedure

Procedure Notion_EditPageProperties(FunctionParameters)

    Token   = FunctionParameters["Notion_Token"];
    Page    = FunctionParameters["Notion_Page"];
    Icon    = FunctionParameters["Picture"];
    Cover   = FunctionParameters["Picture2"];
    Archive = False;

    Properties = New Map;
    Properties.Insert("Active" , False);
    Properties.Insert("Email"  , "vector@mail.ru");

    Result = OPI_Notion.EditPageProperties(Token
        , Page
        , Properties
        , Icon
        , Cover
        , Archive);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditPageProperties", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result);

EndProcedure

Procedure Notion_ReturnBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_Block"];

    Result = OPI_Notion.ReturnBlock(Token, Block);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ReturnBlock", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "block");

EndProcedure

Procedure Notion_CreateBlock(FunctionParameters)

    Token  = FunctionParameters["Notion_Token"];
    Parent = FunctionParameters["Notion_Parent"];
    Block  = FunctionParameters["Notion_Block"];

    BlockData = OPI_Notion.ReturnBlock(Token, Block);
    Result    = OPI_Notion.CreateBlock(Token, Parent, BlockData);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateBlock", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "list");

    Block = Result["results"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("Notion_NewBlock", Block);
    OPI_Tools.AddField("Notion_NewBlock", Block, "String", FunctionParameters);

EndProcedure

Procedure Notion_ReturnChildBlocks(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Result = OPI_Notion.ReturnChildBlocks(Token, Block);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ReturnChildBlocks", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "list");

EndProcedure

Procedure Notion_DeleteBlock(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    Block = FunctionParameters["Notion_NewBlock"];

    Result = OPI_Notion.DeleteBlock(Token, Block);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteBlock", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "block");

EndProcedure

Procedure Notion_UserList(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];

    Result = OPI_Notion.UserList(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UserList", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "list");

EndProcedure

Procedure Notion_GetUserData(FunctionParameters)

    Token = FunctionParameters["Notion_Token"];
    User  = FunctionParameters["Notion_User"];

    Result = OPI_Notion.GetUserData(Token, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserData", "Notion");
    OPI_TestDataRetrieval.Check_NotionObject(Result, "user");

EndProcedure

#EndRegion

#Region Dropbox

Procedure Dropbox_GetAuthorizationLink(FunctionParameters)

    AppKey = FunctionParameters["Dropbox_Appkey"];
    Result = OPI_Dropbox.GetAuthorizationLink(AppKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAuthorizationLink", "Dropbox");

    OPI_TestDataRetrieval.ExpectsThat(Result).ИмеетТип("String");

EndProcedure

Procedure Dropbox_GetToken(FunctionParameters)

    AppKey    = FunctionParameters["Dropbox_Appkey"];
    AppSecret = FunctionParameters["Dropbox_Appsecret"];
    Code      = FunctionParameters["Dropbox_Code"];

    Result = OPI_Dropbox.GetToken(AppKey, AppSecret, Code);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetToken");

    Token   = Result["access_token"];
    Refresh = Result["refresh_token"];

    If ValueIsFilled(Token) Then
        OPI_TestDataRetrieval.WriteParameter("Dropbox_Token", Token);
    EndIf;

    If ValueIsFilled(Refresh) Then
        OPI_TestDataRetrieval.WriteParameter("Dropbox_Refresh", Refresh);
    EndIf;

EndProcedure

Procedure Dropbox_UpdateToken(FunctionParameters)

    AppKey       = FunctionParameters["Dropbox_Appkey"];
    AppSecret    = FunctionParameters["Dropbox_Appsecret"];
    RefreshToken = FunctionParameters["Dropbox_Refresh"];

    Result = OPI_Dropbox.RefreshToken(AppKey, AppSecret, RefreshToken);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RefreshToken");

    Token = Result["access_token"];

    OPI_TestDataRetrieval.ExpectsThat(Token).Заполнено();

    OPI_TestDataRetrieval.WriteParameter("Dropbox_Token", Token);

EndProcedure

Procedure Dropbox_GetObjectInformation(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetObjectInformation(Token, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetObjectInformation", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxFile(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetPreview(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.GetPreview(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPreview", "Dropbox");

    OPI_TestDataRetrieval.Check_BinaryData(Result, 120000);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_UploadFile(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];
    Image = FunctionParameters["Picture"];

    ImagePath = GetTempFileName("png");
    FileCopy(Image, ImagePath);

    Result = OPI_Dropbox.UploadFile(Token, ImagePath, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxFile(Result, Path);
    DeleteFiles(ImagePath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_UploadFileByURL(FunctionParameters)

    Path  = "/New/url_doc.docx";
    Token = FunctionParameters["Dropbox_Token"];
    URL   = FunctionParameters["Document"];

    Result = OPI_Dropbox.UploadFileByURL(Token, URL, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileByURL", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxWork(Result);

    Work = Result["async_job_id"];

    FunctionParameters.Insert("Dropbox_Job", Work);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_Job", Work);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetUploadStatusByURL(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    WorkID = FunctionParameters["Dropbox_Job"];
    Status = "in_progress";

    WHile Status = "in_progress" Do

        Result = OPI_Dropbox.GetUploadStatusByURL(Token, WorkID);
        Status = Result[".tag"];

        OPI_Tools.Pause(5);

        OPI_TestDataRetrieval.WriteLog(Result, "GetUploadStatusByURL", "Dropbox");

    EndDo;

    // END

    OPI_TestDataRetrieval.Check_DropboxStatus(Result);

    Path   = "/New/url_doc.docx";
    Result = OPI_Dropbox.DeleteObject(Token, Path);

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);
    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DeleteObject(FunctionParameters)

    Path  = "/New/pic.png";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.DeleteObject(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteObject", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_CopyObject(FunctionParameters)

    Original = "/New/pic.png";
    Copy     = "/New/pic_copy.png";
    Token    = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.CopyObject(Token, Original, Copy);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CopyObject", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Copy);

    Result = OPI_Dropbox.DeleteObject(Token, Copy);
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Copy);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_MoveObject(FunctionParameters)

    OriginalPath = "/New/pic.png";
    TargetPath   = "/pic.png";
    Token        = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.MoveObject(Token, OriginalPath, TargetPath);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MoveObject", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, TargetPath);

    Result = OPI_Dropbox.MoveObject(Token, TargetPath, OriginalPath);
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, OriginalPath);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_CreateFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New catalog";

    Result = OPI_Dropbox.CreateFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateFolder", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);

    Result = OPI_Dropbox.DeleteObject(Token, Path);
    OPI_TestDataRetrieval.Check_DropboxMetadata(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DownloadFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.DownloadFile(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFile", "Dropbox");

    OPI_TestDataRetrieval.Check_BinaryData(Result, 2000000);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DownloadFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.DownloadFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DownloadFolder", "Dropbox");

    OPI_TestDataRetrieval.Check_BinaryData(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetFolderFileList(FunctionParameters)

    Path  = "/New";
    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetListOfFolderFiles(Token, Path, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetListOfFolderFiles", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxArray(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetObjectVersionList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/pic.png";

    Result = OPI_Dropbox.GetObjectVersionList(Token, Path, 1);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetObjectVersionList", "Dropbox");

   OPI_TestDataRetrieval.Check_DropboxArray(Result, 1);

   Revision = Result["entries"][0]["rev"];

   FunctionParameters.Insert("Dropbox_FileRevision", Revision);
   OPI_TestDataRetrieval.WriteParameter("Dropbox_FileRevision", Revision);

   OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_RestoreObjectToVersion(FunctionParameters)

    Version = FunctionParameters["Dropbox_FileRevision"];
    Token   = FunctionParameters["Dropbox_Token"];
    Path    = "/New/pic.png";

    Result = OPI_Dropbox.RestoreObjectToVersion(Token, Path, Version);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreObjectToVersion", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxFile(Result, Path);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetTagList(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    PathsArray = New Array;
    PathsArray.Add("/New/Dogs.mp3");
    PathsArray.Add("/New/mydoc.docx");

    Result = OPI_Dropbox.GetTagList(Token, PathsArray);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTagList", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxTags(Result, PathsArray.Count());

    Result = OPI_Dropbox.GetTagList(Token, "/New/mydoc.docx");

    OPI_TestDataRetrieval.WriteLog(Result, "GetTagList (single)");

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

Procedure Dropbox_AddTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.AddTag(Token, Path, Tag);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTag", "Dropbox");

    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_DeleteTag(FunctionParameters)

    Tag   = "Important";
    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New/mydoc.docx";

    Result = OPI_Dropbox.DeleteTag(Token, Path, Tag);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTag", "Dropbox");

    OPI_TestDataRetrieval.Check_Empty(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetAccountInformation(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetAccountInformation(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAccountInformation", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxAccount(Result);

    Result = OPI_Dropbox.GetAccountInformation(Token, Result["account_id"]);

    OPI_TestDataRetrieval.WriteLog(Result, "GetAccountInformation (third-party)");

    OPI_TestDataRetrieval.Check_DropboxAccount(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetSpaceUsageData(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];

    Result = OPI_Dropbox.GetSpaceUsageData(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSpaceUsageData", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxSpace(Result);

EndProcedure

Procedure Dropbox_AddUsersToFile(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Email = FunctionParameters["Dropbox_OtherUser"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Email, False);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToFile", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxMember(Result, Email, False);

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFile(Token, File, Mails, True);

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToFile (new.) ");

    OPI_TestDataRetrieval.Check_DropboxMember(Result, Email, True);

EndProcedure

Procedure Dropbox_PublishFolder(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    Path  = "/New";

    Result = OPI_Dropbox.PublishFolder(Token, Path);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PublishFolder", "Dropbox");

    OPI_TestDataRetrieval.Check_DropboxPublicFolder(Result);

    FolderID = Result["shared_folder_id"];

    FunctionParameters.Insert("Dropbox_SharedFolder", FolderID);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_SharedFolder", FolderID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_CancelFolderPublication(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Folder = FunctionParameters["Dropbox_SharedFolder"];

    Result = OPI_Dropbox.CancelFolderPublication(Token, Folder);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CancelFolderPublication", "Dropbox");

    CurrentStatus = "in_progress";
    JobID         = Result["async_job_id"];

    WHile CurrentStatus = "in_progress" Do
        Result          = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);
        CurrentStatus   = Result[".tag"];
        OPI_Tools.Pause(3);
    EndDo;

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAsynchronousChangeStatus", "Dropbox");
    OPI_TestDataRetrieval.Check_DropboxStatus(Result);

    FunctionParameters.Insert("Dropbox_NewJobID", JobID);
    OPI_TestDataRetrieval.WriteParameter("Dropbox_NewJobID", JobID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Dropbox_GetAsynchronousChangeStatus(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    JobID = FunctionParameters["Dropbox_NewJobID"];

    Result = OPI_Dropbox.GetAsynchronousChangeStatus(Token, JobID);

    // END

    OPI_TestDataRetrieval.Check_Map(Result);

EndProcedure

Procedure Dropbox_AddUsersToFolder(FunctionParameters)

    Token  = FunctionParameters["Dropbox_Token"];
    Email  = FunctionParameters["Dropbox_OtherUser"];
    Folder = FunctionParameters["Dropbox_SharedFolder"]; // shared_folder_id

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Email, False);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToFolder", "Dropbox");

    OPI_TestDataRetrieval.Check_Empty(Result);

    Mails = New Array;
    Mails.Add(Email);

    Result = OPI_Dropbox.AddUsersToFolder(Token, Folder, Mails, True);

    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

Procedure Dropbox_CancelFilePublication(FunctionParameters)

    Token = FunctionParameters["Dropbox_Token"];
    File  = FunctionParameters["Dropbox_FileID"];

    Result = OPI_Dropbox.CancelFilePublication(Token, File);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CancelFilePublication", "Dropbox");

    OPI_TestDataRetrieval.Check_Empty(Result);

EndProcedure

#EndRegion

#Region Bitrix24

Procedure Bitrix24_GetAppAuthLink(FunctionParameters)

    Domain   = FunctionParameters["Bitrix24_Domain"];
    ClientID = FunctionParameters["Bitrix24_ClientID"];

    Result = OPI_Bitrix24.GetAppAuthLink(Domain, ClientID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAppAuthLink", "Bitrix24");

    OPI_TestDataRetrieval.Check_String(Result);

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_AuthURL", Result);

EndProcedure

Procedure Bitrix24_GetToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Code         = FunctionParameters["Bitrix24_Code"];

    Result = OPI_Bitrix24.GetToken(ClientID, ClientSecret, Code);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetToken", "Bitrix24");

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);
    EndIf;

EndProcedure

Procedure Bitrix24_RefreshToken(FunctionParameters)

    ClientID     = FunctionParameters["Bitrix24_ClientID"];
    ClientSecret = FunctionParameters["Bitrix24_ClientSecret"];
    Refresh      = FunctionParameters["Bitrix24_Refresh"];

    Result = OPI_Bitrix24.RefreshToken(ClientID, ClientSecret, Refresh);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RefreshToken", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixAuth(Result);

    If ValueIsFilled(Result["access_token"]) And ValueIsFilled(Result["refresh_token"]) Then
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Token"  , Result["access_token"]);
        OPI_TestDataRetrieval.WriteParameter("Bitrix24_Refresh", Result["refresh_token"]);
    EndIf;

EndProcedure

Procedure Bitrix24_ServerTime(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ServerTime(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "ServerTime (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTime(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ServerTime(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ServerTime", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTime(Result);

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

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, True);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    PostID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookPostID", PostID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookPostID", PostID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreatePost(URL, Text, , Files, Title, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePost", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    PostID = Result["result"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_PostID", PostID);
    FunctionParameters.Insert("Bitrix24_PostID", PostID);

EndProcedure

Procedure Bitrix24_UpdatePost(FunctionParameters)

    Text   = "New post text";
    Title  = "New post title";
    Image1 = FunctionParameters["Picture"]; // URL, Path or Binary Data
    PostID = FunctionParameters["Bitrix24_PostID"];

    Files = New Map;
    Files.Insert("1.png", Image1);

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdatePost (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    PostID = FunctionParameters["Bitrix24_HookPostID"];

    Result = OPI_Bitrix24.UpdatePost(URL, PostID, Text, , Files, Title, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdatePost", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

EndProcedure

Procedure Bitrix24_DeletePost(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeletePost(URL, PostID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeletePost", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetImportantPostViewers(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_HookPostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetImportantPostViewers (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetImportantPostViewers(URL, PostID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetImportantPostViewers", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetPosts(FunctionParameters)

    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetPosts (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetPosts(URL, PostID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPosts", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result);

EndProcedure

Procedure Bitrix24_AddPostComment(FunctionParameters)

    Text   = "Comment for post";
    PostID = FunctionParameters["Bitrix24_PostID"];
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostComment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    Text  = "Another comment";
    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostComment(URL, PostID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostComment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

EndProcedure

Procedure Bitrix24_AddPostRecipients(FunctionParameters)

    Visibility = "UA";
    PostID     = FunctionParameters["Bitrix24_PostID"];
    URL        = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility);

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostRecipients (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddPostRecipients(URL, PostID, Visibility, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddPostRecipients", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetTaskFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskFieldsStructure (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixFields(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskFieldsStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskFieldsStructure", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixFields(Result);

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

    Result = OPI_Bitrix24.CreateTask(URL, TaskData);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    TaskID = Result["result"]["task"]["id"]; // SKIP

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookTaskID", TaskID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookTaskID", TaskID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTask(URL, TaskData, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

    TaskID = Result["result"]["task"]["id"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_TaskID", TaskID);
    FunctionParameters.Insert("Bitrix24_TaskID", TaskID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure Bitrix24_UpdateTask(FunctionParameters)

    // The complete structure of the fields can be obtained by the GetTaskFieldsStructure() function()

    TaskData = New Structure;
    TaskData.Insert("TITLE"      , "Another task title");
    TaskData.Insert("DESCRIPTION", "Another task description");
    TaskData.Insert("PRIORITY"   , "1");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UpdateTask(URL, TaskID, TaskData, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_GetTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_ApproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "ApproveTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.ApproveTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ApproveTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DisapproveTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID);

    OPI_TestDataRetrieval.Check_Map(Result); // SKIP

    OPI_TestDataRetrieval.WriteLog(Result, "DisapproveTask (wh)", "Bitrix24");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DisapproveTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.Check_Map(Result);

    OPI_TestDataRetrieval.WriteLog(Result, "DisapproveTask", "Bitrix24");

EndProcedure

Procedure Bitrix24_CompleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CompleteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_RenewTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RenewTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DeferTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeferTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeferTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeferTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_StartTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StartTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "StartTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_StartWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StartWatchingTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StartWatchingTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "StartWatchingTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_StopWatchingTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.StopWatchingTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_PauseTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "PauseTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.PauseTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PauseTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DeleteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DeleteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_DelegateTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "DelegateTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.DelegateTask(URL, TaskID, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DelegateTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_AddTaskToFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "StopWatchingTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTaskToFavorites(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskToFavorites", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_RemoveTaskFromFavorites(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveTaskFromFavorites (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.RemoveTaskFromFavorites(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveTaskFromFavorites", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetTaskHistory(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskHistory (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixList(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTaskHistory(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskHistory", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixList(Result);

EndProcedure

Procedure Bitrix24_GetTasksList(FunctionParameters)

    // Full filter structure you can find at GetTasksFilterStructure method
    Filter = New Structure;
    Filter.Insert("CREATED_BY" , 1);
    Filter.Insert("RESPONSIBLE_ID", 10);

    Indent = 1;
    URL    = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTasksList(URL, Filter);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTasksList(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksList(URL, , Indent, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTasksList(Result);

EndProcedure

Procedure Bitrix24_GetStoragesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Result = OPI_Bitrix24.GetStoragesList(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetStoragesList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixStorage(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStoragesList(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetStoragesList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixStorage(Result);

EndProcedure

Procedure Bitrix24_GetAppStorage(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetAppSotrage(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAppSotrage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    StorageID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_StorageID", StorageID); // SKIP
    FunctionParameters.Insert("Bitrix24_StorageID", StorageID); // SKIP

EndProcedure

Procedure Bitrix24_UploadFileToStorage(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary Data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary Data

    DestinationID = 3;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Filename2, Image2, DestinationID);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToStorage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFileID", FileID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookFileID", FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToStorage(URL, Name, Image, DestinationID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToStorage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FileID", FileID);
    FunctionParameters.Insert("Bitrix24_FileID", FileID);

EndProcedure

Procedure Bitrix24_DeleteFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_HookFileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFile", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_CreateStorageFolder(FunctionParameters)

    StorageID = 3;
    Name      = "New catalog";
    Filename2 = "New folder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStorageFolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookFolderID", FolderID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookFolderID", FolderID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateStorageFolder(URL, StorageID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateStorageFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_FolderID", FolderID); // SKIP
    FunctionParameters.Insert("Bitrix24_FolderID", FolderID); // SKIP

EndProcedure

Procedure Bitrix24_DeleteFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_HookFolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.DeleteFolder(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetStorage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorage(URL, StorageID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorage(URL, StorageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetStorageObjects(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    StorageID = 3;

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorageObjects (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetStorageObjects(URL, StorageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetStorageObjects", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_RenameStorage(FunctionParameters)

    Name      = "New storage name";
    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    StorageID = FunctionParameters["Bitrix24_StorageID"];

    Result = OPI_Bitrix24.RenameStorage(URL, StorageID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenameStorage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFolderInformation(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderInformation (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderInformation(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderInformation", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_CreateSubfolder(FunctionParameters)

    FolderID  = FunctionParameters["Bitrix24_FolderID"];
    Name      = "New subfolder";
    Filename2 = "New subfolder 2";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSubfolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    SubfolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookSubfolderID", SubfolderID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookSubfolderID", SubfolderID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateSubfolder(URL, FolderID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSubfolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    SubfolderID = Result["result"]["ID"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_SubfolderID", SubfolderID); // SKIP
    FunctionParameters.Insert("Bitrix24_SubfolderID", SubfolderID); // SKIP

EndProcedure

Procedure Bitrix24_MakeFolderCopy(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookSubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MakeFolderCopy(URL, FolderID, DestinationID);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeFolderCopy (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    DestinationID = FunctionParameters["Bitrix24_SubfolderID"];
    FolderID      = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MakeFolderCopy(URL, FolderID, DestinationID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeFolderCopy", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFolderExternalLink(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderExternalLink (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixString(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderExternalLink(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderExternalLink", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixString(Result);

EndProcedure

Procedure Bitrix24_GetFolderFilterStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderFilterStructure (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_Structure(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderFilterStructure(URL, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderFilterStructure", "Bitrix24");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetFolderItems(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderItems (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFolderItems(URL, FolderID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFolderItems", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_MarkFolderAsDeleted(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFolderAsDeleted (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFolderAsDeleted(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFolderAsDeleted", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RestoreFolder(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    FolderID = FunctionParameters["Bitrix24_FolderID"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFolder(URL, FolderID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_MoveFolder(FunctionParameters)

    DestinationID = FunctionParameters["Bitrix24_HookfolderID"];
    FolderID      = FunctionParameters["Bitrix24_SubfolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_HookSubfolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFolder(URL, FolderID, DestinationID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RenameFolder(FunctionParameters)

    Name      = "New catalog";
    Filename2 = "New folder 2";

    FolderID2 = FunctionParameters["Bitrix24_HookFolderID"];
    URL       = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID2, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];
    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFolder(URL, FolderID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_UploadFileToFolder(FunctionParameters)

    Filename2 = "Picture2.jpg";
    Name      = "Picture1.jpg";

    Image2 = FunctionParameters["Picture"]; // Local path, URL or Binary Data
    Image  = FunctionParameters["Picture2"]; // Local path, URL or Binary Data

    DestinationID = FunctionParameters["Bitrix24_FolderID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Filename2, Image2, DestinationID);

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToFolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FileID = Result["result"]["ID"]; // SKIP
    OPI_Bitrix24.DeleteFile(URL, FileID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UploadFileToFolder(URL, Name, Image, DestinationID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFileToFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

    FileID = Result["result"]["ID"];
    Result = OPI_Bitrix24.DeleteFile(URL, FileID, Token);

EndProcedure

Procedure Bitrix24_MakeFileCopy(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeFileCopy (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_FolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MakeFileCopy(URL, FileID, FolderID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MakeFileCopy", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFileInformation(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileInformation (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileInformation(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileInformation", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetFileExternalLink(FunctionParameters)

    OPI_Tools.Pause(20); // SKIP

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileExternalLink (wh)", "Bitrix24");

    // OPI_TestDataRetrieval.Check_BitrixString(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetFileExternalLink(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileExternalLink", "Bitrix24");

    // OPI_TestDataRetrieval.Check_BitrixString(Result);

EndProcedure

Procedure Bitrix24_MarkFileAsDeleted(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFileAsDeleted (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MarkFileAsDeleted(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkFileAsDeleted", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RestoreFile(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    FileID = FunctionParameters["Bitrix24_FileID"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFile (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RestoreFile(URL, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RestoreFile", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_RenameFile(FunctionParameters)

    Name      = "New file name.jpg";
    Filename2 = "New file name 2.jpg";

    FileID2 = FunctionParameters["Bitrix24_HookFileID"];
    URL     = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID2, Filename2);

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFile (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FileID = FunctionParameters["Bitrix24_FileID"];
    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenameFile(URL, FileID, Name, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenameFile", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_MoveFileToFolder(FunctionParameters)

    FolderID = FunctionParameters["Bitrix24_HookSubFolderID"];
    FileID   = FunctionParameters["Bitrix24_FileID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFileToFolder (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    FolderID = FunctionParameters["Bitrix24_SubFolderID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveFileToFolder(URL, FileID, FolderID, Token);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveFileToFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_AttachFileToTopic(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];
    FileID = FunctionParameters["Bitrix24_TaskFileID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID);

    OPI_TestDataRetrieval.WriteLog(Result, "AttachFileToTopic (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixAttachment(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AttachFileToTopic(URL, TaskID, FileID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AttachFileToTopic", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixAttachment(Result);

EndProcedure

Procedure Bitrix24_CheckTaskAccesses(FunctionParameters)

    ArrayOfUsers = New Array;
    ArrayOfUsers.Add("1");
    ArrayOfUsers.Add("10");

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers);

    OPI_TestDataRetrieval.WriteLog(Result, "CheckTaskAccesses (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixAvailableActions(Result, ArrayOfUsers.Count()); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.CheckTaskAccesses(URL, TaskID, ArrayOfUsers, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CheckTaskAccesses", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixAvailableActions(Result, ArrayOfUsers.Count());

EndProcedure

Procedure Bitrix24_MuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "MuteTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.MuteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MuteTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_UnmuteTask(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "UnmuteTask (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.UnmuteTask(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnmuteTask", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTask(Result);

EndProcedure

Procedure Bitrix24_AddTaskComment(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Text = "Task impossible, let's split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskComment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    CommentID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCommentID", CommentID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookCommentID", CommentID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text = "Task uninpossible, don't split up";

    Result = OPI_Bitrix24.AddTaskComment(URL, TaskID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskComment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    CommentID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CommentID", CommentID); // SKIP
    FunctionParameters.Insert("Bitrix24_CommentID", CommentID); // SKIP

EndProcedure

Procedure Bitrix24_DeleteTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTaskComment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteTaskComment(URL, TaskID, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTaskComment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_CreateResultFromComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateResultFromComment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixResult(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.CreateResultFromComment(URL, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateResultFromComment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixResult(Result);

EndProcedure

Procedure Bitrix24_DeleteResultFromComment(FunctionParameters) Export

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "Delete result from comment)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.DeleteResultFromComment(URL, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteResultFromComment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_GetResultsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetResultsList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixResultsList(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetResultsList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetResultsList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixResultsList(Result);

EndProcedure

Procedure Bitrix24_GetTaskCommentsList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskCommentsList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixCommentsList(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskCommentsList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskCommentsList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixCommentsList(Result);

EndProcedure

Procedure Bitrix24_GetTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskComment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixComment(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Result = OPI_Bitrix24.GetTaskComment(URL, TaskID, CommentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskComment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixComment(Result);

EndProcedure

Procedure Bitrix24_UpdateTaskComment(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_CommentsTaskID"];
    CommentID = FunctionParameters["Bitrix24_HookCommentID"];

    Text = "The task has been changed, do not split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTaskComment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    CommentID = FunctionParameters["Bitrix24_CommentID"];

    Text = "The task has been changed, let's split up";

    Result = OPI_Bitrix24.UpdateTaskComment(URL, TaskID, CommentID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTaskComment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_CreateTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTasksDependencies (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateTasksDependencies", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

EndProcedure

Procedure Bitrix24_DeleteTasksDependencies(FunctionParameters)

    FromID        = FunctionParameters["Bitrix24_HookTaskID"];
    DestinationID = FunctionParameters["Bitrix24_TaskID"];
    LinkType      = 0;

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType); // SKIP
    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksDependencies (wh)", "Bitrix24"); // SKIP
    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    FromID        = FunctionParameters["Bitrix24_TaskID"];
    DestinationID = FunctionParameters["Bitrix24_HookTaskID"];
    LinkType      = 2;

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateTasksDependencies(URL, FromID, DestinationID, LinkType, Token); // SKIP
    Result = OPI_Bitrix24.DeleteTasksDependencies(URL, FromID, DestinationID, LinkType, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksDependencies", "Bitrix24");
    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_AddKanbanStage(FunctionParameters)

    Name  = "New stage";
    Color = "0026FF";

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, 6);

    OPI_TestDataRetrieval.WriteLog(Result, "AddKanbanStage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    PrevStageID = Result["result"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookStageID", PrevStageID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookStageID", PrevStageID); // SKIP

    Name  = "New stage 2";
    Color = "0026FF";

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.AddKanbanStage(URL, Name, Color, PrevStageID, , True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddKanbanStage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    StageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_StageID", StageID);
    FunctionParameters.Insert("Bitrix24_StageID", StageID);

EndProcedure

Procedure Bitrix24_DeleteKanbanStage(FunctionParameters)

    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, True);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteKanbanStage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteKanbanStage(URL, StageID, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteKanbanStage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetKanbanStages(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , True);

    OPI_TestDataRetrieval.WriteLog(Result, "GetKanbanStages (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMap(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetKanbanStages(URL, , , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetKanbanStages", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure Bitrix24_MoveTaskToKanbanStage(FunctionParameters)

    TaskID  = FunctionParameters["Bitrix24_KanbanTaskID"];
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID);

    OPI_TestDataRetrieval.WriteLog(Result, "MoveTaskToKanbanStage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, StageID, , , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MoveTaskToKanbanStage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

    OPI_Bitrix24.MoveTaskToKanbanStage(URL, TaskID, 2, , , Token);

EndProcedure

Procedure Bitrix24_UpdateKanbansStage(FunctionParameters)

    Name    = "New stage name";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_HookStageID"];

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateKanbansStage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    Name    = "New stage name 2";
    Color   = "000000";
    StageID = FunctionParameters["Bitrix24_StageID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.UpdateKanbansStage(URL, Name, StageID, Color, 6, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateKanbansStage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_AddTasksChecklistElement(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Text = "Checklist element";

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, True);

    OPI_TestDataRetrieval.WriteLog(Result, "AddTasksChecklistElement (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    ElementID = Result["result"]; // SKIP

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookCheckElementID", ElementID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookCheckElementID", ElementID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.AddTasksChecklistElement(URL, TaskID, Text, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTasksChecklistElement", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    ElementID = Result["result"];

    OPI_TestDataRetrieval.WriteParameter("Bitrix24_CheckElementID", ElementID);
    FunctionParameters.Insert("Bitrix24_CheckElementID", ElementID);

EndProcedure

Procedure Bitrix24_UpdateTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Text = "New elements text";

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTasksChecklistElement (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    Result = OPI_Bitrix24.UpdateTasksChecklistElement(URL, TaskID, ElementID, Text, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTasksChecklistElement", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_DeleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksChecklistElement (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.DeleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTasksChecklistElement", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetTasksChecklist(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_HookTaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklist (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    TaskID = FunctionParameters["Bitrix24_TaskID"];

    Result = OPI_Bitrix24.GetTasksChecklist(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklist", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklistElement (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksChecklistElement", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_CompleteTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTasksChecklistElement (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CompleteTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CompleteTasksChecklistElement", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_RenewTasksChecklistElement(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    TaskID    = FunctionParameters["Bitrix24_HookTaskID"];
    ElementID = FunctionParameters["Bitrix24_HookCheckElementID"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID);

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTasksChecklistElement (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    TaskID    = FunctionParameters["Bitrix24_TaskID"];
    ElementID = FunctionParameters["Bitrix24_CheckElementID"];

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.RenewTasksChecklistElement(URL, TaskID, ElementID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RenewTasksChecklistElement", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_AddTaskTimeAccounting(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Time = 3600;

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL, TaskID, Time);

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskTimeAccounting (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    SpendingID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookTimeID", SpendingID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookTimeID", SpendingID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Text      = "Time spent on work";
    UserID    = 10;
    Time      = 7200;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Result = OPI_Bitrix24.AddTaskTimeAccounting(URL
        , TaskID
        , Time
        , UserID
        , Text
        , SetupDate
        , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddTaskTimeAccounting", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    SpendingID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_TimeID", SpendingID);
    FunctionParameters.Insert("Bitrix24_TimeID", SpendingID);

EndProcedure

Procedure Bitrix24_UpdateTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Text = "The text I forgot last time";
    Time = 4800;

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL, TaskID, RecordID, Time, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTaskTimeAccounting (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Text      = "New time record";
    Time      = 4800;
    SetupDate = AddMonth(OPI_Tools.GetCurrentDate(), -1);

    Result = OPI_Bitrix24.UpdateTaskTimeAccounting(URL
        , TaskID
        , RecordID
        , Time
        , Text
        , SetupDate
        , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateTaskTimeAccounting", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_DeleteTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTaskTimeAccounting (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.DeleteTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteTaskTimeAccounting", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixUndefined(Result);

EndProcedure

Procedure Bitrix24_GetTaskTimeAccounting(FunctionParameters)

    URL      = FunctionParameters["Bitrix24_URL"];
    TaskID   = FunctionParameters["Bitrix24_ElapsedTaskID"];
    RecordID = FunctionParameters["Bitrix24_HookTimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccounting (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL      = FunctionParameters["Bitrix24_Domain"];
    Token    = FunctionParameters["Bitrix24_Token"];
    RecordID = FunctionParameters["Bitrix24_TimeID"];

    Result = OPI_Bitrix24.GetTaskTimeAccounting(URL, TaskID, RecordID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccounting", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetTaskTimeAccountingList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    TaskID = FunctionParameters["Bitrix24_ElapsedTaskID"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccountingList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetTaskTimeAccountingList(URL, TaskID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTaskTimeAccountingList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObjectsArray(Result);

EndProcedure

Procedure Bitrix24_GetDailyPlan(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDailyPlan(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDailyPlan (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDailyPlan(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDailyPlan", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

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

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateChat (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    ChatID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookChatID", ChatID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookChatID", ChatID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    ChatStructure = New Structure;
    ChatStructure.Insert("TYPE"  , "CHAT");
    ChatStructure.Insert("TITLE" , "Private chat");
    ChatStructure.Insert("USERS" , MembersArray);

    Result = OPI_Bitrix24.CreateChat(URL, ChatStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateChat", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    ChatID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatID", ChatID); // SKIP
    FunctionParameters.Insert("Bitrix24_ChatID", ChatID); // SKIP

EndProcedure

Procedure Bitrix24_GetChatUsers(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatUsers (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatUsers(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatUsers", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_LeaveChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "LeaveChat (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.LeaveChat(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "LeaveChat", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteUserFromChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteUserFromChat (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DeleteUserFromChat(URL, ChatID, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteUserFromChat", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_AddUsersToChat(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserIDs = New Array;
    UserIDs.Add(10);
    UserIDs.Add(12);

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserIDs);

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToChat (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];
    UserID = 10;

    Result = OPI_Bitrix24.AddUsersToChat(URL, ChatID, UserID, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "AddUsersToChat", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatTitle(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Title = "New chat title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatTitle (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Title = "Another title";

    Result = OPI_Bitrix24.ChangeChatTitle(URL, ChatID, Title, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatTitle", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatColor(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Color = "AZURE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatColor (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    OPI_Tools.Pause(10); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Color = "PURPLE";

    Result = OPI_Bitrix24.ChangeChatColor(URL, ChatID, Color, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatColor", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatPicture(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Image = FunctionParameters["Picture2"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatPicture(URL, ChatID, Image, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DisableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "DisableChatNotifications (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.DisableChatNotifications(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DisableChatNotifications", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_EnableChatNotifications(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "EnableChatNotifications (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.EnableChatNotifications(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EnableChatNotifications", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeChatOwner(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    UserID = 10;

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatOwner (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.ChangeChatOwner(URL, ChatID, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatOwner", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetChatMessagesList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat4";

    Result = OPI_Bitrix24.GetChatMessagesList(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMessagesList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMessages(Result); // SKIP

    MessageID = Result["result"]["messages"][0]["id"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatMessageID", MessageID); // SKIP
    FunctionParameters.Insert("Bitrix24_ChatMessageID", MessageID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMessagesList(URL, UserID, , 0, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMessagesList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMessages(Result);

    MessageID = Result["result"]["messages"][0]["id"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_UserMessageID", MessageID);
    FunctionParameters.Insert("Bitrix24_UserMessageID", MessageID);

EndProcedure

Procedure Bitrix24_MarkMessageAsReaded(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    ChatID    = "chat" + FunctionParameters["Bitrix24_HookChatID"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, ChatID, MessageID);

    OPI_TestDataRetrieval.WriteLog(Result, "MarkMessageAsReaded (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixDialog(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsReaded(URL, UserID, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkMessageAsReaded", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixDialog(Result);

EndProcedure

Procedure Bitrix24_MarkMessageAsUnreaded(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    ChatID    = "chat" + FunctionParameters["Bitrix24_HookChatID"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, ChatID, MessageID);

    OPI_TestDataRetrieval.WriteLog(Result, "MarkMessageAsUnreaded)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    UserID    = 10;
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.MarkMessageAsUnreaded(URL, UserID, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "MarkMessageAsUnreaded", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDialog(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetDialog(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDialog (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMessage(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetDialog(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDialog", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMessage(Result);

EndProcedure

Procedure Bitrix24_GetChatMembersList(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatMembersList(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMembersList)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.GetChatMembersList(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMembersList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_SendWritingNotification(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.SendWritingNotification(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "SendWritingNotification (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendWritingNotification(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendWritingNotification", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ReadAll(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.ReadAll(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "ReadAll (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.ReadAll(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ReadAll", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_SendMessage(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = "chat" + FunctionParameters["Bitrix24_HookChatID"];
    Text   = "Message text";
    Image  = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File   = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Result = OPI_Bitrix24.SendMessage(URL, ChatID, Text, Attachments);

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    MessageID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_ChatMessageID", MessageID); // SKIP
    FunctionParameters.Insert("Bitrix24_ChatMessageID", MessageID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 10;

    Result = OPI_Bitrix24.SendMessage(URL, UserID, Text, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendMessage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_UserMessageID", MessageID);
    FunctionParameters.Insert("Bitrix24_UserMessageID", MessageID);

EndProcedure

Procedure Bitrix24_EditMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Text = "New message text";

    Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Image = "https://raw.githubusercontent.com/Bayselonarrend/OpenIntegrations/main/service/test_data/picture.jpg";
    File  = "https://github.com/Bayselonarrend/OpenIntegrations/raw/main/service/test_data/document.docx";

    Attachments = New Array;
    Attachments.Add(OPI_Bitrix24.GetPictureBlock("Image1"  , Image));
    Attachments.Add(OPI_Bitrix24.GetFileBlock("File1.docx" , File));

    Result = OPI_Bitrix24.EditMessage(URL, MessageID, Text, Attachments, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteMessage(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.DeleteMessage(URL, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_SetMessageReaction(FunctionParameters)

    URL       = FunctionParameters["Bitrix24_URL"];
    MessageID = FunctionParameters["Bitrix24_ChatMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID);

    OPI_TestDataRetrieval.WriteLog(Result, "SetMessageReaction (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL       = FunctionParameters["Bitrix24_Domain"];
    Token     = FunctionParameters["Bitrix24_Token"];
    MessageID = FunctionParameters["Bitrix24_UserMessageID"];

    Result = OPI_Bitrix24.SetMessageReaction(URL, MessageID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetMessageReaction", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetChatFilesFolder(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    ChatID = FunctionParameters["Bitrix24_HookChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatFilesFolder)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Result = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatFilesFolder", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_SendFile(FunctionParameters)

    URL         = FunctionParameters["Bitrix24_URL"];
    ChatID      = FunctionParameters["Bitrix24_HookChatID"];
    File        = FunctionParameters["Document"]; // Binary Data, URL or path to file
    Description = "Very important file";

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID);
    FileID       = UploadedFile["result"]["ID"];

    Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description);

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixFileMessage(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    ChatID = FunctionParameters["Bitrix24_ChatID"];

    Directory = OPI_Bitrix24.GetChatFilesFolder(URL, ChatID, Token);
    FolderID  = Directory["result"]["ID"];

    UploadedFile = OPI_Bitrix24.UploadFileToFolder(URL, "Imortant doc.docx", File, FolderID, Token);
    FileID       = UploadedFile["result"]["ID"];

    Result = OPI_Bitrix24.SendFile(URL, ChatID, FileID, Description, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixFileMessage(Result);

EndProcedure

Procedure Bitrix24_GetUsers(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    ArrayOfUsers = New Array;

    ArrayOfUsers.Add(1);
    ArrayOfUsers.Add(10);

    Result = OPI_Bitrix24.GetUsers(URL, ArrayOfUsers);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUsers (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMap(Result); // SKIP

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    UserIDs = 10;

    Result = OPI_Bitrix24.GetUsers(URL, UserIDs, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUsers", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixMap(Result);

EndProcedure

Procedure Bitrix24_GetUserStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserStatus(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserStatus (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixString(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserStatus(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserStatus", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixString(Result);

EndProcedure

Procedure Bitrix24_SetUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    Status = "dnd";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status);

    OPI_TestDataRetrieval.WriteLog(Result, "SetUserStatus (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Status = "away";

    Result = OPI_Bitrix24.SetUserStatus(URL, Status, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetUserStatus", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

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

    Result = OPI_Bitrix24.CreatePersonalNotification(URL, UserID, Text, ,Attachments);

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePersonalNotification)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    MessageID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_PersoalHookNotifyID", MessageID); // SKIP
    FunctionParameters.Insert("Bitrix24_PersoalHookNotifyID", MessageID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Result = OPI_Bitrix24.CreatePersonalNotification(URL, UserID, Text, Tag, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreatePersonalNotification", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_PersoalNotifyID", MessageID);
    FunctionParameters.Insert("Bitrix24_PersoalNotifyID", MessageID);

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

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, ,Attachments);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSystemNotification (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    MessageID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_SystemHookNotifyID", MessageID); // SKIP
    FunctionParameters.Insert("Bitrix24_SystemHookNotifyID", MessageID); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    Tag    = "New";
    UserID = 10;

    Result = OPI_Bitrix24.CreateSystemNotification(URL, UserID, Text, Tag, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateSystemNotification", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    MessageID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_SystemNotifyID", MessageID);
    FunctionParameters.Insert("Bitrix24_SystemNotifyID", MessageID);

EndProcedure

Procedure Bitrix24_DeleteNotification(FunctionParameters)

    URL            = FunctionParameters["Bitrix24_URL"];
    NotificationID = FunctionParameters["Bitrix24_PersoalHookNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteNotification", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL            = FunctionParameters["Bitrix24_Domain"];
    Token          = FunctionParameters["Bitrix24_Token"];
    NotificationID = FunctionParameters["Bitrix24_PersoalNotifyID"];

    Result = OPI_Bitrix24.DeleteNotification(URL, NotificationID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteNotification (app)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixBool(Result);

EndProcedure

Procedure Bitrix24_AddCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Type = "date";
    Name = "BIRTHDAY_FIELD";

    Result = OPI_Bitrix24.AddCustomTaskField(URL, Type, Name);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Type       = "string";
    Name       = "TEXT_FIELD";
    ExternalID = "BITRIX_TEXT_FIELD";
    Title      = "Text field";
    Signature  = New Structure("en,ru", "Some field", "Nekotoroe pole");


    Result = OPI_Bitrix24.AddCustomTaskField(URL, Type, Name, ExternalID, Title, Signature, Token);

    // END

EndProcedure

Procedure Bitrix24_UpdateCustomTaskField(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];
    Title   = "New title";

    Result = OPI_Bitrix24.UpdateCustomTaskField(URL, FieldID, , Title);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FieldID    = FunctionParameters["Bitrix24_TaskFieldID"];
    ExternalID = "NEW_TEXT_FIELD";
    Signature  = New Structure("en,ru", "Updated field", "Izmenennoe pole");

    Result = OPI_Bitrix24.UpdateCustomTaskField(URL, FieldID, ExternalID, , Signature, Token);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID);


    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Result = OPI_Bitrix24.GetCustomTaskField(URL, FieldID);

    // END

EndProcedure

Procedure Bitrix24_GetCustomTaskFieldsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCustomTaskFieldsList(URL);

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCustomTaskFieldsList(URL);

    // END

EndProcedure

Procedure Bitrix24_DeleteCustomTaskField(FunctionParameters)

    URL     = FunctionParameters["Bitrix24_URL"];
    FieldID = FunctionParameters["Bitrix24_HookTaskFieldID"];

    Result = OPI_Bitrix24.DeleteCustomTaskField(URL, FieldID);

    URL     = FunctionParameters["Bitrix24_Domain"];
    Token   = FunctionParameters["Bitrix24_Token"];
    FieldID = FunctionParameters["Bitrix24_TaskFieldID"];

    Result = OPI_Bitrix24.DeleteCustomTaskField(URL, FieldID, Token);

    // END

EndProcedure

Procedure Bitrix24_CreateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Name     = "Main department";
    ParentID = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDepartment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    DepartmentID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookDepID", DepartmentID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookDepID", DepartmentID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Name     = "Subordinate department";
    ParentID = FunctionParameters["Bitrix24_HookDepID"];
    HeadID   = 1;

    Result = OPI_Bitrix24.CreateDepartment(URL, Name, ParentID, HeadID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDepartment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    DepartmentID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_DepID", DepartmentID);
    FunctionParameters.Insert("Bitrix24_DepID", DepartmentID);

EndProcedure

Procedure Bitrix24_UpdateDepartment(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];
    ParentID     = 7;

    Result = OPI_Bitrix24.UpdateDepartment(URL, DepartmentID, , ParentID);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateDepartment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    DepartmentID = FunctionParameters["Bitrix24_DepID"];
    Name         = "New department";
    ParentID     = 1;
    HeadID       = 10;

    Result = OPI_Bitrix24.UpdateDepartment(URL
        , DepartmentID
        , Name
        , ParentID
        , HeadID
        , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateDepartment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteDepartment(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDepartment (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL          = FunctionParameters["Bitrix24_Domain"];
    Token        = FunctionParameters["Bitrix24_Token"];
    DepartmentID = FunctionParameters["Bitrix24_HookDepID"];

    Result = OPI_Bitrix24.DeleteDepartment(URL, DepartmentID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDepartment", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDepartments(FunctionParameters)

    URL          = FunctionParameters["Bitrix24_URL"];
    DepartmentID = FunctionParameters["Bitrix24_DepID"];

    Result = OPI_Bitrix24.GetDepartments(URL, DepartmentID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDepartments (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    HeadID = 1;

    Result = OPI_Bitrix24.GetDepartments(URL, , , , HeadID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDepartments", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetCurrentUser(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetCurrentUser(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetCurrentUser (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetCurrentUser(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCurrentUser", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_GetUserFieldsStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserFieldsStructure (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetUserFieldsStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserFieldsStructure", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixObject(Result);

EndProcedure

Procedure Bitrix24_CreateUser(FunctionParameters)

    URL   = FunctionParameters["Bitrix24_URL"];
    Email = String(New UUID) + "@exepmple.org";
    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 7);

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateUser (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    UserID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookUserID", UserID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookUserID", UserID); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];
    Email = String(New UUID) + "@exepmple.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"          , Email);
    UserStructure.Insert("NAME"           , "Vitaly");
    UserStructure.Insert("LAST_NAME"      , "Alpaca");
    UserStructure.Insert("PERSONAL_MOBILE", "88003553535");
    UserStructure.Insert("UF_DEPARTMENT"  , 1);

    Result = OPI_Bitrix24.CreateUser(URL, UserStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateUser", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    UserID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_UserID", UserID);
    FunctionParameters.Insert("Bitrix24_UserID", UserID);

EndProcedure

Procedure Bitrix24_UpdateUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];
    Email  = String(New UUID) + "@exepmple.org";

    // The full structure can be obtained with the function GetUserFieldsStructure

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"        , Email);
    UserStructure.Insert("UF_DEPARTMENT", 1);

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateUser (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];
    Email  = String(New UUID) + "@exepmple.org";

    UserStructure = New Structure;
    UserStructure.Insert("EMAIL"         , Email);
    UserStructure.Insert("NAME"          , "Oleg");
    UserStructure.Insert("LAST_NAME"     , "Lama");
    UserStructure.Insert("UF_DEPARTMENT" , 7);

    Result = OPI_Bitrix24.UpdateUser(URL, UserID, UserStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateUser", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_ChangeUserStatus(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeUserStatus (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.ChangeUserStatus(URL, UserID, True, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeUserStatus", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetUser(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    UserID = FunctionParameters["Bitrix24_HookUserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetUser (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = FunctionParameters["Bitrix24_UserID"];

    Result = OPI_Bitrix24.GetUser(URL, UserID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUser", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_FindUsers(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    FilterStructure = New Structure;
    FilterStructure.Insert("NAME"              , "Vitaly");
    FilterStructure.Insert("LAST_NAME"         , "Alpaca");
    FilterStructure.Insert("WORK_POSITION"     , "DevOps engineer");
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Marketing department");
    FilterStructure.Insert("USER_TYPE"         , "employee");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "FindUsers (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    FilterStructure = New Structure;
    FilterStructure.Insert("UF_DEPARTMENT_NAME", "Bitrix");

    Result = OPI_Bitrix24.FindUsers(URL, FilterStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "FindUsers", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_StartTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.StartTimekeeping(URL);

    Hour = 3600;

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate() - Hour;
    Report = "Late";

    Result = OPI_Bitrix24.StartTimekeeping(URL, UserID, Time, Report, Token);

    // END

EndProcedure

Procedure Bitrix24_StopTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.StopTimekeeping(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;
    Time   = OPI_Tools.GetCurrentDate();
    Report = "Time off";

    Result = OPI_Bitrix24.StopTimekeeping(URL, UserID, Time, Report, Token);

EndProcedure

Procedure Bitrix24_PauseTimekeeping(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.PauseTimekeeping(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.PauseTimekeeping(URL, UserID, Token);

    // END

EndProcedure

Procedure Bitrix24_GetTimekeepingStatus(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTimekeepingStatus(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.GetTimekeepingStatus(URL, UserID, Token);

EndProcedure

Procedure Bitrix24_GetTimekeepingSettings(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL);

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    UserID = 1;

    Result = OPI_Bitrix24.GetTimekeepingSettings(URL, UserID, Token);

    // END

EndProcedure

Procedure Bitrix24_GetLeadFilterStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetLeadFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadFilterStructure", "Bitrix24");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetLeadStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadStructure (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixLead(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetLeadStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadStructure", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixLead(Result);

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

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateLead (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    LeadID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookLeadID", LeadID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookLeadID", LeadID); // SKIP

    FieldsStructure.Insert("NAME"      , "Ivan");
    FieldsStructure.Insert("LAST_NAME" , "Ivanov");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateLead(URL, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateLead", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    LeadID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_LeadID", LeadID);
    FunctionParameters.Insert("Bitrix24_LeadID", LeadID);

EndProcedure

Procedure Bitrix24_UpdateLead(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("ADDRESS"        , "Lermontov st., b. 20");
    FieldsStructure.Insert("ADDRESS_COUNTRY", "Belarus");
    FieldsStructure.Insert("TITLE"          , "SuperClient");

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateLead (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    FieldsStructure.Insert("NAME"      , "Evgeniy");
    FieldsStructure.Insert("LAST_NAME" , "Evgeniev");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.UpdateLead(URL, LeadID, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateLead", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_DeleteLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteLead (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.DeleteLead(URL, LeadID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteLead", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetLead(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    LeadID = FunctionParameters["Bitrix24_HookLeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetLead (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixLead(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    LeadID = FunctionParameters["Bitrix24_LeadID"];

    Result = OPI_Bitrix24.GetLead(URL, LeadID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLead", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixLead(Result);

EndProcedure

Procedure Bitrix24_GetLeadsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetLeadsList(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadsList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"    , "MegaClient");
    Filter.Insert("HAS_EMAIL", "Y");

    Result = OPI_Bitrix24.GetLeadsList(URL, Filter, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetLeadsList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetDealsFilterStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetDealsFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealsFilterStructure", "Bitrix24");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetDealStructure(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealStructure(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealStructure (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixDeal(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.GetDealStructure(URL, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealStructure", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixDeal(Result);

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

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDeal (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result); // SKIP

    LeadID = Result["result"]; // SKIP
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_HookDealID", LeadID); // SKIP
    FunctionParameters.Insert("Bitrix24_HookDealID", LeadID); // SKIP

    FieldsStructure.Insert("TITLE"    , "Another deal");
    FieldsStructure.Insert("CLOSEDATE", "2031-01-01");

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Result = OPI_Bitrix24.CreateDeal(URL, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateDeal", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixNumber(Result);

    LeadID = Result["result"];
    OPI_TestDataRetrieval.WriteParameter("Bitrix24_DealID", LeadID);
    FunctionParameters.Insert("Bitrix24_DealID", LeadID);

EndProcedure

Procedure Bitrix24_UpdateDeal(FunctionParameters)

    FieldsStructure = New Structure;
    FieldsStructure.Insert("TITLE"       , "Sale in RUB");
    FieldsStructure.Insert("CURRENCY_ID" , "RUB");
    FieldsStructure.Insert("OPPORTUNITY" , 50000);

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateDeal (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    FieldsStructure.Insert("TITLE"    , "Future deal in RUB");
    FieldsStructure.Insert("BEGINDATE", "2025-01-01");

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.UpdateDeal(URL, DealID, FieldsStructure, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateDeal", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDeal (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixDeal(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.GetDeal(URL, DealID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDeal", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixDeal(Result);

EndProcedure

Procedure Bitrix24_DeleteDeal(FunctionParameters)

    URL    = FunctionParameters["Bitrix24_URL"];
    DealID = FunctionParameters["Bitrix24_HookDealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID);

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDeal (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result); // SKIP

    URL    = FunctionParameters["Bitrix24_Domain"];
    Token  = FunctionParameters["Bitrix24_Token"];
    DealID = FunctionParameters["Bitrix24_DealID"];

    Result = OPI_Bitrix24.DeleteDeal(URL, DealID, Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteDeal", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixTrue(Result);

EndProcedure

Procedure Bitrix24_GetDealsList(FunctionParameters)

    URL = FunctionParameters["Bitrix24_URL"];

    Result = OPI_Bitrix24.GetDealsList(URL);

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealsList (wh)", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result); // SKIP

    URL   = FunctionParameters["Bitrix24_Domain"];
    Token = FunctionParameters["Bitrix24_Token"];

    Filter = New Structure;
    Filter.Insert("TITLE"      , "Sale in RUB");
    Filter.Insert("CURRENCY_ID", "RUB");

    Result = OPI_Bitrix24.GetDealsList(URL, Filter, , Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDealsList", "Bitrix24");

    OPI_TestDataRetrieval.Check_BitrixArray(Result);

EndProcedure

Procedure Bitrix24_GetTasksFilterStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetTasksFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetTasksFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetCommentStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetCommentStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCommentStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetChatStructure(FunctionParameters)

    Result = OPI_Bitrix24.GetChatStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetPictureBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Picture"];

    Result = OPI_Bitrix24.GetPictureBlock(Name, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPictureBlock", "Bitrix24");
    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetFileBlock(FunctionParameters)

    Name = "Image";
    URL  = FunctionParameters["Document"];

    Result = OPI_Bitrix24.GetFileBlock(Name, URL);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileBlock", "Bitrix24");
    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Bitrix24_GetUserFilterStructure(TestParameters)

    Result = OPI_Bitrix24.GetUserFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetUserFilterStructure", "Bitrix24");
    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

#EndRegion

#Region VKTeams

Procedure VKTeams_CheckToken(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    Result = OPI_VKTeams.CheckToken(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CheckToken", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTUser(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_GetEvents(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    LastID = 0;

    For N = 1 To 5 Do // In real work - endless loop

        Result = OPI_VKTeams.GetEvents(Token, LastID, 3);

        OPI_TestDataRetrieval.WriteLog(Result, "GetEvents", "VkTeams");
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

Procedure VKTeams_SendTextMessage(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    Text   = "Message text";

    Result = OPI_VKTeams.SendTextMessage(Token, ChatID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage (simple)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];
    Text    = "<b>Bold text</b>";
    Markup  = "HTML";

    Keyboard         = New Array;
    ButtonsLineArray = New Array;

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button1", "ButtonEvent1", , "attention"));

    ButtonsLineArray.Add(OPI_VKTeams.MakeActionButton("Button2", , "https://openintegrations.dev"));

    Keyboard.Add(ButtonsLineArray);
    Keyboard.Add(ButtonsLineArray);

    Result = OPI_VKTeams.SendTextMessage(Token, ChatID, Text, ReplyID, Keyboard, Markup);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendTextMessage", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result);

    MessageID = Result["msgId"];
    OPI_TestDataRetrieval.WriteParameter("VkTeams_MessageID", MessageID);
    FunctionParameters.Insert("VkTeams_MessageID", MessageID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_ForwardMessage(FunctionParameters)

    Token      = FunctionParameters["VkTeams_Token"];
    ChatID     = FunctionParameters["VkTeams_ChatID"];
    FromChatID = FunctionParameters["VkTeams_ChatID2"];
    MessageID  = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID);

    OPI_TestDataRetrieval.WriteLog(Result, "ForwardMessage (simple)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Text = "Additional text";

    Result = OPI_VKTeams.ForwardMessage(Token, MessageID, FromChatID, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ForwardMessage", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result);

EndProcedure

Procedure VKTeams_SendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    Text   = "File caption";

    File     = FunctionParameters["Document"]; // URL
    FilePath = GetTempFileName("docx"); // Path

    FileCopy(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.SendFile(Token, ChatID, File);

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile (URL)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FilePath, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile (Path)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendFile(Token, ChatID, FileBD, Text, "ImportantDocument.docx");

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendFile", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result);

    DeleteFiles(FilePath);

    FileID = Result["fileId"];
    OPI_TestDataRetrieval.WriteParameter("VkTeams_FileID", FileID);
    FunctionParameters.Insert("VkTeams_FileID", FileID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_ResendFile(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_FileID"];
    Text   = "File caption";

    Result = OPI_VKTeams.ResendFile(Token, ChatID, FileID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ResendFile", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result);

EndProcedure

Procedure VKTeams_GetFileInformation(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    FileID = FunctionParameters["VkTeams_FileID"];

    Result = OPI_VKTeams.GetFileInformation(Token, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFileInformation", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTFile(Result);

EndProcedure

Procedure VKTeams_EditMessageText(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];
    Text      = "New message text";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text);

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessageText (simple)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result); // SKIP

    Text   = "<b>New bold message text</b>";
    Markup = "HTML";

    Result = OPI_VKTeams.EditMessageText(Token, ChatID, MessageID, Text, Markup);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "EditMessageText", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_DeleteMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.DeleteMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteMessage", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_SendVoice(FunctionParameters)

    Token   = FunctionParameters["VkTeams_Token"];
    ChatID  = FunctionParameters["VkTeams_ChatID2"];
    ReplyID = FunctionParameters["VkTeams_MessageID"];

    File     = FunctionParameters["Audio2"] ; // URL
    FilePath = GetTempFileName("m4a"); // Path

    FileCopy(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.SendVoice(Token, ChatID, File);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVoice (URL)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FilePath, ,ReplyID);

    OPI_TestDataRetrieval.WriteLog(Result, "SendVoice (Path)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result); // SKIP

    Result = OPI_VKTeams.SendVoice(Token, ChatID, FileBD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SendVoice", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result);

    DeleteFiles(FilePath);

    FileID = Result["fileId"];
    OPI_TestDataRetrieval.WriteParameter("VkTeams_VoiceID", FileID);
    FunctionParameters.Insert("VkTeams_VoiceID", FileID);

    OPI_Tools.Pause(5);

EndProcedure

Procedure VKTeams_ResendVoice(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];
    FileID = FunctionParameters["VkTeams_VoiceID"];

    Result = OPI_VKTeams.ResendVoice(Token, ChatID, FileID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ResendVoice", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTMessage(Result);

EndProcedure

Procedure VKTeams_RemoveChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.RemoveChatMembers(Token, ChatID, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "RemoveChatMembers", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_ChangeChatPicture(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    File     = FunctionParameters["Picture3"]; // URL
    FilePath = GetTempFileName("png"); // Path

    FileCopy(File, FilePath);

    FileBD = New BinaryData(FilePath); // Binary

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, File);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture (URL)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result); // SKIP

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FilePath);

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture (Path)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result); // SKIP

    Result = OPI_VKTeams.ChangeChatPicture(Token, ChatID, FileBD);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ChangeChatPicture", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

    DeleteFiles(FilePath);

EndProcedure

Procedure VKTeams_GetChatInfo(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatInfo(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatInfo", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTChat(Result);

EndProcedure

Procedure VKTeams_GetChatAdmins(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatAdmins(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatAdmins", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTList(Result, "admins");

EndProcedure

Procedure VKTeams_GetChatMembers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatMembers(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatMembers", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTList(Result, "members");

EndProcedure

Procedure VKTeams_GetChatBlockedUsers(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatBlockedUsers(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatBlockedUsers", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTList(Result, "users");

EndProcedure

Procedure VKTeams_GetChatJoinRequests(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID"];

    Result = OPI_VKTeams.GetChatJoinRequests(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetChatJoinRequests", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTList(Result, "users");

EndProcedure

Procedure VKTeams_BlockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.BlockChatUser(Token, ChatID, User, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "BlockChatUser", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_UnblockChatUser(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.UnblockChatUser(Token, ChatID, User);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnblockChatUser", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_PinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.PinMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "PinMessage", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_UnpinMessage(FunctionParameters)

    Token     = FunctionParameters["VkTeams_Token"];
    ChatID    = FunctionParameters["VkTeams_ChatID2"];
    MessageID = FunctionParameters["VkTeams_MessageID"];

    Result = OPI_VKTeams.UnpinMessage(Token, ChatID, MessageID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnpinMessage", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_ApprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.ApprovePending(Token, ChatID, User);

    OPI_TestDataRetrieval.WriteLog(Result, "ApprovePending (single)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTPending(Result); // SKIP

    Result = OPI_VKTeams.ApprovePending(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ApprovePending", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTPending(Result);

EndProcedure

Procedure VKTeams_DisapprovePending(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    User   = 1011987091;

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID, User);

    OPI_TestDataRetrieval.WriteLog(Result, "DisapprovePending (single)", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTPending(Result); // SKIP

    Result = OPI_VKTeams.DisapprovePending(Token, ChatID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DisapprovePending", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTPending(Result);

EndProcedure

Procedure VKTeams_SetChatTitle(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New title";

    Result = OPI_VKTeams.SetChatTitle(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChatTitle", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_SetChatDescription(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "New description";

    Result = OPI_VKTeams.SetChatDescription(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChatDescription", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

EndProcedure

Procedure VKTeams_SetChatRules(FunctionParameters)

    Token  = FunctionParameters["VkTeams_Token"];
    ChatID = FunctionParameters["VkTeams_ChatID2"];
    Text   = "Text of the new rules";

    Result = OPI_VKTeams.SetChatRules(Token, ChatID, Text);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetChatRules", "VkTeams");

    OPI_TestDataRetrieval.Check_VKTTrue(Result);

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

                    OPI_TestDataRetrieval.WriteLog(Result, "AnswerButtonEvent", "VkTeams");

                    OPI_TestDataRetrieval.Check_VKTTrue(Result); // SKIP

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

    Keyboard.Add(ButtonsLineArray);
    Keyboard.Add(ButtonsLineArray);

    // END

    OPI_TestDataRetrieval.WriteLog(Keyboard, "MakeActionButton", "VkTeams");

EndProcedure

#EndRegion

#Region Ozon

Procedure Ozon_GetCategoriesAndProductTypesTree(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetCategoriesAndProductTypesTree(ClientID, APIKey, "EN");

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoriesAndProductTypesTree (EN)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonCategoryList(Result); // SKIP

    Result = OPI_Ozon.GetCategoriesAndProductTypesTree(ClientID, APIKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoriesAndProductTypesTree", "Ozon");

    OPI_TestDataRetrieval.Check_OzonCategoryList(Result);

EndProcedure

Procedure Ozon_GetCategoryAttributes(FunctionParameters)

    ClientID   = FunctionParameters["Ozon_ClientID"];
    APIKey     = FunctionParameters["Ozon_ApiKey"];
    CategoryID = 17029016;
    TypeID     = 970778135;

    Result = OPI_Ozon.GetCategoryAttributes(ClientID, APIKey, CategoryID, TypeID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCategoryAttributes", "Ozon");

    OPI_TestDataRetrieval.Check_OzonAttributesList(Result);

EndProcedure

Procedure Ozon_GetAttributeValues(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;

    Result = OPI_Ozon.GetAttributeValues(ClientID, APIKey, CategoryID, TypeID, AttributeID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAttributeValues", "Ozon");

    OPI_TestDataRetrieval.Check_OzonListOfAttributesValues(Result);

EndProcedure

Procedure Ozon_SearchAttributeValue(FunctionParameters)

    ClientID    = FunctionParameters["Ozon_ClientID"];
    APIKey      = FunctionParameters["Ozon_ApiKey"];
    CategoryID  = 17054869;
    TypeID      = 97311;
    AttributeID = 85;
    Value       = "Sunshine";

    Result = OPI_Ozon.SearchAttributeValue(ClientID
        , APIKey
        , CategoryID
        , TypeID
        , AttributeID
        , Value);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SearchAttributeValue", "Ozon");

    OPI_TestDataRetrieval.Check_OzonListOfAttributesValues(Result);

EndProcedure

Procedure Ozon_GetProductStructure(FunctionParameters)

    Result = OPI_Ozon.GetProductStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductStructure", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(Result);

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

    // Video

    OPI_Ozon.AddProductVideo(ItemStructure, Video, "viedo1");

    // Attributes individualized for different categories

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");
    CategoryAttribute2 = New Structure("dictionary_value_id,value", 5060050 , "Samsung");
    CategoryAttribute3 = New Structure("dictionary_value_id,value", 61576 , "gray");
    CategoryAttribute4 = New Structure("dictionary_value_id,value", 95911 , "Protective film set for X3 NFC. Dark cotton");

    CategoryAttribute5 = New Structure("value", "Protective film set for X3 NFC. Dark cotton");


    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 85   , 0, CategoryAttribute2);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 10096, 0, CategoryAttribute3);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 8229 , 0, CategoryAttribute4);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 9048 , 0, CategoryAttribute5);

    Result = OPI_Ozon.CreateUpdateProducts(ClientID, APIKey, ItemStructure);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateUpdateProducts", "Ozon");

    OPI_TestDataRetrieval.Check_OzonUploadTask(Result);

    TaskID = Result["result"]["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_TaskID", TaskID);
    FunctionParameters.Insert("Ozon_TaskID", TaskID);

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

    OPI_TestDataRetrieval.WriteLog(ItemStructure, "AddProductVideo", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(ItemStructure);

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

    OPI_TestDataRetrieval.WriteLog(ItemStructure, "AddProductVideoCover", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(ItemStructure);

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

    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(ItemStructure, 9048 , 0, CategoryAttribute2);

    // END

    OPI_TestDataRetrieval.WriteLog(ItemStructure, "CompleteComplexAttribute", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(ItemStructure);

EndProcedure

Procedure Ozon_GetProductCreationStatus(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    TaskID   = FunctionParameters["Ozon_TaskID"];

    Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCreationStatus", "Ozon");

    WHile Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    EndDo;

    OPI_TestDataRetrieval.Check_OzonNewProducts(Result);

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

    Result = OPI_Ozon.CreateProductByOzonID(ClientID, APIKey, ItemStructure);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateProductByOzonID", "Ozon");

    OPI_TestDataRetrieval.Check_OzonUploadTask(Result);

    TaskID = Result["result"]["task_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_SkuTaskID", TaskID);
    FunctionParameters.Insert("Ozon_SkuTaskID", TaskID);

    Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    WHile Result["result"]["items"][0]["status"] = "pending" Do

        OPI_Tools.Pause(30);
        Result = OPI_Ozon.GetProductCreationStatus(ClientID, APIKey, TaskID);

    EndDo;

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductCreationStatus (SKU)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNewProducts(Result);

EndProcedure

Procedure Ozon_GetSimplifiedProductStructure(FunctionParameters)

    Result = OPI_Ozon.GetSimplifiedProductStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSimplifiedProductStructure", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Ozon_GetAttributesUpdateStructure(FunctionParameters)

    Result = OPI_Ozon.GetAttributesUpdateStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAttributesUpdateStructure", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Ozon_UpdateProductsAttributes(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    AttributesStructure = New Structure("offer_id", "143210609");

    CategoryAttribute1 = New Structure("dictionary_value_id,value", 971082156, "Speaker stand");
    CategoryAttribute2 = New Structure("dictionary_value_id,value", 5060050 , "Samsung");
    CategoryAttribute3 = New Structure("dictionary_value_id,value", 61576 , "red");

    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 5076 , 0, CategoryAttribute1);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 85   , 0, CategoryAttribute2);
    OPI_Ozon.CompleteComplexAttribute(AttributesStructure, 10096, 0, CategoryAttribute3);

    Result = OPI_Ozon.UpdateProductsAttributes(ClientID, APIKey, AttributesStructure);

    // END

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

Procedure Ozon_GetProductsFilterStructure(FunctionParameters)

    Result = OPI_Ozon.GetProductsFilterStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsFilterStructure", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Ozon_GetProductList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210609");

    Filter = New Structure;
    Filter.Insert("visibility" , "ALL");
    Filter.Insert("offer_id"   , IDArray);

    Result = OPI_Ozon.GetProductList(ClientID, APIKey, Filter);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductList", "Ozon");

    OPI_TestDataRetrieval.Check_OzonObjectsArray(Result);

    ProductID = Result["result"]["items"][0]["product_id"];
    OPI_TestDataRetrieval.WriteParameter("Ozon_ProductID", ProductID);
    FunctionParameters.Insert("Ozon_ProductID", ProductID);

EndProcedure

Procedure Ozon_GetProductsAttributesData(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210609");

    Filter = New Structure;
    Filter.Insert("visibility", "ALL");
    Filter.Insert("offer_id"  , IDArray);

    Result = OPI_Ozon.GetProductsAttributesData(ClientID, APIKey, Filter);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsAttributesData", "Ozon");

    OPI_TestDataRetrieval.Check_OzonArray(Result);

EndProcedure

Procedure Ozon_GetProductsContentRating(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetProductsContentRating(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsContentRating", "Ozon");

    OPI_TestDataRetrieval.Check_OzonRatingArray(Result);

EndProcedure

Procedure Ozon_GetProductsInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Result = OPI_Ozon.GetProductsInformation(ClientID, APIKey, , , Article);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsInformation", "Ozon");

    OPI_TestDataRetrieval.Check_OzonProducts(Result);

EndProcedure

Procedure Ozon_GetProductDescription(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    Article  = "143210609";

    Result = OPI_Ozon.GetProductDescription(ClientID, APIKey, , Article);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductDescription", "Ozon");

    OPI_TestDataRetrieval.Check_OzonProduct(Result);

EndProcedure

Procedure Ozon_GetProductsRequestsLimits(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetProductsRequestsLimits(ClientID, APIKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsRequestsLimits", "Ozon");

    OPI_TestDataRetrieval.Check_OzonLimits(Result);

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

    Result = OPI_Ozon.UpdateProductImages(ClientID
        , APIKey
        , ProductID
        , ImagesArray
        ,
        , MarketingColor);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductImages", "Ozon");

    OPI_TestDataRetrieval.Check_OzonPictures(Result);

EndProcedure

Procedure Ozon_CheckProductsImagesUpload(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.CheckProductsImagesUpload(ClientID, APIKey, ProductID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CheckProductsImagesUpload", "Ozon");

    OPI_TestDataRetrieval.Check_OzonPictures(Result);

EndProcedure

Procedure Ozon_UpdateProductsArticles(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210609", "143210612");

    Result = OPI_Ozon.UpdateProductsArticles(ClientID, APIKey, ArticlesMap);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsArticles", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

    ArticlesMap = New Map;
    ArticlesMap.Insert("143210612", "143210609");

    Result = OPI_Ozon.UpdateProductsArticles(ClientID, APIKey, ArticlesMap);

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsArticles (reverse)", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

EndProcedure

Procedure Ozon_ArchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.ArchiveProducts(ClientID, APIKey, ProductID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "ArchiveProducts", "Ozon");

    OPI_TestDataRetrieval.Check_OzonTrue(Result);

EndProcedure

Procedure Ozon_UnarchiveProducts(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.UnarchiveProducts(ClientID, APIKey, ProductID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UnarchiveProducts", "Ozon");

    OPI_TestDataRetrieval.Check_OzonTrue(Result);

EndProcedure

Procedure Ozon_DeleteProductsWithoutSKU(FunctionParameters)

    OPI_Tools.Pause(30);

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.ArchiveProducts(ClientID, APIKey, ProductID);

    OPI_TestDataRetrieval.WriteLog(Result, "ArchiveProducts (for deleting)", "Ozon"); // SKIP
    OPI_Tools.Pause(15); // SKIP

    Article = "143210609";

    Result = OPI_Ozon.DeleteProductsWithoutSKU(ClientID, APIKey, Article);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteProductsWithoutSKU", "Ozon");

EndProcedure

Procedure Ozon_UploadProductActivationCodes(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Codes = New Array;
    Codes.Add("11111111");
    Codes.Add("22222222");

    Result = OPI_Ozon.UploadProductActivationCodes(ClientID, APIKey, ProductID, Codes);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadProductActivationCodes", "Ozon");

    //OPI_TestDataRetrieval.Check_OzonUploadTask(Result);

    //TaskID = Result["result"]["task_id"];
    TaskID = 1;
    OPI_TestDataRetrieval.WriteParameter("Ozon_CodesTaskID", TaskID);
    FunctionParameters.Insert("Ozon_CodesTaskID", TaskID);

    OPI_Tools.Pause(120);

EndProcedure

Procedure Ozon_GetCodesUploadStatus(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    TaskID   = FunctionParameters["Ozon_CodesTaskID"];

    Result = OPI_Ozon.GetCodesUploadStatus(ClientID, APIKey, TaskID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCodesUploadStatus", "Ozon");

    If ValueIsFilled(Result["result"]) Then
        WHile Result["result"]["status"] = "pending" Do

            OPI_Tools.Pause(30);
            Result = OPI_Ozon.GetCodesUploadStatus(ClientID, APIKey, TaskID);

        EndDo;
    EndIf;

    //OPI_TestDataRetrieval.Check_OzonCodesUpload(Result);

EndProcedure

Procedure Ozon_GetProductSubscribersCount(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetProductSubscribersCount(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductSubscribersCount", "Ozon");

    OPI_TestDataRetrieval.Check_OzonSubscribers(Result);

EndProcedure

Procedure Ozon_GetRelatedSKUs(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetRelatedSKUs(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetRelatedSKUs", "Ozon");

    OPI_TestDataRetrieval.Check_OzonSKU(Result);

EndProcedure

Procedure Ozon_BindBarcodes(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    BarcodesMap = New Map;
    BarcodesMap.Insert(1626044001, "112233");

    Result = OPI_Ozon.BindBarcodes(ClientID, APIKey, BarcodesMap);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "BindBarcodes", "Ozon");

EndProcedure

Procedure Ozon_CreateBarcodes(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = FunctionParameters["Ozon_ProductID"];

    Result = OPI_Ozon.CreateBarcodes(ClientID, APIKey, ProductID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateBarcodes", "Ozon");

    OPI_TestDataRetrieval.Check_OzonNoErrors(Result);

EndProcedure

Procedure Ozon_GetWarehousesList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetWarehousesList(ClientID, APIKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetWarehousesList", "Ozon");

    OPI_TestDataRetrieval.Check_OzonArray(Result);

EndProcedure

Procedure Ozon_GetProductsStocks(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    IDArray = New Array;
    IDArray.Add("143210608");

    Filter = New Structure;
    Filter.Insert("visibility" , "ALL");
    Filter.Insert("offer_id"   , IDArray);

    Result = OPI_Ozon.GetProductsStocks(ClientID, APIKey, Filter);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsStocks", "Ozon");

    OPI_TestDataRetrieval.Check_OzonObjectsArray(Result);

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

    Result = OPI_Ozon.UpdateProductsPrices(ClientID, APIKey, Prices);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsPrices", "Ozon");

    OPI_TestDataRetrieval.Check_OzonUpdatedArray(Result);

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

    Result = OPI_Ozon.UpdateProductsStocks(ClientID, APIKey, Stocks);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateProductsStocks", "Ozon");

EndProcedure

Procedure Ozon_GetProductsPrices(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetProductsPrices(ClientID, APIKey, New Structure);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductsPrices", "Ozon");

    OPI_TestDataRetrieval.Check_OzonObjectsArray(Result);

EndProcedure

Procedure Ozon_GetDiscountInformation(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    SKU      = 1626044001;

    Result = OPI_Ozon.GetDiscountInformation(ClientID, APIKey, SKU);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetDiscountInformation", "Ozon");

    OPI_TestDataRetrieval.Check_OzonArray(Result, "items");

EndProcedure

Procedure Ozon_SetProductDiscount(FunctionParameters)

    ClientID  = FunctionParameters["Ozon_ClientID"];
    APIKey    = FunctionParameters["Ozon_ApiKey"];
    ProductID = 1156646653;

    Discount = 10;

    Result = OPI_Ozon.SetProductDiscount(ClientID, APIKey, ProductID, Discount);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SetProductDiscount", "Ozon");

EndProcedure

Procedure Ozon_GetPromotionsList(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];

    Result = OPI_Ozon.GetPromotionsList(ClientID, APIKey);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetPromotionsList", "Ozon");

    OPI_TestDataRetrieval.Check_OzonArray(Result);

EndProcedure

Procedure Ozon_GetAvailablePromoProducts(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    PromoID  = 111111111;

    Result = OPI_Ozon.GetAvailablePromoProducts(ClientID, APIKey, PromoID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetAvailablePromoProducts", "Ozon");

EndProcedure

Procedure Ozon_GetCurrentPromoProducts(FunctionParameters)

    ClientID = FunctionParameters["Ozon_ClientID"];
    APIKey   = FunctionParameters["Ozon_ApiKey"];
    PromoID  = 111111111;

    Result = OPI_Ozon.GetCurrentPromoProducts(ClientID, APIKey, PromoID);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetCurrentPromoProducts", "Ozon");

EndProcedure

Procedure Ozon_GetProductStocksStructure(FunctionParameters)

    Result = OPI_Ozon.GetProductStocksStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductStocksStructure", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

Procedure Ozon_GetProductPriceStructure(FunctionParameters)

    Result = OPI_Ozon.GetProductPriceStructure();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetProductPriceStructure", "Ozon");

    OPI_TestDataRetrieval.Check_Structure(Result);

EndProcedure

#EndRegion

#Region Neocities

Procedure Neocities_UploadFile(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Data  = FunctionParameters["Picture"]; // URL, Path or Binary Data
    Path  = "testfolder/test_pic.png";

    Result = OPI_Neocities.UploadFile(Token, Path, Data);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFile", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

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

    Result = OPI_Neocities.UploadFiles(Token, FileMapping);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UploadFiles", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure Neocities_DeleteSelectedFiles(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    Paths = New Array;
    Paths.Add("/test/pic1.png");
    Paths.Add("/test/gif.gif");
    Paths.Add("/pic2.png");

    Result = OPI_Neocities.DeleteSelectedFiles(Token, Paths);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSelectedFiles", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/testfolder");

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSelectedFiles (folder 1)");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

    Result = OPI_Neocities.DeleteSelectedFiles(Token, "/test");

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteSelectedFiles (folder 2)");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure Neocities_GetFilesList(FunctionParameters)

    Token = FunctionParameters["NC_Token"];
    Path  = "test";

    Result = OPI_Neocities.GetFilesList(Token, Path);

    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList", "Neocities"); // SKIP

    OPI_TestDataRetrieval.Check_NCFolderFiles(Result, 2); // SKIP

    Result = OPI_Neocities.GetFilesList(Token);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetFilesList (All)");

    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure Neocities_GetSiteData(FunctionParameters)

    Token   = FunctionParameters["NC_Token"];
    Website = "2athenaeum";

    Result = OPI_Neocities.GetSiteData(Token);

    OPI_TestDataRetrieval.WriteLog(Result, "GetSiteData", "Neocities"); // SKIP
    OPI_TestDataRetrieval.Check_NCSuccess(Result); // SKIP

    Result = OPI_Neocities.GetSiteData(Token, Website);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetSiteData (Site)");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure Neocities_GetToken(FunctionParameters)

    Login    = FunctionParameters["NC_Login"];
    Password = FunctionParameters["NC_Password"];

    Result = OPI_Neocities.GetToken(Login, Password);

    // END

    Result["api_key"] = "***";

    OPI_TestDataRetrieval.WriteLog(Result, "GetToken", "Neocities");
    OPI_TestDataRetrieval.Check_NCSuccess(Result);

EndProcedure

Procedure Neocities_SynchronizeFolders(FunctionParameters)

    Token = FunctionParameters["NC_Token"];

    LocalFolder  = "C:\test_site";
    RemoteFolder = "test_sync";

    Result = OPI_Neocities.SynchronizeFolders(Token, LocalFolder, RemoteFolder);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "SynchronizeFolders", "Neocities");
    OPI_TestDataRetrieval.Check_NCSync(Result);

EndProcedure

#EndRegion

#Region CDEK

Procedure CDEK_GetToken(FunctionParameters)

    Account  = FunctionParameters["CDEK_Account"];
    Password = FunctionParameters["CDEK_Password"];

    Result = OPI_CDEK.GetToken(Account, Password, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetToken", "CDEK");
    OPI_TestDataRetrieval.Check_CdekToken(Result);

    Token = Result["access_token"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_Token", Token);
    OPI_Tools.AddField("CDEK_Token", Token, "String", FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderDescription(FunctionParameters)

    Result = OPI_CDEK.GetOrderDescription();

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetOrderDescription", "CDEK");
    OPI_TestDataRetrieval.Check_Structure(Result);

    Result = OPI_CDEK.GetOrderDescription(True);

    OPI_TestDataRetrieval.WriteLog(Result, "GetOrderDescription (Empty)", "CDEK");
    OPI_TestDataRetrieval.Check_Structure(Result);

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

    OrderDescription.Insert("number"     , "ddOererre7450813980068");
    OrderDescription.Insert("comment"    , "New order");
    OrderDescription.Insert("tariff_code", 139);

    OrderDescription.Insert("delivery_recipient_cost"    , New Structure("value"        , 50));
    OrderDescription.Insert("delivery_recipient_cost_adv", New Structure("sum,threshold", 3000, 200));

    Result = OPI_CDEK.CreateOrder(Token, OrderDescription, True, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

    UUID = Result["entity"]["uuid"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_OrderUUID", UUID);
    OPI_Tools.AddField("CDEK_OrderUUID", UUID, "String", FunctionParameters);

EndProcedure

Procedure CDEK_GetOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.GetOrder(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrderNumber(Result);

    IMNumber = Result["entity"]["number"];
    OPI_TestDataRetrieval.WriteParameter("CDEK_OrderIMN", IMNumber);
    OPI_Tools.AddField("CDEK_OrderIMN", IMNumber, "String", FunctionParameters);

EndProcedure

Procedure CDEK_GetOrderByNumber(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];

    OrderNumber = FunctionParameters["CDEK_OrderIMN"];
    Result      = OPI_CDEK.GetOrderByNumber(Token, OrderNumber, True, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "GetOrderByNumber", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrderNumber(Result);

EndProcedure

Procedure CDEK_UpdateOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    OrderDescription = New Structure("comment", "NewComment");

    Result = OPI_CDEK.UpdateOrder(Token, UUID, OrderDescription, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "UpdateOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CDEK_DeleteOrder(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.DeleteOrder(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "DeleteOrder", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CDEK_CreateCustomerRefund(FunctionParameters)

    Token  = FunctionParameters["CDEK_Token"];
    UUID   = FunctionParameters["CDEK_OrderUUID"];
    Tariff = 139;

    Result = OPI_CDEK.CreateCustomerRefund(Token, UUID, Tariff, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateCustomerRefund", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

Procedure CDEK_CreateRefusal(FunctionParameters)

    Token = FunctionParameters["CDEK_Token"];
    UUID  = FunctionParameters["CDEK_OrderUUID"];

    Result = OPI_CDEK.CreateRefusal(Token, UUID, True);

    // END

    OPI_TestDataRetrieval.WriteLog(Result, "CreateRefusal", "CDEK");
    OPI_TestDataRetrieval.Check_CdekOrder(Result);

EndProcedure

#EndRegion

#EndRegion

#EndRegion
